Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2452C35B62F
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 18:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387788; cv=none; b=gvQK5G5l+nFhmUbdFDO7WpZ1slBw1s2AZFq2AEzSCEZdVhey/eBMsndIUQfUWsjVAF6oUV9KgKroM+SYgvyjhxS946hysOP2RDHXkBtPAKPFRFmyYNP5oUR1LAG3RWRzjDFpepQNz6gCxevDgonClb//ZK96IuXVFJkprOASsWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387788; c=relaxed/simple;
	bh=+PNdr7UOBN0D/P4Ki/Y+qRdGWST8WSd5FOmFZnh3mBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KGvOtw3k9n5rv0KkCndViYJ4j0W7TyXzSxCYLNARtqpuv6zjYElYexQPKsz1eeEAAru+Vy0ogqaJ20eJBGjzUfCotKLlIJyKtY95FAOn7SjF56ZUBz2oyUQiVel/Mz7mD+/3bbc7eWkhGI7FueUym2AEiniKj64B5f79rqd5Ouo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXMDCBjk; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXMDCBjk"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-381f03d7be0so377705a91.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786387786; x=1786992586; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fgt1He7MakmEe7A8QhkQSNnwfjvCnynEk+19Oz9BHoQ=;
        b=fXMDCBjk8N0Ewm75eIjQ5vsANXNHpSAXy0DKCyGmE89v3tV5MHSQi6E/CSxhPAsg6s
         QIMZJNUCeBIUnlZuqiSLaI9ISpPwPsaoPkGJUsObpI6rGVAMpkGX2snrksoTIoisnK0y
         D6TKr2Nf/5IqxcytcoTtWQN2mpYFDur6yfWxXx+DyGKutBauS4UWwpGZJrod/GdUARJ4
         6gXJXWjJg7DWBlGZ0iEJf09LN6AM9hMVc1RsM3GENhDLmisY5z78UIDGk5I/MMFmwquI
         3tA2H/LJkqW14a+yZzOT3NNLvjrQ+llPFUX8hJh5k54IoMUnl64HovtrQE7VjFnUQflh
         rA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786387786; x=1786992586;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Fgt1He7MakmEe7A8QhkQSNnwfjvCnynEk+19Oz9BHoQ=;
        b=We8JVd1fQ5cRBdZ0x69xN9wXSf2FyXotqg6zRG4nROr9FUEAJ6M007HcyMoiCVcfZl
         FB5qqOIDc479vLIGzfDpfo3Jybt2PdlbXKF7ctcWarOJ34iHMLe5TuYku4cZbstESGxH
         ppsgAZRI8bi9wDtCmYJj2VAxwn2b+T2Np3c5g8Wec0wuAZL/Yv/1xy9tyRZsOAv/QQPW
         5cA1WxLEX+iwGU+0RPfmvrd9434h+i9ZlG5U+Wk8rOpCB8Iq12eAIUJiEOkjS1a0FsTV
         wjdNLEUbSQC1f+fN6yh7fOEh4UCRKc8XDbhYSuEJsqz//KVxckvXS9DwQdmci9+Ls5MW
         Yn2w==
X-Forwarded-Encrypted: i=1; AHgh+Rr6seiEJrn8Y9xAAGYZFe77c/EDmaelnV7mIVRTc5dBqfNjt0UHEgWWuUDZFqryC/IG9h0SboMKriNr@vger.kernel.org
X-Gm-Message-State: AOJu0YyEFsA1Mn+geOXAqfhbCDMpvfhREqJ1FN8ej1jXK2tCHOAnZwsR
	M91sX/6JA11Spc53QMo5XsN0zKJk6lTTf+B6WWO9xt7bnUxnJCUV/Yy4
X-Gm-Gg: AR+sD119nJ0j0Ixg0GAeaxGkOGB2WdIjIO4RnqKXfAHQ46vcwFMV/de1V7lTA532cbQ
	IR3uyyM/77s0b3YhR2QTeQLR0cN3d3l7/Oiz6HYQcB0Tp3ndioYU2+dD4ms1XoZYLRFhkBkH+NY
	+5MIZEBOL3jewVNiGLyOwDwFptekL3wrrEN0/yadKIko+4A8m6yCibv5fLq2jFmNIFTkx7NS/mU
	nxuH4SFwiooEl7BmnG2qEqMCSzkf4hK9TG20dkLbasHlgoku3NLM0e5gw30Y1qjGGL1FIK6dmRy
	EHWc0tlXkkbAoZHp9Urd5EtdBrXC1kQLEFaTmf2VbGW4RSpplxro1pwQj+flmFM1+QR8ax4nwsH
	5sdNDFc+uWPmmXoMFNuk6TNBqtmfk5SRPmv/i/ZqCV/xAIEHguRbUe5eUbN/bczzZ9d98/zwCtj
	N37rU715e5xfuitx1HSh4ychQoua9gX1okkCs8u6TFIVrCv75D/n3j/cHwxLmtSunxarQ=
X-Received: by 2002:a17:90b:1fc8:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-3903c628181mr33192889a91.2.1786387786236;
        Mon, 10 Aug 2026 11:49:46 -0700 (PDT)
Received: from [172.17.0.1] ([2409:40c2:5004:a08:95b5:64f6:95fc:7bec])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019c2ddasm40132740c88.7.2026.08.10.11.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:49:45 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 11 Aug 2026 00:19:28 +0530
Subject: [PATCH v2] dt-bindings: thermal: ti,omap-bandgap: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-ti-bandgap-v2-1-6fec2a71c394@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/03NTQqDMBCG4avIrJuSRIylq95DXEziqFPqD4mVF
 vHuTSyFLl/45pkNAnmmANdsA08rB57GGPqUgetx7EhwExu01EaWuRQLC4tj0+Es2tLmzpTYGjQ
 QD2ZPLb8OrKq/HZ72Tm5JQlr0HJbJv49vq0q7H6z+4VUJJZCIIlxcCi1v3YD8OLtpgHrf9w9qT
 hTWtgAAAA==
X-Change-ID: 20260730-ti-bandgap-f7b3c67af6a6
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eduardo Valentin <edubezval@gmail.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786387779; l=7915;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=+PNdr7UOBN0D/P4Ki/Y+qRdGWST8WSd5FOmFZnh3mBY=;
 b=sd/2FvOfRdpNJxTMaMKWtX+ESdk1lNtkaLf6chIQeEq/C0lh34goXhr0RAIdgcHvdFE0TJXIN
 JUzsqmXfuDLAaAeBj1VoC7BhY/IROcNvpyFEWZkARknArWgJay51+VX
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments OMAP SCM bandgap from legacy text to DT schema

Add "ti,dra752-bandgap" to compatible which was missing in text binding
but used and matched by same driver.

Document the "#thermal-sensor-cells" property, which was missing from
the original text binding but is required in practice by all in-tree
users via the common thermal-sensor.yaml binding.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Dropped unnecessary interrupts in if/then block
- Dropped extra examples
- Link to v1: https://lore.kernel.org/r/20260731-ti-bandgap-v1-1-aeee6a658520@gmail.com
---
 .../bindings/thermal/ti,omap-bandgap.yaml          | 177 +++++++++++++++++++++
 .../devicetree/bindings/thermal/ti_soc_thermal.txt |  88 ----------
 2 files changed, 177 insertions(+), 88 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/ti,omap-bandgap.yaml b/Documentation/devicetree/bindings/thermal/ti,omap-bandgap.yaml
new file mode 100644
index 000000000000..091b7be28461
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/ti,omap-bandgap.yaml
@@ -0,0 +1,177 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/ti,omap-bandgap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments OMAP SCM bandgap
+
+maintainers:
+  - Eduardo Valentin <edubezval@gmail.com>
+
+description:
+  In the System Control Module, OMAP supplies a voltage reference and a
+  temperature sensor feature that are gathered in the band gap voltage and
+  temperature sensor (VBGAPTS) module. The band gap provides current and
+  voltage reference for its internal circuits and other analog IP blocks. The
+  analog-to-digital converter (ADC) produces an output value that is
+  proportional to the silicon temperature.
+
+properties:
+  compatible:
+    enum:
+      - ti,omap34xx-bandgap
+      - ti,omap36xx-bandgap
+      - ti,omap4430-bandgap
+      - ti,omap4460-bandgap
+      - ti,omap4470-bandgap
+      - ti,omap5430-bandgap
+      - ti,dra752-bandgap
+
+  reg:
+    minItems: 1
+    maxItems: 6
+
+  interrupts:
+    maxItems: 1
+
+  gpios:
+    maxItems: 1
+    description:
+      used to inform which GPIO line the tshut signal is routed to. The
+      informed GPIO will be treated as an IRQ;
+
+  "#thermal-sensor-cells":
+    enum: [0, 1]
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: thermal-sensor.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,omap34xx-bandgap
+              - ti,omap36xx-bandgap
+
+    then:
+      properties:
+        reg:
+          minItems: 1
+          maxItems: 1
+
+        interrupts: false
+
+        gpios: false
+
+        "#thermal-sensor-cells":
+          const: 0
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,omap4430-bandgap
+
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+
+        interrupts: false
+
+        "#thermal-sensor-cells":
+          const: 0
+
+      required:
+        - gpios
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,omap4460-bandgap
+              - ti,omap4470-bandgap
+
+    then:
+      properties:
+        reg:
+          minItems: 3
+          maxItems: 3
+
+        "#thermal-sensor-cells":
+          const: 0
+
+      required:
+        - interrupts
+        - gpios
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,omap5430-bandgap
+
+    then:
+      properties:
+        reg:
+          minItems: 4
+          maxItems: 4
+
+        gpios: false
+
+        "#thermal-sensor-cells":
+          const: 1
+
+      required:
+        - interrupts
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,dra752-bandgap
+
+    then:
+      properties:
+        reg:
+          minItems: 6
+          maxItems: 6
+
+        gpios: false
+
+        "#thermal-sensor-cells":
+          const: 1
+
+      required:
+        - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    bandgap@48002524 {
+        compatible = "ti,omap34xx-bandgap";
+        reg = <0x48002524 0x4>;
+        #thermal-sensor-cells = <0>;
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bandgap@4a0021e0 {
+        compatible = "ti,dra752-bandgap";
+        reg = <0x4a0021e0 0xc>, <0x4a00232c 0xc>,
+              <0x4a002380 0x2c>, <0x4a0023c0 0x3c>,
+              <0x4a002564 0x8>, <0x4a002574 0x50>;
+        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>; /* talert */
+        #thermal-sensor-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/thermal/ti_soc_thermal.txt b/Documentation/devicetree/bindings/thermal/ti_soc_thermal.txt
deleted file mode 100644
index 6299dd8de339..000000000000
--- a/Documentation/devicetree/bindings/thermal/ti_soc_thermal.txt
+++ /dev/null
@@ -1,88 +0,0 @@
-* Texas Instrument OMAP SCM bandgap bindings
-
-In the System Control Module, OMAP supplies a voltage reference
-and a temperature sensor feature that are gathered in the band
-gap voltage and temperature sensor (VBGAPTS) module. The band
-gap provides current and voltage reference for its internal
-circuits and other analog IP blocks. The analog-to-digital
-converter (ADC) produces an output value that is proportional
-to the silicon temperature.
-
-Required properties:
-- compatible : Should be:
-  - "ti,omap34xx-bandgap" : for OMAP34xx bandgap
-  - "ti,omap36xx-bandgap" : for OMAP36xx bandgap
-  - "ti,omap4430-bandgap" : for OMAP4430 bandgap
-  - "ti,omap4460-bandgap" : for OMAP4460 bandgap
-  - "ti,omap4470-bandgap" : for OMAP4470 bandgap
-  - "ti,omap5430-bandgap" : for OMAP5430 bandgap
-- interrupts : this entry should indicate which interrupt line
-the talert signal is routed to;
-Specific:
-- gpios : this entry should be used to inform which GPIO
-line the tshut signal is routed to. The informed GPIO will
-be treated as an IRQ;
-- regs : this entry must also be specified and it is specific
-to each bandgap version, because the mapping may change from
-soc to soc, apart of depending on available features.
-
-Example:
-OMAP34xx:
-bandgap {
-	reg = <0x48002524 0x4>;
-	compatible = "ti,omap34xx-bandgap";
-};
-
-OMAP36xx:
-bandgap {
-	reg = <0x48002524 0x4>;
-	compatible = "ti,omap36xx-bandgap";
-};
-
-OMAP4430:
-bandgap {
-	reg = <0x4a002260 0x4 0x4a00232C 0x4>;
-	compatible = "ti,omap4430-bandgap";
-};
-
-OMAP4460:
-bandgap {
-	reg = <0x4a002260 0x4
-		0x4a00232C 0x4
-		0x4a002378 0x18>;
-	compatible = "ti,omap4460-bandgap";
-	interrupts = <0 126 4>; /* talert */
-	gpios = <&gpio3 22 0>; /* tshut */
-};
-
-OMAP4470:
-bandgap {
-	reg = <0x4a002260 0x4
-		0x4a00232C 0x4
-		0x4a002378 0x18>;
-	compatible = "ti,omap4470-bandgap";
-	interrupts = <0 126 4>; /* talert */
-	gpios = <&gpio3 22 0>; /* tshut */
-};
-
-OMAP5430:
-bandgap {
-	reg = <0x4a0021e0 0xc
-		0x4a00232c 0xc
-		0x4a002380 0x2c
-		0x4a0023C0 0x3c>;
-	compatible = "ti,omap5430-bandgap";
-	interrupts = <0 126 4>; /* talert */
-};
-
-DRA752:
-bandgap {
-	reg = <0x4a0021e0 0xc
-		0x4a00232c 0xc
-		0x4a002380 0x2c
-		0x4a0023C0 0x3c
-		0x4a002564 0x8
-		0x4a002574 0x50>;
-	compatible = "ti,dra752-bandgap";
-	interrupts = <0 126 4>; /* talert */
-};

---
base-commit: fc02acf6ac0ccde0c805c2daa9148683cdd01ba8
change-id: 20260730-ti-bandgap-f7b3c67af6a6

Best regards,
-- 
Bhargav

