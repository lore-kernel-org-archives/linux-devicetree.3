Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4028A3E51D4;
	Fri, 12 Jun 2026 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281863; cv=none; b=oegM3KP2VdEteJmBPN1zMkxcEGynZT/xLIsKUvYq9mW7+sdgVCejUNhPvfFuvw7rPQTg9gmhaTgUb5gZb0NYjxsAaAJhOHBXoLGmQUZlp1UwioVF8AZWKMkx4nvKMycHg0at8FJCVjg68apjZ+VYjmrzxc5IoBi6uRaGCke+gYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281863; c=relaxed/simple;
	bh=jV0vVTCa5nlK8LqMH5R2HuesBRO91PIqYj7bZX0HN5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQ+eXuH5lcATfdWTg8AGToiupqOwRWwD4kND/vhqLMjSgPfhGf1ar7MOZHlhoBQwXwMYB1ivHVN8u1j1Wz5vpJk2XR9JCGtse4HV3sVWeJ3QJ0DPVGjrGU7Xu9QAm8QWgWOMyVjthSNs2j37mPEQ5UiaTdrAlmS8jV1RpVB7v28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ok9UBUAk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ok9UBUAk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FBD71F000E9;
	Fri, 12 Jun 2026 16:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781281860;
	bh=K8GskhQ/tvLBpCO/qOaEalED8OJB7l2RGKXoWhNyljw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ok9UBUAkTb5z4y6JJ4ufptlYuIasM4NiKJSPinBtW7Yx9kvSDI/ceui6RKEDve6kc
	 MF9P652NgwbizOshbZ2TclRbiDoHfPAOZjh/4tgTidEdW0OXjfEGj95JOdvU1wJN5n
	 NK+C3VZSFPab7Ytc7eCtBayYrm3XMZtedjjOxqya1YgYrZeBcRCWsCtQSGpRDEx0Ga
	 ZVthp80HmfrPqkJIE2fj0MWK4DCWBGOpJUuQggi4JH7ipQztt4REPNJuSST0pdBhqk
	 F2HRFKgPGNRAc6yrwc55inLLecPbjWmPNY2sjcNWFdaomFRPQqPqUxfjrdpSAw1T00
	 6g/AsGRSRHhXQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B8A121AC5AC2; Fri, 12 Jun 2026 17:30:57 +0100 (BST)
Date: Fri, 12 Jun 2026 17:30:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 4/4] regulator: Add support for UGREEN NASync DH2300 MCU
 SATA power gate
Message-ID: <aiw0QYnaYHQpIwiq@sirena.co.uk>
References: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
 <20260612-dh2300-mcu-v1-4-ab8db1617bc0@flipper.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tE/94xOCtV2c14jP"
Content-Disposition: inline
In-Reply-To: <20260612-dh2300-mcu-v1-4-ab8db1617bc0@flipper.net>
X-Cookie: Nice guys get sick.


--tE/94xOCtV2c14jP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2026 at 07:34:17PM +0400, Alexey Charkov wrote:

> +static int ugreen_dh2300_mcu_regulator_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regulator_config config = { };
> +	struct regulator_dev *rdev;
> +	struct device_node *np;
> +
> +	np = of_get_child_by_name(dev->parent->of_node, "regulator");
> +	if (!np)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "missing regulator child node\n");

You should just be able to configured this in the regulator_desc rather
than describe it.

> +	config.init_data = of_get_regulator_init_data(dev, np,
> +						      &ugreen_dh2300_sata_desc);
> +

Similarly here, there should be no need for this open coding.

--tE/94xOCtV2c14jP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmosNEAACgkQJNaLcl1U
h9CG6gf9HwhOxx3ksCksFflAdrKweMiutBoX2cLErbvcRtSA1Zuu+it3ilU8JPCu
LSdBkPkVH2KOlJaA6ioe5X/MOnnbHej4/QPEFEy2iL6vrcuFzuP4VoSGw3q6tOFK
3jS/J5gWMXJHYlHpDuc4JdrFAg25gAeYfA0wJyxUxPa61u220L4xzuJS2nSnyF8y
49HCO70Z6ks5Zn68hF5NL0bx6U4aDrdLROCKv0cHArzrXXuEQvgDC+B7wV+m9/Ea
1PjtxyuMyb0+D2DByndFI0Iq9lpcVok/4jwNaToUCCLP1LpZN2VvsM+7DI5Nn8MQ
aYqOVqnhUL6sUdE/Jf5G2Vozx6IJ1g==
=j+Gg
-----END PGP SIGNATURE-----

--tE/94xOCtV2c14jP--
