Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687E6298CC4
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632004; cv=none; b=TBvlRYJxjtNtT4emOmn036MctTe0yq/FaF/NaikmbESMCnRg/Mq1y7YdYrCX7T5zuKSrZwEYcjVhmzjyP16CJwYMbeT+Z8GsRYMjGvBSCrQA8rJOgQ3EHao+QZRBnMr77mYAfkdTykVpWi2xD+VFoCbwEDT760KAj8CFtU8GlZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632004; c=relaxed/simple;
	bh=+F4WYdnFm5d5UzOKxx0uJWp8j5fe9+Q11dCyqgQ0yqs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s4RcemruXsRudQE2fK9rIZ5kl+wN3RqBGXWtM3H24XPVj9ZooQxsIO6VZcIlfIHm37ixDz4Icp/p75VfRXRJMedORkhUhY/9y91c3BJtWMXe3XrQ1oXSnd6fOSH5U2Fw8HSw8jBiiz5AxLcq0x8rn3coV/ng6XQx0bUbUd85W4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqYCjM7x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqYCjM7x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C908F1F000E9;
	Tue, 21 Jul 2026 11:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784632003;
	bh=8OUqAEB2yiGCXHN2guJ7xKDF0P2lhEE2kxK28FNiikM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NqYCjM7xtQKkDsg0Tnnsm/XT+nozzUxZlZQO3p1q72tRF0DQBvOA/CWz8Tg5rhKoD
	 zgcN5nf5WQI4gXNL3h57RXHEkkUjiCownVZwGdWVT+1UTja+T/x3jmr5KABNx+WKHg
	 HR4BQ7tzpZyX728g4RJO3TLJOlsLBOvOthVEZggdr2fAY5ANfef0n8K0VG7QP/LVTV
	 c1/DnMPmx8SgfsqZLkuOrkN0cV61sTsJv7yM4LShziczSEsZewipT3VeU7FiEstzb1
	 mGHGNAT2XOpUqkF5OndnXoPbkUY2RFhxsU8axXV8szkUxceB330boL4XpOB4/Re3SB
	 ryxhmYzW3BV/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: add driver for ITE IT6625/IT6626
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-upstream-it6625-it6626-v2-2-7c4f3564ca38@ite.com.tw>
References: <20260721-upstream-it6625-it6626-v2-0-7c4f3564ca38@ite.com.tw>
 <20260721-upstream-it6625-it6626-v2-2-7c4f3564ca38@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 11:06:42 +0000
Message-Id: <20260721110642.C908F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] Interrupt handler and control paths read banked registers without =
taking `it6625_lock`, racing with EDID operations and returning corrupted d=
ata.
- [High] The driver uses `devm_kzalloc` for its state structure while expos=
ing a V4L2 subdevice node, leading to a Use-After-Free.
- [High] The remove function unregisters the V4L2 subdevice before disablin=
g hardware interrupts, timers, and workqueues, creating a Use-After-Free vu=
lnerability.
- [High] A successful EDID write is incorrectly treated as a failure in `it=
6625_s_edid()`, skipping initialization.
- [High] Concurrent execution of the `s_edid` IOCTL and `it6625_remove` all=
ows `hpd_delayed_work` to be scheduled after it was canceled, leading to a =
Use-After-Free.
- [High] Detected timings ignore hardware porch registers, causing V4L2 DV =
timings matching to fail.
- [Medium] `it6625_get_fmt` and `it6625_set_fmt` ignore `V4L2_SUBDEV_FORMAT=
_TRY`, breaking format negotiation.
- [Medium] An invalid CEC RX length causes the handler to return early, dro=
pping any simultaneous CEC TX interrupt.
- [Medium] TOCTOU race when reading CEC RX data length truncates CEC messag=
es.
- [Medium] Unprotected modifications to `csi_format` and `mbus_fmt_code` le=
ad to data races.
- [Low] The polling timer callback uses `timer_container_of()`, which does =
not exist in the Linux kernel.
--

--- Patch [2]: [PATCH v2 2/2] media: i2c: add driver for ITE IT6625/IT6626 =
---
commit 34b36b7727e619c34809d9b0bc1a0bc2102491f6
Author: Hermes Wu <Hermes.wu@ite.com.tw>
Subject: media: i2c: add driver for ITE IT6625/IT6626

Add a V4L2 subdevice driver for the ITE IT6625/IT6626 HDMI-to-MIPI
CSI-2 bridge chips. The bridge is configured over I2C, exposes an
HDMI CEC adapter, and supports EDID read/write, DV timings
detection/configuration, and HPD control.

> diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
> index 0000000000000..689739eb3f190
> --- /dev/null
> +++ b/drivers/media/i2c/it6625.c
> @@ -0,0 +1,2104 @@
[ ... ]
> +static int get_audio_sampling_rate(struct it6625 *it6625)
> +{
> +	u8 fs_id;
> +	int i, freq =3D 0;
[ ... ]
> +	if (no_signal(it6625) || !audio_present(it6625))
> +		return 0;
> +
> +	fs_id =3D it6625_read_byte(it6625, REG_HDMI_AUDIO_INFO1);

[Severity: High]
Is it possible for this unprotected read of REG_HDMI_AUDIO_INFO1 to race
with an EDID read/write operation that temporarily changes the register bank
via REG_INFO_BANK_SEL? This could result in reading corrupt audio sampling
rates.

> +
> +	for (i =3D 0; i < ARRAY_SIZE(s_fsid_map); i++) {
[ ... ]
> +static int it6625_get_detected_timings(struct it6625 *it6625,
> +				       struct v4l2_dv_timings *timings)
> +{
> +	struct v4l2_bt_timings *bt =3D &timings->bt;
[ ... ]
> +	if (it6625_read_bytes(it6625, REG_H_ACTIVE_1, buffer, 8) < 0)
> +		return -EIO;
> +
> +	width =3D ((buffer[0] & 0xff) << 8) + buffer[1];
> +	height =3D ((buffer[2] & 0xff) << 8) + buffer[3];
> +	frame_width =3D ((buffer[4] & 0xff) << 8) + buffer[5];
> +	frame_height =3D ((buffer[6] & 0xff) << 8) + buffer[7];
> +
> +	bt->width =3D width;
> +	bt->height =3D height;
> +	bt->vsync =3D frame_height - height;
> +	bt->hsync =3D frame_width - width;

[Severity: High]
Does this logic break V4L2 DV timings matching by ignoring the dedicated
hardware porch registers?=20

The v4l2_match_dv_timings function enforces strict equality on all porch
components. Grouping the entire blanking interval into hsync and vsync while
leaving the front and back porches at 0 will prevent matching any standard
CEA/VESA format.

> +
> +	bt->pixelclock =3D it6625_get_pclk(it6625);
[ ... ]
> +static void it6625_cec_handler(struct it6625 *it6625, u8 intstatus)
> +{
> +	struct cec_msg rxmsg =3D {};
> +	int val =3D 0;
> +
> +	if (intstatus & B_CEC_RX_RECEIVED) {
> +		val =3D it6625_read_byte(it6625, REG_CEC_RX_DATA_LEN);

[Severity: Medium]
Could this lead to a TOCTOU race? The length is read here outside the
it6625_lock.=20

If the lock is contended (for example, by an EDID operation), the hardware
might receive more bytes during the wait. Once the lock is acquired below,
the stale smaller length is read, and writing 0 to the length register will
cause the newly arrived bytes to be lost.

> +		if (val <=3D 0 || val > 16) {
> +			dev_err(it6625->dev, "invalid CEC RX length %d", val);
> +			return;

[Severity: Medium]
Will this early return inadvertently drop a simultaneous CEC TX interrupt if
both B_CEC_RX_RECEIVED and B_CEC_TX_UPDATE are set in intstatus?

> +		}
> +
> +		scoped_guard(mutex, &it6625->it6625_lock) {
[ ... ]
> +static void it6625_irq_format_change(struct it6625 *it6625)
> +{
> +	struct v4l2_subdev *sd =3D &it6625->sd;
> +	struct v4l2_dv_timings timings;
> +	const struct v4l2_event it6625_ev_fmt =3D {
> +		.type =3D V4L2_EVENT_SOURCE_CHANGE,
> +		.u.src_change.changes =3D V4L2_EVENT_SRC_CH_RESOLUTION,
> +	};
> +	int ret;
> +
> +	if (no_signal(it6625))
> +		return;
> +
> +	ret =3D it6625_get_detected_timings(it6625, &timings);
> +	if (ret < 0) {
> +		v4l2_dbg(1, debug, sd, "Failed to get detected timings");
> +		return;
> +	}
> +
> +	if (sd->devnode)
> +		v4l2_subdev_notify_event(sd, &it6625_ev_fmt);

[Severity: High]
Is it safe to dereference sd->devnode here if this is called from the
polling workqueue after v4l2_device_unregister_subdev() has been executed in
it6625_remove()? This sequence could result in a use-after-free.

> +}
[ ... ]
> +static void it6625_irq_infoframe_latch(struct it6625 *it6625)
> +{
> +	u8 info_frame[32];
> +
> +	it6625_read_bytes(it6625, REG_IF_DATA, info_frame, 31);

[Severity: High]
Does this read of REG_IF_DATA require the it6625_lock? Without it, a
concurrent EDID operation could switch the register bank, causing this read
to return EDID data instead of the infoframe.

> +}
[ ... ]
> +static void it6625_irq_poll_timer(struct timer_list *t)
> +{
> +	struct it6625 *it6625 =3D timer_container_of(it6625, t, timer);

[Severity: Low]
Does the timer_container_of macro exist in the kernel? It seems from_timer
should be used here to avoid compilation errors.

> +	unsigned int msecs;
[ ... ]
> +static int it6625_get_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_format *format)
> +{
> +	struct it6625 *it6625 =3D sd_to_6625(sd);
> +	struct v4l2_dv_timings timings;
> +
> +	if (format->pad !=3D 0)
> +		return -EINVAL;
> +
> +	format->format.code =3D it6625->mbus_fmt_code;
> +	it6625_get_timings(it6625, &timings);

[Severity: Medium]
Should this function return the TRY format from sd_state when format->which
is V4L2_SUBDEV_FORMAT_TRY? Returning the active hardware state here ignores
the TRY semantics and breaks format negotiation.

> +	format->format.width =3D timings.bt.width;
[ ... ]
> +static int it6625_set_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_format *format)
> +{
> +	struct it6625 *it6625 =3D sd_to_6625(sd);
> +	int ret;
> +	u32 mbus_fmt_code =3D format->format.code;
> +
> +	ret =3D it6625_get_fmt(sd, sd_state, format);
> +	format->format.code =3D mbus_fmt_code;
> +
> +	if (ret)
> +		return ret;
> +
> +	ret =3D it6625_csi_mbus_code_idx(mbus_fmt_code);
> +
> +	if (ret < 0) {
> +		v4l2_dbg(1, debug, sd, "%s: unsupported format code 0x%x",
> +			 __func__, mbus_fmt_code);
> +		return ret;
> +	}
> +
> +	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> +		v4l2_dbg(1, debug, sd, "%s: try format code =3D 0x%x",
> +			 __func__, format->format.code);
> +		return 0;

[Severity: Medium]
Does returning early here fail to save the negotiated format to the
v4l2_subdev_state? This would prevent userspace from configuring the
pipeline correctly since the TRY format is never recorded.

> +	}
> +
> +	it6625->csi_format =3D it6625_formats[ret].csi_format;
> +	it6625->mbus_fmt_code =3D format->format.code;

[Severity: Medium]
Are these modifications to the format state subject to data races?=20

Since the driver does not configure sd->devnode->lock to serialize ioctls,
concurrent calls to VIDIOC_SUBDEV_S_FMT might corrupt this state if the
it6625_lock is not acquired.

> +	it6625_enable_stream(it6625, false);
[ ... ]
> +static int it6625_s_edid(struct v4l2_subdev *sd,
> +			 struct v4l2_subdev_edid *edid)
> +{
> +	struct it6625 *it6625 =3D sd_to_6625(sd);
> +	int err;
> +	u16 pa;
> +
> +	if (edid->pad !=3D 0) {
> +		v4l2_err(sd, "invalid pad %d", edid->pad);
> +		return -EINVAL;
> +	}
> +
> +	memset(edid->reserved, 0, sizeof(edid->reserved));
> +
> +	it6625_disable_hpd(it6625);
> +
> +	if (edid->blocks !=3D 0) {
> +		err =3D it6625_write_edid(it6625, edid->edid,
> +					edid->start_block, edid->blocks);
> +		if (err) {
> +			v4l2_err(sd, "write edid failed");
> +			return err;

[Severity: High]
Because it6625_write_edid returns the positive number of blocks on success,
will this condition incorrectly treat a successful write as a failure and
skip the remaining initialization?

> +		}
> +	}
> +
> +	pa =3D cec_get_edid_phys_addr(edid->edid, edid->blocks * 128, NULL);
> +	if (pa =3D=3D CEC_PHYS_ADDR_INVALID) {
> +		v4l2_warn(sd, "invalid CEC physical address in EDID");
> +		cec_phys_addr_invalidate(it6625->cec_adap);
> +	} else {
> +		v4l2_phys_addr_validate(pa, NULL, NULL);
> +		cec_s_phys_addr(it6625->cec_adap, pa, false);
> +	}
> +
> +	if (hdmi_5v_power_present(it6625)) {
> +		it6625_enable_hpd(it6625);

[Severity: High]
If this is called concurrently with it6625_remove, could it6625_enable_hpd
reschedule the hpd_delayed_work after it was already canceled by remove?
This would result in a use-after-free when the devres-managed structure is
destroyed.

> +		it6625_s_ctrl_detect_hdmi_5v(sd);
> +	} else {
> +		it6625_enable_auto_hpd(it6625);
> +	}
[ ... ]
> +static int it6625_probe(struct i2c_client *client)
> +{
> +	struct it6625 *it6625;
> +	struct v4l2_subdev *sd;
> +	int err;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
> +		return -EIO;
> +
> +	it6625 =3D devm_kzalloc(&client->dev, sizeof(struct it6625), GFP_KERNEL=
);

[Severity: High]
Is it safe to tie the lifetime of the it6625 structure to the device bind
lifecycle using devm_kzalloc, given that it exposes a V4L2 subdevice node?
Userspace processes holding an open file descriptor could trigger ioctls th=
at
access this freed memory after the device unbinds.

> +	if (!it6625)
> +		return -ENOMEM;
[ ... ]
> +static void it6625_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct it6625 *it6625 =3D sd_to_6625(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_device_unregister_subdev(sd);
> +
> +	if (client->irq)
> +		disable_irq(client->irq);
> +	else
> +		timer_shutdown_sync(&it6625->timer);
> +
> +	cancel_work_sync(&it6625->polling_work);

[Severity: High]
Does unregistering the subdevice before disabling IRQs, timers, and
workqueues open a window for a use-after-free?=20

An interrupt or timer firing in this window could schedule the polling work,
which would then attempt to access the unregistered and potentially freed
subdevice structures.

> +	cancel_delayed_work_sync(&it6625->hpd_delayed_work);
> +	debugfs_remove_recursive(it6625->debugfs_dir);
> +	cec_unregister_adapter(it6625->cec_adap);
> +	mutex_destroy(&it6625->it6625_lock);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(&it6625->hdl);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-upstream-i=
t6625-it6626-v2-0-7c4f3564ca38@ite.com.tw?part=3D2
