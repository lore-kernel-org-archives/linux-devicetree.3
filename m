Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409E1305686;
	Wed, 20 May 2026 15:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292119; cv=none; b=ueaFW3vPM89LfMslidoWiRFK5RMwumJPZxmeG2GjQ9Str+CqD+wac1kFbkQUVWRWx7oycdArZAL5C/b9qG/1NH9vI5Nhk8GX67nxBsf/pWeLey9ERu+MF5ZIzqKKh3Whq0TxnXrx6H+SegobG47sxnTlLb2X+qkC1cWawjMTYRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292119; c=relaxed/simple;
	bh=q5iLEkyr6gKjoQ2BfLoHbYWrZ2V0cT4H7XMhmlMJU/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gc8fuVQyK4c0cKLudk5u9tF+1rcqS9rQ+WgMxXGQ7PfKd6bt0UNihQRF38jAGgUX7FjvsuFhwgAUV8J3vi6vAyfAhxwI8dHOLGVeNI/uzUZQCjnUCFHnKAUfv/n7HF7i0ivWdkFevmXYw+pmHzCmIgfARQPz2R5ghVgDJ7Ex1MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELKIBl2v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELKIBl2v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D661F000E9;
	Wed, 20 May 2026 15:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779292117;
	bh=nlwJwYF7az4RAtKKKBvp5m+7EtzDniGgGIAKI3MlR48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ELKIBl2vaz+2brBFPMOQ6o9lOTR5t6T/nzuxzjsKHqblQDRy9f+q0gU06ROh6GmT5
	 bBGUElG1nGQwTXwTEIEyFgL4fqhryrSJkrvP47+THml6mxQVDjQgCQo5a1IhxzQjad
	 5gwfeQyCvcqJgn8irdUQc2Q7csRBc0paCj4f2CEqFSvCLBs6g5o4HwHduBKjX2dbWV
	 yTRTKEyuh5caXW8cE2DsIvCItAVhMI0KUKYdOmLPZAI3gxBT//Jj58fcHTLHv5+4Ih
	 ozJR4bCMYLKlzy6PDg22+F0YtmXn8Wbfl25s3uJzXIm/1S3GANm17wZSG6DjYXzHdy
	 tc8e7zv7GK2+A==
Date: Wed, 20 May 2026 16:48:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Zhongfa Wang <zhongfa.wang@unisoc.com>
Subject: Re: [PATCH v3 3/3] regulator: Add regulator driver for Unisoc SC2730
 PMIC
Message-ID: <7daddfb0-4bec-42c5-a381-d3e938a2e146@sirena.org.uk>
References: <20260519-sc2730-regulators-v3-0-5bf0e02507e3@abscue.de>
 <20260519-sc2730-regulators-v3-3-5bf0e02507e3@abscue.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p+ntJXcBgVP6K1OX"
Content-Disposition: inline
In-Reply-To: <20260519-sc2730-regulators-v3-3-5bf0e02507e3@abscue.de>
X-Cookie: Natural laws have no pity.


--p+ntJXcBgVP6K1OX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 02:06:13PM +0200, Otto Pfl=FCger wrote:

> +static const struct platform_device_id sc2730_regulator_id_table[] =3D {
> +	{ "sc2730-regulator" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(platform, sc2730_regulator_id_table);

Unless you modify the MFD to register this child device it won't be
instantiated - how did you test this?

--p+ntJXcBgVP6K1OX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoN19AACgkQJNaLcl1U
h9AMrAf/Qfc3vXwwm7dJJ28i9AOsr0/vY0kmVtk0u2H3g41mEhPBzgSGskMawzGQ
HBxFoiyrrrf55G7NNp7BrWv4eWpiqcMhs4FmgMPG/i45Omwv16/eEEXR4k41sobI
ILw0oXs/Lk7aU+3U6mNV7cUxXuBkkr0E0fc9EvJTK4rVq0unmNbugxw2xwbDMeP1
Jgftn/wL1MLmDIpufGB1DHPdPsfpU6f287Iu2kPD4fICWNNB3wvehuGtdEL0G2RE
WIHzAGrwHAdRtIoScMX2OTmq0crkdUqS2CR+Gh3g/41t5yWhv4Ux1hkCuYSMLrRd
PFyXPAbhmX4BytL32g5XCQyGqRoF9w==
=/sys
-----END PGP SIGNATURE-----

--p+ntJXcBgVP6K1OX--
