Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793685;
	b=5aIbBS1EwaZF0Ms/apb1mBAzs7BEhZSIti+4sqFzrefTqnuTX3/ZbmsDgFulqAn7zMUZ
	 d5B0vwkZm0ma8v7JxjAumrdsIUQF9tMb0tpNgjoaPB9Zjc6CE4dre/yccm00g9eYKm9Ny
	 CvDFKnXLgP+mtg2qk0RMPEGYKfljYpDcYJquv6If0rgRuSsU/asGVjjc7lPwMAut01EzU
	 LkB3i15kjH5A8FxWoaYpYrKgcH2zIBLgPClqegxA8FYSs8DBG/TRUMTR/pwKgRY0o4eZ5
	 vZaVUnCdEBWGFyQjDzz8jwSSbDlWtO4dC/pO1+v4kEe3C9UtFjpgP7I4100W9hnr3lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793685;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Q+YpYfRqaOT8aZpeKKOJtbzLA6kLnpvwaPz2JHYTgUA=;
	b=KklcndOHd0gaTDBhqFDP1i8dCk09mQy/pV5yG5docrCypOrei+hu94vDkvwmd9hZDhG+
	 fLjB7xrhw8kzixfsrTklCarj1XVhywv2pMetkepgV09GdaoHi1i5j40ewaDKBb4G0aPxl
	 fPCSco4ezgiHiIaU0nrggG6+1CyxYGGaB4P+/eFGgcJnh1GIOp5NE/ApdOuo0+4v9zVKy
	 3FfnUvYFA/kFfjH+DTITg0hU4Pylo+iPHyBQXYZAuTuF9xCHc+EKjRRHoet7sPW/yWBbc
	 s4hC6J9V9C89XuJKzWx94RKLFCg9X3Rk4Wc4lsXChN2+yO6CkpvXghRI2ixbTgGbDqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=laUpBzIL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058C9606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 01:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=laUpBzIL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442F61F000C4;
	Mon, 16 Nov 2026 01:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794793684;
	bh=Q+YpYfRqaOT8aZpeKKOJtbzLA6kLnpvwaPz2JHYTgUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=laUpBzILbx3EEMDffwpjYXRDzpKakxu/DK2DgrDqV58C5nM1/GUc1mzuHz9rQaIeH
	 IjubLmbWj81ed0BxjOVrFcnzWOtOUPPi8f8XSEaAWCXqAlbF32kri0POnRXWH0MLcO
	 Gh7SyJIcn6uQ1sIv36gioZFuxzEwBvqHc8wJ60EJpRu9jL/tWtaek4/eTGi8KDzTQw
	 ROdlYI2ZjwOvQZa95+WsUPYnBJS2GmCiar3nz19MXgodB/8rCKVpvF5x7hjG6QHIzS
	 bD+SmbpTT7Y0dRv9Qjpkli++JaJkn1PJbfTcm43CXemWStnZUMPuLo33sxuXs/EuHY
	 fKEYA8Q25Bl6w==
Message-ID: <sashiko-outbox-216010@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 01/13] media: mediatek: jpeg: fix jpeg cores'
 amounts setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261116013402.1273016-2-kyrie.wu@mediatek.com>
References: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
 <20261116013402.1273016-2-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 01:48:03 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] media: mediatek: jpeg: NULL dereference when max_hw_count
  exceeds probed cores
- [Medium] media: mediatek: jpeg: out-of-bounds access from unbounded
  max_hw_count
--

commit 888c2ebff2ebcf833297cbded692a442f2ea0e7e
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix jpeg cores' amounts setting

This commit replaces the fixed MTK_JPEGENC_HW_MAX and MTK_JPEGDEC_HW_MAX lo=
op
bounds with a dynamic max_hw_count derived from the number of child device
tree nodes, and increments hw_rdy as each child hardware device probes.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index e01dd4d80722c..c477f1a4dd178 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1302,6 +1302,7 @@ static int mtk_jpeg_probe(struct platform_device *p=
dev)
> =20
>  	mutex_init(&jpeg->lock);
>  	spin_lock_init(&jpeg->hw_lock);
> +	atomic_set(&jpeg->hw_rdy, 0);
>  	jpeg->dev =3D &pdev->dev;
>  	jpeg->variant =3D of_device_get_match_data(jpeg->dev);
> =20
> @@ -1325,7 +1326,7 @@ static int mtk_jpeg_probe(struct platform_device *p=
dev)
>  		for_each_child_of_node(pdev->dev.of_node, child)
>  			num_child++;
> =20
> -		atomic_set(&jpeg->hw_rdy, num_child);
> +		jpeg->max_hw_count =3D num_child;
>  		atomic_set(&jpeg->hw_index, 0);
> =20
>  		jpeg->workqueue =3D alloc_ordered_workqueue(MTK_JPEG_NAME,

[Severity: Medium]
Can jpeg->max_hw_count overflow the fixed-size enc_hw_dev[], dec_hw_dev[] a=
nd
worker comp_jpeg[] arrays?

struct mtk_jpeg_dev and the workers size those arrays to MTK_JPEGENC_HW_MAX
(2) and MTK_JPEGDEC_HW_MAX (3), whereas mtk_jpeg_probe() sets
jpeg->max_hw_count directly to num_child without clamping or validating it
against those limits.  If a device tree node has more children than the arr=
ay
capacity, the loops in mtk_jpegenc_get_hw(), mtk_jpegdec_get_hw(),
mtk_jpegenc_worker() and mtk_jpegdec_worker() will read past enc_hw_dev[] or
dec_hw_dev[] and overflow the stack-allocated comp_jpeg[] array.

> @@ -1462,7 +1463,7 @@ static int mtk_jpegenc_get_hw(struct mtk_jpeg_ctx *=
ctx)
>  	int i;
> =20
>  	spin_lock_irqsave(&jpeg->hw_lock, flags);
> -	for (i =3D 0; i < MTK_JPEGENC_HW_MAX; i++) {
> +	for (i =3D 0; i < jpeg->max_hw_count; i++) {
>  		comp_jpeg =3D jpeg->enc_hw_dev[i];
>  		if (comp_jpeg->hw_state =3D=3D MTK_JPEG_HW_IDLE) {
>  			hw_id =3D i;

[Severity: High]
Can mtk_jpegenc_get_hw() and mtk_jpegdec_get_hw() dereference a NULL
comp_jpeg pointer when jpeg->max_hw_count exceeds the number of probed child
cores?

mtk_jpeg_probe() counts all child nodes with for_each_child_of_node() and
registers the video device immediately, while enc_hw_dev[i], dec_hw_dev[i]
and hw_rdy are only populated as each child finishes mtk_jpegenc_hw_probe()
or mtk_jpegdec_hw_probe().  If any child node is disabled in DT, defers or
fails probe, or has not probed yet when userspace queues a job,
mtk_jpegenc_worker() and mtk_jpegdec_worker() call mtk_jpegenc_get_hw() or
mtk_jpegdec_get_hw() before waiting on hw_rdy > 0 and dereference
comp_jpeg->hw_state on an unpopulated NULL slot.

In addition, both workers snapshot enc_hw_dev[] or dec_hw_dev[] into a local
comp_jpeg[] array before the retry_select wait loop; if a child probes while
the worker is waiting on hw_wq, the worker will later dereference a stale
NULL comp_jpeg[hw_id] when calling pm_runtime_resume_and_get().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116013402.1273=
016-1-kyrie.wu@mediatek.com?part=3D1
