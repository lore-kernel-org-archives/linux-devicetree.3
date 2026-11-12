Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509680;
	b=4RGQWXwZnxPxOe9O+bxqX0HktPdPnhpreL06HEW/MtSQPl5Z4R9r3ORIDbe2HEkguoV5
	 gSjd4J1+oyR+3nLZMUyC1ZPkME/i08glRpC4TqeijHR5ObG/yTWSgnShZtZuCDR3sDk6N
	 gtaKMmKrSjAGMvP2dyIcgq2n+s1Sw1MGS44kYj70nz0z6jYylowRafQ4BXlJQfqtx36fa
	 VDwmopYt3Z+QHAM3BB5VR8Qmri/k9OcggBUPwXyFy/f8/lvGBcsLy339AJHHT48g//N57
	 vmgXGYfm90jrAIBXzkUsKRJ+L0CHEA6opaXUeDu1AEcUm8/HhGIeMxFiGkSvX4eD9+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=fWLnRTHzq44+Vxh7KKtStPCPVQVw0PPt5S1VYLelmew=;
	b=RBP4wdATYHvuf+6+fJICssX4vtPAtaEn94hE/nZXdrDyPEi123Zbj9Jn0GOzzV5YWsOz
	 gAJ6I31OZhtiMp/RcWRkHUg3zLSUOW1mWpgVj0y5ms1KUNCZFrwxHMTGNw1zpMH8Gs5L7
	 EDILnozUnRvi0UDLnYKrapA0rHVFJGtMn+xnLVIDMWZ96qL0u0/lIYlW5LBoFdMLDJArf
	 UBPixEk1093PCz06l2av4I5sSheK82eI85+ClUCajmRFzr2dt3+fRi0vf1IkFEbF2fmxQ
	 za0bQd4J1FZYIAqNEPERLG6ZOS5IfSWZbncHdk3ljYq1LFGPBAgPPG9OWpa3vRQQYzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSSuklZK;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF62606A333
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 18:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BF62606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSSuklZK
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bb5afa736so22930eec.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509680; x=1795114480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fWLnRTHzq44+Vxh7KKtStPCPVQVw0PPt5S1VYLelmew=;
        b=iSSuklZKuBtT8njwpKc001LaXfFN+vhWrgJUEUcHcG/nJIYuWQaqz3eNp/YZcosj/u
         WYs5H+eJFwsZ7t3OraTGERkr/UOUGJXWAq3Mibl1GuKOjhjOs/MgViuKiDovLKt/kSD/
         tJSSKQ3dDjAyfVpzryYrPk9Ry3mXpgcZGEV5twYfZhPn7YM8l1/fDgftEg+0DL22iuTX
         tQbG7MnEI/ZkM+E8LATUfwg72KnahVu/UeojFPXf0++g3zb4uZnC6GQAquc+eAY/c6kO
         bWcFg0WJdI62l63QTUmomSHkDKE/GcAgb2tMSc6mMi99uXjEkseM3ZtpAvT1iXk/P56P
         dc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509680; x=1795114480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fWLnRTHzq44+Vxh7KKtStPCPVQVw0PPt5S1VYLelmew=;
        b=Xc/i5iWUw4FrGH3UV3HDESe144d367U28ss/a8x+9PuhAWb96CswICSahYWoLV8HMm
         JA2rN+H751vAKTVDJOq5Zy4MtniifRN+k6i13YFJIbpxcnidyMoZYYgJEmxahiixW2d2
         8O0ccuNY+HEOUbUFKvqO3KPfDZzI6iwC/Kh+Fflnb2h2927x8UoNsy/ibctDz1/FWEGh
         MYslk8y0lQfeu9hXSeIgtN2aLWsgVC8uvVYLBa9NBvnH/EOXLH2/PuVBKQfDxZL1aGag
         eJEC/U6clNpZOwsh5I+8Kd5XX1HQAlkK008gBEDtXFxEVrhYsg30n2hIBGgisbH6DKl+
         pgDA==
X-Gm-Message-State: APuU4Z/b4SBDKPswzVhzfpXFLrdEfoWoPYaqYCt3W9izR7eOhFELinpL
	0o5Jp56Gxx4jvCSfPQk8xtXcowKC7rBHf53DFtDp1bghKhavJ53Ja6mv
X-Gm-Gg: AYBFou2mmT5jCGAxDWXcVxX9WiKfddmyHrYeng1zdpVfRiTinYrUKI2dU4DbzD2ztCj
	p/RBpcpGo9GAoCtVyKer4pb6h8qz45zphlM9rImDcHEJWi82kxQh44Xs4kvI+HGJvnQpCRKMm/Y
	vohHM6L1X9cT+z/CK9nJhL2pHTx1s5TuGTxMZsu7AzTt0inkVdsoSqH5m8w62Jw2c2t2xQ/Rjst
	/+YHm04AH7jg5o2UP6cG9fFq0bDBszujsYtxNZEl01XlHoyRCfNQNNpDeKw208Kb/TuAuO12Vt1
	nZPAKQtM+FfTioqN0jLoN2AtFuEy1WSKJC2sizTbnNT7HrtaeadyVeea3Cru3AOSnnNWDVlIJyt
	NohXonf7lrE6EAO5kISO3j+ZsQcVhwWVRJ5yPBEcLPnjk9CH0kvfWdFO7MwhIokeSK/EBeE+ZyL
	Oyjp/QzpT86Cf72zqxfkWi8wFJc9QCctyA/49iACWl5stL2BOk3W0dWcvQKdlINveRNXdJtD8gk
	E02PQD50aXSoj1H683htTR51BfV2NPkEINMbwltM7u6Sf+8Ld7Iz2+24iQHutvd+KlHyKzVOjDo
	Q2zmy+bfajD4KJvIPAkJbkaRzvhk0HPq5GDqjA==
X-Received: by 2002:a05:7300:6da8:b0:36a:e7a:e89 with SMTP id 5a478bee46e88-379659c6815mr96217eec.2.1794509679625;
        Thu, 12 Nov 2026 10:54:39 -0800 (PST)
Received: from [192.168.1.4] ([2401:4900:881d:321d:eb39:71d3:15f6:5fe0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm339008eec.22.2026.11.12.10.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:54:39 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 13 Nov 2026 00:24:04 +0530
Subject: [PATCH v4 3/3] dt-bindings: bus: ti,omap-l3-noc: Convert to DT
 schema
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-ti-l3-noc-v4-3-5084dcf4ffb4@gmail.com>
References: <20261113-ti-l3-noc-v4-0-5084dcf4ffb4@gmail.com>
In-Reply-To: <20261113-ti-l3-noc-v4-0-5084dcf4ffb4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, linux-omap@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794509656; l=3333;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=WKKUN2jQjfC7QZp1fenPy2OkomRsdptL4bsEgub5sUs=;
 b=5D5VKA3cRIKqxXzxuLlHYsOud0dxvXQ0hWDcOveXaGCvjS6IyWuXgLxqo1dqKWAi+5aEr7rmP
 Dq9LpAQ013uAi4wmvJUv4KNEQd0w8X5IOd9ef4WNucRWkYReGyt2fQE
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI OMAP L3 NoC binding from text to DT schema. Drop
deprecated ti,hwmods as it is not used anymore.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/arm/omap/l3-noc.txt        | 22 -------
 .../devicetree/bindings/bus/ti,omap-l3-noc.yaml    | 71 ++++++++++++++++++++++
 2 files changed, 71 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt b/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
deleted file mode 100644
index 66548395fbdeb..0000000000000
--- a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* TI - L3 Network On Chip (NoC)
-
-This version is an implementation of the generic NoC IP
-provided by Arteris.
-
-Required properties:
-- compatible : Should be "ti,omap4-l3-noc" for OMAP4 family
-               Should be "ti,omap5-l3-noc" for OMAP5 family
-	           Should be "ti,dra7-l3-noc" for DRA7 family
-               Should be "ti,am4372-l3-noc" for AM43 family
-- reg:	Contains L3 register address range for each noc domain.
-- ti,hwmods: "l3_main_1", ... One hwmod for each noc domain.
-
-Examples:
-
-ocp {
-	compatible = "ti,omap4-l3-noc", "simple-bus";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges;
-	ti,hwmods = "l3_main_1", "l3_main_2", "l3_main_3";
-};
diff --git a/Documentation/devicetree/bindings/bus/ti,omap-l3-noc.yaml b/Documentation/devicetree/bindings/bus/ti,omap-l3-noc.yaml
new file mode 100644
index 0000000000000..85f314f177379
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/ti,omap-l3-noc.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/ti,omap-l3-noc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI OMAP L3 Network On Chip (NoC) Interconnect
+
+maintainers:
+  - Santosh Shilimkar <santosh.shilimkar@ti.com>
+  - Sricharan R <r.sricharan@ti.com>
+
+description:
+  The L3 interconnect is an implementation of the generic NoC IP provided by
+  Arteris.
+
+properties:
+  compatible:
+    enum:
+      - ti,omap4-l3-noc
+      - ti,omap5-l3-noc
+      - ti,dra7-l3-noc
+      - ti,am4372-l3-noc
+
+  reg:
+    minItems: 2
+    items:
+      - description: L3_MAIN_1 / L3F
+      - description: L3_MAIN_2 / L3S
+      - description: L3_MAIN_3
+
+  interrupts:
+    items:
+      - description: l3-dbg-irq
+      - description: l3-app-irq
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,omap4-l3-noc
+              - ti,omap5-l3-noc
+    then:
+      properties:
+        reg:
+          minItems: 3
+    else:
+      properties:
+        reg:
+          maxItems: 2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    l3-noc@44000000 {
+        compatible = "ti,omap4-l3-noc";
+        reg = <0x44000000 0x1000>,
+              <0x44800000 0x2000>,
+              <0x45000000 0x1000>;
+        interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+    };

-- 
2.56.0

