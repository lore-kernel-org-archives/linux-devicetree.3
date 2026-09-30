Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7F238DC66
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 08:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757600; cv=none; b=DL9JQ1h81NY2CsjlGdDFE7SkYvw2HpEElwU6GgFtvkdvRfHnEaYNOqjlUJ+aklJT7kRfG6+ssd5QY4XjAbZa8vi2NfeoZTBVONl3egRgpTAE8YWbBeHVA8vs0LByxEO8e/PIwJ1YBTrCUVlA8fhb1/J6uXyDfUUBLvotPEtuddI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757600; c=relaxed/simple;
	bh=f6CO7bbIh3+VC1p9XTgdX3LNbHLG8iA1il5O3WFLmGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJryUWldmzxfvDq58JNkZXMIOU+nS7U4IJY16CZztPtRnhE10crMu2X5mOyp34b3fbj234iCCzefDBTMEoixCxgYiww91R+MZan9McsLHLpOxSchNLACKVzq2x4SwVMhwHPZ1WgPPI3mQIj6nvAP2XrscZNFCjSV41K5c/pq9yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wq27GpYM; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wq27GpYM"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so27795655e9.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 01:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790757592; x=1791362392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zFNVuEQ/EQx3uyZQsi7HoiI6kBWQboC2hCL0w1PP23M=;
        b=Wq27GpYM+Ub7JOBtCN/wxWfwW0VLfFniigDP8Eq99jDrnsSeqXbyT13ZazYx4AYyt9
         183irWIy4mxOBqaSRsyXMipA7XKdI3ReygG0qN9rbidjVJJH1hBnUFp0rq2HhuT41X/Q
         p15alsrRpJhva3Us+LX+W0eKCcHuW/MKvMJiNa2RZF6JGFWqLsKF/zf+iuN4DwwsBGVS
         jU2dr/a25Kfh+7cxwNS4xGMw6dxi5GQrSlL8FGaDIANy2vBC/hw46xJDoLq/oNOBLMgK
         x3xW5zqtzFsFBxhZqfgEb5WiLKCtg7GFPqXf9BIQ5RkfBY8BnJFGGp5ij7Tyy4/4vEQh
         1S4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757592; x=1791362392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zFNVuEQ/EQx3uyZQsi7HoiI6kBWQboC2hCL0w1PP23M=;
        b=uGgu4z+SfqavGOW5NQZGQqXP/i8nHKwe5um2VpDOojyxs6zhFVT7VAjIaiAMsOkwsQ
         DuO5mhAfgOpiOmvqNCwwCbjSeWnrEtvjJO+R8AefUH5M4F3t9Plw2UyVJyZU8a00RPOk
         ezNJzE/lyOvRfCNfoc8lZ9XLNVuUavRjId9wN5B2t7thKZEdqLKC2omHpg1dvnolL25h
         z2CfWAotXfrzqP5hs69VWUa1nue7/TotDxGebI+MPAylMbz2huuaSHH4NRjAZVlAIptE
         XMTE14lT1KjfjFvmwoLDZCsFBhupcSzSHaDxiclsR5JSDalLfk4MVeP6ThUHzwXh0inm
         7jsg==
X-Forwarded-Encrypted: i=1; AKwUvByuqc8TWEU/RxMSoDdTrG5jAF9BkcYIQCaYKOGCtILIMQCKYN6T0NIp5z+W0tl3rVtq5EpqAUa4Xwgb@vger.kernel.org
X-Gm-Message-State: AFuF++mDFu8G2kdyNrJc20IY5TU94O0SC8qc7vly5Zun+4FsMUwuiHJF
	mlfdJhbow76PyCcfsV2T8QIEr50ULssT49t0KzwkPf18nghp8DfFx+xv
X-Gm-Gg: AYBFou233lwbvsqMTB9WEEVQgg24Q81mA9x3GB/be5Z6vfoT86/pjdPOZpewsUoH3TA
	f11mkCUREeKjQH6RW431E0fxN9o4L6ZrxUlBQAaZGCJ6/8wxsHxYbRKFWkOWz6v3kPGKkBV5e13
	MDpKIY2tlm8LjGgPGTYrTQ28AA7KaOYCslUJ0QxtLnhYuX9BtMqm1msQN6pLP0kCA+0qS4ASnzD
	2nHCoHcztuSfHAWD1/kvPB6/XTBn742be+C7JGheXnbsQqDikrSAhdYlfsh55cLZntmMQIn08C5
	j73jEYwtzPMJY2nr4+55NXJoESll39DCqX+FkJ8btk/q9+OVqI4RosuzeaJHju/M61I0i3Wv4tW
	j9yyRnV+UuMKagmOan33dZwKAQ67PYmiJjXiDAnu1BwKLAZCGDdgDDIDpuB+k/SwHLupwBOle6k
	ee5vaGwMGBbDs3DZuVEJ4uY+IEOEwY/U9IDQY+KzyJgDDegMFcFWpdxtpG1ShbUllmgyXC+INUI
	/DQ7kFY8VtZRQz3zhGWO6luXDXOrwJWsKrricOx2RRxkQ==
X-Received: by 2002:a05:600c:5391:b0:4a0:1559:bafd with SMTP id 5b1f17b1804b1-4a01aff068emr9727185e9.8.1790757592383;
        Wed, 30 Sep 2026 01:39:52 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029bfd2bsm1757325f8f.11.2026.09.30.01.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:39:52 -0700 (PDT)
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
Subject: [PATCH v7 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Wed, 30 Sep 2026 10:39:21 +0200
Message-ID: <20260930083922.484885-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930083922.484885-1-sander.speetjens@gmail.com>
References: <20260930083922.484885-1-sander.speetjens@gmail.com>
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

