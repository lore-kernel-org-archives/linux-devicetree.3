Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926952B9A4
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497451; cv=none; b=MztEEaLQQfLPQmc5xZaJ0oZoVn0naHqnC/C9dcCL+Oq42OGcfgd3dwnZVp38K6CoQkGkS1mTRNXCBp5XkoWsfue7QRW8+h9OaVo48VoEJ+o4l+UXLa87mSnS1uEVihrQTnjpfWlLLnwl5DQXXGT9tIwYJAI+WUts9wHD4XyR8zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497451; c=relaxed/simple;
	bh=9xTuhM3rXQsKDiaRmFu8cpOscVPQZRyOPkfxie7Kp6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJhNRfhZTKqYDCasSNgvqUX9dMSYUxqe32vxukuCNfgaif3RnOGjrEY5REeOdGFj6PzFZ0vlLw9tg4l9KfLobHhkJl1Z9G1Qhs0bX/G5kzcRWrmZSJseOKB2sN9eN04JztnV4ijyCgcs/jpTE2WV5BiYbnvPwoX/sJVDDbQAkU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGG7dfFG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGG7dfFG"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso40052985e9.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497448; x=1781102248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNJJ9kwWhZqeENPGzU0YRnOooYzBFcKz0B9dMRj627o=;
        b=dGG7dfFGOrDD+f+Z4Bxcp6ZsC/oEMfNHKrJTStoiW8kUY5Nvh4NlDhJGc8SkBU6qpk
         tzPvJ3tS7CaIlwX5Iy6DT+WPw0J4tCgW+YimO55q4mjIuBL6Oc1Lsu8cMvyI5k2aRCBx
         zLT9E6RWlEct7if/jgNuFlB2t0VuLvV6+Dtd5RR9cPmAzRx0QndxuEIr2SJBGGs3bVdO
         ohQTs26dkkKUxajv6Cfb5PmeDfe/73Ws99V6PRXpBdUQw6zvg5UmZcRKJfMA1eAAglcz
         S4grxhh66sPGhbZlmJQ7WVHHEDkP2V7yoIZ5RGvg16zfzL3PzjBqBCB2qTLqVF0z1UAX
         9o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497448; x=1781102248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zNJJ9kwWhZqeENPGzU0YRnOooYzBFcKz0B9dMRj627o=;
        b=ce/24Zh3UOYrVLBG1B9jAj0H7liPql0I+66BC9fyZDWNH3sWmfzNM6D9KYgAfDsAoL
         RCT+ZaMRvuJ65RSZJKHyCscPWAcQamrCbZpFCqlxcQTH9LklSuQ40uNbNa7AwZYAXFxe
         lChnsYqGVfAGToDnbIk0OnUIwOtrnpy4MDtj4aFSqAdbjcWqWEWClXJ0YeQ+ked6KHM6
         O8MbbIMBPJI6c4CRO/b7PyTC786DvC1b20boLECFpE9R1JIBNVPPPpnDruGG0NvMo1l4
         WRBj4rXsM76rgswAbP4TvzxmYhxjAiBG01f0Am0cASufdU6lJySPg18nVz1Q+iKiFQNI
         Lgfw==
X-Forwarded-Encrypted: i=1; AFNElJ95EaQoR+AnzWxyNda8yJ7H2ljcND4HqholdU/cr3RnZ0zq/e/ROo8Sc8LEM1+q8A9I8YJjwJR/xse+@vger.kernel.org
X-Gm-Message-State: AOJu0YyquebiwmNPzbolvSjPSbjJ3TuisqJkfSqov5YhhOUOUhEdPWcQ
	OlqWCCpobrU+f99Vwc2+HF+/ppBFCiOV/Z1fRzWBFb6s8LvhVxJnwQG/
X-Gm-Gg: Acq92OGasXfpiPRERn11Zb+qicU191Y1V/O9GV9QwCgw/hXL0McQjc9IWS4vEe0ivez
	bkvdBb7WH9/b1PeuxoNmQO2TPk3QUEAq+4/NoiYDyQwaSSAnQcwb2V/J8La3nMMvONeMyuTEYe/
	B5ain5BUjghldOsBkG5B3TnX23uNjOFPf9+S3+eylf2eo9eocmU6Qc00kt/VGfNRmLfT8VBZLGG
	8sXTfh6TnFx7NCBHB1v2XPM8rusI7PLybm0A0sc5BS/h8i8eh3YkhUR/H6ShEUzRm5LlynXpmH3
	auXD8hvT447VXwL+LLW9pieONqiRCjRc+DyZLRsE9+u2RCmSzcnaXc4bP2a6zHmarWl+OSy+kvh
	Qwe1U+g3F4dMl053cryqfomNRUmQ3K3o/0upklywLmh4CJ9tG4WgTyg5gYvm2ATSBGW3huSJSnR
	YNDwn04QfdGkz8bDt+Bk9rOTmehEMP+MN9/TAhp908tdPJEdfKpjbO+4/+fthJSaDrDKWV7THKc
	DIy/Afsm+uwq7NWcfBnpR5dEDhvm/5bBHlnag5eAvve/4hr
X-Received: by 2002:a05:600c:1392:b0:490:52fb:12dd with SMTP id 5b1f17b1804b1-490b5e8cb8amr58453575e9.10.1780497447770;
        Wed, 03 Jun 2026 07:37:27 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:27 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 01/14] arm64: dts: imx8mp-var-som-symphony: add input keys
Date: Wed,  3 Jun 2026 16:37:08 +0200
Message-ID: <2a02e17dd1cf516332e2f86e733620d58b9a73b9.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Back, Home and Menu keys connected through the GPIO expander on
the Symphony carrier board.

Also enable the SNVS power key.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 291f65e36865..25f707012f62 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -13,6 +13,31 @@ chosen {
 		stdout-path = &uart2;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-menu {
+			label = "Menu";
+			linux,code = <KEY_MENU>;
+			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
 	gpio-leds {
 		compatible = "gpio-leds";
 
@@ -72,6 +97,10 @@ usb3-sata-sel-hog {
 	};
 };
 
+&snvs_pwrkey {
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3

