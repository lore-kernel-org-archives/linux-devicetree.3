Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107076;
	b=wtWPgRxosQbzOH+ju5AP8JWqmxH8GuUY8Wn0q+GJcULIo+kwvpJlpliONJXa4YvGnqj9
	 wry2AK4zD2i4d3Bb7hc4MZiGF3uQVIy83+EgrYqMjN81rCENCeN7YbZwKs6YUZNMeBOmB
	 qr6rwfl5G7qc8c8shTJQwhH8DxLXhS5p6E4/JBBIGQUtn6L9hf03EdOwQ3oZstptEhGpp
	 LjckwRJDTIoQsDeSevaXOkdOye/AuulT4E3TMpVO0ijH0CUt5mR9NWKXg8lHGybfLOScp
	 gNMwgRgJ9w/aT/3nDrsaf6I/S6GfRkimaA0eX89mTybujBrin4X8ChXWzM7MQmDRF2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jjDyecQnnlL5whA8K/QC/fRj9uMASe5xPr8cb11QCas=;
	b=m8cbvQWMYnhPChxiz2jib/ec5nDNKFMttLXJAnm8BVYMnqJtHJeoMYhJrM22K2UsmH/+
	 NauMsSDIjvzp8k76NXT62k7M25sB04BezInvLpvubgtifX5tJylIewLVV085VuDlG6Myc
	 cidwO2Ns4AKvgfA/wos1/ARF1ilYasw5NjWhmuJMHIqHKGx+TXBFX6x009b2AKZBzs+S+
	 VYpWnTXz+aU0XAAriRyy9fSEiKyPNnz0vHyx5GVw8vomcj7rRcrslQvmNkcZ1HU1hLYao
	 bE/wb0wnu2mQlZ4h0UJ/tfSHvFxq1xxnTv10keLCwP4faGuCYdH0zpPcVVOAptw1KgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S1Ohc7D9;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DDB606A31F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0DDB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S1Ohc7D9
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so1929355fac.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793107075; x=1793711875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjDyecQnnlL5whA8K/QC/fRj9uMASe5xPr8cb11QCas=;
        b=S1Ohc7D9yDYO9kTImSEQV/3gSKyDDFiQkKyMj1zVf/+lf30uKRE9GKjYK4VGZmaV2P
         xrehuLHLkoecRLRMDSCgF9TA6+6uJJE3CbLQ46235dcvvmpeLUeY+V448qODnTcTtmsn
         zTf8h/J75N9dw9ZtIJrZyIGuYWb9t5Fq0kqjjlk8rC6rXw+vqO0+iPEdrvDuM8ufqMY8
         wG3WJdqJCtGLmEeDcWjulxoh/OCQIQFMbm3967pMyzSXikqHaHkE3V5u0WSDN4QiZUUn
         qHSRbPofaTPj98tUiLCrbM3LSvHGfTQ4KP2bAGX7+DRsJCwcqo0arwfDR8e766DKYHDi
         17JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793107075; x=1793711875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jjDyecQnnlL5whA8K/QC/fRj9uMASe5xPr8cb11QCas=;
        b=0xY52Xh94Y+XWOb3fpimUjK5m2YoSCn9z+ZKb4/TRx34AaIWYTsgi1OojKpjtSWkVA
         C+n8TCfCcN8sD6NwQDzXppiXKzzwjSIGVhBMW43pmlDl1ghkQ/e0+IjIwcRNddhdKOyh
         WSZtSKpKw1D/7/1XC0cftGURWpkTV/ApTQOpNk13w4uhEGrO4nnk3e2TxNMtyRPvhsm9
         TP4kGuciqSGXbhCLo7678EnhAkf1mJxNEBdVP7CfwRRitGKFcGBim48s6z+8st4BEXoe
         EXDy+OC/pukfGGfzCasDFpasUyJOVUobFh/aKpTYjDFgFTkDppmbxHVDVK4nM8ns11tO
         6qCQ==
X-Gm-Message-State: AFq9FYI4gvFXrV9lqR2JXkGF+6b3UPYVL6K+s6BXcwvYdcPlF2xShdON
	6wEF6gXAr79h+Q/1UD3BJqJzNPAFlYKE43NhVDXcrdTVPoCydAAQ0vjw
X-Gm-Gg: AYBFou3+I5iY0Fo4zQAk0xMVPo1LzsEa42rDoU5PxWEtMo3BSvxeKMXzwxnAGKPpnlp
	qqEuOvC4hTQseIezYMFl/so+ZWOrWA0E0rOKiu0Q7urXCpDcVYVSBZqD8BqZ+esNYP834SfZvkW
	8y+P7LYY9RDLWj6je57U8VESX0Gv9Zb0ndyGeXODDRqyPby3WoLneX5P/Nrn9XgZmha9iOr2tkL
	ShXx7W9PeO+Mozt3nhBtOyxnbPKswdE8Au8w/4ZRtURmnn4+XfJyBMCavDBkY1O/DVHLO0d1kva
	/5K7dG13VcWoE7Vja1Zk/t24jRnf+cu3c56qDmtUBrCjRAF542F53ASETYN81x6qHshMYOOSl2Y
	+ECsJBA2i1XNpJutX2kjI9/5dMjr3XVce5wzBeaZXGethV16N2QWtmrDkdF76RAaJcM8ej4q+DB
	a6mD27C+UM2MYoFMct56qoZFK9DRtc/W2M9OZEaQbR7Mw2CiVo9FIZFv0M6C/nxJIOa/OcsVr38
	fDUezfzp0q4BsuxlnIrzl+0pxh1Em/T05Y2sahYpIDwQMxl70Uw91zBXYT3Q78phttMXlZjJnQl
	S+CouHPa6v8ussUyB7NIXLu3ITd56Q==
X-Received: by 2002:a05:6871:739f:b0:48f:e107:3183 with SMTP id 586e51a60fabf-4a83f60f86dmr6853825fac.54.1793107074863;
        Tue, 27 Oct 2026 06:17:54 -0700 (PDT)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b74c0a7fsm23412fac.2.2026.10.27.06.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:17:54 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-pm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	t.schramm@manjaro.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/3] dt-bindings: power: cw2015: add cw2215, cw2217, and cw2218
Date: Tue, 27 Oct 2026 08:17:49 -0500
Message-ID: <20261027131751.1724448-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027131751.1724448-1-macroalpha82@gmail.com>
References: <20261027131751.1724448-1-macroalpha82@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add bindings for the Cellwise cw2215/cw2217/cw2218 i2C interface
battery gauge. It is similar in function to the existing cw2015 but
with a different register layout. Each of the cw2215, cw2217 and cw2218
only really differ in the minor specs and the hardware ID they display
when queried. shunt-resistor-micro-ohms is a property in use for
multiple devices so not appending a vendor prefix to it.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/power/supply/cw2015_battery.yaml | 42 +++++++++++++++----
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml b/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml
index f7bde324153d..12d2d9a9cf6f 100644
--- a/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml
+++ b/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml
@@ -14,12 +14,13 @@ description: |
   phandle in monitored-battery. If specified the driver uses the
   charge-full-design-microamp-hours property of the battery.
 
-allOf:
-  - $ref: power-supply.yaml#
-
 properties:
   compatible:
-    const: cellwise,cw2015
+    enum:
+      - cellwise,cw2015
+      - cellwise,cw2215
+      - cellwise,cw2217
+      - cellwise,cw2218
 
   reg:
     maxItems: 1
@@ -31,8 +32,6 @@ properties:
       it is to mail two batteries to a test facility of CellWise and receive
       back a test report with the binary blob.
     $ref: /schemas/types.yaml#/definitions/uint8-array
-    minItems: 64
-    maxItems: 64
 
   cellwise,monitor-interval-ms:
     description:
@@ -41,7 +40,14 @@ properties:
 
   power-supplies:
     minItems: 1
-    maxItems: 8 # Should be enough
+    maxItems: 8  # Should be enough
+
+  shunt-resistor-micro-ohms:
+    description: |
+      The value, in micro-ohms, of the shunt resistor used for sampling
+      the battery current.
+    minimum: 1000000
+    maximum: 50000000
 
   monitored-battery: true
 
@@ -49,6 +55,28 @@ required:
   - compatible
   - reg
 
+allOf:
+  - $ref: power-supply.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - cellwise,cw2015
+    then:
+      properties:
+        shunt-resistor-micro-ohms: false
+
+        cellwise,battery-profile:
+          minItems: 64
+          maxItems: 64
+
+    else:
+      properties:
+        cellwise,battery-profile:
+          minItems: 80
+          maxItems: 80
+
 additionalProperties: false
 
 examples:
-- 
2.53.0

