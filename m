Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E616439280D
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256150; cv=none; b=M+vBTR9MTX6mzU5JKlDwXjQlyQhpz+THmaiXZMd8lVx4/IZF+2bNYpNPCPRRywes16r76eiZ/k++IUbEMQhC3bUiFkCxUrK/T5VzZCASQVqvgoSuuDt+kAawjUiqOgLStsz01vTkHXsMrEZJqsAPnx9XGFKqViYaM6j+e9vp+Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256150; c=relaxed/simple;
	bh=RFqzRpDbccKYDGRVRmxPzGxVc19/VeDxMrdkQ09eHX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xjq0aYAhRHvOD6rv6DbMMA6JtQtX/qj7OG0/8LB1dPCsC2KXKxE5qlmjFHLad74xofAz2LIYHN+/iktiH5SFpYczUCtCNwIOKxoMGrjAK0epyAk7RX1EbnbkemyEH35/PhNC63Dp4Cd9HSofCPShNv3uiz+YpBV2hmb7M8c4tJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4lr0nBn; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4lr0nBn"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso1354434f8f.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790256141; x=1790860941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmYrjQOzcxucWQmamc/vv/7UXHbT5JB9PXlS09/wJnQ=;
        b=P4lr0nBnSbjB9GXDOPvGIVhahSQpBo0+/3D+Y+kSO0XS/Jl1kpczyEYEXOhXXR71xl
         ml4+dXBeNv4Y/9QD1YVQ2MKiBVYRnEUBwX+LtGYSRd074UhEfOyT6twpVzJggeJ2wNYw
         KBpEtImKt56ST/hMP6+WIQkCAkFQ5TIRFGOMGqHHB+I2QoFf8RTf+pZFXJak2L34qOje
         sVNZwbaEa3gGJ7U4w0rHv/9e4JMO7vUyHlhrK55B1glJvmxhdngUtO7plxDJjwQT4sYE
         12ibE8I8PB2HlFcNA4Do9ghXUaN5xtAF5AEsC/u0WCgUJnL6lxzX3ZTckUp05FuWPQX4
         ow3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256141; x=1790860941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OmYrjQOzcxucWQmamc/vv/7UXHbT5JB9PXlS09/wJnQ=;
        b=M/6M+/2BfXtaLufFu6LuLHni2w6yMB5wIYKz5IsqnoJ0P3rphhcH/YmEKthE7lzj0U
         1KAhn4S3jh7ucf2bcfN4zOILs2vGSJVl3U5f4sOukPRor+ljqh3BqGmMVlTS/2o6s7O2
         CGOO/ek48nQjJtZ9N0fBGwT87K4Na1fSRqF4AGtoE8JllHcH4lAQH8s6EMvJUFWExiqf
         O32qfrE08xWAP/0SAxDIMhu2ynDVDn9Mrk8PODDTE0NmDF2Kyd/90Yz0JeGlkG9ksbhZ
         xnYk4ZWrc7CIAXWeF9G7qys5Zr5oduQtRSe9Y22QueE97aOtMrK6GkicrKKL95VmqQdn
         3XEw==
X-Forwarded-Encrypted: i=1; AKwUvBxz14n0xGpqjkE/faMKifeicvuwVyNHquJcbrDsZ7LSnTPn3JMA7M62Y9TTxX5YR3QSq2z21HvODdfY@vger.kernel.org
X-Gm-Message-State: AFuF++kLf13Kuf/mc8J2Gq3ZgowaUbBhAtlioJ7vATfCbnjc1wdPNb7Y
	F3r4pGeI+9oIa1qWID0Qd52h92sFsYgW1ZOEViraobuv08IVRdrL/wFY
X-Gm-Gg: AYBFou0tu2Lec0WtbjdpG3wQj/UABtgzqfhEZaWlArIbNczFqm1bVpcxaJ1yeD9ZEM/
	t01pH9w2AS+hPHWW57fsB5i+d2A5lWOuJyKitybMFe+XQKYH6alH/fs1+nOaGQnTU8MwF0xkdAN
	qQuuSElNzxG4dTKG7o+fnWu0sOzt+7wf19LMZuJ6roecbtSRPYCFEcAjySLb8uK6xiV2uUMMQVd
	++ukzmDXCQ5YmjXvPET0BSn+QgcdZSSnLN+ySQT8myndqkx+q0eI0BuHeKH2QHZkYDudZA4KEXg
	KxbysmZUbu8Nza/TBSo8epVvHgS6AnSkedCZYSksTaqovXd+y0GBVRsENHIWUTEH6L0JuXZQaEl
	aOwyBjDOx1BP/DDfzKHpxSw8xZYd5eqYQ1qC9P83RDdB5wvY4ZEm0NTjNPeifq4xwG6ANxWqsfs
	iSTrGQWFkOnsEvvNZIXkdFApqmQI+3VYm068Xi7y8bi1czrkVd9UJRdzsvgiJd0a1YVEzVzxDng
	lidSCzOUaB2EmI2CdvEFfs9SXvNRmqG0BQJgZx7DB2Wtw==
X-Received: by 2002:a05:6000:2501:b0:487:ff2:14f5 with SMTP id ffacd0b85a97d-4887170d387mr5025354f8f.4.1790256140984;
        Thu, 24 Sep 2026 06:22:20 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c267sm14642949f8f.16.2026.09.24.06.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:22:20 -0700 (PDT)
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
Subject: [PATCH v5 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Thu, 24 Sep 2026 15:22:16 +0200
Message-ID: <20260924132217.1281752-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924132217.1281752-1-sander.speetjens@gmail.com>
References: <20260924132217.1281752-1-sander.speetjens@gmail.com>
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

