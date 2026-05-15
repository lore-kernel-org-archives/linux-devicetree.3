Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E982A480957
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845930; cv=none; b=nCpfawneQ8eUoLdgUHOZfF1M3aaLsfvL4GENHuEgFMfAzCQSBGeI6aarpkbrMa9iwiQYTKiIUKSYx+mplop1CKuxkxsPWWZ+01KQuQCmyOb2xqGe9M3j0E7t8/t6beGRioR5GSFJqzY2EVm1d5wpVTW9h6ZHUY8T/vJeuMiIxAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845930; c=relaxed/simple;
	bh=feO571qSHMBhSw9FnUvtJU58ZnElf8PURjLCSOnDmEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YM+7qFQIkc0vUGBeSlvLy5NneDwqvQ+KhXG1t88NyNx7qmXTi91YiaSRCmA2gAuo1IN+cItXNbkSvmjZy8nklh4cvRxv1QxIb1dCfc3rAuqdnvxaXSkRtCAs9qRy3KO2EfSor0qr8xEwQGhcpU5Q3EcNGBl9zBNfMpQypdGHTa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuubbMaP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuubbMaP"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so79212665e9.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778845927; x=1779450727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aMCoyazuJELtNjo3L9VuPYC5o4Q8/gFp6bEqHTv1GE=;
        b=QuubbMaPlfVkeVXwR3fRF/bMhYmvqDQM2PQFbDrxeajpb4mq92zhUwDliQ8SF/Z5eA
         A4OU42uj6SUaf7leHM9V6ToMcUWleiBCS3Gf8rRoXo2IsSJjsbUDlM//O3PSvtPhNMZv
         R0oTfavgawjFF4bNsSex6Yh2qV5FqCLy8r96jUEGYt5OwONQpb44RBijcDvohUE9dBhZ
         IKsS6fAV4jtu9W6hICVBRBaUccMJnKSfwFSQI61kkZtdYuHmd6nmdCNE9nTsNDG6xe7M
         WQ7ZD9CMwL6mXkGj44Z0xu30dCpVH3Ap2UUoWaK6WrurG6uFPDpjwbPLYtze3KVSE6Ma
         1MWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845927; x=1779450727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0aMCoyazuJELtNjo3L9VuPYC5o4Q8/gFp6bEqHTv1GE=;
        b=m+SpbNTH9jynXaeraP3WDpMZEvErTg7dEpCdM0KtK3ddxwnCp6xaJqCK9hp8Oz42UE
         JwceYwkQuAwq7eoyg3/0USLYQLcPxhYsUeecK+npdFz8w5/fDMZ2yD5Mh1ZQ5ZkGV4rL
         dKVxOjKfzfXedMQ0HWBTtfRL+CHhY344n6ijJNsDOewPsiUvE/06KA+270ho5c8hF2i1
         sv5pwZmVpteZvXa7t1pAUh4IvbpPrY5MmVvohb7r21E75JAeoHEafPE2P57pZa3oAAZp
         RfEVZnimxgxTODH9EYiaX2BnHMv3yjUUiaKyLSETcViQzGxYLrmWSAgu6fogymLN34Km
         bq3g==
X-Forwarded-Encrypted: i=1; AFNElJ9EhHG4cDAbIYosLc8qeL78M89piZ2vJwriPpQJvv10kfsoN9SLflymwI/kLyhP5gsNTGcBnLnqge6E@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/i3TfZDMexWlQ2Mq6rnzH1HmPJmMyTPEo4nPjB0frsEf+diHL
	c+c8XvuF6Wj3B44urYQtFSxxloZm6AvLDdhiLrFutWaSbA2k9zhson9y
X-Gm-Gg: Acq92OGJJD5lzfeKyThuko6K790TF+bgxLG9iMjs45dJcC08fpAVHDBm3REsvUCyN7h
	qb0kYY8J/VbMbaY5jn8aeZyJ8GLPsm87JkusGZv4TVPBXzKI+sVUrpetvjHVp5jmov+DEWRpn7H
	HODLYo7Bq4z5JlMR+AN+vnGv+N85EQcIXK+yd+xkYyV0vlWFNiC7xeMJ/9NEhXqjEpHuv0D1wcW
	azR1D7xe3rpuNvbBoSEB5S+pZW/BBHJAyM4ud+qU6ioPhahTVzGIRmjk4/alqfla245I8zVN3vk
	2ZEvvSCQDfoYsKtiecXQWjMGFR0N+534iqOesUsqAiLdDtt39eIW3n1YoHqhRIHYv24sJ2kwKIX
	273njJzC8f30VNodYJO8UWhrCfPP9G9VasZAwf6jb6NpYCmKa1/hwM9jfwktJelYvX+7yIrCA5k
	UKkxuqsREs3sP3lfIFWiGMaS1JpFQK4lbu6ThGKIIIU9lOtIdfGlVg/9c/rxXceUVAicCEP9oV4
	Hw+i21He/QTsbK9/8YeFGatxQSyXShxgD/DiDOHHWvhByM=
X-Received: by 2002:a05:600c:c173:b0:48f:e230:c3f8 with SMTP id 5b1f17b1804b1-48fe661b50amr50941855e9.30.1778845926951;
        Fri, 15 May 2026 04:52:06 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c85a:b53f:fa7f:6b1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab818sm58376215e9.14.2026.05.15.04.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:52:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 1/2] dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H and RZ/N2H support
Date: Fri, 15 May 2026 12:52:01 +0100
Message-ID: <20260515115202.1515577-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515115202.1515577-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260515115202.1515577-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document xSPI controller found on the Renesas RZ/T2H and RZ/N2H SoCs.
The xSPI IP on these SoCs is identical to that found on the RZ/G3E SoC.

The RZ/G3E HW manual (Rev.1.15) references bridge channel 1 and its
bits, however the hardware actually supports only a single bridge
channel (channel 0), matching the RZ/T2H design. The references to
channel 1 and its configuration bits will be corrected in a future
revision of the HW manual.

Update clock/reset constraints to handle the SoC differences.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Added restriction for resets and reset-names properties to have
  maxItems: 1 for RZ/T2H and RZ/N2H SoCs, since they only have a
  single reset.

v2->v3:
- Used RZ/G3E comptiable as a fallback compatible for
  RZ/T2H and RZ/N2H SoCs since the xSPI IP is identical.
- Updated commit message to reflect that the xSPI IP is
 identical between RZ/G3E, RZ/T2H, and RZ/N2H SoCs.
- Dropped RB tag from Rob due to above changes.

v1->v2:
- Add RB tag from Rob for the dt-bindings patch.
---
 .../renesas,rzg3e-xspi.yaml                   | 60 +++++++++++++++----
 1 file changed, 50 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
index 7a84f5bb7284..cdeca4c795f3 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
@@ -30,6 +30,8 @@ properties:
           - enum:
               - renesas,r9a09g056-xspi  # RZ/V2N
               - renesas,r9a09g057-xspi  # RZ/V2H(P)
+              - renesas,r9a09g077-xspi  # RZ/T2H
+              - renesas,r9a09g087-xspi  # RZ/N2H
           - const: renesas,r9a09g047-xspi
 
   reg:
@@ -53,28 +55,38 @@ properties:
       - const: err_pulse
 
   clocks:
-    items:
-      - description: AHB clock
-      - description: AXI clock
-      - description: SPI clock
-      - description: Double speed SPI clock
+    oneOf:
+      - items:
+          - description: AHB clock
+          - description: AXI clock
+          - description: SPI clock
+          - description: Double speed SPI clock
+      - items:
+          - description: AHB clock
+          - description: SPI clock
 
   clock-names:
-    items:
-      - const: ahb
-      - const: axi
-      - const: spi
-      - const: spix2
+    oneOf:
+      - items:
+          - const: ahb
+          - const: axi
+          - const: spi
+          - const: spix2
+      - items:
+          - const: ahb
+          - const: spi
 
   power-domains:
     maxItems: 1
 
   resets:
+    minItems: 1
     items:
       - description: Hardware reset
       - description: AXI reset
 
   reset-names:
+    minItems: 1
     items:
       - const: hresetn
       - const: aresetn
@@ -109,6 +121,34 @@ required:
   - '#address-cells'
   - '#size-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - renesas,r9a09g077-xspi
+          - renesas,r9a09g087-xspi
+then:
+  properties:
+    clocks:
+      maxItems: 2
+    clock-names:
+      maxItems: 2
+    resets:
+      maxItems: 1
+    reset-names:
+      maxItems: 1
+else:
+  properties:
+    clocks:
+      minItems: 4
+    clock-names:
+      minItems: 4
+    resets:
+      minItems: 2
+    reset-names:
+      minItems: 2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.54.0

