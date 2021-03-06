<?php

namespace Xnova\Exceptions;

use Phalcon\Di;

class RedirectException extends MainException
{
	protected $url = '';
	protected $timeout = 5;

	public function __construct ($message = '', $title = '', $url = '', $timeout = 5)
	{
		if ($url == '')
			$url = Di::getDefault()->getShared('router')->getRewriteUri();

		if (!$url)
			throw new $this(get_class($this).': Unknown $url parameter');

		$this->url = $url;

		if ($timeout > 0)
			$this->timeout = (int) $timeout;

		parent::__construct($message, $title, [
			'type' => MainException::REDIRECT,
			'url' => $url,
			'timeout' => $timeout
		]);
	}
}