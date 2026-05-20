Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A632C3E5EEB
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285459; cv=none; b=DU0rWC0V+yM3OW9xR5rcnDSs3mugy4/RhPzrJrYujqYszyXMtqLRfa4QgS0j2G6EEHx+AGUQdzMIOn0PYpcvyEAOM3gpjaRpdH5ctNWGxuaro09lXaECV2Q62SR6Z4qIt/b/SycaDBGMoBsV55WEcfxUvUIGWo5KlHL8DJqes2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285459; c=relaxed/simple;
	bh=XlL2Wdy/ljAyX45jVX9CtWRIi2MY6Y2XxJJ2ea07zTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cFeBlVicUYbs6Bt0pa/ZnDJpr6OknqF61u6S71+ASNL5NwMZaCqlAMppYTQtpRi0f3fn+F/JK8bfqCV/VHfh7PnTWbKy+mzuamM5tQn5zJVEV48yUHlgE2kOXLRkaxolX0KPMUobfxTGjcBDN09ovT8dCct2OQb9ry17+sgnlZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIGpvZg8; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIGpvZg8"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-368f25ff4c4so2494439a91.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 06:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779285458; x=1779890258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtNWmSDrnKYrKr76guN8m8K9HLXRTWxrFgm7bXkjKqY=;
        b=GIGpvZg8Q8bnGiNfRXE/yInY6FF4L96taN8teXSvzoEMPwI9/+Dc4HLW8a1YugEs+X
         EQmtKh3k8OklulNV4qdw2A7zT1n+Fq+ee44bhupbl0GoBm6KhMDb1yg9uYGV70xxcLhZ
         gTt+L78Ym1JThYTT9sWeRsgr8AiINsIcoyIAII5x4ebnq5VM4glyG1NbvbR0R4XQXNBa
         vTJlGli1C0Wm6qzGFvCa6cyvgXR2+uerEo4td5dLwKlRTbuqyyuQJ7C5fc7HY/eFleYC
         gJEqvrBPXQQ8S6hHpDKUAgzg2ZTTw8UvH/4jYaCMnoyN2+TZG3Z3iEd0/SEE+7k8Qji7
         wnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285458; x=1779890258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wtNWmSDrnKYrKr76guN8m8K9HLXRTWxrFgm7bXkjKqY=;
        b=PhdAiCx1ez752Ec1Yl3HI+xDRz5le77yQnX7z8Q2iF+mwTmC4epcsWZRh5q3IVd8pK
         5xxvZ+GM+5BOZjGZTdv2C/5InpkqvuU3j/e9B2ELwWYlk5sIEMQgq0pK2wpW54CVSbgE
         dj/4Uvl432vn6GzJukUISA8X3zG5qLNC1RUHR58GPncqTIpp0EScDK4nFrIBV7xezRHR
         bvlWxG1pRTDgnLTnfg5fOSsOVGKmRK5SUWGQ3tMqpqPRHEl6Sq3teeLKAUL7k0gWBAKj
         JdVg6d53wRPoUnyb30tQC1foYEL2ftXzJdL66mBBJR7phaNZ0M1WgfU0capWjQNMOWfn
         viJw==
X-Forwarded-Encrypted: i=1; AFNElJ9ArAnLy+Vjcg2DNAHKpIR5TjsuPKMEU6RxgllYSvdRloSajE6GqT+0apHmncPIUPiwWQzagLSgMsYR@vger.kernel.org
X-Gm-Message-State: AOJu0YwGa7csZWyvvLS2Vnqrtim0sfNX0hUKORWqLV7OD+q9Nz8LG5lQ
	LbfxqSdYJT9+fuKH4bxk5+10fr2+acf+0lnK4sdHERyFu8wHHPX80BsMmuV9pvnq
X-Gm-Gg: Acq92OFT1CyWDihnFAFZEM4atEaFA1cUKb+cMGcYD9VRRxMt10LQbzT5WTYkx3hpC/s
	mkiWGIK+kVf3HNSf8TYSsxCEcRq95n75yfEDWAY2ma+hnV0JXKCvJShXCv0Nn2YyvDcY0YOXalN
	Ac/HxtTz9AAjVM9enJB9+aK85VmfHrZIGxCNUH1r5fSKTwAC9Gf5K/nbdAKdLwysw2o8OG0L990
	lHQlPlM9Su5gzwjC7gH5LfWL3h3nZ2Tpgp/lSZfDAqF/IH0Sa3LWv4zvL88MByKMLm5lByvIrpw
	BkE0CB/2VcQld1VGeoDnsQqEN4uHIC/dOB8DTQPSYdydKkkfEkaTU9/cmswkrRQqwFqHQ2i+Iaq
	oEvZI7pV/LC/35kbF90ywWCl1PbbZdX6/zNmX8p8cZ8N4TL32HH53/4G5n74VdKevwL+GSA6xBN
	7T9uN26btgH2KjWTNEcoulD/lQkZA5ZPuz6gW7Asw=
X-Received: by 2002:a17:90b:48cd:b0:366:346a:6891 with SMTP id 98e67ed59e1d1-36951b82818mr23906168a91.16.1779285458103;
        Wed, 20 May 2026 06:57:38 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369572e1007sm7480867a91.6.2026.05.20.06.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:57:37 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v7 5/6] leds: is31fl32xx: Fix missing brightness_steps for is31fl3236
Date: Wed, 20 May 2026 21:56:58 +0800
Message-ID: <20260520135659.1430008-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
References: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing brightness_steps for is31fl3236 to fix brightness control.

Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 5b9ed5a1818f..2d7ff4c5a08c 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -491,6 +491,7 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x26,
 	.enable_bits_per_led_control_register	= 1,
+	.brightness_steps			= 256,
 };
 
 static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
-- 
2.54.0

