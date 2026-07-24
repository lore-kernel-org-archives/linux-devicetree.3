Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5143427FB8
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784895538; cv=none; b=BRFwtTvaVrfaPsrRnT9KOMVNnBA0jA3DPhqRtFxVvH9c7nGu41H/S8K/kb98aUOVRoZ98enmk2opPYP3X4OGLM0k9g3YBByZGnaXtO4S9IE86x0mMm1g2vShYA0hpLdWri3xtGEar0F1fQY5MUkke8cjyPSjqNweBGvkVkYmZGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784895538; c=relaxed/simple;
	bh=uo8E8OH8OWSNcoH/Wf6h7GTutggHz5CXVuSQcWw0SNE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tBd4PYTrpVad6w5sgc2UIm6SiOB50XU3SYolk/twPS4dYKCUXmi+N7ZkUJAMjvA2bh0ToRdcstz3frlA4L8WI0umKuW/rQgyl9PXpStZUZnPJ1o34DSl6yr+aJ9kjWva6gRBXcce5cxW6R7lAwF65CfuZGU+19aSqMmhAgJnz0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVwyMKxd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVwyMKxd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1DF1F000E9;
	Fri, 24 Jul 2026 12:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784895536;
	bh=RHjMoksDi7j9GX3KbkuljhwPfMvo1GU8PXUvyGwj/aM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JVwyMKxdglfLpWIReaEl/NKQ3egyNAZZo7j+mh3PiiFYoCuCzr7n3LyvNKo/Q682I
	 eljAz9OkfXILu1NTg/PqbR/G1HsaAew6QDWDkSmiNJItnzGoBDy3ypH1nzsQ+9p5bl
	 pZbHmRPyciUvf/J+qBj8Ah/nk0fi2PnTJQu1FGhBguujl7ZM97jq21upez7sIPRsn9
	 Dhu1eHnpoiaTnguZWV7ih3NgnzquFoP1blDgRsY/a7qcWv2xV39aJBoOkP3u8t1bGR
	 +rB4ypENSs47XWkmszPpZqSNBfnPv2VVpUSumFjuzRE1cbJKxqrQuRTz5YK05ejRG7
	 Im5wIs94xJqvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: iio: dac: ad5696: add
 AD5673R/AD5677R support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724-ad5686-extend-dev-support-v2-1-cfc2b30ce988@analog.com>
References: <20260724-ad5686-extend-dev-support-v2-0-cfc2b30ce988@analog.com>
 <20260724-ad5686-extend-dev-support-v2-1-cfc2b30ce988@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 12:18:55 +0000
Message-Id: <20260724121855.CE1DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing 'adi,ad5673r' and 'adi,ad5677r' in the ad5696-i2c driver's=
 of_device_id table breaks module autoloading.
--

--- Patch [1]: [PATCH v2 1/6] dt-bindings: iio: dac: ad5696: add AD5673R/AD=
5677R support ---
commit 0615f695e24a3ce3cbdf232377b1a0e2894200a2
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

dt-bindings: iio: dac: ad5696: add AD5673R/AD5677R support

Add compatible entries for the AD5673R and AD5677R devices to the ad5696
device tree bindings. These 16-channel devices use different bit resolutions
so no fallback compatibles are used.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml b/=
Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml
> index e10f8596f9d3f..5a93edc976f01 100644
> --- a/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml
> @@ -19,7 +19,9 @@ properties:
>        - adi,ad5337r
>        - adi,ad5338r
>        - adi,ad5671r
> +      - adi,ad5673r
>        - adi,ad5675r
> +      - adi,ad5677r

[Severity: High]
This isn't a bug introduced by this patch, but does the driver also need
to be updated to match these new compatible strings?

Looking at drivers/iio/dac/ad5696-i2c.c:ad5686_of_match():

static const struct of_device_id ad5686_of_match[] =3D {
	{ .compatible =3D "adi,ad5311r", .data =3D &ad5311r_chip_info },
    ...

It appears 'adi,ad5673r' and 'adi,ad5677r' are missing from this table.

When the system boots and the I2C core generates an of: modalias for=20
DT-instantiated devices, could the lack of these entries cause module
autoloading to silently fail for the ad5696-i2c driver?

>        - adi,ad5691r
>        - adi,ad5692r
>        - adi,ad5693

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-ad5686-ext=
end-dev-support-v2-0-cfc2b30ce988@analog.com?part=3D1
