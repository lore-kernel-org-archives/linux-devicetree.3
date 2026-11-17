Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933714;
	b=pBi4stVCYByys6J5C1byGklFGluyD/8NnIpB6WnDeQUge8qW+jG4gn4tv4quBpLmRbgO
	 awVab4vK2rEz1ZbP/0OcLLkx2QzcZMPfnUdj02QuAFel0ry5E50322URG/UKrlVosU4Ko
	 OFVvSeV2O3FYbDHe3q0c3273WIw06M8BGT4hfyHoou1q8vU/U7Bkhmr5yAOUWEggNt7WU
	 dJr7OJh+XU31/BN+uXUZ07gYcDNWszXTvyZKm2NOtPEbqTVzSfbGCqsN+fKYZXfIOKnHn
	 RwjeBfYL70dR0l6UNtFLLdnak+tOLgYEMTli+OpBEv48tGvB6CWs8EJNQ78S0gDGoNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
	b=iVr4bIeandqSCWvDRZ7pFMCgVU06HItP6oSt3q9fiGz7+W2DUVEzqL4vHQqp+FXFbReM
	 yAU5zRxIUkdRCfM3l3lSiclkO6wMJEYxhhMiAHMe2Pk3oJFLTVxrCj6yeukPVxirnhRBR
	 oGdRe0PGw7mOp8Hc6806x3WT1uSzXRHYyYKMkdP60Wac83RC73xxn7wdaabReLKTqzO7L
	 uD7oJ52dT+wDQ88UjwzwftTi4p3DydIus9VHZTyLE5uK4FS63vNKlsM9vnbkjEEdFBtVJ
	 Zt6mXJVP3yz4LBEobdLbw1pcfCrERyHBXRQTIS+ajPh6l1PlbWn9J3MTyuf4TZ/LZcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=diTmpu6i;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F976606A88C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 16:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F976606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=diTmpu6i
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so578535e9.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933713; x=1795538513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=diTmpu6iPHPqo9m+2tYHVlfuMOMp60XxZZh5NHM71BDcSd3RXbX2ViehEIizRNnlbr
         oFuzXfimjV0/7cr+Bbp4qEMTOuDfRWI+8MTvs4vFCs0dhqbxbIPktwdpuNBiP+SjerHA
         n99AByFdou1LEKDBlApVm8ocFugtqCNfAViA7evtO7/RFmupI2z2M12XV5e0xI0OkvaO
         TCYlFtVIX3xoHheHy/R6gv4DafEM4vdfEse/C8D/2dFIj28TUh7G7N/9XLw7gngX4pcZ
         R2x1tTveajrkHIPiCQg3otNZ+uSCOUTO1ZOd9j8twMnpth38yComQ3bY0m0aLTn+P0gk
         cwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933713; x=1795538513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=NB9dRq64b/vHO0l437ww6xHY4367EUibLtkGyd0sRctTSDlBYdf66ocOV3tR2cb9GT
         6HBNC3H56WN+OHVZvWopFzxTyY8uaz80fyQkjYcKzJLuFLDALiRvEzrC/Yp7rxPHMB+Y
         7pR04lh5zho0J6McoAbZr/B5GF7FuUIy+bKZ2MKne0aIsJcq4nrBoHW8Kfz8lSDSDz1t
         KsLGCwNpYS8kWJo76KdtbupeF1UWSqnUvbuxtOqc8FG+vzU+gJhDWas2o+03Cju/JSAJ
         AQKWTMCkKH79dbGITStCVOMbUAlM0DT2Y1A1wRfxok6ckyAmXBV58muiZbeiKk4LxPLL
         jesg==
X-Forwarded-Encrypted: i=1; AL+hErFCDsToNtlEq8rZCNytH69yj4Mh1V8x0lO3HFQWYtCYnvLEK9jUrsbkCj9b5iPUPvNUyKOqzNjkAY9o@vger.kernel.org
X-Gm-Message-State: APuU4Z88Q0728y0A4YV8LZToI2z+Y0GNRtwwylQoo0ugdZ3d5UNyNqU5
	ZQ6pdhg6bCzH/bf8e5gtDrh8lUmhmkLwGAh4uA7BPw8gG9SBiGZ9k7on
X-Gm-Gg: AYBFou1Ifgl+EyX5645hgEMbPa/OOIWrFFEO4Wos4RnrC2XRGUnwpb1e1r5WS+FKKjG
	SO4luvnSiH7ZfmC+Py/q24oEp7Pszox/eOlzz90PfW/D3MzL4p7A+Ojmf2ud0GqXS4uCnn5lvOt
	tgyZPMEhR+79o3WnRtum8kO7ClHAejiFUt357HrTG5djX/vjZzYAz1do3uCka9HT/v1x9m6Ats5
	9n6m1Do6/fC7rYAQsWZwV29HZee6jQ1uJ6orPUl0Pgrzv+TF6jqabgAL1ldgF3Abrqe0XFuoeUK
	E/N8Z4d5zCHkaPVaBFPfLr6pNhmmCrgyfLenGygbdTg1BRQutrSI72AZ2YWITAiDkHDo1rb7iaz
	VUW1eazaKtsTzkRd4+FDf7sVQXLIxVaIYblmVpqT+PyMweUWWJpbj1VBN0kHlwlp1IxDrsJZJKD
	eCaHUYJRNhgcm+HX9SLM3t2pX+il38OnZBNXx6mnDsdLR4P5SUS/OhQGYTl4pqjzUY0m58y1yH3
	LAWkCZWETOdEPNLX35k2Z3vbxaAFGET8jpUe81HhrwOHSUNg2m1ZbqqabAz2+MHQXKdJP7NKhah
	gi5/G0yBgukxTb3E5Cul1I3uZ0ky3C0Lyx7l2HGeR6wdfgu84u4Qk6/372Kvfcfd1FqHxaSNnj2
	BME5LfLxzVKjT2Tsbyj2EmvRFZlKFFHBP9g==
X-Received: by 2002:a05:600c:1988:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4bb5e2693b0mr281411975e9.0.1794933712865;
        Tue, 17 Nov 2026 08:41:52 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm82316475e9.12.2026.11.17.08.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:41:52 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Tue, 17 Nov 2026 17:41:29 +0100
Message-ID: <20261117164132.47167-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117164132.47167-1-ansuelsmth@gmail.com>
References: <20261117164132.47167-1-ansuelsmth@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for AN8855 Switch Internal PHY.

Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
PHYs on the MDIO bus.

Each PHY might need to be calibrated to correctly work with the
use of the eFUSE provided by the Switch SoC. This can be enabled by
defining in the PHY node the NVMEM cell properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/airoha,an8855-phy.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
new file mode 100644
index 000000000000..d2f86116badf
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch Internal PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
+  PHYs on the MDIO bus.
+
+  Each PHY might need to be calibrated to correctly work with the
+  use of the eFUSE provided by the Switch SoC.
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ethernet-phy-idc0ff.0410
+  required:
+    - compatible
+
+properties:
+  reg:
+    maxItems: 1
+
+  nvmem-cells:
+    items:
+      - description: phandle to SoC eFUSE tx_a
+      - description: phandle to SoC eFUSE tx_b
+      - description: phandle to SoC eFUSE tx_c
+      - description: phandle to SoC eFUSE tx_d
+
+  nvmem-cell-names:
+    items:
+      - const: tx_a
+      - const: tx_b
+      - const: tx_c
+      - const: tx_d
+
+required:
+  - compatible
+  - reg
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@1 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <1>;
+        };
+
+        ethernet-phy@2 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <2>;
+
+            nvmem-cells = <&shift_sel_port0_tx_a>,
+                          <&shift_sel_port0_tx_b>,
+                          <&shift_sel_port0_tx_c>,
+                          <&shift_sel_port0_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+    };
-- 
2.55.0

