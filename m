Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEDC253B58
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 01:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782092329; cv=none; b=E5R5fvrGSKBhxiVF3u1xisEsmXempl9L4C8xV62kn7ht7max5CnQQ616xok1iy02ZEEkteC7A1JGLVjzC3ubBMGqO1adPfAC4zdYZDIj9+KXmIUonOsFxq+kPsJgLe1XcgVxRsGY/MIv+r91LauqSeLlFZGYpgxmLBhutGSDoo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782092329; c=relaxed/simple;
	bh=ie+sMnD6uAa0Y5KDamC6d/Sl2iQiNR5jEQH6gwdWpFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rkb9mJV0ikGUkTwjx+Li3dNdSYbtpaiFwwVmbPbqyU7XXrYyv/YRi6X+/eeKIE16wVMJwzFKhHAMCzSMx8Jhafu3P11BI0TrqfSgqrqTYRH8xWxdPC6uQrYZPGhAXZQH5W/qqQcQ0lb4Yl4hVar7xfFixdcKCdu08xqj6FyzziY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxrgqgXj; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxrgqgXj"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5177945a279so40223241cf.0
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 18:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782092322; x=1782697122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=egN3juT3vo+m+4LZ0Q68Au8I/pA97hL0YrjeQoHBISE=;
        b=cxrgqgXjR50fgDj0b+37apLC6JuHZOwyJdHceTYYtaoUQU9Og1aIJ0yNl/OrQIv/Fw
         H7zX6mDm8QM5XzNyi7dwkY1M+KafWYgzYqPJcsIAkVODv+LlG4h/6EBi9AOco88FDv/6
         JpZnt6c+C9flknDAiQUxqBn3Ny8nqH3noUMrYjAqiLuodg3kbaRAeal4ncqiBMcrOzh2
         /lzWXaTZySN62VnShknJYVoRSnkSuaqebHkraj1DSK/+GYSNsHv+ra1ctrJTvPVXG+3P
         vhaOXkCnqJRw7vutCipanSle0dRazSMs2VJ7igyJ1GwmcDv2GDzJldPasowTe6VDtQzj
         LgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782092322; x=1782697122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=egN3juT3vo+m+4LZ0Q68Au8I/pA97hL0YrjeQoHBISE=;
        b=s/bpHZmuhiAWLr7plkQlwpnG8OjJXznQBow7ROHt78ZkLY/GrzaHO1QLXHafSZ9xnM
         lBxpC4dbl9MNesVMfNPSKxc+gWoErwk55g1CMaQz7QNYZMhyTUmSC7YKQ8D/oO2Iz5P8
         flokEuWPxwG2cQn4/sySdAE5Vlc82r8jfaR115KCOIiKv3fNVQBolAI4q09e/aL4fuFU
         AI7/89wOVrE/qI0dVie0Hx1ElYw3SdmUWErVnQ4UmHQc6eNboltnAgcQAFz8MzyUnN9K
         GhSaRyRMarEOYKplzNlWvSWd+eNUbL4uiEHERSVRP7h3IjV4pDUHl2WIZI6fuVLxa49X
         2rJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hTA+uvcucXSWydmN3Vjpi6nXe34HxcFnm6fIl7HLFAOEZiMTK9I1sLBBdcnPOgUel4YNk5/ejfOab@vger.kernel.org
X-Gm-Message-State: AOJu0YyjNiNuSTkWx9aoex/R9gVbSojNAvUL0cfhvnNovRYykX7CI5Tz
	aD5N9Exy0M4o9TnuieGn06lPzMMoJeSa0sHSwtF1gz9mjgEztXX057hC
X-Gm-Gg: AfdE7clyVd73VUXQICzFm0Uf6vWzexMoUmJo6QoUziN3R36N+eqiGZ6wJKF/+BKKuLM
	nzM8br6HeKlLJ+1nxtawL8C7bzp0X4OeajlOngwXZsG3KrZAcCpS2jcsQADVyX+osmCTRF6XgFK
	AXOfYQLd6ZuLgGkM8ZRZFxFTRNNrfAhJk6f9yy/ApGLT5IL+QX28GjYfxOR/7yeXr1nOkjl25LO
	mhEOKFQqL6Hnx0b0iZ/SjfNQkVHMX2Vs7cRRXSqu+wzJobm/3zAvIcxOAdibihdaras62dN5Ox+
	dKbQ6ufWt8vsljiFN9gfr3aTEqPozJ7F0T3WV84pzea7lQQqG5KKva5Yj0Bcdr5T347Y85IMPG3
	nqBBluImix/Eduftmcp0MT/kLotA4/zjiBgP4anGFgPVaycAoIEDjeBn9eYMsSqlJ9tQqd2Y0Hs
	hOe1KdEqAtjuT2sQ==
X-Received: by 2002:a05:622a:1f1b:b0:50f:ccdd:13f1 with SMTP id d75a77b69052e-519e4a54ab1mr164968221cf.16.1782092322553;
        Sun, 21 Jun 2026 18:38:42 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a098e287csm55778831cf.29.2026.06.21.18.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 18:38:42 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Mon, 22 Jun 2026 01:36:26 +0000
Subject: [PATCH v3 4/5] dt-bindings: dmaengine: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sun60i-a733-dma-v3-4-f697ef296cbc@gmail.com>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
In-Reply-To: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
To: conor+dt@kernel.org, mripard@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, samuel@sholland.org, wens@kernel.org, 
 jernej.skrabec@gmail.com, Frank.Li@kernel.org, vkoul@kernel.org
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

Add `allwinner,sun60i-a733-dma` to the list of compatible strings for the
`sun50i-a64-dma` dtbinding documentation.

While the A733 DMA controller shares many similarities with the sun50i-a64
DMA controller, it requires a specific configuration due to differences in:
- Interrupt register layout and mapping.
- Number of channels per interrupt register.
- Support for higher (32G) address widths in LLI parameters.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
index c3e14eb6cfff..1cc3304b7414 100644
--- a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
@@ -25,6 +25,7 @@ properties:
           - allwinner,sun50i-a64-dma
           - allwinner,sun50i-a100-dma
           - allwinner,sun50i-h6-dma
+          - allwinner,sun60i-a733-dma
       - items:
           - const: allwinner,sun8i-r40-dma
           - const: allwinner,sun50i-a64-dma
@@ -70,6 +71,7 @@ if:
           - allwinner,sun20i-d1-dma
           - allwinner,sun50i-a100-dma
           - allwinner,sun50i-h6-dma
+          - allwinner,sun60i-a733-dma
 
 then:
   properties:

-- 
2.54.0

