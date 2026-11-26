Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721583;
	b=HbukJszUctSwoAY5wAjauuOyTj/3XvqX+qiULrkCOjZNZIHvJMRDOS09BabRS8F6z5uR
	 6+Vr0pqUEdHNf1AUBeMnO15D277kv+FampgBbm9PH4NcBlY3NWDtMtdn1YJGvZXfZUq9A
	 ggi/fDktWW01LIWcGvWBgSD/YY01DLAMmTLzSTxLq9VeQdTcTDVhvyzMHzoAFub+GrpEc
	 LzttzupkOW3VKHRr6AbjIJGv5knO31KeX7uk3psj72kQ/MSJexpPFwLJBk84sSMt/v5b4
	 5kPtCz8STYkZ31XGhFKKZgX/u21YeJrXiXLXd6AK9TPf8/EUBi7dOgN0DYOF3iF1Ujg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yslwO1t9MXGHf6kGSQvi8Jsla7lrMGXHDb1MA6K0JGE=;
	b=ki6gy0NJZdZZXe9OZTJHzFVwQq2UdZSYR+KV/IPcx75D7dZPkI0F3VD3ur3rbheb2M9J
	 HeNtq5lrMEdtQ/zLdd9FNMpVGCK7iOxvvyeVq9Rsl18vumUCxMZ04mzv/ZkaniMpCsRqm
	 z/+WdRjNWB/5T5xw98w8twJq/G8PVkaW+XOHJ2yRz4vNPLcoTsWD+x8BvJ8X86B4B/WIF
	 ajx/uUY/sCU9mwIqZ8j5T0BoDbzORtssq3YGULex3NKGVnuvF3fTvTQPFnaI9tjhS1e/h
	 mXWYuLoYZanTU1SoDCCKYFhJdufcV8aa5Ay8CRYiEeqDN4Fgs47dm73N687kdZCGqSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivuX4+nj;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5379606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5379606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivuX4+nj
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dee593f18so6885257f8f.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721581; x=1796326381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yslwO1t9MXGHf6kGSQvi8Jsla7lrMGXHDb1MA6K0JGE=;
        b=ivuX4+njXIxjCdyHHok0kE5C6lUcPxDZnGAGn9pOqGeTr1zY7qMFnWX5i9SYgpGl68
         aSVPQzef+IMteddK4OCPOQPbeN1Tp4FirzNZUJ1eUl8ljCLUgomkmTwjErY8uRmpQxsW
         5xzYY/q0tOnzqqhQUCfzAipDCtfTvyJa+NnnjvG5+vpvKRFwSMNnLGeJ1KReM9QbtNKI
         FYmSt3nhucgwEf+x1A7uICj0fzSLpJC+r0PA3l5aSlZq37HNPl49/bYnblph/drowf7x
         zihecJ8gZlpPoiHYkHS3MTPJL+kzDqCD5Gx9yJYerRk67ukjmaPlfgg2LOL+4QbI3MBL
         lFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721581; x=1796326381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yslwO1t9MXGHf6kGSQvi8Jsla7lrMGXHDb1MA6K0JGE=;
        b=1glQfeVW0gLD95TP8cTqUqM1fwBVmcg3HzNWjxTpatf7XekS51VlI11VCnsPfZttjC
         nmfPBL2rEZwFZJKR+Yt1YR/Sm+uHzVdqEBPcuz+5j65APQAhc3nHFMymd7A8Qgd2Znle
         7N+PMMRblFD9mVpBQT1WtqmaLEBKMx/jI4BW4PsqfIXTdpCj/WvGYJ3vAdUKlVtt+35E
         qaBBWEDHcMJydzoOXt47C+Eo/WlaTh5EW8FsATWKVK8D3xlmsiuJ/NE2nvVjvB662dxI
         tSozhHQY638X1GtBxwe4Yi7LhSWinpYpv79/HyMMJrmfkYl/hZJnB2vdYrMfRfgZvuq/
         SVCA==
X-Forwarded-Encrypted: i=1; AL+hErG8izQvG5Kqr3SkJy44v6HNX/0AgsIGdVVecJ4WdfE7NvQTEPzHDrONji3HiSy1ndhuCIukGjyFca4+@vger.kernel.org
X-Gm-Message-State: APuU4Z9Vf7NrE+z/ZTUIj1FKOCNRNr50b+ITFs3zJSU6SA4sNj0fJck6
	nZT2bVGiHxDthsSFMNKVHDE+TGIgcDjq7onvl3l7atICHRb2R4ASJqXy
X-Gm-Gg: AZFdTZckL+B98BItSFbVGh/ZGt8guiLJt+4fqoVGagFl18P/Xrd9l0Rvdvc3vllTolx
	Mkq4FUlS/pqn+gsRAI/KOs98juz8I1hTw6W96zz0RukLf9StIo+1oJX489T2szrwqpTZB/lB0jm
	4fFr4SvluhQFiNEH8tmZ19wSwWr78++ut9CzUPpSuhaWJh3hh1OqFLqo2r9TbYSeGM6tkzOfGTe
	IKVHnfR7k+KpTPvKHqwfo2+dxlLVXY3dWRh/mj5CFyG9hRCy0atiLNL4o7hy7+/S34jx34x9pqL
	qttsrIjER0x8OaosDLNGUGcjCKbxMqQSMrOixEuro5N7K7NsEtPqFl2FCUjScEAne/xvkY9sAIv
	xZv+4NWKW3QD4+V7vwOjwYx+vawLtgzVJ4/02ruXbjyL/7M7KXd614zH8dzRj0O4vxvrmcWUdts
	KKmvdpBeqEAPA/U0deFXISqL5wkyfbcQ+Ya8XSBBW05szkJ2OEzOxmPGzgfEAAsqJ+RFYORVHMG
	vlBd+sz661Q54ZCSo9XabPpg19E+8THHOqiOFZvCE1timf1OLuZO86adCMDn7eTMg0eLTpWxQNb
	uCDfqSjpvoHfxkqDoA8lFFhtzmwo8uCujZ6rql0H01YYsw==
X-Received: by 2002:a05:600c:64c9:b0:4bb:8701:bb14 with SMTP id 5b1f17b1804b1-4bb88804d1cmr475541865e9.5.1795721580895;
        Thu, 26 Nov 2026 11:33:00 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:00 -0800 (PST)
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
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v13 01/25] dt-bindings: crypto: amlogic,gxl-crypto: correct clk and interrupt lines
Date: Thu, 26 Nov 2026 20:32:17 +0100
Message-ID: <20261126193241.1471372-2-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

GXL and newer SoC's uses the DMA engine (not blkmv) for crypto HW.
Crypto HW doesn't actually use the blkmv clk. At RTL level, crypto
engine is hard-wired to a clk81 (CLKID_CLK81). Drop clock-names
field from schema: name "blkmv" is invalid and "clk81" is confusing
and sounds like something global.

Also, GXL crypto IP isn't connected to the second interrupt line.
This binding is useless, there are no users of this line.
We must remove it from dt-bindings.

Fixes: 7f7d115dfb51 ("dt-bindings: crypto: Add DT bindings documentation for amlogic-crypto")
Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/crypto/amlogic,gxl-crypto.yaml | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
index 948e11ebe4ee..fdc39797a2a9 100644
--- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
+++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
@@ -20,20 +20,15 @@ properties:
   interrupts:
     items:
       - description: Interrupt for flow 0
-      - description: Interrupt for flow 1
 
   clocks:
     maxItems: 1
 
-  clock-names:
-    const: blkmv
-
 required:
   - compatible
   - reg
   - interrupts
   - clocks
-  - clock-names
 
 additionalProperties: false
 
@@ -46,7 +41,6 @@ examples:
     crypto: crypto-engine@c883e000 {
         compatible = "amlogic,gxl-crypto";
         reg = <0xc883e000 0x36>;
-        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>, <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
-        clocks = <&clkc CLKID_BLKMV>;
-        clock-names = "blkmv";
+        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clkc CLKID_CLK81>;
     };
-- 
2.47.3

