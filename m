Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793967;
	b=tV/SMpf2p27vv3dOxYNGffunS181CjuZT95XAZ+H0NOvxw0RoVqvYT34zdkBTZejNBpI
	 XznFAoaUUjFp6zL9QVneHplONMAcltMc1LDvCVIlsRSrcWsAsjUoUNXbUbJhOSJ9W2g2O
	 gIxHtBGMtw3carjLfWgZDCSPTCXYEpqL2+pyVfFucs77OM/PhVxI210JI4UAcX2aHIgY+
	 FKLSY6038rlyffh7uz6JZVZ/dzxwSTVgBscZWHkWxl6FY5KNQWLxcCm0RyDoZMw66lFKt
	 LoX7/BqDFtGNQmX+r+1WMn6Nhul05JoHVGJJogJlSCRk7+9kl6P/R5XBmXt7KU1nxqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793967;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rfM0u1zCE7nWYkY5uVzl+iWlmn5xLbVItYx7nMiiqmo=;
	b=44/cznhUV/BnaW5xfJ8wLrChHVKTzEUYmDZUM1kMZJ1KFrOXY6xc4+13dxebOdqrvlxN
	 HGefgdJ2DlI+ZJxB+KUsJYnRprwfFSZq5qJnZP9maEDePK8Dk19ewGRzK8s/ZN/uerLal
	 Y3fE0ZqNjWJHUfcl/9XUCYjWFtLms+sMr9+uDHjuZCHvhy8D1X8erq1SouW11gsgSh4G9
	 D4PYuxxB2rLCNYaZ3AHMurG4VEr58yMTxTZzaPj3ahKg++mZKc/PZt6WqYiE59mwiXCVE
	 STWAvdQKhIKuBm1mcAdZJSmhaXKKf6fVhCczM5l2xvPXMJKehs/Q4utTVhUHTZNSEoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CgEzU4BZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DA9606A32F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 01:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CgEzU4BZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C4F51F000C5;
	Mon, 16 Nov 2026 01:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794793967;
	bh=rfM0u1zCE7nWYkY5uVzl+iWlmn5xLbVItYx7nMiiqmo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CgEzU4BZjr2njENGEXHY4slIbi58WgzvAq4eiyDOYLw2YV+V1ERBduLtFMYq91AKw
	 E00A/Mfyby5LzzY8TCH6cKphNx60JY9BlY0ZDm0AIk7iJW8GbnnszR9HtBOukHEo/4
	 9h5LERdrjpS7W+icmIvwqLc/jWxS1AtSfeZ7pbtT4CNs4zzPRkMW/KC3cskHzOCWep
	 uNbLOZW4dslMDXt86541lUHz0yS3E/4cGT79UUQrayh2xHmlQmFnZL/+MBzeIAR0Gt
	 AXba+pSUcM4T4hXZWh/gOScSLe8qnGYj/1cK/mwS9alxqu6zFqQXFv2+kkK56ffIJ3
	 DO3JBZ8a8+iPQ==
Message-ID: <sashiko-outbox-216017@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 06/13] media: mediatek: jpeg: fix buffer state
 update timing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261116013402.1273016-7-kyrie.wu@mediatek.com>
References: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
 <20261116013402.1273016-7-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 01:52:46 +0000
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
- [Low] media: mediatek: jpeg: inaccurate done-queue commit log and
  missing Fixes tags
--

commit f59ad92b8e09a13f32b7826bdddbfafbfe79fb42
Author: Kyrie Wu <kyrie.wu@mediatek.com>

> media: mediatek: jpeg: fix buffer state update timing
>
> Publish destination context and frame tracking metadata only after the
> decoder has selected a hardware core, resumed runtime PM, and prepared
> the destination. Publish it before arming the timeout or starting hardware
> so completion observes initialized state.
>
> Stop walking the done queue after completing the next expected frame;
> remaining buffers must wait for their own frame order.
>
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

[Severity: Low]
Is the second paragraph of the commit message accurate about what the added
break statement does in mtk_jpegdec_put_buf() and mtk_jpegenc_put_buf()?

In both functions, list_for_each_prev_safe() is nested inside an outer loop
that checks pos !=3D &ctx->dst_done_queue:

drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:mtk_jpegdec_put_buf(=
) {
	...
	while (!list_empty(&ctx->dst_done_queue) &&
	       (pos !=3D &ctx->dst_done_queue)) {
		list_for_each_prev_safe(pos, temp_entry, &ctx->dst_done_queue) {
	...
}

Without the break, list_for_each_prev_safe() always ran until pos reached
&ctx->dst_done_queue, ending the outer while loop after a single reverse
pass even if frame N+1 was already queued behind frame N.  Breaking out of
the inner loop while pos !=3D &ctx->dst_done_queue causes the outer while
loop to restart the scan from the tail of dst_done_queue for the
incremented last_done_frame_num, completing consecutive ready frames rather
than stopping the walk.

Also, since the patch fixes the done-queue loops in mtk_jpegdec_put_buf()
and mtk_jpegenc_put_buf() as well as the ctx->total_frame_num increment
placement in mtk_jpegdec_worker(), should it include the following Fixes
tags in addition to dedc21500334 ("media: mtk-jpegdec: add jpeg decode
worker interface")?

  Fixes: 7915282498e3 ("media: mtk-jpegdec: add output pic reorder interfac=
e")
  Fixes: 841a58decd87 ("mtk-jpegenc: add output pic reorder interface")
  Fixes: 52f68114857f ("media: mtk-jpegdec: refactor jpegdec func interface=
")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116013402.1273=
016-1-kyrie.wu@mediatek.com?part=3D6
