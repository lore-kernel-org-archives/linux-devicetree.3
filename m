Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704277;
	b=1hgWejp4lhTZ/bnpjv2m8+s3Hhw6cpG62CWvG8VKeXDgu+/Jitn3OeLqRwi3Bf2jioTU
	 vo1cHTmQbtwf7VUPP+pxQTbnswQwWsFOX2wsNw67SppDkDU/dd8byUTTvXDgMrZFguOP/
	 YBHbpkOjbTzQYR1o4zjyexJYjdManp5yjPCYW2WGW68GM8JZ1HCWFAxWv2QmOu7cMhL7d
	 4kl61NABVkSJcVfNvusiJ2aau8KwcKhVrsLWIqx5+lcp+s5S1LfHpZYTlEP1VSP9yzFJ7
	 ZFuxLEc2fHhSy5ct+T92vmE+XjzHmFcksxssT3QavNqH+przSDZRlMrtD5P4xtSp/4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704277;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mNhaXtVv+BDtcKBxgd60B9NR3VstEDLErzkJIhE7sbE=;
	b=LyiCv9cicGP6vzjEHdjkcS9QY9TP1bKMctDwzZoTVJSKL+gA+3uOUXLjfPlXyvikpf28
	 fcjngEqeMQkZjtXpWPoA+gYfqpB3pa+sFXwkeZmk1tofNprDsBFmWD8K6cDNaqQrQqlfT
	 jab+Sg0lpvlNsq5grecUlgwBGLlW+vy6AgM2ovZuGaV6eoU0EMXUpulOqK1eyNtU97XBB
	 snoj63gO4UK12QHW9lmvzryxCxifTWRNukLMqnLRrbvJPANN+MRo/w3i1ISmDHrHYOw8P
	 bPcacaCUkPt79C/L69NQJV9lEnyfI3dgLM+hw90uNAT4IVc5ZN0fYgLehC5e0rxz1TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TcVZ/fQ3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12122606FAF7
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 11:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcVZ/fQ3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A741F000C1;
	Tue,  3 Nov 2026 11:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793704276;
	bh=mNhaXtVv+BDtcKBxgd60B9NR3VstEDLErzkJIhE7sbE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TcVZ/fQ30MDvOMjMW/xnKuG97RLUxIsyOQeGl/hXCaoC4X9lCyQaq8+X5mLZitCa9
	 olQY+Z0inJCpkflLWtDB1HnHgf0/zPgulpJX0CE3nwVrtd1G3F1ojdKnjCXG0dQxyl
	 C66vQUWLCYMcU4FBYKIDyUvhpOw0KvTmtCyCowNQ0aVxR6mF9pIFL8RckDyR68jfTB
	 JO/bNYdnMzfFVGg4InJp4I0dSxB8gBTZOHxeCaKhT1ahXS/G5E+8XpU2qKXMrd8YSH
	 vNWWLwDOeWXhCH+EW+PH+z0xtYf2VJioAt1WEoPDdbcmnIPkWynrh5Ur+UTz3VHHzd
	 rz0EoWXtvUwKA==
Message-ID: <sashiko-outbox-195119@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] media: i2c: Add ST VD55G0 global shutter sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergey Lebedev" <lsa.uz@pm.me>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261103103235.94397-3-lsa.uz@pm.me>
References: <20261103103235.94397-1-lsa.uz@pm.me>
 <20261103103235.94397-3-lsa.uz@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 11:11:16 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] media: i2c: vd55g0: volatile auto-exposure values lost on runtim=
e suspend
- [Medium] media: i2c: vd55g0: missing pm_runtime_get_noresume() in vd55g0_=
probe()
- [Low] media: i2c: vd55g0: wrap dev_pm_ops with pm_ptr() and RUNTIME_PM_OP=
S()
--

commit 4ee425e92cc09cc24222143b83ab50039d6092fe
Author: Sergey Lebedev <lsa.uz@pm.me>

media: i2c: Add ST VD55G0 global shutter sensor driver

This commit adds a V4L2 subdevice driver for the STMicroelectronics VD55G0
644x604 monochrome global shutter camera sensor over MIPI CSI-2, supporting
Y8 and Y10 formats, firmware patching, auto-exposure clustering, and DT/ACPI
enumeration.

> diff --git a/drivers/media/i2c/vd55g0.c b/drivers/media/i2c/vd55g0.c
> new file mode 100644
> index 0000000000000..3b51a87e740f5
> --- /dev/null
> +++ b/drivers/media/i2c/vd55g0.c
> @@ -0,0 +1,2434 @@

[ ... ]

> +static void vd55g0_save_exposure(struct vd55g0_dev *sensor)
> +{
> +	u64 val;
> +
> +	/* On a read error, keep what the previous stream left */
> +	if (!vd55g0_read(sensor, VD55G0_REG_APPLIED_COARSE_EXPOSURE, &val, NULL=
))
> +		sensor->cold_start.expo =3D val;
> +	if (!vd55g0_read(sensor, VD55G0_REG_APPLIED_DIGITAL_GAIN, &val, NULL))
> +		sensor->cold_start.digital_gain =3D val;
> +	if (!vd55g0_read(sensor, VD55G0_REG_APPLIED_ANALOG_GAIN, &val, NULL))
> +		sensor->cold_start.analog_gain =3D val;
> +}

[ ... ]

> +/* Under auto exposure, the manual controls read what the sensor applies=
 */
> +static int vd55g0_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct vd55g0_dev *sensor =3D to_vd55g0_dev(ctrl_to_sd(ctrl));
> +	struct device *dev =3D &sensor->i2c_client->dev;
> +	u64 expo, again, dgain;
> +	int ret =3D 0;
> +
> +	if (ctrl->id !=3D V4L2_CID_EXPOSURE_AUTO)
> +		return -EINVAL;
> +
> +	/* Only a powered sensor has applied values; keep the last ones */
> +	if (!pm_runtime_get_if_in_use(dev))
> +		return 0;
> +
> +	vd55g0_read(sensor, VD55G0_REG_APPLIED_COARSE_EXPOSURE, &expo, &ret);
> +	vd55g0_read(sensor, VD55G0_REG_APPLIED_ANALOG_GAIN, &again, &ret);
> +	vd55g0_read(sensor, VD55G0_REG_APPLIED_DIGITAL_GAIN, &dgain, &ret);
> +	if (!ret) {
> +		sensor->expo_ctrl->val =3D expo;
> +		sensor->again_ctrl->val =3D again;
> +		sensor->dgain_ctrl->val =3D dgain;
> +	}
> +
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return ret;
> +}

[Severity: Medium]
When the sensor is runtime-suspended after streaming under
V4L2_EXPOSURE_AUTO, will returning 0 from vd55g0_g_volatile_ctrl() actually
preserve the last applied values on sensor->expo_ctrl, sensor->again_ctrl,
and sensor->dgain_ctrl?

Before invoking .g_volatile_ctrl(), the V4L2 control framework callers
(get_ctrl(), v4l2_g_ext_ctrls_common(), and update_from_auto_cluster()) call
cur_to_new() on each control in the cluster, which overwrites ctrl->val with
ctrl->cur.val.

When vd55g0_g_volatile_ctrl() runs while powered on, it only updates
ctrl->val, and vd55g0_save_exposure() in vd55g0_stream_disable() only saves
the hardware values into sensor->cold_start without updating cur.val on
sensor->expo_ctrl, sensor->again_ctrl, and sensor->dgain_ctrl (unlike
vd55g1_read_expo_cluster() and vd56g3_read_expo_cluster()).

Once the device suspends, won't reading those controls or switching
V4L2_CID_EXPOSURE_AUTO to V4L2_EXPOSURE_MANUAL revert to the stale manual
defaults in ctrl->cur.val instead of keeping the last applied exposure and
gain values?

[ ... ]

> +static int vd55g0_probe(struct i2c_client *client)
> +{

[ ... ]

> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	ret =3D v4l2_async_register_subdev(&sensor->sd);
> +	if (ret) {
> +		dev_err(&client->dev, "async subdev register failed %d\n", ret);
> +		goto error_pm_runtime;
> +	}
> +
> +	/* Runtime PM may power the sensor down only from here on */
> +	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> +	pm_runtime_use_autosuspend(&client->dev);
> +	pm_runtime_idle(dev);
> +
> +	dev_dbg(&client->dev, "vd55g0 probe successfully\n");
> +
> +	return 0;
> +
> +error_put_handle:
> +	fwnode_handle_put(handle);
> +
> +	return ret;
> +
> +error_pm_runtime:
> +	pm_runtime_disable(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +	v4l2_subdev_cleanup(&sensor->sd);
> +error_media_entity:
> +	media_entity_cleanup(&sensor->sd.entity);
> +error_handler_free:
> +	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
> +error_power_off:
> +	mutex_destroy(&sensor->lock);
> +	vd55g0_power_off(dev);
> +
> +	return ret;
> +}

[Severity: Medium]
In vd55g0_probe(), pm_runtime_enable(dev) is called while the runtime PM
usage count is 0, prior to v4l2_async_register_subdev() and prior to
configuring autosuspend.

First, on the normal probe path, calling pm_runtime_set_autosuspend_delay()
while runtime PM is enabled, usage_count is 0, and use_autosuspend is still
false causes update_autosuspend() -> rpm_idle() -> rpm_suspend() to
synchronously suspend the sensor inside pm_runtime_set_autosuspend_delay()
before pm_runtime_use_autosuspend() is called.

Second, because usage_count is 0 during v4l2_async_register_subdev(), runti=
me
PM can already suspend the device (for example via sysfs or a notifier)
before v4l2_async_register_subdev() returns. If registration then fails and
jumps to error_pm_runtime, error_power_off unconditionally calls
vd55g0_power_off(dev) a second time, leading to unbalanced
clk_disable_unprepare() and regulator_bulk_disable() calls.

Should vd55g0_probe() take a runtime reference with
pm_runtime_get_noresume(dev) before pm_runtime_enable(dev) and release it
with pm_runtime_put_autosuspend(dev) after pm_runtime_use_autosuspend() (and
with pm_runtime_put_noidle(dev) on error_pm_runtime)?

[ ... ]

> +static const struct dev_pm_ops vd55g0_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(vd55g0_power_off, vd55g0_power_on, NULL)
> +};
> +
> +static struct i2c_driver vd55g0_i2c_driver =3D {
> +	.driver =3D {
> +		.name  =3D "vd55g0",
> +		.of_match_table =3D vd55g0_dt_ids,
> +		.acpi_match_table =3D vd55g0_acpi_ids,
> +		.pm =3D &vd55g0_pm_ops,
> +	},

[Severity: Low]
This isn't a bug, but could vd55g0_pm_ops use RUNTIME_PM_OPS() (or
DEFINE_RUNTIME_DEV_PM_OPS()) and wrap the .pm assignment in
vd55g0_i2c_driver with pm_ptr(&vd55g0_pm_ops) so the PM ops and callbacks c=
an
be eliminated by the compiler when CONFIG_PM is disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103103235.9439=
7-1-lsa.uz@pm.me?part=3D2
