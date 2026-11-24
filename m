Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542356;
	b=pe2YYOaHxGddWyl7zaBVSb0Sk4psd+KpFv1P475d550ONiNx3Dx5/3uBFrCpJpvKBc+9
	 enqVQoTGfbV14K+ivLU8Y+g40I/1iVXS/KIQ45o1AOHpqhnfD5UgwOFZIHHGiLuMAp5Ac
	 JRZOHVk280JOvYwgWPL3H5d7N/lDlRqaajI98rj15ee0sGjSgZ/Yuvy2ng6WqoZ8+CvOh
	 48lVHKAHoDL+vER8LJ5G/G9DrVXFhStS1sytT+yLu13WxzFlevJr5p7lofIMErI0Czon0
	 v0jotws2XXhChrsvGpiazXZVvxsKnY+VX4eX/3kO3mfIzsuWPlS8ZBB1sPmgs3aESSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542356;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YznYYJhY0ypWjja5Lgfcy1HGOSqzuxpF0Vc4WlLjQ0M=;
	b=IQj63H+JQEtvWsHGp27YBXhnk1aSZlOkaOzWJrWay/vwwpyGWTEmhxLiak0/DcoSvo71
	 ne+b77U3YTF6cb/ZqxY0EVoa4AGo+xphh0oQVSopGQGd34mUVAqhW/VRimG8+tTUEjNVD
	 RFsmyXSxLbPV3tb6RAuxEDr5wbUjoLQ374bwGKYxZj+GCyCb1cxZg7AgWk6RleMykoZvy
	 7zDbGvbjc8loDcPV4dF4ONtWjlsV4lQMMn+RVpZ42sGhcFdHsqLKJGo6wXlZxCg7W/e2H
	 8LpRcEDWh8aJiNQKZfOXsUJXci/uvME3tLbhx/N1nOK7qO+mZUXxuafP6drzKCpuU/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HvYVRZBM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ACC606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HvYVRZBM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94FFE1F000C0;
	Tue, 24 Nov 2026 17:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542355;
	bh=YznYYJhY0ypWjja5Lgfcy1HGOSqzuxpF0Vc4WlLjQ0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HvYVRZBM4L3cwXC9+LR4bo8GFtQ3GTBdETReX+DVKxFwdU19LyuTN+E1J55Vw6+6+
	 860A/FSxv9rNHkfuMfscm3EvHj7RJyxZ6h85r6qHBACz8ByOfQWCJiE6XGruy15aG/
	 R5kW4c6cEJoYKUGqYpLkuDnkAOv5p4V1CqW3zgPb6NymoNmAoWgeInXb8zmierzBjZ
	 HH9uIwJl/TwRboOQR6kKi3rXrMGvYbykOi0d9/dTbA5gsP0WZd+wvYJqcLyY9IGao6
	 De1RNjmNq+ZZSEXTcxtjlQ1nOIBfopEfIAs8g/VT589e24itC9NHsl7urHHTcr+qQU
	 zBEU0HB0FxhBQ==
Message-ID: <sashiko-outbox-231739@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 22/24] media: mali-c720: Add parameters video node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anthony McGivern" <anthony.mcgivern@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-22-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-22-0cb9bde1bd30@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:45:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] media: mali-c720: fortify_panic() in
  mali_c720_params_buf_prepare()
--

commit e3100256e90cde8dbdd6f531f1884f00ae417d6f
Author: Anthony McGivern <Anthony.McGivern@arm.com>

media: mali-c720: Add parameters video node

This commit adds a metadata output video node that validates and copies
queued userspace ISP parameter blocks into the context register image for
CDMA loading.

> diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-params.c b/dr=
ivers/media/platform/arm/mali-c720/mali-c720-params.c
> new file mode 100644
> index 0000000000000..e6e0ca070f0ea
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-c720/mali-c720-params.c

[ ... ]

> +static int mali_c720_params_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct mali_c720_params *params =3D vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +	struct mali_c720_params_buf *buf =3D to_mali_c720_params_buf(vbuf);
> +	struct mali_c720 *mali_c720 =3D params->mali_c720;
> +	struct v4l2_isp_params_buffer *config =3D vb2_plane_vaddr(vb, 0);
> +	struct dma_buf *dbuf =3D vb->planes[0].dbuf;
> +	size_t block_offset =3D 0;
> +	int ret;
> +
> +	ret =3D v4l2_isp_params_validate_buffer_size(mali_c720->dev,
> +						   vb,
> +						   v4l2_isp_buffer_size
> +						   (MALI_C720_PARAMS_MAX_SIZE));
> +	if (ret)
> +		return ret;
> +
> +	if (dbuf) {
> +		ret =3D dma_buf_begin_cpu_access(dbuf, DMA_FROM_DEVICE);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/*
> +	 * Copy the parameters buffer provided by userspace to the internal
> +	 * scratch buffer. This protects against the chance of userspace making
> +	 * changes to the buffer content whilst the driver processes it.
> +	 */
> +	memcpy(buf->config, config,
> +	       v4l2_isp_buffer_size(MALI_C720_PARAMS_MAX_SIZE));

[Severity: High]
Can this memcpy() trigger a fortify_panic() when CONFIG_FORTIFY_SOURCE and
CONFIG_CC_HAS_COUNTED_BY are enabled?

Both buf->config and config are typed as struct v4l2_isp_params_buffer *
(an alias of struct v4l2_isp_buffer), which declares its flexible array as:

include/uapi/linux/media/v4l2-isp.h:
	struct v4l2_isp_buffer {
		__u32 version;
		__u32 data_size;
		__u8 data[] __counted_by(data_size);
	};

Fortified memcpy() evaluates __builtin_dynamic_object_size() on both
pointers using offsetof(struct v4l2_isp_buffer, data) + ptr->data_size.
At this point buf->config->data_size has not been populated yet (holding 0
or a prior frame's size), and config->data_size is smaller than
MALI_C720_PARAMS_MAX_SIZE whenever userspace queues a subset of parameter
blocks, so the bounds check against
v4l2_isp_buffer_size(MALI_C720_PARAMS_MAX_SIZE) fails and panics the
kernel.

Typing config as void * (or copying through a void * destination before
populating data_size, as v4l2_isp_params_validate_buffer() does) avoids
evaluating the __counted_by(data_size) bound during the copy.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-b4-initial=
-upstream-candidate-v1-0-0cb9bde1bd30@arm.com?part=3D22
