Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182982;
	b=jCVdjeZiI0AP4QZQ07UGPbTqSRmCZTkEPV3ITXG/bnSHQ41EMZ5OLClQt159tmy2BWFA
	 TnZYgF4WKNVYojDdC0WRjCMVhWNNn8OuCPwMxMp+v0dJ0LJJGhlYfTWg/7tXMwWM/94MA
	 ItbTLmixLJS5obgb2wIP58lVWal+45ns2Ge5TEl9+lt85oBjt2l7xeHJSePVynbIog1fv
	 BEEuYmqUviYZB9O3AYoWjkE8NOyo1Y4gdikE6CrdG2QKCcgYZAoyANhYTakzeKNXpSQrl
	 EEZJ+K+2/BFv+IXDQizPgyC6PCsnbd4ud+nJTI9976YrfFDPuFLRrf36fKulWFvltLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182982;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=KmAc3T9mWrH7swBNo0EglWG6ricFEmcz6t+LpSrqQD8=;
	b=CdMpc71fUXLLAmp+DJzcfQaZWLtggIMFvh0OasMoFTWM4il5jEoafECloYgp7Q1JdVxZ
	 7LeJpntDbqAgcSGmPBRkORN3DgZTZ/k7XgL7MgoUcfuL8mpYr8I2rl53sFzwb2bfEIqkj
	 hKXwtgMCQQaWUB07nQbd7QU+JSOPZ7YiZCHdVg9BW9yv5Ck1kvjtQjG4odkbu0c5iBZIq
	 kl6lnchynIzmeJHjH2Zporx0xNOWxXVKEF7H0jzJUx72aGWDx9gfm1xqPJplFEntDZnz3
	 mvApnvzeCHhdzyRgini3ej929G+Pm+MiMHBgUV2FlQMGRsVfesK6nQxNHSl0x6to8RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P+RdDfrp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15236073FFF;
	Fri, 20 Nov 2026 13:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P+RdDfrp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F6A1F0093E;
	Fri, 20 Nov 2026 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795182982;
	bh=KmAc3T9mWrH7swBNo0EglWG6ricFEmcz6t+LpSrqQD8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=P+RdDfrpbaDcBgMKYTpiIBnfseY6vmGZQO1xSAb3Isnjkl8HLABo4o/po2+ETAaTe
	 2mPV3JRZbo4nCQM1jpfgy/xk1fjtWKaVKo+DxWeMsD0daIXmWonkW5fhZ8w9fnvJRs
	 ZlTKAUWBJN/XFoa7VbDD7CYC6xnS1cGKGCxpNrSYx9xEtw3wTGdsFYvu7UlOxIbfPj
	 ShVe+1UpBQ2a9hEIeIMEOOhMRsUPcclaX3n0sG5Y2iQxvXCO/0ryjqNTE43JkiX6MZ
	 GwaVmnSP4OGLvltuaIWRnthbWeN8pDztSh2yN/8JpBe0+6Zp4yxIFybclbKidPlh9E
	 Jepz5OQoeHBQQ==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Fri, 20 Nov 2026 14:56:04 +0100
Subject: [PATCH v5 1/2] dt-bindings: phy: Add sa8255p high-speed USB PHY
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-phy-qcom-snps-femto-v2-8255-v5-1-86a9880ee5a5@kernel.org>
References: <20261120-phy-qcom-snps-femto-v2-8255-v5-0-86a9880ee5a5@kernel.org>
In-Reply-To: <20261120-phy-qcom-snps-femto-v2-8255-v5-0-86a9880ee5a5@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2903;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=+iqdwQcNJL4/e62aoHyHmgjIrFNlesW9mTuXz0wcwEE=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBrAFGA12KAP+Eu97PQ5RLJLiYBMe0bqt09cz6gl
 CgYOfcmCAKJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCawBRgAAKCRAZDR20Zk4Z
 NfNwB/9Sk8DO60b6vCOrlGTrbB7iCe+oWNnd8KpYXR+Py8c1wH7f0jpHC8lrbRzahFX8xQ71pTK
 RejVPVAD557D9IKyTM5SBifyhdRtMzqK+ZlRNhOmv6AX98KN2LJmFqEZtctj/tp66auNKkTTY9S
 rNuqyX+mCJms0g6PL0vASmmoX+F905mOC1fBJMIytUnibYEljhLv/aqr6VqO8RV2mmlJwzj40oK
 G6Rg/hbgYIdZiHzLv9GKf5s+cToJgyfTpd2IyxlGcgZ8NU5EK5MB61n6rJ8z5k85YZHcA0/pbaI
 Q5/GwrGFq2+jmM/mDTa2hekGGiaExlNOTbKlu3PCIJ7hZ8xY
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

SA8255p platform abstracts resources such as resets, clocks and
regulators in firmware. The SCMI firmware exposes multiple protocols to
control such resources which are identified by protocol_id.

For this USB phy, 2 SCMI protocols are exposed by the firmware:
* power domain management protocol (protocol_id=0x11)
* performance domain management protocol (protocol_id=0x13)

The power domain has 2 indices: 'core' and 'transfer'.
* core controls the regulators, the clocks and the reset
* transfer only controls the clocks

For example, to power on/off the PHY, we should use the 'core' domain.
To disable data transfer and keeping power enabled, we should use the
'transfer' domain.

Add a new binding for the Qualcomm SA8255p Synopsys Femto High-Speed
USB PHY V2 found in SA8255P.

Note: the performance domain (0x13) exposes opaques values (0xa to 0x11)
for which we don't have any information. Since it is not mandatory
for the PHY to be functional, we have ommited it from the bindings.
We can document it (and make them part of the dt ABI) once we have more
information.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 .../bindings/phy/qcom,sa8255p-usb-hs-phy.yaml      | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-phy.yaml
new file mode 100644
index 000000000000..fff474a8345d
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
+      - const: core
+      - const: transfer
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
+            power-domains = <&scmi12_pd 1>, <&scmi12_pd 0>;
+            power-domain-names = "core", "transfer";
+        };
+    };

-- 
2.56.0

