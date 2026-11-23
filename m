Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795398640;
	b=AvcbD7OfrWopWGRtXw8bJhVOhx825xy7WJk2M8iWQ/wvBORWjjANKvNPHH/Kt3eOx9mq
	 MUYaEkl8R9yhXBOD3+rpdwlyHkPZ1FPfDUXdjgO38OCg4lpdRNRYqZ2DBMNo5xDDhgs7Z
	 Vd5K0eRNBU9oZYY61G0HEOeae7nmXmn47eMTEqlBna7lTa7XsE7YPmzdkQ5mF4jvMal4l
	 b6WJi37H2+Fy7nRu36nTd6NbFJ0On1ATiH4dYZSgp3+HIQE95Q8nicr9ivAR5EaIPl4Kr
	 udmPnMSILdtOSuq/hvhcAFGld4OnrdH4CJkZS+ejC44JSTulZtU1DomjHbJbpdZAapA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8DwRmjGjcZQoXY2ILH3hB5x2vfhtY7WuYsGRx6Zuzow=;
	b=RzVwNsCaE2w2P1tWZ3e5iSiveRR9G4ppIJ+kafS0UowcHTM7zxw+Yff8omlUhUPkxnRf
	 QFkbIt7OrYEqmO2aU2uLug3tuqRJaD71lNyyHvlsE81JC1uNHHuetmUODzTphx/fpqegx
	 tJDhLrP8H16l5rgbwK32Kw4f/SJUsZUSS4zEiGbiv/OwQu8BR1YzarZKbKv1NI6bHCsV6
	 eDXGA8T2Smgfm64+FHZOg2gjlZIesOx7lJNl1CKTeu5cJOR2rR62KUEBZVsm4OwdXLH5G
	 EIg/gsTzvqyzOlcbmr6CNd8ps5DTw0iwVW8drnnnVKCwvGLgbrKSIMLdAvaFc/rX5fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HpdTssoi;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B391606A331
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B391606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HpdTssoi
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8633b750a12so512549a34.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 17:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795398639; x=1796003439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8DwRmjGjcZQoXY2ILH3hB5x2vfhtY7WuYsGRx6Zuzow=;
        b=HpdTssoicRWOCZQt1XSrQcaLQBJJla9t/d1bwktAM6j6D3O6gM8Cyq7YeZBKzAl06L
         +ua78IfU4jaX2qmYJHPs+KOCUaEbff6kMw9QjhT+qc7Mt5nLtKNBSfHXsSeZMNomkppF
         c1KvZ1l18ClkFavZ77qOjCV8nwC1OggD9GPLl7A4e7sd3z7sijqICL/K6cKQiIouYXkE
         RMYB8et8qkPoOHNjMJkgzotqO24rgtho9dQtTYikB/WLiv1gWzECqu0tLdBQ+Y48hmBh
         xS0xeKoXs3bq7YWxNtOniO1bxMCtRE06GuvKCUw0LuxqZFJXjB1w8Z3JqN1asja4Umpc
         13IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795398639; x=1796003439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8DwRmjGjcZQoXY2ILH3hB5x2vfhtY7WuYsGRx6Zuzow=;
        b=wrdjBVUjZWD2SKYrSiR7S0p7uLnledgDA8aWZtjYgcOocfaKnC64/mkKvbkMusqztt
         si4ZnMeNPDoNei3D5RYMp+FH6npV7dqQKlZgwNzTI3uLXnNMolmPZxJOIYIhkSlsIGMJ
         qs44q9d4r/lNSA88VMRj3XM5cHb0SuuUtWNawLICJA/9bGmdQ/Gf9r4DTX21NDDZCR90
         aR2DrivqKXIgpsxzdM8Uo/icgg/YrPemuSbuA/LYSWx/xRr576NEJKnw+VlQhwu8u/IZ
         RVu/K1ppPhFYbqAtFVeGp76AEZC3IT8Fum7lqtrwqV632UkAZpBxPYRcWIHbz0vjiEGD
         TNhw==
X-Gm-Message-State: APuU4Z9nshOWVV2QIoDup77r7cGZvXAzPr1mdx9Y0BpUrJ+EHEqJIFDq
	/U+cuT08dLbk4ITOFKGpDFtDp6xXg0bvaEkq6qvqtY3SGoUOC4dpOgfQ
X-Gm-Gg: AZFdTZcSK7ECrcSdKMAk2cdqisTpwkbAzzlaRE4Vb1cCmVzFm2bjGa+NCAKH/qFse16
	gR4p6Fh3AHYFkSvSa9lGWFGwgCzIAqM0IuzPbICuvgSnFHPEPmKVHrwSpBPLYlTvbORR9Kivxu3
	WBDgBdCx2GwtWUB5MCywtzUEyEy3SmqES7yRm3+QvrjSl2fURRPdQdVzkSpzzfJnGVlZ0Kdcgd5
	WUjn4EY/x2ORHHl9aES8L5QcE6PHHEkPR7R+6am9wsy8poIdsYxlwcQPDiUREn7O+FgqLqp84vQ
	0f+kVo59hO6gAVGEv1bg+l9RxlTDYh9lr0rPAytoSzWvyzy9mM997IBQ4hkk4DSlMC60a0YLavl
	XDM5kZ4GbsYiBUU3JIx1BqZVWCJJ0yngRKsUu1MY0OUgdC07/D6PNtheHmtq2CsEXGnGuTU97Rf
	ND+4uy9Q8o5ejM7NCl7ayXqD20cpD8mRSBeJU7itezTH3lhVm671B4h3aCYQ7hSMaBnp53Fa+dJ
	0X5IhXdAdXQJsUQgZhNhWqoye2N5y32BsKIyeTnMD7GeqI+O1KJFJFnveBsoUgH1ptWlGiXU/yq
	bjtKF00Eao/Tg+p7k/+7Ny4So4e4huf/8jFzb6XKB2on9v3Cmcg=
X-Received: by 2002:a05:6808:2208:b0:4d6:92b3:5c8d with SMTP id 5614622812f47-57a0dd479f9mr13048388b6e.67.1795398639463;
        Sun, 22 Nov 2026 17:50:39 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5f7ae7dcsm9209484fac.8.2026.11.22.17.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:50:39 -0800 (PST)
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
Subject: [PATCH V3 1/3] dt-bindings: power: cw2015: add cw2215, cw2217, and cw2218
Date: Sun, 22 Nov 2026 19:50:33 -0600
Message-ID: <20261123015035.369192-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123015035.369192-1-macroalpha82@gmail.com>
References: <20261123015035.369192-1-macroalpha82@gmail.com>
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

