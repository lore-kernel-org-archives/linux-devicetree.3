Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFFB3955F6
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 05:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734141; cv=none; b=lN7lUIAPR0F89uLHh1EYOrnr2tci1DRgQisHk9hEPS0muwGpjEfMUEabh9ueS4zFo9L7Jt4eZnSJ3cTOzkhr4HatqlR8qMJE3SPL5lmj4kIcRlcJbLYeFhwVlbXFnaGsvNkxDQ+ZQjG8YrqySgBqFCjIvbOjgFXulik5xfh6bu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734141; c=relaxed/simple;
	bh=6OQnGRpMnyrb+bp+bGTn43xoUYsbGDK19SjrvuCzOUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ct/IsKQJKqkErlIqlKKN4rXXBzzlg77w2IqQ3ayLc20f+1hOYogm3jX8kq5uCDc2P5xLxaiZ2RBXbXMVdlNtYpx4COEkcNjyv7ju2tci6Ba/RfxIuZ8NYT0J9kCB4vGyA0kWrfwDyScjE0XwjI4sxLpX1uRnkasuFDsjrAhSc6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDjhpxR3; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDjhpxR3"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7eb787dec99so1981817a34.0
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 22:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734132; x=1786338932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ws0LFhZuUjZTnhwPoD3ztO16rIL3gtosandi83LBFNY=;
        b=SDjhpxR3kx142aDUpjMnFbokm/w3UeqG99CJjTHkfyVyaD0P9IMlzXUR20PNiKb+1q
         WzwPNy+Y/RmtfHmrsIm2CWxZuZpKnWiMCopETwwpMqK+PgRLP2dAkqsMX2zwIAlliKFs
         ju7Z7TURQ/bieQbD+/1zJYrPpSw02FNwbA776y/Vnp2iudCWalzax5hsFabhYCDMaQF1
         x13IKsriMuImKnQ9PtFjGToirlS/DOar1lp2Zi0Ly358e7FYnnaNZ0YOc7iJPd6aph6c
         s1daHjD9jRW4as5VScCySSUfhIjm9u5HDmd9NGj0sG6AhPay1myibcrTP0/aPtcoF4O0
         GmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734132; x=1786338932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ws0LFhZuUjZTnhwPoD3ztO16rIL3gtosandi83LBFNY=;
        b=U7zaR5VxDnwZ3SoCMfJ4o4nOd8MSAZ+ESBPhch0hD3SDnWJD8Nua48FrQbb0tI3Pxx
         P/z4RHkBEOPkdxjP2AeoDLFkfE7vWfTCJOJ/4Cc8yFk0BA5rK/33JPFPgtyRjDu/X5ZW
         LSslVz68z+Xo6u9Y88HwNVndujeMwgLSXs5Qw2Tbs+OYSPh83MLSYTy2g6gWDrqDk+//
         wvISa7CuNfmVK5J1jIO0khRjQxRE5cDnn9sCEICXdff9hFfINeINv0r7h7eEZl+eXhMZ
         ZRmI5tenVOowiZP0+im9eh2mMa6UI0NTQJ0UfAHRBGuFY9tTcEaTHTheL8FNVaIusAvI
         r4xA==
X-Forwarded-Encrypted: i=1; AHgh+RoliGu4jRiSOJJvbv5T3bOwAFer6kdJvmyftLpU40mNqmOC0kzd9bXSzzUiGnfe2DJjDJkJD8qMFF49@vger.kernel.org
X-Gm-Message-State: AOJu0YzuSzkRNBW7/3oEIKpjO+8p3OzRCypRegK8IGiDwHTZFIt4azY1
	3klPzguyIeOlbSyuk2KGhvAanALmkydta42JlPal2M05mi44JQE5Xl8u
X-Gm-Gg: AR+sD10qJg9x4sY0ORSKKO3pR4+I/6A9QBYSbeTJRzJ1SVXcntvkAN9NTajBigVDznP
	aLhuW1GnyB8uPMX48ZauvGfjCNRar8pQR7KtzrXy9ttqkQnWKCUu103BkDoPjGS7fq4L98xKm/t
	Jev+PAgFpAvmxlUR1+SblmOivHE5emTvICxaARbOSdx3+p/4FomoteQXwa3Fr2+9T65WwJ1984M
	zUo84O/Pwyb/Soc89kAVcUskj2d3oQrETdA7I/cjuq1+bog9peOhCWiKpmPitvX6uxovoF0G/8v
	N4g4CD3pXp0eU5WvB7Ug0c34AMd94Gsf+Ha100VH3lzMBaYyS/id1ZoSMocaEGAt9mM0yUJpmAd
	dcRzFN3L9uRZOg6r4bHVDmNnGJKAyPuk13Tm7+77i/AYUxGVJlLPXdbFZpks0tl/dDvF2upmhmI
	czFQrNTehULbk0JHGgF9jU/OzYNsTTmZiSVMdg386e35pHLdMnF48i2BAqLAIY4KtXYLL8ic0re
	wY4DY4koWBzEHmBbblTSgccdModZdrz7KN1YxBDre5YmOEuhX+208J1UBJx+FDWlWexeAH088A5
	YhF/SvgSsfxMAbd2Niwyqae1UGikofGENjx9Xp1dWRs4l0uAKtwDAu8UbVn+/PJX7MSpqf44EOU
	ocEsSP0JTFp2bVoWz
X-Received: by 2002:a05:6830:6737:b0:7dc:df37:844b with SMTP id 46e09a7af769-7f196baee6fmr14985696a34.4.1785734132204;
        Sun, 02 Aug 2026 22:15:32 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:18 -0600
Subject: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The AC200 is an I2C-controlled mixed-signal companion IC containing
audio, video, RTC and Fast Ethernet PHY functions.

Describe the parent device, its input clock, required function supplies,
the optional SID bandgap calibration cell used by the vendor initialization
sequence, and its optional Ethernet PHY control child. Document the 24 and
27 MHz rates encoded by the public EPHY clock selector.

Also describe the optional open-drain, level-triggered INTB output and the
nested interrupt controller which exposes the TV encoder, Ethernet PHY and
RTC sources. Define the interrupt source numbers for child consumers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 118 +++++++++++++++++++++
 include/dt-bindings/mfd/x-powers,ac200.h           |  13 +++
 2 files changed, 131 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..017629cca73c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 mixed-signal IC
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 is a mixed-signal companion IC containing audio, video, RTC and
+  Fast Ethernet PHY functions. Its control registers are accessed over I2C.
+
+properties:
+  compatible:
+    const: x-powers,ac200
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      AC200 input clock. When using the Ethernet PHY, its configured rate must
+      be 24 or 27 MHz, matching the rates encoded by the documented EPHY clock
+      selector.
+
+  interrupts:
+    maxItems: 1
+    description:
+      The INTB pin, which is a shared open-drain, level-triggered output for
+      the TV encoder, Ethernet PHY and RTC interrupt sources.
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+    description:
+      The interrupt number, as defined in
+      include/dt-bindings/mfd/x-powers,ac200.h.
+
+  ac-ldoin-supply:
+    description: 3.3 V supply for the audio-codec LDO input
+
+  ephy-vcc-supply:
+    description: 3.3 V supply for the Ethernet PHY analog front end
+
+  rtc-vcc-supply:
+    description: 3.3 V supply for the RTC
+
+  tv-vcc-supply:
+    description: 3.3 V supply for the TV encoder DAC
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Optional SoC SID cell containing the AC200 bandgap calibration value.
+      The trim is used by the TV encoder; the public AC200 datasheet does not
+      document the corresponding register fields.
+
+  nvmem-cell-names:
+    const: bandgap
+
+  ethernet-phy-control:
+    $ref: /schemas/net/x-powers,ac200-ephy-ctl.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - ac-ldoin-supply
+  - ephy-vcc-supply
+  - rtc-vcc-supply
+  - tv-vcc-supply
+
+dependencies:
+  interrupts: [ interrupt-controller ]
+  interrupt-controller: [ '#interrupt-cells', interrupts ]
+  '#interrupt-cells': [ interrupt-controller ]
+  nvmem-cells: [ nvmem-cell-names ]
+  nvmem-cell-names: [ nvmem-cells ]
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mixed-signal@10 {
+            compatible = "x-powers,ac200";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+            ac-ldoin-supply = <&reg_3v3>;
+            ephy-vcc-supply = <&reg_3v3>;
+            rtc-vcc-supply = <&reg_3v3>;
+            tv-vcc-supply = <&reg_3v3>;
+            interrupt-parent = <&pio>;
+            interrupts = <1 20 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <1>;
+            nvmem-cells = <&ac200_bandgap>;
+            nvmem-cell-names = "bandgap";
+
+            ethernet-phy-control {
+                compatible = "x-powers,ac200-ephy-ctl";
+                nvmem-cells = <&ephy_calibration>;
+                nvmem-cell-names = "calibration";
+                phy-mode = "rmii";
+            };
+        };
+    };
+...
diff --git a/include/dt-bindings/mfd/x-powers,ac200.h b/include/dt-bindings/mfd/x-powers,ac200.h
new file mode 100644
index 000000000000..cc59e2ab4912
--- /dev/null
+++ b/include/dt-bindings/mfd/x-powers,ac200.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Interrupt numbers of the X-Powers AC200 interrupt controller.
+ */
+
+#ifndef _DT_BINDINGS_MFD_X_POWERS_AC200_H
+#define _DT_BINDINGS_MFD_X_POWERS_AC200_H
+
+#define AC200_IRQ_TVE			0
+#define AC200_IRQ_EPHY			1
+#define AC200_IRQ_RTC			2
+
+#endif /* _DT_BINDINGS_MFD_X_POWERS_AC200_H */

-- 
2.53.0

