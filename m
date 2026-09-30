Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E843DB629
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761932; cv=none; b=WscIhviaaIjYhrND9pD+CCVpU0BohH4jjK/yjU04eLOU1lVK6OYVc5Y7FNak4/VArHbkCbEI2u8mKo5l2JLYLC7gkpeq2v4jcOH+XXqNparaMq1PAb39FBYLv1/3xQK3S9yreAcVun6iz4V2NcIV/qF4EQaprl0t1Z6AgVAK2Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761932; c=relaxed/simple;
	bh=2O1VhIODyouGQSuZPvpbG9DecXTtDHxtiPt3PW1wtkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKx5cqYel04K2ign6RzR04+eOu0I2cFqWipiyvvh43H3zQU4lNdaLaAzaHdY9ZVBMLWxH31qHHcLXtxTZX3emnzSDRbybl0OrFu0+M4m8Iup+UujY7lWqyGF2+8E09N8sbvH7jy3BE/wIcFb9JgLDOTyzKIZhfSMQUS7puUoqWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHRwhugj; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHRwhugj"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so38830175e9.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 02:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790761926; x=1791366726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwoTkJs7HCyeZUjKiL1dlksDyeA5N9XlMCDu8/M46vU=;
        b=FHRwhugj0L44DpBvSzSqU21sQ1Q9ZyPPIQmedFlEHlxT4fLhor/GUzge2p2WB+0Xpq
         Z9oPKl8mbvLi+SpPRkpIOkKdcyuX6K7LzxjJMqoStX6k69EfqarsKQx47KSp3vQF6zeP
         ix5RAOI/DPpI6iz93GASTTSowH2GPCpr0am/PSL0rGDnSbNCCJQNCWHex1rtRiW53aim
         hwYbU5vJJyG2dBeZMAsdWuJlKHjkXKLwLltZIaMxf11tf+bz+53C7bOMJx3Bv0YPojKj
         oiRrcWGq6aSg36VWycUGLws+mmIEmKFAmQ81RTGFfkLgZpCFjavCu8kvowMNV6dwE7PQ
         IY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761926; x=1791366726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iwoTkJs7HCyeZUjKiL1dlksDyeA5N9XlMCDu8/M46vU=;
        b=BSfFBzHTzipgeR4vQqsA9hVeA0VpSqacZLcgzihVXyeGYEivPJduDUFHNWm1Ix9CLL
         hdCa6afoImK0oO15N53s2UqpL5Up76ety9e5df6veAUD2w4UNj/L8a2qjxUj9FnI73Ob
         tDcj1lrVa+Dg9qNpZchM7YDw1DgzOAUrj5FsGajYPJ2MXfY6q06UNOW8ZqJdTc6M5Chk
         Dg/JuJVtLns7zwqreZ1o4Z6Lm0hP5arLBAbK0cDNCCTHlVFeiyylbV/XUevhfY9rI5Cp
         GqhSZgfgoLekBywFlgZkkUb74WMCrnJok2pfFau9wnqU06HlcOIwV1RRhShJ4rp1nTow
         Erlw==
X-Forwarded-Encrypted: i=1; AKwUvBwZPPmsgCG/oQVNsarKSkvKAqVsgaS7nTLqQPThQfDiHoCYNJSlxTwXlqmmPpxdxV70V/12Z9Ak795y@vger.kernel.org
X-Gm-Message-State: AFuF++kmw+lJb1/J5y6+J38o20T5/bsAyehnFeqkLtvyFtfugOl17Sv1
	df/4FCK8DZ9izQamZWxK/jpc9lJ1vgITZ6f2CuBhpP990Slnf51FtUoK
X-Gm-Gg: AYBFou08DCzUOzfsms0iPTeiZYMd0HwZi1/rHbN9Zs2c2NwleTzhqFSgqZUYC1rnL3+
	5GWro8jHe8WMKGvtdVrfPf/aobCaFXRZLytgO5v714MpWpcQMZjQbJzza+STa1GQCaavg6xa5E5
	jcw01OrRyAtBJljGvQXamT73WCi5cWTvpe70bJmZ5IzLYHGykPO7qcilrssFWg5pFeaK27bmO+e
	I0GnpCbplN2NZK9pa+rwE91+XArGuVb7N29LQ3FKkEu9OaRVAaUmKI4iRijnC060sQIM/oEiWks
	VTotv38xOtg/2N6u4fAfOB3H5kToQX281Nv1gK4pxn+P1Mfg/5SF1a6oKIBbfZKfiOLXIQanqjv
	9rlikgLA2v0QRsnkMMNHMi65XfRqJh5JytHvoj5gBVBcyQHkYMf7baKFDmC7MlqvH3JkJsHCVKF
	vp0Efztwbe2uJEegNhFevMnlGMmVGy5wyniowkKp6J6G868l0ROlWp6DHiNvpcwat0sZ3TMOH/Y
	L6fv+sQ73wAZ2JhsigZ+EoaBfccgqQGsCM+VssTdLcH4Q==
X-Received: by 2002:a05:600c:c166:b0:49f:e3f2:f5a3 with SMTP id 5b1f17b1804b1-4a01ab4d864mr15364625e9.0.1790761925903;
        Wed, 30 Sep 2026 02:52:05 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015abd9ffsm43859655e9.2.2026.09.30.02.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:52:05 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com,
	pbrobinson@gmail.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Wed, 30 Sep 2026 11:52:02 +0200
Message-ID: <20260930095203.492949-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930095203.492949-1-sander.speetjens@gmail.com>
References: <20260930095203.492949-1-sander.speetjens@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Raspberry Pi 5 has a built-in RTC that can be battery-backed
via the VBAT pin. When a rechargeable coin cell is used, the
hardware requires a trickle-charge voltage to keep the battery
topped up.

Expose the trickle-voltage-millivolt DT property so the driver can
program the correct charge voltage for board specific configurations with
the attached battery.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
V7 -> V8: No changes

V6 -> V7: No changes

V5 -> V6: No changes

V4 -> V5: As discussed with Conor Dooley, the reff to uint32 is removed
and a PR is made on dt-schema adding millivolt to property-units.yaml

V3 -> V4: Add a reff to uint32

V2 -> V3: Fixed the firmware property naming

V1 -> V2: As discussed with Krzysztof Kozlowski, this property is folded into
the existing raspberrypi,bcm2835-firmware properties.

 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec9..dc71fd57834e 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -133,6 +133,11 @@ properties:
     required:
       - compatible
 
+  trickle-voltage-millivolt:
+    $ref: /schemas/rtc/rtc.yaml#/properties/trickle-voltage-millivolt
+    minimum: 1300
+    maximum: 5000
+
 required:
   - compatible
   - mboxes
@@ -144,6 +149,7 @@ examples:
     firmware {
         compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
         mboxes = <&mailbox>;
+        trickle-voltage-millivolt = <3300>;
 
         firmware_clocks: clocks {
             compatible = "raspberrypi,firmware-clocks";
-- 
2.55.0

