Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210108;
	b=vHy+7coj6ixPnJJOcJ/jgkWIP/aC1Mz0Snazi8+gDbMAtOT0WBw+xQ81T3PQb+canuWO
	 HJ6YZtCEx9bPJMUCOelow7t/HXOeaDiHV4rNNU9kioIzbSm7LkepgDy7QS+2xHqUH/CZm
	 1GBspukGyTJs17E4EJJx/x7k0PBIcAWjN6MgEYvRoPGQM74n57VePQoTjeOaI/Zn86QnA
	 ZRNTPtPpLfsioY4kaaVeqzEpfK8Hyfj9yxszZRUVX/7g3TJLdhNBKeeXiGxGx7uQCBo/a
	 gq4Vhj6w3hnV3nTn7LnPXCmmtV0WgG4/4UKFbiWsZkHgTEY5md/Ekncidqqmn9HzDEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LXePsUP69J9BLo04WPbdbC0T2RsRqLHGKdkvwdCquvE=;
	b=gU1kNNIUJc/hlTCBSFA2OsyWSK7VmKMPzRKETf4KX/katMBQaT+Jk1a8u8hV/0XTfIvY
	 mDKRvvzb5MjI1iwjI8azDMSleVZ7sGuU78TK6P6XNcGwWJua7WfhThJsY8Sqo48tAeDm/
	 YSaW6uk14oaeg7H+//kxzv2seHmOVct3iuPLrAdvo4c5y+x0UGKaKAxHQgrOr2zCIKM81
	 ohLYv8amO60KZPmycgNgN7Nnmwq2OzO+O2o7vS0kNEdH2B0mr1b1be5e2IJznH70SxyRU
	 GHxA/SI4iVAHDeecaqXG09ILmTiXLMxGaFjWYuUJ5AOnCkKIDmeUIP6p+j49uFvi6Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="SCnC5M/q";
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B39606A6A8
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 21:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4B39606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCnC5M/q
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4a76f63b243so2011956fac.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795210102; x=1795814902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LXePsUP69J9BLo04WPbdbC0T2RsRqLHGKdkvwdCquvE=;
        b=SCnC5M/qXfGSwGlKHnAFp/USEX4r2rxKw9pO9HZA0e4JG6ASuVP/47BZ4tZNXgydL+
         fs5LHuWg7QaHHoHr29o7uypV7g5KIpLpDLoPo2wNyQsIo/KYNj2l1SKvcJU7CJs016Dy
         n7VvAsaCTCiLGUP/FSrE4aogb25Mc4mP9ucgt6ZGi9kve9611vOZ2UCf9oWvO1ofbL3B
         nCyUSa/dCrKPm6aJtna2kU0WuWiSVJw2LFnmSv6z4jZzo/dOYadt1wMFxjdAQb4N9WLH
         l9j51wP7ahoANpuslO8qaTeKpF6in4E27hpsBLt4bx91Xp5piFCKl84QecIj/0FwSlP2
         r2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210102; x=1795814902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LXePsUP69J9BLo04WPbdbC0T2RsRqLHGKdkvwdCquvE=;
        b=T3ckmhOynVq+2DUHsKNxEAvc+o64ErR0IeGLlKeUrO6jNpyb7z0QtPQfT0V2XFwA/y
         a2fu9t88rDkUBd8f5IgLFPjBCcyUbVrX+AZEczSekXTFE910nuYxo8IkaYA8/K09NSM0
         idkmn6pCGUBe8IqGnOsr6UIu8pkamG+G9hH7UsJejE8w4jujcaTRdXADM9dnaEvQa7F7
         BIBiX4+FF85VwHquwngjUKiuxo9UGn48IBzhm8ga0rJ3ybcaxQeXKCcKlouokhR2LU2+
         LVraO2A4sikAHiUHtfJrQA4io2cq+/NUKvkg8ZOXtqJjDjydqk4gjg1y3IK9kBT4JGVS
         MEbQ==
X-Gm-Message-State: APuU4Z/uVsO2+glH2QB9lPjUYuH8RDkER6ka+1fKg5eRTU9VbkRKYIAj
	3BE53aiwJXfgxRnmgkrizPuutvp1/qjFMsWRw51Mvrfd/zBHEt6p+XEP
X-Gm-Gg: AZFdTZfiuUEYHmVucM1K+o+OIo6ugE/tvYtM16/ioqtNXxUnmo+1e9kva/LZ1zgwSPk
	VTv05gwYqgntLWGT3TGW0WXautxUZtMlhmtQQt4/mgkZPj+qrcT4B1BzTecI9386AoNMqgNa1KS
	bvG1iPrrgKPnHIBUs0RIJ9dL0sfvSz561two8v0B04G7TrNYU5EwApLRJcWBCZe7o0WhVo4YbW/
	R2sxqbA04bmoczTvtDu4NkLee9VsS28i5Px/IuFZpsVLLqQdPjANgKvB/Zuvwd8BJ1PrctaV1mu
	fEB6T5aFU99Qnad7bYvxGP0C7GbSAqKfUOlZSj0JI6Q9isZK/jlM/BEofx/C00HgPy3PFRhUsez
	x506BPVGlCiFMNOcJKOvPVQwNso6dXOXlKz7AMRcxZbj27wbPVsi3VpSlVoiTQBUQptcpFSW8c+
	0tMGWWvjX+sO8x0CkiCMJEN+rtPq/2nZg1lM04qIMb82Z6YfnykIx6TKes5nxxximaat+Ft8vWa
	yPlagiWDFYq2dgE0NhHR7YvLKVkcymgkaSRvCIaCvD6DmnhhuLlFcDbt0fCwVjVwqb40QemVjoS
	ZO3/6YriTcVG/z6eYrovLBYv5swWlQ==
X-Received: by 2002:a05:6870:9d90:b0:4a8:15a:b062 with SMTP id 586e51a60fabf-4bc84f170d6mr2947268fac.25.1795210102525;
        Fri, 20 Nov 2026 13:28:22 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5b07d766sm3774126fac.2.2026.11.20.13.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 13:28:21 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	shawn.lin@rock-chips.com,
	linux-pm@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	t.schramm@manjaro.org,
	xsf@rock-chips.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 1/3] dt-bindings: power: cw2015: add cw2215, cw2217, and cw2218
Date: Fri, 20 Nov 2026 15:28:13 -0600
Message-ID: <20261120212815.35663-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120212815.35663-1-macroalpha82@gmail.com>
References: <20261120212815.35663-1-macroalpha82@gmail.com>
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

Move the minItems and maxItems for the battery profile to a conditional
based on the compatible string, as the new monitors require 80 bytes of
firmware instead of 64 bytes.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/power/supply/cw2015_battery.yaml | 41 ++++++++++++++++---
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml b/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml
index f7bde324153d..dce7c51e4e62 100644
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
@@ -43,12 +42,42 @@ properties:
     minItems: 1
     maxItems: 8 # Should be enough
 
+  shunt-resistor-micro-ohms:
+    description:
+      The value, in micro-ohms, of the shunt resistor used for sampling
+      the battery current.
+    minimum: 1000
+    maximum: 50000
+    default: 1500
+
   monitored-battery: true
 
 required:
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

