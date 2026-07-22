Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B3C33936E
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718374; cv=none; b=aPRZQ6N1kdwo5MtET9sBicNlJXkqNUfAwJnR+Hl4fJpt24E1nVPiwNkYqBchlRc9addW+G55pTj75QMRmRgdIW6wAJVPXmZHSfYpAw5lzDFkjGF36pgMSVgZYvmJ/5akEsByUBW890I5MqpBF7yizOCYWI45a/XZKRnc44sM51o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718374; c=relaxed/simple;
	bh=9BOlIEkclFHJBq0H0ALh/aLLtj89vJw8ilBhJtiQmpc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nqlp/tbnQyQrSsmq07AIESJOg6f1/LA1Szb2Kp+elijcTE+DQeCTVOebvc7silM9F0c0/ws4I7yi6CPxcVaDsZozYTtq4pYdPQpMUr3RVOm+TdXTXELv8J+YWFijefqO5blGNvMFc0WDnQeAH4VMQWRYoIPN4Cuy3P6A6KTE0SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g9zkO0+u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g9zkO0+u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B6D1F000E9;
	Wed, 22 Jul 2026 11:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784718372;
	bh=nCsPPTrjWGZXNC2I2PoPQeGbGJ6ItzrggLref01eScs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g9zkO0+u9EquYDZZvoBMHOMViEhTZAo6PRbjPeSceqIv36TKHo1Gsrxk6BvpyKx5W
	 trp9QGpg3JjP9b/3fBLvhCny56JCLqSt30ARW/+xFFdAKMPgmp6o0oyy7W0X5FvfF9
	 otRnNQ/bp2e/ZhEd4uRCDgf3WKj9AJaLoA3RewJ56xMBY3jpKSegJQ40PolF+JDYxg
	 Hzp3fz63YPJ+ijlpzrVF5N64hGw2kSSz7+jStrwppiEOZzXatiqlpYjQQpJ6ei+096
	 YcavxSimnENyUZwBnaOex5xiW3loNDze4quo/ks/o8pXRoV1rD/CPqAfPFEh5Jjkql
	 x2Wr9kMlye5yA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260722-mira220-v7-2-dd5f1de98cd4@ideasonboard.com>
References: <20260722-mira220-v7-0-dd5f1de98cd4@ideasonboard.com>
 <20260722-mira220-v7-2-dd5f1de98cd4@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 11:06:11 +0000
Message-Id: <20260722110612.47B6D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] mira220_set_ctrl() calls pm_runtime_put_autosuspend() when pm_runt=
ime_get_if_in_use() returns a negative error code, leading to an unbalanced=
 usage counter decrement.
- [Medium] Bayer pattern format lookup incorrectly inverts the horizontal f=
lip state.
- [Medium] The driver intends to support dynamic frame windowing via the .s=
et_selection API, but a missing implementation and hardcoded format limits =
completely break this functionality.
--

--- Patch [2]: [PATCH v7 2/2] media: i2c: Add driver for AMS-OSRAM Mira220 =
---
commit 77ddbce8591f62cf6c1a56ccec765a03bc96c140
Author: Philippe Baetens <philippebaetens@gmail.com>

media: i2c: Add driver for AMS-OSRAM Mira220

This commit adds a V4L2 subdev driver for the AMS-OSRAM Mira220 image senso=
r.
The driver implements support for monochrome and RGB variants, dynamically
handling CSI-2 configurations and various image formats.

> diff --git a/drivers/media/i2c/mira220.c b/drivers/media/i2c/mira220.c
> new file mode 100644
> index 0000000000000..5f48648649269
> --- /dev/null
> +++ b/drivers/media/i2c/mira220.c

[ ... ]

> @@ -0,0 +1,2068 @@
> +/* Get bayer order based on flip setting. */
> +static u32 mira220_get_format_code(struct mira220 *mira220, u32 code)
> +{
> +	unsigned int i;
> +
> +	if (mira220_is_mono(mira220)) {
> +		/* for now only support Y10. */
> +		for (i =3D 0; i < ARRAY_SIZE(mira220_mbus_mono_formats); i++) {
> +			if (mira220_mbus_mono_formats[i] =3D=3D code)
> +				return mira220_mbus_mono_formats[i];
> +		}
> +
> +		return mira220_mbus_mono_formats[0];
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(mira220_mbus_color_formats); i++) {
> +		if (mira220_mbus_color_formats[i] =3D=3D code)
> +			break;
> +	}
> +	if (i >=3D ARRAY_SIZE(mira220_mbus_color_formats))
> +		i =3D 0;
> +
> +	i =3D (i & ~3) | (mira220->vflip->val ? 2 : 0) | (mira220->hflip->val ?=
 0 : 1);

[Severity: Medium]
Is the horizontal flip logic inverted here?=20

If hflip->val is 0 (disabled), this evaluates to 1 and adds the offset for =
the=20
horizontally flipped Bayer format. This might cause userspace to receive an=
=20
incorrect Bayer pattern and swap colors during debayering when horizontal f=
lip=20
is left at its default value.

> +
> +	return mira220_mbus_color_formats[i];
> +}
> +
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

[ ... ]

> +	/* Update the format code to adjust it to the new flip state. */
> +	if (ctrl->id =3D=3D V4L2_CID_VFLIP || ctrl->id =3D=3D V4L2_CID_HFLIP)
> +		format->code =3D mira220_get_format_code(mira220, format->code);
> +
> +	if (!pm_runtime_get_if_in_use(&client->dev))
> +		return 0;

[Severity: High]
Could this check fail to handle negative error codes?=20

pm_runtime_get_if_in_use() can return -EINVAL if runtime PM is disabled. If=
 it=20
returns a negative value, the ! operator evaluates to false. This allows th=
e=20
function to proceed to hardware accesses and eventually call=20
pm_runtime_put_autosuspend() without a successful get, leading to an=20
unbalanced usage counter.

Should this check for <=3D 0 instead?

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
> +		ret =3D mira220_write_exposure_reg(mira220, ctrl->val);
> +		break;

[ ... ]

> +static const struct v4l2_subdev_video_ops mira220_video_ops =3D {
> +	.s_stream =3D v4l2_subdev_s_stream_helper,
> +};
> +
> +static const struct v4l2_subdev_pad_ops mira220_pad_ops =3D {
> +	.enum_mbus_code =3D mira220_enum_mbus_code,
> +	.get_fmt =3D v4l2_subdev_get_fmt,
> +	.set_fmt =3D mira220_set_pad_format,
> +	.get_selection =3D mira220_get_selection,

[Severity: Medium]
Should this structure include a .set_selection callback?=20

The comments in mira220_update_pad_format() mention that the correct API to=
=20
configure windowing is the .set_selection one, but it appears to be missing=
=20
here. Since mira220_set_framefmt() also forces calculations based on the ma=
x=20
format dimensions, this omission might leave the crop rectangle immutable a=
nd=20
lock the sensor to its maximum resolution.

> +	.enum_frame_size =3D mira220_enum_frame_size,
> +	.enable_streams =3D mira220_enable_streams,
> +	.disable_streams =3D mira220_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops mira220_subdev_ops =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-mira220-v7=
-0-dd5f1de98cd4@ideasonboard.com?part=3D2
