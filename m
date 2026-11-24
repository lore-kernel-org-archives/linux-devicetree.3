Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530642;
	b=xvIkFbcH+EbrDOP68bDtL0bOm3rL7+zJyvp97apSX5gaYl0pcB8Jeie9TyNN/fokj7up
	 R0jAQNIxUvE0Tjiyy4Gxyha/2CAborp7mzPTly0fVgZyQPFtxzFegP65NByJnP8WKj126
	 EL6zQFOLigT/oWHLvY/xT9qstPdMsq2elmW6iDSCVqq/yH46KFfnMevTP/yUCsukLLeNo
	 fIj1yjcGBrO2ViYU4ID/AQVXkVJ/lKR+KJvGOxLay0W5RzeKxmQEPNjbdIaYDm5RXqVNz
	 9K9FA6I+G/8a4FxB2UlBrMwB4T+BZiqFA4mv1jnKuGFusYRi9d3cnFR6qFJVUDaxPSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kFSlcrGHGfKA+EfrnFhI9X/nm4JGlc6mNtmuQxk7pQQ=;
	b=EthZ9yg+p+9NTQMWJJVV9H0VXQ4bwosR9w8sNeSVdOLgyy0oi6v5IszPZyVQKFFwlAmo
	 ghiWFlxE2uHAwvZJAjbYHWI+w/jILnCOv9RkfX3SRxEoOInt9E3CS7SedWLrLULwqunYx
	 ByRX/UPOaswe60tRidRL0qDjaUMQEsF8y3QYG3ZOQxANNz6lnMdq1O6XtQLYNRXLiZCqu
	 WShIGMDqkJvX9Ul/WyiVi9N22nbR39iiJL4CIZRZjJUM3NvKgbdFuhhwo0Hx50SUo6BaQ
	 TZmwYjkQqz+BJUWS8Nh8jcmv1bGtqXaKUHJjYWNEsLrZxtdhsxxetUchV9F9c0iKupA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=FkZP0FZ7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B74B606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B74B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=FkZP0FZ7
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8c70c2ab5a2so1772365b3a.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:30:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795530641; cv=none;
        d=google.com; s=arc-20260327;
        b=O1/jppxTfmHJ3d6UP/TWnsrFeQNxdQ2/FU1BnxUQG02H693X2gjvU+LX5/vVDbLVAx
         NlRu/dfaTT/ao5/Iriv3mbSrooXkBp+iUDYmPrhiz17bWD3OiVIFgz7y+AfmRF4MmlGC
         M6QOZz10M1790s/UxiHpnEIC+Ckz/DMtFqeMa/TF/mc7tQgeLJQWzRyXm6b7LhRYuRmO
         BifxfPy6d92NOD77TgRa8FwGrr9LJxsJ2lKrkfY9zr1LU0joOYLZYENN6PgCGIGc/VK/
         gxPSied/KMRZ20om0nAo58gbGkYZnrDxT7rA2I6OCn/cfHT4ythL4CgJRGlI9nhxY2Hk
         bMjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kFSlcrGHGfKA+EfrnFhI9X/nm4JGlc6mNtmuQxk7pQQ=;
        fh=PmFzpJgd+eH3Qn/fGusNj12vJ4pR+CQIlyFEDOTbIzI=;
        b=c68d8ezwClO53CFDN7YctdeocQpTmBQ8NM683AUCNHtFmc6wKuo1TdExUCLOxL/62Q
         QmCn91cII4P1TQZxJoN8JafbYFVq9QGG5JusuxrXxnixB4JNcQKd1ej8tnqueMZgncx/
         GQDyjgri0uCczIw11ia6ddIbc3tTkCVuoHmXD83dfpaGkKAmu8e3wgTESWaoKAbCmjo9
         /kOuTeAvKnsrtcu/C7PEQ2dDSlgpEODuoKXbr4caEcBF5iBi9Bihj+4/1JhUJmhPHyEq
         /tXKxymxKsitwvCZxBFhmZdc63KR9own6LXekmBse9dus5ZOLskZCAOJdfXooCFcrp8M
         tjcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1795530641; x=1796135441; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFSlcrGHGfKA+EfrnFhI9X/nm4JGlc6mNtmuQxk7pQQ=;
        b=FkZP0FZ7Nx4zOaygn8gVPi/OZg7d/o7JiO1MoX8zDpOKgdv9zSmiUoUR6J4jXlKC+e
         XljHyz/hUv+BG58ShWXPZCSok0QeHKhWL3WI+/soU7Pcw0KsTvsdQRXVt2zpzxYUEKB8
         vJgZysuGB7EY2DRLKCBKKab+qEKPWqXFlVXp0UvJtN4aRrwdBFRK4IdEXVCJsp5onll9
         ueSDCAJix6XoBYo6RseohzEXhgKWIiFhVM1AKAubC5ab6EQ0ksErIf3JEcUbPhpYdVay
         sJl45Wh8VUEm/C5Y/bAHIWLbGrTv5xnK05fsWc6neGgFrIKaV40ZR5PruK8L8gWj6dAK
         c/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530641; x=1796135441;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kFSlcrGHGfKA+EfrnFhI9X/nm4JGlc6mNtmuQxk7pQQ=;
        b=Qhmz7/1ISADWKtPBaFp19sWkbmj46c8oU7FgKeRD8Q7WRyLWa+LRwUtiQhUtlP6afj
         prHCNHK3nAuES2eAIDySEBpo2CIUt7wmbRhCrfJLZykhbembW7nIj1dmZbPOjTZ4TXCU
         50lHr5ban0AmtJwS+C/oOfy/PUubGZs+8ovoBLFTew5jhIuQuStsOmqsOMIV7BL3b+ik
         hzvCqvnbpGRR+NgNQSwITx8tfLpX6UTtAIKnGfogwM4gEdhK3loCfcvpz8NsJAQpSrOU
         I+dJXmVqCQD8R2PCNpsTpvP2/pZDE7tMWs8ybWQ6f3MY31f4wDvP1aT9TvQ8JeLwRZPL
         v8nw==
X-Forwarded-Encrypted: i=1; AL+hErEqJ9W/uMZ+mPdtRNCadutI2Th6Sc4NUdrM/uk6MSqyRkJ3tRlMAG0HHNWJ2MllG7FxlEIP986a54Bv@vger.kernel.org
X-Gm-Message-State: APuU4Z8tZ5c1us1LNsJrXKsja8JyaoI6WXh7xlATB0I2/xaWmp60iSn5
	15xnUGNXykOqhoqGjRnrQYOXi+rktGo8tIf2X8hCMb5D7rk4zLv2Q1VOdu0SZw5h5A9nBMhc2kw
	NowDw1C0aTEzdlg1N4Ae5d8C0+eSB74vNm6NJK6cd2A==
X-Gm-Gg: AZFdTZewShsAjonl/ajHFQafS5UFmUseZqghTworqa6f18tIqKDn5dFE+nEm7CMzYoW
	53C4MPxIwI6C9BmIyZqOKxomKFbasPlmByi4VFl3Pczqw2lCGZP9iulF8KIHhvLog93mtWDd+XB
	+LLLypFMFWDcNFPshBZ9tvWVNzdJj9cdMSb3yt/6hVt2/krxsSNNp0gHVT4ilBxIgqvPIS5NRJS
	SHm5BY5+Sk69MKdDWVlwCrODbHz3+XtdDJaiPy7OlZCvve1MG4i56eOgtsjbZkqJjUDOkpFN8mK
	pi9uWu6xJhVPAzIYVz6r3VtZ07e6Cflnnuyij6LoTjM9Jy/QkAKo3g3qwVSp8sowBh/fIC8eRX3
	mVEwMOtgYYEfRWxBZs5ZitGY2uu3hmAUc0w==
X-Received: by 2002:a05:6a20:2589:b0:3f9:797f:3869 with SMTP id
 adf61e73a8af0-4014d359938mr14437260637.47.1795530641542; Tue, 24 Nov 2026
 06:30:41 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-4-angelogioacchino.delregno@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Nov 2026 14:30:29 +0000
X-Gm-Features: Aa3M54oeKn_H5KtwYJP7Cgtm4lKr9C1ncfB30nHv_jvzqMcIUhZDyb3veHGchVg
Message-ID: <CAPj87rOEtG9JqJsEZkatqrWUkerO9Xx93MBUrXXChJwCokE0Vw@mail.gmail.com>
Subject: Re: [PATCH v2 03/46] drm/mediatek: Export OVL Blend function
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com, 
	Paul-pl Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"

Hi Angelo,

On Tue, 14 Jul 2026 at 12:44, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> +unsigned int mtk_ovl_get_blend_mode(struct mtk_plane_state *state, unsigned int blend_modes)
> +{
> +       unsigned int blend_mode = DRM_MODE_BLEND_COVERAGE;
> +
> +       /*
> +        * For the platforms where OVL_CON_CLRFMT_MAN is defined in the hardware data sheet
> +        * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB888
> +        * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB8888.
> +        *
> +        * Check blend_modes in the driver data to see if premultiplied mode is supported.
> +        * If not, use coverage mode instead to set it to the supported color formats.
> +        *
> +        * Current DRM assumption is that alpha is default premultiplied, so the bitmask of
> +        * blend_modes must include BIT(DRM_MODE_BLEND_PREMULTI). Otherwise, mtk_plane_init()
> +        * will get an error return from drm_plane_create_blend_mode_property() and
> +        * state->base.pixel_blend_mode should not be used.
> +        */

This hasn't been true since 9813e158d13d. I know this series predates
that, and this is just existing code, but it's another instance of
'lie to userspace and fix stuff up behind its back' which we should
get rid of ASAP please.

Cheers,
Daniel
