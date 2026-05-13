Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0D23F7867;
	Wed, 13 May 2026 13:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778677928; cv=none; b=hwvaAamXNGJZDzYpseLWTlthZqDY2yPE6ox65matOcwoDPFBMue/wnxa7J8LWmfZB5huTuHRdSCLTcGNPi29KdWHCwoNzsYmVIYG0PY690HLQSL6AFlEBe1mwpnzhvuGVMm4mqIsb3V7JiakvgnXwa5GSB0KxuT+k3wMbsWUMpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778677928; c=relaxed/simple;
	bh=mrYufZayANyHbmSl28kp/x2VGhkIQRMjMFMD1iMr0/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jzlLQDU1HGA87qnvli/OpfiD5mWigvwHyzY3vm5w/KbpTmAYkg4L7QmAv3lOEJ3z7d13u3JfKfz2ukX6hn8oACFt1L9HBscmLyoe2ETNvAqlxhokRYy4+3GRqvIJAvKKsr1cuQEr0kGgS5e9aVuXixko4O+EVulrpoOaQEn00Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFNKEvjh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFNKEvjh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B451C4AF0B;
	Wed, 13 May 2026 13:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778677927;
	bh=mrYufZayANyHbmSl28kp/x2VGhkIQRMjMFMD1iMr0/w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aFNKEvjhMqhemQ5CZDvdUVcZqfQTCC9++eC0JCoOJ6chRdS9kWJ069uWB5bQJ3hGe
	 xEzNQVOMnEJgmbr3p07vy1vACe/aVWQHtFI+nFeoyCs2y53XzetG+99LRwySAmbYH+
	 KvssCovzZlRPGvZsqq2GQTpTUYNknuMyA9lpDrw6ryGAfaAGT6ipb3WYiovmtVOwlx
	 3rfG1TFCTB2NiubMZbpnMvvrbiTYU4Io9Smkh8RoK+hbwSTzwi0dzORSBgbbJrV8g3
	 Iqn4BTfXCEiWmsYegiQpE2fzcYAL3gtruiB8jqGINBEOXE90nmP52SsYqvHKKQAxp8
	 +H6JxXiNTxqUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F9CCD4851;
	Wed, 13 May 2026 13:12:07 +0000 (UTC)
From: Dimitri Fedrau via B4 Relay <devnull+dimitri.fedrau.liebherr.com@kernel.org>
Date: Wed, 13 May 2026 15:12:02 +0200
Subject: [PATCH v5 1/2] dt-bindings: phy: add support for NXPs TJA1145 CAN
 transceiver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-tja1145-support-v5-1-38720a7ee63e@liebherr.com>
References: <20260513-tja1145-support-v5-0-38720a7ee63e@liebherr.com>
In-Reply-To: <20260513-tja1145-support-v5-0-38720a7ee63e@liebherr.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dimitri Fedrau <dimitri.fedrau@liebherr.com>, 
 Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778677926; l=2608;
 i=dimitri.fedrau@liebherr.com; s=20241202; h=from:subject:message-id;
 bh=gO1sGVTxGhuOYWVBuaPrvVGhpYnctsS7WdK7HQbRpIY=;
 b=mrLckBKnirP5Y5c+tmLHjSOZr01KPgrbOdUcPMyZimv7TTFkFIxt0lMRSO3ByVF/wTtK3vCXj
 RnYvx0MiABpDsYazOQm3LbhwXdyGkTHPI4LGB/lvuXber71l1H0nzIn
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
 .../devicetree/bindings/phy/nxp,tja1145.yaml       | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/nxp,tja1145.yaml b/Documentation/devicetree/bindings/phy/nxp,tja1145.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..46de6d0f2dd9b9fd41c97eb4c9340e3ac36090a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/nxp,tja1145.yaml
@@ -0,0 +1,80 @@
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
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        can-phy@0 {
+            compatible = "nxp,tja1145";
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


