Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547633;
	b=uyptExPZ6XlpGqkG7ZdDFbGp86WjBO+SGOVNkd/SI+UV/Wni1g0aJaOhsFtHX9yJBZzc
	 MYV4R7l1WDxhIxayQ4qDQOqdbcRMCjdMg+LzftBmbqQmDTBMgppB6WbED3kkEfp4UGGH4
	 5B0INXugrp0ZFcFvF+CEkEhRwgYiLfj0lndbDD9+I8cOexTEpQ0Trulrtrrfe3qL6XHRT
	 b3YmozzqtIqWMJx4VffoaZkliiUn9mUc2jCMWXNgcy1/lvNBojUNc/AL/bks3kUh8o9o1
	 gqsE/e1qddSkYG1GgmHtEWSadiFYYgh8c4IZO3rIJ8mDObbnTKg4v1+x8I5Yf66RWeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8DwRmjGjcZQoXY2ILH3hB5x2vfhtY7WuYsGRx6Zuzow=;
	b=hF96dh/kk0WIReGbn8u4ULWVoT6zuW14BC/lyjc7hv1COerp/u1sRKF5yXJ7RYzUaOll
	 2hNKaMPW1HeogNCYZUFT9kzvqA14Vuc7W3KqP7XTOk0SEbmaKgTujrpWTp7xvVfFwmvmu
	 w78IIsXT4BaSWrQd/nL8Dx6jr+Vo6lk0RVEU9jykU6DwMFcVG2qd4Fu0wU3os83OsFx+s
	 ryYD+XjW6GB9ruNuL4G2UuW8H/7AJ9IoFTTCIZlZrLwqDe/sfTkiOXaDeuzPXL7VFuLvH
	 6/g8DwW1H6AVR8g+SCPzuZooc5Kkcl+wcneoIYxWVT+mx2kmFgAtPbQpl8Bairc6TSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VeMtGqoU;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE06F606A335
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE06F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VeMtGqoU
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4ed6d69bdfaso2703228b6e.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795547632; x=1796152432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8DwRmjGjcZQoXY2ILH3hB5x2vfhtY7WuYsGRx6Zuzow=;
        b=VeMtGqoUSPC+x/+aHGwCyTPQ5fRdKHU1VUtXjTh/LCy0gAXXMxqcGjxF+NktAw9nCz
         14MsjfU3wtXmRVpqA5lEygFaEHXyZAhi5eeroFwQmTfY4MCDdO4I58SrAU+KD5lmiHjy
         S0LlbsRlq8w1QCRzOfPtOKH7Uh2EXhES22B2RaHvKV77OSmYpmzezHhfPwMe6mrG6h2I
         UydbIO0CN7nAuy6jJloYbHWbj7FRRwat+PyxTMyy72VWvLqz+c6lZ2XRiVeMwLdQD6P7
         rlvet3l+0kqBzVpnzUln4xauZoCPbzmR5o25u3JvC4U59nD/sp8106nNm77Lpc646fmM
         qQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795547632; x=1796152432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8DwRmjGjcZQoXY2ILH3hB5x2vfhtY7WuYsGRx6Zuzow=;
        b=tOqHKaZLyopobRc4BItZU0t7DLwXgwc1XzszN5k7uNYxzpmoLkHP4rYRUV9PESvZCV
         bVceLpPRFIc5Pj70l6mCagmboMZ5BCpht6BLXVIWj+vUtRRq8q7e0KwFTTAbsAvFI8OJ
         lrC9z/BqyAWZjliDhsvQ2WI9SLDVZTXj+CcUrilqMMeDq0WzwH2Ow0Z65TDRS+0ro8/g
         xZvip0PZOMFK2x94r0yW7/2vzXIwjhGIADug0tp5cMKvTNQ4Q2JplVWRP/rB1M4Vc/c/
         5e32FglChX1stPgLifV9i0WdXRCiudwihe+CUkl2b5lEH4JKtBcH8G7pBnQlOGWp/hms
         4yvw==
X-Gm-Message-State: APuU4Z+gjWfEzBLoHi9JcOGd1sQ8tUFoc/ST/7J0UW9tQsy97hJTxgZN
	XGtSD+RqWyajrgiej3urn2xquaqDo3H1K38l1FQcj8n6nMQS3GizxGt6
X-Gm-Gg: AZFdTZc+fzFxnOnOOci5DFQNUSaQ5+ddEX342Y/9LVl/cTcINaNglCkIqO44FoSnfBG
	B+YkYEshYn9ynccwvmaNQ75GHAKz8vW1NqNvnSrO3jvK1PlTPxkqwRpPRkvR0GMR0SXbVv/ey30
	/L2x6guC1fwxoKKUJ+/W9Gv0utjXhjmkw4j3+tYhNFzw14deNb6P7mShIwe8vbKcUh0hUR44KQM
	kZxi+PsQ5VHDoKhdS9gqn4TdSzvgSNQBv2PLKhqnTNCFWs5u7kcQCvTrDcKJFDNnngyg+0s04Dd
	ymyiN+64k/PjcVf+jttUxWgCN0I5dY8I24TadgnXb0uy5FrdaEdxZxRJPKgt7l04tSdCa7iu/8a
	u8wYIjOQo2q5vWxsxFW3N+CBKBcFUnCZ9rxngjhcBBd3Xla/a+aLzVvoojDugKA0KBhaoG9NN+4
	UkGnAIPe7jNMM4bw2C+2PKx0NVGGOIZHALJyTsxKFOyyi2QxtzFrPbMj3W+j/krNNFQkfNMX/ET
	webLBElyxI/JyEIjw/7pRZjH/XOlarjJl18UUkH/jP3XMXuwwTneiYsRadATD8oFoh1NTUZB8E4
	C9AyWbGVLt4S8wN4pBi1KlR5c9FCZO2D4ApwiIDB48bp1nkfPqY=
X-Received: by 2002:a05:6808:6415:b0:577:28d8:2882 with SMTP id 5614622812f47-57a0bea6553mr15828891b6e.48.1795547631858;
        Tue, 24 Nov 2026 11:13:51 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a362575fbsm12774058b6e.17.2026.11.24.11.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:13:51 -0800 (PST)
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
Subject: [PATCH V4 1/3] dt-bindings: power: cw2015: add cw2215, cw2217, and cw2218
Date: Tue, 24 Nov 2026 13:13:44 -0600
Message-ID: <20261124191346.434143-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124191346.434143-1-macroalpha82@gmail.com>
References: <20261124191346.434143-1-macroalpha82@gmail.com>
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
index f7bde324153d..992cd5f6a216 100644
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

