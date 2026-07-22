Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE0D471275
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705706; cv=none; b=gAaDZCL72Ti9QDf3fZCYDB7IWwKboFEXpwTX5Db9reQG+nTE4e/G3MOJvCA5UGtWqe9iKWbrb/6rUbaP0k0OGcy9bSXgZ60uLaj3hrvnzGk9ZzneQoLNJfZCGHtRR6v1XYMcfaBju72ECo3DMXcU6E/S2X1iHT/dJfZDKoFeUqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705706; c=relaxed/simple;
	bh=CDpswABAB+YvNmrgCP1+l60YufrOKupD3PIR3tOwFJA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=glC1eQNFnAcQJg0ERzf94PRzwsyXa89CkVTTjNzb+2RIbNp/qEyJEiDfgJ1olfzHLuYcT/qiaILWynaWM8jeqZQAbX7usoXrdynYHKMynpRdO/X2qVtvZjWXd+5UDZRNBhyEshFliQFlp8LVcywqf48u5LE6j42Rnj63EvxeajM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzUUL+tG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzUUL+tG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8763B1F000E9;
	Wed, 22 Jul 2026 07:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784705700;
	bh=UwfocyOY2C6hEp+suIt4tqvs4o5htyexY1qv2JHQEDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nzUUL+tGyISgE181McOJzxpjHvQ30OUOPk/JhhX2ZFPBtVAJhCPJrrusapxUKqRHd
	 B9M3FcS9FG6XrlKZ7/2P+dms3NkZzzNCf9zwPLfxBQvKzMotY3PqhhAlcaKHVnyTIz
	 MPGLMUtgT++5NJap3Af341LcYazWyEo4DBjHtR6cosegE/6YvTfxmgzXUWT6JQwhG9
	 WPrsyDxv6Fm9RXKPTPwkEkTD6QiW4SimSoAzWq97FuV1rp7OivRtBlIxge579QYmDY
	 FHYimC49pINvdSVuSOwjjxfKM0qqLQ31T2z2jWZIYfbSaQLs+seCxG6/bsYJbCQLZ3
	 3A3a0V2lWmRQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] media: i2c: add driver for ITE IT6625/IT6626
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260722-upstream-it6625-it6626-v4-2-c03362eb55ca@ite.com.tw>
References: <20260722-upstream-it6625-it6626-v4-0-c03362eb55ca@ite.com.tw>
 <20260722-upstream-it6625-it6626-v4-2-c03362eb55ca@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 07:34:59 +0000
Message-Id: <20260722073500.8763B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:

New issues:
- [High] Kernel stack memory leak in debugfs read handlers due to unhandled=
 I2C read errors.
- [High] `devm_kzalloc` allocated subdev state causes Use-After-Free on unb=
ind when devnode is kept open.
- [Medium] Dropping `it6625_lock` during `it6625_set_fmt` active hardware u=
pdate allows software and hardware format states to become desynchronized.
- [Medium] `it6625_mipi_reg_show` destroys clear-on-read CEC data despite t=
he addition of `it6625_lock`.
- [Medium] The `it6625_mipi_reg_write` debugfs handler does not hold `it662=
5_lock` when writing to I2C registers, allowing unlocked hardware state cor=
ruption.
- [Medium] `it6625_get_fmt` returns the active hardware colorspace for `V4L=
2_SUBDEV_FORMAT_TRY` queries instead of the colorspace corresponding to the=
 TRY format code.
- [Medium] `it6625_set_fmt` fails to fully update the `V4L2_SUBDEV_FORMAT_T=
RY` state when changing the format code.
- [Medium] The `IT6625_CID_HDMI_INFO` control returns a hardcoded fake stri=
ng instead of actual HDMI signal telemetry.
- [Medium] Improper handling of EDID clear (blocks =3D=3D 0) leading to sta=
le EDID presentation and unwarranted HPD re-enablement.
- [Medium] HPD (Hot Plug Detect) is left permanently disabled if an EDID wr=
ite fails or is rejected.
- [Medium] The hardware chip is never reset during initialization, and the =
configured `reset_gpio` is entirely ignored.

Pre-existing issues:
- [High] Concurrent `VIDIOC_SUBDEV_S_EDID` ioctl can reschedule `hpd_delaye=
d_work` after it was canceled in `remove()`, causing Use-After-Free.
--

--- Patch [2]: [PATCH v4 2/2] media: i2c: add driver for ITE IT6625/IT6626 =
---
commit 9de860756e68e82de3e6ffd1476fff4cd4807eab
Author: Hermes Wu <Hermes.wu@ite.com.tw>

media: i2c: add driver for ITE IT6625/IT6626

Adds a V4L2 subdevice driver for the ITE IT6625/IT6626 HDMI-to-MIPI CSI-2
bridge chips.

> diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
> index 0000000000000..ea4c84c83abbb
> --- /dev/null
> +++ b/drivers/media/i2c/it6625.c
> @@ -0,0 +1,2155 @@

[ ... ]

> +	u8 csi_format;
> +	u32 mbus_fmt_code;
> +
> +	struct gpio_desc *reset_gpio;
> +
> +	struct cec_adapter *cec_adap;

[Severity: Medium]
Is reset_gpio intended to be used during initialization? The GPIO descriptor
is defined in the state structure but doesn't appear to be requested or
toggled during probe or hardware setup. Could this leave the hardware in an
unknown state after a kexec or unbind/rebind?

[ ... ]

> +static int it6625_get_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_format *format)
> +{
[ ... ]
> +	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		format->format.colorspace =3D format_to_colorspace(it6625->csi_format);
> +		fmt =3D v4l2_subdev_state_get_format(sd_state, format->pad);
> +		format->format.code =3D fmt->code;
> +	} else {

[Severity: Medium]
Does this return the active hardware colorspace for TRY format queries? By
evaluating format_to_colorspace() on the active it6625->csi_format rather
than the format code stored in the TRY state, userspace might receive mixed
or incorrect state information.

[ ... ]

> +static int it6625_set_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_format *format)
> +{
[ ... ]
> +	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		fmt =3D v4l2_subdev_state_get_format(sd_state, format->pad);
> +		fmt->code =3D format->format.code;
> +		v4l2_dbg(1, debug, sd, "%s: try format code =3D 0x%x",
> +			 __func__, format->format.code);
> +		return 0;
> +	}

[Severity: Medium]
Should this also update fmt->colorspace when fmt->code is modified? If
only the format code is updated, the TRY state might be left with a
mismatched colorspace and format code.

[ ... ]

> +	scoped_guard(mutex, &it6625->it6625_lock) {
> +		it6625->csi_format =3D it6625_formats[ret].csi_format;
> +		it6625->mbus_fmt_code =3D format->format.code;
> +	}
> +	it6625_enable_stream(it6625, false);
> +	it6625_set_mipi_config(it6625, it6625->csi_format);
> +
> +	return 0;
> +}

[Severity: Medium]
Can dropping the lock here lead to hardware desynchronization?

If a concurrent VIDIOC_SUBDEV_S_FMT ioctl preempts this thread right after
the scoped_guard finishes, the active software format could be overwritten
and programmed to hardware by the second thread. When this thread resumes, =
it
might configure the hardware with its older it6625->csi_format value,
breaking synchronization between the V4L2 software state and the hardware.

[ ... ]

> +static int it6625_s_edid(struct v4l2_subdev *sd,
> +			 struct v4l2_subdev_edid *edid)
> +{
[ ... ]
> +	it6625_disable_hpd(it6625);
> +
> +	if (edid->blocks !=3D 0) {
> +		err =3D it6625_write_edid(it6625, edid->edid,
> +					edid->start_block, edid->blocks);
> +		if (err < 0) {
> +			v4l2_err(sd, "write edid failed");
> +			return err;
> +		}
> +	}

[Severity: Medium]
If it6625_write_edid() fails and returns early, doesn't this leave HPD
permanently disabled since the re-enable logic is skipped?

Also, if userspace passes blocks =3D=3D 0 to clear the EDID, the write is
bypassed entirely.

[Severity: Medium]
Does skipping the write for blocks =3D=3D 0 leave the hardware RAM uncleare=
d?

> +	pa =3D cec_get_edid_phys_addr(edid->edid, edid->blocks * 128, NULL);
[ ... ]
> +	if (hdmi_5v_power_present(it6625)) {
> +		it6625_enable_hpd(it6625);
> +		it6625_s_ctrl_detect_hdmi_5v(sd);
> +	} else {

If blocks =3D=3D 0 skips clearing the EDID RAM, does calling
it6625_enable_hpd() unconditionally here instruct the HDMI source to read
the uncleared, stale EDID?

[ ... ]

> +static int it6625_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +	switch (ctrl->id) {
> +	case IT6625_CID_HDMI_INFO:
> +		snprintf(ctrl->p_new.p_char, ctrl->maximum,
> +			 "RGB444 10bit @ 60Hz");
> +		break;

[Severity: Medium]
Is this telemetry intended to be hardcoded? Returning a static string ignor=
es
the actual HDMI input state, which might mislead userspace applications
relying on this V4L2 control.

[ ... ]

> +static int it6625_edid_ram_show(struct seq_file *s, void *data)
> +{
> +	struct it6625 *it6625 =3D s->private;
> +	u8 reg_buf[256];
> +
> +	it6625_read_edid(it6625, reg_buf, 0, 2);
> +	it6625_regdump_print(s, reg_buf);
> +
> +	return 0;
> +}

[Severity: High]
Could this leak uninitialized stack memory to userspace?

If it6625_read_edid() encounters an I2C failure and returns an error,
reg_buf remains uninitialized but is still passed to
it6625_regdump_print(), which will export the stack contents.

[ ... ]

> +static int it6625_mipi_reg_show(struct seq_file *s, void *data)
> +{
> +	struct it6625 *it6625 =3D s->private;
> +	u8 reg_buf[256];
> +
> +	scoped_guard(mutex, &it6625->it6625_lock)
> +		it6625_read_bytes(it6625, 0x00, reg_buf, sizeof(reg_buf));
> +	it6625_regdump_print(s, reg_buf);
> +
> +	return 0;
> +}

[Severity: High]
Similar to it6625_edid_ram_show(), could this leak uninitialized stack
memory if the bulk read fails?

[Severity: Medium]
Additionally, does this 256-byte bulk read consume and destroy clear-on-read
hardware state? Specifically, reading REG_CEC_RX_DATA (0x20) could silently
drop incoming HDMI CEC messages before the interrupt handler can process
them.

[ ... ]

> +static ssize_t it6625_mipi_reg_write(struct file *file,
> +				     const char __user *user_buf,
> +				     size_t count, loff_t *ppos)
> +{
[ ... ]
> +	if (sscanf(buf, "%X %X", &addr, &val) !=3D 2)
> +		return -EINVAL;
> +
> +	it6625_write_byte(it6625, addr, val);
> +
> +	return count;
> +}

[Severity: Medium]
Is it safe to issue this I2C write without holding it6625_lock? If a
debugfs write alters the register bank selection concurrently with an ongoi=
ng
driver multi-register sequence (like an EDID read that sets the bank first),
the driver might end up accessing the wrong hardware registers.

[ ... ]

> +static int it6625_probe(struct i2c_client *client)
> +{
> +	struct it6625 *it6625;
[ ... ]
> +	it6625 =3D devm_kzalloc(&client->dev, sizeof(struct it6625), GFP_KERNEL=
);
> +	if (!it6625)
> +		return -ENOMEM;

[Severity: High]
Does using devm_kzalloc() for the state structure risk a use-after-free on
unbind? If a userspace process holds the V4L2 devnode open during driver
unbind, the it6625 structure will be freed immediately when remove()
returns. Later, when the file descriptor is closed, v4l2_subdev_release()
might dereference the freed memory.

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
> +	cancel_delayed_work_sync(&it6625->hpd_delayed_work);
> +	debugfs_remove_recursive(it6625->debugfs_dir);
> +	cec_unregister_adapter(it6625->cec_adap);
> +	mutex_destroy(&it6625->it6625_lock);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(&it6625->hdl);
> +}

[Severity: High]
This is a pre-existing issue, but can an in-flight VIDIOC_SUBDEV_S_EDID
ioctl race with driver removal?

If the ioctl is executing concurrently with it6625_remove(), it could call
it6625_enable_hpd() and re-arm hpd_delayed_work after
cancel_delayed_work_sync() has already finished and the mutex has been
destroyed. This could result in a use-after-free when the workqueue runs on
the freed it6625 structure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-upstream-i=
t6625-it6626-v4-0-c03362eb55ca@ite.com.tw?part=3D2
