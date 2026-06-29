Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB14405C4E
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738826; cv=none; b=NSUgYoou4OsnlRSY7mgXH72z37zDTS5GkaD7RP/xNoFPNw5gd72W3UKUxfh61pfYg+z0guXleV7P5r9IO1xAO3xx4k1vtiXP0kkwbQjKLnqs0MdxMB7xv+vixExInMFF/4nbh5wy61JYimkHSYKKwRLTaYVmQHrZ6uNEcjHfSeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738826; c=relaxed/simple;
	bh=uqWUiWxqoK1z4suv25KsMeSJmhIYeFSFGYemREkDadc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AB4ycXcMh73Y9U4wZCOVGaowSfxlC5qSXU9TrekkEaj5g3APN0dC2hzK66/WuleHPv+euI/67Ueakc37kC9iqnDD+L1BwCd/V/+JvAXXjSmdvhBsk5jObZYL9QTXGcxgSXc0PU6yZC6wtzmHPKIPjcaCb2yE1Gk6xkTqzTcnEOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G570oWgW; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G570oWgW"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so6575141eec.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782738824; x=1783343624; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ag7rMygxbcOcB4P3e3XBrLKcZ4BXMFcVbEIShzaDpgU=;
        b=G570oWgWLMNssA1eAouLvtU6M2Os3Sl/nBh/j670e9zc7X1djenc8sOoYh5ZrL/Pqm
         MWRrp4dzw5W63JfkhR0bPYxPVHP6Y+7wZJrj5qKrIi3+dxbRV1X8MQXMJtBBLCBjawrw
         aD1Wp9O4wfJubmab50DpVBXL5J/8VZM3aXpv4CLlx+VX66zrUL1n4I9rS0cbd1LmOAPa
         wOz8IivHV2vkSyYdCxlSvCzQIersA9y+8HKa+qR8zip4QmQ21rhTh/Fnj4wq8D6oLS4S
         sgKCRNymuOvG7JgPffQ/+2Q5QMLsKAi1U1BAmJcGyJ9kgN7BC+NqYNnDDddDzP7ZCoaS
         5row==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782738824; x=1783343624;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ag7rMygxbcOcB4P3e3XBrLKcZ4BXMFcVbEIShzaDpgU=;
        b=kZdcO4gMuB8zdCKsV6699pQJFs/BA05YgvsMd1I0pSzCPROg0tLd3akkiFQ6HH9lMk
         2EWfS1Rxbw8oxqM3mWTeLCybkZ7z1tCXWaWadgx1WW0eIDsnBUJ6fmDaEUCkuwgWjaB6
         itaoN7C6NWCNuqEBfgYXSzN2mkMYxPrkPBvUdL+KlpmcSRr1jLxn36ch1RKeeFOil/k+
         ejy2eprdJUKW4/Ev82kOoy6QEnxVeUvhI/0IS2WbYQZn3lJbuxEA0hDYR7EMxl2yLTHf
         1Qz7G7G0PN+DPRQPka8nrAMM0CwOa7jukO8Wf5cVzJlFwr2tPLLW0gj90OHlZw9p7vTk
         TeiA==
X-Forwarded-Encrypted: i=1; AHgh+RrCPMSA6XiGlLgzXPfLvhUDZlYChtrl7sURpQLIOSh1fUAgKFSkhWib6GRhb7rNLVGnzBri1Pzu3j5F@vger.kernel.org
X-Gm-Message-State: AOJu0YwivSQ6umRcNuPPenSjf6LePxRTB+jwait/qyXcJr40uUmbdUME
	75kt4XjUzwErrN1bDnN2Z5L+WkTFGLbZjNd0MghExPvv8tXBbZt0sOoe
X-Gm-Gg: AfdE7cmblKb0SrXN3nNSSxbrGYWBY5i4MWgtVOTaM0PKb6tbUjcIembSNUfch0ultLR
	dSld0/JeTSVW0Nvh1Pv//B8oUX2DuXd1jh0JV2QjCquxE2BS16O2SC83aLzUZTg7ujuXlHVQ0WH
	8E0oJC3C5qdhOWpHyBivS6D8lONAfV6BUZE9ifodsQhKxdwC79jJaFigBeRxT5U96LyCfRanllr
	YZfnTrCRmaXtAkW2QLVx5wOB7AK+rIItooluxMLGO8OBVncjuE+tLo7FuLb6eK6t30pyE6pgYJ5
	G1pAq4yf+nEOQMghhe9i3o2lolGrQlyFoLK5JDRTRUJKmHV8/RBxKCUXWtU3YFfkfVxEsB3d5ER
	D/cYO915kNdiCcG9E427hvnf8eA1R36bp2mUzWV+IwNlPfO3wy1Z/QZfcpugLg7cnuvtYVvGUIA
	we2oC4r7IH6+zX9XRo8+0npTvk6MiESCZeee0=
X-Received: by 2002:a05:7300:8bab:b0:30c:56a0:ce3f with SMTP id 5a478bee46e88-30caae2f116mr11362069eec.2.1782738823488;
        Mon, 29 Jun 2026 06:13:43 -0700 (PDT)
Received: from Black-Pearl.localdomain ([49.207.62.174])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-30c7c52eed6sm43883676eec.9.2026.06.29.06.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:13:42 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Mon, 29 Jun 2026 12:58:37 +0000
Subject: [PATCH v5] dt-bindings: pwm: st,sti-pwm: convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-st-pwm-v5-1-a93f2bfec38c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP1rQmoC/23NTQ6CMBAF4KuYrq2hUwqtK+9hXJTpVGsEDEXUG
 O5u0cT4t5q85H1vbixSFyiy5ezGOhpCDG2TgprPGO5ssyUeXMoMMiiyQkgee34811x4so4KTEe
 yVD525MPlMbTePHM8VXvCftJTYxdi33bXx6dBTL2f0UFwwXOlEVCbMjN2ta1tOCywrdk0OsA70
 y8GiWFpwKnSKCT4ZvKNgXoxmZhFMpX3Wisw3yz/z/LEjNKudEXlvPxg4zjeAbM5W1NTAQAA
X-Change-ID: 20260613-st-pwm-1feade6cfea3
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2

Convert STMicroelectronics STiH41x PWM/Capture controller binding
to DT schema.
Changes during conversion:
- Fix compatible string from "st,pwm" to "st,sti-pwm" to match the
  actual hardware variant naming convention used across STi bindings.
- Drop pinctrl-names from the required list as pinctrl properties are
  inherited and validated by the pinctrl schema.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v5:
- Enforce stricter validation of the clock-names property.
- Link to v4: https://patch.msgid.link/20260625-st-pwm-v4-1-958d7d6bdf39@gmail.com

Changes in v4:
- Fix compatible to "st,sti-pwm" in examples.
- Modify subject line to point to the correct YAML file.
- Link to v3: https://patch.msgid.link/20260625-st-pwm-v3-1-ace9bff88529@gmail.com

Changes in v3:
- Fix compatible to "st,sti-pwm".
- Drop pinctrl-names from required.
- Modify the commit message to explain the changes made.
- Change maintainer to "Lee Jones <lee.jones@linaro.org>".
- Link to v2: https://patch.msgid.link/20260618-st-pwm-v2-1-c792d5795ce2@gmail.com

Changes in v2:
- Add the missing interrupts to the required following the old binding.
- Modify the commit message to explain the changes made.
- Link to v1: https://patch.msgid.link/20260613-st-pwm-v1-1-458c2c89709a@gmail.com
---
 Documentation/devicetree/bindings/pwm/pwm-st.txt   | 43 ----------
 .../devicetree/bindings/pwm/st,sti-pwm.yaml        | 92 ++++++++++++++++++++++
 2 files changed, 92 insertions(+), 43 deletions(-)

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
diff --git a/Documentation/devicetree/bindings/pwm/st,sti-pwm.yaml b/Documentation/devicetree/bindings/pwm/st,sti-pwm.yaml
new file mode 100644
index 000000000000..39f96596c1ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/st,sti-pwm.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/st,sti-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STiH41x PWM/Capture controller
+
+maintainers:
+  - Lee Jones <lee.jones@linaro.org>
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
+    const: st,sti-pwm
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
+    minItems: 1
+    items:
+      - const: pwm
+      - const: capture
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
+  - clock-names
+  - clocks
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pwm@fe510000 {
+        compatible = "st,sti-pwm";
+        reg = <0xfe510000 0x68>;
+        interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
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

