Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1288418A33
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 10:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194539; cv=none; b=BpUwo6j5YWBEEIrQwv8TYOYUMovDNtZ8pujvmQheNKYWp5pCNxk+AKsyzoTGf07cFTOQ/4wncvn+oqLGGgHT21fncQNif6IWh+icr3UQunuEtCGtNr7v21mAigtQqror/+gHOBxNHf7eM8sTTCCpa1IkksdWC/2PNRKGZNnR2RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194539; c=relaxed/simple;
	bh=FwcozDZvnTxxwdSDupqvWTmRLRaDvdWPDr8U1ZnsJyg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aqSCPnbKuuuJo5FPgE2ZGZdYnueE6VvaVLLpeMYEu1DNmzEHDibE/mStsIvY2s3zDXCff2OGEixyZe7UzekhGzBoZPfoCle/Lds5JfcdevA1TIdS7qbyPCzL6EP+VBIB178nWBpmGJgpyct/oN9/h0D4RUQvDf6nJEyszX4hANg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOrXzW6F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOrXzW6F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2211F000FF;
	Mon,  5 Oct 2026 10:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791194537;
	bh=qYBHjiYF+VCi1zD054c/t657UsFpmNJSKL2uGVkhMag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KOrXzW6FbAOx4bnncARcP+VoVCSS5Lbk807STo5f7zXZWCYABOD0Hr77dQ8zSyJng
	 rX1Kju0l+vXUUbgMMQRKzIlrmRb3A+4Ir9ccAgPn6+7+XWF5O/qvqQINHBn8UUZBK0
	 003I6jOMSbjUehXA8W+fatyxHWZ4Vtug91BnWUgQC1SVl29lNIcwXgeDG+cIauB1cc
	 +ErR4InRBZXNwrlQMvHQPssH36HDThmH3yUBGDrAs8VQijzDIQqIyMSuxP2l4ESvB+
	 WCBQeeFzkTLpGDh3zZBhaoxv0pA5kdwWaOA5vc0HoyFpBfnsQ6iSfGec73cSk7GTlZ
	 /VuoZCVVyI4iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261005-mira220-v13-2-27a041933929@ideasonboard.com>
References: <20261005-mira220-v13-0-27a041933929@ideasonboard.com>
 <20261005-mira220-v13-2-27a041933929@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 10:02:16 +0000
Message-Id: <20261005100217.5A2211F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] media: mira220: NULL pointer dereference in mira220_set_ctrl due t=
o race with remove
- [Medium] media: mira220: missing .set_selection leaves frame windowing de=
ad code
- [Medium] media: mira220: data race when accessing flip controls during TR=
Y format operations
--

commit e6501c571328e79b8fc444fba484ac0380fd2bca
Author: Philippe Baetens <philippebaetens@gmail.com>

media: i2c: Add driver for AMS-OSRAM Mira220

This commit introduces the V4L2 subdev driver for the AMS-OSRAM Mira220
image sensor. It implements support for mono and RGB formats with varying
bit depths.

> diff --git a/drivers/media/i2c/mira220.c b/drivers/media/i2c/mira220.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/i2c/mira220.c

[ ... ]

> +#define MIRA220_FLIP_FORMAT_MASK	0x3
> +static inline unsigned int mira220_flip_format_index(struct mira220 *mir=
a220,
> +						     unsigned int index)
> +{
> +	return (index & ~MIRA220_FLIP_FORMAT_MASK)	|
> +	       (mira220->vflip->val ? BIT(1) : 0)	|
> +	       (mira220->hflip->val ? BIT(0) : 0);
> +}

[Severity: Medium]
Is this vulnerable to a data race during V4L2_SUBDEV_FORMAT_TRY operations?

This reads the vflip and hflip control values directly without taking the
control handler lock. When this is called via pad operations like
set_pad_format() or enum_mbus_code() for a TRY request, the V4L2 core holds
the file handle's TRY state lock rather than the active state lock.

Since a concurrent VIDIOC_S_CTRL ioctl can modify these values under the
control handler lock, could this result in read tearing or unexpected
behavior from concurrent modifications?

[ ... ]

> +static int mira220_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct mira220 *mira220 =3D
> +		container_of(ctrl->handler, struct mira220, ctrl_handler);
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&mira220->sd);
> +	struct v4l2_mbus_framefmt *format;
> +	struct v4l2_subdev_state *state;
> +	int ret =3D 0;
> +
> +	state =3D v4l2_subdev_get_locked_active_state(&mira220->sd);
> +	format =3D v4l2_subdev_state_get_format(state, 0);

[Severity: High]
Could this lead to a NULL pointer dereference during device unbind?

This function fetches the locked active state and blindly dereferences the
format pointer. If a concurrent VIDIOC_S_CTRL ioctl happens during device
removal, the active state might have already been freed by
v4l2_subdev_cleanup() before the control handler is unregistered.

Should the control handler be freed before destroying the subdev state
in mira220_remove() to prevent this race window?

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

[Severity: Medium]
Is the dynamic windowing calculation here effectively dead code?

The commit message mentions dynamic frame windowing support. However,
since the driver forces the format to the 1600x1400 maximum resolution in
mira220_set_pad_format() and omits the .set_selection callback in the
v4l2_subdev_pad_ops structure, userspace has no mechanism to change the
crop rectangle.

Should a .set_selection callback be added so that format->height and
format->width can actually vary?

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

[Severity: Medium]
This is related to the previous question: does the lack of a .set_selection
callback leave the windowing feature incomplete?

[ ... ]

> +static void mira220_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct mira220 *mira220 =3D to_mira220(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(&mira220->sd);
> +	media_entity_cleanup(&sd->entity);
> +
> +	v4l2_ctrl_handler_free(mira220->sd.ctrl_handler);

[Severity: High]
Does freeing the control handler after cleaning up the subdev state
introduce the NULL pointer dereference race mentioned above?

v4l2_subdev_cleanup() frees the active state without taking the control
handler lock. Because the control handler is still registered, userspace
can still invoke mira220_set_ctrl(), which will try to access the now-NULL
active state format pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-mira220-v1=
3-0-27a041933929@ideasonboard.com?part=3D2
