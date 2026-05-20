Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5695132B9B5
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779293200; cv=none; b=sw0exku7nZzbWNYUrBM+PDHprZvUOiMJ6m2aGOYmYncqTkdULGApVdwcSmBkhB/NmL+5+JUJcKVfa2eVoRY5PzgoJ4vaMmYpavuTYvmOWL1f/opDwm9zgwpPLBRe1LHuvPsRsHKCMzKLJFr4dQJQ6xcF1rCIRHAvTNyRDI6HxQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779293200; c=relaxed/simple;
	bh=W1laInHs/mgWUNCalLOYXRe/njP2imaMaD0araxGTos=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=as7G2o8mNWQRqMCDjCj4MFXn/xadYAw1zlrN1Dy+l3FmZ6JwCOs+pYyPcrZE3CpzSYp88k0LJQ1ZHuM0gk0/YLmvVjBJECN8X3Q63x2Q4Z0P5+GTIi99hjuKwfeZW/EEelzppkQbznqBQXxtKFxcmMMXnWJ6zQR2jjYrchhoPAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bdds8as/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bdds8as/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2BA1F000E9;
	Wed, 20 May 2026 16:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779293199;
	bh=QzMUTPrxoM/cXipmt8w/Jjs/+rv/CeDt3Gng93l7Cuw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bdds8as/X6angnbBNa4U2hP0UT8pVIrGE7xsFfmV2ITrnNP14P3e/tpK1Y8wTeMxP
	 h6ovWiAit85twHy/6gK05xCoGTLD+Z8riDQDsC1l91djVmyxJg4/kH3qvhvm09q/6R
	 VdoCWCKA6NgtbPXD4EAjExAiVszQvdcz0A0sPN92otQI0p3LB1VzG4Tm8GqeiNxKwm
	 ZqScvvLhpjvC74vo9WyKn9SPtykwY6gritE5BtkREDy13zCo6IMDkX4r2yIfDoPV/c
	 P5U3XytRW/JoMe6cedBuzszI4Agcbl1XimRejzQ1mK7oQ6qq2EUcNTZrsKdLmJm0AK
	 JdsOIpSEUCm/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: imx678: Add driver for Sony IMX678
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jai Luthra" <jai.luthra@ideasonboard.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260520-imx678-v3-2-8b5f9676486e@ideasonboard.com>
References: <20260520-imx678-v3-2-8b5f9676486e@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 16:06:37 +0000
Message-Id: <20260520160638.7F2BA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Incorrect check of `pm_runtime_get_if_in_use()` in `imx678_set_ctr=
l()` causes usage count underflow and unsafe hardware access.
- [High] Crop selection boundaries destroy hardware alignment and can excee=
d the active pixel area.
- [High] Freeing the V4L2 active state before destroying controls in `remov=
e()` and probe error path creates a Use-After-Free vulnerability.
- [Medium] Incorrect upper bound calculation for crop rectangle `rect.top` =
restricts the cropping range.
- [Medium] I2C read errors during module identification are masked, breakin=
g probe deferral.
- [Medium] Unbalanced power off in the probe error path can cause a double =
disable of clocks and regulators.
- [Low] The `dev_pm_ops` structure is assigned without the `pm_ptr()` wrapp=
er, causing dead code when CONFIG_PM is disabled.
--

commit bd147d0e8951d7c1d3269dbbc351c621e16146eb
Author: Jai Luthra <jai.luthra@ideasonboard.com>

media: i2c: imx678: Add driver for Sony IMX678

Add a V4L2 subdev driver for the Sony IMX678 image sensor supporting
monochrome and color variants, configurable resolutions, crop, exposure,
and gain control.

> diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
> new file mode 100644
> index 0000000000000..5ac710b7e38b6
> --- /dev/null
> +++ b/drivers/media/i2c/imx678.c

[ ... ]

> +static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct imx678 *imx678 =3D container_of(ctrl->handler, struct imx678, ct=
rl_handler);
> +	struct v4l2_subdev_state *state;
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&imx678->sd);
> +	const struct v4l2_mbus_framefmt *format;
> +	int ret =3D 0;
> +
> +	state =3D v4l2_subdev_get_locked_active_state(&imx678->sd);
> +	format =3D imx678_state_format(state);

[ ... ]

> +	/*
> +	 * Applying V4L2 control value only happens
> +	 * when power is up for streaming
> +	 */
> +	if (pm_runtime_get_if_in_use(&client->dev) =3D=3D 0)
> +		return 0;

[Severity: High]
Does this correctly handle the case where pm_runtime_get_if_in_use() returns
a negative error code?

If it returns a negative value (such as -EINVAL when runtime PM is disabled=
),
this condition evaluates to false. The driver will then proceed to access t=
he
hardware and call pm_runtime_put(). Since the usage count was not increment=
ed
by the failed get, will the put operation cause a reference count underflow
warning and perform an unsafe hardware access?

[ ... ]

> +static int imx678_set_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_selection *sel)
> +{

[ ... ]

> +	/* Align left, top to 4 */
> +	rect.left =3D clamp_t(s32, ALIGN(sel->r.left, IMX678_CROP_HST_ALIGN),
> +			    imx678_active_area.left,
> +			    imx678_active_area.width - IMX678_PIXEL_ARRAY_MIN_WIDTH);
> +	rect.top =3D clamp_t(s32, ALIGN(sel->r.top, IMX678_CROP_VST_ALIGN),
> +			   imx678_active_area.top,
> +			   imx678_active_area.height - IMX678_PIXEL_ARRAY_MIN_HEIGHT);

[Severity: Medium]
Is this upper bound calculation for rect.top correct given the active area
offset?

Because the active area starts at an offset of imx678_active_area.top (20),
imx678_active_area.height - IMX678_PIXEL_ARRAY_MIN_HEIGHT evaluates to
2180 - 956 =3D 1224. Shouldn't the valid maximum actually be 20 + 2180 - 95=
6,
which is 1244?

It appears the current formula restricts the crop rectangle from reaching
the bottom 20 lines of the sensor's active array.

> +	/* Align width to 16 and height to 4 */
> +	rect.width =3D clamp_t(u32, ALIGN(sel->r.width, IMX678_CROP_HWIDTH_ALIG=
N),
> +			     IMX678_PIXEL_ARRAY_MIN_WIDTH, imx678_active_area.width);
> +	rect.height =3D clamp_t(u32, ALIGN(sel->r.height, IMX678_CROP_VWIDTH_AL=
IGN),
> +			      IMX678_PIXEL_ARRAY_MIN_HEIGHT, imx678_active_area.height);
> +
> +	rect.width =3D min_t(u32, rect.width, imx678_native_area.width - rect.l=
eft);

[Severity: High]
Can this min_t() calculation break the hardware alignment and cause the
crop rectangle to exceed the active pixel area?

For example, if rect.left is 4 and rect.width is 3856,
min_t(3856, 3857 - 4) evaluates to 3853. This truncates the width to an
unaligned value since 3853 is not a multiple of 16.

Also, since the active area width is 3856, will an end position of
4 + 3853 =3D 3857 exceed the sensor's active width and cause it to read
optical black pixels?

[ ... ]

> +static int imx678_identify_model(struct imx678 *imx678)
> +{
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&imx678->sd);
> +	const struct imx678_model_info *info;
> +	enum imx678_type detected;
> +	int ret =3D 0;
> +	u64 val =3D 0;
> +
> +	info =3D of_device_get_match_data(&client->dev);
> +
> +	/*
> +	 * This sensor's ID registers become accessible 80ms after coming out
> +	 * of STANDBY mode.
> +	 */
> +	cci_write(imx678->cci, IMX678_REG_MODE_SELECT, 0, &ret);
> +	fsleep(IMX678_MODULE_ID_DELAY);
> +
> +	cci_read(imx678->cci, IMX678_REG_MODULE_ID, &val, &ret);
> +
> +	if (val !=3D IMX678_ID) {

[Severity: Medium]
Should the return value (ret) be checked before evaluating the read value?

If the I2C read fails and returns an error like -EPROBE_DEFER or
-EREMOTEIO, val remains 0. The code will then evaluate 0 !=3D IMX678_ID,
assume the wrong chip is present, and return -ENXIO. This might mask
critical errors and break probe deferral.

> +		dev_err(&client->dev,
> +			"Chip ID mismatch: %x!=3D%llx\n", IMX678_ID, val);
> +		return -ENXIO;
> +	}

[ ... ]

> +static int imx678_probe(struct i2c_client *client)
> +{

[ ... ]

> +error_subdev_cleanup:
> +	v4l2_subdev_cleanup(&imx678->sd);
> +
> +error_media_entity:
> +	media_entity_cleanup(&imx678->sd.entity);
> +
> +error_handler_free:
> +	imx678_free_controls(imx678);

[Severity: High]
Can calling v4l2_subdev_cleanup() before imx678_free_controls() cause a
use-after-free if a concurrent ioctl is running?

v4l2_subdev_cleanup() frees the memory holding the subdevice's active
state. If a concurrent VIDIOC_S_CTRL ioctl is executing, imx678_set_ctrl()
could dereference the freed active_state to access format parameters.

Calling imx678_free_controls() prior to v4l2_subdev_cleanup() acts as a
synchronization barrier because it acquires the control handler lock,
ensuring any executing set_ctrl operations complete before the state is
freed.

> +
> +error_pm_runtime:
> +	pm_runtime_disable(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +
> +error_power_off:
> +	imx678_power_off(&client->dev);

[Severity: Medium]
Can this error path result in an unbalanced power off?

If the device had already been suspended in the background by the PM core
(since there is no get_sync preventing it), pm_runtime_set_suspended()
forces the status to suspended, but then imx678_power_off() is called
unconditionally.

Does this need to check !pm_runtime_status_suspended(&client->dev) before
powering off, similar to how it is handled in the remove() function, to
prevent a double disable of clocks and regulators?

> +
> +	return ret;
> +}
> +
> +static void imx678_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct imx678 *imx678 =3D to_imx678(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +	imx678_free_controls(imx678);

[Severity: High]
Similarly to the probe error path, does calling v4l2_subdev_cleanup() before
imx678_free_controls() create a use-after-free window here during device
removal?

[ ... ]

> +static struct i2c_driver imx678_i2c_driver =3D {
> +	.driver =3D {
> +		.name =3D "imx678",
> +		.of_match_table =3D imx678_of_match,
> +		.pm =3D &imx678_pm_ops,

[Severity: Low]
Should the pm operations pointer be wrapped with pm_ptr()?

Without the wrapper, the imx678_pm_ops structure and its referenced
callbacks (like imx678_power_on and imx678_power_off) will be statically
linked into the kernel even when CONFIG_PM is disabled, producing dead
code.

> +	},
> +	.probe =3D imx678_probe,
> +	.remove =3D imx678_remove,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-imx678-v3-=
0-8b5f9676486e@ideasonboard.com?part=3D2
