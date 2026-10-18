Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EBECA6F
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792336263; cv=none; b=K0y0xCMD0pDYR4uJ5BSfe47QfweiHkoC+IloTbNNAowwW30OBgIrGivKcTSvkaecjZSaNAf8A7m8CWSzr3/zbbGycv3NCK9jt+ZPmAeY8A6kcpMW0TbKQG7Wt7RuePzVDDlVSO0zuHDnuJfbTSGSirIHPwSmvRIU+/Npv9+v02c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792336263; c=relaxed/simple;
	bh=LaOk07jUXRLvQxxlSNQa1LeLyPvp5vXhNFiwjv8oi1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B4MCNOER08QDg7GsJt4wJO6JuUqEY5+Ak0+tl/DSm4D8K+X00wnPGdwmMqth/fRZ9yHBn6X7qQAEuWkCT2rPLGYKOO+Smaf69FQ+PYsoGkGnggm4bbV/86Tg4l9cw80AbqTZSRtf0HLrDbje04h1l2mwN2KzxaMPotjr3kJxrhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqwUdv9l; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqwUdv9l"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48bbb06e746so543348f8f.3
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 08:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792336260; x=1792941060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLnsA4VhF3nXLzHXAj8TbQUk22UVhlTcKUM9tYUUKXk=;
        b=SqwUdv9lOcryvZo+iTQHMxd9ml0+NCCXjXD4cpK8VkBIgPkIduUBmDQOqLl5T27oEO
         WaEB9X80ezjEf4v8NwqxPQRdgsZGwooe3MO/ZR8pEAG2/22YbklyDi1vIXHBA5TGuF2V
         U349m6ZI1TLPuBy4t0YW8W/9HHZpwRl1UyyGO08bSXk7pF113w3r/XbPb5XWwngWulOO
         BeJCEeMb3saKlfkJwothFUWolIbZujZD0+zFoZy9zor2d09tKcSeKGYrZZH4m5RGsSeg
         k0OdNzLKSMNzk7ujIdrsZhNkg7Yh3MEOMwlgm+foUFaw7pRb+wyFhLuca6xJ1sWHMrZ9
         VXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792336260; x=1792941060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uLnsA4VhF3nXLzHXAj8TbQUk22UVhlTcKUM9tYUUKXk=;
        b=lV7P2EWlQiJSY5i/Ngy1DFlCI5TjiWm2Y87XnYGAwAGv3f7p8dtGccB++8TyhACvx6
         AmOU3yXq1doEKIJF/BXkJ9M7Xd6+jOlQ7XIBj0zLKowDtuWg2gqrP4wXtOQdBw4U6BXa
         p7JGvdrIUg8DTbyTctVIyuKnixodMZzYedfpd2qHstl/zuLcOhX+Mz9M5504PmcAF/Vv
         Ru+mbse9HqV06MvHaCfUEz6+rUt14YPGaHRpU2i74F1MMNi2DZLA5gYC7hxy1iuXUEnL
         bHf+zPpyIF76m9B5QKymo+27ZBasv3PYc4Cx+ce1xf9/YSgDqjWZhiNK3TvLVMaQCIiq
         j68g==
X-Forwarded-Encrypted: i=1; AKwUvBzTmzM4i4js2qTcmm854cJHyUNhjnD8OzduyPj222UraW/cWklNQyoz8rL9TqqeIwkFzfx9L14z50Q4@vger.kernel.org
X-Gm-Message-State: AFq9FYKirSZyZpA1RqUtyX84pU/EJ4FW+O95KhMbCdZwQgL9rS9dTPr6
	vTTY2jIUik2VSsTEJxEiNLXkbyg4nE0rgES3h+9RLvBt/7du+ycZOl8d
X-Gm-Gg: AYBFou0WC8TbErG6qrKqmxPOchTj8K61e6UWywfpdBB3nmJLEMh8kP2L1KPFfCrNHd4
	BnzDrr03tiTVxXhVFgSOaZbLbPLEhDbNzLZKJnuOvpsC5GCRcmMGPuT8Dof5sZZfDJNi3vSEWXF
	f4XXHTZIomMehIJKBWIltYUbr+HE3P98P7okxi/QeK4tPDkbnKpDsyl/7eUqy5fveQE9bpQzXcG
	HLVbn28aLy4675ZCJrG6xcoUSUdakwRo6znpBjzPpCL6ZnVaTXFpFP6B9903veYUBGEAn6dsn+b
	IlqJG44UCPBOeUVjL+++pS0SKb9HmfDQkQzyjVLNlqQWwAtqCQuYnNvDaEAMa13pKwC4/2NW1oI
	rodEjnSzfLER4P0dznUgSZa37cjH/0HU9+s/UDxsaR2zDJ3ZMveYvRruhNTMpZMfvE2NuHqM0YE
	VbXm9oKhUNxJtUZtl/1x8Qxw/wuHyrG1yvJZByKa3n667guFvoGyn5FiCwvwDUmxTbR/lzGJVmq
	PrGWyI+nZvgZdrNyXMfVG9OYytpICnQPhOYPNGGbBjmeQ==
X-Received: by 2002:a5d:634e:0:b0:48d:f541:a6e7 with SMTP id ffacd0b85a97d-48e07f99c8fmr6899851f8f.40.1792336260253;
        Sun, 18 Oct 2026 08:11:00 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm17743957f8f.47.2026.10.18.08.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:10:59 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v14 2/3] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Sun, 18 Oct 2026 17:10:55 +0200
Message-ID: <20261018151056.1051330-3-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018151056.1051330-1-sander.speetjens@gmail.com>
References: <20261018151056.1051330-1-sander.speetjens@gmail.com>
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

The property is added to the existing raspberrypi,bcm2835-firmware
binding (rather than creating a new RTC node) because the RTC is
accessed exclusively through the firmware mailbox interface.
We only $ref the individual property from rtc.yaml and do not
reference the full schema, because the firmware node name does not
match the $nodename pattern required by rtc.yaml.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
V13 -> V14: No changes

V13: https://lore.kernel.org/linux-rtc/20261018150028.1047172-1-sander.speetjens@gmail.com

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
2.56.0

