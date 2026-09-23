Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556EA52B1C5
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169227; cv=none; b=HkaU0MOddUTArF6geH8G5imsnrEl5sr8gCPOW2HXsxZ/bb7BqAput5XJ1jqlHpEXA9sUBKFgmzWS8FiG/yJkM6KX5Hb/4KFjiDGg9ucWXGuRkO8WUxlgJoC2/2dJKupznZjvz7ItmYvRjsROv3O1Mwdc20U7AXBmL9nySfWGFnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169227; c=relaxed/simple;
	bh=L34DCDqVU6im5dk6QZdCIsE4IVJoNt//rkoRdSOwL0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u+guuxczvpRYQfDujZk0+Wh09DF+rnRwR7i+pTP9hgMSFEi5UVfXz8Es+yTLYpOGQSpO9RgboXCjPGVCWuMLd15vP144SXo6rdi8k88lGxlTDDwnsAWn2mMV9M5i90qXDXZoiJmwwYsJMwLhvUSoNcS0ZxnqS2jLz+8sHQhBNAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEbE/Qsr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEbE/Qsr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so10244505e9.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169225; x=1790774025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqyjdRqZi/cfpQBeYXttKHb7UezS5hjnOE+1CwQMvwA=;
        b=bEbE/QsrmAyNGz5eiLLkzHS5I0QvHztBTneoGPpc/VjMHrgu1bqs3rL4hs8jmZ8YHb
         95UfBJ15N+ayI+modcnTAsw1DDDtPK5QcPMy9j9OuCb8cWio2p5qIHv6aSQe3SVb7KA+
         VeMYB6kLCdi9jXddcePnFo9v4SVM71cNz5FsDz0JjzLqNEMqVll6JLauiuxAL4K6lX4y
         oeDrND3B6ljCGCY9RJ/6WiMZr/spDstyjMEqCnfNFvGsYZdPsTpgy9djMSxLUZFHuW+/
         2/+tFGuYdW86YZS1FjQCvRuOB6FBitfhzwpysvmKRiHhoRrcatVbl9k9B6RVBMX4EvEd
         bIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169225; x=1790774025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nqyjdRqZi/cfpQBeYXttKHb7UezS5hjnOE+1CwQMvwA=;
        b=EcJ/VHtffvlisj5U22b9iQnqZhQdV/jHapjwsHS3qj3NytxYMwmaWGY03dNt1Y4ND1
         WSzSgSKtBjMgQSTRrgqi4JRFwur3KVV9UevefgWGXfiRLA8SIMsw86Z2DbIDuJ9rbEj1
         AS7ZDUau6LQiYcfsxfwWaa7qEz1bTo1avdnnC05guI1B/lJhi8TcB55V9kYuTdVsfOIm
         k9blw4rlum7x8Io6O1AbouPwWekyew07PVLnhrJXVdvsVWCgOAM/qfnVppnigkj3F1rs
         9Y8d/cIgYhVvQPV0VUdsr7aQzrs/WshN6+Qi9hjVmpo2JiayhlajCjoSVtwhx+A8JBU7
         V3jA==
X-Forwarded-Encrypted: i=1; AKwUvBwXJpueJ8xv9U1O4kXR9m5q7eG1pD1/gXW80WoCGjGocooWd55f+0RdcbQCTCwBpAXD4PXqk+bxpPSC@vger.kernel.org
X-Gm-Message-State: AFuF++n3+Z+i3S/QmHxgNWfiSKEbv4K+/Y5Lp5vEI4lBr2Zxw3ODQG4Q
	v85ZKjthT7RuaO1gVABq0FYVcWg5XtLyNxIc5CEKqQwXaLCPhKMstGzA
X-Gm-Gg: AYBFou0zFE71MIridztI92lziWerA53i0iYW15R94QjcD3en4vkIwGLRI+mqgsKQlu+
	gnPqrOMcbauC539p3bkTnUCz195oN39F8Sxk84a10NrW0JU7toBOX5A7JxiTgqL59y8mxAuAEI3
	IUvQ0q3Ywn5TTpx4lo9Vj1ICRc198xt/paoGjnVXOs1kUHquezey+M4eUu9pMZRxPEDIuB5a2CG
	PJqpcP0xDGsb0zM1rDsohk8Tqe2FrIYelLItJ1Xg9CeBmAzuF8Xuq953Dh3VNu56X0EPokS7gUk
	Bs10QYIFLYJtzw5RLUgrdauHenEbfNWiPGXz9UIggyuZBHfBvHhVcVJMkwG2OBOuZM7mTLvsyz0
	0jkeD89/nbtg+yeBhBWEVe9RMScsH2Ye1Ukgcbf/CdmM/uSTNyrLFC97sI+n0L7zJvgXiHPcQmc
	hGBNP5Ts2gYo2o57JpT47udE5njs16mCgKc6ZYPsbMqshzwOG4tyXi6zDMlz6QylqXVNWWFdqSn
	I1lIJq9J+Alb3DRY6vDSaJkuZwZAbt/peL9+P5DiTqmbMXcVme3Uhdc
X-Received: by 2002:a05:600c:8b88:b0:49c:fc6e:8cbd with SMTP id 5b1f17b1804b1-49fdf152e3fmr33200245e9.33.1790169224607;
        Wed, 23 Sep 2026 06:13:44 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c3731fsm57230235e9.2.2026.09.23.06.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:13:43 -0700 (PDT)
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
	sander.speetjens@gmail.com
Subject: [PATCH v4 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Wed, 23 Sep 2026 15:13:22 +0200
Message-ID: <20260923131323.1099979-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923131323.1099979-1-sander.speetjens@gmail.com>
References: <20260923131323.1099979-1-sander.speetjens@gmail.com>
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

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
V3 -> V4: Add a reff to uint32

V2 -> V3: Fixed the firmware property naming

V1 -> V2: As discussed with Krzysztof Kozlowski, this property is folded into
the existing raspberrypi,bcm2835-firmware properties.

 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec9..9349fc8908a5 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -133,6 +133,13 @@ properties:
     required:
       - compatible
 
+  trickle-voltage-millivolt:
+    allOf:
+      - $ref: /schemas/rtc/rtc.yaml#/properties/trickle-voltage-millivolt
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 1300
+        maximum: 5000
+
 required:
   - compatible
   - mboxes
@@ -144,6 +151,7 @@ examples:
     firmware {
         compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
         mboxes = <&mailbox>;
+        trickle-voltage-millivolt = <3300>;
 
         firmware_clocks: clocks {
             compatible = "raspberrypi,firmware-clocks";
-- 
2.55.0

