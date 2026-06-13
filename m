Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A268E395AE8
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 19:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781378644; cv=none; b=lUGsMg6RxTlG4FKDnIR12TI6/cIdCzMM/wZzJKwzAov0ueWCsQWI+yMEgbIMps0G4nUO5SHyDJ73gr3yjvyL+IYr06ijP4vO/Alh77VwkQrGDMe6IiHsjCaP3sRKqsHATKsrqsFLg9d1hMcTuE/2KQMC/9R9ZHoW+jPA1hxT7IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781378644; c=relaxed/simple;
	bh=7rwSq0SrGdEQBmnV4uKLdu242Sdx64fS4O/VIHJ/K30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TJZFhmJp1I/QM82jTdJoTSE0niCUjIOogmKoiC5vfyXM0fPnGbV9q148IK0IIpQdDs/zeiV+Vpp5Tm2x8aLfge8KgsWcNeFZQ5lzQVuARwJrnLGwJtkwJ6orNnvJW9nRib/koYN2yvFrfNhoEq4EF8i/oCgUY3oBrzJc/hByEQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kz5zFqut; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kz5zFqut"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-842288702fbso978150b3a.1
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 12:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781378641; x=1781983441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w8022n++FT6lM5F9jV25aEA6KvKK+0yJkAo/E3Gfkzw=;
        b=Kz5zFqutp4Ec9Dxcb0vx1iqJFZ38Z0fRtTQBxTf+tfgrq6V9h7hVnmJ9aLcGnPOomL
         KxdJMythu+MATQbFX3Aa0sfqWresLlEdjl/Zcmj4RZEo8jWdvyjHBQ6zfJZ7lPl6mmvt
         8ZkQ0CrL2Ad2kPLZj6tqAT6rNL+IlpXy3m3nuK9unxV4rmRbWnUdv/+NZSLWx86cFYCp
         9PIyab8TjPaMoYIOTS85IA60O/z8ZO0QHElihMCPfduYKnI+B7NmEGbPOI2pOqocGEDd
         OKhFG9al1eXVNRWToOW5rBlggMUTQky2OnXaDY+TeuCjEMeBJHTT8I1W0Tds2+LbmKj2
         SOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781378641; x=1781983441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8022n++FT6lM5F9jV25aEA6KvKK+0yJkAo/E3Gfkzw=;
        b=E9BeeYHOn505hvWED4DRbBBjiBEQVtOeEpSsiT+Bt5LuGZA05PnyyXf3Gk1J0B9GSH
         XELVj0eooflvJlbZgJpbEhFgenIf11F1UdPb50gqV6RkAT7NydfceplCS+pg/occ+l6L
         Seiv59wizLMRnUApq5KRzjQTsc2Bg9XvVzxFljToS0MkZiRdT1mrOTFuGB5cNB5oWk5f
         zu+Vnw65/7s2q2Rw7UmUwj50r5EFo261lbJ94ow22xkvNz2q4UvoSK+LNAYV7SqvYGUv
         QPNeA9PkVVTUP7vqNToJlr2X3H7CUupEqZQ9Z9hXD+86EU7rW3LTwJZtzAPYbvBX4pzs
         aCyg==
X-Forwarded-Encrypted: i=1; AFNElJ9imTkJ+cg8VNBOVFhjQQGs5qJTGzXC5ONFDEc1TdjtgX7XiUmT8BiL1eE1FZEOAgYT/HsJR3+LjszH@vger.kernel.org
X-Gm-Message-State: AOJu0YyC3t40LGZIvowGObPGvJBLZpR/oNkSVxmKyle5qaw3xbuzYd0n
	vXqZ/9vbAQ+62ZQSo2bDLastbrxcyD+dUKo8Ezqfn37oweAmEMIfx5I6Cm0g5N4xa0c=
X-Gm-Gg: Acq92OE8DES+D0ezmbc5o74Rz66Ly28XLrdwfrm7i1DL1RnvZuv8Z5UyQJZK0Q0a/uN
	tFgA1GkcbX6jhPJY5InIFlCcv48CS9EivC367/LnVSV+JPKiGyXoOAWU6nQu5cDbrDxuLpo7rmS
	yMs8gNmBIbOt55Z0HD8wxm74mahWPeJTpqg/fTsolVpt0ASnpc2Kcb0yXgHyx5nS/VwdnsGuAOu
	5UnZ9GkraRzvpLQBGpqghJvbkeUkU6PErupzflr8XeVMgnY8mP4CRSB7n48+KXSWyTp7hH/VV24
	EVh7hAsHgg/xXP5UCAPMF/RylHmcgQJTJ4FAi/toylkXmt3UbZc8/ZpT12G9IdrK7UyTV9RWdl7
	r4uC39MU+Y0Ko4cgeNSAZz7Z8kvR8ZtaovpDNX8ax1hOZlS9xnAPwz8k0HypkxhQIqPQJQm0CNG
	3lsXc+rBT9DKMkGgwEIU7oIYz/fb+dv8/gWMeBGDDkDnUyRlHU5nAv79oRv/7QqMO1aff3vH5L8
	L+zW6vL
X-Received: by 2002:a05:6a00:2451:b0:842:7f81:8079 with SMTP id d2e1a72fcca58-8434ceb199dmr8246337b3a.37.1781378640746;
        Sat, 13 Jun 2026 12:24:00 -0700 (PDT)
Received: from fedora ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acd96d8sm6725155b3a.19.2026.06.13.12.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 12:24:00 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	david.daney@cavium.com
Cc: linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH v2] spi: dt-bindings: octeon: Convert to DT schema
Date: Sun, 14 Jun 2026 00:52:33 +0530
Message-ID: <20260613192233.2229933-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert octeon-3010 to DT schema

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
Changes in v2:
- Change the maintainer from Mark Brown to David Daney.
- Use soc node wrapper instead of root node in the example to handle
address-cells and size-cells requirements.
- Remove interrupt controller provider from the example.

 .../bindings/spi/cavium,octeon-3010-spi.yaml  | 61 +++++++++++++++++++
 .../devicetree/bindings/spi/spi-octeon.txt    | 33 ----------
 2 files changed, 61 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-octeon.txt

diff --git a/Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml b/Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml
new file mode 100644
index 000000000000..e35e661d0a58
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/cavium,octeon-3010-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cavium, Inc. OCTEON SoC SPI master controller
+
+description:
+  The Cavium OCTEON SPI controller is an SPI master controller found in
+  OCTEON SoCs.
+
+maintainers:
+  - David Daney <david.daney@cavium.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: cavium,octeon-3010-spi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        spi@1070000001000 {
+            compatible = "cavium,octeon-3010-spi";
+            reg = <0x10700 0x00001000 0x0 0x100>;
+            interrupts = <0 58>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eeprom@0 {
+                compatible = "st,m95256", "atmel,at25";
+                reg = <0>;
+                spi-max-frequency = <5000000>;
+                spi-cpha;
+                spi-cpol;
+                pagesize = <64>;
+                size = <32768>;
+                address-width = <16>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/spi/spi-octeon.txt b/Documentation/devicetree/bindings/spi/spi-octeon.txt
deleted file mode 100644
index 431add192342..000000000000
--- a/Documentation/devicetree/bindings/spi/spi-octeon.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Cavium, Inc. OCTEON SOC SPI master controller.
-
-Required properties:
-- compatible : "cavium,octeon-3010-spi"
-- reg : The register base for the controller.
-- interrupts : One interrupt, used by the controller.
-- #address-cells : <1>, as required by generic SPI binding.
-- #size-cells : <0>, also as required by generic SPI binding.
-
-Child nodes as per the generic SPI binding.
-
-Example:
-
-	spi@1070000001000 {
-		compatible = "cavium,octeon-3010-spi";
-		reg = <0x10700 0x00001000 0x0 0x100>;
-		interrupts = <0 58>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		eeprom@0 {
-			compatible = "st,m95256", "atmel,at25";
-			reg = <0>;
-			spi-max-frequency = <5000000>;
-			spi-cpha;
-			spi-cpol;
-
-			pagesize = <64>;
-			size = <32768>;
-			address-width = <16>;
-		};
-	};
-
-- 
2.54.0

