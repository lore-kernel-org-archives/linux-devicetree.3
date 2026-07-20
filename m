Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ADF3A9601
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 05:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784525846; cv=none; b=ajFA59dVO3Fh1AvCxT/Upah/8q2rUZx020YYfpiXvlq453e0p5fWjNWTP/lwAIt7ySgZy8hlvbb6TsVudDCKcTbxusO5bBUe6SvuMyPn+hqWf3uGVLJrFV2nLou/O2w9SU808eP/1KXQYQETzBqTJyaBIDMakTZbjdyNV8/nB2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784525846; c=relaxed/simple;
	bh=1b+RIXFU3fcXw2OgBmeRaWAU24/RS4EriQduWZYbIkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R+gZPe0LyJNJlV8lhLtxiImK1ItX5piTYUU88QDXb8kfuTY6KsEohmCH7uuOXiKKTnoDO1RE5A0PXzhGiNKIlukYVwEjIYez9AqQThuZVoYEC8KWxZ1PpcDg8/giRT4R1jiB7l8MLkph0oTyhDOKBfEuJ5GtIBGLp2TpHr50OuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JI+S76+g; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JI+S76+g"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cad4170e8eso131245515ad.3
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 22:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784525845; x=1785130645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i2XnjXP0mGqBGKY9hDxzognSDdDCZFFQuON2AmUxnRU=;
        b=JI+S76+gEqkVEJG5oCFwLgbisIpz4Lt9QtnbjcqDpgJXueWoZ0lG1fKDU20ANUaXmR
         2dX+bihZL7DMNJXKivb+P7bhkEJRRPglIh7kOodhNT4rveC6j0Ikxpjy/sXIAHDgDkXG
         CQCLuRnUhLUxUD4LgC03RI2UtNm0AAJbEm4t3pUhFnLx/tM4csHrSnqTjwp96RxMh93X
         feM0LcEvSONLzWwaJoMAlVl+OVBbch7KIpU/57P2/9VKMwwtFGyWnNVb3hC/um8tZ+gr
         w+aKaB4Cd+EFC3B5ktL+tTwZtywfUQuqePTIA5d4cESr5qpaokz7reQHvYPwxFN5LLhx
         F6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784525845; x=1785130645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i2XnjXP0mGqBGKY9hDxzognSDdDCZFFQuON2AmUxnRU=;
        b=Idbw1trJiqDqSHJuzRrNw0DCjjlFmI3sTzDXa/MulLtrpiwrUqaI/lp+t+LjVdM0iZ
         bz7cY8IQMtgYuHPFOWiqvVavUOy9wNiMy42ncE41doTH2XEpKuq3rpub6VUTGnJtpGED
         muyAhxPAbm/BF6HgM5b4aU4YSlVE0TeX/DXe7szpwshW/ftqq/0dzqPmxFd/6N4wZVvu
         AMc5G/IiMKRP8Jtk+8rgdld3BnxEb5OK2cYUoIgVEHuCm1mFBzVfhmoB8EPnwUDM7YUU
         RU7I7hcZ/dSrW29tFEBRKb5bi7NAXEMdX56m8rg+1lbX4DhmHa9OW3DeR+BFaEHe1BoC
         FB0g==
X-Gm-Message-State: AOJu0YxzPIrkqfMnz5202363jcFdhfPKvm1VDdr3EgjOAifsVXUzkQix
	Xqpj64nRcXdS87PvQ93aArSiFK1Sdvb3aVP2Rn9TDJG8rB8n06cP5qEy
X-Gm-Gg: AfdE7clGY1Ix568Ovj+n32zjjPhxd7SPaz3hMJ7+y+etCH0sJN7CQ56qGluLDaVlDkx
	ar+1gVJ4nl+LArYKdOT6vokmiRfluNn8i+7+P0RoabJcD1Jw7CuL/S+mdqMUB9x0zlrMMkbkkq7
	jQkxwpzl4rDDR9d9OveZdWwTYDjyu3OeR+inH6oyaKoZqr7ibyUZ7UVQYb1ILQJ2dkWTd33gAiW
	TCevld1Htog8g0RE3JOpXRwSTwR0ngiq0A2WGFQMqrquct0vdD5zuZfetX+O9cmWwUs5kgOOI0G
	NePYDgUjPgNM9/Yvw2fhrREhzmNdwR3YQ58f6KScGjFaCl8MWFkEUcZVq3k3C/cQrKITelRU21k
	cESAQpVJB3AmxdJK37xapa4u9TWl9mSJ9viBWobcDFPJO5cq+j2av5TA0GpyDltoT9e8BREhQkW
	Zmto5E61azQe9ArKc/n50q4liNEqUwoE2OjQ2rmsiTRk5PuDQdUQ65FXp9S77Z61pcPMkGmEUFO
	Sis
X-Received: by 2002:a17:902:cec4:b0:2cc:6329:b7ba with SMTP id d9443c01a7336-2cf34857697mr130158805ad.16.1784525844860;
        Sun, 19 Jul 2026 22:37:24 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:345f:e51b:3d0c:4546])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20cfe3sm34224663eec.30.2026.07.19.22.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 22:37:23 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 19 Jul 2026 22:37:17 -0700
Subject: [PATCH v2 2/3] powerpc/dts: pdm360ng: Convert ADS7845 touchscreen
 to DT bindings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-ads7846-pdm360ng-v2-2-1198bd108502@gmail.com>
References: <20260719-ads7846-pdm360ng-v2-0-1198bd108502@gmail.com>
In-Reply-To: <20260719-ads7846-pdm360ng-v2-0-1198bd108502@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

The PDM360NG board is equipped with an ADS7845 touchscreen controller.
Previously, pdm360ng.dts used "ti,ads7846" as a placeholder and relied
on platform data in pdm360ng.c to override the model to 7845.

Update the ts@0 touchscreen node in pdm360ng.dts to use the correct
"ti,ads7845" compatible string along with pendown-gpio (using
GPIO_ACTIVE_LOW) and interrupt-parent properties referencing gpio_pic.

Note that changing the compatible string to "ti,ads7845" causes the
legacy platform data notifier in pdm360ng.c to skip injecting platform
data, allowing ads7846 to parse DT properties natively. Although
pdm360ng_penirq_init() in pdm360ng.c still runs on boot prior to removing
pdm360ng.c, its direct GPIO register writes are harmless because the
gpio-mpc8xxx driver resets and re-unmasks pin 25 on demand when the
ads7846 driver requests its interrupt.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/powerpc/boot/dts/pdm360ng.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/boot/dts/pdm360ng.dts b/arch/powerpc/boot/dts/pdm360ng.dts
index 67c3b9db75d7..05e93ca294ee 100644
--- a/arch/powerpc/boot/dts/pdm360ng.dts
+++ b/arch/powerpc/boot/dts/pdm360ng.dts
@@ -9,6 +9,7 @@
  * Copyright 2008 Freescale Semiconductor Inc.
  */
 
+#include <dt-bindings/gpio/gpio.h>
 #include "mpc5121.dtsi"
 
 / {
@@ -176,11 +177,12 @@ psc@11900 {
 
 			/* ADS7845 touch screen controller */
 			ts@0 {
-				compatible = "ti,ads7846";
+				compatible = "ti,ads7845";
 				reg = <0x0>;
 				spi-max-frequency = <3000000>;
-				/* pen irq is GPIO25 */
-				interrupts = <78 0x8>;
+				interrupt-parent = <&gpio_pic>;
+				interrupts = <25 0x8>;
+				pendown-gpio = <&gpio_pic 25 GPIO_ACTIVE_LOW>;
 			};
 		};
 

-- 
2.55.0.229.g6434b31f56-goog

