Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2713ED109
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 08:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785920150; cv=none; b=u163/01FZPV7NNdfs0Itctn/oAj23kmK7Ec+S8RgPGg5FFPxj130UD3AhpsO1lMgBY+XvE/usUMCppMSloY+cbpcbuMoPpOS2J9sq3J8b/fTAoqxY2cCL20i+H3n0SMssoqhI9+9aZcJ6ZbWonviZ+SeeZa2y28K+tNBroijX8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785920150; c=relaxed/simple;
	bh=O872SQ79TPMDbksJwVaEBXDu7e4HtwncX9MRzGeVkKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jHuO8y/3my5WAY6sh/+5kBF03i7zh1yfvpwR3t7V92NmMWK1qoSpMyW87N9UBlwoCWWiQcYDGKIOz0rk8tWVr9ITkygr5Ca0GIsHUjw+FANpaMSDVhJEv0dCYRIRSSvsNhHOicz+37YoANxwFi02WQ1HFdtb4SWRGlG/LS+YTfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZ3ZeiUr; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZ3ZeiUr"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c9a3acd40so6189291fa.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 01:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785920147; x=1786524947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=atrTTnzv9w0bdiLK/lrbhOGNem1ngbHriUvHl3btaxg=;
        b=aZ3ZeiUrNaiB4Ao6BCd0nndUxmqM3kET782Q7QWSDPuoyPfYJAUsKqd3tRPov2stAr
         IIMVWMcIeDtyBoWMZ0WAgRx20NafsI5MfPY6YH3LgV99CFXwGSwjB5QSxSYVqYakjAlz
         nueQp2maFuXBuWr+kOCrPyD3oGfLsh5CL3S3JAspsHQaE9eEngMgdKnr1+clL4cWWDKb
         Z0oA+8wMFf6YcKNEJvTAB8UZNN7rBQ6PGjjfRJUj+32yN3N85Gv5CNUCmB9aApToj5nD
         KSu9SGZAqDyTXZ3yBjvrtgUktImMaQH32BjDH55kKmlA+FY4Utm8h28cSfAfS9SKTMBe
         QtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920147; x=1786524947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=atrTTnzv9w0bdiLK/lrbhOGNem1ngbHriUvHl3btaxg=;
        b=BbKUN45XK6w3XNTdKJ7fI9+G8Cq0zTh4A5qgT+3pRmq23XR9fhQrSNKoafGGQi+fJ5
         VAhO//w6bYb5XO/+SkXuqjOB7EjAtvj7hhK7j+8x601zFXspWVmCVkb2RTH2h2bjvUqD
         CA8BDVcBfwJoqXKfR0bUlk3/KSeX4ul7kdwRyuGhnEn87nSSv9TVxIh7FnvwVGh4UV2a
         zWsN8lVpjo4h1jeLnIemNjIDmo4WrIC1pKBHI1zMRaTHdJ7/t8hzOya57a0QYxRHy/gI
         t+3s9T+Fg/I8o0SKQ+lBV8ZdYoOr8E/QrbMGzGLdlq5r5KNht/cp+S8jwat/SpTVhT6S
         085A==
X-Forwarded-Encrypted: i=1; AHgh+Ro6rtENSq7DDrjuXW/x6S2m7+h2w9dJSumArtJqsZpftxi2mulH8JSg76uTbpXSmEEvPsZOCRhK256C@vger.kernel.org
X-Gm-Message-State: AOJu0YyOZCBY+UhWkvmm0qS+ly1QiyTsP6kS3uax6jQEHNFn0E8fvF8w
	k5SL0U4PbNrH9VIb76ZP7yVyR1f4vCxqG54zed86lZq79OgKwCoraIkE
X-Gm-Gg: AR+sD12k1SLkHlzpsnhK/kT9I2daFrhvcyMGaQzowsPssZI/uGDmvUDlxfMpNYxhlcf
	d1E+KeUor7SrUfr1iFRR3P9iugJlu77Ergclt2jp0t9LqLYLRm0Pk8CwThPkZPZqt/fsMTtfNkt
	QlmP6HPoZT88BYrRrFDw4na2mI1yAA2LatDLk4t1YfYpUgd8bI0ICK5YbrSwL/3a0PUWndPqU+m
	9Dv1/ZkRVx/BG9d0ddPBaQTMTXLXqka+l6XXweSUw27WR8WrDVAWxlI+U3opdeaPiDe8X2ykPg0
	0C09W9zIabbCVGIAHKn4Wad8p10BPn7ZMz05l+TBNfTPmI/Y+h0YdpiVfSDsba464NoCM/bpON3
	y11IWieNFcUpxxK4AeBBk/E1+Ml5T12onZ+UOOk7xS2HdMNyZLqVWzYn71DW6yN7NwcDtY+BydP
	a7p6J7GatRo71ySptRB1l/FqSFnSsI9ySWQEs4rg2RLE45Wn9WtO7Au+z2V46z7XrriloGfBze
X-Received: by 2002:a05:651c:515:b0:39c:628c:15ec with SMTP id 38308e7fff4ca-39fbb20370cmr5409241fa.23.1785920146437;
        Wed, 05 Aug 2026 01:55:46 -0700 (PDT)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fb9a152aasm7470471fa.21.2026.08.05.01.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 01:55:46 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH net-next v6 2/3] dt-bindings: net: add DAPU Telecom DAP8211R(I) PHY binding
Date: Wed,  5 Aug 2026 11:55:39 +0300
Message-ID: <20260805085540.452260-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805085540.452260-1-a.shimko.dev@gmail.com>
References: <20260805085540.452260-1-a.shimko.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for the DAPU Telecom DAP8211R(I)
Gigabit Ethernet PHY.

The PHY supports TX and RX clock delays in 150 ps steps from 0 to 2250 ps,
with a default of 1950 ps if not specified.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 .../bindings/net/dptel,dap8211r.yaml          | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dptel,dap8211r.yaml

diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
new file mode 100644
index 000000000000..4cd0f9730d95
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dptel,dap8211r.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY
+
+maintainers:
+  - Artem Shimko <a.shimko.dev@gmail.com>
+
+description: |
+  The DAP8211R(I) is a Gigabit Ethernet PHY with RGMII interface,
+  supporting IEEE 802.3az Energy Efficient Ethernet, IEEE 1588 SyncE,
+  and an internal packet generator for diagnostics.
+
+  Specifications:
+    - 10BASE-Te, 100BASE-TX, 1000BASE-T
+    - RGMII with configurable TX/RX clock delays (150 ps steps, 0-2250 ps)
+    - IEEE 802.3az-2010 Energy Efficient Ethernet
+    - IEEE 1588 SyncE support
+    - Internal packet generator and checker for link diagnostics
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+properties:
+  compatible:
+    const: ethernet-phy-id0008.011b
+
+  reg:
+    maxItems: 1
+
+  rx-internal-delay-ps:
+    description:
+      RGMII RX clock delay in picoseconds (0 to maximum).
+    multipleOf: 150
+    maximum: 2250
+    default: 1950
+
+  tx-internal-delay-ps:
+    description:
+      RGMII TX clock delay in picoseconds (0 to maximum).
+    multipleOf: 150
+    maximum: 2250
+    default: 1950
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
+            compatible = "ethernet-phy-id0008.011b";
+            reg = <1>;
+            rx-internal-delay-ps = <1950>;
+            tx-internal-delay-ps = <1950>;
+        };
+    };
-- 
2.43.0

