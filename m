Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54714BCAD9
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 18:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005665; cv=none; b=cLjk0a9YYqSnC+jyQt73E3rhemz/wBMN26k+ssPgE3fSsCBOQMckbe1UqmXo4k9Q+lD6sOitM8dL+WCyzBlf5M2xEo2Vten1GWog54eZ4VQCSQjjgBTfmOFehoKKO7HDxSRYP1v33OWA6lVPhT7iNI7FoQPd0Jf0YomapilmUMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005665; c=relaxed/simple;
	bh=57tf4IVtaTKf4rXMfOx1/pGq9M7TpHDLMd/27uedaeM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GwnXce4f5wSTRRrpn7MfDgxprPWxvH1KxyVlH6q8c7NRBcHPs4Ak/ZWFs7zIi2P97PsP9wx2rkXAWJov5ytyCpWrWeJ8DGB9V67UsvYB93NatQL2iwyFTrVpvbAVvqbIDC10DSq9fnPKLeuD0x5UnNY9Olfsis05xerGOVxCdJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sZKoLAeu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sZKoLAeu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ad135063so53095175e9.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 11:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005661; x=1778610461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2x1A+JAuzDdUiINu53XK8eGzEAE0up6CyLUPQxC/1W0=;
        b=sZKoLAeuz9TEXFLLGkonngja3pwPlrdVg8MXT/+kpHdMEpJ+Nchf+LZShzfT/DgpCT
         UmrAB2rYTsWR2lJJd1/8QZ2Pp5DojqzKYQJ6VxGvbSO+m4TeLLjvnZNq+2UIoXzbsJH0
         mAlNzCJIzeg5r7FmDgRiRvEt8MP9036h6k/SDDan10EyMOen5UxKHYJwtpZig1qdw4ea
         ZCxr1c1+Tl1w7nZ/xVl9Mic1JrtW12eX5/3cI+MJeviRvusqEyMP9aeWKvMiCnlSJNG8
         69jmQv4GXDuE+hQOREdDnQXWrNqArAMq9Qfd7xvBpj90F2/6MZBB9TYB7IFl7F/k+f8M
         p9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005661; x=1778610461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2x1A+JAuzDdUiINu53XK8eGzEAE0up6CyLUPQxC/1W0=;
        b=myrRNRPXmRfnculpTEo6PfPqcmxIBPPanyRG0Px5aXapYsrLJRP6RKKBAvVpTu7Vxj
         Lu++DTS60+mzFXqhmMyMEan+gWVSTsHdPnCuUGpUot1svxzh3Mjd1DQL5eAEtYXq0Np7
         UaTEV4Hf/tBodA5K9cqWYIYwkn/LTxNki7VVJE3c9NwBMWGbhfCYMDE4R1eAkn73bvIK
         QyVJVHI0tAVXMhcxZqlwVDmo5u5nHgTPaGyZ7jRSLKB6F4GioK395mbFN9Z+dBDoPyaM
         nZCIa3HJ611UZb4tkyLwRkLcvdjnzbGHSfcwCNdtzsRACFz7a9OBkk0R9v7//yEzTdd+
         FyLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oOSFCO01FGu7vBPevPJ2jjyjTpzNG78PJQvj2iUuRT3sGS7cYDcm6LLLVnZuNe3jPOlhhdGKRjk+W@vger.kernel.org
X-Gm-Message-State: AOJu0YyOH6mIjH/qaJQFN0PCdXkxGOtf/DU0nS/JyC6dOkW38G8EXc3N
	fTSFWzaiwnRYEIjRRVkRNhWzzG9zWtyehldefvPcL96l+8kdSEYiclmZ
X-Gm-Gg: AeBDietV70rXXxPw7t43K4jzxfAjh/I4hmnN1l8hYiZMxZPHaD+95sZqZPx/ydq3Rdk
	f6/y9hFzCbiAS+0Zwuy92Y/VazALYCcuowuPkaCOSMWj1nihvFVYx/xMcEZaV9LjDSirtZUkFjq
	Q7/8OiFo1r+a23vV7i2/wWfWqd7frgx6HFAzj/ywMajIFd1zWMHZCW6sIfG3KVl0E9aULWZqgbe
	OizQMQDfebd3Pz9wQXmW9khQ1RIIUjweRw+wBiiJ+bg1P7ZqFnoU5N/KC0n7x9b0sMtGa/Q5Abe
	8pU+ecKlVrpt3As2TKZRc68owsonhWjjjxI4NI2fZvFzY+L04YgWViUvMocx4P47IGCz3P++C5m
	2+f9ZzlynOnRkXxjiAJyqN61h1ZWqv10VBObRJaykrowcPEeVEPtQ+wlxTE3qdGyeoYGcPmSmHZ
	cKXWUHELk60qyshdwEr23iXtPwHmCX67xg/WI+ypYjSQDPm6rFA3JOg+IKj2ogbhaBDvURed/r/
	S7bW55cZqpOAG6iKQ==
X-Received: by 2002:a05:600c:1e8a:b0:488:fd7e:1063 with SMTP id 5b1f17b1804b1-48e51f4cdcdmr5427305e9.29.1778005661133;
        Tue, 05 May 2026 11:27:41 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:40 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next RFC PATCH v5 08/10] dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
Date: Tue,  5 May 2026 20:27:09 +0200
Message-ID: <20260505182713.27644-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505182713.27644-1-ansuelsmth@gmail.com>
References: <20260505182713.27644-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha Ethernet PCS for AN7581 SoC.

Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
the various Serdes port supporting different Media Independent Interface
(10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).

This follow the new PCS provider with the use of #pcs-cells property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/net/pcs/airoha,pcs.yaml          | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
new file mode 100644
index 000000000000..8bcf7757c728
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/airoha,pcs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha Ethernet PCS and Serdes
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
+  the various Serdes port supporting different Media Independent Interface
+  (10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).
+
+properties:
+  compatible:
+    enum:
+      - airoha,an7581-pcs-eth
+      - airoha,an7581-pcs-pon
+
+  reg:
+    items:
+      - description: XFI MAC reg
+      - description: HSGMII AN reg
+      - description: HSGMII PCS reg
+      - description: MULTI SGMII reg
+      - description: USXGMII reg
+      - description: HSGMII rate adaption reg
+      - description: XFI Analog register
+      - description: XFI PMA (Physical Medium Attachment) register
+
+  reg-names:
+    items:
+      - const: xfi_mac
+      - const: hsgmii_an
+      - const: hsgmii_pcs
+      - const: multi_sgmii
+      - const: usxgmii
+      - const: hsgmii_rate_adp
+      - const: xfi_ana
+      - const: xfi_pma
+
+  resets:
+    items:
+      - description: MAC reset
+      - description: PHY reset
+
+  reset-names:
+    items:
+      - const: mac
+      - const: phy
+
+  "#pcs-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - resets
+  - reset-names
+  - "#pcs-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
+
+    pcs@1fa08000 {
+        compatible = "airoha,an7581-pcs-pon";
+        reg = <0x1fa08000 0x1000>,
+              <0x1fa80000 0x60>,
+              <0x1fa80a00 0x164>,
+              <0x1fa84000 0x450>,
+              <0x1fa85900 0x338>,
+              <0x1fa86000 0x300>,
+              <0x1fa8a000 0x1000>,
+              <0x1fa8b000 0x1000>;
+        reg-names = "xfi_mac", "hsgmii_an", "hsgmii_pcs",
+                    "multi_sgmii", "usxgmii",
+                    "hsgmii_rate_adp", "xfi_ana", "xfi_pma";
+
+        resets = <&scuclk EN7581_XPON_MAC_RST>,
+                 <&scuclk EN7581_XPON_PHY_RST>;
+        reset-names = "mac", "phy";
+
+        #pcs-cells = <0>;
+    };
+
+    pcs@1fa09000 {
+        compatible = "airoha,an7581-pcs-eth";
+        reg = <0x1fa09000 0x1000>,
+              <0x1fa70000 0x60>,
+              <0x1fa70a00 0x164>,
+              <0x1fa74000 0x450>,
+              <0x1fa75900 0x338>,
+              <0x1fa76000 0x300>,
+              <0x1fa7a000 0x1000>,
+              <0x1fa7b000 0x1000>;
+        reg-names = "xfi_mac", "hsgmii_an", "hsgmii_pcs",
+                    "multi_sgmii", "usxgmii",
+                    "hsgmii_rate_adp", "xfi_ana", "xfi_pma";
+
+        resets = <&scuclk EN7581_XSI_MAC_RST>,
+                 <&scuclk EN7581_XSI_PHY_RST>;
+        reset-names = "mac", "phy";
+
+        #pcs-cells = <0>;
+    };
-- 
2.53.0

