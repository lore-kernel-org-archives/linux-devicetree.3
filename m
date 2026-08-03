Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58757397347
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 05:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734152; cv=none; b=OPt7/wdeKo5lPdFfNWnSQ+WLicpP1wLQZbwoIMmtbxYqcPr4E7XXaet4CgmI2A/Ai0RsQtZC0VtDpQLFZI8thI4VuL6mhpakWVyqzh+lE0AsztUKgYn0ejmylPaboMD2fJDTssnJ1RqeQpkODnCl8iW2XnSMhCA5JDF9Kp+OJcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734152; c=relaxed/simple;
	bh=CsTsehT4z8CJxsGhaiEo1pllL05TyPVSaHwPj6kU07s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G/cPpN4M9hNGlJbdFYK+J0BOKRhCVCbPQKApnlegXNTY7C45henjz+AXlQMBAbpJQGmDRnT+PIB1ip2Cr4xwNDXGhOwdUbfWn8tAPy2mNlYkTpzRoA0hZPbkXT9TbnjXXTEJPjB6GG7aOnUvRrotNv6Jy3PDy6ZUy8qVEFmVpiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYLyWDy0; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYLyWDy0"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e9eaf04bfaso1038935a34.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 22:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734149; x=1786338949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9OpRGWNf+wnvCcP1DS85gL+udlM+7o9ZcunosuNBCWA=;
        b=kYLyWDy0P4VE11xbG48gBf1b+3N4mTWJNz4xhKm5Y+avebwamRQX+zKYH8/4jdcnkI
         c2JrRQoQxWkwm21PjVNNU6kZjZSzfhcLe5GtSYc7cm4Sksc4qawIJA3dZTmcSwEVJ0Ll
         wIMRCtn1Egpuokh6TLmKzIwi39AFiN2ByEA3pBPj3eyosN+PO+YUikmY9Mk6+WTULa4t
         Z9Uz3E1CLFTg9JsjigSQnytNgnxU+Onb38Xti4k3yxmwQNO+ubk6XBghKPCIKbT4bCcj
         uHvCNqf14u26K12IMCel3S+LsqQXE/wGboBaON8gUdeOXnW1aGW8pwb5bjEJBy3dIb2b
         0w2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734149; x=1786338949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9OpRGWNf+wnvCcP1DS85gL+udlM+7o9ZcunosuNBCWA=;
        b=YPCh0g0j8eJ5u+xmZNnfKkXBIiq62ePX1R2v248Z74KafrmzZvbTsa4jxDfVSwy4ah
         a6+hSy2UeawYDSXsZ3zBgklqSKxFK6D4XP11QqgbaLuLVcwypEmXPU1reV5cXsKlGpPQ
         rDrVHS0XuGZK2xOIPnxEursYH7L/YgMEyZWwucfIGoFDtWCXqdxzF38TzwDfboCfY0IH
         6XbA5leV1PmPsiYQqzGULUaNLgMEHecgW6pzF5Sn/RpAiJ+QJOdAOoDy+d8iB1YN/zqU
         +Yf7mpuDtoBOge9fv5DMUT/nEDoFQBqi/XZ6f5e+dHyZZPiGQYDqA797VUvi7dBomfQ5
         Ch/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpK+Rbf9fAbtnFRHk1xFc0OqVMd46iu8P/N30NtQ1o57OP0+5BJECzo0Dhy9gKqQCnzQ30Qh6lLaQHs@vger.kernel.org
X-Gm-Message-State: AOJu0YxheqyM9PNxCO4qNnGsOzfpL1p12IYE6vQkg9fgC2hGPBckwpIo
	DXDGC5zTXnNzpoEIgXqTlwrXE8AJIFwkUsL2vPWlso4rTDUrj2PAalGg
X-Gm-Gg: AR+sD13f85ZoXWAsDeb5LSCqi1aJaMQMxcGoPN/YHyPfJYA/rQb0Y5qaE2Owcns3uBX
	pdLGerXt5bnvyn7qgGTAF3FPab54snLCaoEjMmbKKBopycjruhj1oEJdOEY/LECz16H+SDg4KUT
	jLNRA5U7efOBIt58wWsQI0D2suyp1YDL2mrcZkm5qFv+3YSAXjt2hZnnfJbBSSg2VXw42iZ4h2I
	LRKGUvg75D5JR6zGsIQf6vNXr7l11pun3ejpk2I4SjFcqXJB5AmSM5XQR7PTHvczqDLe8KooOwo
	g+9V4BdRaHq6PqnKdU8BifkFsIh6wat9rT3O3jgBWZnV5hZBhT7+UuDw/YB7guV3dvYzgfz4l8S
	qCOxyLPCISKkvCJM6blDivx9x+dSjbPN1xdY8L4Zoj+Yuqb/USnHzmBlQIPZLlv2g5H6AdJUZGe
	Oc9lP0iGnyxe0pdWNfBtTHVEuR01QxeYqwbmxOWS+GFaLdXrvnEYQym/Nncfhb+Jx3pQcn49A+/
	P6JQ1KxTA4b9q8bAGgKrUr+AE8Pj9DhK1XrZAYAikFfXYEA2LHmdwTm6gUATERRhdnp+vUpvr06
	rm3jeO3cTB8uaBgEvU8dNsf0xfL2F76k6ygkROW4J8Kf4HTB597d0TRFUcSJRJjkJsAFv8aauj1
	8YVUuz1QtRasK0/S8
X-Received: by 2002:a05:6830:3592:b0:7e9:e488:3bce with SMTP id 46e09a7af769-7f196bab78dmr14968611a34.6.1785734148846;
        Sun, 02 Aug 2026 22:15:48 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:27 -0600
Subject: [PATCH 17/21] arm64: dts: allwinner: h616: add ACx00 EPHY
 resources
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-17-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Expose logical SID cells for the AC200/AC300 EPHY calibration, the combined
companion-variant and AC300-calibration-range configuration, and the AC200
bandgap fields.

Also describe the PA10/PA11 I2C3 pin group used by the AC200 control
interface.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 6879f27c2b2b..2cedda6e87a9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -252,6 +252,20 @@ ths_calibration: thermal-sensor-calibration@14 {
 			cpu_speed_grade: cpu-speed-grade@0 {
 				reg = <0x0 2>;
 			};
+
+			ephy_calibration: ethernet-phy-calibration@2c,0 {
+				reg = <0x2c 1>;
+				bits = <0 4>;
+			};
+
+			ephy_config: ethernet-phy-configuration@2c {
+				reg = <0x2c 2>;
+				bits = <8 2>;
+			};
+
+			ac200_bandgap: bandgap@30 {
+				reg = <0x30 2>;
+			};
 		};
 
 		timer0: timer@3009000 {
@@ -324,6 +338,13 @@ i2c0_pins: i2c0-pins {
 				function = "i2c0";
 			};
 
+			/omit-if-no-ref/
+			i2c3_pa_pins: i2c3-pa-pins {
+				pins = "PA10", "PA11";
+				function = "i2c3";
+				bias-pull-up;
+			};
+
 			i2c3_ph_pins: i2c3-ph-pins {
 				pins = "PH4", "PH5";
 				function = "i2c3";

-- 
2.53.0

