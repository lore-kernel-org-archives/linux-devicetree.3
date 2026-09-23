Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21C6572664
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790193011; cv=none; b=jTfTNCU5FzJUKp6oobwIPKKqBXKWhMKZJkvjccGdQEyD8g8j6rjuZlzMosUgMO5Mgb4bJjg8CFQl+4yNnOa3l3hfSBe1pmgmiKyxe9bU/0G6KVSJ8nSa3TbJ/vo/g+ezP2hZl/K9m65qLgXGTXJ9roOTBzQQvcSErRRTbQZLrH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790193011; c=relaxed/simple;
	bh=NlEBeeNJfpEWYCm5gxlBdg9UciS99oitO1glvK7vvys=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VHWLfZqUqm3yMfgG7vzU8Dc7JJEg/ZTxz5Fh7nXWzJtKv9mjf+eIMM7pBSCRPaZLYC41VbmWItUCz/BEOYQBkO2nNYYzrrDSNpNSCN4w2XfKqKXZKneP6pj3Ozqsf5pcagOi8tilr2j04RHRPMfSFIh8vKWV0YKBuWe5xuRx+ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1G35Izt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1G35Izt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11D41F000FF;
	Wed, 23 Sep 2026 19:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790193008;
	bh=yby79EqsqUbDw44Cxdzh8bnZ21i96fV9e6ZYa+aAr5c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K1G35IztfDbRQsUvxFrlep93p8F1SuD8gHENcTf3m03IvRZ8qj3IIMECVf3QD4SuO
	 hsWfKtpH6KiZkEmyWKQ0tZ7vFD355yK1XmBAKewoofVtjbplCwSN7N7KosmCAxae+k
	 sYgdk4aN1UMEo4MFoCbRvrA3iWpYLFvSTG45GmcUpkJx73Xtd8+Ly20vKrnaURXqx+
	 j7yK+CgXlL+CiXdWB9a59y8GANqeps/Nw3muBQ//k/YnOLQFWlmABp91W8bZvbWo20
	 iI921SUpmvkF6bQ+TXKfYICK3TjtYxJBXFhp5s/H7p8P1ckS5zSlHr2JWt2rs1e1sl
	 UY7dNQUPJ9ZoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] media: i2c: Add Sony IMX681 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergey Lebedev" <lsa.uz@pm.me>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260923193805.83998-3-lsa.uz@pm.me>
References: <20260923193805.83998-1-lsa.uz@pm.me>
 <20260923193805.83998-3-lsa.uz@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 19:50:07 +0000
Message-Id: <20260923195007.A11D41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] media: i2c: imx681: missing clock rate validation
- [Medium] media: i2c: imx681: flip controls silently ignored during stream=
ing
--

commit 9302e1005f9a8ea647ef15f49b763c01aec8d79f
Author: Andre Gilerson <andre.gilerson@gmail.com>

media: i2c: Add Sony IMX681 sensor driver
   =20
Add a V4L2 sub-device driver for the Sony IMX681, a 10-bit Bayer sensor
on a two-lane CSI-2 bus. It offers a single 3844x2640 mode at 30 fps and
controls for exposure, analogue and digital gain, vertical blanking,
both flips and the sensor's test patterns.

> diff --git a/drivers/media/i2c/imx681.c b/drivers/media/i2c/imx681.c
> new file mode 100644
> index 0000000000000..3be96965c53ec
> --- /dev/null
> +++ b/drivers/media/i2c/imx681.c
> @@ -0,0 +1,1003 @@

[ ... ]

> +static int imx681_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct imx681 *imx681 =3D container_of(ctrl->handler, struct imx681,
> +					     ctrl_handler);

[ ... ]

> +	switch (ctrl->id) {

[ ... ]

> +	case V4L2_CID_HFLIP:
> +	case V4L2_CID_VFLIP:
> +		/* Read from imx681_start_streaming(); the layout changes. */
> +		break;

[Severity: Medium]
Will this silently ignore flip control changes while the sensor is streamin=
g?

When userspace modifies V4L2_CID_HFLIP or V4L2_CID_VFLIP via VIDIOC_S_CTRL
during streaming, returning 0 here without updating the hardware tells the
V4L2 core the change succeeded. This can cause the V4L2 control state to
diverge from the actual hardware state, breaking pipeline format validation
because the reported Bayer format no longer matches the sensor's actual
output.

Should the driver call v4l2_ctrl_grab(..., true) when streaming starts to
prevent these modifications?

[ ... ]

> +static int imx681_probe(struct i2c_client *client)
> +{
> +	struct imx681 *imx681;
> +	int ret;
> +
> +	imx681 =3D devm_kzalloc(&client->dev, sizeof(*imx681), GFP_KERNEL);
> +	if (!imx681)
> +		return -ENOMEM;

[ ... ]

> +	/* Initialise CCI regmap for 16-bit register addresses */
> +	imx681->cci =3D devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(imx681->cci))
> +		return dev_err_probe(imx681->dev, PTR_ERR(imx681->cci),
> +				     "failed to init CCI\n");
> +
> +	/* Get clock (optional - INT3472 provides it on Surface devices) */
> +	imx681->xclk =3D devm_clk_get_optional(imx681->dev, NULL);

[Severity: Medium]
Does this clock need rate validation?

The sensor's PLL and CSI-2 link timings appear to be configured assuming an
exact 19.2 MHz input clock. If a different clock rate is provided (e.g.,
24 MHz from a device tree or ACPI configuration), this probe will silently
succeed, but the sensor might output garbage or fail to link.

Should we check the rate using clk_get_rate() here?

> +	if (IS_ERR(imx681->xclk))
> +		return dev_err_probe(imx681->dev, PTR_ERR(imx681->xclk),
> +				     "failed to get clock\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923193805.8399=
8-1-lsa.uz@pm.me?part=3D2
