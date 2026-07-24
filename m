Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D56640683F
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784908701; cv=none; b=pQdghkqtBS03iG/siLFU4fu099vveYm+pfLilyW0Z2bBLTE7gEMH1ManNHMvsuP6tFBhWfJOXBnH2C4WsOIQe/RI8tRPzOM2rS0J13lC8DbzUecMP8X1too2KuQBT3Q5ywzxfX7f/3T8f3UOVbZXYXPQOR4TM37I/r3fU+BwG7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784908701; c=relaxed/simple;
	bh=vIv5sBC+V2XzsxjIlqU0HlOzc1zzpkNN0+/P1S6JlL4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PsJi+EvFFRt5tw+RT6877Z2KWDQhNZkEoUUjAU7lN+phZPKydjFgNBCfQ2cuDtpsJzIZnHjHj9Z/wBf+qRWZzcT0r3tnJyqZ+AgmkfjptqnB8Vtw7E1bkyFvbW4AJ6TXmXlytBA1VCqVETUZgV8hrCr/JtkVZu9IG+30ogljqYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iWS+N+m6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWS+N+m6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7753C1F000E9;
	Fri, 24 Jul 2026 15:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784908698;
	bh=gi++JS39nsxTdNwf+D+OrilxZIwrKSiuJaLPOOdK04I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iWS+N+m6eNCdv2lO73TQiMrFrP4uZjakyJ/WADs0PTk5D3og7mGrE8ghZon5FAaWw
	 r9fJTf8wobSp641NcpG0S0hqU1mDeelwXAiDgXU1C7FxiAGQsIVKXw+L+xlc78tqH9
	 p2kLaq03w0CMaU6Eim2TgtyMFwMrru+LjxllZxNjBstYaZMJ5ROqM0fp3yU/gGgKqk
	 K2xSB9m/L0AwMOda2Hj0T6wMLYgMISY17HACVphQke0TXqB5faSGb0jHg/bP69knIL
	 ff4E3zJi3iJjluihZ2fBXd4fwH6z+VyRQIkdyhsfxpzRsG/0EYneCPl2vofwvpB+hJ
	 HwhAjlsGLfzXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-mira220-v8-2-d1899ab64709@ideasonboard.com>
References: <20260724-mira220-v8-0-d1899ab64709@ideasonboard.com>
 <20260724-mira220-v8-2-d1899ab64709@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 15:58:17 +0000
Message-Id: <20260724155818.7753C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Teardown order in `mira220_remove` creates a Use-After-Free / NULL=
 pointer dereference race with `mira220_set_ctrl`.
- [High] The device can be unexpectedly runtime suspended during probe, lea=
ding to I2C communication failures.
- [High] Unconditional dereference of `ep_cfg.link_frequencies` crashes the=
 kernel if the `link-frequencies` property is missing from the device tree.
- [Medium] The `mira220_set_pad_format` function unconditionally resets the=
 user-configured `vblank` control back to its minimum limit on every format=
 access.
- [Medium] Missing delays in the hardware power-on sequence before attempti=
ng I2C communication.
- [Low] Missing Kconfig dependency and select statements for V4L2_FWNODE an=
d VIDEO_V4L2_SUBDEV_API.
--

--- Patch [2]: [PATCH v8 2/2] media: i2c: Add driver for AMS-OSRAM Mira220 =
---
commit d6f8c2bd4b0b5b01ffb4db66a1a981625b434f77
Author: Philippe Baetens <philippebaetens@gmail.com>

media: i2c: Add driver for AMS-OSRAM Mira220
   =20
Add a V4L2 subdev driver for driver for the AMS-OSRAM Mira220 image sensor.
The driver implements support for mono and RGB 12, 10 and 8 bits formats.

> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 5c52007f9cbeb..650d5c86baa4d 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -313,6 +313,18 @@ config VIDEO_IMX678
>  config VIDEO_MAX9271_LIB
>  	tristate
> =20
> +config VIDEO_MIRA220
> +	tristate "ams MIRA220 sensor support"
> +	depends on I2C && VIDEO_DEV
> +	depends on GPIOLIB
> +	select V4L2_CCI_I2C

[Severity: Low]
Are we missing dependencies on V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API here?

If a configuration enables VIDEO_MIRA220 but leaves CONFIG_V4L2_FWNODE
or CONFIG_VIDEO_V4L2_SUBDEV_API disabled, it looks like the build might
fail with undefined references since the driver heavily relies on functions
from these modules.

> diff --git a/drivers/media/i2c/mira220.c b/drivers/media/i2c/mira220.c
> new file mode 100644
> index 0000000000000..8b9148efc581e
> --- /dev/null
> +++ b/drivers/media/i2c/mira220.c

[ ... ]

> +static int mira220_power_on(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct mira220 *mira220 =3D to_mira220(sd);
> +	int ret;
> +
> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(mira220_supplies),
> +				    mira220->supplies);
> +	if (ret) {
> +		dev_err(&client->dev, "%s: failed to enable regulators\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(mira220->xclk);
> +	if (ret) {
> +		dev_err(&client->dev, "%s: failed to enable clock\n", __func__);
> +		goto reg_off;
> +	}
> +
> +	gpiod_set_value_cansleep(mira220->reset_gpio, 0);
> +
> +	return 0;
> +}

[Severity: Medium]
Should there be a delay before returning here?

After de-asserting the reset GPIO line, the driver returns and the probe
sequence proceeds directly to mira220_identify_module(), which begins I2C
reads to the OTP memory.

If the sensor requires a minimum delay after reset de-assertion to boot its
internal microcontroller, skipping this delay could cause I2C communication
to fail on faster platforms.

[ ... ]

> +static int mira220_set_pad_format(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state,
> +				  struct v4l2_subdev_format *fmt)
> +{

[ ... ]

> +	/* Update vblank based on new mode. */
> +	min_vblank =3D mira220_calc_min_vblank(mira220);
> +	ret =3D __v4l2_ctrl_modify_range(mira220->vblank, min_vblank,
> +				       MIRA220_MAX_VBLANK, 1, min_vblank);
> +	if (ret)
> +		return ret;
> +
> +	return __v4l2_ctrl_s_ctrl(mira220->vblank, min_vblank);
> +}

[Severity: Medium]
Does this inadvertently wipe out custom user configurations?

Whenever userspace configures the format via VIDIOC_SUBDEV_S_FMT, the
driver calls __v4l2_ctrl_modify_range() to adjust the vblank control limits.

However, explicitly calling __v4l2_ctrl_s_ctrl() to force the value to
min_vblank overrides whatever value the user had previously configured or
clamped to, which seems to violate V4L2 API expectations for control
orthogonality.

[ ... ]

> +static int mira220_parse_endpoint(struct device *dev, struct mira220 *mi=
ra220)
> +{

[ ... ]

> +	if (ep_cfg.nr_of_link_frequencies > ARRAY_SIZE(mira220_link_freqs)) {
> +		ret =3D -EINVAL;
> +		dev_err(dev, "Unsupported number of link_frequencies: %u\n",
> +			ep_cfg.nr_of_link_frequencies);
> +		goto error_out;
> +	}
> +
> +	if (ep_cfg.link_frequencies[0] !=3D MIRA220_LINK_FREQ_750M) {

[Severity: High]
Can this dereference a NULL pointer if the device tree omits the
link-frequencies property?

If v4l2_fwnode_endpoint_alloc_parse() parses an endpoint without a
link-frequencies property, it successfully returns 0 but leaves
ep_cfg.link_frequencies as NULL and ep_cfg.nr_of_link_frequencies as 0.

Since the check directly above only tests if nr_of_link_frequencies is
greater than the array size, an empty property evaluates to false (0 > 1).
The code then immediately accesses ep_cfg.link_frequencies[0], which would
dereference the NULL pointer.

[ ... ]

> +static int mira220_probe(struct i2c_client *client)
> +{

[ ... ]

> +	ret =3D mira220_power_on(dev);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable runtime PM and power on the device */
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	ret =3D mira220_identify_module(mira220);

[Severity: High]
Is there a race condition here where the device might be suspended during
probe?

Enabling runtime PM with pm_runtime_enable() while the device usage count is
0 makes the device eligible for suspension immediately.

If userspace has set power/control to auto, a concurrent suspend operation
could call mira220_power_off() exactly as mira220_identify_module() or
mira220_init_controls() are attempting to perform hardware I2C reads, causi=
ng
initialization to fail.

Would it be safer to call pm_runtime_get_noresume(dev) before enabling
runtime PM, and then drop the reference at the end of the probe function?

[ ... ]

> +static void mira220_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct mira220 *mira220 =3D to_mira220(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(&mira220->sd);
> +	media_entity_cleanup(&sd->entity);
> +
> +	v4l2_ctrl_handler_free(mira220->sd.ctrl_handler);

[Severity: High]
Could this cleanup order trigger a use-after-free or NULL pointer
dereference?

Calling v4l2_subdev_cleanup() frees sd->active_state and sets it to NULL,
but the control handler is still active and registered at this point.

If userspace unbinds the driver via sysfs while concurrently issuing a
VIDIOC_S_CTRL ioctl on an open file descriptor, mira220_set_ctrl() could
execute during this window:

mira220_set_ctrl() {
    ...
    state =3D v4l2_subdev_get_locked_active_state(&mira220->sd);
    format =3D v4l2_subdev_state_get_format(state, 0);
}

Since mira220_set_ctrl() acquires the control lock and expects the state to
be valid, this sequence would dereference the freed state. Calling
v4l2_ctrl_handler_free() before v4l2_subdev_cleanup() might avoid this race.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-mira220-v8=
-0-d1899ab64709@ideasonboard.com?part=3D2
