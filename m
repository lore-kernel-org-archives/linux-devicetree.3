Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4D1314D05
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 07:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785395605; cv=none; b=ek0vFrmVlSGnLGgC8Y/GfLymoqPQg6HoCuqp62SYFv3Jp85uDXAzT3DHNDDP135qJXqnoPocw6w7tRopg8yxBMrGRxYp/cg4EVqY6lIhhxvu5sSWuKDbMHm02naHTeJSNQmuPiubTgsoLFJKbxLTmSYbXuWM64uUCFboQi0ofUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785395605; c=relaxed/simple;
	bh=1qOUB0XJVc1BD5gDr2l5v9Rc+y5MzXuBkKqIna6SG9E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GxGq0fCIJh0NURSuReL7EyjLJ/iz3Wwq06szBcXT83/2B2/3XInLzodO7a9rglBnB7rJ9RWsRXroddd8AZRALC2AYwA25Jfio/Ulpo520DvKZT0NN7i/PuJSWsQpd00+BpcxQ4MPMzW24Pqf6zmhxguRMkONKawOxpE9NHxSh5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRolR4BU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRolR4BU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758E61F000E9;
	Thu, 30 Jul 2026 07:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395603;
	bh=SSLr9Gd95sXI3DA/5R0odxkM2MFj25sHM4TtjpBwE0w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KRolR4BUGFgyn9+WT5p3O+ffyAbdhQPtYzVJhMHp+Df9GPNzjPKEq33zFMoAjOb0H
	 FjGp+l7SkuG7d+lNm/ajiREp7ctkYYBLlgl9T8QTkEQCC5AmX/U1UVSKsumyvFrnfx
	 ASZjtpcjJ7JTuobqGazTNSa+/LxXaHh1B+0BM7Lp4dWaeRysEAkr/EIoTEPTx+jvIV
	 PSjsL2bTomfISKQBSxS/6lSBBx1QdR/OuBPpzWSTRB+/sc6KZpdhwcdYGJm0C+69tb
	 jYA0joTlJpRUwc56TCuQoynLSFiLn4qmVqKBvEmGCk8zRDFnKPUIX2An5ERfpQJu5k
	 1Q/CEGU3iZ0mw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] media: i2c: add driver for ITE IT6625/IT6626
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260730-upstream-it6625-it6626-v9-2-e7725db2b92f@ite.com.tw>
References: <20260730-upstream-it6625-it6626-v9-0-e7725db2b92f@ite.com.tw>
 <20260730-upstream-it6625-it6626-v9-2-e7725db2b92f@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 07:13:22 +0000
Message-Id: <20260730071323.758E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] devm-allocated state is freed and mutex is destroyed in it6625_rem=
ove() while V4L2 ioctls may still be executing, leading to Use-After-Free.
- [Medium] Missing .init_cfg pad operation results in invalid TRY format on=
 fresh file handles.
- [Medium] Missing function-level serialization in it6625_s_edid causes inc=
onsistent hardware and software state on concurrent ioctl calls.
- [Medium] Incorrect CEC logical address hardware configuration and failure=
 to clear invalid addresses.
- [Medium] Hardcoding the interrupt trigger polarity overrides the board-sp=
ecific Devicetree configuration.
--

--- Patch [2]: [PATCH v9 2/2] media: i2c: add driver for ITE IT6625/IT6626 =
---
commit 9486ba94c24373b516c1402da3bd1eb976b4cc82
Author: Hermes Wu <Hermes.wu@ite.com.tw>

media: i2c: add driver for ITE IT6625/IT6626

Adds a V4L2 subdevice driver for the ITE IT6625/IT6626 HDMI-to-MIPI CSI-2
bridge chips. The bridge is configured over I2C, exposes an HDMI CEC adapte=
r,
and supports EDID and HPD control via standard V4L2 operations.

> diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/i2c/it6625.c
[ ... ]
> +static int it6625_get_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_format *format)
> +{
[ ... ]
> +	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		fmt =3D v4l2_subdev_state_get_format(sd_state, format->pad);
> +		format->format.code =3D fmt->code;
> +		format->format.colorspace =3D fmt->colorspace;

[Severity: Medium]
Could this return an invalid zero-initialized format to userspace?

If a userspace process opens the subdev device node and immediately calls
VIDIOC_SUBDEV_G_FMT for the TRY format, v4l2_subdev_state_get_format() may
read uninitialized memory.

[ ... ]
> +static const struct v4l2_subdev_pad_ops it6625_pad_ops =3D {
> +	.enum_mbus_code =3D it6625_enum_mbus_code,
> +	.set_fmt =3D it6625_set_fmt,

Is the .init_cfg callback missing from the pad operations? Adding it would
ensure the TRY state is properly populated on fresh file handles.

[ ... ]
> +static int it6625_cec_adap_log_addr(struct cec_adapter *adap, u8 log_add=
r)
> +{
> +	struct it6625 *it6625 =3D adap->priv;
> +
> +	dev_dbg(it6625->dev, "%s: la=3D%d", __func__, log_addr);
> +
> +	if (log_addr !=3D CEC_LOG_ADDR_INVALID) {
> +		u8 cmds[2] =3D {CMD_SET_CEC_LA, log_addr};
> +
> +		guard(mutex)(&it6625->it6625_lock);
> +		it6625_write_command(it6625, cmds, sizeof(cmds));
> +	}

[Severity: Medium]
Does this code properly release logical addresses?

When the CEC framework requests to clear a logical address by passing
CEC_LOG_ADDR_INVALID, the callback ignores it. This could cause the
device to keep ACKing messages meant for a released address.

[ ... ]
> +static int it6625_s_edid(struct v4l2_subdev *sd,
> +			 struct v4l2_subdev_edid *edid)
> +{
> +	struct it6625 *it6625 =3D sd_to_6625(sd);
> +	int err =3D 0;
> +	u16 pa;
> +	int pa_err;
[ ... ]
> +	it6625_disable_hpd(it6625);
[ ... ]
> +	err =3D it6625_write_edid(it6625, edid->edid,
> +				edid->start_block, edid->blocks);

[Severity: Medium]
Should it6625_s_edid() hold a lock across its entire execution?

Currently, locks are only held briefly inside sub-functions like
it6625_write_edid(). If multiple threads call VIDIOC_SUBDEV_S_EDID
concurrently on the same file descriptor, the sequence could interleave.

This could result in inconsistent states, for example, leaving the hardware
programmed with one EDID while the CEC subsystem operates with the physical
address of another.

[ ... ]
> +	if (hdmi_5v_power_present(it6625)) {
> +		it6625_enable_hpd(it6625);

[Severity: High]
Can this cause a use-after-free during driver teardown?

If a concurrent VIDIOC_SUBDEV_S_EDID ioctl is executing when the driver is
unbound via sysfs, v4l2_device_unregister_subdev() won't wait for the
ioctl to finish.

[ ... ]
> +static void it6625_remove(struct i2c_client *client)
> +{
[ ... ]
> +	cancel_delayed_work_sync(&it6625->hpd_delayed_work);
> +	debugfs_remove_recursive(it6625->debugfs_dir);
> +	cec_unregister_adapter(it6625->cec_adap);
> +	mutex_destroy(&it6625->it6625_lock);

This means the in-flight ioctl could access the devm-allocated state after
it has been freed in it6625_remove().

Furthermore, since the ioctl schedules hpd_delayed_work, this work could
get scheduled right after cancel_delayed_work_sync() has already completed,
triggering a use-after-free when the work finally runs.

[ ... ]
> +static int it6625_probe(struct i2c_client *client)
> +{
[ ... ]
> +	if (client->irq) {
> +		err =3D devm_request_threaded_irq(&client->dev, client->irq,
> +						NULL, it6625_irq_handler,
> +						IRQF_TRIGGER_LOW |
> +						IRQF_ONESHOT |
> +						IRQF_NO_AUTOEN,

[Severity: Medium]
Would it be safer to omit IRQF_TRIGGER_LOW here?

Hardcoding the interrupt trigger polarity overrides the board-specific
configuration provided by the Devicetree. This might cause the driver to
fail to probe or experience interrupt storms on platforms where the
hardware design requires an active-high interrupt line.

[ ... ]
> +	it6625->cec_adap =3D cec_allocate_adapter(&it6625_cec_adap_ops,
> +						it6625, dev_name(it6625->dev),
> +						CEC_CAP_DEFAULTS |
> +						CEC_CAP_MONITOR_ALL |
> +						CEC_CAP_PHYS_ADDR,
> +						CEC_MAX_LOG_ADDRS);

[Severity: Medium]
Does the driver actually support multiplexing multiple CEC logical addresse=
s?

It requests CEC_MAX_LOG_ADDRS here, but the logical address assignment in
it6625_cec_adap_log_addr() appears to simply overwrite the active address
rather than managing multiple addresses in hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-upstream-i=
t6625-it6626-v9-0-e7725db2b92f@ite.com.tw?part=3D2
