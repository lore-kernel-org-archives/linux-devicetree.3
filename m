Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7416043CEDF;
	Thu, 30 Jul 2026 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785419917; cv=none; b=D/wpBH4SDDlZSY5usbXOTXXh5BycGe+6mcyr6rnyJZNI420W+M4UBz2MpqETZmI+9VGEGVUJsZWFedJERFNDAYfuvbDfletk2bKKyCuSYrTmeamaQNfEN5YHGzpF4JW33J7m0P1tw6DlqNUc5KyjXNR9Wm2dnKRsn9NeL6xbM6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785419917; c=relaxed/simple;
	bh=vMzm1GvNk819NsoMsDtvkp06j8Bhp7koLWgrnSZ547Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nioyXcrYiGo42PFg5e4PLo7HiUI7fyqd30aa9wD66aEbtw4sPEp49K6rr9TamLZiBQCqolfw8V23cwZFU2nFQk1eqakgiUFe5JUc6QToUSMbUW5mF8aKWgy4NxoLClDcjS2n6gCNXxWbh6lfgIxsBcNyZngH3YlP38ldsMTDER0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aioYcEnx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aioYcEnx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8101F00A3A;
	Thu, 30 Jul 2026 13:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785419915;
	bh=12U+DUSkDx6BGVuVzRdMtPQoiRSNmhu8u6e0D+Cp7F8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aioYcEnxtYcVIi0Gd6cs9oi0V7tLB+boGzU/Oick7jCFDX+illdPev1mmo6S5KcPW
	 o4Gd860VzIe9noe+bUB+53NW03uGPDAH188F1oK6Sc1UZDnBzjA+O5UK085U0SX/sS
	 HFI5grcq2Y47RAdmzFIp1gR6FJYWugKOd1MUPqrsPJc0scO2TBB9/qjzbVxPh8nnMG
	 BOBJKmcXhQoeV5oo4cq3Td76WUJ5mreVl5zkmEIh/wjwormyXRy5++/XSXEckR/5y0
	 KHwZyAsto84zy4thMPautruwa5o5ndkWgRr32U6xHA79+aHsdi7J6bnXL+ubZIWIiq
	 bkPPBRhs+Si/A==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Thu, 30 Jul 2026 15:58:14 +0200
Subject: [PATCH 1/2] dt-bindings: phy: Add sa8255p high-speed USB PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-phy-qcom-snps-femto-v2-8255-v1-1-8b8bf5105a68@kernel.org>
References: <20260730-phy-qcom-snps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org>
In-Reply-To: <20260730-phy-qcom-snps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=vMzm1GvNk819NsoMsDtvkp06j8Bhp7koLWgrnSZ547Q=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqa1iFqlP1GmDNTEbou1LNV0oShoDJbFmC5vDdA
 I6XkI30DWmJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCamtYhQAKCRAZDR20Zk4Z
 NQOIB/0cRR/t2HZHTsoHQ4WwALj21s/V8LBQ4YKhhTGZgD0H4e1fbl32Qbj7mx9mQ+gfpUSkdLm
 3LFfMDFo1Ho6UwBnZ5eMbR2onGbpAOvpeRddgDzYprJRy2tIHBZaxjUu1L07DXtUzqQMt/SNXDq
 UfTju4bC9tQtUsMAgBv6xmniW7TrV0eXOkJeXPjWV9UOKaHHi4oKfdyHBDXvWvxRMPZcJbxv/Kq
 HhUX1ZVDhNadKXg5XK3lobpjy390cKC2024SZEyYmkZywDovmT7hxQyphU5PzihZMmInDFvGat8
 9VPpSdNWNnduFG7F0D358CSomSuO/8Up9hMOLgMpvdWLWxQw
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

SA8255p platform abstracts resources such as clocks, interconnect and
GPIO pins configuration in Firmware. SCMI power protocol is used to
request resource configurations.

Two power domains can be requested: transfer and core.
transfer controls clocks and interconnects and core controls
the GDSC, resets and TLMM (GPIOs).

Add a new binding for the Qualcomm SA8255p Synopsys Femto High-Speed
USB PHY V2 found in SA8255P.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 .../bindings/phy/qcom,sa8255p-usb-hs-phy.yaml      | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-phy.yaml
new file mode 100644
index 000000000000..09f7ca6e7f72
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-phy.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8255p-usb-hs-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255p Synopsys Femto High-Speed USB PHY V2
+
+maintainers:
+  - Mattijs Korpershoek <mkorpershoek@kernel.org>
+
+properties:
+  compatible:
+    const: qcom,sa8255p-usb-hs-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: transfer
+      - const: core
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        phy@88e4000 {
+            compatible = "qcom,sa8255p-usb-hs-phy";
+            reg = <0x0 0x088e4000 0x0 0x120>;
+            #phy-cells = <0>;
+            power-domains = <&scmi12_pd 0>, <&scmi12_pd 1>;
+            power-domain-names = "transfer", "core";
+        };
+    };

-- 
2.55.0

