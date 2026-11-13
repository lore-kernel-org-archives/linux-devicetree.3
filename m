Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794601327;
	b=dA9Huix8b+RWB3DYvIxj2pjrbFIDzMqHXq8BkVRunCAAz5IuUJ/+8ZVlBUv3t3uB5B+s
	 qIE27zmejwAOyMZhYNn8fXKjI2zBVrwkHzxcPg62NizfbiFn/GRbAJdfrwnUwVBs61VIK
	 NNxdAdbiqi/N9CEf5HuUJ7abHa0+67rI59M6xqMfdv3aIIK9ruon8wNLkGU34vJsju5SI
	 OU3ZIgs5hiOrZBm3HzdZaSes5iL2nFgWOoSksqXBSuDOgMC4uIGbVC9c8mKTNd5Q5/Arg
	 FNOsoL4S/Xcxgztwoh3aspSkOys7YC7bvhg16jVkDw5spEcefdSzzdbb7eCDIOAxykA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xtumAuvNbWuwUXK0cxJRs7l5/r2sAahJH/6uzW92HAc=;
	b=eWQDzur7eUBT/OFKsPv1MuF5LAQsDV7UrFPKaOz0ycdmFzwkt5ffC1oaQ1aNAVIlNhXq
	 nwl5O3eXzSiuGRYKqx4pRnUE2z6da8KFfCT1dzwXAPn9jrmQOJG2oVRzj1pJ4pSRkVIDS
	 Z4kRBfrVyqZiBuUza6C+jmczxOppyHkA7m41H3mdQz3rGKtq1cpwIXEKayhMyPBbG/V4s
	 Ln9vBiPJIuaWQN8kFmFDzfNbHvIfzp6PdW8nJ9x2afbCBd7hKoIAh06szd/NhlC2o1QQy
	 6gh0wZ4fXWgjvyuygI3Vx8/sUzugRT+VJIOzpafFvS3MMzgkvUygL8n8GdNO0KXATtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eliaN/OP";
	arc=fail smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BF9606A333
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 20:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0BF9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eliaN/OP
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ad3ef75223so1905001fa.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:22:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601325; cv=none;
        d=google.com; s=arc-20260327;
        b=rNIkBIUfiIrzltFJ6NmBZh6udCtk9DZxbNjjgl6CcbrkoqAdjYPv0gxdsdm3YH3eZr
         0Wpu1jrt/C2avKC4ez5U/8yo+CK7/n+5u00ukumKChZ1iYgafB2w1N72/faXGCvpK24q
         AfjCCFPLi0wJuK4vMEy90DMzk4WFvcU2FcT/HbxjPOM604hvF59KETE0BC9/fEr9FGB0
         wBTa2D1R3ebWJzxy8w5ru9Gkd8q+Chd/2kLsLNiIy/GA3tuVqdAP4nwheeAE4hgc/jv4
         Q22pVdcH9+DW0ARIgqXjUsiE+dDshwquCx0G01pPxk/ABcMHlxXZxhn1WdI3qKsxfu92
         kKgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xtumAuvNbWuwUXK0cxJRs7l5/r2sAahJH/6uzW92HAc=;
        fh=k9F6VOdTsPJOTQ6gc2OBooDfmaQ0t6p8iFVdQ0g8vp4=;
        b=kJRZCwOH1LBzhuGN7gZ3RAw7mT3MzQKJ8tcqG/8znyMYDzT8B5RbO8wzdaYnr6s0Ro
         JwmiKhsUNYmT87SmqHhoSUrr67atufZLlbLYHoL1MXkzSlQ+S79yi+tRn89ZDCRY5HND
         QUgt/sGW/Hb5qcCuoRJaiFKZebt/qSx52MWgnGszo+2u3YOMdielsUGhCZEM9NgFK4V3
         7qL26NREVVmYEmA5TmWM65f4fa9FwTNIZN96V5LUA8Kh+fRsP/v3TfBUc8MZJfkG7kfs
         BIskp5vUN4TEYRbiviEzBXI98d5nL32o93sv38HkPzODYKYrHdfcgg4DkOA+mhW0wkTv
         bxlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601325; x=1795206125; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xtumAuvNbWuwUXK0cxJRs7l5/r2sAahJH/6uzW92HAc=;
        b=eliaN/OPLV5MQHHag51KNNYs9r1vwyaqcfJdkPEf/RxGAIxD8jHs7xlRZ8nZvj2xWc
         X+oTBEK8j+nPB2xjkjIpsQ7e0ql3O3uCheaVkZPsuT4Qzr72cKyMRk4ekxeEakNcVIvP
         56DIHjQtA9jeGJWIsKAS3TnLjuqKom/OdQMD7XwpY9FyxmdSx2XmODmyJuy3cb7/Ya6L
         dbVdWc+5/H8udaY3R3ewLTMY8GnySiNfHfJbMNidIhZc02OSafSuUgEkBEX6Cq+i3uzP
         3wacvfEu4+WIm11XYq/xPB2//IpU5VJJCpJTwyik5YREF01ZKwV9uFMwMbtJgb7HtEXK
         padg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601325; x=1795206125;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xtumAuvNbWuwUXK0cxJRs7l5/r2sAahJH/6uzW92HAc=;
        b=jws+J0Nft7Qfs2i5HVeLLkb0khkpe29jEX6bPDnInVMfPrTY/acKLjs1EoOao9zGfL
         9/8sorVxb6jcb8rMa3x+fvK/ChpmV5H5cu73q/+Vei+sWBbByLvFh5PvAFfnbYSydzXn
         R95E26O9pn4qjmDlvji0pahn7u1ze355fmWVIqDmGvwfvr4kwd6tZUPK7jwMLo8KR+nR
         0jufdD0AEryvwnk1jK41H92EU/0S4UBrEPkjfr92rgLyGF3LaJv76CsReEqFlX7vUbbH
         5NOpN8OoPna/b7aXJiHhc/umLHolmDaZ4LRLI5HRp9BcK3QrUjbQh/4j6NZrRGVlSwh5
         rb9w==
X-Forwarded-Encrypted: i=1; AL+hErGtGj5d350/AdNEFrM0MSP9z/YttnDOukvakyIS64wl/8BkSOUVuHPyokcEYjpvOGQ8MMi0P6oWB0CH@vger.kernel.org
X-Gm-Message-State: APuU4Z9H0nmQzZ1H/EAXq+TbWhz5N9cTDzCVlXQwmmsgN5nfvBOg1Cug
	b3xiO6Lzlnk0Wd21WIfjza+UUmH1W1cHfWqmDNjA529c0LksrMPsPx34yk3egfcELlC1m3FGyHg
	xy67nNniArRbBSQDi5FlFVd8L4xLV6a4=
X-Gm-Gg: AYBFou1NIZPxQVIpaKcXkfvRFAjBG+cPaEuxfN9yn2uYxEpwOxbr7KuqeJLZGP5sil5
	pmtbgDMOhmZWxi7cBfqPPK/rPKmdHDekeoav2Mc3RdaGcBiPaR9ERUt3rAeMs+YuqQyUhaF25Pt
	g7A47gHBtQrQzexH8rTxZgt4BTFxqzL2qNylbEtz517W06aw3nnej35u+rRlZ0mYT9VsY8W0MoN
	9PQ2JjPfnSs7w/9B8y2JLZc9VMcgTEFLCEiAoPg4Cb88PpGLd0Tda0u4bpCPq807VutgZkNl21q
	UOqUTBI8ETIqMwUvTKEOUmk0kE0fx67yy2E8nyN4+LxU4d7aExlL0AukF/7XjgIpoT2Oi24bMH0
	IdhNcobxF3SWXlWg+6Y+JWXWxwZUHntd7vBvQaUTU3nuIxdDFQnXwiQ1tT88rZ3lCoToftJyilN
	nQECoOGyzawfWNTJbC
X-Received: by 2002:a05:6512:1322:b0:5c1:57b9:90b2 with SMTP id
 2adb3069b0e04-5c170746a13mr1720283e87.1.1794601324638; Fri, 13 Nov 2026
 12:22:04 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
 <20261112-hantro-robust-v2-2-18561fd48838@gmail.com> <c97eef1ba88daf83d231d2ecc78b47fcf524385c.camel@pengutronix.de>
 <f212840b-92fd-4d97-a6a7-2768a55483f7@collabora.com> <CAEy9hNU2ox76TFKtdisqUHDxZ=3gPVBDBcjz_W8RtCpCpK5d7g@mail.gmail.com>
 <b3fa092ec9390cf5bfe2f4338af68327be70e6e1.camel@pengutronix.de>
In-Reply-To: <b3fa092ec9390cf5bfe2f4338af68327be70e6e1.camel@pengutronix.de>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 12:21:52 -0800
X-Gm-Features: AclHuK_r_rPrVJRj0pkug0EuQb97pNCsN4qnHk9bddNHOrBile8NMgFa-B299mE
Message-ID: <CAEy9hNXNaAdcL4NMmNf7sETknV+jQBp-inqFd-qAPut041GjJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] media: verisilicon: Don't hold the VPU in reset
 after remove
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Hans Verkuil <hverkuil@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>, 
	Tharit Tangkijwanichakul <tharitt97@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Would that more correctly describe the hardware though?

Yes. The IOMMU is inside the AV1 block and the TRM has no reset for it,
only these four. v3 adds them to the vsi-iommu binding and node.

> So this likely would require exclusive reset controls with
> acquire/release.

v3 does that: both drivers get them as released exclusive controls.
vsi-iommu acquires them to deassert on probe, hantro for its probe
deassert and for the timeout pulse of the encoder cores. Remove still
leaves them deasserted.

v3: https://lore.kernel.org/r/20261113-hantro-robust-v3-0-82383c722ad2@gmail.com

Arun
