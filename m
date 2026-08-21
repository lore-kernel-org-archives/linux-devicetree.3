Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5261830E0F2
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 20:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787345329; cv=none; b=YMvNnfA4YAflbZlClJaq+1zD2nrWF4e1Uh1lW92rEB1UrBGaL1CqCmnXTcrymVB/lqGXORtQJVIXpXrDhIdTGibDXQf0NAuWciOOif4iisa7UE0aj3BAanCGne7trFhIOEzPmzo3MgwQCTKxVZtdrTQxtl90inmJtv64sH+csW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787345329; c=relaxed/simple;
	bh=qHMHjHxt9qOFlhTACZWJ0m273uXcnrod6sFq22eDzR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MIPdMzUjlCKPRlVzkiCrikUu8hDlT19bATLUBayidNkSPr4p52R2fIFD3ur8qnOYkzfL/miv7gEmSNNPicYnw8iT3LfBKW3SoAL1z7f0o9m8dxfaKirSV3U8XNATiHbYHkLcN1/Qx+FXp7umCFvHpMbickcWWT/3RBIZhvT1um0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQGzhAmO; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQGzhAmO"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ccae46de39so2165545ad.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787345328; x=1787950128; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rojm+k4iSdRVF9a/PxgeHQrw8LlNRUPx5mwRZtxqBPQ=;
        b=SQGzhAmOf7sX8zH/Ui81NHwQLRGo39Hq+s3dUTncR4//mnaDCJaSzdXC5cG9DGHMPs
         3gZ5xje9fmCaJrY5qQNfpiYqxQwvqFz3SUlED7/EO6OZX7v1W1auuAteBrOQIpexV+0Q
         orskXxOYmvTu13IAN6QJ+fuOdQfQ1lDu348VypzABVzxmVFANu66PHJOZwSpauFR1AIj
         C8b+W3ZKKbt1eJAKKs4ZsutDa4tUYmoTkbWKYNAw/phcbI3DSpJWkz6jsgr9K7Khzm6q
         H7lEiU0dEBEEk5rU3SXSBYkK121t55Qlz/039z2QZQWLC8Q4HyqRZ6XZ1+lWj1VjCdRC
         sV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787345328; x=1787950128;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rojm+k4iSdRVF9a/PxgeHQrw8LlNRUPx5mwRZtxqBPQ=;
        b=gXeqoVU5m4OlLQOuH4R8Lw4ZhcgT23NiojZMxUlttl2Nfs7QYnyP1wGQirh7zbmcCo
         wtytpRhA5/+KbHT2mGzU7PBeo3BOS8UwkwUdZIraMjEC7OMZIpheL1nawOPCF2zyPFmR
         sSfh+uP9NbHjNknjPYSIiPO35HmLrTCegHEqpfnIfHMiF7s3kUZTrtaql8l3EQhO8NMH
         Jp/wSgh85O96kjWBBU6golfWETTFX9YtKLrN/zzBcjlYMDKpmKaeRUAAhR0P9gi1Yg51
         EpnQrZA4w4VHxsy/Diut+YD4k6D39qTDevQfLQLWAJ+q9zcQv4aOZpauxr3ozg2B9VDn
         2SEg==
X-Forwarded-Encrypted: i=1; AHgh+RqvrxsWDDJkUH5NTd0v665161RUbjmhHGET1o4RrUF+hS7IA8paifzq3wHMVji6RwLKqN5yJ3826zTR@vger.kernel.org
X-Gm-Message-State: AFuF++ngCIuDcggIrDcApMzBAXaMEOkFAf91WOtjSCWGAj8dN0IwenI+
	MitvFeU6blMwzrMhGXsrS6Zt+gVK4NKH50nG+jyItdRR2tOC1lPL2UN3
X-Gm-Gg: AR+sD110j4e1+S4SY0ZR9na14BdZ3wEhkGl+HQElMhRJBmu0EhzKPd7HLVWj6TThXIm
	Jcd35EKgFFpb1eWpvry5P8QP70tdj55aI5ObIsSJrsJeHbc8m9ZHJsT3lV+P7UtayAV124tYd+h
	M7Dt/9Uc0DxLys8OidCC9kSQ4yGQRHxHFTtwMntlbwzPWccCOiAsRsIXSzvVcs4MPF3vWwwQbnn
	wWKi9tACbnv+aV0K/bm+MIDTWftr8w9QquItnf28nnOvt8czLNL1gcN7wAvKjQm9QqRHM/x8LDa
	qb9RUtOW39BbDvH/39bjJjLSIMqMAFP6KBvByhonlc+T3qemQTF7btFIrHo0wLfxKf8BTmF47uU
	oArIOKZSPWImu6Jf3/8RK++SORwRXV0JSbgzsaDIxoaO5M8HNVa5V28gcAH5yzGPFIDOv/pEv1E
	bbywtInEWnrnrXLzXOQheutDdGB6r7ElO/GFzEpmF8tPLTEIIAsbIVShhQLDtLzN+VmhkZkHUQ
X-Received: by 2002:a17:902:ce8e:b0:2d3:a50c:5e19 with SMTP id d9443c01a7336-2d64ad815bdmr83509775ad.1.1787345327635;
        Fri, 21 Aug 2026 13:48:47 -0700 (PDT)
Received: from [10.90.163.252] ([2409:40c2:5400:571e:d71e:3d6b:f245:8387])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c3fc6675sm42808199eec.13.2026.08.21.13.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 13:48:46 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 22 Aug 2026 02:18:03 +0530
Subject: [PATCH] dt-bindings: pinctrl: ti,pinctrl-palmas: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-ti-pinctrl-palmas-v1-1-a4d49e7f2dab@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBuo6YfqKtFCdKoBM9GIQLp70
 vJbvJcgchCOMBUJAt8S5XQZdVmA3pXbGMVkA1XUVwMRXoJenL6CRa/soSIydz3TqBrTNpA7H3i
 V53/Oy/t+X6rHvGMAAAA=
X-Change-ID: 20260822-ti-pinctrl-palmas-ee56e29a3d43
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787345318; l=6098;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=qHMHjHxt9qOFlhTACZWJ0m273uXcnrod6sFq22eDzR8=;
 b=j74mL6e9aZUj6abhaSI1AfjNlgDwwilM+qW6klRFeW8ZkeHUbsjPKpcQQjQz2yHprxjVj9hl4
 kFlLWWrwY4QA0m0QZcZ1k9Czuj9c6rTAEypF0La72Oz/UEdvf8Ihwc6
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI Palmas pin control text binding to DT schema. The legacy
binding allowed any subnode name. Restrict them to standard prefixes to
prevent the validator from accidentally evaluating standard integer
properties (like phandle) as child nodes.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../bindings/pinctrl/ti,palmas-pinctrl.yaml        | 175 +++++++++++++++++++++
 1 file changed, 175 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/ti,palmas-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ti,palmas-pinctrl.yaml
new file mode 100644
index 000000000000..c07e3a782ef0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ti,palmas-pinctrl.yaml
@@ -0,0 +1,175 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ti,palmas-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI Palmas Pincontrol
+
+maintainers:
+  - Laxman Dewangan <ldewangan@nvidia.com>
+
+description:
+  The pins of Palmas device can be set on different option and provides
+  the configuration for Pull UP/DOWN, open drain etc.
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,palmas-pinctrl
+      - ti,tps65913-pinctrl
+      - ti,tps80036-pinctrl
+
+  ti,palmas-enable-dvfs1:
+    type: boolean
+    description:
+      Enable DVFS1. Configure pins for DVFS1 mode.
+      Selection primary or secondary function associated to I2C2_SCL_SCE,
+      I2C2_SDA_SDO pin/pad for DVFS1 interface.
+
+  ti,palmas-enable-dvfs2:
+    type: boolean
+    description:
+      Enable DVFS2. Configure pins for DVFS2 mode.
+      Selection primary or secondary function associated to GPADC_START
+      and SYSEN2 pin/pad for DVFS2 interface.
+
+  ti,palmas-override-powerhold:
+    type: boolean
+    description:
+      This is applicable for PMICs for which GPIO7 is configured in POWERHOLD
+      mode which has higher priority over DEV_ON bit and keeps the PMIC
+      supplies on even after the DEV_ON bit is turned off. This property enables
+      driver to over ride the POWERHOLD value to GPIO7 so as to turn off the PMIC
+      in power off scenarios. So for GPIO7 if ti,palmas-override-powerhold is set
+      then the GPIO_7 field should never be muxed to anything else.
+      It should be set to POWERHOLD by default and only in case of
+      power off scenarios the driver will over ride the mux value.
+
+patternProperties:
+  '^(pinmux|pins?-[a-z0-9-]+)$':
+    type: object
+    additionalProperties: false
+    patternProperties:
+      '^(pin.*|gpio[0-9]+|vac|powergood|nreswarm|pwrdown|gpadc_start|reset_in|nsleep|enable[12]|int)$':
+        type: object
+        allOf:
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+        additionalProperties: false
+        properties:
+          pins:
+            items:
+              enum:
+                - gpio0
+                - gpio1
+                - gpio2
+                - gpio3
+                - gpio4
+                - gpio5
+                - gpio6
+                - gpio7
+                - gpio8
+                - gpio9
+                - gpio10
+                - gpio11
+                - gpio12
+                - gpio13
+                - gpio14
+                - gpio15
+                - vac
+                - powergood
+                - nreswarm
+                - pwrdown
+                - gpadc_start
+                - reset_in
+                - nsleep
+                - enable1
+                - enable2
+                - int
+
+          function:
+            description:
+              Selects the mux function. There are 4 special functions opt0,
+              opt1, opt2 and opt3. If any of these functions is selected then
+              directly pins register will be written with 0, 1, 2 or 3
+              respectively if it is valid for that pin or list of pins.
+            enum:
+              - gpio
+              - led
+              - pwm
+              - regen
+              - sysen
+              - clk32kgaudio
+              - id
+              - vbus_det
+              - chrg_det
+              - vac
+              - vacok
+              - powergood
+              - usb_psel
+              - msecure
+              - pwrhold
+              - int
+              - nreswarm
+              - simrsto
+              - simrsti
+              - low_vbat
+              - wireless_chrg1
+              - rcm
+              - pwrdown
+              - gpadc_start
+              - reset_in
+              - nsleep
+              - enable
+              - opt0
+              - opt1
+              - opt2
+              - opt3
+
+          bias-disable: true
+          bias-pull-up: true
+          bias-pull-down: true
+          drive-open-drain: true
+
+        required:
+          - pins
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    pmic {
+        pinctrl {
+            compatible = "ti,tps65913-pinctrl";
+            ti,palmas-enable-dvfs1;
+            pinctrl-names = "default";
+            pinctrl-0 = <&palmas_pins_state>;
+
+            pinmux {
+                gpio0 {
+                    pins = "gpio0";
+                    function = "id";
+                    bias-pull-up;
+                };
+
+                vac {
+                    pins = "vac";
+                    function = "vacok";
+                    bias-pull-down;
+                };
+
+                gpio5 {
+                    pins = "gpio5";
+                    function = "opt0";
+                    drive-open-drain = <1>;
+                };
+            };
+        };
+    };

---
base-commit: 818bebeb63dd6bf5f4e07e145f6cdbace520a34c
change-id: 20260822-ti-pinctrl-palmas-ee56e29a3d43

Best regards,
-- 
Bhargav

