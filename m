Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587E53CB8EF
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535093; cv=none; b=OEKVEJP70NUpKnDQJdMz8Vg8FMOyKKOPhs3CMiVtqJZbS05PdNY3BzPcxg2CgmC9VlhYUc9pteMC0LhH7Yawh6qBL1Oi/2hJTg/ilVLV6o3ULvMiuMNdXPmBu4U7VCpj9pjqpfndg9gt6rzmSZ1NZMMKbyT9mR3IMFvDlv/6Bfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535093; c=relaxed/simple;
	bh=BNKbY5rine4WFAXIXlOQ0UJx/yizl6k/GjkjYmhwQNE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r8fc1u7ClbjuPvFwuGpdRoWBBrPTcc8uv9eaRJdUmfVcNwLUp9OoxmGYTbCHneVc1AoIIsx8vo5HUUz8aVqqC6Vgpa1ASRhk6d15Yh+AAqI5O49n0i4zZg9mNhWp/Ad7XYMubL4G+U/CwBiyxJTTG8J7i+3ZN07sZPb9R8Dz1sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XzCjDCm+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzCjDCm+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E611F000E9;
	Mon, 20 Jul 2026 08:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784535091;
	bh=UF9tuVlJDpnZcpWJCM7SaLuPfDnyE7f6YoRdEOoROGI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XzCjDCm+hnU3VIg7kpKQy4ljGzoJerGW3KlQkMVLuAUX+wcbln6Dq4swJEbiPleG1
	 q3kAxKN7hmCaOGV8yRBrK6FSUQKOqG02pF1Q94dA/SoYrWriKg8N+mRwAsdy8PC0Fj
	 uec/orPPOxQLFpPwEWJIAELnBVLvs8cNppFXLTfe4H65h0p8kBiNMTJa2YJvMnebkS
	 EWIhc3H06ceuA7m7Cs20ATw+k+B/dc4U0o3KnwKD0DFgvdo/I8l89HnhvZxEKQBnr7
	 HWx8mno0N+oHj8RRCs5cSUxqLzl65Oi+hwOMh7y+fNgueELPSpxbCFKP76ch1FHx+6
	 vFY8omSRZy9Ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: i2c: add driver for ITE IT6625/IT6626
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260720-upstream-it6625-it6626-v1-2-475912f74459@ite.com.tw>
References: <20260720-upstream-it6625-it6626-v1-0-475912f74459@ite.com.tw>
 <20260720-upstream-it6625-it6626-v1-2-475912f74459@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 08:11:31 +0000
Message-Id: <20260720081131.A4E611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [High] Premature registration of the V4L2 subdevice exposes uninitialized=
 hardware and control state to the system.
- [High] The probe error path uses non-synchronous `cancel_delayed_work()`,=
 leading to a use-after-free.
- [High] `get_fmt` and `set_fmt` mishandle `V4L2_SUBDEV_FORMAT_TRY` and uns=
upported formats, violating the API and corrupting active state.
- [High] Banked register reads in the threaded interrupt handler and `get_d=
etected_timings` omit mutex locking, causing data corruption.
- [High] An uninitialized stack variable `rxmsg` is passed to the CEC frame=
work, leaking kernel stack memory to userspace.
- [High] The CEC interrupt handler uses an `else if` block, permanently dro=
pping TX completion interrupts if an RX interrupt fires simultaneously.
- [High] Teardown asymmetry in `it6625_remove` cancels background work befo=
re unregistering the subdevice.
- [Medium] The `v4l2_ctrl_handler` memory is leaked on multiple probe error=
 paths.
- [Medium] Incorrect parameters passed to `read_poll_timeout()` severely de=
lay timeouts and defeat the polling mechanism.
- [Medium] EDID capacity querying and clearing fail with `-EINVAL` because =
`blocks =3D=3D 0` is strictly rejected.
- [Medium] The debugfs handler `it6625_mipi_reg_write` misuses `simple_writ=
e_to_buffer` and parses uninitialized stack memory.
- [Medium] `it6625_cec_adap_transmit` sets the hardware transmit trigger bu=
t fails to wait for confirmation, risking aborted transmissions.
- [Low] The `i2c_device_id` array uses positional rather than C99 designate=
d initializers.
--

--- Patch [2]: [PATCH 2/2] media: i2c: add driver for ITE IT6625/IT6626 ---
commit 09bd00239552da9315d71f96392b0c2b3c5769e2
Author: Hermes Wu <Hermes.wu@ite.com.tw>

    media: i2c: add driver for ITE IT6625/IT6626
   =20
    Add a V4L2 subdevice driver for the ITE IT6625/IT6626 HDMI-to-MIPI
    CSI-2 bridge chips. IT6625 accepts an HDMI 2.0 input and IT6626 an
    HDMI 2.1 input, converting it to a D-PHY (or C/D-PHY on IT6626)
    MIPI CSI-2 output. The bridge is configured over I2C, exposes an
    HDMI CEC adapter, and supports EDID read/write, DV timings
    detection/configuration, and HPD control via the standard V4L2
    subdevice pad and video ops.

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
new file mode 100644
index 0000000000000..2c1200dd273b4
--- /dev/null
+++ b/drivers/media/i2c/it6625.c
@@ -0,0 +1,2088 @@
[ ... ]
> +static int it6625_wait_for_status(struct it6625 *it6625, u8 reg, u8 val,
> +				  int timeout_ms)
> +{
> +	struct device *dev =3D it6625->dev;
> +	int status;
> +	int rval;
> +
> +	status =3D read_poll_timeout(it6625_read_byte, rval, rval =3D=3D val,
> +				   50 * 1000,
> +				   timeout_ms * 1000,
> +				   false, it6625, reg);

[Severity: Medium]
Are the parameters to read_poll_timeout() reversed here?

The sleep_us parameter is passed as 50 * 1000 (50ms) while timeout_us is
timeout_ms * 1000 (e.g. 25ms in some callers). Because the sleep duration is
twice the length of the total timeout, if the condition is not met
immediately, won't this sleep for 50ms and unconditionally time out on the
next check, effectively breaking the polling behavior?

[ ... ]
> +static int it6625_read_edid(struct it6625 *it6625, u8 *edid, int start_b=
lock,
> +			    int num_blocks)
> +{
> +	int i, bank_ctrl, err =3D 0;
> +	struct device *dev =3D it6625->dev;
> +
> +	if (!edid) {
> +		dev_err(dev, "edid buffer is NULL");
> +		return -EINVAL;
> +	}
> +
> +	if (start_block < 0 || num_blocks <=3D 0 ||
> +	    start_block + num_blocks > EDID_NUM_BLOCKS_MAX) {
> +		dev_err(dev,
> +			"invalid block range: start_block=3D%d, num_blocks=3D%d",
> +			start_block, num_blocks);
> +		return -EINVAL;
> +	}

[Severity: Medium]
Will rejecting num_blocks <=3D 0 break standard V4L2 EDID operations?

The V4L2 specification defines VIDIOC_SUBDEV_G_EDID with blocks =3D 0 as the
command to query the maximum supported blocks. Since this unconditionally
returns -EINVAL for 0, how does userspace query capacity?

[ ... ]
> +static int it6625_write_edid(struct it6625 *it6625, u8 *edid, int start_=
block,
> +			     int num_blocks)
> +{
> +	int i, bank_ctrl, err =3D 0;
> +	struct device *dev =3D it6625->dev;
> +
> +	if (start_block < 0 || num_blocks <=3D 0 ||
> +	    start_block + num_blocks > EDID_NUM_BLOCKS_MAX) {
> +		dev_err(dev,
> +			"invalid block range: start_block=3D%d, num_blocks=3D%d",
> +			start_block, num_blocks);
> +		return -EINVAL;
> +	}

[Severity: Medium]
Will this prevent userspace from clearing the EDID?

VIDIOC_SUBDEV_S_EDID with blocks =3D 0 is defined as the command to clear t=
he
EDID. Unconditionally rejecting 0 here appears to break that functionality.

[ ... ]
> +static int it6625_get_detected_timings(struct it6625 *it6625,
> +				       struct v4l2_dv_timings *timings)
> +{
> +	struct v4l2_bt_timings *bt =3D &timings->bt;
> +	int val;
> +	unsigned int width, height, frame_width, frame_height;
> +	u8 buffer[8];
> +
> +	if (no_signal(it6625)) {
> +		dev_err(it6625->dev, "no signal detected");
> +		return -ENOLINK;
> +	}
> +
> +	memset(timings, 0, sizeof(struct v4l2_dv_timings));
> +	timings->type =3D V4L2_DV_BT_656_1120;
> +	val =3D it6625_read_byte(it6625, REG_VID_INFO);
> +	if (val < 0) {
> +		dev_err(it6625->dev, "failed to read video info");
> +		return -EIO;
> +	}
> +
> +	bt->interlaced =3D val & B_INTERLACE ?
> +			 V4L2_DV_INTERLACED : V4L2_DV_PROGRESSIVE;
> +
> +	if (it6625_read_bytes(it6625, REG_H_ACTIVE_1, buffer, 8) < 0)
> +		return -EIO;

[Severity: High]
Can this read from the wrong register bank if a concurrent EDID read is in
progress?

The chip appears to use a banked register layout where REG_INFO_BANK_SEL
swaps the meaning of registers. While it6625_read_edid() correctly acquires
it6625_lock to switch the bank, this function reads from REG_VID_INFO (0x68)
without acquiring the mutex.

If a format query runs concurrently with an EDID read, could it silently re=
ad
EDID data instead of Video Info?

[ ... ]
> +static int it6625_cec_adap_transmit(struct cec_adapter *adap, u8 attempt=
s,
> +				    u32 signal_free_time, struct cec_msg *msg)
> +{
> +	struct it6625 *it6625 =3D adap->priv;
> +
> +	dump_cec_msg(it6625, msg, "CEC_TX");
> +
> +	guard(mutex)(&it6625->it6625_lock);
> +	it6625_write_bytes(it6625, REG_CEC_TX_DATA, msg->msg, msg->len);
> +	it6625_write_byte(it6625, REG_CEC_TX_DATA_LEN, msg->len);
> +	it6625_set_bits(it6625, REG_HOST_CTRL_INT, B_CEC_SEND_DATA, B_CEC_SEND_=
DATA);
> +
> +	return 0;
> +}

[Severity: Medium]
Does this command need to wait for hardware acceptance before releasing the
lock?

Other functions using REG_HOST_CTRL_INT wait for the hardware to clear the
trigger bit via it6625_wait_for_status().

If another thread acquires the mutex immediately after this returns and cal=
ls
it6625_set_bank(), it will write to REG_HOST_CTRL_INT directly. Since it us=
es
a bare write rather than set_bits, won't that clear B_CEC_SEND_DATA before
the hardware has latched the command, aborting the transmission?

[ ... ]
> +static void it6625_cec_handler(struct it6625 *it6625, u8 intstatus)
> +{
> +	struct cec_msg rxmsg;
> +	int val =3D 0;

[Severity: High]
Could this leak uninitialized kernel stack memory to userspace?

The rxmsg structure is allocated on the stack, but only the msg array and
len field are populated below before passing it to cec_received_msg(). The
CEC core initializes several tracking fields but leaves others (like timeou=
t,
reply, and compiler padding) untouched.

When the CEC framework copies this to userspace via the CEC_RECEIVE ioctl,
won't the uninitialized bytes be leaked?

> +
> +	if (intstatus & B_CEC_RX_RECEIVED) {
> +		val =3D it6625_read_byte(it6625, REG_CEC_RX_DATA_LEN);
> +		if (val <=3D 0 || val > 16) {
> +			dev_err(it6625->dev, "invalid CEC RX length %d", val);
> +			return;
> +		}

[Severity: High]
If the RX data length is invalid, won't the early return immediately
terminate processing and guarantee any pending TX interrupt is lost?

> +
> +		it6625_read_bytes(it6625, REG_CEC_RX_DATA, &rxmsg.msg[0], val);

[Severity: High]
Can this read the wrong data if an EDID read is happening concurrently?

Similar to it6625_get_detected_timings(), this reads from REG_CEC_RX_DATA
(0x20) without acquiring it6625_lock. If an EDID read has switched the bank,
won't this read EDID bytes instead of the CEC payload?

> +		rxmsg.len =3D val;
> +		it6625_write_byte(it6625, REG_CEC_RX_DATA_LEN, 0);
> +		cec_received_msg(it6625->cec_adap, &rxmsg);
> +		dump_cec_msg(it6625, &rxmsg, "CEC_RX");
> +
> +	} else if (intstatus & B_CEC_TX_UPDATE) {

[Severity: High]
Will this logic permanently drop a TX completion interrupt if an RX interru=
pt
fires at the same time?

The TX and RX interrupt status checks are chained with an 'else if'. If both
B_CEC_RX_RECEIVED and B_CEC_TX_UPDATE are asserted, it looks like the TX
branch is skipped entirely, causing CEC transmission timeouts.

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

[Severity: High]
Does this ignore format->which and always return the active format instead =
of
the TRY state when V4L2_SUBDEV_FORMAT_TRY is requested?

[ ... ]
> +static int it6625_set_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_format *format)
> +{
[ ... ]
> +	ret =3D it6625_csi_mbus_code_idx(mbus_fmt_code);
> +
> +	if (ret < 0) {
> +		v4l2_dbg(1, debug, sd, "%s: unsupported format code 0x%x",
> +			 __func__, mbus_fmt_code);
> +		return ret;
> +	}
> +
> +	it6625->csi_format =3D it6625_formats[ret].csi_format;
> +
> +	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {

[Severity: High]
Does this unconditionally mutate the active hardware state
(it6625->csi_format) before checking if it is a V4L2_SUBDEV_FORMAT_TRY
request?

It looks like a TRY_FMT ioctl would silently corrupt the active hardware
configuration.

Also, if the requested format code is unsupported, this returns -EINVAL
instead of falling back to a supported format as required by the V4L2 API.
Could this cause issues with generic userspace tools?

[ ... ]
> +static ssize_t it6625_mipi_reg_write(struct file *file,
> +				     const char __user *user_buf,
> +				     size_t count, loff_t *ppos)
> +{
> +	struct it6625 *it6625 =3D file_inode(file)->i_private;
> +	char buf[32];
> +	unsigned int addr, val;
> +	ssize_t len;
> +
> +	len =3D simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, co=
unt);
> +	if (len < 0)
> +		return len;
> +	buf[len] =3D '\0';
> +
> +	if (sscanf(buf, "%X %X", &addr, &val) !=3D 2)

[Severity: Medium]
Is it safe to pass buf to sscanf if *ppos is greater than zero?

simple_write_to_buffer() writes the user data to buf + *ppos. If a user
performs a write with an offset (*ppos > 0), the beginning of the buf array
remains uninitialized stack memory. sscanf() will then parse this random
garbage, potentially leading to unpredictable register writes.

[ ... ]
> +static int it6625_init_v4l2_subdev(struct it6625 *it6625)
> +{
[ ... ]
> +	sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
> +	if (it6625_v4l2_init_controls(sd)) {
> +		dev_err(it6625->dev, "Failed to initialize v4l2 controls");
> +		return -ENOMEM;
> +	}
> +
> +	it6625->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +	sd->entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> +	err =3D media_entity_pads_init(&sd->entity, 1, &it6625->pad);
> +	if (err < 0) {
> +		dev_err(it6625->dev, "%s %d err=3D%d", __func__, __LINE__, err);
> +		return err;
> +	}

[Severity: Medium]
If media_entity_pads_init() fails, does this leak the v4l2_ctrl_handler
memory?

The controls are successfully initialized via it6625_v4l2_init_controls()
above, but the error path returns directly without freeing them.

> +
> +	err =3D v4l2_async_register_subdev(sd);
> +	if (err < 0) {
> +		dev_err(it6625->dev, "%s %d err=3D%d", __func__, __LINE__, err);
> +		media_entity_cleanup(&sd->entity);
> +		return err;
> +	}

[Severity: High]
Is the subdevice registered prematurely here?

v4l2_async_register_subdev() exposes the subdevice to the system. However,
critical setup like v4l2_ctrl_handler_setup(), cec_allocate_adapter(), and
it6625_initial_setup() happens later in probe.

If a host driver binds and calls subdev operations immediately after
registration, couldn't it operate on uninitialized chip state or trigger
NULL pointer dereferences on the CEC adapter?

[ ... ]
> +static int it6625_probe(struct i2c_client *client)
> +{
[ ... ]
> +err_clean_hdl:
> +	v4l2_ctrl_handler_free(&it6625->hdl);
> +err_clean_media_entity:
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_device_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +
> +err_clean_work_queues:
> +	if (!client->irq)
> +		timer_shutdown_sync(&it6625->timer);
> +	cancel_work_sync(&it6625->polling_work);
> +	cancel_delayed_work(&it6625->hpd_delayed_work);
> +	mutex_destroy(&it6625->it6625_lock);
> +	return err;
> +}

[Severity: Medium]
Do the err_clean_media_entity and err_clean_work_queues paths bypass the
control handler cleanup?

If v4l2_ctrl_handler_setup() or CEC setup fail, jumping to these labels
permanently leaks the allocated v4l2_ctrl_handler memory.

[Severity: High]
Does using a non-synchronous cancel here lead to a use-after-free?

If probe fails late in the process, the prematurely registered subdevice
could have already received an s_edid ioctl, which schedules
hpd_delayed_work. If cancel_delayed_work() is used instead of the
synchronous variant, the work function can execute concurrently while the
driver destroys it6625_lock and frees the it6625 structure, causing a crash.

[ ... ]
> +static void it6625_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct it6625 *it6625 =3D sd_to_6625(sd);
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
> +	v4l2_async_unregister_subdev(sd);

[Severity: High]
Is it safe to cancel the background work before unregistering the subdevice?

Since the subdevice is still actively registered when
cancel_delayed_work_sync() is called, an ioctl like s_edid can immediately
call it6625_enable_hpd() and reschedule the canceled work. When remove()
finishes and frees the it6625 structure, the rescheduled work will
subsequently dereference freed memory.

[ ... ]
> +static const struct i2c_device_id it6625_id[] =3D {
> +	{ "it6625", IT6625_CHIP },
> +	{ "it6626", IT6626_CHIP },
> +	{}
> +};

[Severity: Low]
Would it be better to use C99 designated initializers here?

Using positional initialization relies on the exact member order in
struct i2c_device_id.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-upstream-i=
t6625-it6626-v1-0-475912f74459@ite.com.tw?part=3D2
