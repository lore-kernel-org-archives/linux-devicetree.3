Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505911;
	b=ykTT+nQ3D2GJ5fSil5ArgaIy2xepSQd5n8Xsp8mDfreql6FLx/cJIVUwVlbMkEOXyt2x
	 rP4XNEW7vt3NNLLwcJGCUi0dnwvrlPyp5cN1RLKMIsy11kjZEfdJa9nrb+XJY5nAWdD06
	 QaZx88196TvRr7Po86R9ofmWZ0UPK7jM/SqVX7sJwZE90TG3obw1vB/bBiWTlCc5oIE98
	 qMH9fVyPb5onRg0g7UaHuvoCK8sBYrHXofklTEmTQtfQ90+92XkY6WYehhiKb/Yr7HPS2
	 B/WD4C61AC5pOXsriMF1FHw3FjHq6y1rPs03C86S7sIrwmpyPNZOqzFcuv2voWDUaQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=I2dfl244tn//FNEVdYnTrtu5nFcZVy8qcMm6ScJJItQ=;
	b=a8JpRyu96ZuFR2AhCBueXP0OPcEQaBwA7+vspKYkBLKSe44pH9rXvWmoSmLTjA8pBcOb
	 0srL6bq+eYLZrilMOO2sLxqAc5zvNp9cgiyuWKO3I7K6SxbSSTJ+8YwNFhJWR2sY1Oh7y
	 s+LqB1qsq3ofOIvnCjGAOiZjHt07bxp3RST4pY1vzHWqqoA94ne7Hb9WC4Wdjlw/7ICgF
	 7HsZwFAPs4wwk/2UTjwR12CNSG3QOtl7mQNLHnacTwCnrZaf5O0uVrt2WbfaIOfM/QXzO
	 4264vDbUCzZxq5S8Slu/hk4a1GGyIRaJJx+yx8fdRIBVgVnUthfTnZK041HVd3iEEhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DyYlnzBh;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0D7606A327
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 17:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E0D7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DyYlnzBh
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37605faade6so19161eec.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794505910; x=1795110710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2dfl244tn//FNEVdYnTrtu5nFcZVy8qcMm6ScJJItQ=;
        b=DyYlnzBh9wkYoBqoOzh21p1Ny3QvU7OWQrwBBQoxsNKfGFDdYYKnfzEo2fJt/KS3AO
         upwtYyF0IXDnaS2Ef90OBIoErsZ5gEdo44zHtRaMHln3w0ieZsHkzhSLCTQGKignBSfH
         GdspPJFZEV4Qqyj6TWTb/d8lYBgV5J3/Ruj54NlmdGd8etChZTlQlfRYHk9eApRbQQ9s
         S575oKHhSbAmdLN6KL0RX0UxVlUNu5fZYLBeUTGPjW8OXdByVmecPiwuEmYWyFYQhAN8
         KLWprkqSTltfUsTkoEljeca5x3dG6NXmczLITb3EkR1RQjX9QRN2HGz7XNC6x1tJ2nd1
         yIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505910; x=1795110710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2dfl244tn//FNEVdYnTrtu5nFcZVy8qcMm6ScJJItQ=;
        b=0AP+aO0AYcrwNPUq6TwcBBRxIoj9U6W9UPMKHIf43vOrGAh895ghvWFDFPCz40tGy0
         cIIfTuZl+8ZDVO8mMZhS6moOl2ITnrxkh+bqRCdKAa45H1NZaB1DLEsSGsux3YOkri1G
         nXEYHPd4PS0Vpu7Fvz1w2NkcaxGkDk5Ciq2RQXbxC8g3thbIdpJTyyvi6cgd2TJ/plbg
         GslZTfXYsjkG0AmY1uiJCDQVpItnGdI1jsC/MRWjgPbZQxM0t5Q6pVLA8luZnEzrt+YN
         VLsfE/K7bqhPJ/cRsBCFQxTIU27z2mjiSyyXchhGWvlVIWzCXQNy5YKDZ24FTahCehCg
         hvDg==
X-Gm-Message-State: APuU4Z8XLaaULhqWRLqcgmdpts57wrLfVZIIT97el14Zvo/dXC/S4+KM
	/tqO0A/5ibQXi2zraDtKom4pw5zq8Fr1QGrxOxT6t30BnjGczP4CSavV
X-Gm-Gg: AYBFou1RV2aN3BLv9iBIjAZg9iG+Vt8oCCaidfS/cPDqVzBjQokO0NKvPmRMtPoZLdP
	0ZoOTnFF/tQqpjQr4+gJNsrz+1GceWl+K/i/S+6R5iOPPacY3KnRKaSrxUTc1W5NO4zKj9RGQZa
	ueRMrJmBrfepNxkjg2ebdqojIKEmKWCAfSDrGLfyvyDhDXg6jSSuluCKoOkL103SOHn9hkLhBz6
	df/NEjcT3/pScufFcOtPKsNtgZmpYAt75b/Lferr3EvKVHE4iJGUJaBP8k6FKs0Z3EQwahoIHMb
	wRC5jdd4wkthlyaUSYhZti93sViQ2LrYSL9NUWrmCucqk9pij3pvxUi+16uyjfJgJJr2bE8Kpln
	am+4u6dmApNNYTJxqgVwf+cRtVvR2Fi7tvpHCXGJBD8NEy/HMf5HvvYuJ0hsg14kxdLIkaW/PoR
	1zMkueaEVY9O5r506J/cbWmAs5fVuZYNI40L0yJ0KFbX4MWwTWxPYkU0XHSEcmQQPcxWay3fiBw
	K/l7CKgR6uVsYCeIwK2o8TUn+duKce6dMh+LdeNgt6KcXnAR0YpUFUedFyxTr/Eis1LHwwgh7LR
	2N3yNtPIqvyTBuMkO2/3niaEIwRSZrRUYadKFA==
X-Received: by 2002:a05:7300:fa13:b0:372:c0ee:875b with SMTP id 5a478bee46e88-3767ff8b6abmr9115049eec.0.1794505910440;
        Thu, 12 Nov 2026 09:51:50 -0800 (PST)
Received: from [192.168.1.4] ([2401:4900:881d:321d:eb39:71d3:15f6:5fe0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm237865eec.21.2026.11.12.09.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:51:49 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 12 Nov 2026 23:21:22 +0530
Subject: [PATCH v3 2/3] dt-bindings: bus: ti,omap3-l3-smx: Convert to DT
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
Message-Id: <20261112-ti-l3-noc-v3-2-7281b1af8030@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794505884; l=3177;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=VcMCFSKS70ZEJ/l7njJYWZd3HaftGHvosq6YFQyTzvA=;
 b=usK4kCKCiLrAjkLKIElQde61VHfsg4025isQ+OOd12f7m6pXAqAZWbLOfsmCKQkDinGYlCr20
 akwgiP4GRZ/D+tAtoSlRP4eKFAX3e41m4Nf+HIK+CDCdjnn0iPhJZMN
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI OMAP3 L3 interconnect from text to DT schema. In text binding
this was grouped with omap4+ L3 noc interconnect but since it uses
different hardware IP (SMX). Add SMX variant in new schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/arm/omap/l3-noc.txt        |  5 +-
 .../devicetree/bindings/bus/ti,omap3-l3-smx.yaml   | 68 ++++++++++++++++++++++
 2 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt b/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
index 161448da959d2..66548395fbdeb 100644
--- a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
+++ b/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
@@ -4,10 +4,9 @@ This version is an implementation of the generic NoC IP
 provided by Arteris.
 
 Required properties:
-- compatible : Should be "ti,omap3-l3-smx" for OMAP3 family
-               Should be "ti,omap4-l3-noc" for OMAP4 family
+- compatible : Should be "ti,omap4-l3-noc" for OMAP4 family
                Should be "ti,omap5-l3-noc" for OMAP5 family
-	       Should be "ti,dra7-l3-noc" for DRA7 family
+	           Should be "ti,dra7-l3-noc" for DRA7 family
                Should be "ti,am4372-l3-noc" for AM43 family
 - reg:	Contains L3 register address range for each noc domain.
 - ti,hwmods: "l3_main_1", ... One hwmod for each noc domain.
diff --git a/Documentation/devicetree/bindings/bus/ti,omap3-l3-smx.yaml b/Documentation/devicetree/bindings/bus/ti,omap3-l3-smx.yaml
new file mode 100644
index 0000000000000..11f0ebb0cdfc2
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/ti,omap3-l3-smx.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/ti,omap3-l3-smx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI OMAP3 L3 (SMX) Interconnect
+
+maintainers:
+  - Santosh Shilimkar <santosh.shilimkar@ti.com>
+  - Sricharan R <r.sricharan@ti.com>
+
+description:
+  The L3 interconnect for OMAP3 is based on the SonicsMX (SMX) architecture.
+
+properties:
+  compatible:
+    items:
+      - const: ti,omap3-l3-smx
+      - const: simple-bus
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: l3-dbg-irq
+      - description: l3-app-irq
+
+  ti,hwmods:
+    description: hwmod names for each domain.
+    $ref: /schemas/types.yaml#/definitions/string
+    const: l3_main
+    deprecated: true
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
+  "^.*@[0-9a-f]+$":
+    type: object
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    l3-noc@68000000 {
+        compatible = "ti,omap3-l3-smx", "simple-bus";
+        reg = <0x68000000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+        interrupts = <9>, <10>;
+        ti,hwmods = "l3_main";
+    };

-- 
2.56.0

