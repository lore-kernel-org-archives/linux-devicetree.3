Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3637D3C063F
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 08:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786954850; cv=none; b=ktyQ1R62O3pWEz/5XlHJOO6YDmEiWchpjhlAhXsXkawyfGdgtr2nGA7iZMFnKm0nW7pOV2S4jUf97C218JHqRotPKaDDjDOFLelD3BcPGI6W7ZFh5I2MQ+7nedD2tnQOLeaSA0vzi0HoZQhea/fs93wuEpqNfNk/xgCYsh1LUN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786954850; c=relaxed/simple;
	bh=5Bv9DWXKoe1rCy2VuILgNvXFcH8nqtMIfGBD86DCJpE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kF0zauedbfIuitrcI3TaJ50yfQUG+QI1DRI/TJlavrRxlw4SH0N5jMBE9WZdJP8Kc1iBdm5e1ixGyyEnCoSjDX1b2iXLteiaVxSydKuVPcAAXzEKUdmDH4HKsYUEesi6DG6xGOYB1aLn/DZhvFJOslLudpNg5remU0D66/8qPJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8421Jxf; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8421Jxf"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso30396145e9.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 01:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954846; x=1787559646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=Q8421Jxfi5nx3n9T4ZUKK2R8z7laLiExjoERH6JFekJsGttJPd5jFWAWW9hwDRQil5
         xgOIZpc5KlqwQ5JiVNrk2/c+IbxY/p0B/E6TscFxXAR3IqwBqWYMyocvAK7PIPQB4DnK
         u+2gkrEnkSeULure6sU7FyrO7Wfg19BBLzG1FhENSP4evtuHqlKnwMie49y9UpanWtCu
         mRRZeGP1tNVA4DQGGNamKCKydj8/+5PAhilWd86+vN5euwmHN2uRmHa9BwOtxaDi99wn
         PUmVTI6IOZrLXhYvEGRJ+29eROKUAsHiMtJ7Qybee4DUoVO/aJuyZ5dX3TjHDrSMWech
         fdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954846; x=1787559646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=iZNPz09tYyhRfFt8Y5tcoMvTpy8fgVMlq2aC09jYO9Tia0K78Unc0Vh2hLQnVs1nAm
         zQRRpq5skptmNj81tK+ov6NqzXUHi9boRQRna0R0Y121x7ndlqsErRw0SGvwm8ZcMuzs
         SVWN+fmRVw6b7BGSajRKw3BYhTI74UJmOnjoOqLlJhc4D1leMRPcpoAMx55SWgZTrxy3
         tR8rmCjTgyneaZdzfKIv92iOtfP0oJbx/CtGhPMLTrHWkB8/xCkUu8lWJZ0vD/3NbAZN
         pm2wkI2HGgFtUc6+B2zdSGugRv36KBXy0NznscGeZmOQIgh23fO2rXFV8ZtO0g0sd0ri
         TZMA==
X-Forwarded-Encrypted: i=1; AHgh+RqK3xnvhzpXOtRQ4lOXMgUUa1ZE+CODZYgyWEVz5vwiISe51YICZeuOQGqFcROFhJlITJHutNOVbTF8@vger.kernel.org
X-Gm-Message-State: AOJu0YwRu5CRUkQ1kSDGoGiuFAPBd9+O+sJ/Yrs+7R4FbztrD6DoSpou
	la6ySumxuN/RLr9Fb3BcgYH1qIhG8sDxtwnEz5/xiY3DsNrtXOUirIeI
X-Gm-Gg: AR+sD10SiJojYxIalSRPjYNZxSjy8TZh9r645SuwarYkFqgWHtmDvtRCMNm++Bs7v5O
	9WfBKgcGdV+S23ginpE3ExW2t+dIOpmJm+dMsJ3eIFowhN88C8l/Lp0nGJMvE+VLsoX377Ft1z9
	Q43rGkq+v0waiuIiNYEGy2KEty/axPGySJN7rTIJxmj4sOOkD6LdwBqskZOX4264sM0Bsw4XIqp
	NZDFADxqZbReAUc8wm//DnZ9LlVWoym15SUEH8Z9ZA87yez7qShmcQsxgvn5rpKaPT1yr+YX7T5
	8t6JfCMizxo+SGf9vZNC10oRsqCtWrq71O6eT9szMASOEM1sBKaT9NrcDQ5T1Zm4MyUhPs3bOwy
	QXWml9f883+Cvhg5QGnYR+z4ev/aNXSWdnHqzup6vYaDWjd9kThmauA/T3T6oKbLws1outohvDA
	QUdjr9QUEPwytuyDkSa1DrheWjzc9oD++4HnPJyyCe3aPT2w6rzIl6L9AcW9xKmCOJ5v3wB3BJw
	5stdVEVosRZHOKxwFScqXRwianoJiDZOFEbRHUsvQLV8x9cgUUoPVrE
X-Received: by 2002:a7b:c5ce:0:b0:499:726c:d658 with SMTP id 5b1f17b1804b1-499879bb9e5mr253882715e9.19.1786954846434;
        Mon, 17 Aug 2026 01:20:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v20 02/10] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Mon, 17 Aug 2026 10:20:23 +0200
Message-ID: <20260817082034.20326-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082034.20326-1-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
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
2.53.0

