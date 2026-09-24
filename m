Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E914457C6
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240808; cv=none; b=O7La1SVFasDGNJWls6riHHEvvlNjqBjppa8yZlNg+xKl8wNCqsMRSyaeXh3apwMeXJCGXKdludrhlicBTtiGIU2GERaRN9twHLkUnVBNFrJTnergy6GUjwYuOeUXOJTf15pt13QMnP6T+sMl9HO0P49xxmAqGmW6QacwXvEKhdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240808; c=relaxed/simple;
	bh=UxPNWJfzzN3pc+SiwXYWwQaSf/BsCFyVvpF19rlQ91A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UK59ozXMapl9AbUnTqIDz5vpMzcqnA2nO63TqW4cQPbXYBxtgtbWtGkyH+4nqzfv3bHADPJJXE9mi6fpiis3Doe/VbBdg5Mc5UAAG6q5CbNRw62Fw2i9/hZmOw8Uz6dh1z+ro1UZVkap20TvI0rvkv5OT4tcxKU1/BmGGEjUspc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhIMgG+u; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhIMgG+u"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so20452055e9.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 02:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790240804; x=1790845604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8NlIOK7+oF3d5liGs+n8ifJbGtp8feUVzzfztaQ8JwI=;
        b=OhIMgG+u2bnKCGtjWqhF07I/MudIT98aJynUhY3B/7gnxrT0cj8PoTu/ea48ZHLTs/
         Uoo1EEdk0sFbeFwHjUNLL9BQHEooFi7ph47a2fo2qDjl53l9XfFGhA9jZanpCVtgUlr3
         aKQ2vj8vzY7MQY3a2FOlodM/sihXkO/djQP4mv33ZoeDTNymMyHLkgIJSwk4Zq3BC23M
         HaLSARBeE1eiSSHhAmpeOIkInesmyMi55/3REIVaa3Vk8PzdScs1sbn4aPNmYAxTtIrY
         dwdoZYHECpLRax9bGWsfwuht+iWJhFqHzle6O/LdsyzoN6C5Tn+BfOPYfzaWp4OuNOhJ
         yn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240804; x=1790845604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8NlIOK7+oF3d5liGs+n8ifJbGtp8feUVzzfztaQ8JwI=;
        b=AFMHubM2YmExPnd+8uG7et/gjBnxSGTkpnFsHHftI1DLZJ+1on+5nWZGEj8WUUU5JY
         Evn63Na+YMJFELEk66d4lma3Hltv5JFK3FCYdFPcJzDdvlg1KlrEizX9amAmYXe1ldFV
         UjYcUpnp244DEg9EhuKEAyD/lViTR+yjS3V5JDgE7BHjMCOvt9LhToQzpwjTdVEbcMvc
         vByVnQzKFiN2U4Y+Xsv6DzmekFBQ65W5yjqJh9tihnAZ3R1FeBxL0vYilrLfoy/qKFuH
         krcGclJBk6jETGcl1mvm8bbFfoyw8dB0t7jHCV/AlnmsV2psItTv6pkQwJxWaIBOy/EK
         nPEw==
X-Gm-Message-State: AFuF++m3k/0zZ85fjEqlYfhPb3rAA0iT1t5Wv/OoLnXGQ/7WPqoiiF3F
	SYXjxU0Wowkm6ai/9h28VVZAu7UTnNCwRmyrtHnEImYjPItdDxXOKa+x
X-Gm-Gg: AYBFou17nY0SopgWagbA8qt3vM/BTYdFhit76w+0O41IW5k1wNgfsbe1lOpl5dXk3wA
	MR0KrHK9bnm6E71talhBpnzkACq9seP2/KBDa12rOVyHiOW97SvUQMlTLB5KQO1GBASzZqKzh4d
	Yr11NZbijIFvAoYQghH9KvkOsUOFH0uO+El0zDbkpcGM8lCJiSCn0rbEScul41UVUwdULTk3VuH
	nicTnKj8Z25FFS6iM+tINU1c0IuJo5Y+HegMDrOGQXCtl9NW0RC7SDuGk6kcmCAplOzV1QnPbx0
	j3QmgbRxFUC6gQD0LnyxHU5OziAYLXQgvI7W+den2i2xeiCZG/6DgtJhgR8od9PUi5G6/gjb7jn
	jyKGEiQfODVD22zio4oU2WqXbjif+o2kp5COpIIXxY2pcjXB3bAUBu4AHXGKcnd0NxGrzAk7eiM
	Gd+2YXfh6i3Jvlay/8wP4o8LFzhFbegzXhblYjhbjgCt6UhZSONc4BvWPmS2CR9nC/Gif44aEJu
	ugzoV4+ouyRVdFBAQGOD066x3Qp0A==
X-Received: by 2002:a05:600c:4ec6:b0:49d:1a02:4797 with SMTP id 5b1f17b1804b1-49fe66d828fmr29579305e9.17.1790240804130;
        Thu, 24 Sep 2026 02:06:44 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877c379sm12875561f8f.29.2026.09.24.02.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:06:43 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/7] ARM: tegra: lg-x3: Add flash LEDs controller node
Date: Thu, 24 Sep 2026 12:06:06 +0300
Message-ID: <20260924090608.28734-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924090608.28734-1-clamor95@gmail.com>
References: <20260924090608.28734-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add node for TI LM3559 LEDs controlled used with flash LEDs in this
device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 417cc1bf42ea3..a59539f36a316 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1277,6 +1277,7 @@ rear-camera@10 {
 			rotation = <90>;
 
 			nvmem = <&m24c08>;
+			flash-leds = <&lm3559_led0>, <&lm3559_led1>;
 			lens-focus = <&dw9714>;
 
 			assigned-clocks = <&tegra_car TEGRA30_CLK_VI_SENSOR>,
@@ -1311,6 +1312,35 @@ m24c08: eeprom@50 {
 			vcc-supply = <&vio_1v8_rear>;
 		};
 
+		led-controller@53 {
+			compatible = "ti,lm3559";
+			reg = <0x53>;
+
+			enable-gpios = <&gpio TEGRA_GPIO(BB, 3) GPIO_ACTIVE_HIGH>;
+			vin-supply = <&vdd_3v3_vbat>;
+
+			flash-max-timeout-us = <1024000>;
+			ti,peak-current-microamp = <1400000>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* single flash led is on 2 lines */
+			lm3559_led0: led@0 {
+				reg = <0>;
+
+				flash-max-microamp = <393750>;
+				led-max-microamp = <140625>;
+			};
+
+			lm3559_led1: led@1 {
+				reg = <1>;
+
+				flash-max-microamp = <393750>;
+				led-max-microamp = <140625>;
+			};
+		};
+
 		camera-pmic@7d {
 			compatible = "ti,lp8720";
 			reg = <0x7d>;
-- 
2.53.0

