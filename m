Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AB93BFACE
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 23:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787009475; cv=none; b=OWN0DysFJLtE738XABdZGvm7e0nOM7bIgn3pIIuiUQLjUVI86PnTh/58jKlVyuUqRK38Vq+dNULGhtXh5aw68VknxofIdNLQUmglpgfFw2wKSMumPFQnV0Gx55dzH1k7pdvIL+4SlI+wZ6l5GUXvy9iw+c97fZiq/VAzQf6X/b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787009475; c=relaxed/simple;
	bh=uxK4uK6F58gTD92q55TDAH7Y7hEu5efuQOkVRXatT2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gPtaU4sai1Fm0r//fBGJyjLOIPsSKdIZ+8iWCVbgOppwZFLcSoznt0cnyn54tZlcuzErWBs6OOLVpGUpzT7rX41NjJfbBBkvgCDe2Dv7DMgKdtWJtjMhq9GNybhr+kmZ8MucJagTfbAVEx4nIPnCI3hFzyAZMu++9NYYlH29gLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQsudWQA; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQsudWQA"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d319b84213so30705ad.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787009473; x=1787614273; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J21DS3wvKij2HOkZeCKqT2PDcAqZEa8RshPhJtL9/fQ=;
        b=ZQsudWQAVp+hFl086pg3I45XxZierlzSN36czisI8EgIyvGbaZ0of2l1VK1alN1ygy
         yFNvKxsUCdBBNGOT8W0BaomV+bL3rR3NboXcqouSKVb2q18+XAeA6evdoGzZccNa/xVK
         k3OBh4/dCjGYRxfM99waO41qakP68SzeXDp6me3jJQZCBaojb7Fcbb82VzBAN4HRpoct
         mlUbTxXmqd5FV/kb8IjmnKONevtPqV10KxOSCRZIJqoTzYotOjKbn4p1WGazEKcZ0HHI
         dHDEzQesVDbZ87/cKpwrIYX8GNzNpW/cPnM3tKNcI7G/+R3qfl7SPu3zxScDZ7yNbljH
         ShMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787009473; x=1787614273;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J21DS3wvKij2HOkZeCKqT2PDcAqZEa8RshPhJtL9/fQ=;
        b=VP4m7AWFwOR+2ODEzdu8RMwzrz7cBiF6JecemrT1NK1fOz2xvDzQbyVA9pfE4upJHu
         IURMtd818QrUQ2+iaXNZml+5KTXCqdP8qMK53zk4oYLcbTQtFt/0SRuh7lx5OpFC3e6v
         ZwtM3vLUKMdoZ6VNyTPL58glQuZqgwYjcf3ViJCcbYy/ZaRBJADrm5RF8aGWTG3GVuh4
         z/xtkRBx6OfNCU+Zs7rHR4maD4CzevxxAYKefd2nN2TV2bxiXAhQUa9RdGvFAD0XOPZe
         7mm6UzG65Z3eMs7uiuZdP+hraYVENvxy50/SFCyEP24bTMadVAd+3ULB9KM4fbjyH8Y5
         CsnQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWzZMx1EjwkKA1UuD6BbYCp4pjHMjy6QCAkOMt/XED73D91EYPGQW3k7sezifmONirNLHcCoJHXd+V@vger.kernel.org
X-Gm-Message-State: AOJu0YyB5sx+6zXgupkaf1MlQU6+Y4Teei2lN4zmKAjOsoxGkHEQ9LXC
	MRVRkFm8r1wrHqXN444HuPYu47KIrF8xa4SfxgsJzyFfhvNNEFaVmmOx
X-Gm-Gg: AR+sD13yWoUnpEn3sUSgZaWdL+/6Cl7Olwy5pL44IBYDlJ9mNGazYNtjGI719x/zD09
	an6ST6sO5rEmylwS0S3uR2Y0YxaAb650gBpFbYFE0w4BSAuNR52Q+cO7hryYrlVtUP58b4+i45L
	/BskKbJlo/Lr7onGcZjAoSBczfXhXt8rxi5g4xH2nn5BR3LbYHyz7vDkhMcGQMEaJZDvewt9p9Z
	mz1qpo7RDgOnMsJEMLEefdriFiiKjgOvltnDUF7B5NhsU3oFDMPJaKwtCIq6Qxq9zexSM0E51bL
	xtA7/P/EUtZglPJqFqDCwjShFY/xRHxQGmhg75/g/G/kb8waS/HatVjUyO3hvZHGawMFVu+AbYg
	SqjnXFhk43p6NF+523M7gCMYY15VOq14jcULQ8zuKoIpMljTsF5lK08BBkzuHbMg5I7d7nOBEZB
	bSUD/OCFGww0bHIZOPIvVw+LGX4L7fdRksRGgRd69KxLwVt2tOjfo4SQ6xaaDjgAVn7rL6AlMp
X-Received: by 2002:a17:902:f651:b0:2d0:2741:f31b with SMTP id d9443c01a7336-2d3b0edea85mr238361375ad.4.1787009473318;
        Mon, 17 Aug 2026 16:31:13 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:5059:ff4:37a1:58ab:e26e:9a52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326798c566asm10838796eec.11.2026.08.17.16.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 16:31:12 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 05:00:59 +0530
Subject: [PATCH v2] dt-bindings: net: ti,davinci-emac: Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ti-davinci-emac-v2-1-805736d99e65@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ7CIBBFr9LM2jGABlpX3sN0QWDaTiLUQEM0D
 XcXu3f5XvLf3yFTYspw63ZIVDjzGhuoUwdusXEmZN8YlFBa9NLgxuht4egYKViHhtxgJnL2eiF
 oq1eiid9H8TE2Xjhva/ocB0X+7P9WkShRKKVN7wetabjPwfLz7NYAY631C8heLLmuAAAA
X-Change-ID: 20260817-ti-davinci-emac-7ec97feca43e
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787009465; l=6210;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=uxK4uK6F58gTD92q55TDAH7Y7hEu5efuQOkVRXatT2k=;
 b=xhZaF1bucfdR0LI41YZmA0hIEsgsGH0+vUAVdeAmb2u6g9ACziuFu7g8s/vmyWbEwF+rh6/l7
 mPcg387n0vEA43ryOGTWJKvGM+1TnKt2ID4/yoaHUkXiBKVQawxQFLM
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments DaVinci EMAC binding from text to DT schema.

Changes from the original binding:
- Add clocks, clock-names, syscon, power-domains, and ti,hwmods
  properties that are used in existing DTS files but were undocumented.
- Disallow syscon and clock-names for ti,davinci-dm6467-emac since they
  are not applicable to that SoC.
- Allow 1-2 reg entries (DM816 uses two).
- Make clocks a required property as driver probe fails without it.
- Mark ti,hwmods as deprecated.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Remove original text binding that was left in v1
- Link to v1: https://lore.kernel.org/r/20260817-ti-davinci-emac-v1-1-022678d966e9@gmail.com
---
 .../devicetree/bindings/net/davinci_emac.txt       |  44 --------
 .../devicetree/bindings/net/ti,davinci-emac.yaml   | 113 +++++++++++++++++++++
 2 files changed, 113 insertions(+), 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/davinci_emac.txt b/Documentation/devicetree/bindings/net/davinci_emac.txt
deleted file mode 100644
index 5e3579e72e2d..000000000000
--- a/Documentation/devicetree/bindings/net/davinci_emac.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-* Texas Instruments Davinci EMAC
-
-This file provides information, what the device node
-for the davinci_emac interface contains.
-
-Required properties:
-- compatible: "ti,davinci-dm6467-emac", "ti,am3517-emac" or
-  "ti,dm816-emac"
-- reg: Offset and length of the register set for the device
-- ti,davinci-ctrl-reg-offset: offset to control register
-- ti,davinci-ctrl-mod-reg-offset: offset to control module register
-- ti,davinci-ctrl-ram-offset: offset to control module ram
-- ti,davinci-ctrl-ram-size: size of control module ram
-- interrupts: interrupt mapping for the davinci emac interrupts sources:
-              4 sources: <Receive Threshold Interrupt
-			  Receive Interrupt
-			  Transmit Interrupt
-			  Miscellaneous Interrupt>
-
-Optional properties:
-- phy-handle: See ethernet.txt file in the same directory.
-              If absent, davinci_emac driver defaults to 100/FULL.
-- ti,davinci-rmii-en: 1 byte, 1 means use RMII
-- ti,davinci-no-bd-ram: boolean, does EMAC have BD RAM?
-
-The MAC address will be determined using the optional properties
-defined in ethernet.txt.
-
-Example (enbw_cmc board):
-	eth0: emac@1e20000 {
-		compatible = "ti,davinci-dm6467-emac";
-		reg = <0x220000 0x4000>;
-		ti,davinci-ctrl-reg-offset = <0x3000>;
-		ti,davinci-ctrl-mod-reg-offset = <0x2000>;
-		ti,davinci-ctrl-ram-offset = <0>;
-		ti,davinci-ctrl-ram-size = <0x2000>;
-		local-mac-address = [ 00 00 00 00 00 00 ];
-		interrupts = <33
-				34
-				35
-				36
-				>;
-		interrupt-parent = <&intc>;
-	};
diff --git a/Documentation/devicetree/bindings/net/ti,davinci-emac.yaml b/Documentation/devicetree/bindings/net/ti,davinci-emac.yaml
new file mode 100644
index 000000000000..cb1394f6f2d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ti,davinci-emac.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ti,davinci-emac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DaVinci EMAC Ethernet Controller
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,davinci-dm6467-emac
+      - ti,am3517-emac
+      - ti,dm816-emac
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  interrupts:
+    items:
+      - description: Receive Threshold
+      - description: Receive
+      - description: Transmit
+      - description: Miscellaneous
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: ick
+
+  ti,davinci-ctrl-reg-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: offset to control register
+
+  ti,davinci-ctrl-mod-reg-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: offset to control module register
+
+  ti,davinci-ctrl-ram-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: offset to control module ram
+
+  ti,davinci-ctrl-ram-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: size of control module ram
+
+  ti,davinci-rmii-en:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: Set to 1 to enable RMII (Reduced MII) mode.
+
+  ti,davinci-no-bd-ram:
+    type: boolean
+    description:
+      Indicates that the EMAC does not have on-chip buffer descriptor RAM.
+
+  syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to a syscon node providing access to the System Control
+      Module (SCM) registers. Used on AM3517 and DM816x to read
+      factory-programmed MAC addresses from eFuse registers.
+
+  ti,hwmods:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: TI hwmod name
+    deprecated: true
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ti,davinci-ctrl-reg-offset
+  - ti,davinci-ctrl-mod-reg-offset
+  - ti,davinci-ctrl-ram-offset
+  - ti,davinci-ctrl-ram-size
+  - clocks
+
+allOf:
+  - $ref: ethernet-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,davinci-dm6467-emac
+    then:
+      properties:
+        syscon: false
+        clock-names: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet@220000 {
+        compatible = "ti,davinci-dm6467-emac";
+        reg = <0x220000 0x4000>;
+        ti,davinci-ctrl-reg-offset = <0x3000>;
+        ti,davinci-ctrl-mod-reg-offset = <0x2000>;
+        ti,davinci-ctrl-ram-offset = <0>;
+        ti,davinci-ctrl-ram-size = <0x2000>;
+        local-mac-address = [ 00 00 00 00 00 00 ];
+        interrupts = <33>, <34>, <35>, <36>;
+        clocks = <&psc1 5>;
+        power-domains = <&psc1 5>;
+    };

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260817-ti-davinci-emac-7ec97feca43e

Best regards,
-- 
Bhargav

