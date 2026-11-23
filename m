Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446560;
	b=QKDio/jOEM8jSJLxQ2t/Uhd/8l5NIuAq90ESZNaELFN4nU2PS2AAHRc2LeD9DMzoYaiO
	 FpvTiIWySVi3KdkM24GQDWPG2zLkLMa6fj9uBx/A3IdW5kZCvIP/vJnawkztxLGKM2QUa
	 o/LpCz4mDSeGCSCkPhIXbMkMbkJPGFM9kPn/IMOnsU3n96P/IHquaWMbvsj/BDn74c/BH
	 9nkljsxSX3Zeu5mRmPNl4S+7nOnSjASAwbVMP3CkNFxaTQ8TfJI87szqdrE36KIbW6B7o
	 Xn00LHI1hhZS6n4P4KLP9foA9Ii9BnTv3Ou+UflESNC6S+GOS+2n9X3mpZ+5f2A7RUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446560;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=S0/gJ05mIKOJNmWvIsxOWSvmXfyzM6AEH6VAGbtJZ28=;
	b=bGf1JA7mcOI/F9BezqHwL6tu69UMplvjDPP74nKGmmXeC5hIJTLo7q5hFDmk4aquLdt7
	 iXssdFmaofcaAT9q2EmpN+YaSGAPCQKq5388WpfOqoXyo+maqXITVLhdV15nXQBlxeo0I
	 azPqZnQ3rTIAGplqFba1KrgS2bwNOFaps6d4naUANU4lc0A5HQgaDuJxZEmIv4EYSbe0I
	 5N+AXy9J21W7nYVEBxnHbcTE3z+VgZBCU33WgYnk4vgbVZH9bR1p3cqnvR36eBhOH3Ozz
	 wtwynxih8aEYxoqVqfh7u4McZkZ91IRQmb3oSN2speHbDSrmJ14jP3O1TICP+FR7iKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VBFcHamY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02B7606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VBFcHamY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F341F000D4;
	Mon, 23 Nov 2026 15:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446559;
	bh=S0/gJ05mIKOJNmWvIsxOWSvmXfyzM6AEH6VAGbtJZ28=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VBFcHamYYKyiYOS8lwglfWlRfOurfvPENSMKTNlgajzrp/iXxPQzxyeBogAfKGxmS
	 O/IACLujcULYrb2HNJQu2hrdiPwyLGnpjjt8i4bbFiA+FXzQPXEz3vsZtzrBjGe2wK
	 MJhjRXw7WR/9iBRBLppQyu/KB0yGCUs6HHC2kEY8zp0R0vBOdgknyTRG7kHX85kxCj
	 +8/yClPd7TUffX+Q0Zv/vZ7Rw4nIaoakp7iWXIp5pc45vpveVOm8jvr9WjfB8ugH7r
	 sDWjalTIsgGJZL3L5oCZmaNy1g/fQm8Anq6lhWQpjdMA4Ecp1raEuwUa+CiITVp56y
	 DER819kleckJg==
Message-ID: <sashiko-outbox-229499@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: i2c: add os05e10 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhavin Sharma" <bhavin.sharma@siliconsignals.io>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261123145445.66636-3-bhavin.sharma@siliconsignals.io>
References: <20261123145445.66636-1-bhavin.sharma@siliconsignals.io>
 <20261123145445.66636-3-bhavin.sharma@siliconsignals.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:09:18 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] media: i2c: os05e10: off-by-one bounds check in
  os05e10_enum_mbus_code()
- [Medium] media: i2c: os05e10: 32-bit integer overflow in
  os05e10_pixel_rate()
- [Medium] media: i2c: os05e10: missing CSI-2 lane check in
  os05e10_parse_endpoint()
- [Medium] media: i2c: os05e10: missing V4L2_CID_HBLANK in
  os05e10_init_controls()
- [Low] media: i2c: os05e10: wrong sensor name and Bayer format in
  commit message
--

commit 0e387b1eefc19bf74866651b58cb5763696e11ef
Author: Bhavin Sharma <bhavin.sharma@siliconsignals.io>

media: i2c: add os05e10 image sensor driver

This commit adds a V4L2 subdevice driver for the OmniVision OS05E10 CMOS
image sensor, supporting 2592x1944 resolution at 60fps with manual exposure,
gain, and vblank controls.

> Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.
>
> The Omnivision os05e10 is a CMOS image sensor with an active array size of
> 2592 x 1944.
>
> The following features are supported:
> - Manual exposure an gain control support
> - vblank control support
> - Supported resolution: 2592 x 1944 @ 60fps (SBGGR10)

[Severity: Low]
The commit message refers to the os02g10 sensor in the first line and states
that the supported format is SBGGR10, whereas os05e10_mbus_codes[] exposes
MEDIA_BUS_FMT_SRGGB10_1X10.  In addition, the new VIDEO_OS05E10 entry in
drivers/media/i2c/Kconfig is indented with spaces instead of tabs, and
os05e10_common_regs[] in drivers/media/i2c/os05e10.c writes CCI_REG8(0xb88)
twice (0x47 and then 0x43).

> diff --git a/drivers/media/i2c/os05e10.c b/drivers/media/i2c/os05e10.c
> new file mode 100644
> index 0000000000000..736061b6c1b0d
> --- /dev/null
> +++ b/drivers/media/i2c/os05e10.c
> @@ -0,0 +1,969 @@
[ ... ]
> +/* Read-only registers */
> +#define OS05E10_REG_VTS				CCI_REG24(0x134)
> +#define OS05E10_REG_HTS				CCI_REG16(0x137)
> +
> +#define OS05E10_LINK_FREQ_720MHZ		(720 * HZ_PER_MHZ)
> +#define OS05E10_DATA_LANES			4
[ ... ]
> +static const u32 os05e10_mbus_codes[] =3D {
> +	MEDIA_BUS_FMT_SRGGB10_1X10,
> +};
[ ... ]
> +static u64 os05e10_pixel_rate(const struct os05e10_mode *mode)
> +{
> +	/* pixel_rate =3D link_freq * 2 * nr_of_lanes / bits_per_sample */
> +	return div_u64(OS05E10_LINK_FREQ_720MHZ * 2 * OS05E10_DATA_LANES,
> +		       mode->bpp);
> +}

[Severity: Medium]
Does the dividend in os05e10_pixel_rate() overflow on 32-bit architectures?

HZ_PER_MHZ is 1000000UL, so OS05E10_LINK_FREQ_720MHZ * 2 * OS05E10_DATA_LAN=
ES
is evaluated in 32-bit unsigned long arithmetic on 32-bit targets before
widening to u64 for div_u64().  720000000UL * 8 wraps 32 bits, triggering a
-Woverflow compiler warning and computing a pixel rate of 146503270 Hz
instead of 576000000 Hz.

> +static int os05e10_init_controls(struct os05e10 *os05e10)
> +{
[ ... ]
> +	vblank_def =3D mode->vts - mode->height;
> +	os05e10->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &os05e10_ctrl_ops,
> +					    V4L2_CID_VBLANK,
> +					    OS05E10_VTS_BASE - mode->height,
> +					    OS05E10_VTS_BASE - mode->height +
> +					    OS05E10_VBLANK_MAX,
> +					    1, vblank_def);
> +
> +	exp_max =3D mode->vts - OS05E10_EXPOSURE_MARGIN;
> +	os05e10->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &os05e10_ctrl_ops,
> +					      V4L2_CID_EXPOSURE,
> +					      OS05E10_EXPOSURE_MIN, exp_max,
> +					      OS05E10_EXPOSURE_STEP,
> +					      mode->exp);

[Severity: Medium]
Should os05e10_init_controls() also register a V4L2_CID_HBLANK control (and
are the unused OS05E10_REG_VTS and OS05E10_REG_HTS macros leftovers from
that)?  Without V4L2_CID_HBLANK alongside V4L2_CID_VBLANK and
V4L2_CID_PIXEL_RATE, userspace camera stacks cannot compute the horizontal
line duration or frame interval.

[ ... ]
> +static int os05e10_enum_mbus_code(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->index > ARRAY_SIZE(os05e10_mbus_codes))
> +		return -EINVAL;
> +
> +	code->code =3D os05e10_mbus_codes[code->index];
> +
> +	return 0;
> +}

[Severity: High]
Does os05e10_enum_mbus_code() read one element past the end of
os05e10_mbus_codes[] when code->index =3D=3D ARRAY_SIZE(os05e10_mbus_codes)?

Standard V4L2 format enumeration increments code->index from 0 until
-EINVAL, so code->index =3D=3D 1 passes the > check, reads os05e10_mbus_cod=
es[1]
out of bounds, and returns 0 with adjacent .rodata copied to userspace.

[ ... ]
> +static int os05e10_parse_endpoint(struct os05e10 *os05e10)
> +{
> +	struct v4l2_fwnode_endpoint bus_cfg =3D {
> +		.bus_type =3D V4L2_MBUS_CSI2_DPHY,
> +	};
> +	unsigned long link_freq_bitmap;
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	ep =3D fwnode_graph_get_next_endpoint(dev_fwnode(os05e10->dev), NULL);
> +	ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D v4l2_link_freq_to_bitmap(os05e10->dev, bus_cfg.link_frequencies,
> +				       bus_cfg.nr_of_link_frequencies,
> +				       link_freq_menu_items,
> +				       ARRAY_SIZE(link_freq_menu_items),
> +				       &link_freq_bitmap);
> +
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +};

[Severity: Medium]
Should os05e10_parse_endpoint() verify that
bus_cfg.bus.mipi_csi2.num_data_lanes equals OS05E10_DATA_LANES?

The ovti,os05e10 devicetree binding allows both 2-lane and 4-lane CSI-2
configurations, while this driver hardcodes 4 lanes for os05e10_pixel_rate()
and os05e10_common_regs[].  Without checking num_data_lanes, probing on a
2-lane board succeeds silently with a mismatched lane configuration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123145445.6663=
6-1-bhavin.sharma@siliconsignals.io?part=3D2
