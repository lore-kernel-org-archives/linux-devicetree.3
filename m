Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FF4414DC0
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328388; cv=none; b=EvZ8HBoWdVSvcq4IQiGcKivK4wZRwCOCFaCit8OFu+T4FbIM3zLU5alLGRt3whMoPJoW5n+94jo4Gv5UeRWlZnh7UQUC80OfXK0od1aRPxUXoZ2HmNYaJAosLBcg/yRNpD46u3jA4o5FwRC5cAuotHn4CSJPfrPD0Ih7a6mfhuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328388; c=relaxed/simple;
	bh=lN4zj4MvJL5vRMUQDfnKsygDhznFdbRWqhABjnvF3Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FRFYNG67GxMbnkUE16YP7Aj3PrIBK7T12wSEHWFNFptjaT8OAfVxIUC8B434VaYub6F4aP+SwtpIC4exKOc9XWSo/PmZylFGjJ7YOyZaZWTANEKrVdGkTpY9+n7HgFBajbXNezc9r8VXqAOkEEygTVkI+C5INDDJTftq59Miovk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETgfHzT2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETgfHzT2"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso679391f8f.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783328377; x=1783933177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=woPbO4ESQWmCn63yRn0+bfEqf8QWClAoKN7AeheENlM=;
        b=ETgfHzT2gCv6rhrH8uw25QEPExH64wPY1bkeBK8hlN9hvBlbcjjfBqlKGOimsn0MkH
         NkAE3DofOzVpqOgAQdPV6IvG2OWWiYxVY4BhlRNPtato+zcUz83vqSobmclNxJye6sKW
         qW+0/wvMxX6BxKiHk8xW8nPsTHUN9TTHvM9/ejP1713EzBrq8pR2RP5MLa7KLXnyeVVp
         zA117vzoY3ik+g3EM9T7P+SF62NjbUbn1r/ky6616hSv/0D+SRCPURkZyP5Wb5USPncj
         M3PHAs7y+qwhfFkJ1UuVcWsTzp4ZYyPS+0aI9dr4LhIl4PWEfFV9FFDk/ZDrrcfekx6A
         dt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328377; x=1783933177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=woPbO4ESQWmCn63yRn0+bfEqf8QWClAoKN7AeheENlM=;
        b=T6cot4X8YC4xEH0b4iKPGXe1/PaPrM9qH+JdykjJOqPxq16CTrQGLyfsD3Xdl9LwI0
         wVwyi/ciKKograF3IwGvghJz/fdXxmvpdXZa2BODkcso+AARgAi8xjdfc/GuHStxBBX1
         D76lbJg5b28QZ73VRIAI4JmIlijT3NTPU0SOtXnHCj9MPCFFpQzJZMHSGI+2T9r6kVNB
         Eh0A5s5dTUX6eYLPda3PJH8XwxOGrKpvVCPeAU4WT9kBe2Lk7kYtMOf2TOWAIc1qNbVt
         ZPNGJDqrQaQU4n5wBob9Mrwge7igI3GsqXo2M+9JTE7EivbW/QD7SC0bkSAhAwt1DGHj
         GI4w==
X-Forwarded-Encrypted: i=1; AHgh+RoJSwxo13S68GBUABg3UeqaAepNgMtSY2j0dxxrbW+F5f92IiKCtaqLW3fGW1zze85EQXvAhTxcAmgn@vger.kernel.org
X-Gm-Message-State: AOJu0YzrOvdDsTyhgJyWwgKzMd6099WjmQW2iS4NRZwQTc8S8BIBStGL
	z3b8wagNdTvN21S8RVTCsZEX9Yu0qTkPk/Vs1IuBJCw9Z4BIqSE2FWUQ
X-Gm-Gg: AfdE7cmpxKXkmQVT0sIfMbU6/5VCAke1hBRPPq7oOmF0FV/kd8ca5lAsmVUOrKMBgFX
	TVwcfwNRBOtMU7X7CZMUuYichwU7u5FoZ5rrBYG684urKMJTTDalLHu8a/WMbEElebW7HbkRBJf
	ICb6CHVV+uHl/JbL/wmnBVoO44cEjzEEIsvceZVM8//Z3Rduo5dBdNHfr7halgahgkITOVjNXAn
	d0aP/2bj21K+vR3W6Dz+C+9EE6cxwt+WYui292joObQ1Kb8xyqb+yJnwZTrACURXcJ/Oe0GBgPI
	ID23nSmCy1sbfLZgOpTPBfaBHTJudVW3Z0/b7WZxqh5cL10CRQ8UveOSQ0wqxR+W2o9JlFf9a54
	U4g0tWyVVtq/I7etGhtVh42ZrF8K17oUiFMYbzjcdepfSpBJvGoyc9pfe11QpSPM1m8U/CKrMM/
	UemY1up/H9wiDmmvl1G3fkSsbolcdDdkUWvYcRKJmC6QYDT5r+6nREd+k=
X-Received: by 2002:a05:6000:4283:b0:475:94e1:29d2 with SMTP id ffacd0b85a97d-47aa92c0791mr10520695f8f.2.1783328376008;
        Mon, 06 Jul 2026 01:59:36 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.173])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm22314373f8f.23.2026.07.06.01.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:59:35 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH v2 1/5] dt-bindings: soc: ti: Convert DSP to DT schema
Date: Mon,  6 Jul 2026 08:59:13 +0000
Message-ID: <20260706085917.835875-2-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706085917.835875-1-egbostina@gmail.com>
References: <20260706085917.835875-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments DSP bindings to DT schema.

During the conversion, the following updates were made:
- Moved the binding to bindings/soc/ti/

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/arm/omap/dsp.txt      | 14 --------
 .../bindings/soc/ti/ti,omap3-c64.yaml         | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/omap/dsp.txt
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,omap3-c64.yaml

diff --git a/Documentation/devicetree/bindings/arm/omap/dsp.txt b/Documentation/devicetree/bindings/arm/omap/dsp.txt
deleted file mode 100644
index d3830a32ce08..000000000000
--- a/Documentation/devicetree/bindings/arm/omap/dsp.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-* TI - DSP (Digital Signal Processor)
-
-TI DSP included in OMAP SoC
-
-Required properties:
-- compatible : Should be "ti,omap3-c64" for OMAP3 & 4
-- ti,hwmods: "dsp"
-
-Examples:
-
-dsp {
-    compatible = "ti,omap3-c64";
-    ti,hwmods = "dsp";
-};
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,omap3-c64.yaml b/Documentation/devicetree/bindings/soc/ti/ti,omap3-c64.yaml
new file mode 100644
index 000000000000..a97e163c890a
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/ti/ti,omap3-c64.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/ti/ti,omap3-c64.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DSP (Digital Signal Processor)
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    const: ti,omap3-c64
+
+  ti,hwmods:
+    description: Name of the hwmod associated to the dsp
+    $ref: /schemas/types.yaml#/definitions/string
+    const: dsp
+
+required:
+  - compatible
+  - ti,hwmods
+
+additionalProperties: false
+
+examples:
+  - |
+    dsp {
+        compatible = "ti,omap3-c64";
+        ti,hwmods = "dsp";
+    };
-- 
2.43.0

