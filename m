Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798DC4A4F19
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069513; cv=none; b=slfoEnP1t+b6dvlnwGTl+42cJmZBqbwFUynm5n2/apeRUhgtB7LDbypaFSQf9cFRip/lMrycWYkMermmxciFCNa286DMvc4Go62w8VtqFx/U+nfo4JBaz65n92uzU2awEAhG6noq7zyJTbTrnjJCrNihtOhuLQz3L+80nzGeoSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069513; c=relaxed/simple;
	bh=IqdyB/Qz2NJPn2sSzWp5RQsj4qIiL+R+d6lQMTMNZ50=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ABVojoMdfQGa6s60SNpW0sv1iaIkvCT+mh3vukDn96JjQHiJ/tcaKwZ0qWWREZ3Bix5oMkTgHiVp1gP0JBrZsSY2Tzsyku/CUGNTtahn6DW4H9a+oLUbAdf1osJMMDf1idQJlKrjIY28/1qVnrluTeWgbEMBWzQRlNnVseoUwJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WrOaNJWP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WrOaNJWP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41351F000FF;
	Tue, 22 Sep 2026 09:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069511;
	bh=UqJ/gGKL9G08hLDpf3wPle5372Vn7jSJUpmycGO76M8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WrOaNJWP2b71OdIVTt0aH0jXjri51OWR0G4xsrwYH0B17Mon3oX02QSk7baEbWrXH
	 f45rtuuzVutDakzL9nplXnwGkF/X9qJY51QTTwpLmasOx+qpFDqlV+EhzO95QWKvsG
	 iZiFNVITzqQSqyC/tLM0uSjlkPV226K12sO4vFtUdBRWhyLoseDwm2D/a6G6PEXCzC
	 9t4971iuwmNw0q1Pb2C8gomxMYyGNHiBJazz/09V0qfxIGUC5yGigX1M7J1bx/7NQw
	 GRoCOWyvQ/TAyozGPt17tk7DZjcabEJk2DkKuhwhGkV8K3MY9NBYgvW2v2DMhJuQ+B
	 X19Y0A4U35zmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 06/12] media: mediatek: jpeg: fix buffer state
 update timing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260922091530.241762-7-kyrie.wu@mediatek.com>
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-7-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:31:50 +0000
Message-Id: <20260922093150.C41351F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: mtk-jpeg: Use-After-Free in mtk_jpegdec_worker on timeout r=
ace
--

commit 44ce2c64fc6b5a268c3679b0da3fbbbb9bc8ce15
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix buffer state update timing

This commit delays the update of the destination buffer state until after t=
he
decoder has selected a hardware core and resumed its runtime PM state. It a=
lso
protects the buffer state update with the hardware spinlock and stops walki=
ng
the done queue after completing the next expected frame.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index a5a1f6126af73..e152ebae0f219 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
[ ... ]
> @@ -1773,6 +1767,9 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
>  			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
> =20
>  	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
> +	jpeg_dst_buf =3D mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
> +	jpeg_dst_buf->curr_ctx =3D ctx;
> +	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;

[Severity: High]
If mtk_jpegdec_worker() is preempted immediately after schedule_delayed_wor=
k(),
but before acquiring the spinlock, could the timeout handler run?

If the timeout handler executes during this window, it could reset the hard=
ware
state to idle and complete the buffers back to userspace (where they might
subsequently be freed).

When the worker thread resumes, would writing to jpeg_dst_buf->curr_ctx and
frame_num result in a use-after-free?

Could the hardware then be programmed to DMA into those potentially unowned
addresses?

>  	ctx->total_frame_num++;
>  	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
>  	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922091530.2417=
62-1-kyrie.wu@mediatek.com?part=3D6
