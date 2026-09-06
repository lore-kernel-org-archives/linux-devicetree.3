Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC05422E34
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704481; cv=none; b=AUOvvOD5Z8silM8YT0YluyQWmLY+eFS4gnKW/18qrc9PavML1j6yJfUYx3DvDauGnjwUG9eQ4GLl0pDEI5BbDemdG6cNj7bwYzspm44RSu2q6JmYq9imPn2pY89kdnrkIoGbz3J+/ovysO9/ut6GD1MnwiQYy9ZxpOWAoAUuIJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704481; c=relaxed/simple;
	bh=T3eCxqMEeLwX423LxUJKnOfgBKSe3waR1F04b0ppdB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GJFpxMFR69HA5KOcg21q6RhIUk8K5tdHnYbYkeOiZKVEKC8xmBFCtGstrQd3RO9rs5PVl1qGhWGOt7Zy7551uv8LE/meoPx9NcTbkJxotNfl56jBXSbop3d3fbVKFrfTamBQZkSAhEHyb6R+j73dAJeYknD0pB2gZCE+u8k9hYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qeNi0mAP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qeNi0mAP"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482ea739de2so1682750f8f.0
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 07:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704469; x=1789309269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UV/xxFOLjb67oe6b124gprVUysFfmBCGWhquo3HhkBM=;
        b=qeNi0mAPulgLZvFvSDLTOJRyVHuPdJWv4BEUMe5t06uNhdPwtcijEo8HXp5Nm80q1K
         G+A5mD3Hd0Nw2tvAuGAwGDg74Oodwiy5H+XHauVLmsASZj6LvaW8HhFqaRaUmbheNNpS
         A3w/rRbZQ7iKiQgKqj6knguAyKEC0Iqb2Ptf2nVfQQQMcctbSsFgzkgLRqImJWFUe0mj
         zOhojdJm22NH1V6CiCsVCSqxbhTpetzNibpxGG7nw8mnSvZ2OpZEvhs3wCwlPcrikxOL
         sIMA8OHUl1Hv+2/kIq4+j/79JYF5TaDIf124MgFQ6SJzpP3dT11eK9ahthyorS/II3eS
         Y75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704469; x=1789309269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UV/xxFOLjb67oe6b124gprVUysFfmBCGWhquo3HhkBM=;
        b=SpHP+OHy+/+PqtKXptr3v0sJuE+G2uDQniz3J/pPw+7ynfzGa7/mUTNDCq4DZBGPD2
         hLAEzEVdOWTmRIj2o39bnI8bSps5+XktBcGmKgfXxVPCUZDaisR4GuHf+Nr41Z3n7tdY
         Fm/GIxS5FIuG/OR5ZktEHk8PXNZPDjvzOinOvL+IWMLwQ+mo9OBNK7xusjIiANuR6vu4
         UHld9viXSj6D4yKaYtY0YcZg4Rl4QmC0HQEzzvhrxr4w+8CiNj5jTQ8i45P78SpCPfh2
         GQNZrSITk/3w1UY98wzZBJCb9CNnsYSjds/dV5XUg/7ojoCwO+92vUJxxCRA/WdZn/j5
         IsCw==
X-Forwarded-Encrypted: i=1; AKwUvBx4b1N0VJO4NKGoiy/zDyAtI4NGITNdBfK4CZxHTj+XOQJ5NTkyA+FsZPY5myyT9IzeN85Tk9z2xKVb@vger.kernel.org
X-Gm-Message-State: AFuF++n0apqND27mPKzpWD5BzgHMLnLVm+eg24YOCZhIYR9NMbMgtrAX
	MDTlSgOwPLpdf4viakrEZkvtaw3jpVPSyHfqIzwHUUqFjBJ0X0YXb4JW9ezDll4DHOM=
X-Gm-Gg: AYBFou0frJ3mfF1k/EIu0hqUoxqpM+dAAj3t9IlVaun9Eyx/08ZSsppMlWjB6XN53jW
	gI4P0ME7yPchana/pD3f+y8CZF7IFV4Yz944znrId81qN+wnb+dPfF8lPvt11r9oEvZSbNhDyDY
	WdJ5/l+vvBq/x2+DQxaug/f6HIE4wzyy1vTFEpJVIOSuHZiSlKUbsx78mzhEf9XvZTSmcZ2R659
	10OzdCFsZeVlAjWHV1o4llTzQ0MS21VUJSvbma8S5oxKZsBcHO9aRETcli8yzDrnVMulcjrWWgd
	MfeC61L8MSOeAti0M1ldP5LhzXLwSDmnvlWzRqqcZKy3pu7QhDN1xJ/WKKFhEl/0NFBtjXFzJ5h
	DWHp01o3k5GmDkaWAuCKPCMkYKa9ek3HhR58G5AF1qpQcmXfx/hjHjcG0uksHWCgDinDPIHvXT8
	fv18kZqnkLvZaX3JBi+v6OAmeEaCCKqNRCGNWFuh0rKrzKljZUkuvZRQb88FTQ4Al61z+6kZfsU
	iABo51a9dg=
X-Received: by 2002:a05:6000:480a:b0:485:8e70:c826 with SMTP id ffacd0b85a97d-4858e70c8admr13201212f8f.32.1788704468849;
        Sun, 06 Sep 2026 07:21:08 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:21:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:57 +0100
Subject: [PATCH v6 12/13] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add ov02c10 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-12-067f2ecc4630@linaro.org>
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2957;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=T3eCxqMEeLwX423LxUJKnOfgBKSe3waR1F04b0ppdB4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbDTJqsj1FFeT/yfRBb5orsdJ90SBzEdVkSs
 UGzykaxMYiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12wwAKCRAicTuzoY3I
 OkVoD/9E2+yIeTEe3MqaK1z01nRoleTuJONPR0PMxBdKgzGfVkWXmLVqqOMv5TnF327QymV2MNR
 pFPWF+UkwEequ7Y2naGZ/mdB//5b1W2Tw+FjMNRq8GFObng8V1AQzjXBCCCmFQ2KmlcOyegkVbI
 tZBiNL04PNNwxsnVMNLtQFWUO4w4UfQyl0wi76XIIuTL9qeYSELxrE+fauDdzpmhs0iVFpPILCl
 Q23lY/PGl3ONqvJnuRdPcHLPtQIKtZEmoUJORlxm/mRtQl8Ds4sBg/mg3r7Evv1LNzuOyBaM0ky
 6yNca7O20bvO0IMNmCJ4bMK68/AUaOB5BKuJq5QxzxIngqU2So+vgsrtgRFpL9JOyghXpraup89
 6wqUx+RDJDSd/ab5cquQdxuqiI3U8ko1fjvAA1kz2ja2pUzEyu/RiwtGtUrAeOze6RZTFdjS4m0
 nITWrrulw2EoFpvQ6itud+/HWgE7nBWbwCnHp3AB4/xwyLj36Ug1TGxr8/X1QhdOZS2Ebs/mEhb
 gyTnHpUfKCb/rwTer83cajrAlXJPWpn2X82Vm7qmzL1rdyzjz8624uCIdPP1wWedEFdacOYFCEE
 SuQa7ZBRWfPybw0AwWQHr8AHRTOZCdPpFtQ9VH+zPLNzQ4ul5kol20m5fibaTbHMAAnfzBKK1EH
 A/LF20nlYLfhZiQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add in the RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index bcf3e2f610e66..8290f65f8a70a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa.dtsi"
@@ -863,6 +864,89 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn";
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			camss_csiphy4_inep: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&csiphy4_out_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov02c10";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dvdd-supply = <&vreg_l1m_1p2>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p9-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csiphy4_in_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov02c10_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			csiphy4_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy4_inep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1410,6 +1494,22 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio237";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.55.0

