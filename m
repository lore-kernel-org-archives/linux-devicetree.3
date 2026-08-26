Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40F427B4F7
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 01:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787707832; cv=none; b=TaopnQvCSybZBieoXKtAyZiYp8waiak1u3n93Lw33XCYPttuBv9/1P89OiqQOQbOWQhiV66za2/vMCNBZGDf+/dqCfnEHS7TVSpKAyWa/vMh06a4Dx/nFzIcyS+bq6K+l5S3ZZL5B0j2xrexM8dmhliMPN8jO1KX18TBp+wck5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787707832; c=relaxed/simple;
	bh=xXHRUhCMZY1UP0UimNCUgmYKZUE5pAtrJ+aeGai+WZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EPlX4n5h0gYBeZDoFf8HPJuT0hyYoJfcVlBRmNFHzTEwIE4pnQ+7Mv8QnLKhuy/xmcrxi7efT2gKfA95OoLREaLiknnYIE+bdmV5t3W71bo/wcPtce/K9vgVboQ0xPnfVEQNIPAlVdESOy+jPRdPrdCmoOleYfo/a9OenVhI4xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqCxpFx9; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqCxpFx9"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e512a9a6bso18293585a.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 18:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707829; x=1788312629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBvIvGQQ8iDlLx9swcmCcNkQZffmEu12jGQ+ci/lSXc=;
        b=QqCxpFx9tKit1CeUdzA7KKIWiWR16jjabqmEEjqhWetO3T7l1QUE6cVhi6HJdT8uVT
         hAD9Lc113pgNeVivzuGtn8wpY+F2LTKLPn63RTgwyIbaNQgrFjEvt63PmIURz6Ev8mhQ
         J8NVl/JwFNxb+KWCzYW9GWfs3QH5xsWq4LFDJIlSm01TEH7TEGhRNSrBQF1vtvsn8Ez7
         sRChfEpFSYOOx0ITXctWKmz6Gc9AkwdLB6wreeuoqALjMXcMnNwRIUZRc+umYjB8jJMI
         sbOsbainX0bTRKs+a5FjouSUc3ttNlz5ldjtscARopL55k3QHhbzK97VKAdr8LsxxOgJ
         8PaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707829; x=1788312629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xBvIvGQQ8iDlLx9swcmCcNkQZffmEu12jGQ+ci/lSXc=;
        b=h6BHnU30AKHPSU3NSk5416jefoDxa8uY0yDmngWHKyiphLv7MD7/mBv1YjzAS5JNSl
         WUpBkrPy8ile/XKmK7svrMuY8JY82H+DUn4wtmvgeGf2pGATnACfplxtK49qbHtzoKZb
         agUx2IzFdWGVul3vpK0gebqBCXBymj4pb/hZ1UVXFELgb8DPlXA9yBxIwGkHVxnAWTLA
         DnyPPBJS5s442TQVZzIOKhAw2h+pTX5I/GQ9TXbV/xLWTVSdTWQk9/VF8uRiEFO+nMi4
         rOoQP/95FePMb1BDUOReZXx8pj0hjszhKMbhj+q2g+H5jLV1qsbH8BvGetf+aLxQQIre
         EZlw==
X-Forwarded-Encrypted: i=1; AHgh+RobtULRUYk5MYo0F987VxP8Jk8bs0vwYy6GDB3UIckoHpSovvEuu6vab42OoFSfAJTMU1lIc8R91Uv1@vger.kernel.org
X-Gm-Message-State: AFuF++k8PEiM7iyPFtdRBLiw0NGA0oZNK68hU7vh1OC6/8ezyH0TIZzT
	2+fxx38iMm5rg+Gds3Jy4gJT9nErLLcS32nNu+6P96ApMkiUQPoLDLtN
X-Gm-Gg: AR+sD10gQm7QdFu7QNpABpD+36BAR+l8MwlQ7nQ+WlmdJlUaBt7JVUVGgTAwQZYGILI
	44ksy0WLP5GVRqzWnwBMNBY1IEfw6+UN2jjt/EFgFazrknTgkxyTshqqkRCwN8fq7n4SNefU08F
	BDTY6JzU8h11Sz+763sdsF7InN7IPYhKNnAycy72VQSnLNlVXeZzV7ckeUot3jrSVJOO1wMAMHi
	TVnk4XonF0VotU3k+Nn8upOcv5xcW97k4gOn5AsL3hBXBt6X1cxE/aV5kMB2gOQmQOsdFDDjKEk
	7H8nbh07ZyD6tneOp8tiIlCYHlCBV8MIax8KrggkjDAomrXsTK0616JhBJ+SAnMTs0H1XFdpwLP
	zbR+p3G8LJHKk3GQggaQy2VN319E1HJu/tvF9Ai/AajRFMIdK8Tr4yTyYvCRzEwXejvIcYXYn0j
	TtbLlAs3PGGR063AgOIdj5oDK2f2QjFELOqsg0ZkWFJXxj9UzX37GTvjjsL915pg==
X-Received: by 2002:a05:620a:29c2:b0:937:80ca:7c4a with SMTP id af79cd13be357-93780ca859amr248149485a.44.1787707828653;
        Tue, 25 Aug 2026 18:30:28 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c52csm102398585a.38.2026.08.25.18.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:30:28 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 01:30:06 +0000
Subject: [PATCH v4 4/5] dt-bindings: dmaengine: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v4-4-dc2f745f40dc@gmail.com>
References: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
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

