Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855B534751F;
	Sun,  5 Jul 2026 14:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783262225; cv=none; b=e/5LtRTTsFLdfrnoUOYbI4yKQPI48e1qzdpFX4XXVTvaEyq4hkopzYrelxtCxSNTYy30ejE7+kLTcHkiop22h9M+1R78eKianrtWWyl9fT9W48frxr593dqFqRPnTcYWyJeSJjNBal+7xAUkcYqXnMKqzpqSOxXHWC6jxvhJd3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783262225; c=relaxed/simple;
	bh=/n0iZgwvMMvJYTgHg3uWx8SFFqUQFjH+kTb7bwf1+qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPfd1qeDXAoFpfF9alCCQx/mEYrvNqdTdS2Yy7q5REbFED8jEgpvhGAz6I8Mox/oDEiyzwvGLMGCwWe5lNvW+2TOPDyIabQ9nOP+RwMIZZaBipMAvGs1lPePD2oDZN2H5j5OKtrxQoNclLkYhWv93Q39jrdNJQWFpn1nF+ekXn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiPzLdKZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiPzLdKZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540751F000E9;
	Sun,  5 Jul 2026 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783262224;
	bh=/n0iZgwvMMvJYTgHg3uWx8SFFqUQFjH+kTb7bwf1+qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BiPzLdKZdJXaFjMd/36b3CWSju9jrDzw2wqDyd7EQTIcrUQ1RERX6qqXuQawag3rQ
	 ad0g73LJ4qDEr+6J93JZOFMwt0Zv2P3YXtg2A5y6xmraOt47k1DId76W/jSIYVXttV
	 9lPUWu2MquyCygal4omyKZuT3LJy1IwJIt9xVGn2lzSS8AOBTKyaJt9pCO2+nPvRhF
	 2brMWYxCKwsdRCHCXnnQMQou+9eBcrcvw9f6uqs234CAmyudfWUMCcQD9F+GoeJkjz
	 WQ3wB/n6JT8J7cj8gy1o8Z82/I8j8H/jzQk4j64Hyt1l4mLJwaL8UqYRrrNrqgFQZC
	 AUMca7FskURAA==
Date: Sun, 5 Jul 2026 15:37:00 +0100
From: Conor Dooley <conor@kernel.org>
To: LemonFan-maker <2254650260@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4
 board
Message-ID: <20260705-palatable-hardening-48f73a84244c@spud>
References: <20260705135014.1004166-1-2254650260@qq.com>
 <tencent_B1442A024A02EFD704ECC0F098F663588209@qq.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/ti5bnEJPwTc9Dbk"
Content-Disposition: inline
In-Reply-To: <tencent_B1442A024A02EFD704ECC0F098F663588209@qq.com>

--/ti5bnEJPwTc9Dbk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--/ti5bnEJPwTc9Dbk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakpsDAAKCRB4tDGHoIJi
0iGqAQCvtfivGWBaOn7wqk13VTJq5xxA6BvfZpSk2fXTfVhU9AEA5DnRo276nhA4
0gqQQTjPt/J3WwLd0nQ8fm3so2a0hQI=
=51pf
-----END PGP SIGNATURE-----

--/ti5bnEJPwTc9Dbk--
