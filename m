Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A6C38B7A7
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585360; cv=none; b=XP0QAhNn6LYjuC1Av7UlWL6qPoUjJRk7RsacBbqPrBluLc9QdYfo0GgOyPGns6tcghbriqOecdEvXlv2t7JQtbqHc+YBXjwSsPMyYMsnB/kp0kv77huj2MyjanrObNY1NPkfxDJB9mJPH0fPKG1barV6I+ujzz3j6LFRseHyz1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585360; c=relaxed/simple;
	bh=mJR7HJexqdw2D2UhDD3JaEqukCrDeFuvkJCO0AFqn5s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BpCUAkMP9vEz+l7IWTy5xEDd0lgwVU+noye4RHA34owf9O53sFbIHq/h9qmWt+PPp04wg0QKkR/CkPovb+SWWhuRuOPHkmLZ8dT93Hab1DYvbHJIRUCUkMjkqvQrLWni/cRfPBREuJ/MuV5Qr16/p95VRtAgPIc+tld7jIdH9NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYwqzilE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYwqzilE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2261F000E9;
	Thu,  9 Jul 2026 08:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783585358;
	bh=3vxJy7GG0BQ2HMPMTAJwMVS9Jd8Dsk++9LqtvQbQGR4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eYwqzilEKIUEOz/iR4dWwgAzIMQpOW/PEE02sdQ5A9kqr4cDQ1JKo2drYZ8PZdI+m
	 bHUXlD2fiafrXRZVXlCrcQZs/XQC6l+CUcekRlIXmyhPSj/kIMnQidUnZ65sPq1y6y
	 0fX4AguyCVnzyyLemyzF3F8zCzKZBDaiszn5CkzIO2xyL0JCGBPu8KMQ5xXYt2jxSQ
	 gl6SoCFutJivi6FwFypYyD8qkFMM/zAauAggm+1199YpL/QG1uEnv0f1PbKNGGI7KL
	 PH/WHiNN1CE3BXAwOjDL7Eos9D6Si8jSI8JEOKbBew8reOJymROQxq93hznQ7vTeJA
	 7hs7UA7tftjZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] media: i2c: hm1092: add Himax HM1092 mono NIR
 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ramshouriesh R" <rshouriesh@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260709-hm1092-driver-v5-2-a1f5baa6fe08@gmail.com>
References: <20260709-hm1092-driver-v5-0-a1f5baa6fe08@gmail.com>
 <20260709-hm1092-driver-v5-2-a1f5baa6fe08@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 08:22:38 +0000
Message-Id: <20260709082238.AF2261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unnecessary device power-on sequence in probe() introduces a ~22=
ms boot delay per camera with no functional benefit.
--

--- Patch [2]: [PATCH v5 2/2] media: i2c: hm1092: add Himax HM1092 mono NIR=
 sensor driver ---
commit 4abd5da551efe32eec434d2e88b53c45de5fc3dc
Author: Ramshouriesh R <rshouriesh@gmail.com>

media: i2c: hm1092: add Himax HM1092 mono NIR sensor driver

Add a V4L2 subdev driver for the Himax HM1092 monochrome near-infrared
image sensor. The driver supports the sensor's native 560x360 10-bit mono
mode, test patterns, and standard fwnode properties.

> diff --git a/drivers/media/i2c/hm1092.c b/drivers/media/i2c/hm1092.c
> new file mode 100644
> index 0000000000000..c7cde6928bb91
> --- /dev/null
> +++ b/drivers/media/i2c/hm1092.c

[ ... ]

> +static int hm1092_probe(struct i2c_client *client)
> +{
> +	struct hm1092 *hm1092;
> +	unsigned long freq;
> +	int ret;

[ ... ]

> +	hm1092->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(hm1092->regmap))
> +		return PTR_ERR(hm1092->regmap);
> +
> +	ret =3D hm1092_power_on(hm1092->dev);
> +	if (ret)
> +		return dev_err_probe(hm1092->dev, ret, "failed to power on\n");

[Severity: Medium]
Does this driver need to power on the sensor during probe?

Looking at hm1092_power_on(), the sequence introduces ~22ms of sleep delays
to bring up regulators and clocks. However, there doesn't appear to be any
I2C communication (such as reading a hardware ID register to verify the chip
is present) that follows in the hm1092_probe() function.

Since the device is just powered on and then immediately idled and suspended
shortly after via pm_runtime_idle(), could this power-on step be deferred
entirely to runtime PM or streaming initialization to avoid the boot delay?

> +
> +	ret =3D hm1092_init_controls(hm1092);
> +	if (ret)
> +		goto err_power_off;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-hm1092-dri=
ver-v5-0-a1f5baa6fe08@gmail.com?part=3D2
