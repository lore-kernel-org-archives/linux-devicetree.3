Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4B235E936
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444864; cv=none; b=HEJQET2hsKx0+zTyqBVHBmBtHM0zIwJb1MLJC5n2eSt8/QcwmDDfLazcnMQlXY/4zHbuyHoNADGMp1j4KlpUi5a0notT4zufborjYAwubVWKw9gcuYbXCcgiXkn4mdgGAjw4ONgRCfNwgB7SHnfqL++djwVAL7IXM39SnrsSZl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444864; c=relaxed/simple;
	bh=9JYGl3Qqt6VexK7e/yj88wnMpgjFCUPHEAmPxHGMSYY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CYghFnCF/YNt4QdrhiV1y/GcVntHSGlx0SpZ/7OnWrWG2B2u2+8Sdq9Fh5dj6CVnHkTDRbG43C2Ojx8J9bgHCgOBFKrb9gcPn4giyGrcLeAJRoI089eyO6QEmsL4Q5TqzFPxF8KkobLcnBcS5+x48iIq/ftF1PvRqitov61yv28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMj55TLb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMj55TLb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3081F000E9;
	Tue,  7 Jul 2026 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783444863;
	bh=F9F2KQ5VHiUq7KP4p8KjN9y7rly30UP3xk95424d+TM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WMj55TLbYM59sv92LkkyR8U2evMZDuhzWprTwpAcuK8v60m3Mwpu9lAVuk+frzMsk
	 ihy1UXXPWtX/WXO9mKhtsPGGAsVrYwaE42RbaGxZwo6q2Tpe+DmnzQvVZcT1qPoDAq
	 xNqzyGXkkqLf8YRa6twz8Zn4QuY1a7NMLdi08ce/1e3w9jAnoZXhbpVyCsCa0mmngy
	 mRp6AAf2JTlFGJGiMwg7aYkb3QatAiFTiTtudbCSmaqzidiuZog9oePuhU3z1HF+k1
	 FzKVnVp8azIQYxwarSSZmWPHJZbuuiLqgSFr8hNM+7yRGiFEkV+iU9XVgXLz4VT4IB
	 8bIUapv0+63YQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/20] media: imx355: Convert to new CCI register
 access helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707-media-imx355-v2-13-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
 <20260707-media-imx355-v2-13-1683ec07b897@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 17:21:01 +0000
Message-Id: <20260707172102.BC3081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Unintended permutation of initialization values for registers 0x03=
05, 0x0306, and 0x0307 in `imx355_global_regs`.
- [Medium] `IMX355_REG_TEST_PATTERN` is incorrectly defined as an 8-bit reg=
ister, causing truncated writes and breaking test pattern configuration.
- [Low] The error code from `devm_cci_regmap_init_i2c()` is incorrectly dis=
carded and replaced with a hardcoded `-ENODEV`.

Pre-existing issues:
- [High] Incorrect check of `pm_runtime_get_if_in_use()` in `imx355_set_ctr=
l` allows unpowered hardware access and PM counter underflow when runtime P=
M is disabled.
--

--- Patch [13]: [PATCH v2 13/20] media: imx355: Convert to new CCI register=
 access helpers ---
commit 85e1b3f8ecdbe34d874840dcfedd44c3422e9cf3
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx355: Convert to new CCI register access helpers

This patch updates the imx355 driver to use the common v4l2 CCI register
access helpers. It replaces the private i2c transfer logic with cci_read
and cci_write calls, and updates the register definition tables.

> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index c7a24c69c0df8..c710dda5795b6 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
[ ... ]
>  /* Digital gain control */
> -#define IMX355_REG_DPGA_USE_GLOBAL_GAIN	0x3070
> -#define IMX355_REG_DIG_GAIN_GLOBAL	0x020e
> +#define IMX355_REG_DPGA_USE_GLOBAL_GAIN	CCI_REG8(0x3070)
> +#define IMX355_REG_DIG_GAIN_GLOBAL	CCI_REG16(0x020e)
>  #define IMX355_DGTL_GAIN_MIN		256
>  #define IMX355_DGTL_GAIN_MAX		4095
>  #define IMX355_DGTL_GAIN_STEP		1
>  #define IMX355_DGTL_GAIN_DEFAULT	256
> =20
>  /* Test Pattern Control */
> -#define IMX355_REG_TEST_PATTERN		0x0600
> +#define IMX355_REG_TEST_PATTERN		CCI_REG8(0x0600)

[Severity: Medium]
Does this change the width of the test pattern write?

The original code used imx355_write_reg() with a length of 2 for
IMX355_REG_TEST_PATTERN, performing a 16-bit write. With this macro
defined as an 8-bit register, cci_write() will truncate the payload into
a 1-byte write, dropping the lower byte that actually contains the
control value. Should this be defined as CCI_REG16(0x0600)?

[ ... ]
> -static const struct imx355_reg imx355_global_regs[] =3D {
[ ... ]
> -	{ 0x0301, 0x05 },
> -	{ 0x0303, 0x01 },
> -	{ 0x0305, 0x02 },
> -	{ 0x0306, 0x00 },
> -	{ 0x0307, 0x78 },
> -	{ 0x030d, 0x02 },
> -	{ 0x0310, 0x00 },
[ ... ]
> +static const struct cci_reg_sequence imx355_global_regs[] =3D {
[ ... ]
> +	{ CCI_REG8(0x0301), 0x05 },
> +	{ CCI_REG8(0x0303), 0x01 },
> +	{ CCI_REG8(0x0305), 0x00 },
> +	{ CCI_REG8(0x0306), 0x78 },
> +	{ CCI_REG8(0x0307), 0x02 },
> +	{ CCI_REG8(0x030d), 0x02 },
> +	{ CCI_REG8(0x0310), 0x00 },

[Severity: High]
Were the values for these three registers accidentally swapped during the
conversion?

The original sequence was:
{ 0x0305, 0x02 }
{ 0x0306, 0x00 }
{ 0x0307, 0x78 }

The new sequence assigns 0x00 to 0x0305, 0x78 to 0x0306, and 0x02 to 0x0307.
Could this incorrect initialization sequence break the sensor's hardware
timing configuration?

[ ... ]
> @@ -726,31 +647,31 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)

[Severity: High]
This isn't a bug introduced by this patch, but does the runtime PM check in
this function handle negative error codes correctly?

In imx355_set_ctrl(), the code checks:

        if (!pm_runtime_get_if_in_use(imx355->dev))
                return 0;

pm_runtime_get_if_in_use() returns -EINVAL when runtime PM is disabled.
Since -EINVAL is non-zero, the check evaluates to false, and the code
falls through to hardware accesses while the device might be unpowered.
Could this also lead to an underflow when pm_runtime_put() is called at
the end of the function?

[ ... ]
> @@ -1344,6 +1228,12 @@ static int imx355_probe(struct i2c_client *client)
> =20
>  	mutex_init(&imx355->mutex);
> =20
> +	imx355->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(imx355->regmap)) {
> +		dev_err(imx355->dev, "Unable to initialize I2C\n");
> +		return -ENODEV;
> +	}
> +
>  	imx355->clk =3D devm_v4l2_sensor_clk_get(imx355->dev, NULL);
>  	if (IS_ERR(imx355->clk))

[Severity: Low]
Should this propagate the actual error code instead of returning -ENODEV?

When devm_cci_regmap_init_i2c() fails (e.g., due to memory allocation
failure returning -ENOMEM), returning a hardcoded -ENODEV masks the true
cause of the failure. Would it be better to return PTR_ERR(imx355->regmap)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-media-imx3=
55-v2-0-1683ec07b897@raspberrypi.com?part=3D13
