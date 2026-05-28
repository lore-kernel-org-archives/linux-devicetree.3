Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF26A3F888F
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 16:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779987561; cv=none; b=XQ/FFn88gk49whGAoNxML2Dbnn2jdNJgmS5cE1xizRQUT8KAbCDtu1q2DaMRZUHt31/f0l7IJ+gdKuFKGrXSVcKKelCAQ69PIHaTMgbNc8UYCIQPpXl6WjNC1Mm2MijZmr5M0TQ61yCI3IW9zoKnMmSBbl0nDf44PdGepC9XstQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779987561; c=relaxed/simple;
	bh=OGXBY7xpezEVESwMI1ySiOpih04SkGEMZExP1M2bc5A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=nf86J6xdOX3JSGHJEQ/cdhUjST/L0qe1TF1ROu/1D/1YrbNtWgS1kLCiW7g0XiwXaRy9m/269fHFHQJGfdCIdAyb5JiSlozwpE5qopfqC3Q0V7ccj+foG0ntmO70bc+vzI2SS52ZT0ib6xS1k5FpMHyBEH86REc2N6Dfxr3XA+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYWgyJlg; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYWgyJlg"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44e5624c053so7824840f8f.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 09:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779987558; x=1780592358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eI4oq4r1LL0n7skBjehd33EqKY90AIhvGLTBqauLyw4=;
        b=fYWgyJlgc6VzAjktWvu3g5ZwtgtP8NxFgmEzT+acrSNWXakyyGETLVmasgqQfEdtva
         0UllkkmP1ZxdkB4ftxB/N4JLqH0RkbhTwF+98m2A/SMc/raqPg+GkmWWaANxAhfiYzDV
         AAtvnzgaMi/bhYLJs1pWk74P7jFs2gmsxqicNT6h0ugV23q9ibZqo3rpwRVmekvo1Bv/
         3vYvp9bHNg2GO1wmxXfw/3wx1vpSqImD0uXSBHy6UaaRXlGMjE7vxKSwU5U87qSs/zHa
         RgZmgNy8aeAPVjpl5nsz9KthK0i0ARg8yNsVce4GdKQbBI5ZzvhoSfNUtQ1ULXU5Y11Z
         QuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779987558; x=1780592358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eI4oq4r1LL0n7skBjehd33EqKY90AIhvGLTBqauLyw4=;
        b=XfwmD8CcJaXxWRRDa0/BgW4w7rsV8E3hfyB/u/HhRMOC82yxIhNzBCaZ7IiFfGtlOJ
         KJRUg4xC7tUEhVeuJ1dkd4ucVhO4mQR2ffv9g56F92CT2azvH9ZylzlKE7BsP07Z51B6
         FSzemTJb+pcEEJJgKbzilU4nSdl+NayhR/I+OpMauBStfDfDif5tZouQsHxOLiNPRiF4
         wGB4VBY/FvPpBbh/7lFHV/QV6AeeRRLriEwees7dNRhA4gEEy5328r8ke4M86hosA3LE
         DfHfqcNMu+xCG1OM+A2QCDj+WCRCZ8Pug2vkJcRDGz6XIIPgeEahUmcXv682JfbdpbdS
         IS9A==
X-Forwarded-Encrypted: i=1; AFNElJ/Wpv0jNtLBLBrdftX69UO1qEZOvixhu3oCpVlub1vx/7BSBPLtqZFiHb+Q3NrfQHmu1W/czX6APlFS@vger.kernel.org
X-Gm-Message-State: AOJu0YzlMskgrwOrURND7todoisd5pd/Hi43uvffyn2FTXa/rBs4wXLr
	2SdBjEPShjYfmOuAMguuShtmyh3qjWOMbcec0VYtKF1nmBZxmCLUcbVq64vv3RZ4BvY=
X-Gm-Gg: Acq92OHeagVl4LoasHvF4LhdwKyTjFGEazfGsahlCiTIjFu3VuEHQzMIC4IT7iTN2tc
	SCIMgP84xFqS7EFfiJTKu9tJJ/H3RHFj5zypXAOjjqgjzW08lP++qe5uYJqJj6+Z6QgRI/gaB6/
	SQF/9EEuV5Hsy+QGeSIHhmn3DZdLmqq5U6JlL0MsiaKTV1dYSjuzkwnKU/cw9eMmpvrrJXmCdfC
	XSZ6HltzKs4SLWuQh8dDwOOM7+Y8YIQRwJI3cSxTEaC9EDvmwpRsoCL9Adv4cf2UAc04Hd86iga
	YGUBC2xDXneg6u3gd7lBAtgx9y+nQfsSpRaXTyxocRPrRkNqenINvbIBgmgvWexaPY9Poodzw72
	r/rYsGtdQVKVQDogCbssgn7+3QREgr4b0VRPUvb5A0VuyV8u2CLiUwqZQ9oQe7jpE/Uutd8aCic
	QYotoohMPzbYluksoGiNEMlGh4wVk9GRaTMrALZsYJw1BIwbc9RhgHh0qxJC/tdLvRQPKErK1t4
	Hke2Q==
X-Received: by 2002:a05:6000:41ee:b0:43f:e94a:e773 with SMTP id ffacd0b85a97d-45eb36b0818mr43687200f8f.27.1779987557767;
        Thu, 28 May 2026 09:59:17 -0700 (PDT)
Received: from fedora.tail6d6c39.ts.net ([5.12.16.74])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45eed496112sm2808676f8f.15.2026.05.28.09.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 09:59:17 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	egbostina@gmail.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: omap: Convert Counter-32K to DT schema
Date: Thu, 28 May 2026 19:58:50 +0300
Message-ID: <20260528165853.15510-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments OMAP Counter-32K bindings to DT schema.

During the conversion, two updates were made to reflect actual hardware
usage and resolve dtbs_check warnings:
- 'ti,hwmods' has been made optional. While a search confirms it is no
  longer used, it is kept to maintain backwards compatibility.
- Added the 'ti,am4372-counter32k' compatible string, as an AM437x
  device tree uses this instead of the generic 'ti,omap-counter32k'.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/arm/omap/counter.txt  | 15 -------
 .../bindings/arm/omap/ti,omap-counter32k.yaml | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/omap/counter.txt
 create mode 100644 Documentation/devicetree/bindings/arm/omap/ti,omap-counter32k.yaml

diff --git a/Documentation/devicetree/bindings/arm/omap/counter.txt b/Documentation/devicetree/bindings/arm/omap/counter.txt
deleted file mode 100644
index 5bd8aa091..000000000
--- a/Documentation/devicetree/bindings/arm/omap/counter.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-OMAP Counter-32K bindings
-
-Required properties:
-- compatible:	Must be "ti,omap-counter32k" for OMAP controllers
-- reg:		Contains timer register address range (base address and length)
-- ti,hwmods:	Name of the hwmod associated to the counter, which is typically
-		"counter_32k"
-
-Example:
-
-counter32k: counter@4a304000 {
-	compatible = "ti,omap-counter32k";
-	reg = <0x4a304000 0x20>;
-	ti,hwmods = "counter_32k";
-};
diff --git a/Documentation/devicetree/bindings/arm/omap/ti,omap-counter32k.yaml b/Documentation/devicetree/bindings/arm/omap/ti,omap-counter32k.yaml
new file mode 100644
index 000000000..aadb5ea1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/omap/ti,omap-counter32k.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/omap/ti,omap-counter32k.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments OMAP Counter-32K
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: ti,omap-counter32k
+      - items:
+          - const: ti,am4372-counter32k
+          - const: ti,omap-counter32k
+
+  reg:
+    maxItems: 1
+
+  ti,hwmods:
+    description: Name of the hwmod associated to the counter
+    $ref: /schemas/types.yaml#/definitions/string-array
+    items:
+      - const: counter_32k
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    counter32k: counter@4a304000 {
+        compatible = "ti,omap-counter32k";
+        reg = <0x4a304000 0x20>;
+        ti,hwmods = "counter_32k";
+    };
-- 
2.54.0

