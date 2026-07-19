Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4323D2D12EC
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 05:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784438597; cv=none; b=JU+6dhMktZadrWS0hUyj4PmDvWcUBxIJKrF2DxitPazB/9qANFM7DLet8QD6pQxVlH6XcjeuAMSaXuTRv7rjh8HawG0IfEjnyRrTY1uufNJt5smbxnK9Q313h7KvZL0pGC3hFZcBpdW2Uj9QtxRfqan/KaUajBNNUZhs1Ln2F28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784438597; c=relaxed/simple;
	bh=yLPQqGzn6dCjppiFcXijuOgYz1Ewz8m+tuHPWm9WRNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OkRKijWNC+LOky/DThzDLNoCK65svlNI5K5bcrLFpIpm1NLpmspqmSpYzRHgBGByn8ugMawUgd8nhhK3c1N1RjYUOZeRn/JE2V/v620P+oQ1E3YlhewdADNJXw+ou9rZIUGpgdaFsNQFz/PKv04uJ2qVWvTuRuRXaYV0FtNDFts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsuBqthI; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsuBqthI"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso1754405a12.0
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 22:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784438596; x=1785043396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRQCIegzFaWRZA4UwAIm9D6G7unV/p/CvWpguWA3kC8=;
        b=gsuBqthITPDSRuccAlemfSH7M+uuTo32383IutRaldHOaN5JzItUNz/0/sF9245p1X
         vF0nO6lmeMWLYCBYopyl5A0h84ryuNtJ+ZTITbHPHSwFfNWn0HgZRJWlKOkX5JkG6L73
         m5maelMTLtaM9Qmm8GDJU4VFuRZGw+4ZICwA6C37Ir/hk7auaE/ioK1gc7wXaX9CUYmy
         IcSYOXkJGGEJQQGNPEBrJViwS6dLrkvC6lNQLedGdMOQGi8OoFutaqJ1/qXhi9no6M4p
         nvvzvXIGTg5fwYWYZ4D24qi3Q/VVcEgC7KzR2ZWeNOADIJHRQjpCV4aKTtgz60I16To7
         pTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784438596; x=1785043396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRQCIegzFaWRZA4UwAIm9D6G7unV/p/CvWpguWA3kC8=;
        b=D7NUhgSC/esPOU6ySKEw7b2ulg0CEyYJzNFoHEAXDwUMOMXdPKdpJ1RCFXlaJU1cO/
         CyGTuj2lWCLofRFhqbaZIn1wfGUxibfIQCWFo54N3ONzAU51mk5Fv0ZrmxHlD0qNOZAc
         5M6YLRcfIhXBm1BRy9m/GMiAmIuTKtN1yYkOEQK+utp2xWXJ0qS2YdpXf8pbzcUYEPm3
         pi/J1IqMe1f3RGP8z4hRdoosMiiDQXB5v1Yfuw/PBymmKrPhYpzK3n0slmhvOiU4o5cy
         02bfp2/0D+brmXTd9Ry2WInOCOUwgOUnnpDtCkCMihqLAkUlcsoD+5rGeDjUtNpsP10z
         6VYA==
X-Gm-Message-State: AOJu0Yyl7fwqF6bx9ua/9OFXBoGYcG7uhqDxkycsVlu5wAPEt4tegXrr
	IvMJ5+JOEUToinXY5shxLrILmMziaFA2RPEylBwanKlKYl+LWHaUPP4T
X-Gm-Gg: AfdE7clPMgRBDxeKBn5i/+AGN7KJsWuhntSPvN5jmMHD5dXHbJhQRHuglvd1HiFnRUl
	tvBdjpdgsVIoQjmHRQea7mUugcttvOengDAH3pfcp978DYPHCuyTIHN4iJ2Pam62PofJPm9e2cZ
	LPWXvqobzLaVZozqPs3xuSKVkE6KqBpIBlen68WQsnSUzsOdBSMQgGoTREKXk1jCoY+tse27CoH
	J3k+Sx6HeSO94ehfma6/2ZpDugo3UzUQzCWBjbZSShoE5zzISAmHmxgQRjR7zhtBSUgWM1YSMYx
	JIs8d32BoqRWvdNm2VXmALQcKbTPehZoObU6bGUatLcTjRMzZBumWeE548saw6/gbMj+BCJnirA
	dNnUxGjfqsTRstNJERonHrqu0JEhGJSg4xhOkXtIeXpTvs931kLugCdZvv/WbS3soq8m0KMZm8N
	wxb4DwU2XC2FkAVmhbzdtJttZui3MfDtKUiflTT9UTyjA26vlvaGXZ88j6JWzZPfd7nQ==
X-Received: by 2002:a05:6a21:1519:b0:3c3:7195:fd47 with SMTP id adf61e73a8af0-3c38db2d82emr15103340637.24.1784438595677;
        Sat, 18 Jul 2026 22:23:15 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:431d:c6bc:133f:2959])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbab9sm25950461eec.15.2026.07.18.22.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 22:23:13 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 18 Jul 2026 22:22:54 -0700
Subject: [PATCH 2/3] powerpc/dts: pdm360ng: Convert ADS7845 touchscreen to
 DT bindings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-ads7846-pdm360ng-v1-2-f318f85cda57@gmail.com>
References: <20260718-ads7846-pdm360ng-v1-0-f318f85cda57@gmail.com>
In-Reply-To: <20260718-ads7846-pdm360ng-v1-0-f318f85cda57@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Anatolij Gustschin <agust@denx.de>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

The PDM360NG board is equipped with an ADS7845 touchscreen controller.
Previously, pdm360ng.dts used "ti,ads7846" as a placeholder and relied
on platform data in pdm360ng.c to override the model to 7845.

Update the ts@0 touchscreen node in pdm360ng.dts to use the correct
"ti,ads7845" compatible string along with pendown-gpio and
interrupt-parent properties referencing gpio_pic.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/powerpc/boot/dts/pdm360ng.dts | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/boot/dts/pdm360ng.dts b/arch/powerpc/boot/dts/pdm360ng.dts
index 67c3b9db75d7..69d8b6a0241c 100644
--- a/arch/powerpc/boot/dts/pdm360ng.dts
+++ b/arch/powerpc/boot/dts/pdm360ng.dts
@@ -176,11 +176,12 @@ psc@11900 {
 
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
+				pendown-gpio = <&gpio_pic 25 0>;
 			};
 		};
 

-- 
2.55.0.229.g6434b31f56-goog

