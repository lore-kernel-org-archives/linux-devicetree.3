Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E60356762;
	Wed, 22 Jul 2026 13:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727958; cv=none; b=RcRAKqhnl41Dy6EMHj0UE1OE7vjKFqx9gx5/yetfi/HgWKMDuKP4DOT9J8dC9LBCaH/v7Q+kj6MijUZrcheGaCJ/kMvY/feEuPVlMPkJmaPltn035iTvVXkcI4E0Un26wq0Vahi1T456o/yI0jEULzKU9IUJz/rClOcXDQ8+zXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727958; c=relaxed/simple;
	bh=72+93u2x1FJX/Wrk9jq2RGNs2uk35TLneVVzVanyQd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cy47fYFSmjC4XGfwx4nRSm/tbm19aYh4t6jMXT/jSVgiqa5IOudyADw5yApRCTMIeLpTtatjsPXce8H8y8jHWd61ufu+f+4iLAy5nJxtYDiiw53+oZchV7L6e2Kt426uwTBmafSs7iWUTmNMh0uXIr1O8umb/SrZyRUto2OKMeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7UPShWP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7UPShWP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378381F000E9;
	Wed, 22 Jul 2026 13:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784727956;
	bh=42bI6S7OB18sBS+H73AC5+tOmPTkN6hTu7pc311WTww=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H7UPShWPfjwciQQKgtRxBnt5/u3Rx+FGHPO6bxLcC/t3OFi23e3OxOP5UdiZLJ8AR
	 3xCI0RwAc6Io+juDmHE76DO8AO+F/qR95/FCGexEFng94rDt5fVsGCdp6BTFiFeP76
	 OqPRNArmRnb5ahRp6GoYGyy9I12QJwYqaYH6tpEi8RPwX0swH0ftv4+ptD4/zg2PkJ
	 02/ieZA3+Km2axjKUyrIBH8N2wtk3gqhZjNJSxTiPzhhAJm80kJECkn29gIIYaOwSQ
	 MNvxnQfTAKpIECbsGBdL3q0srsTDRXYyfO6+zSnCDqN7Gjqy8UbLKwJv9faTmMV0Nt
	 kK9T3kiPiB6yw==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Wed, 22 Jul 2026 15:45:44 +0200
Subject: [PATCH v3 1/2] dt-bindings: phy: Add sa8255p USB PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-phy-qcom-qmp-usb-8255-v3-1-e789070b48f7@kernel.org>
References: <20260722-phy-qcom-qmp-usb-8255-v3-0-e789070b48f7@kernel.org>
In-Reply-To: <20260722-phy-qcom-qmp-usb-8255-v3-0-e789070b48f7@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2094;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=72+93u2x1FJX/Wrk9jq2RGNs2uk35TLneVVzVanyQd8=;
 b=kA0DAAoBGQ0dtGZOGTUByyZiAGpgyY+ipwsLK3Uo0/lpxqy9xNmBgqkcqJja+rHzntzS0ksPl
 okBMwQAAQoAHRYhBC7pQqe2H2q+UxOtABkNHbRmThk1BQJqYMmPAAoJEBkNHbRmThk1VRkIAOYF
 fKH6MVhvcIRn0U0G6hFmzKVuKqcKtr9KqrQiGrIUVIxFK7gQhSQfma6kGSpi8l6h63H7wCxmNdN
 iY0mnt+Lu1pLO03bwTZO2vbFGkpWeUDrfPYaenjNCnI9dyUY8vu77W1Em/x3vVwnp65zEh/d5E0
 XnSfIp+c7eMZXRTk//iEbEj15NpK4+Iqh1Ix1huUOJXV049Mss4Gx9ygZ54AwY7HS7FdWgXoX5h
 wYqE7l8Mx6v1Y1b8E2ef11xOrTacRwCzvTleHl+IgbZY5NSuI32/XqrDujt4xEe4fKsJxgEpXn5
 sCi4cgwmIa+v5ZORng3tlA/a75VpXybDhqPfrog=
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

SA8255p platform abstracts resources such as clocks, interconnect and
GPIO pins configuration in Firmware. SCMI power protocol is used to
request resource configurations.

Two power domains can be requested: transfer and core.
transfer controls clocks and interconnects and core controls
the GDSC, resets and TLMM (GPIOs)

Add a new binding for the for the Qualcomm QMP Super Speed (SS) UNI PHY
found in SA8255P.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 .../phy/qcom,sa8255p-qmp-usb3-uni-phy.yaml         | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-qmp-usb3-uni-phy.yaml
new file mode 100644
index 000000000000..d274d500fc9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-qmp-usb3-uni-phy.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8255p-qmp-usb3-uni-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255p QMP PHY controller
+
+maintainers:
+  - Mattijs Korpershoek <mkorpershoek@kernel.org>
+
+properties:
+  compatible:
+    const: qcom,sa8255p-qmp-usb3-uni-phy
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        phy@88e8000 {
+            compatible = "qcom,sa8255p-qmp-usb3-uni-phy";
+            reg = <0x0 0x088e8000 0x0 0x2000>;
+            #phy-cells = <0>;
+            power-domains = <&scmi12_pd 2>, <&scmi12_pd 3>;
+            power-domain-names = "transfer", "core";
+        };
+    };

-- 
2.55.0

