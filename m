Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12C12253EE
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784775261; cv=none; b=owcMjNB9D3kUejLlGxSRi8MdpzsJ+02VNvmbCWOXPHigJzKp9kaL+Rm47tYc33u/stMC0tcEvbH2ec+tjw5tgm09EceindENu3qP3k/Yuf3N3D5GPcyu47tacuPLx/UyNyP1zLTt5V4a7hzbDvSEXV9zFpuwGyFK0iGZ3syDYRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784775261; c=relaxed/simple;
	bh=Mz2O4IMUCaSHw3E0XAUjj9eD2RiXyiy2BacH4msELsA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rVHrjo+7G490i+9J6P1o8PWuGhdvz7/VeKQ+zLkdHfjJsrwqflCSIrPDyY5KURZXSB9oAULTW2x6WbdQCrZB4ulc98BUft9/VvnBRB62pnZIs+wJQmosuj6g6KofmvfXufsGbtQrC/Imzjl6rqRr8NFzubiO5v8XUXiMYN8E3mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T84i3KME; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T84i3KME"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 147231F000E9;
	Thu, 23 Jul 2026 02:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784775260;
	bh=BfJIWi5iiUbaiaQB1PIooMteYD81sdqX0/S9vDGE/8M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T84i3KMEvt3Y9dwXNYA4OwVipc2XrlcFzzIKPaSpaESPyoNL3PEeuiEpGa/8cvwbb
	 dkNOj1Sq3DSaTnRtdz7csDWs5npSYTNVdyzmhn+3By8410kjVCz1eHZ8wD0ygua4Kc
	 M7dc7tIXxx1i91xp5ks8rg5r9uIoaO7y7vNa4gX5c7GmQGbDnV/Fhh4yZtfP1lpTc/
	 rxI5RukncrWxdl5okxvhgxxAlnWCsgRACY1PXQZCmwCWpg1qwAfr6F30LnRv9mfJ7E
	 dM7Ii9UaF6ZUvDj9N+RW2MPEOHjju8qWuPs3CODx9ty7Nvnt5aTehmzIMN5CVMt7K8
	 yBhtTOgZ6kszg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] media: i2c: add driver for ITE IT6625/IT6626
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260723-upstream-it6625-it6626-v7-2-f8175bb0ea12@ite.com.tw>
References: <20260723-upstream-it6625-it6626-v7-0-f8175bb0ea12@ite.com.tw>
 <20260723-upstream-it6625-it6626-v7-2-f8175bb0ea12@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 02:54:19 +0000
Message-Id: <20260723025420.147231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] it6625_get_fmt() leaks active hardware state into the TRY format=
's width, height, and field, violating V4L2 API contracts.
- [Medium] Incorrect pixel clock and frame height calculation for interlace=
d signals.
--

--- Patch [2]: [PATCH v7 2/2] media: i2c: add driver for ITE IT6625/IT6626 =
---
commit ad2f8d71f0d1ad68405361b447bff0d6bd237454
Author: Hermes Wu <Hermes.wu@ite.com.tw>

media: i2c: add driver for ITE IT6625/IT6626

Add a V4L2 subdevice driver for the ITE IT6625/IT6626 HDMI-to-MIPI
CSI-2 bridge chips. IT6625 accepts an HDMI 2.0 input and IT6626 an
HDMI 2.1 input, converting it to a D-PHY (or C/D-PHY on IT6626)
MIPI CSI-2 output.

> diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
> new file mode 100644
> index 0000000000000..9fb03ddb2acd9
> --- /dev/null
> +++ b/drivers/media/i2c/it6625.c
[ ... ]
> +static int it6625_get_detected_timings(struct it6625 *it6625,
> +				       struct v4l2_dv_timings *timings)
> +{
[ ... ]
> +	bt->hfrontporch =3D ((buffer2[0] & 0xff) << 8) + buffer2[1];
> +	bt->hsync =3D ((buffer2[2] & 0xff) << 8) + buffer2[3];
> +	bt->hbackporch =3D ((buffer2[4] & 0xff) << 8) + buffer2[5];
> +	bt->vfrontporch =3D ((buffer2[6] & 0xff) << 8) + buffer2[7];
> +	bt->vsync =3D ((buffer2[8] & 0xff) << 8) + buffer2[9];
> +	bt->vbackporch =3D ((buffer2[10] & 0xff) << 8) + buffer2[11];
> +
> +	bt->pixelclock =3D it6625_get_pclk(it6625);
> +	if (bt->interlaced =3D=3D V4L2_DV_INTERLACED) {
> +		bt->height *=3D 2;
> +		bt->il_vsync =3D bt->vsync + 1;
> +		bt->pixelclock /=3D 2;
> +	}

[Severity: Medium]
Are the interlaced field vertical porches and pixel clock handled correctly
here?

Halving the pixel clock and omitting the second field's porches
(il_vfrontporch, il_vbackporch) will cause the V4L2 core macro
V4L2_DV_BT_FRAME_HEIGHT() to compute an artificially shrunken frame height.

When combined with the halved pixel clock, frame rate calculations like
fps_from_bt_timings() will report incorrect values for interlaced signals.

> +
> +	return 0;
> +}
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
> +	format->format.field =3D timings.bt.interlaced =3D=3D V4L2_DV_INTERLACE=
D ?
> +			       V4L2_FIELD_INTERLACED : V4L2_FIELD_NONE;

[Severity: Medium]
Does this code leak the active hardware state into the TRY format state?

Active hardware timings are unconditionally written to the format structure
here, bypassing the V4L2_SUBDEV_FORMAT_TRY state isolation entirely.

> +
> +	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		fmt =3D v4l2_subdev_state_get_format(sd_state, format->pad);
> +		format->format.code =3D fmt->code;
> +		format->format.colorspace =3D fmt->colorspace;
> +	} else {
> +		scoped_guard(mutex, &it6625->it6625_lock) {
> +			format->format.colorspace =3D
> +				format_to_colorspace(it6625->csi_format);
> +			format->format.code =3D it6625->mbus_fmt_code;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
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
> +		fmt->colorspace =3D format_to_colorspace(it6625_formats[ret].csi_forma=
t);
> +		format->format.colorspace =3D fmt->colorspace;
> +		v4l2_dbg(1, debug, sd, "%s: try format code =3D 0x%x",
> +			 __func__, format->format.code);
> +		return 0;
> +	}

[Severity: Medium]
Will this leave the TRY state dimensions uninitialized or stale?

The TRY branch in it6625_set_fmt() updates the code and colorspace, but
fails to update the width and height in the sd_state to reflect the
requested format dimensions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-upstream-i=
t6625-it6626-v7-0-f8175bb0ea12@ite.com.tw?part=3D2
