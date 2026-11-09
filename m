Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794252610;
	b=HCx9CjTUDWXvEvRnSpn0v9sPnR/XhasQwY9Havv2fI4wkfbbPYOHJGhF6IotxVsQtP1U
	 W4EAvMJSs4igD9VEgETkbgSguPzFBem4JIotg9WPHo/v8oklizjJBBHXm6UwNJml/5fsh
	 muxPK32PhqlfM7b0lCzjPmHLFXgLrasI3T3OaTpdoMlF2IP5bVahnQzUxbZLntx9UA0QN
	 eepcHBSfHBCdxW48WM/sPjUCpAuRI4gtjCwlP5dZTw5Mp2BqifMqOnQtlH48Hqf4eboKU
	 pvM6EP58bNcYN4aHzsQNCrmWv9U5SsoH4Pn/cFB+QApueV9fjT5yg1Q5df2Y8OSSDnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252610;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=L6VfwYpY8IxdSh1G+DlU88baaChUFV7ZxIByH+ynFzQ=;
	b=YBU2GV/LUuzCGVk7PPIiMcUxE7t1QMDjlTHConh+21RSGqSQtYvYY/3UpWcCu7JL8R8Z
	 wY6Z5h1GXUxHMpjpEHFS9PqoZE8sRvTwknyKhDvEsC2oya4iMf9vZIvATwTdu2VXvgjae
	 TQd1i48OLXzGhnz8NIw9KGibv4/vBhASQ/89DMlu/CjBiRTZI+mvgBI3aBMgmsA7o6Vrq
	 AbkzpAxyQ2TBRI0nq9DTtOJO4lqDBmsrrFr55qaVPTfqjN1vhErohQGryN39C3P4t3/H7
	 44dDu0EncV6LAZUt8euk73jcjyyafnqegl2vMfQaXbyNf0pqsJGvTbqLmmDSL97RLZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OiMOuThd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3672A606A330
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 19:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OiMOuThd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7EE1F008A2;
	Mon,  9 Nov 2026 19:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794252609;
	bh=L6VfwYpY8IxdSh1G+DlU88baaChUFV7ZxIByH+ynFzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OiMOuThdsthnJ9VU+xpKTAMeJ9EWOEszQjTp1Upl7BWC2k488CbLmt89PxrYQiQrL
	 3x3qgIuzS9/S3TancSeDeJmc7tk2kZPjA5Sq9Vr4v7Oj3Yhq7Fj3jl1ib04f9mh1N0
	 sRFI/rYtTkN5liUT5nhce4JF7drT0njI5NnPCOlv5wXWlClPqavH1Zibn9q0Irlquv
	 A50d8zvZoubOXOV/1E/CiiEw2OKBUs6nNHIDvHyx4GoRFEXwP/Y8QlXRtqNRAYe+BA
	 GED0b8p/aTrp8lcYoxy5r8sZK6Xzbnqoxjl+zD1qw3GVfmbAuN4QT/VutT0FvPICNh
	 zNcmRBdCloTeA==
Date: Mon, 9 Nov 2026 19:30:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: aplic: Add Tenstorrent Atlantis
 compatible
Message-ID: <20261109-implosive-saxophone-2f278afdd759@spud>
References: <20261109051050.105623-1-joel@jms.id.au>
 <20261109051050.105623-2-joel@jms.id.au>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jYkxKq0oK3oBwCOD"
Content-Disposition: inline
In-Reply-To: <20261109051050.105623-2-joel@jms.id.au>

--jYkxKq0oK3oBwCOD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--jYkxKq0oK3oBwCOD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavIfPAAKCRB4tDGHoIJi
0rcCAP4ouz5K4oFu9QOK+AKf3XtURfpWVq2lqDQg90quvAqzOwD/b12aM/hP9T5t
WjUp258JZ/CXrFdjz8LxMLrBgug1KgA=
=McSo
-----END PGP SIGNATURE-----

--jYkxKq0oK3oBwCOD--
