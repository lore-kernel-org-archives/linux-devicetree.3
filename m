Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A1D2F12AC
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512830; cv=none; b=WvtYsFr3e6d7+rhiLBjQqUDJEr32tdVW4Iez1aeiB+edeMUIwHfE0pBrg46E0QhFjR40J/+gNJDo8+ZlzKXRoCpLH+LLCAvN5pYOlkHp0GoKaO1ONlf9cfkXRnCTKFxIoxAeFdc8N2fEC7JNTfQWXYwcxk0+EhwOeaoZFz1dN3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512830; c=relaxed/simple;
	bh=qNvklQmQESrL4OKo6SMRxbE1gJpPrA0joNLXG7VF3WM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P5+63k7Px/gehOehYMI7IIBDZSqWbviQuegrtNKuvJrNvsmkKn30xVks5PA7H88HW2B3iXBbXOzd55mPZCnScERlQ6Mqw8C4/MIrlyfjMDX+SnbzCBkJAboIWPyIN6J70CxCFFP4Db5eDPPlHqLAn0r6WwmsUjHsZEqMq9x14Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuPNaQXQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuPNaQXQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E071F000E9;
	Fri, 31 Jul 2026 15:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785512828;
	bh=37p1aU76EjP8d0R5f4fv/3cl2yM1K7/Q1Laozpm2gIA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kuPNaQXQXtRQ/S/PO/kNgYHB43Gfn7xxWpM1pDv4gfaEivpxpffFR6oMqXvfsgWt+
	 zFndOROdqqfv5z5ktJTlPTGQ1yfNdDQikvB6NAl3j0HR66h0t+dAYHJoTbYkxUlFmc
	 sCntuwmvvrsJ+94dqZnrZ9O8/CaSOI7aAyHRMP8Tcl+KkEsyXTAaS99RkB6czzCSdI
	 pti6Q36SgCrAhU6o8FaC7Tnn2CrF0DB1MdJo+NTB2yXXDg8HnexB/uVJzJFf7gizny
	 +K+LdIvRPw0V0vJ3kluEWfK/erfKoEVC87BdIxeradbYOL6MHbbcgaZlcwT7yi4o7U
	 zg74mK8UB14Fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260731-mira220-v11-2-1295fe17021d@ideasonboard.com>
References: <20260731-mira220-v11-0-1295fe17021d@ideasonboard.com>
 <20260731-mira220-v11-2-1295fe17021d@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 15:47:07 +0000
Message-Id: <20260731154708.41E071F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect check of `pm_runtime_get_if_in_use()` return value leads=
 to an unbalanced decrement of the runtime PM usage counter when runtime PM=
 is disabled.
- [Medium] Claimed dynamic frame windowing is unreachable dead code due to =
fixed formats and a missing `.set_selection` pad operation.
--

--- Patch [2]: [PATCH v11 2/2] media: i2c: Add driver for AMS-OSRAM Mira220=
 ---
commit 77f5d42d3080baefabb9e7bc7b1e2214656823e4
Author: Philippe Baetens <philippebaetens@gmail.com>

media: i2c: Add driver for AMS-OSRAM Mira220

Add a V4L2 subdev driver for driver for the AMS-OSRAM Mira220 image sensor.
The driver implements support for mono and RGB 12, 10 and 8 bits formats.

> diff --git a/drivers/media/i2c/mira220.c b/drivers/media/i2c/mira220.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/i2c/mira220.c
[ ... ]
> +static int mira220_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +	/* Update the format code to adjust it to the new flip state. */
> +	if (ctrl->id =3D=3D V4L2_CID_VFLIP || ctrl->id =3D=3D V4L2_CID_HFLIP)
> +		format->code =3D mira220_get_format_code(mira220, format->code);
> +
> +	if (!pm_runtime_get_if_in_use(&client->dev))
> +		return 0;

[Severity: High]
Can this lead to an unbalanced decrement of the runtime PM usage counter?

When pm_runtime_get_if_in_use() is called while the device's runtime PM is
disabled, it returns -EINVAL. Because -EINVAL is non-zero, the check here
evaluates to false and the function proceeds to the switch statement.

This causes the function to unconditionally call pm_runtime_put_autosuspend=
()
at the end, decrementing the usage counter and potentially causing an
underflow. Would it be safer to explicitly check for positive values, such =
as
if (pm_runtime_get_if_in_use(&client->dev) <=3D 0)?

> +
> +	switch (ctrl->id) {
[ ... ]
> +	}
> +
> +	pm_runtime_put_autosuspend(&client->dev);
> +
> +	return ret;
> +}
[ ... ]
> +static int mira220_set_framefmt(struct mira220 *mira220,
> +				struct v4l2_subdev_state *state)
> +{
[ ... ]
> +	/*
> +	 * Program the ROI area, centered in the sensor's pixel array.
> +	 *
> +	 * TODO: Use the crop rectangle sizes once the driver is ported to the
> +	 * new RAW camera sensor model.
> +	 */
> +	top =3D (MIRA220_PIXEL_ARRAY_HEIGHT - format->height) / 2;
> +	left =3D (MIRA220_PIXEL_ARRAY_WIDTH - format->width) / 2;
> +
> +	cci_write(mira220->regmap, MIRA220_VSTART_REG, top, &ret);

[Severity: Medium]
Is this dynamic windowing logic currently unreachable?

The patch description mentions that the driver dynamically programs frame
windowing. However, looking at mira220_update_pad_format(), the format width
and height are hardcoded to MIRA220_PIXEL_ARRAY_WIDTH and
MIRA220_PIXEL_ARRAY_HEIGHT.

Since mira220_pad_ops below doesn't implement a .set_selection callback,
userspace cannot configure the crop rectangle. Does this mean the top and
left offsets calculated here will always evaluate to zero, making this
calculation dead code for now?

> +	cci_write(mira220->regmap, MIRA220_HSTART_REG,
> +		  left & MIRA220_HSTART_MASK, &ret);
[ ... ]
> +static const struct v4l2_subdev_pad_ops mira220_pad_ops =3D {
> +	.enum_mbus_code =3D mira220_enum_mbus_code,
> +	.get_fmt =3D v4l2_subdev_get_fmt,
> +	.set_fmt =3D mira220_set_pad_format,
> +	.get_selection =3D mira220_get_selection,
> +	.enum_frame_size =3D mira220_enum_frame_size,
> +	.enable_streams =3D mira220_enable_streams,
> +	.disable_streams =3D mira220_disable_streams,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-mira220-v1=
1-0-1295fe17021d@ideasonboard.com?part=3D2
