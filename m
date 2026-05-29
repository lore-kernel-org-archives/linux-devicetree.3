Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6223336E49B
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780052043; cv=none; b=YQq8yDnb5dKHy89sHvE5Hwl51Ch4ZOtueXUVai2Ak+FYmO61YjLxHtyyVdthU+pM4LVHwsfeMtoLw36JmLGqj4+QYfTJxSge3li0DN6lN/RRSLHYEa7TIth/rXAWyTDFUmWzF0z1U/JKsFb6jZDqmgBtUkNUo+EZswwSM5ovx6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780052043; c=relaxed/simple;
	bh=viku++Zw7KgFgmnxC++DLbWQaSPxBs71RvaI/2/UIbs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W9gQCQubicRKnWCACcP/c8QUITaU5slXzn09ccbtSsbgIIiFGlnYntfJPXcdWzpLtZvWuCs2x+P1hwRMevVvyqhYQr28LL5KO5w05q4x7xPHB8lhQWw7+7QoBSs2on6mmukuWUm72s/BZlirkeIqUYI7N1CY93FJmXUxqDm/uos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNAfVWcp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNAfVWcp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22101F00893;
	Fri, 29 May 2026 10:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780052042;
	bh=1jVAiOPTKMVxdKTC4s8ErzVBRNi8ToyrYr6ifHsXvAk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZNAfVWcpfDlDDajoPAfSWWqkpJLqylpOT5Yz9VBpGSH8MZUvLFFe4xHSu0e5mQ2/p
	 4rX0L+YTNy8toOSzDhe8QuS8C8zaidKkGAajFSAsQnMrJMkxAKYFonNeTQmw9xi3gQ
	 r7FyVU/KaQhlodT+krn1+i0xe3ljoX9d6jY8kQqlkQf5wOywt/ax+/HeJYrGsehK2s
	 pQJAzksd6ckbel/6hcmmZ0RMtXqU8IV1LhAQLJQC9Ga/RZ6jb/Aewqg9j3gLk0exeI
	 WNNaXJ+YxTzUvwDZuT5ma5yAz/RSZpFKcI7ak9zApEl16/BFmn9985S5SBVHGaufkQ
	 MwL46PfWKWG3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] drm/tiny: add support for PIXPAPER 4.26
 monochrome e-ink panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "LiangCheng Wang" <zaq14760@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260529-bar-v3-2-5c2ac1c751ee@gmail.com>
References: <20260529-bar-v3-2-5c2ac1c751ee@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 10:54:01 +0000
Message-Id: <20260529105401.D22101F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `pixpaper_plane_atomic_update` function executes blocking oper=
ations and sleeps, which violates DRM atomic context constraints.
--

commit 430b1d964958c07f88c16103075446b46aaf5cb1
Author: LiangCheng Wang <zaq14760@gmail.com>

drm/tiny: add support for PIXPAPER 4.26 monochrome e-ink panel

Introduce a DRM driver for the Mayqueen Pixpaper 4.26 monochrome e-ink
display panel, which is controlled via SPI. The driver supports an
800x480 display with XRGB8888 framebuffer input.

> diff --git a/drivers/gpu/drm/tiny/pixpaper-426m.c b/drivers/gpu/drm/tiny/=
pixpaper-426m.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/pixpaper-426m.c
[ ... ]
> +static void pixpaper_plane_atomic_update(struct drm_plane *plane,
> +					 struct drm_atomic_state *state)
> +{
[ ... ]
> +		dst =3D pixpaper_prepare_buffer(vaddr, fb, &dst_pitch, &err);
> +		if (err.errno_code) {
> +			drm_err_once(drm, "Failed to allocate temporary buffer\n");
> +			goto update_cleanup;
> +		}
> +
> +		dst_len =3D dst_pitch * fb->height;
> +		pixpaper_write_image(panel, dst, dst_len, &err);
> +		if (err.errno_code)
> +			goto update_cleanup;
> +
> +		pixpaper_trigger_update(panel, &err);

[Severity: High]
Does this code sleep in an atomic context?

According to the DRM subsystem guidelines, plane atomic update callbacks
execute in atomic context where sleeping is strictly forbidden.

This function calls pixpaper_prepare_buffer(), which performs a sleeping
memory allocation:

pixpaper_prepare_buffer()
    kzalloc(..., GFP_KERNEL);

It also drives the SPI panel update through pixpaper_write_image() and=20
pixpaper_trigger_update(). These functions internally invoke blocking
operations like usleep_range(), spi_write(), and gpiod_get_value_cansleep().

Furthermore, pixpaper_wait_for_panel() polls the panel for up to 10 seconds
using usleep_range().

Executing blocking functions from an atomic context will result in scheduli=
ng
while atomic kernel panics.

Should the hardware screen update logic be deferred to a worker thread, and
memory allocations handled in the non-atomic prepare_fb callback?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-bar-v3-0-5=
c2ac1c751ee@gmail.com?part=3D2
