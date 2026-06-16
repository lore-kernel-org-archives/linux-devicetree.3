Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B574218A9;
	Tue, 16 Jun 2026 09:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781600945; cv=none; b=LR/3IsmfsYC2j8C9NWP64K2UB4CDpuR+/hMvLzsBSBzzVlogJJkW6njcGw8At2SjLsY34IjAloRN/3rPZ5oKynOL94px1U6Ih41Xvrk8uXgfG+3uDCc9YLWnBAbqXq8vy8nsVpf1/cCzLL53keAZ3yGBkOLrOSVL7CyquwvJKos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781600945; c=relaxed/simple;
	bh=B+ciZHq3dTOAw9URmdcqBgqh9CthfuRwUt3AsV/x1YQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fvVWA/6MXJ8cmmPr20wKWDSf7WVTTM5yBlBsFwVHlWspjh93kJK67jibblfuI96Fejt6/AKdzyxzgwgD59SDJ50kpASgrVczCVrza+Ik3pgLv+dCoezfHMcc0fDJF3lZuAFhj3zQhup7QhbZsiRwMzqfNgcQIl2SxnRqseXrJMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osxTMTSE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osxTMTSE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F761F000E9;
	Tue, 16 Jun 2026 09:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781600943;
	bh=0GoIO2/qev31fAFAXPF0kq9Rt+4Amb5M+1wCBl95B6s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=osxTMTSEksqjDmN5y20B0+Nf8w1Gh11Hy0LuwhNcrr2GxD6yMRulczCyFnH4tLeBX
	 QyuPiEy6raXYRppeNhG4oH0c4kN3mSFcboR5gwey+1TEaFn0GiOx/udN/E5zTAFBte
	 IkBFoyUlHJRRRZeypdDz0oWsmvIGioXgFn+p3Ume1pUVp6H7FFin6n01l7aaXxec/q
	 2ax+gnO86AjdvPgoIaX3neKuslesf1byGAYi10cj3+M61nZ/eh4XTmUQbgKI4QW4nw
	 thfXmYsB9d1/baAy+I3JIZ+dpPfFXnwbcOyKSHLv4eoRKUsrWQCqEqUVjefQBz+/9f
	 UVn0LS2lCWK5Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 16 Jun 2026 11:08:50 +0200
Subject: [PATCH v2 2/4] arm64: dts: qcom: sc8180x-primus: Describe the
 display power net
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-topic-8180_disp_power-v2-2-167785993231@oss.qualcomm.com>
References: <20260616-topic-8180_disp_power-v2-0-167785993231@oss.qualcomm.com>
In-Reply-To: <20260616-topic-8180_disp_power-v2-0-167785993231@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781600932; l=2503;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=IC/tMlQ45HvlLBwCXB9uIrnjtMwPXv48TQT4oxwEkJU=;
 b=QesjG661TArrFLhHPtVk4BX4HoHDMyBzGkxj8XnWUmB+93WzC389EYXeruI46DU+7KBVRb8ch
 rY1K2VD6rRXA0QHYtf1XzWS/JdmfiDyf03jOfR0l/YS7oGsdaVZnEg6
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Describe and wire up the power supplies for the eDP panel and its
backlight. Previously, this was only working because of settings
inherited from the bootloader.

Fixes: 2ce38cc1e8fe ("arm64: dts: qcom: sc8180x: Introduce Primus")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts | 48 ++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index ffe7c45366ed..e34f4758ebe2 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -29,9 +29,10 @@ backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pmc8180c_lpg 4 1000000>;
 		enable-gpios = <&pmc8180c_gpios 8 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vled_bl_pw>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&bl_pwm_default>;
+		pinctrl-names = "default";
 	};
 
 	chosen {
@@ -167,6 +168,38 @@ reserved-region@9a500000 {
 		};
 	};
 
+	vled_bl_pw: regulator-vled-bl-pw {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VLED_BL_PW";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmc8180_2_gpios 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&bl_pwr_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_lcm_3v3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_LCM_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 130 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&lcm_3v3_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	vreg_nvme_0p9: regulator-nvme-0p9 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_nvme_0p9";
@@ -540,6 +573,7 @@ &mdss_edp {
 	aux-bus {
 		panel {
 			compatible = "edp-panel";
+			power-supply = <&vreg_lcm_3v3>;
 
 			backlight = <&backlight>;
 
@@ -769,6 +803,12 @@ &wifi {
 };
 
 /* PINCTRL */
+&pmc8180_2_gpios {
+	bl_pwr_en: bl-pwr-en-state {
+		pins = "gpio1";
+		function = "normal";
+	};
+};
 
 &pmc8180c_gpios {
 	bl_pwm_default: bl-pwm-default-state {
@@ -950,4 +990,10 @@ rx-pins {
 			bias-pull-up;
 		};
 	};
+
+	lcm_3v3_en: lcm-3v3-en-state {
+		pins = "gpio130";
+		function = "gpio";
+		bias-disable;
+	};
 };

-- 
2.54.0

