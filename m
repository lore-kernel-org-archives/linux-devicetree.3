Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243883932FF
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 21:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788643740; cv=none; b=N6AiMbo62FNMb5mhiGogS7xO7pdja872+EyH3tmoLPFqdsKlnfWBpXewaG+ZbVKOf1SL9GfY042waJCcXAr9rtNrawKd2kXJuN8rUsCBqyVqkHgOgd2JsfyYT/84WGZecqFuSYwCOO6y4eW2p6UcorDn+XC4zAt6FjpSy1Mzouk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788643740; c=relaxed/simple;
	bh=zZcooq33uZAZQsOxsxxaLl9Ssx8OZWzyF/mi8o6rC90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AWC9LQ1+llMc0ETPoPNT4NzqLyz+joKxEPjDmCWOl1bzroBOVr2yJKvjHpPW5/JDxIu3zmg+0JrrTjCsg177xwGQaheECRYVRDt8b/F1qSNfDfyR6HzQvXD88BZA863xPyr95AK++Q60XKsb3LVjI2Q7kUL66/Wzb4fX/C58AE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJ12gHru; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJ12gHru"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed441so379126a91.2
        for <devicetree@vger.kernel.org>; Sat, 05 Sep 2026 14:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788643736; x=1789248536; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nP3HrG62D1qDUWuEvN890ASEF32RGoYVJYmZpTUHaXc=;
        b=TJ12gHruvRc/Dh/HlM+wfamVV7KX0hMj9sEWn6hRXoIyDkAAZ28dGhgt1ekvXWrAP3
         ROkOOFOt8pJ2a7vneqEPXsNRRJrDDUYLaiu7PQFlKIO/XKKwmlpRrdVumKFX3h5NQvvH
         Wr5mRxh3m0G2noNw4fekong5Ba1ug59tvu9Xh7IAot1QGR/CULsks1XU3rs4FoaH2U+l
         kvi/zF9lQyEo731KmNFcErlQvCRueu1hFfhDzsLy53sscL4afRlZOUU5zbColZJ23vAz
         mL3NqSLgVbOT+whvOCFRrc1F8WJESjjpo1BxyvQ7R89k/RDBU62lDHfTQHYgxPVuWwm0
         2fCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788643736; x=1789248536;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nP3HrG62D1qDUWuEvN890ASEF32RGoYVJYmZpTUHaXc=;
        b=jNwqBYpQklIxNpMey5m/Mo3W5ZsdkiTaqlUOLfk+AgjUeN17E+NQrTlSG/moTtCBDq
         g9+VHNQ9RKg+m39EGQ72Q+Xqj1RK4LOaiOKZel2dzlwsKkAqhgG/or4AAng3OTV/pOuJ
         ZMTecqdc+p6ajrm5vjbVtt+A8U+N6/DLc+ooLfcE1tNyBpRtnewvuOoCDWy46yF1JXr8
         yIX6xIF4tacUViIHdAlOik32VOl9YW1hLvrjPtAPYPRGJ43e9VB5rAaEviVYJORwLTus
         XeXaTVOWePSzVVVwEsxiQu0k9tn+1/zAcnlI50is/ZQLI23gYdnKlgSIMYoZHUUaMGVb
         lV2A==
X-Forwarded-Encrypted: i=1; AKwUvBxXe03sZFpntXAhEHPMt38Wogv4Esk7QzclXShMVBWogkcrRt97LpCIdo9IW1RZeMQ1GPY8jYtuRqGu@vger.kernel.org
X-Gm-Message-State: AFuF++kl8BG8GRNN9Tp4ipL8SNv4NrqHP206BbtbFUs7nzi1WRCtUgHB
	LN0yqIgUIw/nUPTSHLkVmyVacOC3XurBovIfUCTVK+jxLCmGvQvahzZq
X-Gm-Gg: AYBFou2+u69KwIlOwBqxO3kQFvV+dKwp80d7X/T7olN3sWsmxAbrZyMSAYo34ZWtR2i
	YcyiahVoFTmu+1LoLmFJAj37GXcmv+EWvU+C73zr4Sax15w235w+XS+bKKSOSxU8b85/i3WB/EL
	sBhoSy8hFbApgxZNpF7DOFVQITTE3Qpm9lUoDjaNqtCLEx5c/AVRk82JEqcP+LVxsVFMAy9L27l
	iOhX6sxp7ZNKOB5WgObjm1ELpuZqnj3SN5K43IZFfBcoKwha6WQ9zExQuJnXX2nRR4UMe1Qa+al
	mUZDxZhpCzwXkr+65Qis+FIza45F8r++QSWB4OwUl2dRvsTYt35ltU/x/OnVgK9vDU1eleroWR/
	+ckeuweo95kWo0w+2Br6wXAKgqcBgze0KwOOlnz2uE/QSjN+QosIh8ZW9NPA11pO4G79+IXhK6X
	wj1zagLPyzev191kH6C0IBesaxrYlqi5MArQ4J4AZfqzrvAnAdcC04hYc/YyLo9dx2vg32obZsE
	k6cQ4/7WKk=
X-Received: by 2002:a17:90b:3bcf:b0:396:d27c:8696 with SMTP id 98e67ed59e1d1-39b2693597emr14294880a91.4.1788643736428;
        Sat, 05 Sep 2026 14:28:56 -0700 (PDT)
Received: from [10.63.138.252] ([2409:40c2:5007:4aea:63cc:914c:1243:e03c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8f1cf6dsm7028669a91.3.2026.09.05.14.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 14:28:54 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 06 Sep 2026 02:58:32 +0530
Subject: [PATCH v3] dt-bindings: clock: ti,DM814x-ADPLL: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ti-adpll-v3-1-1f1ccda49c62@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02Nyw6CMBQFf4V0bQ0ttFRX/odxAfQWruGVFhsN4
 d9tMQaWk5yZsxAHFsGRa7IQCx4djkOA7JSQui2HBijqwISnXKYFF3RGWuqp66jWRqsccjBMkTC
 fLBh8b6n748fuVT2hnqMfFy26ebSf7cuzuPtn5Z71jDKqpJGmvmRSpMWt6UvszvXYk5j1fBcVY
 weRB9GIQlVcZJUGcRTXdf0CI0weyusAAAA=
X-Change-ID: 20260725-ti-adpll-ddfd84e4ef18
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788643722; l=5036;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=zZcooq33uZAZQsOxsxxaLl9Ssx8OZWzyF/mi8o6rC90=;
 b=ABSepY0yrQ1i0yIt0aFrqAzx26CB/JyxPcbgByEbXeNiB1EsMzg+TxMxDkHcbRcDYroyEcVW0
 gL5SGYN62cSAQ/3rmKpUF4p6hcqz2Uhvoa6b3vecgoDpZ3zTep8O7aO
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the Texas Instruments DM814x ADPLL clock binding to DT schema
format. Add 'clock-output-names' as required which was missing in
legacy binding, as the driver (clk-adpll.c) mandates it and fails
probing if it is missing.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- Rebased to latest mainline rc.
- Collected tag.
- Link to v2: https://lore.kernel.org/r/20260811-ti-adpll-v2-1-f578b253bde5@gmail.com

Changes in v2:
- Droped description for items clock-output-names
- Dropped extra example
- Link to v1: https://lore.kernel.org/r/20260726-ti-adpll-v1-1-86f6fc936507@gmail.com
---
 .../devicetree/bindings/clock/ti/adpll.txt         | 39 ----------
 .../bindings/clock/ti/ti,dm814-adpll-clock.yaml    | 88 ++++++++++++++++++++++
 2 files changed, 88 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/adpll.txt b/Documentation/devicetree/bindings/clock/ti/adpll.txt
deleted file mode 100644
index 3122360adcf3..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/adpll.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-Binding for Texas Instruments ADPLL clock.
-
-This binding uses the common clock binding[1]. It assumes a
-register-mapped ADPLL with two to three selectable input clocks
-and three to four children.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be one of "ti,dm814-adpll-s-clock" or
-  "ti,dm814-adpll-lj-clock" depending on the type of the ADPLL
-- #clock-cells : from common clock binding; shall be set to 1.
-- clocks : link phandles of parent clocks clkinp and clkinpulow, note
-  that the adpll-s-clock also has an optional clkinphif
-- reg : address and length of the register set for controlling the ADPLL.
-
-Examples:
-	adpll_mpu_ck: adpll@40 {
-		#clock-cells = <1>;
-		compatible = "ti,dm814-adpll-s-clock";
-		reg = <0x40 0x40>;
-		clocks = <&devosc_ck &devosc_ck &devosc_ck>;
-		clock-names = "clkinp", "clkinpulow", "clkinphif";
-		clock-output-names = "481c5040.adpll.dcoclkldo",
-				     "481c5040.adpll.clkout",
-				     "481c5040.adpll.clkoutx2",
-				     "481c5040.adpll.clkouthif";
-	};
-
-	adpll_dsp_ck: adpll@80 {
-		#clock-cells = <1>;
-		compatible = "ti,dm814-adpll-lj-clock";
-		reg = <0x80 0x30>;
-		clocks = <&devosc_ck &devosc_ck>;
-		clock-names = "clkinp", "clkinpulow";
-		clock-output-names = "481c5080.adpll.dcoclkldo",
-				     "481c5080.adpll.clkout",
-				     "481c5080.adpll.clkoutldo";
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-clock.yaml
new file mode 100644
index 000000000000..9676ab2d8705
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-clock.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,dm814-adpll-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DM814x ADPLL Clock
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+description:
+  The ADPLL is a register-mapped clock generator found on TI DM814x SoCs. It
+  provides multiple output clocks from two or three selectable input clocks and
+  three to four children.
+
+properties:
+  compatible:
+    enum:
+      - ti,dm814-adpll-s-clock
+      - ti,dm814-adpll-lj-clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: clkinp
+      - const: clkinpulow
+      - const: clkinphif
+
+  clock-output-names:
+    minItems: 3
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-output-names
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: ti,dm814-adpll-s-clock
+then:
+  properties:
+    clocks:
+      minItems: 3
+    clock-names:
+      minItems: 3
+    clock-output-names:
+      minItems: 4
+
+else:
+  properties:
+    clocks:
+      maxItems: 2
+    clock-names:
+      maxItems: 2
+    clock-output-names:
+      maxItems: 3
+
+additionalProperties: false
+
+examples:
+  - |
+    adpll@40 {
+        compatible = "ti,dm814-adpll-s-clock";
+        reg = <0x40 0x40>;
+        #clock-cells = <1>;
+        clocks = <&devosc_ck &devosc_ck &devosc_ck>;
+        clock-names = "clkinp", "clkinpulow", "clkinphif";
+        clock-output-names = "481c5040.adpll.dcoclkldo",
+                             "481c5040.adpll.clkout",
+                             "481c5040.adpll.clkoutx2",
+                             "481c5040.adpll.clkouthif";
+    };

---
base-commit: 9f0346dcbea363787186c94ef94dd01aaa215afa
change-id: 20260725-ti-adpll-ddfd84e4ef18

Best regards,
--  
Bhargav

