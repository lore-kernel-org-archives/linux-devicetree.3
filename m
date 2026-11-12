Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505918;
	b=2mbjz88htVcU2c6ri+chqP1OCwaNU84Ql0/RUa9nSk+KMXnzgCIeuJZakECamHE+6r6w
	 Ed9t2TwJ31t1DkuQgvCRN7ElNw8HUR1HrSV/tsQXT5aaD2n+D6IxcWLDmlvjrQgB+zurL
	 683Uwfs7tL/7qK/5TUfGOTr4D/pRr/E67dKQ4HLIPMCnRIkSQ9bsAktyT8jBtHQVkkQ4Z
	 k7eEgdBKnEk1kTZrmygXfmjVDziy6S7vXaQtpCA54JFrx+dGvkugZbZlCEGmorYHKezl8
	 LyUT6M+La5RElPz05HB41+exMhkjpkfe6WAimBL8h+1rzuymeJS3h8Sch1vHS1SmATw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=fWLnRTHzq44+Vxh7KKtStPCPVQVw0PPt5S1VYLelmew=;
	b=47I2aBa0d7JTB94sh4aZiTNhBvXC9SgjBj4KuvCCF4PYE0+so+86Er7VBlEvVnb0o7DZ
	 jejn22sp54hsYw0cdO2wI9oVDOzBamGqKx5tbyjHzdg8uPsDGrQogb6pNqCltn7sRSdHC
	 09zqCita4fC419x18bksigxgGrzNI9LdTzBAh65JnDdSAHWgj4ApDV+08OQryfRolaCsM
	 QxO5dhoiL/oi3qM5ZZ97mEX7spuhUiBhhX+W/SeZENZ10c6suXxLz4cyNU0239y33SP2V
	 SbqfVMTE0EpCoD7iXQ/K67sgOTjKUAXTUKnkOLaUjsXKMTdaSaOiGzIYQOJ+VFVrvug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPLZHWUw;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A300606A32E
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 17:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A300606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPLZHWUw
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37605faade6so19180eec.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794505916; x=1795110716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fWLnRTHzq44+Vxh7KKtStPCPVQVw0PPt5S1VYLelmew=;
        b=wPLZHWUwS4SkAzUrIEj/S9yspQRsPrlBsgwP/pUKdTmQxCGl6I4PfcNMjKMgcxJLat
         7+8eZmhhmNfZnSbUIEvhYhcaviJPQktGzGZsPSmo9Ijs0zO2ed2Ja6wGnwEbFPe0LpVD
         NoxN2ku7SKy9yA8c8w1s3vDjVSJm3K3bJrYgRSnepc0SFwtxTYaW58fbEuARLZ7IiDft
         bBAUZmoVDe2eS6Fx7N4aAAgFMN6e380of1eLKWiBHzCnt/lZYtrj0gzTwgrgWmWHoQpg
         dzrczmESX/20YnGx2F7NFukpMI0/+H8Vr2m5xM/5ZW1wT0Zg3MYtPrjGdXV/hi++r+Wv
         KZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505916; x=1795110716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fWLnRTHzq44+Vxh7KKtStPCPVQVw0PPt5S1VYLelmew=;
        b=I3hRuGBXTLfAnTTz2d8QLcMtyklixMNhcNEqbu+4tB/OH2QCH5+baea76pcVmEqOpK
         pbcx9FLOBoc/5sOSCORBZX//xkv1MkX2QPThB6X4w9N59LS+HHPEglAsUoUCXdkUYa4W
         kL+61U6jMaV56l5tW5r7icwCnsfgbMG7D9/JLaNL/GrWFfqjwABLyUnTftlpZpyK+Eeg
         x9QrgZMSt52mIL0AMe1xJvP+Z1Jiy216/x2+Zdsta2r06UL0aLN/H34sOI4D1gnnEyCc
         vYtE5MStsyff27q+J2/mDJcBMjRL30Dpl1WO8Bp8NswvGixhP9u2zsr4qF3zzQbYU/M/
         8NEQ==
X-Gm-Message-State: APuU4Z9aqe4pcfJMdxsjSDqAHLulw5HA8QENh9pk2uj585KD18dpz/Kd
	QcivMbi7PBXxlkryjtS7IqcQXEshJjtIoJJ8l3mUP3HMS3znPnN6W3ev
X-Gm-Gg: AYBFou3JQiXQmOy4uyYYdeO35GOaYXbrjUrzMvZYuZuFo+qyzbxtwZ7vVwbKDESt1bN
	9t7mhntWoYZNx72A3LqyGTWSVWLJY1BXqaZc09d27dVAdsNZDyEQfhqB3k9sCCfRtV6ajh69rya
	oDryKosGzEX76HwU8MQ7Sbjhh47Hcad8/4l2ybqLEgg+3Nx9N1On3MUDLUWWKEbPycoTaLlbQ7K
	gAfiBBZtsuqaQX2leqILoPfeTNqZnCea9lbfx70H4Nz1a+6UODzIByIFn900b1NATKVBGKVGDu9
	XOBFjskzXk2hNtMJF+oa57aDVnSa8pGG18OrcKWQHc1LqFGpSpe0QYGrswCkMqQvUmPIW6zqPpu
	X5eqML4A6gRMWLoipi0JRlQ8qeC0Aw65OQvPoND0P7HHhivcG39+IW11sNe0g++aFy4gmYOx8hR
	zP5kuaM+POzEKNJL4paeFn/EV9Oq6pPoaQz0mju8XweZWN+/WnPWaplfayZWBKMnyZaS7QsTQ6b
	GcOUa6C3VBfAuI+7QJlIB57E554PdiML5DJ9+hxLh2X6D+i9RD9C4jixbnoL+Znvi44NohGQuHG
	Ddf+tlwCqtnn9wYtmwS2ljQeVsYzJUZkJyTHIA==
X-Received: by 2002:a05:7300:5621:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-37684af683dmr9424431eec.1.1794505916366;
        Thu, 12 Nov 2026 09:51:56 -0800 (PST)
Received: from [192.168.1.4] ([2401:4900:881d:321d:eb39:71d3:15f6:5fe0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm237865eec.21.2026.11.12.09.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:51:55 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 12 Nov 2026 23:21:23 +0530
Subject: [PATCH v3 3/3] dt-bindings: bus: ti,omap-l3-noc: Convert to DT
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
Message-Id: <20261112-ti-l3-noc-v3-3-7281b1af8030@gmail.com>
References: <20261112-ti-l3-noc-v3-0-7281b1af8030@gmail.com>
In-Reply-To: <20261112-ti-l3-noc-v3-0-7281b1af8030@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, linux-omap@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794505884; l=3333;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=WKKUN2jQjfC7QZp1fenPy2OkomRsdptL4bsEgub5sUs=;
 b=OC1C4RTN4l9W6mCWrzTTZAIVvuxMqR6iLq406lkQSIet3W+nLW5+HVOeV23STNKKosuTOx0K8
 RNQ4WzO6L0xDdaIcp5dmJ+GepcTWaTfrbCKBQongjNDNIlYSmlU7CJy
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

