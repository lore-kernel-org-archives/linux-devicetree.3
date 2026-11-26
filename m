Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691190;
	b=2giBTMy0nnU35BzSm2G1ZAauxMQwYm5f6t63bzZfxhXDSBFqQ+tbT22DMn7Boihbz4hl
	 nD0H2eVrf/IazKc2M+u9IwqcKh2gLUDAzhw4sWy8J2UHujdUk9vq2n6RPU8RC3c6tFF4h
	 9CBEum371eW6e0oH1295ykF7MzKcQ0NPi+7+dZ0uBesABQskLd1Xr4ljwxCgg37nGD8Ap
	 GeHETw0ThwMU3aRgDh2mx/fV6GUXvD3ocrr57iqtx/UbcyXcWOLKOrWbc/AjiwxNX+MaP
	 4iFgvRgvpp4/+kEw1JAESo5ixuV5P/YYr5zavTJT7qHAeUGD5nc45GL8RwDgmoXeNgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=i/lQFYYSgifKwpBl4Z4gLxmp/LsgZ8d5yEoRR702v7k=;
	b=g/vmS1fOJOgtuxqR4R8z0biQQPXAuZ9KevMzjoDG8G+OPjYRsgrVehIlY0JLR6/uW/KQ
	 8IdZquLrN47pZtpPL0uqqetB+7g6jKDgcSrEcxB9HHRkpIlm987NVdI5+D9VeD6zzkJl5
	 walMYyGZRxVe2pNZRkocZez39MbFj5gc9lZcHTJOf3e3wUiagejrV+u2z21RAZ/ueLrvU
	 /lINbifuYYDudK2AIxJi6BTUwQHjE7rsVJv6wrVyRDxhz++gRSz88Jposz8kYKX8d+Fo/
	 O2z/josD2x1UW6dLhu4OuIjE4xffXCbEpYPQNHiVZRu9jDPN8CD01+aZSsHUKfh00MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M1Qafv9H;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB32606A32D
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAB32606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M1Qafv9H
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so5548239a91.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795691189; x=1796295989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i/lQFYYSgifKwpBl4Z4gLxmp/LsgZ8d5yEoRR702v7k=;
        b=M1Qafv9HJZC62Xfu/kRtFqRfgRUwYD07wFwVo+iF0bmuZprOpAL+YKg7B03s1fz6cC
         2GjnjVp+uIGYkS4Eq1niX8ONmXqPs4zUqOr0y8wA+SzOd0ZWIlxea+Ae+XF7uNcG16Vh
         26isSG2aWniUkbYIqFF6A9VrQ0QaysKmXApms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691189; x=1796295989;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/lQFYYSgifKwpBl4Z4gLxmp/LsgZ8d5yEoRR702v7k=;
        b=kUvHj74/HNdxYUVdoFsE3RD/RsHwZlsPCfVglXM8gRwAOqKO2Nbd8QMV13sfRWYFzK
         raXDAcS/iQmCXXTdFQA3wK+uYd2zovdSTcPdGRKBdw2es0irMQLMya84Cmc78Ayy267M
         l89h61EB6FP49Ex/q2Zqw/3zIHYh/6AwYA+otO0uE1P7YNjUQ9ke/l1eejgv+35fjQ63
         Osy/fVBhtl1D9PPRZ5Mn1nlq/r0evTFKBKno7xabLUQL/o9Fn8OA9ovMy7sgPYoxHzbo
         3HsS8U73JncT2SaygxiPEB8rKsd9qsknuJ25Jd86QP3t31XCksJDBg5j3q0vhVS5AYNz
         syWQ==
X-Forwarded-Encrypted: i=1; AL+hErGjOUkvyD8jx+OjPWz5rpQN9DwotDaGQIZ/3SGDWYbFxRj9ofT0ogBNOLOlms8Jqi8GIt7MMMb4RBTE@vger.kernel.org
X-Gm-Message-State: APuU4Z9KApU+oTRPZdXthm8ShCGvVySJ0vehzt+F+54WNpN2DgA5cd/4
	5N1X8xb6h78dPSiri9vHIU6Ha4dSW5ePAtBju4HxO5dCnP8K+LY1yffFaFKLcfR9942Se7WlBk0
	k/ECzhw==
X-Gm-Gg: AZFdTZctaWyI6mAm15mzv44A60uN19bDW9qLP5bnLtwugHKuHtafSj/+/4Y44+iXMbG
	IiZfN6uUOl34PzBAnew4zmBsS4oydmR8/ieRnCy8UowV05fN+u6719yuQGFoQ9NOCoAcZjDyFOA
	fuN/zb5GL+c14TMMjbb4NU0dzyikOFUKq57DtlyRtPyiEI1V+Mn/gwwajeq+8WLomH7T8a7Kkaq
	456yhXnni75YX2trv350XvvhMlmQ3EIGGkUebvZFl8ePc3qqTvNcGNHgzUS6F9Ld/1+zNxHcMpH
	XNGS/j+9Q6t1F9iHRqPso2fMh514l/1skzmp0mKm2Ro31mBIlvffpii7S/xF4RzlLYPgkxyMnal
	Kon74nGZooZOJsjSS/MKV2muhDR7NFgr85YA4J5RCrFq+KQHSZ3/GwNIz6PC/wcn8Iza2+XZ2JO
	60E2RGbeNZMkmzUPbFaHgSIbyYnFotJ+WaTu2c9GyQOTaRcRoinxynfsxXNHKMu2yI2lAGA3JTB
	r8gx2oLvABPgz+aJKz69GPUMrU/0uGZ+y3nuZK7oGzlcajWN5AZcl2RyfHwoWKFvKyHEK5/+/41
	1ESBHPBVTi011gBNEniuTEC9FQQZkD8HRc6AvbhInR9wZiJX3dc6wk+42jO2Uzm4RqSZfli4n42
	p/aDVirLV5FZ6
X-Received: by 2002:a17:90b:5348:b0:3b3:b453:2453 with SMTP id 98e67ed59e1d1-3b41c94ce8dmr22001586a91.37.1795691188921;
        Thu, 26 Nov 2026 03:06:28 -0800 (PST)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com. [74.125.82.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm34966297a91.17.2026.11.26.03.06.27
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:06:28 -0800 (PST)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so2593047eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:06:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErExdEf7aZiB4reHGR6Ijyd6motCndx71NsJzAo5BVkEPSFl9wbJO72NruiL2LSu9zNtUjvJhFdxaPc3@vger.kernel.org
X-Received: by 2002:a05:7301:240a:b0:386:cd71:b714 with SMTP id
 5a478bee46e88-386cd71ce89mr5908411eec.35.1795691185712; Thu, 26 Nov 2026
 03:06:25 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-37-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-37-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 19:05:47 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngQC33xKiYRYT1qq1jqJj+7yveiwu1CQrouv8Ud+dPtfQ@mail.gmail.com>
X-Gm-Features: Aa3M54q46fTI_3jhRSfuxLJf-vqFgr66vNyr9HYUTk_fEMF24HCMszULS2t_YS0
Message-ID: <CAC=S1ngQC33xKiYRYT1qq1jqJj+7yveiwu1CQrouv8Ud+dPtfQ@mail.gmail.com>
Subject: Re: [PATCH v2 36/46] drm/mediatek: mtk_crtc: Dynamically find
 suitable CRTC DMA device
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 7:46=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Now that the vblank and config components are being dynamically
> selected, the only hardcoded strategy that is left is selecting
> a DMA device for a CRTC that is being created.
>
> In order to support pipelines including an embedded multimedia
> controller (like MDP3) chained with the display controller and
> pipelines chaining multiple display controllers together, stop
> assuming that the first component in the pipeline is suited to
> do DMA operations and implement support to dynamically find not
> only a suitable DMA device, but also the best one.
>
> This finds the first device that provides DMA and the first one
> that is also behind an IOMMU.
>
> The criteria for selecting the best device is to prefer a DMA
> device behind an IOMMU; if not found, the first DMA capable
> one is selected instead.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 68 ++++++++++++++++++++++++-----
>  1 file changed, 56 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 3cb2d1a28987..16c9ff2cfe32 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -1132,6 +1132,60 @@ struct device *mtk_crtc_dma_dev_get(struct drm_crt=
c *crtc)
>         return mtk_crtc->dma_dev;
>  }
>
> +static int mtk_crtc_find_suitable_dma_dev(struct mtk_drm_private *priv,
> +                                         struct mtk_crtc *mtk_crtc,
> +                                         const struct mtk_drm_path_defin=
ition *path)
> +{
> +       struct mtk_ddp_comp *dma_comp =3D NULL, *dma_comp_mmu =3D NULL;
> +       int i;
> +
> +       for (i =3D 0; i < mtk_crtc->ddp_comp_nr; i++) {
> +               const struct mtk_drm_comp_definition *cdef =3D path[i].co=
mp;

`path` points to a single `mtk_drm_path_definition`, did you mean
`&path->comp[i]`? Or use `mtk_crtc->ddp_comp[i]` directly here since
patch 38/46 switches to it anyway.

> +               struct mtk_ddp_comp *comp;
> +
> +               comp =3D mtk_ddp_comp_find_by_id(&priv->hlist,
> +                                              cdef->type, cdef->inst_id)=
;
> +               if (!comp)
> +                       continue;
> +
> +               /*
> +                * Check if this is a legacy OVL_ADAPTOR component and, i=
f so, this
> +                * has to forcefully be the DMA device for this CRTC: ass=
ign it to
> +                * dma_comp_mmu to force that.
> +                */
> +               if (comp->type =3D=3D MTK_DISP_OVL_ADAPTOR) {
> +                       dma_comp_mmu =3D comp;
> +                       break;
> +               }
> +
> +               if (!comp->dev || !comp->dev->of_node)
> +                       continue;
> +
> +               /* Find the first device provides DMA... */
> +               if (!dma_comp) {
> +                       if (of_property_present(comp->dev->of_node, "#dma=
-cells"))
> +                               dma_comp =3D comp;
> +               }
> +
> +               /* ...and check if that device is also behind an IOMMU */
> +               if (!of_property_present(comp->dev->of_node, "iommus"))
> +                       continue;

Checking `#dma-cells` (a dmaengine provider property) and unscoped
`iommus` can be fragile: if the leading plane reader has no `iommus`,
this loop keeps scanning and can pick a downstream non-plane block
that has `iommus`.
Maybe filter by `mtk_ddp_comp_layer_nr(comp, i)` to skip non-plane
components instead:

if (!mtk_ddp_comp_layer_nr(comp, i))
    continue;
if (!dma_comp)
    dma_comp =3D comp;
if (of_property_present(comp->dev->of_node, "iommus")) {
    dma_comp_mmu =3D comp;
    break;
}

Regards,
Fei
