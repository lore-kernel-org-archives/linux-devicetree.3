Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618569;
	b=EMwUrzvmxmIOArio6N3KmL5B28c9Bxb8Eask7Q4Ma+mTaHV6OgUVVGz1QDNU0lrKasst
	 COj3xYKyF7znS0U3Y3c7vUJIBNDAV8xpkGOiIcF85BDnOBHOvgSbn7tFW8HR6vixtc6vJ
	 L7I5HW0eUQxkiqgVgdx+dfljpUj3l0vYw7RONR9tqXZMds+V9t5ZFC3QhqCEOU9sf3e6T
	 hDtF9o3KPekb7weTXL/JPRZskDjAYJ6grCKUvkXKgDBXyeGkBWL6oJGNJATu428Y77XmE
	 Uaaj/FGkDkZ+8b149Q5tQ7klUPKPO2No01PvdzAAE5F8tyToHXWlz5dmDPUbyJEz2pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L2nTfBlCrLMu8yQMZld6sCbquIzEwn5biDFg2eMNzH8=;
	b=AUdrqooiKyMeaEXSGLO0wHyaNBQUMASbeLb0iLEmddhpin2YWrqwe81MwN/waJnvRp9v
	 dQPPrPXD6O6QF0pBh0dDxT+oOVcgwhpkPq0RFE3exJUIzgefGWzREA5WY7RAK2V4qWg+F
	 9t4/AYtqQpW/oVVC9gbZipBBkmtRFauTglEYnRH0eAOpP+h2f471fC8u6NgDlaIGewR0a
	 Xj5CFZJDuTUd9QMmpVTZbR7zdd918TmkI9qY6SnyLm+bzXoDED8fOfyoIaJ4om7deK66i
	 vMEDplKUCs50268+j7/dQ7cDLHtfNLg7XWc8kZX/8pyHil1RLJpcZZRBn/LJ/NqhVHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjFADt3+;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA4A606A336
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CA4A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjFADt3+
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so4547178f8f.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618568; x=1796223368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2nTfBlCrLMu8yQMZld6sCbquIzEwn5biDFg2eMNzH8=;
        b=xjFADt3+MZA2KAQVc+YScEASOKrlOLrSBp0zUy8vuyKuf7rHS0OBVN5x1ja7r2KE8L
         oK7q7BukxXff4eRiBiRFdINHTsc/EPIAaNEsiQ5JPfFO+6gc4SQ2MV+7Fk+u9v3tXWRD
         LVZ5SGzD32dLFKwVhvCqlz2L/2jNGdfuFiq6fNMvBjFSe3t+RCAA97mROvuuJbrR1X0H
         CKMUsRIJELkPRFpF6CmuOrIHN0Fu5bGrvGmnMal4RASOSec/QNer8NerHn++JT914EGE
         4EU/jA41+UBxoqvBgw6nu6Q34FwnWiXjnF8htNjxKjUuyVEu64LPUpDDBFKZ7yMV/xfj
         KDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618568; x=1796223368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2nTfBlCrLMu8yQMZld6sCbquIzEwn5biDFg2eMNzH8=;
        b=dFYLinDYtbKWmej6712FyEouEivVlFjSXeX6rm4327g0h/TCPaKar+VDLUsZPWAibU
         i6vImhB8yMw0XtUJK/Bpa0o1OVmoNlNzNx/QwAVUHpQTb4mc2x/LlRXCrto5fPIXViKO
         mE08Gh/6SKrcQkzQWKmbR9xtcI9f1krkTnY5zZ0ybMLgzXPmySNDhciLqi7yaTt8w4sG
         LxQn7tgRI9mlrL1Pm/nJv0R2cZ8+UG1xe1R/iKVBxqO05Wd4FTbjMK5a/0l2VmBF+bmD
         maPYhg3XZjjcj1nP37dZaReII6+gWriHDtQTwbyTihkCqcvzQIOxu3NyWPyvgP//iKHM
         BDZA==
X-Forwarded-Encrypted: i=1; AL+hErGbIkNxwQ9/JvnbLogCtC15k+aEsEKu86uN7Glp2a1rzG/9FKiaZ1d2Z4zgDIEQOyZ3A3j75baYLrii@vger.kernel.org
X-Gm-Message-State: APuU4Z93oopo9Q6G/uBKFQlSlLUyTRQnLWyyV1Of9wi1Dy9So6F2MDWQ
	SUVJPNJUcfEmfwTsHFTcb72XfO752JxTi/9dXuCOw8Rqo4BvXzTPTZ3v
X-Gm-Gg: AZFdTZfOgGzX6oeeYGcj9b69XtsBjtF1vL6JiZST/Tk+tMpYDjSL7NQq2TcMm3yH2CJ
	bbuOMtz8NZV7uxVoSyzFW1IprKNeojxJvHi5LPXTNgttyu0ENna5L5Nwi0oLbDUjJgbG/IJ41cZ
	huz9XwxSLjZlCGljZhGDZc6STiwqxrqEJkLtolbvHCEsJoiV12qzLsad5qCd6skni2t3YvJi4i0
	+eCaFXB24Bzi8cx9SmIIpkqjJ1VIjhqR1oRQV9K98nlf1QSYs82AnIKLEl/GQ+oHR+yifGdPm0v
	scs+kwntNqX4eUtX11Ewfxx1eb+aranVRNRbRPzYNcvbY/K5RtizhOeZ484mTidmiRSAibXGAdA
	udk8LuhcmAj5Wz+2508IoNH9dZwGBRxm4aURQPPR+d8nNxGsRJs1tWRRnq3DP4ItIB2wrxfOrPv
	uSHGkRcz1QrWUDagSaDZj2fyBn3UT8oNyB9lmK26/OJdIBuYmzJV3pv9Es4n5CRBeg3l7/9Gd3Z
	Kszl0kPBu9Ft60K88U4PiBxvnusv8WoSiUEF2D1HJtsAJc1CRFEZXDwOfJf2LEtPiLFOcN2Pkni
	w0wn3Jg8neGHc4am9MEJEQ6S0PRTEFIvpM5lapRQrpDV4Ui22w3+ODyehCCVGoPcghMC5JPmmae
	qTJBC5X7yc5rGEy39b6rQfQgkDtioa3FMrw==
X-Received: by 2002:a05:6000:47d4:b0:493:8c32:94 with SMTP id ffacd0b85a97d-4abb400ae31mr23328733f8f.38.1795618567632;
        Wed, 25 Nov 2026 06:56:07 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:07 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/5] arm64: dts: exynos: Enable USB in Exynos7885
Date: Wed, 25 Nov 2026 15:54:55 +0100
Message-ID: <20261125145458.2594179-5-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125145458.2594179-1-virag.david003@gmail.com>
References: <20261125145458.2594179-1-virag.david003@gmail.com>
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

Add USB controller and USB PHY controller nodes to Exynos7885 SoC DTSI

The SoC theoretically supports USB3 SuperSpeed, but is not implemented
in any known device. The vendor kernel also stubs out USB3 functions, so
we disable it in device DTS.

It is though, perfectly capable of USB 2.0 high-speed mode, both as host
and device.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Keep dt nodes ordered by unit address.

Changes in v3:
 - Move maximum-speed property to device dts.

 arch/arm64/boot/dts/exynos/exynos7885.dtsi | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
index 6b994b487107..33899f5fc5e5 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
@@ -480,6 +480,37 @@ i2c_7: i2c@11cd0000 {
 
 			status = "disabled";
 		};
+
+		usbdrd_phy: phy@135d0000 {
+			compatible = "samsung,exynos7885-usbdrd-phy";
+			reg = <0x135d0000 0x100>;
+			clocks = <&cmu_fsys CLK_FSYS_USB30DRD_ACLK_20PHYCTRL>,
+				 <&cmu_fsys CLK_FSYS_USB20PHY_CLKCORE>;
+			clock-names = "phy", "ref";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
+		usbdrd: usb@13600000 {
+			compatible = "samsung,exynos7885-dwusb3",
+				     "samsung,exynos850-dwusb3";
+			ranges = <0x0 0x13600000 0x10000>;
+			clocks = <&cmu_fsys CLK_FSYS_USB30DRD_BUS_CLK_EARLY>,
+				 <&cmu_fsys CLK_FSYS_USB30DRD_REF_CLK>;
+			clock-names = "bus_early", "ref";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usbdrd_dwc3: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd_phy 0>;
+				phy-names = "usb2-phy";
+			};
+		};
 	};
 };
 
-- 
2.56.1

