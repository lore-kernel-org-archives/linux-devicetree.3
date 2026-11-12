Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509675;
	b=PXsI44Bsqise6yXeFtsKqNg8wzx3QPwXSPz04Jh9qEZBQFMuos8G+iOeGIfMPrPTACt5
	 sslhIs2AoVRWdonH+524J3zxkbO9btZo7Aa1U2I26rCOGYMfWVs/wlbjUD68AEvRZ3Oaz
	 0/DQhO74QF/TfmG6CkqOK8LDD38BhtEZoe8W9befjfiOZ2UDhaCptWII8Apu7p8eypvux
	 Cy3uLN+YUiF83tmnDrbWSwffVKexaQ1EIF/i+nCfugpEEHJx8q3iIDdesInDV6I4moWsk
	 FilnNglIACdVmJ4F8uFLSxhsX0JKVou1zn7F7tD5OJRc1eoo++Z1fWxiGoW2okaw5eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=jeIbt2k2gIGUcVGK5YRi1yFkDF0bqtPi9E7+l8WvSWw=;
	b=qhQD4Tp9tWP11xbzRkFADkV4wsNvR7U9GLiX2RMYWwAIReTN8uhQInb8OwSugDJKHRr6
	 Y78DLzl9KHhK3rrxlnYnLsLqCG/w7SxGMX7bf5ZLU6biNuGr8tDq7IU0WhePLnJsexPuh
	 eL7hJGu9ubbNiYJmqacCldUNQ8nkxlkxqm1b9lz/7aB+LDNhWccvXd3n4MQjyvNyhG0sF
	 9DKOwP69TH4qDnFponewPtDK/BHxlrvLrxmkYhO++iFxDTHxxkLvRItXcEJ4WHDjpSpfZ
	 yuGJSjCPTWW0lW6RuW3wGsLb2WFBoVJ9vd537eVuyS/8tSoFrqLpA8n+2BizH90l2sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVjHZ6fN;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB96606A33F
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 18:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEB96606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVjHZ6fN
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36d1b3b9974so17140eec.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509674; x=1795114474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeIbt2k2gIGUcVGK5YRi1yFkDF0bqtPi9E7+l8WvSWw=;
        b=EVjHZ6fNXPaLODG6sUnP9vMWLY/UNtlt1EcihhyvGRME3dlPKU8PFigIin1smL+oVC
         w+M9PGYePcmJg3Bph8LjByEcrDSuFLpPiW9JEnnHndpHl0QgzGhZunY87WhK38dWpbLE
         liGVCQWy1iNTbN+VOxKdsisyWBk+m777tOAm6Dy/sKDAOALpEkMq+DL9JbeXY09Yl5jX
         R/MTcz9+KPqhmBi1k32OpPUGIUNKZ4C/WLSbtp4wYsuBAnQAeHJa+cAcKkfgQ3x3Cif6
         ePqQI4qEIzNbC9Yyn5WCqtqrCSLImfJvDPv3y4Iao4v6EtAgTI09m2+G/IIZxdZlY6Cn
         egSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509674; x=1795114474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jeIbt2k2gIGUcVGK5YRi1yFkDF0bqtPi9E7+l8WvSWw=;
        b=da/V/AZDHh3nEjzcbQDkx5VnsMJJsrO2njxPEDOXSKbEML4sGge3D0GPH320SZ9gGA
         7ZJhs9snjo0JXUJfxJmkzynzteU2uvEk3J3XA04ay68copLxsMgPL8ghu5+WYktTp6Cf
         dTdTq8mejdhBLmzAKz7YR2R6mv6I0C09uuwQqm+wGNL8FicKzR37ZD6eyZq/dyIBmYT0
         wBfepgFVBdnhsMbL5DllEbq/QGOqDuRzods9IgJL3gZM91rDkVXIxxIw/kOGdj4/sIuY
         vnx9MWcHijlCdJVNRHHF1D8s3OQSJk+doA3c+zptwIZoDPaz8pK8IoGXe4KdhCYhG8gh
         qEfg==
X-Gm-Message-State: APuU4Z9pATBQc0ySLEHvLjpB2ifQaM6U0cQDM7y8JzIGGc2mYN/kcd1g
	pTx4/JeYtyQrg6DYS/ZMPdUAfqr6bMkkk5fmA95QknrF4cZtODl/GN98
X-Gm-Gg: AYBFou3sOwND5JvEwDXB959u+z4OKXlDvw6vxWSkNXx1M60Ytptrv04hRyGEVMYp+qH
	CnJ3BcdHO0gH/u58kIOgQi/0TGh9uB5x4i1U4ByXv70CHa61NeXLHZ9KFR//ar91+53Q7Hyz6K5
	l97vdn6KS10MO6EMA3EOJxLJcMFlQNatCZ0eoxZ2OrCQfAbCBeoAUpfYZr5NHJENheJlRT1P+lP
	xduAWz08hx6T+9c4u1tqxFUHheuFYhXc6kFQH1rhlDq34xE+k0QO9oMJ2qsty9thWiRY9crMN1r
	s1LSRoeCySxbbEwMynecUe69mj7Zk5qZliGfTIYJhMg8j4eHNy6S9E02q2OdqlSlTKxpO9m7R+S
	c0bBGj8NdHRXIv4p72Mkn/tgAg08ZSr0u74UtY4MJAAsxTqEbu2HOjsYZsmwj7HVy+jZU9HMwE/
	/RodYHdAVfIxnatCbz/cH6Xs3m2Dn5FnivA07JLm0SRTOz1YukC5YMU3ZLLOvBQ1es7BlzOlSkA
	pzBdpQJ27/XvQ7E3WB2AxXsS0Yk7kVKdGoKbgnYIx+4XpgWTyEPp14PMZzs0W4vNOHYrOsvsqMK
	zP5DZGsC/eeejCi7VfT5szgmiXtmxGBrD5Nu6g==
X-Received: by 2002:a05:7300:c00e:20b0:35e:d21c:f33e with SMTP id 5a478bee46e88-379651ecb3emr98122eec.1.1794509673785;
        Thu, 12 Nov 2026 10:54:33 -0800 (PST)
Received: from [192.168.1.4] ([2401:4900:881d:321d:eb39:71d3:15f6:5fe0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm339008eec.22.2026.11.12.10.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:54:33 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 13 Nov 2026 00:24:03 +0530
Subject: [PATCH v4 2/3] dt-bindings: bus: ti,omap3-l3-smx: Convert to DT
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
Message-Id: <20261113-ti-l3-noc-v4-2-5084dcf4ffb4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794509656; l=3174;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=MxSg2MkwbXN7myq3Mkcqj4G5zZktmzhof0tcCBB1PGg=;
 b=JRt6nSNlb85XdtArL63nkiepL6Da+0yUqR3qJt2OdDLJM3jkrZYyrTTd7rrZO5cFiV3mwRxpa
 Fa83lVMojAZDke/lQ0rNOFaKrQETDdRJcIZeZmc0ooQ1BffJzLCATav
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
index 0000000000000..3fc5fae7b37ba
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
+    bus@68000000 {
+        compatible = "ti,omap3-l3-smx", "simple-bus";
+        reg = <0x68000000 0x10000>;
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        interrupts = <9>, <10>;
+        ti,hwmods = "l3_main";
+    };

-- 
2.56.0

