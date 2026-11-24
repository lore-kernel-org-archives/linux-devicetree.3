Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530517;
	b=tKkhOd9iu4jh5WowFfXmpm8QwcoShYzcpTTtMB/Qh6wuVykJ5b9otb6NlKKdarFSot+4
	 Ocv8wVAWW/pQ/RJ3bKcqBStETmqT3NEL1Hk+T+Q3v5vutGeXwRyMBmhTcB87akA29v9yz
	 zmbqpK+5G6sGkDGsdx0dQrln9D28NtHE+xZ61OHFgstd4gnS597wcKdN5a7E5LT8BiPUy
	 yh6cAy8iDC+ayZxxfcn2pTPjydVN1fDxOsW/A9lsmTUnOHOhb69g82HxlAveI6vODzbRv
	 wQ/0xMwQY2BRtMbxQJivhSspiLhXeWF8TKz4cPL4hroiWZ6DDyLFROcKmgJhsoEmhmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mQ2JTBOODXVLExMT4lau5wcd1i8TygMCNsmKX6gW1YI=;
	b=MANKqKFGNcs4H1G35cpI9Yip2M+Z6Qez0H1apEtv1bWkeBDc1LE8i3VVh8P2Jp117ZVk
	 sk8x3aA1eEF3sg2PIErLMprJIOnIrKUczHXDHUXHJWqV5T3ZuxvzorKybLP/UO6Ks5gVg
	 sC0zuxW/+GDB17+opZrQEMwhzHwfBeBQ6yLfmdc1MVhG2S9Qng7s6Txsd7W6nfgha9WRO
	 fgHTuIeQ47JKKCukKjQyTZXsUtXzGLOOtD2Tz9BbcE7gNlL7+VEjApVPX+JnKJ8QW2nco
	 cHaVR2AQDKh3eWfydcwHIND6jjvCw1uTCSaKGsUR6T5T+pr3jmd7YW8HCPySPt1pLzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=YNYNe9AO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D73606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D73606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=YNYNe9AO
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f05b465cd1so22734285ad.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795530516; cv=none;
        d=google.com; s=arc-20260327;
        b=n56e9f+ilUx+woywycv+mqUYI7/zF/Qwl/Q7Aqc41NOreY+MJyQhDoO+6QiX2ZJ4m3
         yAen8K3Ufn6iZ/u2/+B5pVqaILo8OanjE18C0PVyoQSFKhOLNlZ9VUEk4TuC+yUywHG6
         nLUgueFQISL17jgb0C0D9LTGxDtFOzkyxuf08uomfABR2nTjs79qrL1+mVilpHdzOz81
         447kYFzS6ruZYIrBe2L2yF+I93PmHkqD05LtiWwRigQ8BQ1A2xhQKc0bVWtzKdXpiT8k
         +WcV19t8QA0lujj2oIaN7uSM7sGz1NuqCBV4+f49UgpqnK0+oOsxrUUL+ZuU+Ad8zQA1
         Z9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mQ2JTBOODXVLExMT4lau5wcd1i8TygMCNsmKX6gW1YI=;
        fh=4uRGE6fxa2pSveYXnImoNe8LBTrARbERQhf9LfCR9LI=;
        b=eRhpMXx9SB/DxCVELGyE1goyqdnyoAfxVjKeb036KqUxToTslOpPeq8EXF6zw4lVZj
         KtHzY15rS/IJxVorKlTEnoyxzUlZm/olX/HhblJozxHrujKm/r8yO9l77XdcUbohojsG
         ZFVCi04dhc34lJXDo1Pk/O+ld2SLdW131+3X4HlGDUlQs4/MtHqZjteSPsi6DDLidVpZ
         Koy5TwHOZcLGaY/NjrauCYas9UI+V7PqPiuLh1KfeI/seN0R8hhjg70dA0VUJzmzFmpR
         VaoDITm3UoKQKSJegeEw0qOa57icIPeIelAclYBsPeoH0VC5779S2m1i3t6Q4w+3rZaL
         zY8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1795530516; x=1796135316; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQ2JTBOODXVLExMT4lau5wcd1i8TygMCNsmKX6gW1YI=;
        b=YNYNe9AOmHy6n+ZYPjLzcicnDwPqfhj1Xggjbp9OkGoO/W8+8izuzcJQvG2LwUHAKY
         9MfUtpx8hVEbyjq4BeaWyonwG9VQjYQrKC7Pl44aPQ0A8xKt6XQp4CqFxdlXEngU2jVR
         Deay8NOeZ8K0tXucJ5lyOuabW5SDm06HAZBTQio9oFs0grl+PlOGCnrdFwqWDgyvN2kh
         iNyRqy0sSd94YzWobZazh+uIlMQQDxuPBmEYfJCHVk9NDGnqOyvU+s5wuqq6xD3+uzBy
         tHbrkwuhJdj1Du7r9s+toqNnCrRrEaglj/XIc39bu5cCtf6lgSVkUHyhEaZmba0xfGUI
         Okbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530516; x=1796135316;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mQ2JTBOODXVLExMT4lau5wcd1i8TygMCNsmKX6gW1YI=;
        b=G9UsN9772qDojWIvCopcwUwkasiBLDGE59+u1EWtVQ4abqB9DhA+n1Po2j414eXFpH
         WFzuwFsdF4Fjfh2dE8emFsl4YxlzlzLbW/mhz5QS7aqIfn97akOSXasEE5Bmy9DLR1Qp
         fK3X81hREYbx1DLzLOG42F4ylFBxxZt9weDapJHLhcNYkMW3w9tOOHbqCDfDLqtYp0ae
         YU/aTwODHiUEHkJNGEZu+blZX0SPL65NCuxhIW68P8eWBUeOHHYqPYxVZjFeFc59FIhM
         zWygVbVmrmJFfQ0JMmBDSPCXEo58spr72T/Y2xaSyFJ6Z8TRrexfvUta72E1j+GHqIN5
         cyIA==
X-Forwarded-Encrypted: i=1; AL+hErGnatXerQan27Z6OGmTRyACMHNTlapTqp7yRdGjM3B34SHefJzxFESU0SlmYJpz15QAxyBfSmLGYeLq@vger.kernel.org
X-Gm-Message-State: APuU4Z+EQ7JP5VBfYzNa2EJ9Yy28p2aXienmbbOzVJvfOBKxNuYaCBGo
	aP/dV04yM7sb5vc9LYSjwh5a9M1ij0xjGxyK7gdyWWYMh971pmCZqx6zCvZ7KT/Skq3e1+FaUwS
	+SCEguim/eLn4N5NohZ7N+m9sCNMpFvWk/b/QXxnrfw==
X-Gm-Gg: AZFdTZfMWO0NIuRWDgAwjURhFrrwyFR3G9WlGMpnXrsRGJ4QX5lG0oClJe3fXzPKT1L
	c76JRKx2CUnVdLIs0Tgk1JSF3g6ni59UiULBKkexfx0CXXrDASehffuHxcIqVD8hAQYYju5opKi
	CYZW1DqeutwIO+M7S909LTyMpMIbybb9xYAkCSAp2n7vJ/ZxcDBMGpf2GNlmV6h2rl474SPlmxx
	wBBtKNJLjqRqHeuMTaSXzjkDM/WN6QvNLTFyiglZhCbBGVukdZ/3XJDeHDzmVcKy+RnWq2qJM3z
	88pvSABDX9GKJaLt4Kpt60HxKnfUjldYKAv6h3FCQifgQj1P9Bw0c4uwWKgJPUK9gPaRrrCLmq7
	/uHJeED2nO+XeswykqcJScOZYZagbaaP9FA==
X-Received: by 2002:a17:903:19cb:b0:2e9:9a19:c5b with SMTP id
 d9443c01a7336-2f03f16d710mr139233565ad.47.1795530515765; Tue, 24 Nov 2026
 06:28:35 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-34-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-34-angelogioacchino.delregno@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Nov 2026 14:28:23 +0000
X-Gm-Features: Aa3M54rrDo3X7VrfTe9b69h24tjA9EEIAxDaPhgJEX5YWMApMtqcKA6bBO6NIJU
Message-ID: <CAPj87rO9saEC34+5NiYK8xyZiNytrVgOcszoY5uc7BpL=M4WTg@mail.gmail.com>
Subject: Re: [PATCH v2 33/46] drm/mediatek: Add support for Display Controller
 exDMA component
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 14 Jul 2026 at 12:45, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> +void mtk_exdma_layer_config(struct device *dev, unsigned int idx,
> +                                struct mtk_plane_state *state,
> +                                struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_exdma *priv = dev_get_drvdata(dev);
> +       struct mtk_plane_pending_state *pending = &state->pending;
> +       const struct drm_format_info *fmt_info = drm_format_info(pending->format);
> +       const u32 blend_mode = mtk_ovl_get_blend_mode(state, MTK_OVL_SUPPORT_BLEND_MODES);
> +       const bool csc_enable = (fmt_info) ? fmt_info->is_yuv : false;
> +       u32 val;
> +
> +       if (!pending->enable || pending->height == 0 || pending->width == 0 ||
> +           pending->x > OVL_EXDMA_MAX_SIZE || pending->y > OVL_EXDMA_MAX_SIZE) {

Definitely don't do this please. If exdma is asked to do something it
can't (and I'm assuming that these last two checks are intended to be
on w/h rather than x/y?), then you need to reject that in
atomic_check. Getting here with pending->enable == true and then not
enabling it, is not OK.

Relatedly, most of mtk_plane_pending_state should be deleted as
duplicative of drm_plane_state and it would be great to see a patch
series very soon to clean that up. It's been that way for the last 10
years, with seemingly no discussion ever of why it exists (my guess is
that it's a holdover from pre-atomic code), but no reason to
perpetuate the badness.

Same comment applies for the blender.

Cheers,
Daniel
