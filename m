Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780877;
	b=TNNQd8kwmov8BrvbRhw4Ow6UfRt0ndUiR/oQam3ktSakR1SJLB/l+IDuOtFR9hBPb9F0
	 w+NvNpZR71HdMP6EuUX5r6xLiZ5YVot9DSWVl+Zbu1BmvZQWSsKkLYmvessPke0WFBsUt
	 niUt/8T31d33wNcQlm5lqhAKTZpRuXv9pILyvPF1tgRVZ5RtCDKZEak5kDBnBDlKu/LI7
	 k0P4tjk8bXKlq+e1Zkic/YAspVOJ5KVKMBB08LvleS5i7Mca2H7iOSrpz2XphEDmPMcW+
	 2M1fsxuj6s1rJfO0vRia4YiTc73WQU6aCUh8gdHEA62LaWVPiQIwFea7M+Pv1KaN9Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LiLmIUs0OkCCdpFo34dseBA6Y4Jh270a70ul1A3BXtY=;
	b=0vkM2461LrI0vSaunB42PnO7jjyAKXkjPAbVgqRTP/rNUpzWo6yeDOlQUbdJuiH+wdFQ
	 4RhTkP005ZRXaLRDgW0EHU9jWeHArA6nGEv2SrAV3AkzS/yNTdtEm5CmtDdFKvOo4G27E
	 z++ynwKsE4r9WOh2S4vDkTeG2D9cf0XcWwppsLsNEc7KsS/BypFoivBaZZp4O+fPsA9BA
	 qJYKtETz1umF8iTG2R8z7/0qt+h+94alDcbsPoNBnP96slANOYLDpTNagdkeUdcXcq8LY
	 u7LcT33LARwoTee/RhgbPJYdvptEoJbpMU4OVY183wKLWxjv5b3VjCB3RUh8mV0D4KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SqtudJZi;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B94606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9B94606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SqtudJZi
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so51552835e9.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780875; x=1796385675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LiLmIUs0OkCCdpFo34dseBA6Y4Jh270a70ul1A3BXtY=;
        b=SqtudJZirmep+4E88lLbx3+Z9HziLVpTuJj5EqIzpO1Hz6MoRJmTWUPtrWtgQu6NJj
         9U6ky5d7AoX8DEKqSHesz1nmL/n44K+NW94H304YwsXftIl9KtCoK7hRTCvs5SmBS93S
         jCo8O345BBBJmPB5005/j+3RIBPPzHzSSHU6en038497nWB/UShR8opUK1xLLT8NKeLS
         0GFW0gsAF2A365RRM+GvOxfbf82PAk6U4cnAMtm5MwP/fWuS9OXt5tUvS4ynFDY/UQcP
         dRPFiZcZRhClSa2FrfJWzZ4SQryhfKX2BwjCObDSVw2/Zr69uqctETPdhGz2TlQLPm/T
         ygHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780875; x=1796385675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LiLmIUs0OkCCdpFo34dseBA6Y4Jh270a70ul1A3BXtY=;
        b=Gq1ONxaZYr+CQx87w/1ZjR2wf0AKFpvdUw95uXmiv3DDJk1SL5P5HGOK1E3oyrPZC1
         hybUNXFvmfrstMZeEvNh3JoLR/mQ+4bKTZ20yxVi1Kb2F/BWykd7HXN6Js8E4vTxVwsq
         2O6aBoDA754tCdypFckjsyEb5t4VAc22XPMM24Ypj6es2OALB7BxOcv+goO3lZfdaBDa
         jsf/P0G0hy5a+Gqg5TXEHexRUYAUzB4Nst7S8yBCODTlQ/PsiZh5Y/lZCOp1G7BlKoSY
         66wUXgejSvJa7OHnOczzLArAaYr973yNDP2PG8ap69YzAstz/mKZaFPNelPPq33DoVE+
         rl2w==
X-Forwarded-Encrypted: i=1; AL+hErHKVNSwLVXPZaThZSIv4qhE1ru1dEjUO90kgmwNLYDV5sEr5mJgdSvvKE1n7SYWpmDO1N5ArHe9KLvw@vger.kernel.org
X-Gm-Message-State: APuU4Z8HEdOeNs36IxOBA9iTeELhzvkcdFhbMhbe1IVsDBuF7IX2BJn3
	615tDVyDyWE2jD7yL+SkoEa6VboscwUct1M7tRNE9pfCU/0uRfPwbtaX
X-Gm-Gg: AZFdTZfu6jXLJmMwEtX1imb3ZbwGXqoXeqx0ml26Cz8cQG6MbcdmiqtU5q00BXkVs7Y
	XTlBGgBMABd3P8Eq7pMZacY5bl9BtFaJavbp9s5jKNklfKVpp9hjQJ4kCoWvyb3nbUBsLoGgXz0
	6CRkau1sTUBklrDkHklA0bt5/fRlyBYKovxrcNW8vaPuneH+l6K2xcrBadWJiaGJvjppaokfGaF
	crGc2oNec1qb3hW2JTYwgwRO9poTmmJQ+aI3ZE08FeeqlpXwwgT3EjfdHGkUtinnD2aKxCG1IOE
	w4nitspTGQrGD0pJIUdbqgFcVv3csB9+bKAiW0YvLHo4xgHCfQQtx4AIsexkbeMnXBdMURPAa7m
	prYwlSPICNUtbNnpVVbHTBcq6GwDtCOxUSipmzkDKAzPlfnNwC5cpF63KxbCwGI/+vqoxqp89LT
	dQ9Yfta6nGJdSLseCZnZ3ZSwGatMcc13NmD7DHEnnDEqJm8/2RYFH/kqju/ckyKBxWaAGkKPxmA
	AKDRGFQdSv9GRh8vpeAi+gJwfjrWA+P32f7JIbWufCaZwdVDdYSUZ3szSNJ/Ax/bf5k9RETqYGy
	x6IcRR9oWhMo0MUD3uoRHddjHRSi+HAE5jO3Ms6MT4qE/ps=
X-Received: by 2002:a05:600c:5487:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb88813157mr490184945e9.26.1795780874947;
        Fri, 27 Nov 2026 04:01:14 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:14 -0800 (PST)
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
Subject: [PATCH v14 02/30] dt-bindings: crypto: amlogic,gxl-crypto: support new SoC's
Date: Fri, 27 Nov 2026 13:00:35 +0100
Message-ID: <20261127120103.1532882-3-jnieto.alaber@gmail.com>
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

