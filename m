Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C282844B66E
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509568; cv=none; b=I7O4X3SW7cc4cR7krYFO+4hzG7z/Eiase5+jFa+DgpEDPSxnbToRHmCRDX8WpHg+qrck2F2ELkx1+wd6SlMnp38QkCizEOOP2msQdkBYKeh4zaX8nDXlUO0xnvM7HOsE96BYu5v2tN+cbD4LUTSM48v2paBJBnmgT8ey0YR0rq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509568; c=relaxed/simple;
	bh=yzaFygt/2NEj7Ly69wi7REHsQFHVNeFmp6Wl03K8sQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h4EdVQoAzJcV/MHqFyHkoWxtHqIsudM/UjxtGpC21xwEBAuU5txilag0X50BhPuQRUBWGrE3I7hDuHVHUL1JB5ugOjWgIaQ1SQyGOnsazeMHd3c6P4krDjlGSO6VieS7bQT0YNrWo1hq73UN+iQQYbyFWQIUJjrMrERWNqd28yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sxNi8paR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxNi8paR"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so3029725e9.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 04:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783509565; x=1784114365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J8rxZ5JLNsvxWU7Nl2DOn7Mo6kHsP6CRfDLEAgRx/A8=;
        b=sxNi8paRt+LAHhK0s6L8t1YbVkb2u2cJbXDIFLoxY1p3wgvhANSalCR2GNZDhLdnO1
         nRFgLVmeMVNB4UmrtoVgV6fsljzc77MPUXCHpE3/zh5j5O0K+2ZkDyg0MKE+zsCBlALL
         1A+gOmQtKcesGyojxuu75fuT7lWNlnPBZkgdnFITAvp05fI3qT5Ibgg7FBP26w0LnKal
         69qovtblywYXigLLx6HCLP6Y1BdZhyz5HraZqMCUuh3mzQNQSXMNtHy/77siQmA/slS2
         Y17jBEmMai76p3e+zdJRJ9tQgy25GXdxSmdf7aE/hmWt7DAV2gNZalEyODDdheLf4goX
         kwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509565; x=1784114365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J8rxZ5JLNsvxWU7Nl2DOn7Mo6kHsP6CRfDLEAgRx/A8=;
        b=BLoSIpdKmaS7ufKBBjmMMBlPFTj17bir+qLzPax5qW7DQculOj9K5zKm0u/421z/Wr
         JlMzqLJfH/AxeeOsbcdnO8R2y+7zrfXrzhw/7W+6YN6Mliv6zKuRY04HNxYr7voGvm4V
         IhBKGf77CUsXy7vTtvqDbQPDhNME0tOuYEcUOV4Q0zuzoLRTTSOFoNP5tYIQP5zNBecK
         M336bgtAaxE41dJ/baG1X5ktxDQEloumAMk1E+pdqkEkUCyNTce7H9t3RPdJILEhO+nW
         /ukv1K/PQkX6FGSrR1HwZgrgNrLc7gH2+XdDtbuxnIMkd1tLjhyWvgROJIdMz8gz5LIn
         03/Q==
X-Forwarded-Encrypted: i=1; AHgh+RplfC+XXiqCjcJQSFIPkzXTJfaNQziTMys6Y1r7ugOjpPV1MbfpSxtPgRd4oT0gEQngu5V7viFqczlu@vger.kernel.org
X-Gm-Message-State: AOJu0YxA2opnmg2ozFwthwcKtJuVjSvpm9MFvnzH7D2K3EnLw0p+ZPGk
	ZlmcZNqty/QN84rYsYl4fw2QVIv/sorUWr/FPyttdMp8zGlDXb/4II//
X-Gm-Gg: AfdE7cmxJpwZRmSGJPr/TuARZh8Pwi4TLqQU5IJd/pYXdvuuASZihkNBzZy6IRaFlTQ
	xOCLCe5dKiYBTbOAPk31RUY2ytMGfMNnqNnxOWjulMsD9FreNyEyd64lh4ui61pPEjSTCqU+0IF
	bL3mlw20X5C7BNKzT258gPSSgOObArs4HPWX5t26J6bAD5eOvsByLcTopIII65toIzF62E8hvTk
	AY7HkIxT9wnLzZAw/uUjoqU/7YX0dU1Rhrv20V3VXcdGadW8BC83JRukrbL5ApxL8WGg1K4K16V
	yo399WWmbYeLXS198Bk8WtdlSoU3Ffr74YV2uml11/5noL4yfZJcY1z8KF0OdWW3LP1rI9TlMAp
	sZOx2bEuC8HXb7mf1p3w2Oxdg0eV484qkQ5yXLYskqwVNzwoS7XN2/9hCOHA6BP524pkDtUPm6A
	rq2s8JrPhxdJuwVq992T85f5+6eeZxCPPY2uBNgJk0fMSwKbsGI7tDmN0=
X-Received: by 2002:a05:600c:3e87:b0:492:7019:caca with SMTP id 5b1f17b1804b1-493e68cbea4mr22081725e9.26.1783509564987;
        Wed, 08 Jul 2026 04:19:24 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.173])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47a9e4d6e4csm39216602f8f.10.2026.07.08.04.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:19:24 -0700 (PDT)
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
Subject: [PATCH v3 2/2] dt-bindings: soc: ti: Convert IVA to DT schema
Date: Wed,  8 Jul 2026 11:19:14 +0000
Message-ID: <20260708111914.1706800-3-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708111914.1706800-1-egbostina@gmail.com>
References: <20260708111914.1706800-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments IVA bindings to DT schema.

During the conversion, the following updates were made:
- Moved the binding to bindings/soc/ti/
- Removed 'ti,iva' from the example as it is undocumented and
  unused.
- Make the 'ti,hwmods' property conditionally required. Modern ti-sysc
  deployments do not require it for probing, but older
  OMAP2/3 platforms relying on omap_device.c still need it.
- Documented the 'dsp' child node, which is actively used in the OMAP3
  device tree (omap3.dtsi) but was missing from the old txt binding.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/arm/omap/iva.txt      | 19 ------
 .../devicetree/bindings/soc/ti/ti,iva.yaml    | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/omap/iva.txt
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,iva.yaml

diff --git a/Documentation/devicetree/bindings/arm/omap/iva.txt b/Documentation/devicetree/bindings/arm/omap/iva.txt
deleted file mode 100644
index 6d6295171358..000000000000
--- a/Documentation/devicetree/bindings/arm/omap/iva.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-* TI - IVA (Imaging and Video Accelerator) subsystem
-
-The IVA contain various audio, video or imaging HW accelerator
-depending of the version.
-
-Required properties:
-- compatible : Should be:
-  - "ti,ivahd" for OMAP4
-  - "ti,iva2.2" for OMAP3
-  - "ti,iva2.1" for OMAP2430
-  - "ti,iva1" for OMAP2420
-- ti,hwmods: "iva"
-
-Examples:
-
-iva {
-    compatible = "ti,ivahd", "ti,iva";
-    ti,hwmods = "iva";
-};
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,iva.yaml b/Documentation/devicetree/bindings/soc/ti/ti,iva.yaml
new file mode 100644
index 000000000000..ac87d0bac87d
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/ti/ti,iva.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/ti/ti,iva.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments IVA (Imaging and Video Accelerator)
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,iva1
+      - ti,iva2.1
+      - ti,iva2.2
+      - ti,ivahd
+
+  ti,hwmods:
+    description: Name of the hwmod associated to the iva
+    $ref: /schemas/types.yaml#/definitions/string
+    const: iva
+
+  dsp:
+    type: object
+    $ref: /schemas/soc/ti/ti,omap3-c64.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,iva1
+              - ti,iva2.1
+              - ti,iva2.2
+    then:
+      required:
+        - ti,hwmods
+
+additionalProperties: false
+
+examples:
+  - |
+    iva {
+        compatible = "ti,iva2.2";
+        ti,hwmods = "iva";
+        dsp {
+            compatible = "ti,omap3-c64";
+        };
+    };
+  - |
+    iva {
+        compatible = "ti,ivahd";
+        ti,hwmods = "iva";
+    };
-- 
2.43.0

