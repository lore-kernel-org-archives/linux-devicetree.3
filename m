Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1203446BC;
	Mon, 22 Jun 2026 18:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782152609; cv=none; b=gQZ57gseaI9j10+ODvgVl+8DwIUrYjtb4e1wl85YwI7ss6kNJMzxl6ZFRJXMb5EG3aKSL7q5j7bemHplLXZlanYuUQe+VpD1K3o5sID+tOWu8CofHwtON5YXMUTvnjwmD79SbFOdidgVlbimHDBMt1VCi0yXvmPNfeaGZ3oWW2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782152609; c=relaxed/simple;
	bh=HXjLl3SyAjmOquq7gkP8THO+OlSSgy4RPI9nidXZCoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XwnnasLpdai7k5ojlyY3vu9h54OaYt2ryjUCgTDfv2fP/GjbFX7nZr8gDg+PT5swFLg/21nBNQKpeZ52MGRYDl0kMJhSle+0JbX6TBRN/oZHLFA7QGCdceFqvg7ETkhqq+3YlSO3aCtu76ZZZllLU3+YU12SxB5QE4JfsiPyw9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GFPwo0sa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GFPwo0sa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16FF91F000E9;
	Mon, 22 Jun 2026 18:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782152608;
	bh=HXjLl3SyAjmOquq7gkP8THO+OlSSgy4RPI9nidXZCoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GFPwo0sa1OgJz6h5c2cLLdm9ZUEgewcHgd9ob4wXvDvjylyUttY694ftzZS08Cl+j
	 uPbcXPRyu7itmk4R3pNQWCM/VFSYvLN7ws7nnt+K1N1uEGOmlYZuqtEY8p2FlAEUBV
	 5u8wqIzN34CXqc0dZwiEHmrVYn4XoHf2oY8vOSLdyWfC7hwaZD+hA151TJCdRuekGG
	 H65gOwIJNGmObSzYPzQcV/5XQSMWj2iMUeQ4Tu9Qg9ahfKGYDBSqbslXN3cWDYkIxF
	 3ZKa1fttBNu4q+RMqDhDrvLNOuHcRbxOjeabLOD8GlFe3TA8O8QH4WDZLMiYo+7SGB
	 GrUlHuLtJl9aw==
Date: Mon, 22 Jun 2026 19:23:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/3] regulator: dt-bindings: Add Unisoc SC2730 PMIC
Message-ID: <dafb606f-11b3-45f7-9a46-1a52d38f2f98@sirena.org.uk>
References: <20260620-sc2730-regulators-v6-0-bbd2db395231@abscue.de>
 <20260620-sc2730-regulators-v6-1-bbd2db395231@abscue.de>
 <20260622-mindful-civet-of-refinement-02d3da@quoll>
 <ajl8YparXoIXL0wm@abscue.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cZLCraaS5Y6fE7mh"
Content-Disposition: inline
In-Reply-To: <ajl8YparXoIXL0wm@abscue.de>
X-Cookie: Now I am depressed ...


--cZLCraaS5Y6fE7mh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 08:18:10PM +0200, Otto Pfl=FCger wrote:

> Also, is it generally a rule now that the comatible is left out for MFD
> child nodes, or is there a reason why this is only done for regulators?
> Is this related to the (non-)existence of a reg property in the child?

It happens more for regulators because I tend to bring up that people
are encoding Linux internals rather than describing the hardware.

--cZLCraaS5Y6fE7mh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo5fZoACgkQJNaLcl1U
h9BqXAf9F0XukifywZeshL/1ge5rtBTNf1YORxO3/1mA23b2qfCowVKjNzEcGDQu
S5cGWWsw9df212akySYAra8HSbfvY1qDsGVRKLIpLBULNTt2L9aj/JadZcBy5QqR
rkx+scTW/d/OWtrDzxpbycyGBOx5skRakCLpoQaH+Kuw/RG4nBJZdUG/zYOlYBWZ
uDP/Jc1mctN7GV2QccYhySgl14Xs040JKL2WuWaNzVEKfTfZ13snZKAKdveiDNPK
vXGbcwUNQsLlD6BlJGgSq00Oq+O+TleeA+ZIlW/PnR0qku7jMLCe5nfK7KUvK8N3
NU8p39WGHpLvlybKCt1FSt5zvEsswg==
=tHoN
-----END PGP SIGNATURE-----

--cZLCraaS5Y6fE7mh--
