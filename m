Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D433EAC87
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 15:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254011; cv=none; b=AxtteF5s2Hby1PzFxPQKfT5RoxRLq9rqjdFSnECGz91Zs59tiiv+5U0H10+PgfxD1XC8gDZo9laW8KiWQFtjXjz/qX3X6dFB0nfG2+sd16InhSo/OihP4q8Z1IV0Cfkm9nDVZwTQOeLKX+W+v8GGgsA8OZz2iv1OYJXBlO5vN28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254011; c=relaxed/simple;
	bh=nyMTRWzeAj/fdIbJOO7agc/LqBuV7MsuCjx+Azz5FJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGN4bM5W2Bguv8S0D0284h0Nd9J4KPThYvOhqWgujm7w64/QKM4lVjRIlLvr898AHZoilyxkMVjL0rqqBITECCQHMCahitzZ9zM8cvML29xLayGpNtOjpZ5YOgC6pKWIzGbYggvohoRDwJx7Lj7IKmMtVsE7xiVGppXTZFVPhBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcRvfX1A; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcRvfX1A"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12dca45ca21so3232816c88.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 08:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778254010; x=1778858810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pB2cQFjbuhjdNnTnLKqzrMd9wBQ0wQUJd1YqmbY53n8=;
        b=lcRvfX1A5X1S0tZJ4wvUuxYgmH1LM88BrmZXI3d5ldb8Ot7oYSi4GkV7xxR31bybER
         X8j9m8gGrafcQf7h97xZtcPE8Xal4hYHt4jWN1b73Q+aGUIPI/6HC21LxrFazKKfp3R1
         PEwnS4qzC6Rabi5ud90zJ+1goU4pFoKg1tEL2Ua42x9RWOjAbTg7/J7OaCOY/DKoOmBG
         oXgc3+/xMSfwGQ38NlWZfCudoNxlytnl3A48kvNau6BkDijJrOMNT7bSzmqDx3S7GR4X
         RCn2cVZKXSOK0mIrPURyxWnKEWRdlg67v7xph/Cpd5XiBmz+0G7bNrQ49RhTpextZfTS
         QD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778254010; x=1778858810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pB2cQFjbuhjdNnTnLKqzrMd9wBQ0wQUJd1YqmbY53n8=;
        b=a+DEyDdUV4Ogd1S9VmZvp+XJj3P58CEyaFUmph2ecnMayfYAfBjmQOC7MgnFLTcgqc
         6tqx/DFX1dXE7roUI7Ldff979YF+8biWn1McFa0kXRGYzF3yt5ghs4uR2XvvCIPXkfg5
         i3xsHbWzTd11SOQl4h77vsvo4gmwMnVrffB/ftiZMynrJNpyyXe5vqOHoQGLeoAqgR+B
         NrsakJQUhEC5DpMlFk8M5sBhhlhIM3CxBACm2AYgbFKqxUzw4ac3Ra1ElkO201iduthF
         c8MHFYSx5izzryqrJ32FLikE4NgnOu6NnGujTgfsK5pWwGLi85w6O+fMxTo/pw4VcsiN
         8jLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hC97Wp2JhpyC9LG+NYfljjguFyFVBAG15lWE/UTK+j+Rixeerl5we6S/BU7I6eeMhuOTFqDhylu67@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2siAlO3rpNRnIGHsOYoXuvvzKx/m79l9HjjDfsksXgtOdsKn5
	f8jT7wjulEThyO48/2HxTp1+mAED91k6dFIFkpADFKQ8JWMqaZbEBmGe
X-Gm-Gg: Acq92OHEKihz7YFDRAtwFNnSKWDHetzsl3f/XKK/xS40dSmG+nVcMlm4jJro87nwu8U
	zENZ/ckpkiUguLaatVFFiDEmzEEVTSOb4+ZH6vWD1iHLNV5I08FQ51TTu+HkUdm9eloNVf94b6t
	J5URys4K7sgsZoJmSgFwYTYipjuDFLXLhgSbeZG2qgbKBI/ODWroCIHOhJn5qfwWMaTfGVRowUe
	nijcOG9FqK31XVRx+pVKPvDCWP9FXMpSL/A8/sxM7kdPqBiWo6CFemxtxVxlKGSqyJftvmkapx5
	Z/m0mZh4SrK6ue8dGC/Ao9CBGx/OG8ctVEZ56QkISWGAFmugCH+98JM8k6FrFuOyuHVXCedAw/T
	SrWqUwvE6km7+rhJkrzMIZ2ycM3FxIbihHL0A+GolQnNDSVPApqW9zaZS3utK2Ulddx5ZG6HXJc
	BNheIEwD88JDb1wn+w5Vbaav0UwzH4K+n7n5Tt
X-Received: by 2002:a05:693c:2c02:b0:2d1:d434:d022 with SMTP id 5a478bee46e88-2f544ce9df2mr5983287eec.0.1778254009639;
        Fri, 08 May 2026 08:26:49 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm2535486eec.11.2026.05.08.08.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:26:49 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Romain Perier <romain.perier@gmail.com>,
	Paul Barker <paul.barker@sancloud.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Peter Rosin <peda@axentia.se>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/5] arm64: dts: qcom: msm8916-alcatel-idol347: Fix sn3190 shutdown GPIO polarity
Date: Fri,  8 May 2026 23:24:20 +0800
Message-ID: <20260508152435.21389-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508152435.21389-1-jerrysteve1101@gmail.com>
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sn3190 shutdown pin is active-low [1]. Correct the GPIO flags
from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.

[1] https://lumissil.com/assets/pdf/core/IS31FL3190_DS.pdf

Fixes: 1c8cc183d070 ("arm64: dts: qcom: msm8916-alcatel-idol347: add LED indicator")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
index 2de8b6f9531b..6d51d6efcbac 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
@@ -197,7 +197,7 @@ &blsp_i2c6 {
 	led-controller@68 {
 		compatible = "si-en,sn3190";
 		reg = <0x68>;
-		shutdown-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&led_enable_default &led_shutdown_default>;
 		#address-cells = <1>;
-- 
2.54.0

