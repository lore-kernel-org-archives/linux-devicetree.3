Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9009331237
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 21:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237064; cv=none; b=NBLSH1Zqm6YzlHukWQlvXn3UBCMZXAHJuf8FTMVgdtaKOzsx2zqftv/oY1LslnbwU0jxL2uR4z17i+KGX4ljeQ4Q/ttkwDGiQOyQc1/oE8PXtqx5Bp/D68GyXorBEO9A4eIdgR3qyMY9pgGc4b3qmDHKc3RnNISlJqb0Yxpr+Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237064; c=relaxed/simple;
	bh=Qs0HISc6oJw5wLf+z3aVFe1MESLqvStS+KLyz4ClnSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Bs9vp4e8lSY2h8Cwv6zKZl0+1LxVhOJGo1R1cRynVP+QjBvAvjFj5LeHYFuK2B4K1fRLzqH6tSd0hvdgxH/GY8hwjoS0r+OvDX0avSuO+I8yE612z9CU+xk3lfUJwXNOaRbv7qxo257LixqoWWdFGghbH9wEJW8YTioJNqTThe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1Er/W4O; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1Er/W4O"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-384c94c9423so797991a91.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784237060; x=1784841860; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kD3s07pvdAczukbnY3FobHE80SYpEDtBS/iGTyhJ7v0=;
        b=L1Er/W4O7p53E21xJvlHp7dbJ5e5eXSMPaowf8pHcawfYsPNmAZ5dYlOsNt3mBHLUB
         qgijOiq7+ABxoQWXNbWJQPSBNeeQb+zfMhejRJYCTXmPXzR/foxiBLHhAlKb38hCvPd2
         7lAD2zJ4zFYEJE45Rqfe5L5kclGK/VfYeocYD9K9kQDKQWu5J/GnOZi2USde3wUq65VN
         Q0o9D/UkUyhZq+QU8pXzywz0h1Gkw7g68BJbybMQxw06dmYp6zl4gtr6SphYs5pZVnRb
         kumElXgzV99S7+1E/+AzTn4rboAAjL/RpEfD0PFLWIgqXgRk1zS0vYj4O3pX5EhHVy9S
         uabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784237060; x=1784841860;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kD3s07pvdAczukbnY3FobHE80SYpEDtBS/iGTyhJ7v0=;
        b=R9xhJStzOf0U3rSfoUDfKvRK92Lccwp4NKDjSMJgQ6rUD2O+caPwzohtBuEVWinUFU
         pVASP2vXMKVpmb7jVRHZGy02IGUxstcxhVrdZczx4UEP8aXPLJvlr9hJi2lvqA0JSERm
         r7hRnsiUZCPN1xx5sag/SromKWbdxUAnGVK87XMLVdOU4lYUCyZVk0vXuJUU0810P61o
         lAdiALQFC1V5uec5PO+nVuNvtMr+Cm2S6kZTZWaGnGhsJ/iPZ4j35yc82weoctbaRZF1
         3aJrwM0M2aqBGRXfskApGzA5UL8vdTHLnBncaIJCJiKoEXg2+FlxswiCwJIa3f4ABXSO
         GlDg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2RBW+ZFZrwW/FIpCRjRCRjHiezOvGlZ+bEPLOFUWaWE9UeaAq49fGzfqdiMsPleA4zOyHCmhrvFTs@vger.kernel.org
X-Gm-Message-State: AOJu0YyqDCkbNBIkMfTy3dkP/ar63jQDP7jYV17n02AjqH96oFAXij2h
	QtpT5WkzLHLn7FQEcnapFQ7FM7dm84JUfUlXiBxxrLNxRVurlMCI29Ht
X-Gm-Gg: AfdE7cle9CITNaUea1p1SujoFTuYLjUgs8bhMeZsgZq1DVzLfqENCkDMwRyGN6U5Umx
	A98gY+Bo+OV4xgoy6vytWMpiF/5PZuFICqoBNA+qruZ+yJQuVqukaOMfeBIjn26UTwW5iWUTAWz
	4rljgOeG3G0JeAWIckD5hwycu8O4fWLW1iDMLdIKIiTsEJVlhnSMi9oPE5jKvSESgqJo6Ko0qpN
	mlZ/ZJznSvRYSrqh0DLsE2sW/GPxOZGMpg/XGXKa+ruMTlK0IkjrOhBj3lnrbHpbVi/Tdrcgjp0
	dK7RfzakERApfRxUaob0HVSOFDFASyhMqM196PiVf8QZGrBC+qJtLPG6OJDCDXGyruA2AOFLiH1
	qUubQ2GQGQiKrINbYBrHjWO1R3fxSPxEnFkV97rPE/ye3A9P8frkPpgj4v0nJv+GGAE9hoKjJHl
	Fv7CcYEoK1jqwC5d4KeoHjzbNwCw==
X-Received: by 2002:a17:90a:d408:b0:381:2d9a:447b with SMTP id 98e67ed59e1d1-38dc7b31c40mr17641346a91.4.1784237060499;
        Thu, 16 Jul 2026 14:24:20 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5428:7379:8e6c:7b85:e813:4f3b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6c08eesm18404850eec.21.2026.07.16.14.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:24:20 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 17 Jul 2026 02:54:03 +0530
Subject: [PATCH] regulator: dt-bindings: tps51632: Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-ti-regulator-tp-v1-1-a49d41dc56d3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBtQC6GuEi3ExhoIi9EiCO+et
 HyL/19IJEwJxuYFoZsTH7FCtw34zcWVkJdqMMpYZY3FzCi0XrvLh2A+MdheuyFo4zsFtTqFAj/
 /cZpL+QDD9nFeYQAAAA==
X-Change-ID: 20260626-ti-regulator-tp-f641a9f12c30
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784237049; l=3322;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=Qs0HISc6oJw5wLf+z3aVFe1MESLqvStS+KLyz4ClnSk=;
 b=/rDFU07m4qr2YtDgjjgJY5FDJrm/c7G1gKn7jchpRWa2unjsfyJ2U+gkdfAjD5ndCtnZBKBqO
 WomYWy1TnVfBDGFKRH7SX+qd6+iC2Tk5it9Z3RdSAO3xWZRH4t9zdT1
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments TPS51632 Voltage regulators from legacy text
to DT schema. No functional changes are introduced.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/regulator/ti,tps51632.yaml | 55 ++++++++++++++++++++++
 .../bindings/regulator/tps51632-regulator.txt      | 27 -----------
 2 files changed, 55 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/ti,tps51632.yaml b/Documentation/devicetree/bindings/regulator/ti,tps51632.yaml
new file mode 100644
index 000000000000..67ac40e3ec00
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,tps51632.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/ti,tps51632.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TPS51632 Voltage regulators
+
+maintainers:
+  - Laxman Dewangan <ldewangan@nvidia.com>
+
+allOf:
+  - $ref: regulator.yaml#
+
+properties:
+  compatible:
+    const: ti,tps51632
+
+  reg:
+    maxItems: 1
+
+  ti,enable-pwm-dvfs:
+    description: Enable the DVFS voltage control through the PWM interface.
+    type: boolean
+
+  ti,dvfs-step-20mV:
+    description:
+      The 20mV step voltage when PWM DVFS enabled. Missing this will set 10mV
+      step voltage in PWM DVFS mode. In normal mode, the voltage step is 10mV
+      as per datasheet.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tps51632@43 {
+            compatible = "ti,tps51632";
+            reg =  <0x43>;
+            regulator-name = "tps51632-vout";
+            regulator-min-microvolt = <500000>;
+            regulator-max-microvolt = <1500000>;
+            regulator-boot-on;
+            ti,enable-pwm-dvfs;
+            ti,dvfs-step-20mV;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/regulator/tps51632-regulator.txt b/Documentation/devicetree/bindings/regulator/tps51632-regulator.txt
deleted file mode 100644
index 2f7e44a96414..000000000000
--- a/Documentation/devicetree/bindings/regulator/tps51632-regulator.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-TPS51632 Voltage regulators
-
-Required properties:
-- compatible: Must be "ti,tps51632"
-- reg: I2C slave address
-
-Optional properties:
-- ti,enable-pwm-dvfs: Enable the DVFS voltage control through the PWM interface.
-- ti,dvfs-step-20mV: The 20mV step voltage when PWM DVFS enabled. Missing this
-	will set 10mV step voltage in PWM DVFS mode. In normal mode, the voltage
-	step is 10mV as per datasheet.
-
-Any property defined as part of the core regulator binding, defined in
-regulator.txt, can also be used.
-
-Example:
-
-	tps51632 {
-		compatible = "ti,tps51632";
-		reg =  <0x43>;
-		regulator-name = "tps51632-vout";
-		regulator-min-microvolt = <500000>;
-		regulator-max-microvolt = <1500000>;
-		regulator-boot-on;
-		ti,enable-pwm-dvfs;
-		ti,dvfs-step-20mV;
-	};

---
base-commit: 962528fef90253aeded29cee20a9b6ff3595fed4
change-id: 20260626-ti-regulator-tp-f641a9f12c30

Best regards,
-- 
Bhargav

