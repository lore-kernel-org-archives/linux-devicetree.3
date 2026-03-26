Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED4C3A1691
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 18:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774550302; cv=none; b=Q63xQEyzgfUn67L0ugjNCcGxiohJHAAqykx4B3+tacARvq0BxJTz1v1v3Q/eY4KtcFQ/hVBl3ZKKEEbhhfp4+sbC7d4lslpwneKRuYAeKxVUwHBTSvELfpXFiYLbwyZGBcejSYX3EedpnT6v8PtsbQyYBsmsB3IZEDQuhqhAdl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774550302; c=relaxed/simple;
	bh=aB4CNW0exvmw3n8TwyU2vVZfOExsUbeZNUie+PL3Vh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dfcTcdNN89ac1GUjTmU8NbnClOVRlAWNkJxKZWBTFmP1K1ByqLVAQuo9Zc3lxcuaKqkCUWrEwzuH2kb4u5QSgkXSivvgozB66/NN+rLj3p4UrfkfIvlMgihuSDtO11QA3tLiyzUvh/o9F6rtwOyailASse0gSIbui5xbT3C58nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQnF4Gnc; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQnF4Gnc"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-829afe24fb5so987633b3a.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 11:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774550300; x=1775155100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7oiN7Yy7Qxs4sWHwlcPw/bXT9Anfd8Nbb6kyzbKKQkA=;
        b=jQnF4GncqRfyKG9KM/ZsEqpCRpSpOoVARrbQegzhMua5jh2ylFG/mPMFv38fIydUKD
         JHNMeev9peIdOrdFSsuBv3cxKNuBSts5FU2p+5STihbbCDSE4qYsvsWmvdBTQTlLbtBa
         nhwYuvHahxuHvyHF/p6Ox35+9irPtCi4vs58/xZZQN7Ngzna06iIBVWH9y6VLEi3Mdjj
         /SePz0CK2vRR50ynUblmxAXxP0dGlcxPxKoxOR0XBTknwMzBkrQyiGrWXq00kAl0G5BG
         zLXjl4+1Sn26unZ8t2m9bPf0bj167zI/e/jLAiuxjMc6BmA0ltbVogIdkxryttihN8j4
         g0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774550300; x=1775155100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oiN7Yy7Qxs4sWHwlcPw/bXT9Anfd8Nbb6kyzbKKQkA=;
        b=PjTrYeW3WRhZOdL5dlG1+NP+JeOQk57QIeB3B1nHzNAFfKiF8z43RoDX6bx9oDLArY
         gjV3jEfOOpZ7sDPzDJTqVFD2FR89kpbxfIyHTBlBgaKNRCWK8cetiPanVzQjUBhV1rgY
         0qEMlKdIN6NmkUNg3q8D3zBx+ZhAd714iTxC1sXQNGNusdD6iVTg3s5KdjqGkT97EaLW
         rnbdPaPBJFXPf+fvEvSlya1Gmo92U35oTbeuhndw5sMX0L38ac7fJnvbbp3lfntx8WOp
         YXYF9hYfZuOTrrEidtKi6go5/HbZFuFmdKpBixOMiZUvKAVCRIFHZjBoi0Uct7cUxrKN
         2olA==
X-Forwarded-Encrypted: i=1; AJvYcCX0OjszfT2rFHXJu3mE0InUSQNtxeEhzCCaOCAZ9V66o6NM/8lidfP8BOmEv8dIQ102KCvXlhWzBM9A@vger.kernel.org
X-Gm-Message-State: AOJu0YzfYCxQnO8Y3s+zLltKl962/+C4eHr4w4cwMQE8z1niQDXODBfd
	6Lts2cfA6FT/K4nKODbhZirmR10CNfC4JYFLZm8VYB3HaldsrwoxTFxM
X-Gm-Gg: ATEYQzwKWz0y5AWlDgc5O2/u4RjR/VM1lWQkrRdSmHNpA1OIlpStY7/MVM+44exnLkQ
	1Ta5MLsuZ0HWo4MoruJoOnE+decZLobgBRXWpRmk27WVuP8GQpAbR5fPU7DNvKh/ioWSIHyTkby
	TVGCy+szva2YUtGyJjubD8s3bCYFZef/EZxaRAZZT+fj2nD+F9gKPit+Dd/w2RN9mx2Td5bJimP
	yyCwpRzAOIz4ge3eNyq9gPcuenLHuB6jT4VqsjPd2OZpLbxE434+6MMcnCiu/0fKpMb0pbYifie
	nm7zY30c9uY/PpjxF5NSdc1sK/s+MaFnWt9ZKD7G9FDLjFIEuQrnrqXJHA0Ozfvgnp4xkEssEwV
	Yo/vi79vtDi6d6aq5Csj7LRiwSKBOAZvRc2yfOcesJHeYkNwcAgtKx15ZGVOuEUWgMQZTfbPn0+
	7kOQru0UO/KrQ4mggf7qJfEpACX/QFiu0V2V+nLNOHk5aV3snx
X-Received: by 2002:a05:6a00:3e1c:b0:82a:6ef8:cb43 with SMTP id d2e1a72fcca58-82c6ded85d7mr8921857b3a.19.1774550299986;
        Thu, 26 Mar 2026 11:38:19 -0700 (PDT)
Received: from padmashree.. ([2401:4900:94ef:3410:58df:a970:79c4:10c7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d390a4csm4211314b3a.31.2026.03.26.11.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:38:19 -0700 (PDT)
From: Padmashree S S <padmashreess2006@gmail.com>
To: k.marinushkin@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Padmashree S S <padmashreess2006@gmail.com>
Subject: [PATCH v2] dt-bindings: sound: Convert pcm3060 to DT schema
Date: Fri, 27 Mar 2026 00:07:47 +0530
Message-ID: <20260326183747.528754-1-padmashreess2006@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
---
 .../devicetree/bindings/sound/pcm3060.txt     | 23 ----------
 .../devicetree/bindings/sound/pcm3060.yaml    | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/pcm3060.txt
 create mode 100644 Documentation/devicetree/bindings/sound/pcm3060.yaml

diff --git a/Documentation/devicetree/bindings/sound/pcm3060.txt b/Documentation/devicetree/bindings/sound/pcm3060.txt
deleted file mode 100644
index 97de66932d44..000000000000
--- a/Documentation/devicetree/bindings/sound/pcm3060.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-PCM3060 audio CODEC
-
-This driver supports both I2C and SPI.
-
-Required properties:
-
-- compatible: "ti,pcm3060"
-
-- reg : the I2C address of the device for I2C, the chip select
-        number for SPI.
-
-Optional properties:
-
-- ti,out-single-ended: "true" if output is single-ended;
-                       "false" or not specified if output is differential.
-
-Examples:
-
-	pcm3060: pcm3060@46 {
-		 compatible = "ti,pcm3060";
-		 reg = <0x46>;
-		 ti,out-single-ended = "true";
-	};
diff --git a/Documentation/devicetree/bindings/sound/pcm3060.yaml b/Documentation/devicetree/bindings/sound/pcm3060.yaml
new file mode 100644
index 000000000000..ceb6f044b196
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/pcm3060.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/pcm3060.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PCM3060 audio CODEC
+
+maintainers:
+  - Kirill Marinushkin <k.marinushkin@gmail.com>
+
+properties:
+  compatible:
+    const: ti,pcm3060
+
+  reg:
+    maxItems: 1
+    description: |
+      The I2C address of the device
+      or SPI chip select number.
+
+  ti,out-single-ended:
+    type: boolean
+    description: |
+      If present, the output is single-ended.
+      If absent, the output is differential.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pcm3060: audio-codec@46 {
+        compatible = "ti,pcm3060";
+        reg = <0x46>;
+        ti,out-single-ended;
+      };
+    };
-- 
2.43.0

