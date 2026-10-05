Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2672489FC8
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 17:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791223071; cv=none; b=d/Hz+d2cZSYqPIfJex29RiWEmTHVo0aHBdYzJtYP3kMo+CbkrolrjdDCoPIkUGhl4JHkVU0dk2TJYZN0/1a3NM97q1hCw/cwut+4Y0wK0HOmvyhhDl1QKHuFBhHv+ztgKpD81nEgyn2Q1xGCDYI7lfhO/OaGgN501+EHPGdnkWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791223071; c=relaxed/simple;
	bh=t35l6jRomrjIJY5u32ucriJ+71SCG7dMvL/JCUhr/n0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m/GABlB2xmCPmTfmv2DocnpI+ZSmsYczum1r0e9hqns9bNAz+9SL0aAtXmfJKdm96UD0kapVFI/G6AJsaomXcpf2rO48771dpQw94r1e7lE0vhtNGdFSd7w5RaPFpS+LdX/xCEeGaX1eRpi1LTJ9C/PxLw8mc2l0pQyj+hqYGWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C99eBjw6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C99eBjw6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC281F000FF;
	Mon,  5 Oct 2026 17:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791223069;
	bh=n55GMvjXa0QPr7jO6tb9ZJLnPq4Dq2MsL1psRyGLA0I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C99eBjw6Qf8/BOgGqQZEaeRNbYVNAQ7p0DBGugt5A3CWZd+VKpu1nVRxFd8R6fGJY
	 q0Q52RRCNEsI/TDXFi8RgPe6wJzqe0TNJGQShuxjByF71Sdg1y1/0Ct9dZUw7KSqKZ
	 j+XEskJ5ajs4BEAfeP+GDIcTxZbbudBxOjbDA7Wwe68wqjfZHzMZFRgmShRLh6ceGo
	 IqrfsnF44ezv0McSf4eeVsg5NonJjMpWmkn3HWwJ9/u2jZPCdpdcXcbPOtw6tE/Xyc
	 3TYsCw/JyMhq403B5AZNaiKJcBbGtSXWGN9RvkleZRa31oKjlKevfPgX1/TDZuLieJ
	 ufQLuv09u2W5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] media: ox05b1s: Add omnivision OX05B1S raw
 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mirela Rabulea" <mirela.rabulea@nxp.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261005175102.2358881-3-mirela.rabulea@nxp.com>
References: <20261005175102.2358881-1-mirela.rabulea@nxp.com>
 <20261005175102.2358881-3-mirela.rabulea@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 17:57:48 +0000
Message-Id: <20261005175749.3BC281F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] media: ox05b1s: NULL pointer dereference via of_device_get_match_d=
ata()
- [Medium] media: ox05b1s: vblank control minimum allows VTS below max expo=
sure
- [Medium] media: ox05b1s: unsigned subtraction underflow in nearest size c=
alculation
- [Medium] media: ox05b1s: precision loss in HTS calculation corrupts regis=
ter write
--

commit b187cd28d540e370c1f99f3b0849d51ecd800efc
Author: Mirela Rabulea <mirela.rabulea@nxp.com>

media: ox05b1s: Add omnivision OX05B1S raw sensor driver

Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor.
The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an
active array size of 2592 x 1944.

> diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c b/drivers/media/i2c=
/ox05b1s/ox05b1s_mipi.c
> new file mode 100644
> index 0000000000000..45d38dc836e6a
> --- /dev/null
> +++ b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
[ ... ]
> +static int ox05b1s_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +	case V4L2_CID_HBLANK:
> +		/*
> +		 * Convert pixel-domain hblank back to SA1_CLK cycles for HTS.
> +		 * pixel_rate =3D link_freq * 2 * num_data_lanes / bpp
> +		 * hts_cycles =3D (width + hblank) * sa1_clk / pixel_rate
> +		 */
> +		pixel_rate =3D div_u64((u64)sensor->mode->link_freq * 2 *
> +				     sensor->num_data_lanes,
> +				     sensor->mode->bpp);
> +		hts =3D (u32)div_u64((u64)(w + ctrl->val) * sensor->mode->sa1_clk,
> +				   pixel_rate);
> +		ret =3D cci_write(sensor->regmap, OX05B1S_REG_TIMING_HTS,
> +				hts, NULL);

[Severity: Medium]
Will this truncating integer division cause precision loss? When HTS cycles
are converted to pixels for the HBLANK control and back here, rounding
errors can lead to an incorrect, off-by-one timing value being written to
the sensor, which might result in framing errors or frame rate
discrepancies.

> +		break;
[ ... ]
> +static int ox05b1s_update_controls(struct ox05b1s *sensor)
> +{
[ ... ]
> +	/*
> +	 * hblank in pixels =3D HTS_cycles * pixel_rate / sa1_clk - width
> +	 * Computed as u64 to avoid overflow, then truncated to u32.
> +	 */
> +	hblank =3D (u32)div_u64((u64)hts * pixel_rate,
> +			      sensor->mode->sa1_clk) - sensor->mode->width;

[Severity: Medium]
Could this truncation compound the precision loss mentioned above when
calculating HTS?

> +
> +	ret =3D __v4l2_ctrl_modify_range(sensor->ctrls.hblank, hblank, hblank,
> +				       1, hblank);
> +	if (ret) {
> +		dev_err(dev, "Modify range for hblank %u-%u failed\n",
> +			hblank, hblank);
> +		goto out;
> +	}
> +	__v4l2_ctrl_s_ctrl(sensor->ctrls.hblank,
> +			   sensor->ctrls.hblank->default_value);
> +
> +	ret =3D __v4l2_ctrl_modify_range(sensor->ctrls.vblank, 0, vblank * 4,
> +				       1, vblank);

[Severity: Medium]
Is it safe to hardcode the vblank minimum to 0? The maximum exposure is
statically set based on the default VTS. If vblank is reduced to 0, does
this allow user space to request an exposure time greater than the frame
time, potentially causing sensor lockup?

> +	if (ret) {
[ ... ]
> +static const struct ox05b1s_mode *ox05b1s_nearest_size(const struct ox05=
b1s_mode *supported_modes,
> +						       struct v4l2_subdev_format *fmt)
> +{
[ ... ]
> +		if (supported_modes->code !=3D fmt->format.code)
> +			continue;
> +
> +		err =3D abs(w - fmt->format.width) + abs(h - fmt->format.height);

[Severity: Medium]
Since both w and fmt->format.width are unsigned 32-bit integers, won't
this subtraction underflow and wrap around to a large positive value before
abs() evaluates it? Could this result in an incorrect mode selection when
falling back to the nearest size?

> +		if (err > min_error)
> +			continue;
[ ... ]
> +static int ox05b1s_read_chip_id(struct ox05b1s *sensor)
> +{
[ ... ]
> +	switch (chip_id) {
> +	case OX05B1S_CHIP_ID:
> +		camera_name =3D "ox05b1s";
> +		break;
> +	default:
> +		camera_name =3D "unknown";
> +		break;
> +	}
> +
> +	if (chip_id =3D=3D sensor->model->chip_id) {

[Severity: High]
Does this unconditionally dereference sensor->model? If the device was
instantiated without an OF node, sensor->model would be NULL, potentially
leading to a kernel panic here.

> +		dev_dbg(dev, "Camera %s detected, chip_id=3D%llx\n",
> +			camera_name, chip_id);
> +	} else {
[ ... ]
> +static int ox05b1s_probe(struct i2c_client *client)
> +{
[ ... ]
> +	sensor->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(sensor->regmap))
> +		return dev_err_probe(dev, PTR_ERR(sensor->regmap),
> +				     "Failed to allocate sensor register map\n");
> +
> +	sensor->i2c_client =3D client;
> +
> +	sensor->model =3D of_device_get_match_data(dev);

[Severity: High]
Can of_device_get_match_data() return NULL here? If the device is
instantiated via sysfs new_device, ACPI PRP0001, or i2c_board_info without
an OF node, this assignment leaves sensor->model as NULL. Should this be
checked, or should device_get_match_data() / i2c_get_match_data() be used
instead?

> +
> +	ox05b1s_get_gpios(sensor);
> +	if (IS_ERR(sensor->rst_gpio))

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005175102.2358=
881-1-mirela.rabulea@nxp.com?part=3D2
