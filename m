Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDD5315D21
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 07:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781334333; cv=none; b=tIw8RTmPzBugsiL8BpmvJRZKiYlM0mJKBJeOguN6KSebyu5GAqNNaUtMpEFL5s30pPOIXgMxsrr/H2EHXGoJX2MC+YsOOSCuSxulRc+Vli7iijCDqcKg26ctKXGPxUCrzHEmr1iCtt1AQ5m+d1DpcaXysPPRV3UjiGjxQEEt8XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781334333; c=relaxed/simple;
	bh=qbuq70Uh3IaPAYxL6RvkUK6WcshvrLB9yDi84mUO810=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QB5IPsHoGotMxWAbum6SbY6wGUMe6eCnEQ4c+GKIzgCV+bqWEZSbmtCWEQ6JRonjoZHwiSESwyw7slVNIP7Icmyt7KOcGeg7RXKPaEZL6CagQTu9p4lABe2ULeuEkE1RRgpRlqL4C+9Pyyt7UAoPxeramPX3RNETs797Cf7aesU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTVX8aGZ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTVX8aGZ"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c85822059d8so1086978a12.1
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 00:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781334331; x=1781939131; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=whI/KzO8NNp1wQWQVAnpD6KQOZ6KFgZhU/Hu5Fa3ioA=;
        b=mTVX8aGZh6zblX6gH6N3bHwpYrTh9Q21pj12wRlYLDjvTBpc+D3r/yuN1+hE36gaDd
         WuzBEVXJW7TVhU333V2byidMfW9UL9KJ5z6N1CpdyGZC31RLQD7YGmP/NNUy0ETyPp7U
         fG9EKIwUcsYCes7Gha6JeBfQvAiOUbaZ66tb9qgVpq/MEuxlTYgsRdD5kotRHlVN25c+
         k6gt+tVWqf1U8Zl6/XxVeZ8vHFTHwwBwK76i+COTaWTL1SnxjqlbBRYElTB1V/vha1br
         ciOeUqct9nx5+QUiPE0WZQnZKf9MAS/DXv3R4qiC5J+jCuuCa/kDigEvoJDJfYKRp/8U
         8Yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781334331; x=1781939131;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whI/KzO8NNp1wQWQVAnpD6KQOZ6KFgZhU/Hu5Fa3ioA=;
        b=anBwd92V/W7dU7lBOrkKTErpeJ/eaialVMK3FPmyuua54LHHfdVw9L5Nrq1g5cgXTA
         wEaQGXAzcnNvj8yUZPN+Znk7EQDrm9ZIj6agJ+UGDSuShJ98yk9FxaiwHS+lansx3Ovl
         Qt/B0Eh4Sw1Ks1CcO+gvrLb/W3LXsrNkB54J4LvIRhpqF2s+iL6Y4Y5WB+BNci23GLKl
         nnp++lhQf2jU0H4Ic0Oe57U7UjNJP7Rttz2XJqkDMujB0uJXxWJHesqRILXk0PlaqsHX
         WbAW8LUPsKaS+cd5YWBAuPvYmZWJjD1VNfzYkcRRs5vBhthkWfA2jBjogPH7mRaCoNYz
         PoXA==
X-Forwarded-Encrypted: i=1; AFNElJ/IHcPIqSlR1nMwM8w1/XbXLMpm4PBhQuwLXyXHsDtmxMLKGRSSm/TeI1/IEeb2+NjRpnHY9QkJvxSp@vger.kernel.org
X-Gm-Message-State: AOJu0YyAcLVI8ZP5YyA+51/s++9VA+EpCyCMg+TmEOuCSVWObCAM8dXr
	1v1K4MGHtvCJd28+qftaFORm3KVMp+LlwdgAMGMwI4VKCO8GUhMc7iaLWqX9NQ==
X-Gm-Gg: Acq92OEpRQTh+6fnH8l7tEPPvVRjvhbbX0UHkGm2stzq5hSukN/Ukk4EmJdhuh2a/Gs
	kW0rq1+woI8gKESP2OB5t45vsygbu2ZXXglPvfss8tOn/1CggaaVUg23vBc2wW4TCDpmULXGExK
	STx8ewfjt1VMcdgXes55Ak5kLvegoYGnchaP8K/lQEyFPSpl3creLPVlyE283ACluy3yYRvjPyd
	tGswayyYjfI1IIjOhVqThaC5nxwOjswas21cbzQGerExTehyffwMFr9bpfsRIfPQ0anIaJLmpWl
	slT0V+1KJHqYqLkpkMYKqyq/3KKVSJyXMFj9GOXzbVYWr+aA4mwGZnuLxJySdLVoNtpqfKqchpB
	P1BYKeSCj0V3Dodka4Ctbczs65IaEYKox67LWIBzRTS1k7lzbNCOQVlyXx/L4bwLZobkiNaB2cH
	eDjBo4IT7y2H+tJ3ZJ+caZf+4DrVN6Y99T3ofHpWcvWrxX
X-Received: by 2002:a05:6a20:d04f:b0:39f:3ca8:a33b with SMTP id adf61e73a8af0-3b783bfcce1mr7416051637.17.1781334330831;
        Sat, 13 Jun 2026 00:05:30 -0700 (PDT)
Received: from Black-Pearl.localdomain ([49.207.61.84])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c8665187d3fsm3611552a12.17.2026.06.13.00.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 00:05:30 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sat, 13 Jun 2026 07:04:11 +0000
Subject: [PATCH] dt-bindings: pwm: st,pwm: convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-st-pwm-v1-1-458c2c89709a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOoALWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Nj3eIS3YLyXF3DtNTElFSzZCBlrARUXFCUmpZZATYoOhbCLy5Nykp
 NLgHpVqqtBQAWIxEkagAAAA==
X-Change-ID: 20260613-st-pwm-1feade6cfea3
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pal Singh <ajitpal.singh@st.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2

Convert STMicroelectronics STiH41x PWM/Capture controller binding
to DT schema.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 Documentation/devicetree/bindings/pwm/pwm-st.txt  | 43 -----------
 Documentation/devicetree/bindings/pwm/st,pwm.yaml | 90 +++++++++++++++++++++++
 2 files changed, 90 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-st.txt b/Documentation/devicetree/bindings/pwm/pwm-st.txt
deleted file mode 100644
index 19fce774cafa..000000000000
--- a/Documentation/devicetree/bindings/pwm/pwm-st.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-STMicroelectronics PWM driver bindings
---------------------------------------
-
-Required parameters:
-- compatible :		"st,pwm"
-- #pwm-cells : 		Number of cells used to specify a PWM. First cell
-			specifies the per-chip index of the PWM to use and the
-			second cell is the period in nanoseconds - fixed to 2
-			for STiH41x.
-- reg :			Physical base address and length of the controller's
-			registers.
-- pinctrl-names: 	Set to "default".
-- pinctrl-0: 		List of phandles pointing to pin configuration nodes
-			for PWM module.
-			For Pinctrl properties, please refer to [1].
-- clock-names: 		Valid entries are "pwm" and/or "capture".
-- clocks: 		phandle of the clock used by the PWM module.
-			For Clk properties, please refer to [2].
-- interrupts:		IRQ for the Capture device
-
-Optional properties:
-- st,pwm-num-chan:	Number of available PWM channels.  Default is 0.
-- st,capture-num-chan:	Number of available Capture channels.  Default is 0.
-
-[1] Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-[2] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Example:
-
-pwm1: pwm@fe510000 {
-	compatible = "st,pwm";
-	reg = <0xfe510000 0x68>;
-	#pwm-cells = <2>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_pwm1_chan0_default
-		     &pinctrl_pwm1_chan1_default
-		     &pinctrl_pwm1_chan2_default
-		     &pinctrl_pwm1_chan3_default>;
-	clocks = <&clk_sysin>;
-	clock-names = "pwm";
-	st,pwm-num-chan = <4>;
-	st,capture-num-chan = <2>;
-};
diff --git a/Documentation/devicetree/bindings/pwm/st,pwm.yaml b/Documentation/devicetree/bindings/pwm/st,pwm.yaml
new file mode 100644
index 000000000000..2c10f54b5caf
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/st,pwm.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/st,pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STiH41x PWM/Capture controller
+
+maintainers:
+  - Ajit Pal Singh <ajitpal.singh@st.com>
+
+description:
+  The STiH41x PWM controller supports both PWM output and input capture
+  functionality. It provides multiple PWM output channels for generating
+  variable duty-cycle waveforms, and multiple input capture channels for
+  measuring external signal periods and pulse widths. PWM output channels
+  and input capture channels are configured independently via
+  st,pwm-num-chan and st,capture-num-chan respectively.
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: st,pwm
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 2
+
+  pinctrl-names:
+    const: default
+
+  clock-names:
+    items:
+      enum: [pwm, capture]
+    minItems: 1
+    maxItems: 2
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  interrupts:
+    description: IRQ line for the capture device.
+    maxItems: 1
+
+  st,pwm-num-chan:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of available PWM output channels.
+    minimum: 0
+    maximum: 4
+    default: 0
+
+  st,capture-num-chan:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of available input capture channels.
+    minimum: 0
+    maximum: 4
+    default: 0
+
+required:
+  - reg
+  - compatible
+  - "#pwm-cells"
+  - pinctrl-names
+  - clock-names
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@fe510000 {
+        compatible = "st,pwm";
+        reg = <0xfe510000 0x68>;
+        #pwm-cells = <2>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_pwm1_chan0_default
+                     &pinctrl_pwm1_chan1_default
+                     &pinctrl_pwm1_chan2_default
+                     &pinctrl_pwm1_chan3_default>;
+        clocks = <&clk_sysin>;
+        clock-names = "pwm";
+        st,pwm-num-chan = <4>;
+        st,capture-num-chan = <2>;
+    };
+...

---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260613-st-pwm-1feade6cfea3

Best regards,
--  
Charan Pedumuru <charan.pedumuru@gmail.com>

