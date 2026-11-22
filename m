Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795342691;
	b=YqJpowbbUCEG17t+P0igq82ZPOM2GAhmShwgmeZtTrPfbxumC8mjGJbCUA0fbKg2/o2q
	 q82b53zLe1eULBjdKaxbNApFiWntQXV6L4qABFlV/FIPNnfVqaRTObm6F9mnMNPPVd3Ae
	 sHzRxyVcT1x65yypv5nuM1RNmkwg164PkBjUXQDrmdfHzsdUT2mO5Ul7qTFIxWLrPCCBs
	 2YuP9m4T+kL9WkBD/pDlRc0QjY7ui408vrO7WebwwUV098ydgkHi0vzUCW2zzzdyMEdiL
	 1WOAaPFC2Qruo7TVJ+v6TvVVqPFe+7tQuO+iFL8xOGZbuCglwieaxN0sOR5bRLYUaRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795342691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oCpV49nOga8AoZMY7yHg06vfkscs7oJjLDcTlwIf7nA=;
	b=5SJxpb1zljeOGom5IW5syXIBNGej/CGCx1uvZnCaGF3h6vKNvvaiSodXf+nTcpKvVRxE
	 uei0ilusslSE6w8//SJ1xkLRpdPB4tfeSASS47Y+rvNAfHC3xPjtrRr0JbH5TiijuGcOj
	 yJeJ/6O2OSe3OrEa0rUvKlUoyfh8Sh9X+W2lGiWf8XarOOiA/JZHTzGhZsGahoGt4pD0S
	 9BlmgYrmQyXnejERjKKmX9GBA3phVMwHqPEuSytzLwZTwiRMXoFZF6G4ceTnCWEgVAfHQ
	 D0kJkCdp3tf5eRfVVK/RxTJVV31WNPNHVbfJ1pboK3Ce6BV4mnVgKlCuKxjB82J3cPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g7G7xhn6;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA5B606A33A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AA5B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g7G7xhn6
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b413997581so2027113a91.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795342690; x=1795947490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCpV49nOga8AoZMY7yHg06vfkscs7oJjLDcTlwIf7nA=;
        b=g7G7xhn6BKkNkLuaikWbY4K22jSt2/x180ZFzhvcAu/sv1xzTxeyrGpK3uy5TAcEz9
         jo8tUHVY/xpcRGQmCDnDPmHTw5ECPKoRT92POP28b5TGwVooKlgruSWjKTTMZiin1dfE
         x1JUFKigPR9z+HTPfW8SJkNnJJdvuWWF8RmHmzkKn9bperFFO+JzuzmIHmDD9SAO48t/
         +kHUa4j+CTYyGm503MCTnVdRPAj8W06BluKIwYy7wct9gDf32xUtQx9xQgc0lTzYLRY2
         /Vm2thBE5zOWl921kN4UHXSEiWENojKWKLKfVqS3qc845F5GY1djR4ASXZSC+Vhzgj3l
         dbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795342690; x=1795947490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCpV49nOga8AoZMY7yHg06vfkscs7oJjLDcTlwIf7nA=;
        b=HEifwNt9590XnFWkFSXQjTvbTmLD5BRtauoOm0STzrwrUPfg0qKC2isR+2mz5+53eM
         zp0/Udrvc+SIjEBNWMBYIxCvZvOiQUASnhUZXKejIVvmenlNre/x8pC9f4nUeAtpTQ7T
         uFNqYXCw+Heo7ZzhoBD2HOjfOiz/WV3Kshvdxzrh7+nBbbpyNEubLuf77hpblyWRmdqy
         M6ifWRm5PItWZg2gL445JljnYwlFlzB322dfvKLk69zWiVcXUH/20SNxoV0SjnheAoOv
         5V61WL+63whGFDf45Ql6rJGXiPU4ho26G5THdGQhU6+TgyDSyKa5G56RGooqcmrXq+zf
         aMZw==
X-Forwarded-Encrypted: i=1; AL+hErFw+Vo4/wCSVGcqAqUHT/5n1AIjag4d9+8hEp7kSQeedWTB7gV54M4D4PNrfz8UOHcdtBQRlnBvL0Qj@vger.kernel.org
X-Gm-Message-State: APuU4Z8mQTngj5hZX3lHXKJoUnwFWxhvHpMFbYuE/upW/QisK+RBx8xP
	yeYCitbQGcqZVYQ7B2k/8DQZd+bBAW3b5ni6WJY2BpE8wc11LIXksSGL
X-Gm-Gg: AZFdTZcwIrd8HH1ArWcnYPkISRryoLynS90n9vg4ZyTMbGgKb2wsHg4ULbDFHxX2Tpg
	63W/BrW05TnR/oJwkJE0t3lzsl1SpF/91neTVv1kwLKy1NKPpLDa/+Yoi49+G19IVGVEagTLt2+
	fJ8jQBVka/fyQ8lS6DiX+Jf+IlsRuMThJL3K10SgDZrprw62VGoo89sQajfs8mC3F4TdgvmEH6o
	X2eIsa5DsdWd7eCuhAk8tvZdAxVH80dxgQCpkY+HeRX5FHA0zOmrWgkC7HzBBI5IQO1vHxbnr6w
	7Q6sFbh4wt89pFbpBBTQD1PMuyU7E/6V6ESL+cdRY/4iDX4z8YGddICBwOcGDm5Re31ujPLoII+
	O2kK1A2sooOmYf5sjkHSXmnxmIe1Ti3Rk1GuhrjLqwP8TXh8YKQwap6/lpkTbhlMLOhxHZbvr8e
	ZLHgZUGVOIVT3AEOoNiahjrUfl79pavzsb1W4o4rq7f1rW0qbWtIeyZCbg9AQWrpZNx2siZ50ht
	682+9djtbbkmBT0JeDNHy8K5mgyMQdY7bfSamjz275kbKv6C9KY87BeMDItI2ZH+y+xJMQDbnbl
	2g2z/3YGENFg+MIzijUSPTTCcVAi4RayB6n7w/z0/85fl+3ueuI=
X-Received: by 2002:a17:90b:1fc4:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b41c98a43amr7026493a91.52.1795342690497;
        Sun, 22 Nov 2026 02:18:10 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm14953787a91.17.2026.11.22.02.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:18:09 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	robh@kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2 2/2] ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi Model B
Date: Sun, 22 Nov 2026 04:17:59 -0600
Message-ID: <20261122101759.206056-3-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122101759.206056-1-artem122novak@gmail.com>
References: <20261122095225.200916-1-artem122novak@gmail.com>
 <20261122101759.206056-1-artem122novak@gmail.com>
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

Preserve the leds and led_act labels when replacing the deprecated
LED fragment with a board-local gpio-leds node.

These labels are exported as device tree symbols and may be referenced
by overlays.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
index 72764be75a79..660814ce851b 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
@@ -3,7 +3,6 @@
 #include "bcm2835.dtsi"
 #include "bcm2835-rpi.dtsi"
 #include "bcm2835-rpi-common.dtsi"
-#include "bcm283x-rpi-led-deprecated.dtsi"
 #include "bcm283x-rpi-smsc9512.dtsi"
 #include "bcm283x-rpi-usb-host.dtsi"
 
@@ -93,8 +92,17 @@ &hdmi {
 	status = "okay";
 };
 
-&led_act {
-	gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
+/ {
+	leds: leds {
+		compatible = "gpio-leds";
+
+		led_act: led-act {
+			label = "ACT";
+			gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &pwm {
-- 
2.56.1

