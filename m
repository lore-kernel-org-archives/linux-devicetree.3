Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8660234DCC7
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 05:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787981161; cv=none; b=FfEZ3A+NHKQiaenlxp7xfjIsypd7vReCS9xGKCdUY5yLu3UGxG8BJFkaTQNOnawXXR9+p+wUdIA2D3hkVaU2EzCNVztY6GWpicpAWQW/WRbmKOcnwRB+PdzlmRUpBFsFQ+XmAE+fDuPNIF4HVgpeasNgSUHfAu9LW5s10KdbzIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787981161; c=relaxed/simple;
	bh=6smDZg6FX3ydlxDcUe1XoFlk/nAtSbiRQRH7DWbaBw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXphwm4YStloqNkKbdBYz5vuJdDIiL4oAWtCEHCv/5ec+0F1w4D4saL4fpqpbWHBq+MYFBOX3YE96iRJ6GV3/0/31gGlyLX8ZoeEE2sod25FCLnZNwUiJXN2u1N7pXeUnGngwgS68fmZZMzA2GtVsWkHTWkyaRWCww6NsFJwxRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=ehErYBPh; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="ehErYBPh"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1c52d920b8so209351466b.2
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 22:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787981155; x=1788585955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3HUI19LAi4NPu5wR+/Bmyr8Ia2vgCBzo9Z3ziBwtkg=;
        b=ehErYBPh/TNr/8vuROvsNKoZWiO8vlljLdNuSW/jHczAgqsKWlAr7K5DvV22orT/nY
         74kri//oT3NRijcDqmvxDIezOcxmLYmg8xWP9I1EUcjmQ3VXGb2qqWXyL1VHtxR0EPkG
         g0NiOhbUTV2mmgx451GVmVFcmjuThKHsbwOP7a4PcoXVAeeLlFoAksifx7NiNrglS9Vz
         5UJ5q65Em2Hqb3rTNPMyLqyCW9IuOpAnDzMXWvp6gnUE451zjMw4ic24CJYkwF5WgE3n
         Rg8OuPrrK2IlAZfUo/+V9LWcq5k621QscWMsQZp2T1EzJnmHo1+SeQ57/u8eTwkTHMn/
         nZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787981155; x=1788585955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G3HUI19LAi4NPu5wR+/Bmyr8Ia2vgCBzo9Z3ziBwtkg=;
        b=PNHEI+qe7/aM2dK5DkyG6MrFFjOF7644V1Y3AdzKFBPAYyZhlfGuRyyyQtdV/0xibC
         /uvPuHOaG0X+0Q0IRoUOIn7QEu/YUk4pU6c1gavGwSjsPdUMsVPwgtmOs6k7fPqfyN70
         40nf/h1WtSabbK4QwQmICn1D2cT5u0hhgzDls5GKtN6PWvlVsTu0oAfR1tZE4bb0wbws
         NiMxP283qARDy76neBH2duPUBe2WwyYMjplhk8keXFgnpiX25t1GfPfpNNUz+TXx74RD
         5ZkbACr5QC+hlWzqFd9zHA29xAsL7nlm7aEgOgAUri9fsnpmcX4xhv1c+XLSshnB8zEe
         dNGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTQZ7WZOeFG2Mbw5kXfMptND9O6I6eeKTE6LWZ08mpPXklNlumxmwlHvOaENG10/ATPRWK9a+Nu6AN@vger.kernel.org
X-Gm-Message-State: AFuF++keZnE+sJCoheGzgPu8f/G6kuImCXQB9GO/+uo0WzEH/VaBFTb5
	J+rNR4bS2F+2jZ+m+ghTpj72Vrv8+wolko0h5QDYUPZoHx5PydJtyQp5m4RKTVMH+F8=
X-Gm-Gg: AYBFou37yKmczfUScbaJgOnO96pEHIQr59KsQdq7vhMNK6t4zBxR03bI3IR4leaxncU
	Je7fHz5kdSpmzoaJy2/ZkAF3KSpxmsD9kw+ZIT02gWROh8dasXdET6ROUnykNSMrRJV6OrwEZJU
	Jcnl5+ObyJjmTMVhXnXStkrXD21TMn6Y7TlF3vjxWFl0ticGvo2F1Ossj5jmQblIUIi4iH1yZSh
	4lPGPzO8kBPFv3gkwh2r1/vW0SBNBAzn5yCGDuCT2/qQoHyVZeNDLLixO+aXNntLW/uoyvlb4PL
	QdIUQD4Kwkrsck05gfHBSv+hwKNPM5eDS/A8Y/Flv1Ojz0LYxpZytOMQ30fy3BWt4voRmtlq542
	+MnJLqBciSsy/baLPvXPhPLqw9bdVNIvd83wycM7YzymIirVkB45UxsfgweysRGw+Mw4RuxGkvw
	EQCGdPJWV97ubP4II79Evvu09gQkKFjA0cgH0fBDJCkA==
X-Received: by 2002:a17:906:c145:b0:c24:bf0b:6b62 with SMTP id a640c23a62f3a-c2556baeae6mr819278466b.4.1787981155025;
        Fri, 28 Aug 2026 22:25:55 -0700 (PDT)
Received: from remote-01 ([45.85.105.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee75a36sm163750666b.28.2026.08.28.22.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 22:25:54 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next 1/9] dt-bindings: net: add Airoha EN8811H PHY MCU
Date: Sat, 29 Aug 2026 05:25:38 +0000
Message-ID: <20260829052546.1152446-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829052546.1152446-1-f@lex.la>
References: <20260829052546.1152446-1-f@lex.la>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EN8811H answers its PHY ID from power-on, but a link is only
possible once its MD32 MCU runs firmware that the host loads over
MDIO into volatile RAM. On systems that keep the firmware files in
a filesystem, the files arrive long after the MDIO bus was scanned,
and the PHY node alone cannot express that gap.

Describe the MCU as an MDIO device of its own, with the PHY node on
a child bus underneath it. The device downloads the firmware when
the files appear, or adopts firmware the bootloader left running,
and registers the child bus only then, so the PHY never becomes
visible before the chip can serve it.

The reset line belongs to this node, not to the PHY node: firmware
lives in volatile RAM, so reset may be asserted only while the MCU
is not executing it. On a PHY node the line would be pulsed by
every phy_detach() and wipe the running firmware.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 .../bindings/net/airoha,en8811h-mcu.yaml      | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml b/Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml
new file mode 100644
index 000000000000..b51a14a3b7b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,en8811h-mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha EN8811H PHY MCU
+
+maintainers:
+  - Aleksei Sviridkin <f@lex.la>
+
+description: |
+  The Airoha EN8811H 2.5G PHY is driven by an MD32 MCU that executes
+  firmware loaded over MDIO into volatile RAM. Until that firmware runs,
+  the chip answers its PHY ID but cannot bring up a link, and the
+  firmware files may live on a filesystem that is not yet mounted when
+  the MDIO bus is scanned.
+
+  This node describes the MCU as an MDIO device in its own right. The
+  driver downloads the firmware once the files become available (or
+  detects firmware already left running by the bootloader) and only
+  then registers the child MDIO bus, so the PHY node below never
+  becomes visible before the chip is able to serve it.
+
+  The reset line is owned by this node rather than by the PHY node:
+  the MD32 keeps its firmware only in volatile RAM, so the reset may
+  be asserted only while the MCU is not executing firmware. A PHY-node
+  reset would be pulsed by phy_detach() on every unbind and wipe the
+  running firmware.
+
+properties:
+  compatible:
+    const: airoha,en8811h-mcu
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  reset-assert-us: true
+
+  reset-deassert-us: true
+
+  mdio:
+    $ref: mdio.yaml#
+    unevaluatedProperties: false
+    description:
+      The child bus holding the PHY itself, at the same address the
+      chip answers on the parent bus.
+
+required:
+  - compatible
+  - reg
+  - mdio
+
+additionalProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-mcu@d {
+            compatible = "airoha,en8811h-mcu";
+            reg = <0xd>;
+            reset-gpios = <&pio 14 1>;
+            reset-assert-us = <10000>;
+            reset-deassert-us = <20000>;
+
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                ethernet-phy@d {
+                    compatible = "ethernet-phy-id03a2.a411";
+                    reg = <0xd>;
+                    interrupts-extended = <&pio 15 8>;
+                };
+            };
+        };
+    };
-- 
2.53.0

