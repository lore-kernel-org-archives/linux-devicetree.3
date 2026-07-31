Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6129941D633
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498096; cv=none; b=PEXXPRAQHcHacIZ5a6uJq6WGs4VnPzsGNw4hBcGxu14ukM3YjMotJzmpSpcHJTvfXtPE5q5V/RQyGlX/BFSTseYIsLVa1ZoZC2N3ebPmUFRuX4TNyJP41cHoAwAha112SMCy9zxBfoI/IWhSuJ9OOak6D3jIM3zHtqfIfDkk+HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498096; c=relaxed/simple;
	bh=v3zg0za4Vg0mWFDB9IHeWfTLa1U/zH4bofPA0d92P+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YaPXbNN1D5fUrkRjB2T9J0hMFb/Zf7K9HExfrV7o67P0SAPiHFJMw2URovyxMOPKILw0ZT5aXIERUEpRXBDM0qu+pwsEoBO3V9yVBdr+LVE4oLd+UtJhH1Z9DxAgNO5A0i3bVMpAXKaIIKTeSKcHto1vCLIYNeDG7RQjC7AoO4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDsvuXyw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDsvuXyw"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f7027ca11so581166f8f.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785498093; x=1786102893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvzDJHOLtSfCRl0jEoyj2b0rdnKZO82J7iNdNOhAseQ=;
        b=hDsvuXywQm38Xjen0s+q0wYADyNNNH9W51sxJLMhLhP9ZzkpmyXszwNM314dHfF7k8
         O2TjNy7msuMQ3+a7B3YdwkDKA/bu5gk4j+KllcmrDkX8BanbyUf6Ejqc65rEWYYs1c+m
         74oB8EC4nyshhDtdapX4c/v87AuOCuLgi6mLoTSE7xBU0UHpBNzWTNvzY7Wr+qnKIUiE
         tsxOBzqDPJADQdgNPOdX+OEr2r7W3wmgdIHKvOS9OCCttTQejjY5nIsgxSHblXw1/uYT
         x+Ga3Aok6Y0rqoXm7fECTumAl8o+FX6jEal55t+1OOiI0ClNqsuPo6jDpzBAnNf3b5Dx
         EjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498093; x=1786102893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvzDJHOLtSfCRl0jEoyj2b0rdnKZO82J7iNdNOhAseQ=;
        b=FFbOac2bME91vIl08O41xSm+vN181sqvgM4V5ob30Y8csclxW05uYsXuho8MyJgLm+
         UGW59aJPuOLTYFvrjmQAilAa5nJ5Cigpl+ypg1zjYqjS75KafWimDUfe6ODPc8ESKDpW
         pmUH07Qk3xy20fDSSPWqcPAqlYiFqn+BBEUSJjOSBwJ1IT0D5RNUQO2n/axcqgn8e/6R
         vjyz/0OwF6HmMhER5izyAgA3wRllNOZ3XednQJwTxASP47HZyEPQrHR0hBWPPBR1nYO9
         LCbIjKXWd9Fx7abUwmZgHAAk83mxDEIlD6ehBG5IY40cfXpuakxMIwzYnET1AgnvLa01
         wLgw==
X-Gm-Message-State: AOJu0YxLwYHdJ6Ij/1du6noM2jjNqpACeP7NRuJQ70VKKoka6jrNhXy7
	Phv3ZVsO3mEmgbDQj1UWawoUEXbVv1YMmyuMiyPuRQyaeBuvHdFSfkqQnzzF5A==
X-Gm-Gg: AR+sD13BfVMFRKNt4UJVzLGvztA6OJuWgr8BcriWAKksgbOTleCLBFW47lDQgEGm3AF
	r7/wxygMpKnhZ1oQkt8a9qRMrG3MgKsVhPbsUKfIWZqRVlmnaD6dR/qicRNMMKhS2CRl48rhZXs
	0wnGTIZmhczkeNs71UoUng5FcmCMlGAEQ7CkdSTd5AUjFNx/BxbE9rP9722z+heLMSp1ZRi8CUe
	jicDbudUUvkg/MXxqctNgmj9qewWycnd1k5630mWBVrDagV4oHiQZPmls3iwA50cRVTt7bTR930
	dFSjhV/cSnKDEGFzRb5zcWcvsSn1IDBtwBNbe89k2Hb6069ujbxH4qrS2Vyg64TlY1rIY9UtTLk
	6uMBCuPgZs3kiGmqz+uKA0snqUq7HzFAbV2Ck04Cck57r8zSycSSf+/YJKvGH1vCSWkADPYwzIG
	viVtpTkaBYmrWypey9qM+1MGBGWVvvlfLJvBGBhA0jtakW2+cNwm33oqqrUHm/141wuGK0DpkR1
	yws1xfbSB2dXPzMXiBQ
X-Received: by 2002:a05:6000:2994:20b0:47f:703c:e000 with SMTP id ffacd0b85a97d-47fd2b73819mr3186747f8f.55.1785498092526;
        Fri, 31 Jul 2026 04:41:32 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm3769336f8f.5.2026.07.31.04.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:41:31 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/10] ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip configuration
Date: Fri, 31 Jul 2026 14:41:03 +0300
Message-ID: <20260731114106.169398-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731114106.169398-1-clamor95@gmail.com>
References: <20260731114106.169398-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BCM4334 chip's Bluetooth part does not support reset-gpio. This was
confirmed by testing on the TF701T, so drop reset-gpio from the Bluetooth
node to comply with the existing schema. Additionally, the BCM4334
supports an LPO clock, which is required for proper and stable operation
of WiFi and Bluetooth, so add it to both nodes. Lastly, the BCM4334 chip's
WiFi part has a dedicated compatible in the schema, so set
'brcm,bcm43340-fmac' as the primary compatible while 'brcm,bcm4329-fmac'
remains as a fallback.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 3de5c84d5f009..b71a02b3fd86f 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1300,8 +1300,9 @@ bluetooth {
 			compatible = "brcm,bcm4334-bt";
 			max-speed = <4000000>;
 
-			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
-			clock-names = "txco";
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>,
+				 <&palmas_clk32k>;
+			clock-names = "txco", "lpo";
 
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_EDGE_RISING>;
@@ -1309,7 +1310,6 @@ bluetooth {
 
 			device-wakeup-gpios = <&gpio TEGRA_GPIO(EE, 1) GPIO_ACTIVE_HIGH>;
 			shutdown-gpios = <&gpio TEGRA_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
-			reset-gpios = <&gpio TEGRA_GPIO(Q, 6) GPIO_ACTIVE_LOW>;
 
 			vbat-supply = <&vdd_3v3_com>;
 			vddio-supply = <&vdd_1v8_vio>;
@@ -1450,7 +1450,7 @@ palmas_gpio: gpio {
 				#gpio-cells = <2>;
 			};
 
-			palmas_clk32kg@0 {
+			palmas_clk32k: palmas_clk32kg@0 {
 				compatible = "ti,palmas-clk32kg";
 				#clock-cells = <0>;
 			};
@@ -2382,9 +2382,12 @@ mmc@78000000 {
 		vqmmc-supply = <&vdd_1v8_vio>;
 
 		wifi@1 {
-			compatible = "brcm,bcm4329-fmac";
+			compatible = "brcm,bcm43340-fmac", "brcm,bcm4329-fmac";
 			reg = <1>;
 
+			clocks = <&palmas_clk32k>;
+			clock-names = "lpo";
+
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(U, 5) IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "host-wake";
-- 
2.53.0

