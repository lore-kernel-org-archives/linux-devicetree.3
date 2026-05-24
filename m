Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19D2281532
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 17:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779643785; cv=none; b=TM0i/7GcLTVIOSFebP5iE2ddXCeSgWSylic97OdqB4PRsng26VDwn9YuojqR0f51iOTSFkXGibWOyGvdy8HZZ4t8+jMeHBbUXDwPajoztUCn8/I6hQNt4gTpzoNylT87TiKiQV9pjNwUsrmrUiUWZQHhpFzJWlnwYI+cwb4QbBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779643785; c=relaxed/simple;
	bh=87PGVkXhNjU52IO0707bILzBYaRMWxVcP1RPeFqFsww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FImppaaR0EEcAqXtg9ASVfB9K1KiL32E+v0pOQ+MQ58Qa9gP+Sr3N4Xop2U6rd/0Fb7XfHYKf+ZUzguzbGlqEjF/zr4z2bhwICBx+Q9U3yrVRO4iRbc0sjRxAFMDDGxliSXV6+GVhAALfdchnmJhJ/W3lbR2aMqz8Ra1Q8Nzwok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knL6AHop; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knL6AHop"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b9e9a6802aso38172065ad.3
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 10:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779643783; x=1780248583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5eNdxBZ2C2dxN/zR3lovRJrGB0cQE4FKAvAmccZBVZg=;
        b=knL6AHopC7gC5n5kdKgpgufKnMFblkdBEChy08bbsoofLsr7afRsArGHXI9FjwcXAm
         JIfsN4TSN+NXyXO8rlbTnsg0Sypg/dzhDTGWA/TbOpTheiuKZPRzGWRLuqCvECPMwor+
         /J9LfaSW1KSHNL3ZhC+fcXpSQHfy8ZHAN8UcGIhwc/miC/6r0RmMT9+i0URMexvXRgLd
         N6le4HIMElVXtPkiZZf+4RSUI+2C01J7ICrIF9lY2lvvet2bdXXChToNOY+JKWZZVGm3
         sst7DKC1uSmLoxJovEn6z2iqciPhh1i2YJ6gk3BjRz84kV5ir3kvUrSN1R/2VWSTsCTa
         3BLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779643783; x=1780248583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eNdxBZ2C2dxN/zR3lovRJrGB0cQE4FKAvAmccZBVZg=;
        b=KM3AGyuQHLFzzAlzA1NtgnKvOWLR7ME/veAvLFjGvNAjraZ+s9RdzNZACpu8wzRZhM
         Y0b5NZaba7ibEuh5FCIhtRWZ/usQnQvPDwiGJ3IzaZElTLwvWnDx33tNqQ1Vz9XRB2yp
         lnWyMi9w2yK6+k/IaT+R4UL9aLVnlF+GXdVu4qAaNDOWrxn/qS6+Qfe0ukHu4wS6c3zc
         PLQm1jGmiv5r38dcBxbQH9tHJe65HkNN4+sYAaBi+2hDDRjodXMXOOD6x7aHgIYSgJur
         cekc3yPEOCNlTHTmNArN6AS1jwvyVH8NguT3i8Io1ea0rL7T+pwrLn+D5pibGwitpX0t
         3sMw==
X-Forwarded-Encrypted: i=1; AFNElJ9IrhNIwjarKyhlRQ3vuXQCqsD1fg9yqi8LxZy7RKP5N4O3cU7b/YKb+wIYHnrGClxz4rae/0c03t8I@vger.kernel.org
X-Gm-Message-State: AOJu0YxPsuI9emN7t+Zm3JSUMKlPbV5EvZDqUhLNUpK15y6GKLoUGjKj
	N7usxE2lxHcHvJu2If1Im7wr5iGJtpezvsdvWAtqNpv8EzmmbXqVSf0k
X-Gm-Gg: Acq92OHLtFMfUfr/cVbxzdF8n4YcjVIenlm6zxsoSqzxi+Zh+3ls99mL3yQu7BbSJwt
	9IR6yBz9mWu/oHssK5WFB4bU6JroFgqr+PbiUtrRlIoMmm9ppyqxDvyB6hMAD42nbx9FiDMp+Ej
	I4fP87nRu5NQr3j4Tu4RyVeFSJA9zTAd2sYZxkN9+toOSmVeMuyYku0mKr0kZusC688Ly/LOD22
	wEXHgis86vsmZJsZBHpyQtqCFWnN04v+QOxc3AwRQxqK19OZH2MCCQX7tcagc+ZBfFhYbMVEyo1
	IT7lKaAtGjl+UUa2g8bxnE6vjhkKVNq6tcRTR9wR8e6/LdFKMZn0R7zFi1248VbvRRNuP6fhs07
	iGUb0A1xduRGhpKsJhU5m0fuuiKCff7VTp3nINnQhf5W1wL69zCPjp0ilTDtwDKbO4Ps2kCGvE8
	oVEYkScs1ONIPh60+0e+Cich6N4XrPOnamrNjbyUSmE7alkGJZuBz6eN7SJfqSW8fhmMzBexxoI
	e8u1w==
X-Received: by 2002:a17:902:ce12:b0:2bc:e299:4c9e with SMTP id d9443c01a7336-2beb05b9b79mr127729735ad.18.1779643783126;
        Sun, 24 May 2026 10:29:43 -0700 (PDT)
Received: from Ubuntu.. ([49.37.169.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695b3csm70579345ad.3.2026.05.24.10.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 10:29:42 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	zonque@gmail.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH v2] ASoC: dt-bindings: sound: asahi-kasei,ak5386: Convert DT schema
Date: Sun, 24 May 2026 17:29:33 +0000
Message-ID: <20260524172933.110768-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Asahi Kasei AK5386 ADC binding from text format
to YAML schema.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
Changes in v2:
- Added dai-common.yaml reference and #sound-dai-cells to support
  generic sound card DAI links.
- Changed additionalProperties to unevaluatedProperties: false.
- Restored legacy reset-gpio property as deprecated to maintain DT ABI
  backward compatibility.

 .../devicetree/bindings/sound/ak5386.txt      | 23 --------
 .../bindings/sound/asahi-kasei,ak5386.yaml    | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ak5386.txt
 create mode 100644 Documentation/devicetree/bindings/sound/asahi-kasei,ak5386.yaml

diff --git a/Documentation/devicetree/bindings/sound/ak5386.txt b/Documentation/devicetree/bindings/sound/ak5386.txt
deleted file mode 100644
index ec3df3abba0c..000000000000
--- a/Documentation/devicetree/bindings/sound/ak5386.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-AK5386 Single-ended 24-Bit 192kHz delta-sigma ADC
-
-This device has no control interface.
-
-Required properties:
-
-  - compatible : "asahi-kasei,ak5386"
-
-Optional properties:
-
-  - reset-gpio : a GPIO spec for the reset/power down pin.
-		 If specified, it will be deasserted at probe time.
-  - va-supply : a regulator spec, providing 5.0V
-  - vd-supply : a regulator spec, providing 3.3V
-
-Example:
-
-spdif: ak5386@0 {
-	compatible = "asahi-kasei,ak5386";
-	reset-gpio = <&gpio0 23>;
-	va-supply = <&vdd_5v0_reg>;
-	vd-supply = <&vdd_3v3_reg>;
-};
diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak5386.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak5386.yaml
new file mode 100644
index 000000000000..8b9b9bdb3609
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak5386.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/asahi-kasei,ak5386.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Asahi Kasei AK5386 ADC
+
+maintainers:
+  - Daniel Mack <zonque@gmail.com>
+
+description:
+  The Asahi Kasei AK5386 is a single-ended 24-Bit 192kHz delta-sigma
+  analog-to-digital converter (ADC). This device has no control interface.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: asahi-kasei,ak5386
+
+  "#sound-dai-cells":
+    const: 0
+
+  reset-gpios:
+    maxItems: 1
+    description: A GPIO spec for the reset/power down pin.
+
+  reset-gpio:
+    maxItems: 1
+    deprecated: true
+    description: Legacy property, use reset-gpios instead.
+
+  va-supply:
+    description: Power supply for the analog section.
+
+  vd-supply:
+    description: Power supply for the digital section.
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    adc {
+        compatible = "asahi-kasei,ak5386";
+        #sound-dai-cells = <0>;
+        reset-gpios = <&gpio0 23 GPIO_ACTIVE_LOW>;
+        va-supply = <&vdd_5v0_reg>;
+        vd-supply = <&vdd_3v3_reg>;
+    };
-- 
2.43.0

