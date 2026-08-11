Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED86422E35
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440141; cv=none; b=AyWSCo/Vk/HfMnBT3dPpFmTCaEMWxjVWpAoh+b4Zzyn+E1KhIuwfuopRpZCCjMH/wfNWbOzaMB6lzQhf9bst+UwTL5qGGnEBV4wtSd3RwQtIf1oSjw7hVHdW1F2mTcmcPvsBtx7SnPf1WmKLp8vKBCWxQPCCBQYvISnA5YHMsqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440141; c=relaxed/simple;
	bh=S3A2ra3jz3AcQxeTx3cJwZ7OkPVtzFnz5WVpXi4oW68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PJ0XodOazpvWBi51SkNvP0rUwV1UCHxImFAEiiymmAGjAwK7XnbJ6uLwMFXnIEQd7awkexwEsp6ZPnq2hUK12/OLJoL2cuUqEoh1VvTYJA9noiT/Vub/dJXuPP9idqOJJLoCVyiA2G2VlcQYYGhvPFt8ccepD89t8WVIdTpOafg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARgbl+Wk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARgbl+Wk"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4994c49f588so7396755e9.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440138; x=1787044938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EKXI7y0JHFmbbxY51QxCMYAPTBi2nh1lduL5Yg6Ghi0=;
        b=ARgbl+WkLXaccKKdxRd/al3AzRgTNFjevmintXBGx34MDH0ePRKbdmN0c5VoX4KY4g
         5ldXvO6hPyECewDjdjfGtpRtM35nPLm1MZiLkvCyabVzQkofnmdZx52y99WMRQXaYUcB
         cZZNda1k3I7dN5AavDhQ4iitkiwHy3GrM0eTaswbeHlp2KE6FAWi1WXQis52W8mNF4nU
         e9vO4Uv97Cfja0Bo8o/vrnv5bjxCJUqHC0FGPneUhCltHagrASMeVxlWqwNQmsGNnb/h
         YOFMa60VUhEDGCYChNiAhalMUfszWLixH1Wt4k5QXUjuJZNRUxXLbcrxw/YT3/8UjXie
         AQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440138; x=1787044938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EKXI7y0JHFmbbxY51QxCMYAPTBi2nh1lduL5Yg6Ghi0=;
        b=TCKAD8texCL+QQk5zhB/J9Du8JQyrjvRT50qOCYjzWyJLUfBmYOcdTP2U/SmaE47Rn
         c+sdNqfllS573+dVsdpVEbLN7aWL1bEKILigsuqBq0kSJ0aPcE4RbifTkkkMUYTiUwCJ
         d76u6VTzolvEvWE6zNG8lBUusUi5fbPi8p15mGswtGlPOT7O9/AJq5bJIZpENhlxx+Hg
         Cfz2hq3Qp8B3tzYXBmep+AoFKio8Ox7inMoxiD/WhQVeMcwZmfKWTS7WwKbxskb6o+On
         7l0xmR79npKYLbQHcg/vdNxFgKZmBJSwVdStEbHCT4mFk27yuAxGQVkN3FjrFtX8WTut
         XjKw==
X-Forwarded-Encrypted: i=1; AHgh+RrH/URH7eI4KQzf7DOGJtZGT7i9Vi8dg4dS71BwPwRWOl9/oL2WHJW8589/51i/NiHt3D+9RNqVCsMZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1OuGs86YIu3aLz2TCTMzyKxeRQHHS+Ymo3Gi6MBKfc4971Zgv
	HcZcM28qD0t8HAq7w4kon19m1b142HP40FHM69o26K3ODyhb7tGoZfui856Z/umo0fcOSQ==
X-Gm-Gg: AR+sD12jNabHbdm5A+ODp9ZwYR+Klh2vqZsqc6jLLlpHA1253jPsau8PdspaFaBF8qM
	jxxogrjlID7TxxOpSU4MJC8Sw75XbsTrg1HAxzPgtZ4aDHOSvS+RUICmlnw8yPxmyNcTS2qA3Z1
	ilrU3FZDqG8haskhFi8OGv2dzvkYwEqzA6u8Ch46i9zrAyAjJ4augbqUvbaIrCgUjApSB2p6QW2
	RGB93VtoAE3n4rTx+yYzow1zJiDuzGSHNgRwagKV7aUo1fzVQhtpn66ieDp+zaV93MgziX2vp+7
	foaPnl+8sKiKc4XJcQZ2VKFBp8DCMCogSJML1wwP7a4lzIfW/2upU63KHV+sdVhQdswbnY0ZVjA
	9h3jrhnyiOplXmRyqMGJn56IBQ976fvfMCwM1JbVzmrDV4iUP4trRhXieqgZGUvy7Wij25vXTBO
	uXPjhO072OO0DrKVtUKX75WpP2l2BkbhP7/rz2wjIssN3hThzDJMTWcTPW/8pwbgXE/XQRnGstw
	Wy/3gnfxwwb9//t0VX229nlSAgeVA==
X-Received: by 2002:a05:600c:19cd:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49978ef4e13mr17934985e9.6.1786440137773;
        Tue, 11 Aug 2026 02:22:17 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.40])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49978840189sm21849585e9.0.2026.08.11.02.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:22:17 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH] dt-bindings: pwm: Convert TI PWM Subsystem to DT schema
Date: Tue, 11 Aug 2026 09:22:08 +0000
Message-ID: <20260811092208.687731-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments SoC PWM Subsystem bindings
to DT schema.

During the conversion, the following updates were made:
- 'counter' node was added to the allowed child nodes
  list to resolve dtbs_check warnings. Some eqep nodes
  use 'counter' instead of 'eqep'.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/pwm/pwm-tipwmss.txt   | 58 --------------
 .../devicetree/bindings/pwm/ti,pwmss.yaml     | 77 +++++++++++++++++++
 2 files changed, 77 insertions(+), 58 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-tipwmss.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/ti,pwmss.yaml

diff --git a/Documentation/devicetree/bindings/pwm/pwm-tipwmss.txt b/Documentation/devicetree/bindings/pwm/pwm-tipwmss.txt
deleted file mode 100644
index 4633697fbda1..000000000000
--- a/Documentation/devicetree/bindings/pwm/pwm-tipwmss.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-TI SOC based PWM Subsystem
-
-Required properties:
-- compatible: Must be "ti,<soc>-pwmss".
-  for am33xx  - compatible = "ti,am33xx-pwmss";
-  for am4372  - compatible = "ti,am4372-pwmss","ti,am33xx-pwmss";
-  for dra746 - compatible = "ti,dra746-pwmss", "ti,am33xx-pwmss"
-
-- reg: physical base address and size of the registers map.
-- address-cells: Specify the number of u32 entries needed in child nodes.
-		  Should set to 1.
-- size-cells: specify number of u32 entries needed to specify child nodes size
-		in reg property. Should set to 1.
-- ranges: describes the address mapping of a memory-mapped bus. Should set to
-	   physical address map of child's base address, physical address within
-	   parent's address  space and length of the address map. For am33xx,
-	   3 set of child register maps present, ECAP register space, EQEP
-	   register space, EHRPWM register space.
-
-Also child nodes should also populated under PWMSS DT node.
-
-Example:
-epwmss0: epwmss@48300000 { /* PWMSS for am33xx */
-	compatible = "ti,am33xx-pwmss";
-	reg = <0x48300000 0x10>;
-	ti,hwmods = "epwmss0";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges = <0x48300100 0x48300100 0x80   /* ECAP */
-		  0x48300180 0x48300180 0x80   /* EQEP */
-		  0x48300200 0x48300200 0x80>; /* EHRPWM */
-
-	/* child nodes go here */
-};
-
-epwmss0: epwmss@48300000 { /* PWMSS for am4372 */
-	compatible = "ti,am4372-pwmss","ti,am33xx-pwmss"
-	reg = <0x48300000 0x10>;
-	ti,hwmods = "epwmss0";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges = <0x48300100 0x48300100 0x80   /* ECAP */
-		  0x48300180 0x48300180 0x80   /* EQEP */
-		  0x48300200 0x48300200 0x80>; /* EHRPWM */
-
-	/* child nodes go here */
-};
-
-epwmss0: epwmss@4843e000 { /* PWMSS for DRA7xx */
-	compatible = "ti,dra746-pwmss", "ti,am33xx-pwmss";
-	reg = <0x4843e000 0x30>;
-	ti,hwmods = "epwmss0";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges;
-
-	/* child nodes go here */
-};
diff --git a/Documentation/devicetree/bindings/pwm/ti,pwmss.yaml b/Documentation/devicetree/bindings/pwm/ti,pwmss.yaml
new file mode 100644
index 000000000000..53f88139dcd4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/ti,pwmss.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/ti,pwmss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments SoC PWM Subsystem
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: ti,am33xx-pwmss
+      - items:
+          - enum:
+              - ti,am4372-pwmss
+              - ti,dra746-pwmss
+          - const: ti,am33xx-pwmss
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^(ecap|eqep|pwm|counter)@[0-9a-f]+$":
+    type: object
+    description: Child nodes for ECAP, EQEP (counter), and EHRPWM
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    pwm@48300000 { /* PWMSS for am33xx */
+        compatible = "ti,am33xx-pwmss";
+        reg = <0x48300000 0x10>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x48300100 0x48300100 0x80>,   /* ECAP */
+                 <0x48300180 0x48300180 0x80>,   /* EQEP */
+                 <0x48300200 0x48300200 0x80>;   /* EHRPWM */
+    };
+
+  - |
+    pwm@48300000 { /* PWMSS for am4372 */
+        compatible = "ti,am4372-pwmss", "ti,am33xx-pwmss";
+        reg = <0x48300000 0x10>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x48300100 0x48300100 0x80>,   /* ECAP */
+                 <0x48300180 0x48300180 0x80>,   /* EQEP */
+                 <0x48300200 0x48300200 0x80>;   /* EHRPWM */
+    };
+
+  - |
+    pwm@4843e000 { /* PWMSS for DRA7xx */
+        compatible = "ti,dra746-pwmss", "ti,am33xx-pwmss";
+        reg = <0x4843e000 0x30>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+    };
-- 
2.43.0

