Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC562EEE73
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787712048; cv=none; b=rccZ4Aa8yjUF7e9JHIQ6hEwPynsIwfSPQ6RRdn9rw4RSH7lTrZrsMrLDL5YywB+8xf/Q9h+KHTg81IbdzbV1vfXS2T+0yBiYj2Vh29MLwoXjWARFjzEl3OVMHOzzkJBh5u+Ok0N+2+oje8IaL+mbWgv7oDgQ5uJZQYLbKXc1sAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787712048; c=relaxed/simple;
	bh=xXHRUhCMZY1UP0UimNCUgmYKZUE5pAtrJ+aeGai+WZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c0x0lyX/aVmb7HBneXes5ppfbkgP9ZUHiao8bLtMTeaxClKauGQizugXqXMAGr9tCC1Tc1Fnxr1zMOngSyxvuMz8bYa8a9FIUEO7yHAuw/mhJQHugac+zNU/9p7BHC7te0TDQUpNRorVU/IW1M63Y3vCAKn5Wu8/ZV2twn1BSb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pk9XpRg2; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pk9XpRg2"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-857f1be346dso942947b3.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787712044; x=1788316844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBvIvGQQ8iDlLx9swcmCcNkQZffmEu12jGQ+ci/lSXc=;
        b=Pk9XpRg25dB0z18cv7mPpbZ6XEafWo4Hs5YbkvJDFxXDKzgKoBr14/soR4jtCsws/O
         tzSkXAi5bxUIXHozvDwQ0ryjFsBeqtQwGsfOClh+P/TerXJ6fJp9W56RYd2WT2qWqRZa
         AgBZwc26a8UeEa43h8olZIr+Fj4BdeofhtgbVawGeyWy4DA0n3Bi5VujFFwZde8y8ZEJ
         EeFkk3zW44wrjxUIoKcNKtBmQDBQouUaU8KP6ufX94uRmk4uRBe5wCh7RQEHeLqZlztQ
         XSV6HrJCnWZt35gqAqje837caXHC+ON10OYPNxfxBbVA5HyXNVDp57OSpMrluVX3ssEs
         etxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787712044; x=1788316844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xBvIvGQQ8iDlLx9swcmCcNkQZffmEu12jGQ+ci/lSXc=;
        b=WYLXKpmdLY73PYTlaNmwwvXPL9O+dsZUP3KN6Av2Zc6kN+kNoPtq7lWfdscdLBrINI
         TLhFWDCWLGPnuU20ZH1R4oN4fYMwJV7KwdfcTCLbvsJJCw27p3zFI59BJsXDGWj/1o2U
         2cAfEV75atNqopCMST5h01zqu1S2soPHTdSxV6/CRBd/Y8p8/UZsZDwEh6FnYr+bGIvT
         4ru1QRqb9rj28e5hSQnuk0bYM0A8STI+aRGRvzwo+cgd7x0IqlvRghtl7Tr4ROR0OPaa
         BI4mDDehjYqEpTAMnsfpsT/yAHUDGvph1ulRTUE4BLzleUGhCBpu4kD7M7zZAAWHPKAn
         /KqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqcvqyX9JnJmHuURt9LvMRApEYm/IGbwCPI/6qsetBiJYUav2GceAeDucUOMxl5cBqX5aJKaq2zJxJS@vger.kernel.org
X-Gm-Message-State: AFuF++m6Xj9D020x2jnyCdWHLj/g2avMg5ZJGFO2h7G7U3Z8WzSq10RY
	bIe22gpGF8RaIl+/TzlIpy92cOfVNB9vaCx/GT5AzAcuWHTvqdhkGyet
X-Gm-Gg: AR+sD13hYDrTH39iVaLoVlO2elMPZ7MlOJwVUgRdWaZ3M7pqJ/P4diDjgeJaiK6ortf
	ifbtlfJJz3Ip8su9xupcu48cTv0hiJwZp7j1j30f5hSYyjQAQrD0VkWz7sg3jThJUPOk9cTIa2A
	nj7abc/Dqepi23/v+qf2u/jxqVrdKRFX+GC/m6dvhmFsDbnUC97IFnpZARQNQKKNGkik4SFvgz5
	c3jCeekkV0qJn7YoNBPT4xeFoZafg04MjPxs5pE8cNha8wfGnJBiEHT6J0vCDtCZUmBcd95+GEt
	VC46Fo76wAoCyJ76Iu/siBB6Syx1jC14gOpyixsira9cl990PieIGpYEjzKGuK45EMcUVFr2hZp
	ZqI3LJftyOvKugtec6+UNNhHcMGt+6WAD/ffB2WjeHdmbZPbGK8/+bqMS0lEYJqcP/X6lGVjMti
	fXAPfujCUcy5xRsNN++4V8TjQCZBdKmjiqEWuoOORvTcjHPlUbuttl9f9yElymVg==
X-Received: by 2002:a05:690c:c3ce:b0:845:ddf4:a39e with SMTP id 00721157ae682-85740497985mr13245667b3.30.1787712044566;
        Tue, 25 Aug 2026 19:40:44 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-857053839fdsm9976087b3.10.2026.08.25.19.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:40:44 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 02:40:30 +0000
Subject: [PATCH v5 4/5] dt-bindings: dmaengine: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v5-4-abc5229b441e@gmail.com>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0

Add `allwinner,sun60i-a733-dma` to the list of compatible strings for the
`sun50i-a64-dma` dtbinding documentation.

While the A733 DMA controller shares many similarities with the sun50i-a64
DMA controller, it requires a specific configuration due to differences in:
- Interrupt register layout and mapping.
- Number of channels per interrupt register.
- Support for higher (32G) address widths in LLI parameters.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
2.55.0

