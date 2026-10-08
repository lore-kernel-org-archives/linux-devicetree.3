Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6253935DA4A
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 16:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791476194; cv=none; b=RYy9NnOBzg59aKD5kIdQaRRU1O2m7Aym0CBayZN3BhjxAzz0L0q9nqvz5DfnnGGHbqD52/xOcYA8MridLcdzYTe/lZgE3cy+HVDqHMqFXaA9LY6xzHXHhWG1lucm2lQwUe5TC3ddlHagbcZH3804FzgD9al9V9ItLTJ5fk2tgNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791476194; c=relaxed/simple;
	bh=H16X3p5BUGEJRJCFXVFB5h8QZ2IbuaLu+16z09xN7Cg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kcSXl0+14QEiZtZoUmg6rGW4RUNWyIPbIqPgk/9n1Bs3ogt2DbK32Zbi3inrFW2IjaOuqDN/yH64HmqYCW/fQnZnMlUoQZXKng33YcXVg0z8inoqI5Y5emiUzg78Y5xGF3Goo/041HsAIptZp07Y1uZfkpRcl170QfDfCN0cZlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cA5wFqa8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cA5wFqa8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808DF1F000FF;
	Thu,  8 Oct 2026 16:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791476192;
	bh=CtH+PhTG7N7FleGwC42B82VuiN/dGk8NDLoGCsqH9wc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cA5wFqa8J0OsfoeaNIQyhEyph7poBmjCqVtm5OaNO8/g2n1zpVTMsQ5AFwqfP3L7W
	 +D+w1UOE7TcdLx2/DFyaVgDRgGxBRf6TJx9LcZiff01djBJEqBLLLyTJiu3qKvvHM3
	 1KDT9Tnsyl3+i1EiRgx+oZSSTEc9QWrwliaYTmhpyoQ5yyzdL+2bjHxEIQg9Ds36xe
	 tcfI13+WA0LV4DWfnCMjm2A3ElmAosLdevY8tvIAx+syD3YslCEP2RsXclmybAo+DE
	 coAIANp8aVm82r/JQZo6YWHi43jWwrYkgAvo27pxywEXF3jUvTF8cAnLi7Roe9Hk7+
	 5hsX9y179dWRw==
Message-ID: <sashiko-outbox-164373@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: i2c: Add OmniVision OV3660 image sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nguyen Minh Tien" <tien.nguyenminh@embeddedlinux.blog>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008160650.73927-3-tien.nguyenminh@embeddedlinux.blog>
References: <20261008160650.73927-1-tien.nguyenminh@embeddedlinux.blog>
 <20261008160650.73927-3-tien.nguyenminh@embeddedlinux.blog>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 16:16:32 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] pm: incorrect pm_runtime_get_if_active() return check leads to unb=
alance
- [Low] v4l2: returning void expression in int-returning ov3660_init_contro=
ls() breaks build
--

commit 2864676387c5f4fec52017c3465e681222f3113b
Author: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Subject: media: i2c: Add OmniVision OV3660 image sensor driver

This commit adds a new Video4Linux2 driver for the OmniVision OV3660
3 megapixel image sensor with an 8-bit parallel DVP interface. It supports
various resolutions and formats, with features like automatic/manual
exposure and gain, flips, and test patterns.

> diff --git a/drivers/media/i2c/ov3660.c b/drivers/media/i2c/ov3660.c
> new file mode 100644
> index 0000000000000..b8b5452285f40
> --- /dev/null
> +++ b/drivers/media/i2c/ov3660.c
[ ... ]
> +static int ov3660_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov3660 *sensor =3D
> +		container_of_const(ctrl->handler, struct ov3660, ctrls);
> +	u64 val;
> +	int ret;
> +
> +	/* the AEC/AGC results are only there while the sensor is powered */
> +	if (!pm_runtime_get_if_active(sensor->dev))
> +		return 0;

[Severity: High]
Does this error handling logic safely account for negative return codes?

pm_runtime_get_if_active() returns 1 on success, 0 if inactive, and a
negative error code (such as -EINVAL) if Runtime PM is disabled. By checking
!pm_runtime_get_if_active(), the negative error condition evaluates to fals=
e,
bypassing the early return.

This allows the execution to proceed with hardware access while the device
might be powered off, and later unconditionally calls
pm_runtime_put_autosuspend() without having incremented the usage counter,
leading to an unbalanced put.

[ ... ]
> +static int ov3660_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +	/* written when the stream starts */
> +	if (!pm_runtime_get_if_active(sensor->dev))
> +		return 0;

[Severity: High]
Can this also bypass the early return on negative error codes?

Similar to ov3660_g_volatile_ctrl() above, negative errors from
pm_runtime_get_if_active() will allow execution to fall through, potentially
causing unsafe hardware access and a mismatched pm_runtime_put_autosuspend()
at the end of the function.

[ ... ]
> +static int ov3660_init_controls(struct ov3660 *sensor)
> +{
[ ... ]
> +	sensor->link_freq =3D
> +		v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_LINK_FREQ,
> +				       ARRAY_SIZE(ov3660_link_freqs) - 1,
> +				       mode->link_freq_index,
> +				       ov3660_link_freqs);
> +	v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
> +
> +	if (hdl->error)
> +		return v4l2_ctrl_handler_free(hdl);

[Severity: Low]
Does returning v4l2_ctrl_handler_free() here cause a build failure?

ov3660_init_controls() is declared to return an int, but
v4l2_ctrl_handler_free() returns void. Returning a void expression inside an
int-returning function is invalid C. It would also fail to propagate the
actual error code from hdl->error to the caller.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008160650.7392=
7-1-tien.nguyenminh@embeddedlinux.blog?part=3D2
