Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCF63AFD0C
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 17:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784137407; cv=none; b=a80wxrvX61TVKOXThdjZulPsNvrayUAdAWIpAepa+Jn7IsL+pxISj/z1jOKkch/37N5AfNGdJSD0zR6KxivcY1dCDexM1laL4rEap2sNCbmqxJXiE3UR6E3bgh714Jr0FeOOo9YnlHQUmU7Wpqa7hm9KiP0gPKlbqmz/wAasdNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784137407; c=relaxed/simple;
	bh=ACW/IE8C+MIlNsc2wMXanMdb247wn4JCiP2wzErKob4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K7v5Bwfd0MOYz/ShjRrs/vxQtfjpihgVDk+77UqqPbKg81FkWmBoSVOUbltGQRS7MNyD3JagfdaEY2y5UHoXW/Pg5duHcLavLmost0DmL5FBj11LJyryXV+XnG4I7VKFcLWKt+z25wTcbBOt6YFp6jO4uRbvTZp+MEnKTd8aqIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESN9kGVF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESN9kGVF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5B51F00A3A;
	Wed, 15 Jul 2026 17:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784137406;
	bh=EydvY8D1MgaxhpwrkCymf8XUokkANfYWB/r+D4qqosc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ESN9kGVFhhQjcOZ/eSUDfqB6q8p+TIM/uoRhXPD1CDiK0BptaABUJC49bdHXkqHeP
	 0vFcp+Zi13Z3da6mshA+lxgJGIIWNGS6qnue9BSTSOGfZiaEWKXDvnVzu3+CKNHxe/
	 85NVo07MBT/Zw/hUDvVJercsU4QH9Pls7KH6pnACGPizMrpRQDYvvd7CXy4Q7i4lfz
	 IyXXEmBooir4f7wScNFmK0JSSy8MUzf0gUmlGQ+XFsePic0A6ltsTJhdMZTKSiJLKb
	 10Qh47L06nujjuU8bbz9ZFPCbxaaM3oVPV7gcx3AzLQ8fjj6rVHvQUHz/zRN+LsWGl
	 M4NViY8ez/dXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: i2c: Add a driver for Sony IMX708
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jai Luthra" <jai.luthra@ideasonboard.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260715-imx708-v1-2-1f36f54e14d4@ideasonboard.com>
References: <20260715-imx708-v1-0-1f36f54e14d4@ideasonboard.com>
 <20260715-imx708-v1-2-1f36f54e14d4@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 17:43:25 +0000
Message-Id: <20260715174326.0E5B51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect check of `pm_runtime_get_if_in_use()` return value in `i=
mx708_set_ctrl()` leads to unbalanced runtime PM puts and hardware access w=
hile powered off.
- [Medium] Incorrect power-off sequence in `imx708_power_off()`: regulators=
 are disabled before the input clock.
- [Medium] Software state (`imx708->long_exp_shift`) is updated before hard=
ware confirms the write, leading to state mismatch on I2C failure.
--

--- Patch [2]: [PATCH 2/2] media: i2c: Add a driver for Sony IMX708 ---
commit 34adccd1a70befee0909b84ab4c6054b6de7c8c3
Author: Jai Luthra <jai.luthra@ideasonboard.com>

media: i2c: Add a driver for Sony IMX708

This commit introduces a new V4L2 I2C driver for the Sony IMX708 11.9
Megapixel CMOS sensor. It adds basic support for capturing the full active
area and includes controls for exposure, analogue gain, test patterns, and
variable frame rates using VBLANK.

> diff --git a/drivers/media/i2c/imx708.c b/drivers/media/i2c/imx708.c
> new file mode 100644
> index 0000000000000..052474befc5e4
> --- /dev/null
> +++ b/drivers/media/i2c/imx708.c
[ ... ]
> +static int imx708_set_frame_length(struct imx708 *imx708, unsigned int v=
al)
> +{
> +	int ret =3D 0;
> +
> +	imx708->long_exp_shift =3D 0;
> +
> +	while (val > IMX708_FRAME_LENGTH_MAX) {
> +		imx708->long_exp_shift++;
> +		val >>=3D 1;
> +	}
> +
> +	cci_write(imx708->cci, IMX708_REG_FRAME_LENGTH, val, &ret);

[Severity: Medium]
Does this leave the software state out of sync if the I2C transaction fails?

The driver mutates imx708->long_exp_shift before issuing the cci_write()
commands. If cci_write() returns an error, the V4L2 framework rolls back
the VBLANK control to its previous value, but the driver retains the
mutated long_exp_shift. Subsequent exposure calculations would then use
this corrupted shift value.

> +	cci_write(imx708->cci, IMX708_LONG_EXP_SHIFT_REG,
> +		  imx708->long_exp_shift, &ret);
> +
> +	return ret;
> +}
> +
> +static int imx708_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +	/*
> +	 * Only apply control values when device is powered on (RPM ACTIVE)
> +	 * and streaming (usage count !=3D 0)
> +	 */
> +	if (!pm_runtime_get_if_in_use(&client->dev))
> +		return 0;

[Severity: High]
Can this cause unbalanced runtime PM puts and hardware access while powered
off?

The pm_runtime_get_if_in_use() function returns -EINVAL if runtime PM is
disabled. In C, !(-EINVAL) evaluates to false, which causes the function to
bypass the early return. It then proceeds to access hardware registers and
calls pm_runtime_put_autosuspend(), decrementing a usage count that was
never incremented.

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		cci_write(imx708->cci, IMX708_REG_ANALOG_GAIN, ctrl->val, &ret);
[ ... ]
> +static int imx708_power_off(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct imx708 *imx708 =3D to_imx708(sd);
> +
> +	gpiod_set_value_cansleep(imx708->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(imx708_supply_name),
> +			       imx708->supplies);
> +	clk_disable_unprepare(imx708->inclk);

[Severity: Medium]
Should the clock be disabled before the regulators are turned off?

During device power down, regulators vana and vdig are turned off while the
input clock inclk is still running.

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-imx708-v1-=
0-1f36f54e14d4@ideasonboard.com?part=3D2
