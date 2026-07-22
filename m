Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD7243441C
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705403; cv=none; b=hS0mmYSFMlKHDGa38dcbNA7vHFYjVBNUBOA7z8MTG2rLwivLvoioxyNJr3V0lgzxRBfhNNeQ8t2Mwflt0Xx2v9R2LDKLDYFIWBpGJDyNWV/sd+HcmSHvbj2offLGqHXcAbdC39VuBDR+vvVY2fnl/b37JHa0xBTbfos4ILHFZw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705403; c=relaxed/simple;
	bh=BE7bKI4K6Wi51Zr0YdGEiQ3HwACkTWPqABpyoDryDkA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YMy1pW8gY7gewHozuuSjBV1C5aChgZs1DeM5o9wnI2LR6HRn3E9+TLRPgDz4f8tgWQsj7+1l4XWuwxs61AMUWAClVHLCkROs9dwzRDkLAwSB/AeCfzG/So7rzBWOfcCRFvJJYdFT9vB2FQwgksUPzb3f/rwcRiBCV8gUS81lELw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAbPoiGu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAbPoiGu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767611F000E9;
	Wed, 22 Jul 2026 07:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784705397;
	bh=K/wxDkYh1OCNxk5dPhw/9jjYrxtVwgjy/h2ztVXjXus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cAbPoiGu+SzTYjRw25uoJIjaLJaOevrsZ7fJtPem+HHwfBIEK+NUX8YcLUuWvYMpU
	 X2tIDjKJCCm9dWvkGoHSNBjoedTI8BuslXOwiACENEehHbookBOrS32AS49jE62Gpp
	 GL7ZQJvT5N4aIK7wFRNtpiQnhzLKIOz1qB3wmAooh/dpKdFUeRUz7+j/AeSRwwgW40
	 KD9t//29fOBVTtrh0HahglIQhU6prjsMo9nQbrBwW3pENxWEKR5FZXChLrcRyhntAx
	 8h3bc4FmzVileFJRBqTjTybg96IcLT6/6T5IqsUfb27U9vD5SafS6uLnwGMQx2YIhY
	 oXdpm5Bd5ZDuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722-mira220-v6-2-203e32c596de@ideasonboard.com>
References: <20260722-mira220-v6-0-203e32c596de@ideasonboard.com>
 <20260722-mira220-v6-2-203e32c596de@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 07:29:56 +0000
Message-Id: <20260722072957.767611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] mira220_power_on() incorrectly returns 0 (success) when clk_prepar=
e_enable() fails.
- [Medium] Control writes are skipped when CONFIG_PM is disabled due to a f=
lawed pm_runtime_get_if_in_use() check.
- [Medium] Missing OTP power-off on error paths in mira220_identify_module(=
).
- [Medium] Misuse of pm_runtime_idle() in probe leads to immediate synchron=
ous suspend, defeating the intended autosuspend delay.
- [Medium] Lockless read of control values (vflip/hflip) during TRY state p=
ad operations.
- [Low] Unconditional assignment of PM operations structure in I2C driver c=
auses dead code when CONFIG_PM is disabled.
--

--- Patch [2]: [PATCH v6 2/2] media: i2c: Add driver for AMS-OSRAM Mira220 =
---
commit 28ced88b5107fb473e5430a3d39ee0fcfe5ae472
Author: Philippe Baetens <philippebaetens@gmail.com>
Subject: media: i2c: Add driver for AMS-OSRAM Mira220

This commit introduces a V4L2 subdevice driver for the AMS-OSRAM Mira220 im=
age
sensor. It implements support for mono and RGB formats, handles CSI-2 bus
configuration, and includes OTP programming routines.

> diff --git a/drivers/media/i2c/mira220.c b/drivers/media/i2c/mira220.c
> index 0000000000000..351dfb2813948
> --- /dev/null
> +++ b/drivers/media/i2c/mira220.c
[ ... ]
> @@ -1014,6 +1014,7 @@ static int mira220_power_on(struct device *dev)
>  	return 0;
> =20
>  reg_off:
>  	return regulator_bulk_disable(MIRA220_NUM_SUPPLIES, mira220->supplies);

[Severity: High]
Does this unintentionally discard the error code from clk_prepare_enable()?

If clk_prepare_enable() fails, the code jumps to reg_off. Since=20
regulator_bulk_disable() returns 0 on success, the function will return 0=20
instead of the actual error code, making the caller believe the device=20
powered on successfully.

>  }
[ ... ]
> @@ -1160,6 +1160,7 @@ static u32 mira220_get_format_code(struct mira220 *=
mira220, u32 code)
>  	if (i >=3D ARRAY_SIZE(mira220_mbus_color_formats))
>  		i =3D 0;
> =20
>  	i =3D (i & ~3) | (mira220->vflip->val ? 2 : 0) | (mira220->hflip->val ?=
 0 : 1);

[Severity: Medium]
Is it safe to read the control values directly here without holding the
driver's control handler lock?

When called from pad operations like mira220_set_pad_format() with
the V4L2_SUBDEV_FORMAT_TRY flag, the callback is executed while holding
the file handle's TRY state lock, not the driver's control handler lock.
Could this cause a data race with concurrent userspace ioctls modifying
the vflip or hflip controls?

> =20
>  	return mira220_mbus_color_formats[i];
>  }
[ ... ]
> @@ -1182,6 +1182,8 @@ static int mira220_set_ctrl(struct v4l2_ctrl *ctrl)
>  	if (ctrl->id =3D=3D V4L2_CID_VFLIP || ctrl->id =3D=3D V4L2_CID_HFLIP)
>  		format->code =3D mira220_get_format_code(mira220, format->code);
> =20
>  	if (pm_runtime_get_if_in_use(&client->dev) <=3D 0)
>  		return 0;

[Severity: Medium]
What happens to control updates if the kernel is built with CONFIG_PM=3Dn?

When PM is disabled, pm_runtime_get_if_in_use() returns -EINVAL. Because
this check evaluates to true for negative values, it would cause
mira220_set_ctrl() to immediately return 0, silently discarding any user
control changes while the sensor is streaming.

> =20
>  	switch (ctrl->id) {
[ ... ]
> @@ -1367,6 +1367,8 @@ static int mira220_identify_module(struct mira220 *=
mira220)
>  	/* Log module version checks */
>  	mira220_otp_read(mira220, 0x0d, 0, &val, &ret);
>  	mira220_otp_read(mira220, 0x1e, 0, &val, &ret);
>  	if (ret)
>  		return ret;

[Severity: Medium]
Could this leak hardware resources by leaving the sensor's OTP block powered
on?

If the OTP read fails here, the function returns directly rather than
routing to the err_power_off label, completely skipping the call to
mira220_otp_power_off().

> =20
>  	/* Check unique module hardware ID version */
>  	ret =3D mira220_otp_read(mira220, 0x3a, 0, &id, NULL);
>  	if (ret)
>  		return ret;

[Severity: Medium]
Similar to the check above, does this missing jump to the err_power_off
label also leave the OTP block powered on if reading the hardware ID fails?

> =20
>  	if (id < 1 || id > 2) {
[ ... ]
> @@ -2028,6 +2028,9 @@ static int mira220_probe(struct i2c_client *client)
>  		goto error_subdev_cleanup;
>  	}
> =20
>  	pm_runtime_idle(dev);
>  	pm_runtime_set_autosuspend_delay(dev, 1000);
>  	pm_runtime_use_autosuspend(dev);

[Severity: Medium]
Will calling pm_runtime_idle() before configuring the autosuspend delay
cause an immediate synchronous suspend?

Since pm_runtime_use_autosuspend() has not been called yet, the PM core
will not honor the 1000ms delay and might synchronously power down the
device immediately during probe.

> =20
>  	return 0;
[ ... ]
> @@ -2054,6 +2054,7 @@ static struct i2c_driver mira220_i2c_driver =3D {
>  	.driver =3D {
>  		.name =3D "mira220",
>  		.of_match_table	=3D mira220_dt_ids,
>  		.pm =3D &mira220_pm_ops,

[Severity: Low]
Should this assignment be wrapped with pm_ptr()?

If the kernel is built with CONFIG_PM=3Dn, assigning the structure
unconditionally leaves mira220_pm_ops in the compiled binary as dead code.

>  	},
>  	.probe =3D mira220_probe,
>  	.remove =3D mira220_remove,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-mira220-v6=
-0-203e32c596de@ideasonboard.com?part=3D2
