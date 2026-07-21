Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DA93630BE
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640302; cv=none; b=l86Z8qhoNsfKhBz+c+YZVnjJHMkZhQZtSKruz+jRU/hsvDatnPkahYPDY0oXpL6M7A8CnDd3ml0hfLwJEDICbZuTZD5JsfwBxq9xr0IcJSqYEGZg67NLEmxxt4L5WQNjxUmbmSFeYUwKdLtEQn1RFhIMSwbv+cp5ydVLqWfa3Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640302; c=relaxed/simple;
	bh=7GJyN3K7r4dYN3hEDNvHVIVlkAcyxBwh+VwdBLj6og0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SOj8v8k8+mKJtw0CFHGf9jLQlacQwADYCTuecK8Q8SXjhkICTA48UazEtY8VDOJKqGgIffEXto+tLY5VCDs6EvKFBcMm/9dwaJ3nIKes3ohKNvqSqV15xBmL4otXA4B5xvC0w4mFsPnaeouQJeAlCTglrjjDXbjx8gId8K7PRLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=injoqIoA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="injoqIoA"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47de008b020so3719880f8f.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784640297; x=1785245097; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yif91B+KlLGgItRG2ZGYWcgS3NGMXtTFKaWfIW3KxWk=;
        b=injoqIoAJ3GlV7+OHg1RxQkG7aD9HmRoW4YVz4MnAIRAx/opSPy7TUqowvgsxrdR2U
         Oppgq/zCjoA9DsFMj2GNwRESU2UMT9UAPHilZBZv3g8X4vS1IyXwi3shYslpPBb0KqVJ
         PcmHvyRW9Yb6x60/hlwuhTJESzaG9eXUe1DEhwmV/P4raaFUoFJr0HbRyltdfVb8SfE7
         urq3x4Pb+6P7WnS9cW6r5uc4o0PG/2RKJ9paXnFGXjtOsjOAniAoB0G7qZEFGPhoq0WI
         2+2LnuVg56+PU0vfpl9Wr0aVQVSvOwQiqaJQHOLimdJPq29uO4zneilwo15YWobvCSLJ
         Ej6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640297; x=1785245097;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yif91B+KlLGgItRG2ZGYWcgS3NGMXtTFKaWfIW3KxWk=;
        b=j2msnhvyriwcZIDZNk940kWy6ccuS8W0exum4Au1BOUmTG72yRh6c+LRn/O8RDMaCy
         91JF9W+dEe0GJsKig2lf1Dmo28J6pCJmLNQs6V5CRCYhBTijCeK5qU2WpW4u4TekiCp8
         YaYw8u5ZqcsDF1y3ysc/2w1Xh6Tal3ZHNr9/n5mQ+sF7Zt8m3eBUnpbFtCzyG6ouAufT
         5VPM/5Ze4lnIouGnpq7uojqT4gWZ7bsaG+DiM3F4pC9WTmEYT4aCXwaZOTniiPQxIkC0
         yLW/bytg4KdoDc6umM/wvD3xMfzgL8Wr5THVyAEwu+J2eg7sCpGNixiXsFJhuzda1WZ3
         9ffQ==
X-Gm-Message-State: AOJu0YypqK20IwiCPiGsHIyQ8o3d2Qy1oP9dhh0U4kvoF+/EEv7Omr9p
	ZDVz5crZYCUo6lcSbjIW2v6vIcfXJemvhn+V4uySo7ojTnKeVPO+Owy7f2blIdq0ohuG5D0utpy
	RZyrs3/SQYYdX
X-Gm-Gg: AR+sD11St3FeVJM1hpwFRKiFsFS8wp/RiVAu7bUyLz2zDgNApxilZwZnGO+9ALvAIoH
	kqr0bUiTpwPcxuEvOiTDlC/G/oWUMGZ8bTOU0IFum/CNLiL4m+7O8GkwnBF4YZJKUcPf8HG0a2n
	R41qK50WRspx+1kVg/ctpkAm03km2sk/2TZaS5pRFTLx5YZqwSuD5kvx3Y+CChOJLVmn1on5EPE
	FfG0wyiuFYtIuiNQA90+6OIyPb2AOnd0cju+5pJyQeSAMt2eaMu12BOSKJFaVAQamYHObzwBP0W
	6KeGa2ZYUev1zZO7UmXutgCcp1j9dMiwX+W/YqoeT0qBwcrE8+DJymYMDyHlNde/yQ+EEuESVW6
	pyoGinWOpnleUXpe08bDE+cZpIBG+JzbPP7VP/KyyUPbl6IujU9oM+W8vVcS2zABrFaiwEC9YGq
	dCZKk/Y6xWDtKcaUN6DVbYpY89RKZYf12CVKS9UCq8w9v23XUCAqVE1mtHXTA=
X-Received: by 2002:a05:6000:178d:b0:474:bbbb:bf17 with SMTP id ffacd0b85a97d-47f62378c4bmr20304933f8f.0.1784640297061;
        Tue, 21 Jul 2026 06:24:57 -0700 (PDT)
Received: from [127.0.0.1] (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed244bsm2918310f8f.20.2026.07.21.06.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:24:56 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Tue, 21 Jul 2026 15:24:46 +0200
Subject: [PATCH] arm64: dts: mediatek: mt8390-genio-700: Add boot phase
 tags
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-ccaione-upstream-mt8390-bootph-v1-1-5642198f979d@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN0QrCMAyF4VcZuTbQxeKcryK76GJ0EbaWphNh7
 N2tevnB4T8bmGQVg0uzQZaXmsaloj00wFNYHoJ6qwZydHIdtcgc6kRwTVayhBnncj72DscYS5p
 QQhfIe089MdRIynLX9+/gOvxt6/gULt8q7PsHCWa3c4IAAAA=
X-Change-ID: 20260721-ccaione-upstream-mt8390-bootph-ea7a2444292c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>, 
 Julien Stephan <jstephan@baylibre.com>, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2

U-Boot SPL runs after the platform DDR loader has initialized DRAM. It
needs the debug UART and eMMC controller, together with their clock,
syscon, pinctrl, interrupt and watchdog providers, to load the firmware
FIT.

Mark the nodes consumed by the current SPL configuration with
'bootph-pre-ram' so that the canonical devicetree carries the boot-phase
information and bootloaders do not need local overrides.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
index 0d5a75efb2ee..83f2d10fd28d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
@@ -16,11 +16,20 @@ / {
 		     "mediatek,mt8188";
 
 	memory@40000000 {
+		bootph-pre-ram;
 		device_type = "memory";
 		reg = <0 0x40000000 0x2 0x00000000>;
 	};
 };
 
+&apmixedsys {
+	bootph-pre-ram;
+};
+
+&clk26m {
+	bootph-pre-ram;
+};
+
 &cpu4 {
 	cpu-supply = <&mt6359_vcore_buck_reg>;
 };
@@ -28,3 +37,75 @@ &cpu4 {
 &cpu5 {
 	cpu-supply = <&mt6359_vcore_buck_reg>;
 };
+
+&gic {
+	bootph-pre-ram;
+};
+
+&infracfg_ao {
+	bootph-pre-ram;
+};
+
+&mmc0 {
+	bootph-pre-ram;
+};
+
+&mmc0_default_pins {
+	bootph-pre-ram;
+
+	pins-clk {
+		bootph-pre-ram;
+	};
+
+	pins-cmd-dat {
+		bootph-pre-ram;
+	};
+
+	pins-rst {
+		bootph-pre-ram;
+	};
+};
+
+&mmc0_uhs_pins {
+	bootph-pre-ram;
+
+	pins-clk {
+		bootph-pre-ram;
+	};
+
+	pins-cmd-dat {
+		bootph-pre-ram;
+	};
+
+	pins-ds {
+		bootph-pre-ram;
+	};
+
+	pins-rst {
+		bootph-pre-ram;
+	};
+};
+
+&pio {
+	bootph-pre-ram;
+};
+
+&topckgen {
+	bootph-pre-ram;
+};
+
+&uart0 {
+	bootph-pre-ram;
+};
+
+&uart0_pins {
+	bootph-pre-ram;
+
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&watchdog {
+	bootph-pre-ram;
+};

---
base-commit: b95f03f04d475aa6719d15a636ddf32222d55657
change-id: 20260721-ccaione-upstream-mt8390-bootph-ea7a2444292c

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

