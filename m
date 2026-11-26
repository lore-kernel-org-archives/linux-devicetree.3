Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721584;
	b=WUvfTMi9mE17i2LhsHQuIgqRv58fBk5r9CR2vmjbbP7klbJEL3SIyYhQu2ofqwYH3+L1
	 TdnYK/OqxgMpmmry46oEeEwubabod2l2Y/p+X6+q3XqerEOCDIHIyDoZTNUN6Y0WpK432
	 mImxlGTdYUcRu818VKDmLXkIIKtbb2s4MD4/kA1IHIHYAuvXIxR5dEDdFvLmsmAG0LHJW
	 SHsii0h7apc1UhAj3x2/7CBKWegJQygbjPJgUAwGniNRK39v9/dxaSJpRaW667Ihe337Y
	 txAFqT/OB5Ihif2f46KLKOySSxx8zNiagIM8ONwAlPanuqHo8qL/9UTlL5NyZvkQptg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LiLmIUs0OkCCdpFo34dseBA6Y4Jh270a70ul1A3BXtY=;
	b=CQQ33R1MaELjAgzRFaGgoIPpoQbYgr7glwbgimKx5FaWaDgdGMDeL6rcmBrxW2COVIeL
	 +RuKrk1eWiQiCMUoiGaIUw/aS8asAbOjIPgJ0vKaTVmtY2oXdDR6fc4CK3X/Lr53aE/NB
	 FFRijN1uni3ythC1YAn282e3Gy1D0TEaqfqkVTGvB7AoEXBUl5K5MWUohU/+pvUU1rDn5
	 T20YMXFgH5QxkOZP7hodgZb67EZV/M6gdZyVRXm1YPBPITu/A8w3eATqgNhzrncWUIRCN
	 JYeUTgqtw6iKVZgvjRW2sQfx98kSEcP+uciOu5kRypqF9jc2O1lAYOVpMuZxDvr/PAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PK7FZMEj;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B02A606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B02A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PK7FZMEj
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b467581b98so71733135e9.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721582; x=1796326382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LiLmIUs0OkCCdpFo34dseBA6Y4Jh270a70ul1A3BXtY=;
        b=PK7FZMEj2ahDV0413m3lXgX7CE0JHmhr2KLv/BNO80Xo+lgBmtdswxm0q5g/0cF+j/
         ARJWAyvuezvB1nVD0HV/LXi+8k8xbYgpq5x6+uWTFxCfvUMN5OUnzL1pOaFWeFxlpM1c
         UoOjUKDiPj4bAz5zMc5R7lNOoxA+zUyBUqN+azA2dxHMty3tFEllSmL1qaQIsOPRfhCJ
         /BWic2boMqcBFLlSNBIvMZ9jAV4SpIZm+Vvrvpj2Cl+oCiGoLNd8bDxhLH1wXQzdxtqT
         CnFCBOdw+eunnNs6Uo303/FsNvzjZzDHQ8IiKV9dlxUMYIzE5EMCj/Jeo6Olf1W+SNNi
         14GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721582; x=1796326382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LiLmIUs0OkCCdpFo34dseBA6Y4Jh270a70ul1A3BXtY=;
        b=GN4wJ4yAOxat9UAVzxaJqvE+UKrgaSh2ZHOZB4Zh4TnseoYlDO9uL6vhl79sexd3A9
         4BnoqmDnn2mt/e6Ti9tnTevciZAi7UXQ22P/aQ3IWOHVj5XYP/daJ42/ebWh9fBQE1r2
         KvcX53HzSfz3w4UGUQn8sXAyhiCmNzNkLAt2L2IoOyuBoe7e5K+/vYt3bIUouK/2RdxX
         XT66+OlEAEswUkKeffDCQbZf6Nf605IjtCYvzc/c288kA+jFhVgnF2rM07jUa3s/NV3L
         5daUHdoAjaTPJu+LFpDrP27DpZ2uWYZBI19+sLhymZkrlQVVNAfLyuSzXBJJ4+6i3dFX
         jF6g==
X-Forwarded-Encrypted: i=1; AL+hErGy7ot3AX8yYBiy/fklAHVj/G0nLiOMPj2s4qXUVr54JLAsz+DF13it4mFd7DDj5Q5aikKBxjFUJFXl@vger.kernel.org
X-Gm-Message-State: APuU4Z9V7QVdeGGNh9JofhvW4q4m98W6D9ImmqjFINIbRf3/tG1dpAw8
	0EUwjK1L0ONLdFzb2lTtlhcKTM2fNbapHzyRnC5zOxC8SW0G1MByJco/
X-Gm-Gg: AZFdTZdMZ28A3XKoeGMxt96gQFVoCa9yeaqvVZWlMqRJ8iTTnYTrg86s8+rhe4Pn/6C
	gDvkgyx9Cx8I5X7dxtl0SFTCY/GK4qlM+GL5mF5+n3C9IOKpLnP+9FdcwsPLvjV+DmPtLkBDngJ
	OiWJyZo9us3rJ28lfdL2LM1OVGUvga/ZNTLZcX/cp2/KEwXqBB+eZ0o/TBHtN8U5olq+khrFPou
	HiQvT1JyNZzZrA1ZrLpn4W6kEfTyZqSrhAlzFBUoEf2+3YzU2e3COdoPTTcASvTTeqpxcRLJJOX
	X42DD3xjrZYa9DA40oBXE9kho3D1sXV0WssRXJU8Y2J+ppj8SQu38GcRIb2ml2RIsrXZcoq7e2g
	/6aTg3I6VghN1y4hlgL1CNAxXcitrxHNBkn6O2peXnKl2iWwhSgu18cxH9bN4RSngS479I++bST
	GqvG27Ves5zUczomylFd128BsrakGUC4n2QL5k11+XX2AgfPs8GQNgiBVhat3OojRuVaUxynEBE
	rGju9xQd+iuaB3kJs7bUtu30K/3QnwO8IkQHI93LqLl6Q4T/uyW0zMBQeVYscNVUrC9QW2M4xK5
	cxH10R96Se409DI5kpFqVYl7UqMOdOrEgpheghKKS32N7g==
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb8882672fmr465522865e9.6.1795721582273;
        Thu, 26 Nov 2026 11:33:02 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:01 -0800 (PST)
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
Subject: [PATCH v13 02/25] dt-bindings: crypto: amlogic,gxl-crypto: support new SoC's
Date: Thu, 26 Nov 2026 20:32:18 +0100
Message-ID: <20261126193241.1471372-3-jnieto.alaber@gmail.com>
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

Now crypto module available at G12A/G12B/S4/A1/SM1/AXG.

1. Add new compatibles:
  - amlogic,g12a-crypto
  - amlogic,axg-crypto
  - amlogic,a1-crypto
  - amlogic,s4-crypto (uses a1-crypto as fallback)

Difference between this compatibles:
 * Different registers offset and the number of setup descriptors.
 * GXL doesn't support hashing like the others.
 * G12A/B and A1/S4 crypto HW don't support 192 AES key.
 * GXL, G12A/B and AXG require a reverse IV key before processing.

2. Add power-domains in schema, which is required only for A1.
This is specific vendor design: in old SoC's power domain for
crypto HW was not configurable, but in A1-series it is configurable.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/crypto/amlogic,gxl-crypto.yaml   | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
index fdc39797a2a9..106a9d1fed69 100644
--- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
+++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
@@ -11,8 +11,16 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - const: amlogic,gxl-crypto
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,s4-crypto
+          - const: amlogic,a1-crypto
+      - enum:
+          - amlogic,gxl-crypto
+          - amlogic,axg-crypto
+          - amlogic,g12a-crypto
+          - amlogic,a1-crypto
 
   reg:
     maxItems: 1
@@ -24,12 +32,24 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: amlogic,a1-crypto
+    then:
+      required:
+        - power-domains
+
 additionalProperties: false
 
 examples:
-- 
2.47.3

