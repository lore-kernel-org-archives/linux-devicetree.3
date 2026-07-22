Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273F840F749
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719898; cv=none; b=FuCRwk+kNtOQfpQcCbdkZVoJDJnpJaazLHqQOwmgGADWXt5AYFVAx9c1mnDrwtQLe+LA6p4zaokaq+RHBP33ptxsW63FDORE6aiIUnJnF68PYNSd2vC2UrtnIeMCHsT0kH4DWe8JRECGsHxWwcI1J3swnDe3c3CV5eFRKIwB+X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719898; c=relaxed/simple;
	bh=Gjuo1J87Og8iY37LBt1ZEw98NPqvpBuM7S4zJzt+ssQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c6LEts4AiDkyQWwZlZRjQc3UIH3vZtinfjELaZlleuVgFIQnkJH4yqWAfoD0X8PtlMy4OHKXWzHoYb4ZWKPHkWNQF5VJojA2HvuOXR1Pbee07ZBzvT9z1E155DuCRsSatSO6ViAqMRCLYLWesu6vetkI2J1SgaFpWPDHA3utuYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2bpaxtX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2bpaxtX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF4B1F000E9;
	Wed, 22 Jul 2026 11:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784719891;
	bh=s2lQ9B6hQYryRHnlPvGuRfl/E8JzUw0MI2YMBdtQA+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H2bpaxtX3/s6TB+uNPsKhc0vnkkyerhK1UaKPChSe5+ve/3smnNaEERSDnPAzHcXo
	 bs5zv0H9DymTptmMcvYl/bAcNIuBeHLaT/1ROmmULezzS54xv572SLEUgTLnK9KX4Q
	 NrTSbuYjkBc5yesEx5OjFny2a3JMioXk+TIT5yZXE9WWn05XaBh73KnlJYW7Q2k2lI
	 Wvw7jVKQU5OzsLEHcip9HVBxNalSwEIS3YCyctvnmSStra4iKkxpsoRmW+u8NmyDZB
	 rRVQTYfbBJMYVdr9HXX4WSrbNIWNhi53KBBkPvV8Omqhnr60MPLHJ6+RcgBmNBvqFo
	 +XzKH/VXcyfjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] media: i2c: add driver for ITE IT6625/IT6626
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260722-upstream-it6625-it6626-v6-2-6117d4d96574@ite.com.tw>
References: <20260722-upstream-it6625-it6626-v6-0-6117d4d96574@ite.com.tw>
 <20260722-upstream-it6625-it6626-v6-2-6117d4d96574@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 11:31:30 +0000
Message-Id: <20260722113130.CEF4B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Accessing MIPI CSI-2 specific union fields without verifying the=
 parsed bus type.
- [Medium] `it6625_set_fmt()` fails to update `format->format.colorspace` f=
or the `V4L2_SUBDEV_FORMAT_ACTIVE` branch.
- [Medium] `it6625_s_edid` violates the V4L2 `VIDIOC_SUBDEV_S_EDID` specifi=
cation for `start_block` bounds handling.
--

--- Patch [2]: [PATCH v6 2/2] media: i2c: add driver for ITE IT6625/IT6626 =
---
commit 9017f8e5343a61b6c557bf4b67bcc1fe372b54d2
Author: Hermes Wu <Hermes.wu@ite.com.tw>
Subject: media: i2c: add driver for ITE IT6625/IT6626

This commit adds a new V4L2 subdevice driver for the ITE IT6625 and IT6626
HDMI-to-MIPI CSI-2 bridge chips. The driver supports configuring the bridge
over I2C, handles EDID reading and writing, exposes an HDMI CEC adapter,
and supports DV timings and HPD control.

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
[ ... ]
> +	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		fmt =3D v4l2_subdev_state_get_format(sd_state, format->pad);
> +		fmt->code =3D format->format.code;
> +		fmt->colorspace =3D format_to_colorspace(it6625_formats[ret].csi_forma=
t);
> +		format->format.colorspace =3D fmt->colorspace;
> +		v4l2_dbg(1, debug, sd, "%s: try format code =3D 0x%x",
> +			 __func__, format->format.code);
> +		return 0;
> +	}
> +
> +	scoped_guard(mutex, &it6625->it6625_lock) {
> +		it6625->csi_format =3D it6625_formats[ret].csi_format;
> +		it6625->mbus_fmt_code =3D format->format.code;
> +		it6625_enable_stream_locked(it6625, false);
> +		it6625_set_mipi_config_locked(it6625, it6625->csi_format);
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Does this branch need to update format->format.colorspace before returning?

The V4L2_SUBDEV_FORMAT_TRY branch above updates format->format.colorspace,
but the active format branch only updates the internal hardware state
variables. This leaves the userspace format object with the old colorspace
value that was populated earlier in the function by it6625_get_fmt().

[ ... ]
> +static int it6625_s_edid(struct v4l2_subdev *sd,
> +			 struct v4l2_subdev_edid *edid)
> +{
[ ... ]
> +	memset(edid->reserved, 0, sizeof(edid->reserved));
> +
> +	if (edid->blocks > EDID_NUM_BLOCKS_MAX) {
> +		v4l2_err(sd, "too many edid blocks: %d", edid->blocks);
> +		edid->blocks =3D EDID_NUM_BLOCKS_MAX;
> +		return -E2BIG;
> +	}
> +
> +	it6625_disable_hpd(it6625);

[Severity: Medium]
Does this logic correctly handle out-of-bounds start blocks according to the
V4L2 specification?

If start_block is out of bounds, the spec expects blocks to be set to 0.
Additionally, if start_block + blocks exceeds the maximum, shouldn't blocks
be clamped to the remaining capacity (EDID_NUM_BLOCKS_MAX - edid->start_blo=
ck)
before returning -E2BIG?

[ ... ]
> +static int it6625_parse_endpoint(struct it6625 *it6625)
> +{
[ ... ]
> +	if (endpoint.bus_type =3D=3D V4L2_MBUS_CSI2_CPHY &&
> +	    it6625->chip_type !=3D IT6626_CHIP) {
> +		dev_err(dev, "IT6625 does not support C-PHY, only IT6626 does");
> +		v4l2_fwnode_endpoint_free(&endpoint);
> +		return -EINVAL;
> +	}
> +
> +	max_lanes =3D (endpoint.bus_type =3D=3D V4L2_MBUS_CSI2_CPHY) ? 3 : 4;
> +
> +	if (endpoint.bus.mipi_csi2.num_data_lanes =3D=3D 0 ||
> +	    endpoint.bus.mipi_csi2.num_data_lanes > max_lanes) {
> +		dev_err(dev,
> +			"invalid number of CSI data lanes: %u (max %u for this bus type)",
> +			endpoint.bus.mipi_csi2.num_data_lanes, max_lanes);

[Severity: Medium]
Can we read from the mipi_csi2 union member here without first verifying the
parsed bus type?

If the device tree is misconfigured and causes v4l2_fwnode_endpoint_alloc_p=
arse()
to infer a different bus type (like V4L2_MBUS_PARALLEL), reading from the
mipi_csi2 struct could yield arbitrary data for the lane count.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-upstream-i=
t6625-it6626-v6-0-6117d4d96574@ite.com.tw?part=3D2
