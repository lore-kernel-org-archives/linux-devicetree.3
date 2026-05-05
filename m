Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5143421895
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976071; cv=none; b=Us/jZXudIdwunuBeB5ckRbdKRIGolzd6Hg/rOGvOoCa2PbVrKYCoBkJAbUvnYvIk2JqD0hO/mDUVU0wEtaM3kk9QkIT1ABul0Unht8FKRrG5eOt3nS844oYleYWPx8Qh8rzaFvB9fkzWwLbWNUHf95D0zbab9tGfgLgaJPPRh9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976071; c=relaxed/simple;
	bh=5qcF23DQSELWCmH8NUF9LjSOVoniyAb5i0M3th0VSTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qq7UpNh3tYzP9wfp6CL6S0jHMPwGvAz149DPgwDigdBj+/t7YHRqtFGFTF/gUFMK9ZiD+0xlfT0/knSUN4Ek1lpy6ULvSqcaPOaveLFW8MwIrtDHrMfw3vgqS5w1nIbbBGkekyiDzJqGtLYcVE91qi4L7Ueaa9ATkTDLi2iQEJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lVC2HdA0; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lVC2HdA0"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-839dc688d6cso40346b3a.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976069; x=1778580869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7vxAk1TH3X8VxMHCXDqcaxDDLSkTFFCGTuW7z7dSFM=;
        b=lVC2HdA0UuW8srfoCk5UsteT50AKLAlD6kGO6lqqPz5xPIBwoxa5juzGUdSOo5L6dd
         BqgwRYQePtI+8qu4KpIM8mdjyK5O7cuQVjPZs95Q2F02Vd4uT+KMpfAs2f7M75Il3ArW
         Ro4rZDm2jRUHzjpSLD8rNsR0yVcGzcwU+v17M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976069; x=1778580869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V7vxAk1TH3X8VxMHCXDqcaxDDLSkTFFCGTuW7z7dSFM=;
        b=jeOTCqpJAU0hVGHiMZ3PcvUcuWT4g6uoTviEKhZt117/CTVQ1ONlNStdTL9qqDlmPh
         ur9qm0Sihcd7SUa0mDc6onljZYNrZDWg8Q2LH8EegX+EZD88KLYMLF/0iF7TVn0Tygk3
         3kPCKcYIms4PXcFBYt3uoDbYJaKiabbTdCFhJrSCrsIuB/pouucF49+fs2jaqE+Ss6OR
         NXubAov3kR/Ad6iBUrwmGdhWdMx/accbFKknWidkL2PtyXucQ/NJ9a+n7Z7X25abNHwJ
         O45p7PkorfeDSckcVs95VX4te/l+N+Gxrjxt+ocdooSMC7iA4QXCq3LF517UXc8T3c+8
         OAhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Uc55G8paEKZE982TFnuFWRrIw6L5N3IwhAWkq8A/pInY+R+u5tO/w1GSxAq0QpFdaB1jVe3FLU0hN@vger.kernel.org
X-Gm-Message-State: AOJu0YyL/zOp11Rv/Zpnvtjq1jk6/1euHwexbFggCL5JPDv7vfOXcD/Y
	kIyfxErQlCbh3qJxVX9DncQrM70kSmwh5WiFDVSXV5Vp9QuiW+DCu64PuxSVmouBWA==
X-Gm-Gg: AeBDietENhz+gDLB/f1JyKUtHdNPZzyZxhkcRCRMzUGjTMPDf7k3HJCOy5OrC4m1o2V
	2VLoQgEXLZOF/01ZNT+jDyMm0J7TIDf+Hf9IvqXnQH/AYGSoW2FUWsNjhbJs9VnQshaKdTM+/Ak
	5VK/C5yzqBlLVjsdRF9KCBcGewQYCM7OyCFZjd5acaxyqcaRX6cGXWRuKmFkbfH8hGgz1RKTT/G
	rOHOJkBlTEA/dACJOQTrtCGKme5+AEFoM/IRb11TB27fMhAtw0gtePo6uZFWktC70XbtzQ5E8HL
	I82X3KdjMB+liZhee27qo1Wj1cirK7Qikzxn3XCtLK2XIyKn9+UgbEo0K+UmxgaAICFp6VlmEUX
	W92nG0RHFaBwttCv/J6xKte5tDGwTDeNHnnh3MNEB3OTRmJtYqfK7I/VB1QboW+dP6Q+9QAry9R
	X5nBTxGVYdmiV6u64lTkH1qnU9wsSuElbDZi7A45vTchdZ3LaolFXWX2oMRmw081/q7GaOZv4l6
	I6M/ps0O4ALPYiFIKA=
X-Received: by 2002:a05:6a00:1783:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-8352d2024f6mr12963934b3a.30.1777976069323;
        Tue, 05 May 2026 03:14:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/16] arm64: dts: mediatek: mt8192-asurada: Add MT6315 PMIC supplies
Date: Tue,  5 May 2026 18:13:54 +0800
Message-ID: <20260505101408.1796563-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two MT6315 PMICs in the MT8192 Asurada design. One has two
outputs ganged together and two outputs unused. The other has three
outputs ganged together, and one left independent.

Add supplies for all the used regulators. In the case of ganged outputs,
add the supply for just the first output.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Fixed pp_4200_g regulator name
- Moved supplies to PMIC top level node
- Added all supplies

All supplies are connected, but since the regulators are ganged
together, only one regulator node is present.
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 8054e2d20bf1..13960d1c8a02 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -175,6 +175,17 @@ pp3300_wlan: regulator-3v3-wlan {
 		gpio = <&pio 143 GPIO_ACTIVE_HIGH>;
 	};
 
+	/* system wide switching 4.2V power rail */
+	pp4200_g: regulator-4v2-g {
+		compatible = "regulator-fixed";
+		regulator-name = "pp4200_g";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+		vin-supply = <&ppvar_sys>;
+	};
+
 	/* system wide switching 5.0V power rail */
 	pp5000_a: regulator-5v0-a {
 		compatible = "regulator-fixed";
@@ -1604,6 +1615,10 @@ &spmi {
 	mt6315_6: pmic@6 {
 		compatible = "mediatek,mt6315-regulator";
 		reg = <0x6 SPMI_USID>;
+		pvdd1-supply = <&pp4200_g>;
+		pvdd2-supply = <&pp4200_g>;
+		pvdd3-supply = <&pp4200_g>;
+		pvdd4-supply = <&pp4200_g>;
 
 		regulators {
 			mt6315_6_vbuck1: vbuck1 {
@@ -1629,6 +1644,10 @@ mt6315_6_vbuck3: vbuck3 {
 	mt6315_7: pmic@7 {
 		compatible = "mediatek,mt6315-regulator";
 		reg = <0x7 SPMI_USID>;
+		pvdd1-supply = <&pp4200_g>;
+		pvdd2-supply = <&pp4200_g>;
+		pvdd3-supply = <&pp4200_g>;
+		pvdd4-supply = <&pp4200_g>;
 
 		regulators {
 			mt6315_7_vbuck1: vbuck1 {
-- 
2.54.0.545.g6539524ca2-goog

