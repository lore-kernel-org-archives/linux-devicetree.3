Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039E03630AC
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784692699; cv=none; b=FII8ymUX1G4lGwwBhhdaJCKofMwrmnkn3ZdaLJEAjgr7W+zhz0xKSzdUGD+B2aiqm37daYF9wvmpBpyg2Trxj9eHBZxKbBQdfzNZF/pSpPEzrXGt/Tdtm+vXd66GfxieuWbNaJEOHxdljCYBdVb2zUj2Qh1zcmAqBVjf/cITzLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784692699; c=relaxed/simple;
	bh=PkPeEfhFSYK4QjehEZ8An4vrh4P3wKDbpS+X+u5/t50=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eZRGX0bfeqGakPaxpmXi6BAOkIRYY0O5G1iw7y+km7Swc3gqZ+w3/9lK+vcI5rFf1YG6JAs/DFf8o6akappz+4ms3+dXc8eL0XplkegPuP5c6y7jYNybqkeAxFACc4kLwSJpDGQn9ro9k2JhZAsT4vYt9wz+nGSw8iXBGiT/PXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKl3iRyM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKl3iRyM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA671F000E9;
	Wed, 22 Jul 2026 03:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784692697;
	bh=F6O9GqWpl/Nckxqz/VrJmv7ig/+KlOfaYAQaAcysb1U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lKl3iRyMTWa5RYpiEqH4XGtsLri6EighG1QkVi3dGwOAhYbdghMbLoAqn9k3C42Y5
	 dW/qoHJ+chQnFzSTnScpjENM9XVn3TyiI4ugA0AbgMBHNaMRNfVeiNLV5FqNko8K8M
	 fL/q9DSqz1hq2TLHfVU8uO23W74VG/ntUn/wHkM/Npf/Tf6pBaxgGqfEyh6xYjDecM
	 vsM4AkxwwrQj2UdVouLQ1d8R9v7YJQ9mrFFkKeVaBXjiBULep/WbKMapdbHv3sLAnZ
	 AHlyo7tu+1PyPx390m2j8DLgKcsISRnGSPNVU3ofxjvso147sanuebTWIAqqyUkzv3
	 oO9bNqQIpr6LQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: add driver for ITE IT6625/IT6626
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-upstream-it6625-it6626-v3-2-947e50f01764@ite.com.tw>
References: <20260722-upstream-it6625-it6626-v3-0-947e50f01764@ite.com.tw>
 <20260722-upstream-it6625-it6626-v3-2-947e50f01764@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 03:58:16 +0000
Message-Id: <20260722035817.5BA671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Failure to flush the CEC RX FIFO on invalid length causes an unrec=
overable interrupt storm.
- [Medium] Returning -EINVAL for unsupported formats in VIDIOC_SUBDEV_S_FMT.
- [Medium] Unprotected reads of `csi_format` and `mbus_fmt_code` in `it6625=
_get_fmt()` cause data races.
- [Medium] G_EDID callbacks return -EINVAL when the requested block count e=
xceeds maximum capacity.
- [Medium] Integer overflow in EDID block range validation allows out-of-bo=
unds start blocks to bypass bounds checks.
- [Medium] Unprotected full-page I2C reads in debugfs pop hardware FIFOs an=
d corrupt driver state.
- [Low] The IT6625_CID_HDMI_INFO control lacks the V4L2_CTRL_FLAG_VOLATILE =
flag, preventing its callback from executing.
- [Low] Incorrect `buf` indexing in debugfs write handler causes fragmented=
 writes and non-zero offsets to fail.
--

--- Patch [2]: [PATCH v3 2/2] media: i2c: add driver for ITE IT6625/IT6626 =
---
commit 87083ce303a80a72c2909985b3b0be1e8131fd98
Author: Hermes Wu <Hermes.wu@ite.com.tw>

media: i2c: add driver for ITE IT6625/IT6626

Add a V4L2 subdevice driver for the ITE IT6625/IT6626 HDMI-to-MIPI
CSI-2 bridge chips.

> diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
> new file mode 100644
> index 0000000000000..54056ee71a46c
> --- /dev/null
> +++ b/drivers/media/i2c/it6625.c
> @@ -0,0 +1,2131 @@
> +// SPDX-License-Identifier: GPL-2.0-only
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

[Severity: Medium]
Will this return an error instead of clamping the EDID block count? The
V4L2 specification requires the driver to clamp the blocks to the maximum
available and return 0, rather than returning an error when a userspace
application requests a large block count.

Also, since the parameters are signed integers but originate from __u32
fields, can a large positive start_block overflow start_block + num_blocks
to a negative value? This would bypass the hardware bounds check and allow
I2C reads to unintended banks.

> +		dev_err(dev,
> +			"invalid block range: start_block=3D%d, num_blocks=3D%d",
> +			start_block, num_blocks);
> +		return -EINVAL;
> +	}
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

[Severity: Medium]
Could this also be vulnerable to the same integer overflow as the read
path? A large start_block could overflow the addition and bypass the bounds
validation on the write path.

> +		dev_err(dev,
> +			"invalid block range: start_block=3D%d, num_blocks=3D%d",
> +			start_block, num_blocks);
> +		return -EINVAL;
> +	}
[ ... ]
> +static void it6625_cec_handler(struct it6625 *it6625, u8 intstatus)
> +{
> +	struct cec_msg rxmsg =3D {};
> +	int val =3D 0;
> +
> +	if (intstatus & B_CEC_RX_RECEIVED) {
> +		scoped_guard(mutex, &it6625->it6625_lock) {
> +			val =3D it6625_read_byte(it6625, REG_CEC_RX_DATA_LEN);
> +			if (val > 0 && val <=3D 16) {
> +				it6625_read_bytes(it6625, REG_CEC_RX_DATA, &rxmsg.msg[0], val);
> +				it6625_write_byte(it6625, REG_CEC_RX_DATA_LEN, 0);
> +			}
> +		}
> +
> +		if (val > 0 && val <=3D 16) {
> +			rxmsg.len =3D val;
> +			cec_received_msg(it6625->cec_adap, &rxmsg);
> +			dump_cec_msg(it6625, &rxmsg, "CEC_RX");
> +		} else {
> +			dev_err(it6625->dev, "invalid CEC RX length %d", val);
> +		}

[Severity: High]
Does this code leave the hardware interrupt condition permanently active if
the length is greater than 16 or less than 0?=20

If the length is invalid, the driver logs an error but skips writing 0 to
REG_CEC_RX_DATA_LEN. Since writing 0 is required to clear the RX status,
this could cause an unrecoverable interrupt storm.

> +	}
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
> +	it6625_get_timings(it6625, &timings);
> +	format->format.width =3D timings.bt.width;
> +	format->format.height =3D timings.bt.height;
> +	format->format.colorspace =3D format_to_colorspace(it6625->csi_format);

[Severity: Medium]
Can this code read a torn state?=20

The variables csi_format and mbus_fmt_code are being read here without
holding the it6625_lock. If VIDIOC_SUBDEV_G_FMT is called concurrently with
VIDIOC_SUBDEV_S_FMT, they could end up out of sync.

> +	format->format.field =3D timings.bt.interlaced =3D=3D V4L2_DV_INTERLACE=
D ?
> +			       V4L2_FIELD_INTERLACED : V4L2_FIELD_NONE;
> +
> +	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		fmt =3D v4l2_subdev_state_get_format(sd_state, format->pad);
> +		format->format.code =3D fmt->code;
> +	} else {
> +		format->format.code =3D it6625->mbus_fmt_code;
> +	}
> +
> +	return 0;
> +}
> +
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

[Severity: Medium]
Should this adjust the format instead of returning an error?=20

The V4L2 Subdevice API mandates that the driver must adjust unsupported
format codes to a default supported format rather than returning -EINVAL
and failing.

[ ... ]
> +static const struct v4l2_ctrl_config it6625_ctrl_get_hdmi_info =3D {
> +	.ops =3D &it6625_ctrl_ops,
> +	.id =3D IT6625_CID_HDMI_INFO,
> +	.name =3D "HDMI Info",
> +	.type =3D V4L2_CTRL_TYPE_STRING,
> +	.max =3D 128,
> +	.step =3D 1,
> +	.flags =3D V4L2_CTRL_FLAG_READ_ONLY,
> +};

[Severity: Low]
Is this control missing the V4L2_CTRL_FLAG_VOLATILE flag?=20

Without it, the associated it6625_g_volatile_ctrl() callback won't execute
when userspace reads the control, silently returning a default empty string.

[ ... ]
> +static int it6625_mipi_reg_show(struct seq_file *s, void *data)
> +{
> +	struct it6625 *it6625 =3D s->private;
> +	u8 reg_buf[256];
> +
> +	it6625_read_bytes(it6625, 0x00, reg_buf, sizeof(reg_buf));

[Severity: Medium]
Will this unprotected 256-byte bulk read cause hardware state corruption?=20

Reading all 256 registers without holding it6625_lock could race with
active bank switches. More importantly, won't this read clear-on-read
registers like REG_CEC_RX_DATA, silently popping the CEC RX FIFO and
permanently dropping pending CEC messages?

> +	it6625_regdump_print(s, reg_buf);
> +
> +	return 0;
> +}
[ ... ]
> +static ssize_t it6625_mipi_reg_write(struct file *file,
> +				     const char __user *user_buf,
> +				     size_t count, loff_t *ppos)
> +{
> +	struct it6625 *it6625 =3D file_inode(file)->i_private;
> +	char buf[32] =3D {};
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
> +		return -EINVAL;

[Severity: Low]
Can this fail for any debugfs write where the file offset (*ppos) is
greater than 0?=20

The simple_write_to_buffer() function copies data to buf + *ppos. If *ppos
is greater than 0, the start of buf remains zero-initialized.=20

Setting buf[len] =3D '\0' puts the null terminator at the wrong index, and
sscanf() reads from buf[0] which is empty.

> +
> +	it6625_write_byte(it6625, addr, val);
> +
> +	return count;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-upstream-i=
t6625-it6626-v3-0-947e50f01764@ite.com.tw?part=3D2
