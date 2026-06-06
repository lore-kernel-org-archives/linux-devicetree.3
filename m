Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806BB330B32
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 12:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749470; cv=none; b=qUWF7SqRwpvpF9nD103nYmklPWlsCpLpLc4bakBw+dcdi/jDc4f4ZYeVyWz1HkzikIIkg6dJpLWzE9+o0OmCW/hb9ZxnUgcjxkH9MPLcBouQEbIElTk6Ae12Cg8MmWXfHu6D45RtMZe1wWLiddGoigCHOFOVrqwFh6vE2rHBz7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749470; c=relaxed/simple;
	bh=PT0c4SCmORgHScC5hmT20+3aj9a1cYXU4M7xDXv7DeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a7lvlhBEjt4XBA7fhkS8Rz5kQaDafvB4xWSRHU+7yQ2Y7mkQjsqDbqgLvwYNGhK99ydBvdwcUy562zOAZHdr3LZ/pkV0fodnsxcuvE6hbXh/pY0iOpsqQSjsuurPqcLjrdQHr7+emY9wcNI5ATfYywAWzEDRDzhcUt9bpd7XMrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q0t52POX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q0t52POX"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4600cbb06deso1498647f8f.1
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 05:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780749468; x=1781354268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IneYlVpAlfHXbZN64g1VwIxrbD7BCWERDo3ypttJ9w0=;
        b=q0t52POXGko3+aOo/kTZtAu9WuQfQkUhZABBWLGoueilkSHj6hFZ6/3U7RXgxRUp3Q
         M+aasxfCdlyRwGxMdFdk0+fb+lw8VB5jRsdhkI2vSnUF1L+Y6UkSuxYH9Oi2BBJMSGGg
         txZkZ2kkFdsf24HruPbMu5Qvr4YMMBAiyfjuI4Kx5BKDWh+4ax2roJAIRFKnfv9VXrTO
         1th/rZ4+/rtWNrWN264q08B8h8nKZxeFE4yhkBvCpRV+q8gUr+0EDIf83L8md6ub7bgX
         VzCwn9kzYZ44dnHhK0dC3mmmKl2VrstjiFqrl1vwJRR7Sq+X39/R6KQUOlfdFG5U3bwv
         qwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780749468; x=1781354268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IneYlVpAlfHXbZN64g1VwIxrbD7BCWERDo3ypttJ9w0=;
        b=BDW5N2Iqlw4k27mN/3SPDmjyKX6hU7aCTBd7j2eUy4yChrYCS9ebI3JarF7o+loR9e
         bbtBWcBAKMpnMUWIPqiN6/55Gj0aXsJYW5/C7Uwd0mwpx/bi/IAmP8THtWpzWS24wdB8
         CeW1my4vSQeSjPZiCQ3Px4PCgXp8kkhUne/uL+BlnnS7pTmhKFXWRTXuQCfp7yNW5Sx+
         gtiJD4pRS2+mIu8b/BR84a9VlfajRmx0M/A3xr+Q++BuuiKRI+PErzCDhsMu/gTPJraY
         FtiqfexjoyxyMkUyKWkATdMttJx9H3E6U4fNZDiXKFX5yhdUJrm6IGp4V2Gsy/1V680Q
         jsuA==
X-Forwarded-Encrypted: i=1; AFNElJ/ZEvVDeUAzROi2FxpQFtgPy98Dbze+M52mK00Uz/zdN6yvzmBTk5zpwxlR4DHyT/pWmKEXevjXpvoL@vger.kernel.org
X-Gm-Message-State: AOJu0YwLpNUvpwrJkvQmUg9Po8aeY+Rk3nUuWqDw7lrp7IVbQROgAb1p
	wnfYaMbam22ln1XJovdXxLsZIGbhIlCPqGbI3Sz9lnqr6h/eVlMjdQ/s
X-Gm-Gg: Acq92OGrxcc/WD7f9HvhB8PuKd+SkzBXRFQQ6KHuEItYliOZP77qVQ/Mv9yrOGJ2Htb
	rkD+DdR7qb/aIo+Wt0eGb2YSUae88qeW06iK/ZbKhqeYHwgvXPHoxFmgfEab9TpRA4LrXkXJACC
	hVjnNyIzbWaNch1nYGi3RCFWGnZRzV3XWXYYjt7k4Wo9heYZNEw32SpmAnSeUGCwAYo0qXGCTem
	+o+BGlQxAxKV2vY4+fY7EoueluVQX43Cu2sbx4x+gOituoEneeNpmsgXsB0t1Gvj0qq51utKhXO
	T3G15rgqUeevBl6zRjIw5aWyTkgQgOx/oB6g9fyHAo06zDRIWm/vzU56jGqHAGO8///1MlNp+iq
	2mdNTfq3fs5+Xp6BkugjvQwQvk6d0JrXsHCLQT768SxNMPTbCJiCCAGljPvD4+KnOoSyu9FxOrl
	gb5pPN1asOzkXNqLmhsNkOzIhoBSVfBILtrUCUKfVPcpzTKyogz5z9tyrKaZUrPS1Flq2XVsUc1
	+Eh1cni
X-Received: by 2002:a05:6000:46d6:b0:460:d1e:a59a with SMTP id ffacd0b85a97d-46032b75275mr5732880f8f.8.1780749467686;
        Sat, 06 Jun 2026 05:37:47 -0700 (PDT)
Received: from fedora.tail6d6c39.ts.net ([82.77.79.100])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm36869496f8f.23.2026.06.06.05.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:37:47 -0700 (PDT)
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
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2] dt-bindings: arm: omap: Convert Counter-32K to DT schema
Date: Sat,  6 Jun 2026 15:36:19 +0300
Message-ID: <20260606123624.14298-1-egbostina@gmail.com>
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
- Added the 'ti,am4372-counter32k' compatible string. This is used
  alongside the generic 'ti,omap-counter32k' fallback in AM437x device
  trees and is retained for backward compatibility with other software
  stacks that may rely on it.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Changes in v2:
- Removed the unused 'counter32k:' label from the example.
- Clarified in the commit message that 'ti,am4372-counter32k' is used
  alongside the generic fallback.

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
index 000000000..ef2730c34
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
+    counter@4a304000 {
+        compatible = "ti,omap-counter32k";
+        reg = <0x4a304000 0x20>;
+        ti,hwmods = "counter_32k";
+    };
-- 
2.54.0

