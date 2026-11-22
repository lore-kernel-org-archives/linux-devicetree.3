Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795338480;
	b=PgnEUU9YMh7Ttd6spdcwAjLgeqpNLbHG3VWXn9gRGCj44uIC+Nuic7SVJwntUtxmt2Ci
	 wjpIU1NI9WbNFNeAI8YoGOcmW28MmgeBjGw1URq8kx4oK2MUR4p6i1v/21D9Bq/9SD3uw
	 7HqXJKBJA3gMc/G62tzTmIP2Qyj5hRyyKwULkCMArKvrhDi0o2mGGYS3O864w0dg8wW1o
	 bQZZOQFCfaeEPj6qKzH+X/aSUrm7yc2iDPj2n167kTyb+fQ65/7/tCqoC8psFmnJwpwm+
	 rFvjaHRkXQIxHiUE/q3QTkLUwo2s/1M9LcXQFev4lDLHJ2gfeDT4Xy5Bb6z/tgkCl+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FzzE7HZCozxGjLrr7Gn9UqXhwvi6GyDdNSIP0zo32Hg=;
	b=b+VXTxfsy9lbA2huES0Rcd6Jxl9LiL3E8gs4xgVvVYq0KWXcReD43geeX/UagRLIoIj/
	 Xz/jsdqjsaRGkJi/RfXy6DvxWJPfnAEB+DkhZxexu4aT0tY2yqa/cjPiK0rvZrUq1zspa
	 b3bIzqJ1jRjcrFL0QOBcUdJk8QBChWZ9iIPLngMQlAwiwNLDgLvc0r5Av2a+CiCc3mKZI
	 9jNB1sAjkzz9wEKlcaLN/gBQyZgWZPnAVKfXRoBNNTr/G45G7h8bOaxa1OzifZjk+hXGp
	 C3ENXDGwyZXyK5y3cKNfjtuD2bVXcsi5wZMQp6OHscMfDILl4HawZ9kfAjBplOX6Daw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=koUYZ1e5;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D1B606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0D1B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=koUYZ1e5
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so1011600b3a.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795338479; x=1795943279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FzzE7HZCozxGjLrr7Gn9UqXhwvi6GyDdNSIP0zo32Hg=;
        b=koUYZ1e5vMcSg22Vqo+dLz1JeO8PfV60nbBgRBQu3kyh0JHuA1bVtOFCFtFoSxTVQ5
         xac91m3B7no49EkRumMy+d5hj2hkimLOIaJOww69pOqnyFt+bzdzPAyw/9sf7mQIF2eK
         cTOQvr57IFrOnCwRnBk+pxkt30HdOv7uBir5piufxwjdW4yeCIGH7t9zN3YbHdhxFVxH
         6v+8fGFIBioRffIc/Z1YovJ4QNC9jcHxLBjR//MAMYjlzwozvBHTcuM8tHpX+VAwvvz8
         wuoxPqZqQMGLiTTohC9uygdtsPvZxUZ7+gWvLqe+28LbzT1cabILV8tg2KasImKbK/fs
         KqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338479; x=1795943279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FzzE7HZCozxGjLrr7Gn9UqXhwvi6GyDdNSIP0zo32Hg=;
        b=n5JALmLXMTQW3XKSigz0tNB0JSKBi8WPyzF/MWwzEDIhgxmThGpZ6eOGPMkuQx0jen
         I+NtScxxUeMEOY/ixSEEnZdyZjyuwhILFCy1kF8JYTKzh8UnjQUGx4a2+KdXlmQk8JIA
         bxQtHdNARpvqtCj8AIn+SIRpXhJXWcLd5JDYYb/TO7tov/ZNNa+IUbILY36wukNA/wrS
         2PVTJ3XdjQInW2gNmuRR2EWbQfv9juEOv6Xr5Y5FkUPBHz5oZDq2Fv5OEMcbtYw/L9Pc
         omKagGqphpc9Pvb/lzXqddsOG545OZMK4nT0Sj2SnHPhhu0ONPBRzS+JRm1b6iP+a+sF
         vWlw==
X-Forwarded-Encrypted: i=1; AL+hErFggOctVohYW8gfaAeeJOy2qoptqgTiBFtP5fKSq5uhw2QV+i958AZZt92Ww4abkBFp01pmuQkqE9jr@vger.kernel.org
X-Gm-Message-State: APuU4Z+rQlcW8SKMq72R6O2+FALUwMXoYTwKA9nPXSqhG4WzfzT8VjLd
	G+k+5FhSwcp8+iKDJJOgUAHWFM79j3aj1x3nAdzxqLUmOLZ2I9hOo+rq
X-Gm-Gg: AZFdTZd3wK1hFIGYcTUxFdM/M+ra6Cj2fnaF7BVeTYn4M9bIKlR/B+CBAKtAxmBchR1
	X1OzDjrF7Sl58VEHRPmi1BS7p9xe9fc9qOtfqDK2NjFXx8FR7GZWMm73UFdoC+f7WxoGqFhHgXO
	U4diHrtT3kIaY4nOqxgCd1y7IRH5IbV0cq0Ar/TUEpL5yPl2DMgO/bWapwq2dlCFAD9Sv0XFm1H
	s9ewGdeTArO0FyvsmkJl80ewkqze7OfmEvrcunuL3SrsfBmXYZSoWXjdrT+rgmL3tgYTJ4SwpMq
	a/pm9j/xHLz6ksXOHa9zdWoPqOih+Wi7+r9Rn98iG9dCPTizWxVfIRav4Pmu+Pcma6fy4RtJc1H
	VISXyOqX5lSHzusRmA8N6vMdICRuc6pIRyt1CAbDIo8NKuGg1wJw4ifd5czWjMFibuACMUd93ki
	g1AQR90OpvkphoKCrPUWF2rylqrhR/e0o0EleALMIyyD0ktoFbf6nAp0ulbvZG35f5mZT5O0TmM
	cTHVa0ppycVmdZM/d++Wa+q6j6HFI9U8zLBwuFEZBarDVCqRuwVVMeYpa5m7wLj/U226nkbqBoZ
	1db6XKirrv+EWtb5+9LRkdf9oZhkaOhoPvomjc/+ewiZWfkDnyM=
X-Received: by 2002:a05:6300:8811:b0:3f9:b4c0:d3bc with SMTP id adf61e73a8af0-4014c94a9dbmr7480537637.24.1795338479155;
        Sun, 22 Nov 2026 01:07:59 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c86d821637sm3892624b3a.0.2026.11.22.01.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:07:58 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: florian.fainelli@broadcom.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] ARM: dts: bcm2835: remove redundant CM1 LED node
Date: Sun, 22 Nov 2026 03:07:54 -0600
Message-ID: <20261122090754.193072-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The CM1 device tree include already configures the activity LED
through the &led_act override. Remove the redundant child node
under leds, keeping the CM1-specific GPIO assignment intact.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1.dtsi
index 750cd76948e3..7554903323ed 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1.dtsi
@@ -6,12 +6,6 @@
 #include "bcm283x-rpi-led-deprecated.dtsi"
 
 / {
-	leds {
-		led-act {
-			gpios = <&gpio 47 GPIO_ACTIVE_LOW>;
-		};
-	};
-
 	memory@0 {
 		device_type = "memory";
 		reg = <0 0x20000000>;
-- 
2.56.1

