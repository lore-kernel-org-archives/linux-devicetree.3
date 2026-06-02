Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAAD3B9D94;
	Tue,  2 Jun 2026 08:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388748; cv=none; b=ZwRYtLPUjCrpHop8mWCvdg36XbgBBax4mlIEZCLfyVpdsHXzfB1cjhL4fmgq4GTTIo9+CEqDJDGOkjZ57bRlc/Q/7DnZ0hkTodhfotfKB75W3BGL05jVVxz6YxEp1t1Ouj3IB8enH7OMNoGDABv6UW+rgWlPYSTJR/H1ZPYLh7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388748; c=relaxed/simple;
	bh=hiYCo1RAIyJdbdh8LiTzMKE/mFUNtE1Yx9MFVzb3C/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=inK831RMhfDTGMmtOnT6b9GPXzfz/OrRjrcyypk1XrVImw/NiTD1qhw/juy/IYJHhCbm2spI3F6iDkkJxyiirw8/HDyU9pUGm/2T66CK29lbG3j2xm5Ri1MrnCZNAcfWJqSANO//0PUtedaw/D/iafYdZEYWEYDxVW1E8OjjyBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADsZiljM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADsZiljM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12482C2BCC9;
	Tue,  2 Jun 2026 08:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780388748;
	bh=hiYCo1RAIyJdbdh8LiTzMKE/mFUNtE1Yx9MFVzb3C/0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ADsZiljMTQc1d18P5riFRWs4viVqpfcUNS2YoCueTzvDsAXqVgUkx0pMvj7edQoI9
	 6OwEi/EvoJezkdBB++NKf/uvhdsxEe70JqC+gciGL31ewqumS7V0O4p1I02DAULJ5i
	 ZjUAORUWm+XeQy6f/gEx23KgcgJxJ5g2YC38PttUNkU7pVcqArtzJ3bf9BAXmLAi9+
	 Cpb/qAS7ADEP1NiP2kwG2SG4pOlvRdwF/w1KHrLS2DOGmZ39iACGpPgd6EpzK+8xb0
	 qSG6JP4SsTkToLu8UmuhMn1FdSG8QoxT09hgBMfbu8R6xROqrXnLomETJebefClT/d
	 VgeKyu+5R3RoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BB0C5DF71;
	Tue,  2 Jun 2026 08:25:47 +0000 (UTC)
From: Dimitri Fedrau via B4 Relay <devnull+dimitri.fedrau.liebherr.com@kernel.org>
Date: Tue, 02 Jun 2026 10:25:37 +0200
Subject: [PATCH v6 1/2] dt-bindings: phy: add support for NXPs TJA1145 CAN
 transceiver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-tja1145-support-v6-1-0e0ffc8ee63d@liebherr.com>
References: <20260602-tja1145-support-v6-0-0e0ffc8ee63d@liebherr.com>
In-Reply-To: <20260602-tja1145-support-v6-0-0e0ffc8ee63d@liebherr.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dimitri Fedrau <dima.fedrau@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dimitri Fedrau <dimitri.fedrau@liebherr.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780388746; l=2796;
 i=dimitri.fedrau@liebherr.com; s=20241202; h=from:subject:message-id;
 bh=6R2zkH37KN3+mbPNVHNxWLa5YGGzjVPerMq9Q6uHdOw=;
 b=4MrsGWbeXUda/cOoZIk5ySgRaWwtL6v0P0UxBFOoxr5tw1b5dx7hJDWEishY2lD2RfUiSPPI5
 GvG1tJ+zvXLAVP8yvaeSXWZfAk/tyH77RuJSGt2Vi/5v18lyqc0FsBd
X-Developer-Key: i=dimitri.fedrau@liebherr.com; a=ed25519;
 pk=rT653x09JSQvotxIqQl4/XiI4AOiBZrdOGvxDUbb5m8=
X-Endpoint-Received: by B4 Relay for dimitri.fedrau@liebherr.com/20241202
 with auth_id=290
X-Original-From: Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Reply-To: dimitri.fedrau@liebherr.com

From: Dimitri Fedrau <dimitri.fedrau@liebherr.com>

Adding documentation for NXPs TJA1145 CAN transceiver, which resides like
the ti,tcan104x-can.yaml in the same directory as other generic PHY
subsystem bindings. At the moment there is only support for simple PHYs
by using regulator bindings in combination with can-transceiver.yaml or
PHYs that implement the generic PHY subsystem like the NXP TJA1145.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Dimitri Fedrau <dimitri.fedrau@liebherr.com>
---
 .../devicetree/bindings/phy/nxp,tja1145.yaml       | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/nxp,tja1145.yaml b/Documentation/devicetree/bindings/phy/nxp,tja1145.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fb068f7d774f3c92dea7725416e9c3e038e06e2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/nxp,tja1145.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/nxp,tja1145.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TJA1145 CAN transceiver
+
+maintainers:
+  - Dimitri Fedrau <dimitri.fedrau@liebherr.com>
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: nxp,tja1145
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  spi-cpha: true
+
+  spi-max-frequency:
+    maximum: 4000000
+
+  spi-cs-setup-delay-ns:
+    minimum: 50
+    default: 50
+
+  spi-cs-hold-delay-ns:
+    minimum: 50
+    default: 50
+
+  spi-cs-inactive-delay-ns:
+    minimum: 250
+    default: 250
+
+  vcc-supply:
+    description:
+      CAN transceiver supply voltage
+
+  vio-supply:
+    description:
+      Supply voltage for I/O level adaptor
+
+  vbat-supply:
+    description:
+      Battery supply voltage
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - spi-cpha
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        can-phy@0 {
+            compatible = "nxp,tja1145";
+            interrupt-parent = <&gpio0>;
+            interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
+            reg = <0>;
+            #phy-cells = <0>;
+            spi-cpha;
+            spi-max-frequency = <4000000>;
+            spi-cs-setup-delay-ns = <50>;
+            spi-cs-hold-delay-ns = <50>;
+            spi-cs-inactive-delay-ns = <250>;
+            vcc-supply = <&reg_5v0>;
+            vio-supply = <&reg_3v3>;
+            vbat-supply = <&reg_24v0>;
+        };
+    };

-- 
2.39.5


