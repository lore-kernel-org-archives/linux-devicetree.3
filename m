Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E80C280037
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778943959; cv=none; b=MDUVNXqEmBaTZlUsroUyT7RGv+XRns27N2aJFcVhVlRHaXK+YSlVpfg9AmP4vwojOg58xn2cm9lJqUjI4+ppCMUz6f5xXigDyOqPcFFA1uwwcoxXLI9nfjEj2N0d4p3NrKFQpJI/ELwyWEYK3IYt3e1gBFz8WcGdhUswR9AgnE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778943959; c=relaxed/simple;
	bh=cTnsQLHuGZgQkDZBdHawTECGMQkfN/M1ZH+SAlQzeYo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fn43iBsGX3yIr2VcZ4cEQY9mORVMZ5X4YVbaxzBV87aF2B7dJGiRqW/U3J3keRxCyDSpq8SYMdkVuJxc68OlLWDMkyAW/FsRvmBD9/wphDI7/gAyJuMbfzFdBTuxNwI6QwV5jiZqOFjuoutOOUly2d4Rc45n5Z7Zk7hux3eaCsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1CJi5GI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1CJi5GI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81233C2BCB3;
	Sat, 16 May 2026 15:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778943958;
	bh=cTnsQLHuGZgQkDZBdHawTECGMQkfN/M1ZH+SAlQzeYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Q1CJi5GIrLFhjhTQiFRaGHzX/RlkxO7j0EVr7SRjUR8kzDdZ+vb/zezLXMvgOn1v5
	 u+vW4nY74m7c3ggTEyRtNbKicHmjtjKyzrvGevELLKTFskBEEZkhr1idpp4zHC1SqH
	 fubwRzrxm/yLlINrAW6qKbsJhym3c5ITHvEXPv7l/mZ78P4Dy3pokkJj+eTEgHyy2W
	 wG02SxgrPYiUNWD0zqJt5N/K2cTNSU/08sMFKXnaLr1VLA/wtBdsXk7gDSTwRCS5IJ
	 S0bga0s34SMju+b2+t9icVuCFK68qDvXpU2Cmqiv1kp3ClBI1UcAgWVJAkTyQpbm1K
	 kKa5NRQZcS3RA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: imx678: Add driver for Sony IMX678
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jai Luthra" <jai.luthra@ideasonboard.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260516-imx678-v2-2-4854ac61d6fb@ideasonboard.com>
References: <20260516-imx678-v2-2-4854ac61d6fb@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 15:05:57 +0000
Message-Id: <20260516150558.81233C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Unbalanced `pm_runtime_put()` in `imx678_set_ctrl()` leads to PM u=
sage count underflow.
- [Medium] Missing dependency on `I2C` in Kconfig for `VIDEO_IMX678`.
- [Medium] I2C error code is shadowed by a chip ID mismatch error during pr=
obe.
- [Medium] Sensor is incorrectly left in streaming mode during probe.
- [Low] Unconditional assignment of `dev_pm_ops` structure without `pm_ptr(=
)` wrapper.
--

commit 237dad9b41220530e354a42030ad018d87f9271b
Author: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: media: i2c: imx678: Add driver for Sony IMX678

Add a V4L2 subdev driver for the Sony IMX678 image sensor. This driver
supports features like variable framerates, cropping, binning, flipping,
test patterns, and exposure control.

> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
[ ... ]
> +config VIDEO_IMX678
> +	tristate "Sony IMX678 sensor support"
> +	depends on OF_GPIO
> +	select V4L2_CCI_I2C

V4L2_CCI_I2C inherently depends on I2C. Does this symbol also need a
"depends on I2C" constraint to prevent unmet direct dependency warnings
during builds?

> diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
> --- /dev/null
> +++ b/drivers/media/i2c/imx678.c
[ ... ]
> +static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +	/*
> +	 * Applying V4L2 control value only happens
> +	 * when power is up for streaming
> +	 */
> +	if (pm_runtime_get_if_in_use(&client->dev) =3D=3D 0)
> +		return 0;

Can this cause a PM usage counter underflow? When runtime PM is disabled
(e.g. during system suspend), pm_runtime_get_if_in_use() returns a negative
error code like -EINVAL. Because -EINVAL !=3D 0, the check passes, and
execution continues to the end of the function where pm_runtime_put() is
called without a corresponding increment.

Should this check for <=3D 0 instead?

[ ... ]
> +static int imx678_identify_model(struct imx678 *imx678)
> +{
[ ... ]
> +	/*
> +	 * This sensor's ID registers become accessible 80ms after coming out
> +	 * of STANDBY mode.
> +	 */
> +	cci_write(imx678->cci, IMX678_REG_MODE_SELECT, 0, &ret);
> +	fsleep(IMX678_MODULE_ID_DELAY);

Is it intentional to leave the sensor in streaming mode (0) here? If runtime
PM is disabled or delayed, could this cause the sensor to actively transmit
data continuously after probe?

> +
> +	cci_read(imx678->cci, IMX678_REG_MODULE_ID, &val, &ret);
> +
> +	if (val !=3D IMX678_ID) {
> +		dev_err(&client->dev,
> +			"Chip ID mismatch: %x!=3D%llx\n", IMX678_ID, val);
> +		return -ENXIO;
> +	}

If the cci_read() fails due to an I2C error, it sets val to 0 and returns an
error code in ret. Because val is 0, the check above will evaluate to true
and return -ENXIO, masking the actual I2C error code.

Should we check if ret is non-zero before validating the chip ID?

[ ... ]
> +static struct i2c_driver imx678_i2c_driver =3D {
> +	.driver =3D {
> +		.name =3D "imx678",
> +		.of_match_table =3D imx678_of_match,
> +		.pm =3D &imx678_pm_ops,
> +	},

This isn't a bug, but if CONFIG_PM is disabled, the imx678_pm_ops structure
becomes dead code. Should this use the pm_ptr() wrapper to ensure the point=
er
evaluates to NULL and the structure can be optimized away?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-imx678-v2-=
0-4854ac61d6fb@ideasonboard.com?part=3D2
