Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780928;
	b=sojIxZe/iz8vg/iPVPSbtn2dYV6Cs/MX483ZIG50lA2/PyWwY/3i6hBqQiobcXjEMDtj
	 CnE6MrS+5zUDW//ie95BFnCh9maiVp8jsPxOEcBaxIQBp8GBBwGMhtz1ay/kzYSOdZvRQ
	 dUm4nAtQg90bWW8FfEDPIwl7e5P9X5yqy9nQcHaqAVt7vNlBUsF0OvgMUDjolfR6DGUAn
	 ckHXf7EQc8wiz1aNHfMRk7txnpMcGMDLLlbg8FfgDEAYjCVlC+tWKRd28wjhScurJ2h9N
	 431B4DUnLp005sVo5r8j84rkOKSAKRNUknpxd5YfoJuqR0srdV3O+kgl+Kiiu3uOm6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QCpB4RhzNL1T4jjBraVD8Rve99tT2QYwwNJiLODS5Wg=;
	b=qQmdSBNB9EDYQWJ4uQ7GoVQeWc+6Qxu2dse3fr3sIJBlHG4ur5pUhsNJmXW3XDE7nsSF
	 Jq6sEU8tkGrag1uWJs/qeFhJqR0ouVJwF7UI9o4mVia4XZvYi67EkTcSGkUl9yZPqlCZC
	 3Bkq/ihJdtckN7zu4EAJBoOWc5o97LXoAZrdaghJvoQuyx21Wxzf6lgyW8vcmTcTLLiK6
	 1B93cFcGPBGnZvdiLr/MqKFhZqW91JQOL82Ena7XGU/v8EpAMQFpFOqgGkjW7VWVbjk5t
	 /87yzvaUIj6X0qAT1ZGhi9NqfyuDomjg8N7V3YnJnHxNuvS7YD9HfytcMB/vmsoAJCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hPEdgQnk;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2DA606A334
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E2DA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hPEdgQnk
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so81294685e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780926; x=1796385726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QCpB4RhzNL1T4jjBraVD8Rve99tT2QYwwNJiLODS5Wg=;
        b=hPEdgQnk7ry62KfQpzuBm+Pev6rVBz56dx7C6t/Hkuz2oWGJKdGQTN4W6rQZsOSP8X
         L6weDKWxvj2upp/8ZYzsynmaAiTr8V5/UIZSI49GG9h6UjXtqXWcrUAg65PDW2OnmdGI
         gd42U8hzgIPOpZwOkjGM4v969ZEaVGae0Ne343M6bSjqjkM1GxGItW0AgfXVTV9+SzWv
         9xVUcGPf6VefO9gMLlvaDEx5Hw5J+tBFOVRkow3xiQ5dV9rzBjagYQbgKmnlTZKy/obg
         CTkri4Yoxk1/ugC7oE61KMxWLwCpZulo5FeFiWQDOAJf3VnT6CKOVyrbr34pZEvqBxZt
         kj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780926; x=1796385726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QCpB4RhzNL1T4jjBraVD8Rve99tT2QYwwNJiLODS5Wg=;
        b=h21/kxOom8Vb+Znj0tsNGK/D6gnk6cg9CRZj//rZjwNRVvJCQVMVaqdIFuPcGOqVge
         wRLKW2py7nJDyHKgdPdgc9ScwrQEs6C+jAmBu9Is47bVM5UCGq2Ug4qbPDWgDQpuzlqM
         mQypYRwfPgO7pSOn4uzBFdKbcE7QAdy59zkucX9gGSfeJjoWoPaMI46ooTEJ7Du19KiY
         DpDCuhlGwXX1UPhYUhUWmUTjWAmSKSv45otziM+vV+hxcaitOpMfrfk8jX6ADiKrr785
         UWdhK2q18uSl8nr7e/PhIWug3Bu880XRRZegIKYBww+G8cRqIypn6J4wK5HeERplKrkL
         QCDg==
X-Forwarded-Encrypted: i=1; AL+hErH9k42pmC7FP7XtbCmZVxhs65D3ngqrKDdJYZqbdNr5WDVKzXv/TvQBLwq+uMbqEzcSE1MbrXUgeKSA@vger.kernel.org
X-Gm-Message-State: APuU4Z/vAR8lLWNCrlcjvMe+LHa+sMNqhkA7enAXfA+RsjBZHru0lrjf
	Qjl+qAJ21vEOIkg50MtI3GF17eWHxjkzhHCJVyle9Pbn44wlUgyjUOwJ
X-Gm-Gg: AZFdTZdctEL1wqKTD5kn+3LvBAYVFLp3je3RQtsxd5p8FLQHCnHPlDjJs9q/pzJ/SKe
	SC3qAMOorbe1HDMuXwWdycnA9e+hRGoPq5p+/kYnY42aWu3kLgkJ63aPxWBEX/+zLKnBKb+lLEp
	Fgtab5SavIJxvlfLfZ4p8P16fBIMuT1XdzzcBoMz777yo/ovT+qYexNlHtUWWiuJVYqpjGztsW1
	FdHspOzg9j6/ZU4FchnCjmUqlne3oqS4gRXIefTTPZMbXReYlj8OXISDZItVEAOA+FhmnhTU7RJ
	4Zkp8fziO4vJ355OaylTHj7GpSbq1dzIxKiUiBx7Nzha/e+zOzwzSdC7Nufe8aFcM/IFl8B8Fq7
	drlXUWFZqfRCCyHyFEje5lZTU6M2CaoGElUnuwJoznQcA+aHMM/kRs+yL28EpkHH3td8GK/cP7n
	NLDBYXcPMstX44ns+zx8UMp1HZoVPGRpiDDUVPsAt4cggnK0btnXhiMnqEGhWxKNTwgYN18cwIN
	rQj8HPR96Wwk6Qq4nFNgKnMCc4x6Co6mOa4naQebfsbwDlMLEyDDWosEhQvZQGVRdLbUwtNerRG
	ewueLxZKYLYR17bolkIlbMOuFhI9bovY
X-Received: by 2002:a05:600c:6749:b0:4bb:5f95:c014 with SMTP id 5b1f17b1804b1-4bb8880f283mr492027085e9.19.1795780926108;
        Fri, 27 Nov 2026 04:02:06 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:05 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v14 26/30] dt-bindings: crypto: amlogic,gxl-crypto: keep standard property order
Date: Fri, 27 Nov 2026 13:00:59 +0100
Message-ID: <20261127120103.1532882-27-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

List clocks before interrupts, following the usual ordering of the crypto
bindings.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 .../devicetree/bindings/crypto/amlogic,gxl-crypto.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
index 106a9d1fed69..6f19e790ec0c 100644
--- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
+++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
@@ -25,21 +25,21 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
   interrupts:
     items:
       - description: Interrupt for flow 0
 
-  clocks:
-    maxItems: 1
-
   power-domains:
     maxItems: 1
 
 required:
   - compatible
   - reg
-  - interrupts
   - clocks
+  - interrupts
 
 allOf:
   - if:
@@ -61,6 +61,6 @@ examples:
     crypto: crypto-engine@c883e000 {
         compatible = "amlogic,gxl-crypto";
         reg = <0xc883e000 0x36>;
-        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
         clocks = <&clkc CLKID_CLK81>;
+        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
     };
-- 
2.47.3

