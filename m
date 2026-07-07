Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3E11A6823
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783445857; cv=none; b=Wmct2VNIuwE5uEqUQfyL+DqKXOM8ie35KfaLAtY8RQcKn8datxHg25fcD90yHvSKUDHnzAAd0wNGs0f0unUUcvEYpO5r3HYu9+ACC8w9SpGUyaL1GqVyhx49TaW6DpKvRwgXNQINLsMGmDSZF5puWLJTyX5t/lsfrNl8s3c2+RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783445857; c=relaxed/simple;
	bh=gdNRebRtTJKs3ZNnZas/r13JQ9ImI8LnnwxXiSV0jvE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oXtQF+a/Ke+qcukesHALjLnQtgt92xsfRPiCq9tAyPWcfhF/zllxdOgyTpHFAL/os5U65pftIf7QSrY82Jqdpkq+XHnhHjpLfxjyqrHIWCJP+orE+ZZUnVpauxfPIDKown106+z2gYIB6IeH3OyIWqD6UlloH7D+3uA3fU7VCE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXZgoH01; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXZgoH01"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86FE91F000E9;
	Tue,  7 Jul 2026 17:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783445855;
	bh=qzYlUjur1vf/QZ4m16Qp2+sO9WaZCEBk8Xo5E3dDgpw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iXZgoH01bp9+DuadL5eTq3mtUsscrk6mRZJqi4O2Vkf2tRRHBo+o8jPXseppcFrqJ
	 vk0HYjUal5Zw8WCTuEhHLSmfcy5vZkkzM2JqBeSzAhIHi3DTYdskki2qkNPbmLaA82
	 qiAfumfK6vFdeX1SMW6Pin/9Z8fBmzHkCiAip6dvmjfyS/C/1uZwKVj+WSqaK+uPcJ
	 bmRzAhflPTQCiAZW+HsAnYzIrVgJb2V1fW2YptGAoK0VRvt6CbyjrejeyAWJRruy8f
	 WiNdv9pUo9h0UvRWj86PTWUWDeVVcdvSJRuezEByBov1rVkTt/tAOJWzpygg9eHYHH
	 AmRlnZrXl4pPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 20/20] media: imx355: Remove storing cur_mode in the
 state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707-media-imx355-v2-20-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
 <20260707-media-imx355-v2-20-1683ec07b897@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 17:37:35 +0000
Message-Id: <20260707173735.86FE91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `imx355_set_stream` function and its callee `imx355_start_stre=
aming` execute without acquiring the subdevice active state lock, leading t=
o `lockdep_assert_held` failures and data races with controls.
- [High] Use-after-free of subdev active state in `imx355_set_ctrl()` durin=
g device unbind due to incorrect cleanup ordering.
--

--- Patch [20]: [PATCH v2 20/20] media: imx355: Remove storing cur_mode in =
the state ---
commit d3278174d03d9c643934fc21a9e1c67e3a90a3fb
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx355: Remove storing cur_mode in the state

All the information for the mode is now stored within
the subdev state, so configure the sensor based on that.

> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index bb620ebb074f7..f31833e5d1d12 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -594,6 +591,8 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct imx355 *imx355 =3D container_of(ctrl->handler,
>  					     struct imx355, ctrl_handler);
> +	const struct v4l2_mbus_framefmt *format =3D NULL;
> +	struct v4l2_subdev_state *state;
>  	s64 max;
>  	int ret;
> =20
> @@ -604,7 +603,7 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
>  	switch (ctrl->id) {
>  	case V4L2_CID_VBLANK:
>  		/* Update max exposure while meeting expected vblanking */
> -		max =3D imx355->cur_mode->height + ctrl->val - IMX355_EXPOSURE_OFFSET;
> +		max =3D format->height + ctrl->val - IMX355_EXPOSURE_OFFSET;

[Severity: High]
Can this dereference a freed active state?

If the driver is unbound (e.g. via sysfs) while a userspace process
concurrently accesses a v4l2 control, imx355_remove() is called.

In imx355_remove(), the active state is freed before the control handler:

imx355_remove()
    v4l2_subdev_cleanup(sd);
    media_entity_cleanup(&sd->entity);
    v4l2_ctrl_handler_free(sd->ctrl_handler);

This leaves a window where the concurrent ioctl can acquire the control loc=
k,
enter imx355_set_ctrl(), retrieve the now-freed active state, and trigger a
use-after-free when reading format->height.

[ ... ]

> @@ -809,9 +804,11 @@ static int imx355_entity_init_state(struct v4l2_subd=
ev *subdev,
>  /* Start streaming */
>  static int imx355_start_streaming(struct imx355 *imx355)
>  {
> -	const struct imx355_reg_list *reg_list;
> +	const struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_subdev_state *state;
>  	const struct imx355_mode *mode;
>  	int lane_idx =3D imx355->hwcfg->num_lanes =3D=3D 4 ? 0 : 1;
> +	struct v4l2_rect *crop;
>  	u64 link_bitrate;
>  	u8 binning_mode;
>  	int ret =3D 0;
> @@ -820,25 +817,29 @@ static int imx355_start_streaming(struct imx355 *im=
x355)
>  	cci_multi_reg_write(imx355->regmap, imx355_global_regs,
>  			    ARRAY_SIZE(imx355_global_regs), &ret);
> =20
> -	/* Apply default values of current mode */
> -	mode =3D imx355->cur_mode;
> -	reg_list =3D &mode->reg_list;
> -	cci_multi_reg_write(imx355->regmap, reg_list->regs,
> -			    reg_list->num_of_regs, &ret);
> +	/* Apply values of current mode */
> +	state =3D v4l2_subdev_get_locked_active_state(&imx355->sd);

[Severity: High]
Does this code execute without acquiring the subdevice active state lock?

Calling v4l2_subdev_get_locked_active_state() will trigger a lockdep failure
if the lock is not held.

This can happen when starting the video stream via userspace invokes the
.s_stream callback:

imx355_set_stream()
    imx355_start_streaming()
        state =3D v4l2_subdev_get_locked_active_state(&imx355->sd);

Since imx355_set_stream() doesn't acquire the lock before calling
imx355_start_streaming(), this triggers a lockdep failure.

Additionally, the missing lock leaves the subsequent calls to
__v4l2_ctrl_handler_setup() and __v4l2_ctrl_grab() unlocked, exposing a data
race with concurrent userspace control updates.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-media-imx3=
55-v2-0-1683ec07b897@raspberrypi.com?part=3D20
