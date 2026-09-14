Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEC54334BC
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377844; cv=none; b=NXM87ZigK1fzrQr6bnZAmnJPjgFNcpC8zskOR2q6ToKSd3KWdY66mclHwE/w2NBQGC1UtV+ZOQ0fXZn0HyV3yqcvc0m5hvgHfFtmUxfD2hDyYyT5LfRjBrytcQ5AfzNKegow3THe5y+zHBSX4jH57wcKVlV8ccbVDBoGJtpDKd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377844; c=relaxed/simple;
	bh=PJCpttXgaFTAAuIppNV/gcSz4Kqn62rNZomfMgasjmI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Vvh9maVs0RXQImnxSiV0Jn7mUmMnaOqDgXGE6qVpGI2sLgpsGzLkDlsDjPRRxFo1SRmbbRJdxU0imazGS3UfzhDD29Xhuvq8DxKoVuI7/cPWF07a5u4/bEMxIAqbmvFO/yHH8g3+E4icFqZgXtJSkc2C9W88EYJ1MEURAHBedwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eUpC/kwA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oYsrdG6F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eUpC/kwA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oYsrdG6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789377838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tb/KsUxM9jxkMjSRJHpE7KiQY8ZPLkB6sQ8Hi6kwrEk=;
	b=eUpC/kwAn0OjkPn05Nx//nzuTxVB20QZ+0khxOVls1OOoeSnFp4D9tWD1qfu4sP5+LsW0r
	KRw5dmxRZX9jLiixL0oC1DS0lqn3Hs55OR7xDK65SQ45DWh3xTzJDqYzkSnYwgwpXN1FkZ
	MU81GRbLqWaxpoA2FWj9XNjQld6k5cw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-RonP_6egM92SXSAZn2zo5A-1; Mon, 14 Sep 2026 05:23:56 -0400
X-MC-Unique: RonP_6egM92SXSAZn2zo5A-1
X-Mimecast-MFC-AGG-ID: RonP_6egM92SXSAZn2zo5A_1789377836
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso24912995e9.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789377835; x=1789982635; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tb/KsUxM9jxkMjSRJHpE7KiQY8ZPLkB6sQ8Hi6kwrEk=;
        b=oYsrdG6Fa2kcN1QW3mC4SMRafmaJlaWHFHx8NyuuN73+zAFvY2tPFf7YGXAIVuMaAI
         TuNAH/9BzAlWVMsrUBltCllDPhOgbHvFBAkMrQbDkzm2hVgPpnxH9oTQid9kARUuwHm5
         fm968OJObPInV9GSSIwg+hjDhj4ndPu7t4HrlEVXcG2TnbBy+d+jE4ftJ0Z5s7Aqj9WH
         I6eZOyqa7gnahAmpdKOSSjgyQIhIL24G/K+5BkCdTqOVLOcRiG/PcECYtOPZJu4GEFa3
         cIGrepfFT0BCydOZlb28oXsTrhlmf3txMq3h/BxZRpwCptWUqZPYDbF+faiW/O2iXgvn
         ocxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377835; x=1789982635;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tb/KsUxM9jxkMjSRJHpE7KiQY8ZPLkB6sQ8Hi6kwrEk=;
        b=UhMi9YftmffYK3hl7dmNBLM4uxGtti5jQM315eHd+ueUYUotc7caUb1mwuVhh7kiMB
         cNrbFtVvyb9eqcKEjZMqs70sd2PT0mKkV5shqKaOmwal5eN+zBHor/lvwELTE4mXhj63
         CSsHOUmzE7RxN4hmXzRFskBT/z64RigJ9coOlYe1EkXP33MWE/EnPbDoeyNXH8KYCAqe
         obVdkXgm0HC9/GsUvJNuLv+3+I7e6GyVv6JxDpoYs0ySMAKydSu1hQ+b6SHC58cbrYAL
         7QWEYNyT5ooWIVv6BLU0c2rxz2TpADmT+2xxfiAPo2JTysmrBaEn3eGR0O3A4AZaobeX
         ssgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBbbWsulQYuG8ymheFfWlNTrTv4U1V4OrUaijN6BK80WqPK0qopw9g9yeLtAbgHXuWOWalT0hGXZ5Q@vger.kernel.org
X-Gm-Message-State: AFuF++kCGDFLoDnoKfjYIxUWPoRl0RJ7hdE4ZK6AH1n+oh1ytel+o9MQ
	10PA7McQ204Bf4+kZ59j8zNbHVJOvPjYESUWwYVzlnCH3CW0a7TRqDo07FCNgVOP/PstYyZxNiM
	z7kyMMvZAwPqCjjDtIg0f4DKSBnUTA8HgKXx3jWQ0l+3Q+1y3ZBeNlniHtEZ72UA=
X-Gm-Gg: AYBFou3XxOgp8joh0DIYNeVkkgxXBKeYcE7JkcnjL7KlOk3JZesK3sTT4/hHmhq+x9C
	qynUrHCtK5iJNyypZBo+LDLj7VAmKbl6gQnNPOD77SKa+odKcbYjfKNiCUXpLSfEATIHQGUnbEZ
	x3YmywksA/PNVFN31/hEoAYgG9hWSN26GoABFTOXLhVHMhzcu8M6MEYHNS4CZTa4whKCS9AiQK8
	vJ4CTbStVnJjwlwDktsQ7tojMI13zPUfnP8971nDgGUm+BnS08ixAI0SK9Go6slNpU5E9ja87Fn
	6AYramVdug2f10oVN7pvlcGoGklNEgaS371hYzHfjM9fnhY2TQlQQRD5F7tPLT4dMUajiiypuTe
	wb8VGQ0uexXMTd9JJjQnyPajFwj+Wz9Uf9dWHqRBrCAdsUMPwh088ZGM1kQ==
X-Received: by 2002:a05:600c:628f:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49e7a66ae3dmr16857995e9.21.1789377835299;
        Mon, 14 Sep 2026 02:23:55 -0700 (PDT)
X-Received: by 2002:a05:600c:628f:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49e7a66ae3dmr16857405e9.21.1789377834915;
        Mon, 14 Sep 2026 02:23:54 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm399519375e9.2.2026.09.14.02.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:23:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Chen-Yu Tsai
 <wens@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Liu Ying
 <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>, Philipp Zabel
 <p.zabel@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob
 Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>, CK Hu
 <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, Yongxing Mou
 <yongxing.mou@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, Chris
 Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: Use consistent indentation in
 the example
In-Reply-To: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:23:52 +0200
Message-ID: <87pkyg1907.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

