Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CEB4334BA;
	Fri, 24 Jul 2026 13:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784901234; cv=none; b=umGZreLvx9Zr/Xc8sqMv2pra/X9c8p9dEop2q+OPB9m+Ljv2G9dXCc13k5lirAWUVa3eDRztU8ekE1kyt+UYA2zhyeg3mYy7u2BdMCqmXlqJhCdjvd57vv3kAM3HFPKYL1tZPj3kP9fN4NABH43QSz0PnAPvirG2hJhiRPDUGy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784901234; c=relaxed/simple;
	bh=uuWTtc/SqFOv3AXxjSOp2M/zeX/56oTFjsx+ZiFX+1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m/BBigTSYh9eLnByTNFyjWZYDWXb0fkplcKj2TyjVPVPHyejMIM4rlOTPqLkGaAKAbxt5WuEWOFJWbHZEXvTPqk4dSYfYQ4bY2LjgKhaAVDnHwbp4+2VWE+G2iKQi48iLmJj+QAcpjloTCmfzCcH3x+tw47JNjk35R/ezCqoDiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ggBQg7dH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ggBQg7dH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126FA1F00A3A;
	Fri, 24 Jul 2026 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784901222;
	bh=6BZzUCN9fW6+krujoO8axKf9d6b7Wf+lqhUR4UVRjIQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ggBQg7dHU6WDzYuwr9ebf9dNEkeM7yaxwc1yNM3DmxvRy1Hjpjk2RwG+RtY0e4bwv
	 JInTAQ/ou+KKTCkWfa+jeSPTgfCKe5/gIzULoiQe0YA5eTQvaFwKoP6O5LQLe2LoE3
	 WMPqGKOPTFoqd98eqPLvwNiB9MYI+o9FHv8qqpNX9K3pDcAt/Ha1TrCyxErTCtgW0b
	 VxEmnBq4geZRKmFMxfELj9yt+r30tdIcaSNgV/RyMks1hnsSSsYFNQ8Uu3vRD7Cf0S
	 9CUj2IzFlGriDDMDaFZTBU0ZoTbKXI0rIKIRze6W7d+7cJWfziqOyk8hhVORo8xfNt
	 n9GFcn66Vuh4w==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Fri, 24 Jul 2026 15:53:26 +0200
Subject: [PATCH v4 1/2] dt-bindings: phy: Add sa8255p USB PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-phy-qcom-qmp-usb-8255-v4-1-a90014fab476@kernel.org>
References: <20260724-phy-qcom-qmp-usb-8255-v4-0-a90014fab476@kernel.org>
In-Reply-To: <20260724-phy-qcom-qmp-usb-8255-v4-0-a90014fab476@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2166;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=uuWTtc/SqFOv3AXxjSOp2M/zeX/56oTFjsx+ZiFX+1s=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqY25gppoXfY1d2PerxT0wu2LqACI8pBTBlFzBb
 Kf8r0ItQEOJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCamNuYAAKCRAZDR20Zk4Z
 NUDiB/9B8MDU6AVWQ6cc3w62QUtPZJsDBg5tes3llDBn74a7HB02yIaPfetCqofZ9p/VYxqYra9
 CXuAUvrvPKm18AurGX6AUPxxpaE6Bj1vUkl37MbH6ogtIcn74Fctpep147N+wH0yMuQ2AJTNQW2
 jIfTdeb15rX3i+9OjSzwZMEu5ev9YfrivHIFkACdKSafQegpK5tOzSw/IEW+26xR75fXsmNjjdh
 u0eFBJGbIs9Hg6LiXAwwVG/6AlLzqtrZVq55rpmu4fYnHQ4ZCBmdhdbdRh130JMcxi2/QfNcuIY
 j7nE8jCWXAt2mXj0xucWFxDXh6MujDYxQKCPpm4NpmsV8Tf1
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 .../phy/qcom,sa8255p-qmp-usb3-uni-phy.yaml         | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-qmp-usb3-uni-phy.yaml
new file mode 100644
index 000000000000..c09829c0f2d1
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
+additionalProperties: false
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

