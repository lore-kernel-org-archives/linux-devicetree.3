Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74876331A65
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 03:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780630692; cv=none; b=alwriA++j1GRBsxpYRx2jdLSUdfOfLPAV5A9dkI7IfRkXJhLwjmb1o0sIgafPKrCzebRmldNVj1cXjVksnEnytXnAA7dMOIhRE4cJ28TV7wO7Z82K/KblEqCr5xXueM6a35cvVUEWaVS/h+C9Ehu3JTUGYbIQyUR8jrA8GrzkNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780630692; c=relaxed/simple;
	bh=+PbYhdRSuJStSC7hTF2N+zY+HU2mm7UtIulC+oo5/SE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JZf7YAFzKUv20y3DZ5r22e4TiBOXrMtewZAjGKZ/tBfJmVZ5U1CaAaKmlTtkeSF7iM8ts1tE/NDpnzf6pS4bUPrR4iIRXVDObbTWPL1TdoPO+DDIvsmSdjUaa1U/BCrOce92MwUKT/t5SNNZe0TP+SLnBvWeHss8B5C33sgYz3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRF3FcJU; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRF3FcJU"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36ba6f6e7b2so151740a91.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 20:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780630690; x=1781235490; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XDawZSTAUDtjH9zUsD9tVwMkrSKG0sdB62i/ZMoTAq8=;
        b=dRF3FcJUEs/Z2M5Y/TxkWgRx/upYeFWpVou66wMgwkdfCyilDFtWy4p650l4s0J5Oa
         OZmMr93HE7lZK+AwYYYLl/j7h3yfxvAGGD2l7P9zfyyJvFASDbe6XRxny9ZRSR58gL5L
         tCQRvwSo7GFvL0NuSAFZ8rpreDFTbjXpW7/02tEqJ+fxMP4e9KMstHkfrrnEnyfOPsfc
         gXeRP5MijjhvgeBJ0O12+AH9Wh0lBHzxpIZWrM7Y6Ni7kQG6QSwVGt00H65G4pM4W1dE
         KIRt7TbblpJ/FPoDzwIB0KEj2ofcC4xtVYSEMrrwmFRmpHdi+mzkFmQ0/ntkmdNwiM/e
         389A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630690; x=1781235490;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDawZSTAUDtjH9zUsD9tVwMkrSKG0sdB62i/ZMoTAq8=;
        b=oHyOeLqBoaACiWMS4kj9AcM3M5/HwxzHkdaKNvQMg/JTGc8/RCv6KGvJd2+ZBAtDVB
         wRxOHojjf9QR0J+i4KTczwmiermxSF115nvzLOHOg89CC5ubECzOPW9O2OgdYMG4RsWt
         h06T5T9Fc80Nb21AaDSSwqroipS+imRFAtJ3RIxyGIpWsuxeHpi0vdcBcMaWRLpsZTrf
         jmuTWNLn3hojJynpToD2ThLH8yUhPFn82PeE5H+844j/UwxC3OwbciibY4It4yzzgpek
         eayW+lagwJSC/CTamCrrlCfTTZFp1Fjewf59jvD0WH1oUOYegHxk4qynf9ltNs6A8Bhi
         vvbg==
X-Gm-Message-State: AOJu0YweKxJGo7f0ornm3ABoyV9pKAlvTqvH0rBF0m09BiMu9tYRDkvT
	sTPWdYLAw9ACU4YK/dKMVCLMlobU5RGSBaSgTWDkynLyyUbxAsFTaBc1
X-Gm-Gg: Acq92OGYHgGbjk0/kIIlC+1iCFJsLf4D3kDxIRAiurXs6SMH+IEy6FSvSammUnh5KFJ
	7wafxlyUjyKZ44m2pZ4pLDR2+VrYWFl6ErwDMI3XjTCXzMRfKegLNCrl3ulTvGsvoe3nm3Ucunk
	kZQXhdrXdR53QLClm6GQbMSv3/NnuBEaW6BmsIQL3y7bf27MaX91Y7gS5DRCm+BXCVMB8r2+Dzf
	Nsc8T7aCs1oKtxHWjAUdHsMZ2G9bH3bqL3bEjSjaZo8ZVFs9ukGSa7Qam0+eMR76k+cm6h8dWVB
	AI7Kc8zm0WttxlNqM6cLNbdfpIc3/UlCSOxtEcvqb+Fnu7oKYMajzlB0SlErLQfq7C2b5yd6Dnx
	kjX95/vT5iIAERdmW5W7aDq5z+PmSkg4Hja2WXcTQUWOFzXsgq7Th/opWYmNFhTQ+x7WC8TYQgV
	sP9aHgNHx6nEj8sVfAZSA/DuPlMVRJOAEZ5j3ohWcGgQ==
X-Received: by 2002:a17:90b:2708:b0:368:f0a:1c49 with SMTP id 98e67ed59e1d1-370ebdfd031mr912921a91.0.1780630689640;
        Thu, 04 Jun 2026 20:38:09 -0700 (PDT)
Received: from [192.168.1.3] ([2401:4900:881c:fcf3:fa0a:b29:525b:eb84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf8284dsm5750210a91.4.2026.06.04.20.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:38:09 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 05 Jun 2026 09:07:26 +0530
Subject: [PATCH v2] dt-bindings: soc: ti,omap-dmm: Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-ti-omap-dmm-v2-1-1b460742ec83@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNyw6CMBBFf4XM2jFtwZq64j8MCyxTGGMpaZFoC
 P8uj5XLk5x77gyJIlOCWzZDpIkTh34FdcrAdnXfEnKzMiihtLjkAkfG4OsBG+/RXgutjRPCOgX
 rYojk+LPX7tXB6f14kh23xGZ0nMYQv/vdJDfvKGuR/5UniRLJFUbaQhvTmLL1Nb/ONniolmX5A
 Wos8OW4AAAA
X-Change-ID: 20260530-ti-omap-dmm-c74669f00cf2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780630685; l=3898;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=+PbYhdRSuJStSC7hTF2N+zY+HU2mm7UtIulC+oo5/SE=;
 b=BwDlf+/fn1cugVk/jMAHQEEz/OX8dWV70BIvEXwcfxVhUJEduliacjh00WJUF6JVo9K8pajoF
 4p+F12zIoKcDLDbRGAJmyMjLV2myGFL/AxakijMSWsAKw7CpHEtYL5X
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI OMAP Dynamic Memory Manager (DMM) dt binding
from text format to DT schema.

During conversion following changes were made:
- Move file from /bindings/arm/omap to /bindings/soc/ti/
- Make the 'ti,hwmods' property optional and mark it deprecated as it is
  no longer used, it is kept to support legacy dtbs.
- Add the missing required property 'interrupts' to example node.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Move the binding from /bindings/arm/omap to /bindings/soc/ti/
- Link to v1: https://patch.msgid.link/20260603-ti-omap-dmm-v1-1-ef491c4699d9@gmail.com
---
 Documentation/devicetree/bindings/arm/omap/dmm.txt | 22 ---------
 .../devicetree/bindings/soc/ti/ti,omap-dmm.yaml    | 53 ++++++++++++++++++++++
 2 files changed, 53 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/omap/dmm.txt b/Documentation/devicetree/bindings/arm/omap/dmm.txt
deleted file mode 100644
index 8bd6d0a238a8..000000000000
--- a/Documentation/devicetree/bindings/arm/omap/dmm.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-OMAP Dynamic Memory Manager (DMM) bindings
-
-The dynamic memory manager (DMM) is a module located immediately in front of the
-SDRAM controllers (called EMIFs on OMAP). DMM manages various aspects of memory
-accesses such as priority generation amongst initiators, configuration of SDRAM
-interleaving, optimizing transfer of 2D block objects, and provide MMU-like page
-translation for initiators which need contiguous dma bus addresses.
-
-Required properties:
-- compatible:	Should contain "ti,omap4-dmm" for OMAP4 family
-		Should contain "ti,omap5-dmm" for OMAP5 and DRA7x family
-- reg:		Contains DMM register address range (base address and length)
-- interrupts:	Should contain an interrupt-specifier for DMM_IRQ.
-- ti,hwmods:	Name of the hwmod associated to DMM, which is typically "dmm"
-
-Example:
-
-dmm@4e000000 {
-	compatible = "ti,omap4-dmm";
-	reg = <0x4e000000 0x800>;
-	ti,hwmods = "dmm";
-};
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,omap-dmm.yaml b/Documentation/devicetree/bindings/soc/ti/ti,omap-dmm.yaml
new file mode 100644
index 000000000000..1a2b627cd206
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/ti/ti,omap-dmm.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/ti/ti,omap-dmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OMAP Dynamic Memory Manager (DMM)
+
+maintainers:
+  - Bhargav Joshi <j.bhargav.u@gmail.com>
+
+description:
+  The dynamic memory manager (DMM) is a module located immediately in front of
+  the SDRAM controllers (called EMIFs on OMAP). DMM manages various aspects of
+  memory accesses such as priority generation amongst initiators, configuration
+  of SDRAM interleaving, optimizing transfer of 2D block objects, and provide
+  MMU-like page translation for initiators which need contiguous dma bus
+  addresses.
+
+properties:
+  compatible:
+    enum:
+      - ti,omap4-dmm
+      - ti,omap5-dmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ti,hwmods:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Name of the hwmod associated to DMM, which is typically "dmm"
+    deprecated: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dmm@4e000000 {
+      compatible = "ti,omap4-dmm";
+      reg = <0x4e000000 0x800>;
+      interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+      ti,hwmods = "dmm";
+    };

---
base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
change-id: 20260530-ti-omap-dmm-c74669f00cf2

Best regards,
--  
Bhargav

