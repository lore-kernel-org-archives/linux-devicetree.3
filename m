Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7613CAE97
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779320320; cv=none; b=erypqhCbb8qnPcDYDYw+/tqezvGFR9aleFr+Eg4WrkrQCRLB828QsLjl378Pu1r6JN6vPdF2B9AXAgIqd1oB1AJ2Bsw3rqOosDLkf2UlGMpBi/BnuiZ54OUiP656dbjBrmmgYgNDdf0P/F5qk8LaTcvzxaHIq+Fg2eiBtHCPiVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779320320; c=relaxed/simple;
	bh=DXgBXwQkgv+4228decZz9IBo+UgM5QPbq1mjliA7PCY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NBD8zqqSpRU1ffM+Novn/Vnm1MHMrjcT1qUmZ3XtLKQmcTZQ0nFuHdGynd0T5wkqJggK+8jmcxAb6DLS2+o5EBboQzJapyV7sCvrKUuLCLvroVvSMyHsMDXm7TZoOkbDN3o/v+Twv3Fo7knZNcuQ6v82F4tLqcFnPoElReB8Tf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9DH8YhC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9DH8YhC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680481F000E9;
	Wed, 20 May 2026 23:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320318;
	bh=JZfbkEXzOt1hkhAXqFZEywbkVnRfMLZacGXxkX5NQlI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N9DH8YhCqa45xURO0p53o45A05DDvt4jIleTQZ9UpaF0bDD/qq1Si2cBVETxEiaEo
	 FOT9hhmHeRRG/6bjS4u1uAI6Z78t3iOSP7af2JzSp8K9rVK1SD9AJSQI0Vlr+OzCIp
	 QzRBlf3P0YCqTtr5Q3VgbGhDE8AV39DP8vPMyXM64F+A0Ayf16v1nb6YccGkb/ji/f
	 Hi2mzWPPOZ2F8WGqb6mzRaoS3U+CsjEpTq5TvzDR8d66d4J35V+D2sNlF/3bVBDYD6
	 uGaKHjujC9ae5Vly2MtViICbAVDXR3YuOUKnyd8V1ZbK0hH3VVkrc9arx/PHMrb8AJ
	 n89FSjaWB09Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 08/28] media: rockchip: rga: use stride for offset
 calculation
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260521-spu-rga3-v7-8-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-8-3f33e8c7145f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 23:38:38 +0000
Message-Id: <20260520233838.680481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized kernel stack memory leaked to hardware registers for=
 single-plane formats.
- [High] Off-by-one error in bounds check in `fill_descriptors()` leads to =
a heap out-of-bounds write.
--

commit 8040edb1ab2c85b890cca91aa20040c2c51b950c
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: use stride for offset calculation
   =20
Use the stride instead of the width for the offset calculation. This
ensures that the bytesperline value doesn't need to match the width
value of the image.

> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/medi=
a/platform/rockchip/rga/rga-buf.c
> index bb575873f2b24..65fc0d5b4aa10 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -14,7 +14,6 @@
>  #include <media/videobuf2-dma-sg.h>
>  #include <media/videobuf2-v4l2.h>
> =20
> -#include "rga-hw.h"
>  #include "rga.h"
> =20
>  static ssize_t fill_descriptors(struct rga_dma_desc *desc, size_t max_de=
sc,

[Severity: High]
This isn't a bug introduced by this patch, but does fill_descriptors() cont=
ain
an off-by-one error in its boundary check?

When iterating through the scatter-gather table, it performs this check:

    if (n_desc > max_desc)
        return -EINVAL;

Since max_desc represents the exact number of remaining slots (passed as
rbuf->n_desc - curr_desc), an equality check (>=3D) might be needed to prev=
ent
writing a 32-bit DMA address one element past the end of the allocated arra=
y.

Can userspace trigger a heap buffer overflow by queuing a buffer with more
memory pages than the precalculated f->size / PAGE_SIZE?

[ ... ]
> @@ -148,7 +152,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
>  	/* Fill the remaining planes */
>  	info =3D v4l2_format_info(f->fmt->fourcc);
>  	for (i =3D info->mem_planes; i < info->comp_planes; i++)
> -		offsets[i] =3D get_plane_offset(f, i);
> +		offsets[i] =3D get_plane_offset(f, info, i);
> =20
>  	rbuf->offset.y_off =3D offsets[0];
>  	rbuf->offset.u_off =3D offsets[1];

[Severity: High]
This is a pre-existing issue, but does this leak uninitialized kernel stack
memory to the hardware?

The offsets array is allocated on the stack but not zero-initialized. For
formats with fewer than 3 planes (like RGB565), the subsequent planes are
never populated by the loops in rga_buf_prepare(), leaving indices like
offsets[1] and offsets[2] with garbage stack values.

These values are then unconditionally assigned to rbuf->offset.u_off and
rbuf->offset.v_off, which eventually get written to hardware base address
registers. Could this lead to unintended memory reads or IOMMU faults?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-spu-rga3-v=
7-0-3f33e8c7145f@pengutronix.de?part=3D8
