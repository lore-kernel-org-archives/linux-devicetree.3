Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A68D3E6391
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663919; cv=none; b=DjzXnsybZkss2mdUFpGank4A8UXAJJUYPTBgoVspHdm0wmj4Vb2OczDnfmOvqeZDx+ugrFrT8exO5R73b6Nekl74ok41fw4zuA+mDKTwBpsSIt6cWUHUsmN6TFXSeTyXjBEEnvN9GoG0CJCfX2+0Ns5E2CUJr438oqQ5KkvfwGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663919; c=relaxed/simple;
	bh=FeSIeLtwPHtV3crN/baz0uL6JwDaZ6Z09/0Oo0Aqg0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ipzYODVvX/Svdj13RKQrdHPfSgodTw8k2Ru6s9caWAK8uzh94xg65rG+B5HBF/jV/w/yVfWJ/CUkS7H16m4Hjhyrv4izKs1n06f6NFX8dD1KAUbdVLBj86/b+qLM9uk/eqdc7TKGZR9FYj6+g0llgkfw7wBHdweQYWKxv5uliaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNLB2LT1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gdDw0FtB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNLB2LT1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gdDw0FtB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pPDG2331990
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G4XaXcL5iagjxARaQ65zFOGZrx+dExH/+9U0Fh3XgWI=; b=GNLB2LT1rjiLceaM
	AyhOB6Od053daJQf1CcPD8JL22uDSpcjbkKrcSHoYJ90faUSjaHi1uJK3SmZlVYe
	REa4dvFTn2ORZT25gGN5GYFj24xFiu9FojasVKCIyiHyLuqXMEzC9cf1WITmI9xb
	yJwA1EkicIZRZsDx0gA4fik56zwnpSjSTpgKsPD96HFimgRPY5lPGPrvKwz/lSzI
	wEJ4R+4Bj8GJGHfglXpUg5MHD9ciRhVcLJJ6taTW3BPHMcQ76ikEKvdfbrVcJ9NA
	oLVY0Zc7quSveqyec2EGjDk3ertX/xB6ASyk4n8KcSGAQzmgUwFvQx9ODXn9MM+j
	kaK++w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43ypcd8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:18:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da529ff48so156815201cf.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 02:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778663915; x=1779268715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4XaXcL5iagjxARaQ65zFOGZrx+dExH/+9U0Fh3XgWI=;
        b=gdDw0FtBuDPdgvbk4HOIDnXqEVb/MbyKYGbVReV3yVJDK3s5AzJGlxVzQxOKu1QttT
         QPGXxTp+L8VZo8NNHvfcDlRu/KKIIkIRza5Wxhm+URtT+6fYo6GLM407VC6CMPnM6YNA
         uvqp7BRjYJg9wSDSFq9/poSmmnT+F00ZBdCnZ6TvCfqxolZbaobwKkcbjRs+F5wappIh
         iAH6MdkIWQbtGmsbFrys4l3d2g7XdjjNDJ7+2rd0Rh173QXxf+/kMtnU9ey7AlyHLc8E
         oN8Hx2Y73c9N6qAsw6Grj7v0bP9S+iHUPZ7/iu1lX76/l+Ns4mdZjOzKuKsxTI6Hak7/
         XvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663915; x=1779268715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G4XaXcL5iagjxARaQ65zFOGZrx+dExH/+9U0Fh3XgWI=;
        b=ERHF2UIc/H/lrYwMm3x26mJ6Fxvyz9CUOD/wmecq2GrbMJgXTIwqZ68fwCqkqpczKc
         WXBk2w+aqDK0NGDi1K4hacqqvIZ1LbQNRMnqY1OtPgnoeujddCCEg0W2yQ+W+Iw5QT6M
         aM5unaGwSz/YsawY1iCzuKiDeW3VRMYQhf9XaQTFaHgGTvqvhNZWIqFnE6fK0BgjXnIw
         TIzl10rQUAXhBzasrRfa57wChmYynKm5hBOiW0hB5HY0UBrHWw+6ampqwYCsmeSgxhbR
         rGqhoN3IfBBIcAUBLZQ9jvZKcsnSMKy0jz+ksPnCEyo4P9L0OR5OFIjvzeCBY+fUb71R
         N3WQ==
X-Forwarded-Encrypted: i=1; AFNElJ+gybTcrdCwsLJAN+GOql5kxwhj1dhLMNi+9uyNL5ksQnSDy/a2ozNoApOpSAEVoASdY7Xju1cMeDgW@vger.kernel.org
X-Gm-Message-State: AOJu0YxdCOJ4lsMovFJunuScaCOQCdR8BI8yg9hBpZ3uEb84tthdm2PV
	4naV3bTRZw9JhXrt7XG1fZ4xEcFILhN8RBncNMOk8h65sQ7+ae81pUXAgfxhZq7nMYhj6iQoKwD
	JSds61Icp/EGisLGx2SEDggWnRUzDZ5Z1kfmCUpvRoL3Dy3uKK5h1ffqsi2Mko2Xf
X-Gm-Gg: Acq92OEwdlmZUK5TTdNsSXDld9/2+N7XMkPPIAVp+a7uBGGz5Fq+l1XL11yVM3sdBOE
	ATR9CkkeA8NdetZvL1JHpheJuAA9mlYwUy0qpVh4dB0JAC/AvM+bCfT5XlWeGAnVWEy7o5MIVnm
	3Zy+3GVGA1M4+dR/ufVSTzSJa467EFEbA4MDBSjWtG8o6CQbmp6dSGVPx5xKU9NrI/DaI7FA4Le
	EgUauPOz6peDFRz/1aKjlpeCL11YT942kXZw6WuVm/a/7kaYf4AS0zBMLSDL3LzwYqTExHSc7Dh
	r3kmmqj0VYS3t2013rEXPOk0Hre76Hv8WZO+V4fj3qWUDlXEK6cp8YvNi7jxksIqs8zzuSOEaOh
	AK8YdNofsMWD0FsVHmeWaZ+nYbu1iIA==
X-Received: by 2002:a05:622a:1650:b0:50f:afb2:db29 with SMTP id d75a77b69052e-5162f453bf7mr29199761cf.3.1778663915275;
        Wed, 13 May 2026 02:18:35 -0700 (PDT)
X-Received: by 2002:a05:622a:1650:b0:50f:afb2:db29 with SMTP id d75a77b69052e-5162f453bf7mr29199491cf.3.1778663914791;
        Wed, 13 May 2026 02:18:34 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6cd75sm37827620f8f.16.2026.05.13.02.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:18:33 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 13 May 2026 12:18:21 +0300
Subject: [PATCH v4 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza-adsp-usb-v4-3-839936e89aca@oss.qualcomm.com>
References: <20260513-eliza-adsp-usb-v4-0-839936e89aca@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-adsp-usb-v4-0-839936e89aca@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3068;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=FeSIeLtwPHtV3crN/baz0uL6JwDaZ6Z09/0Oo0Aqg0E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBEHihAIikIp+wTRFBLJ+plxc3iefzzJVkVT/D
 hWnLCqUZZiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagRB4gAKCRAbX0TJAJUV
 VpfAD/4w9qeAkDuSfehHwFCA5bfGO8RxQWISGUlAHAVSjva92PQ9XR9a/kWAcDQgq4ff+Y5GyuH
 VuUHvDRrf0jZllea7u8ny+LNmDpJgokI4KStaaIjICzQy7z8zxvxLFzRDjmUFI/Z3VmGakrEMA/
 5TTy88aqmbIMTBvsOpRU5H68eQ82E/4+ZuRZwmj9k7DFvcICASuuKqMlvRNpUSi7BMdZjQ4PW+O
 gAQKkQ1ErThNEDgK745Om/XlD59Zh5nyMBV1SvzgkJJ+UB8zOxK4thgw3KK9Exw/FKINEBZBvXE
 4Z9MYf/IlVK3ap15jDDsdFXLhe2xHQpI7RAzUsdQ8j+bYuG1mifrCxtBT85i1fV4mAuiUJMIuBi
 mINeNh+G4gVzam+DptWU5tNo6oz/1JOFYp6Z+hzikpMhxCuj3P1hGn33Jfjw469YoD7/NQb2UFE
 REdsh0oCkB+eeVyRtykH8plvgsRau29Qe8WcMnrx6wwgK8LCrfnap3qlHMFDgyI4DHX/5RWGWNp
 DOwDVFWpQewSF3djIeyI0PwLDtdifn4rKLogApfAuaDrNv0FBqG39QX19Jv1KwygP1tiObUhd9m
 /2iplw4HFE7CLQ668H0V91ZcI9SsLloXsyDwsiGtf87QCx+ytK8wxGezPDIHxCdjI9yDO73einT
 yqT/FRlz3UcaUCA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: rdN18kCSB-y7Jtfi_or1G59cjPZaYHgn
X-Authority-Analysis: v=2.4 cv=R5kz39RX c=1 sm=1 tr=0 ts=6a0441ec cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XerPLwBTpPCFuubScswA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA5NiBTYWx0ZWRfX0EPKmkJh+im5
 H21E+OHHDjKix5Tbd8OUePeObBayGQy4RqcXrkHt6WV4LzEA2ZdmK9SLdjtBuelUCJECEQnfISD
 d82JjrUlIULrFHFQsbwEzyIhWGshaTjFM5rR7sK5hNSdGF1H7/NqhA4OIKa4T2+Y0qWjlR6yqpr
 6H0CiXFF7vupzK66/kgEgE9/a5QFUlKCVTS71ub0eehoaU0EfzyZDKjxeQC5LOCh5/ThIz48yy0
 XK6dlKEPyrXTap0GdOwOPfLY7zRiKZ1A11kE6uJiGUsrcEvUHfolSNycAmtl5FYEHrv7AncLxgv
 OnKdmlpV9h3I5b3cuMbqRvX1nseTymsI7pm05O1ocKcsiCUgbDXZTeeJMAsl8xCugqp8l6InkvZ
 9j3XU5Vl82sT72I16tAjLkN6urXzztgof90tzihm1bmh+XxmQSDva4KxcWCibMdcnhtLH7LKKCH
 jQtUcPX2No6bh54rRXw==
X-Proofpoint-GUID: rdN18kCSB-y7Jtfi_or1G59cjPZaYHgn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130096

The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
routed through an eUSB2 repeater provided by the PM7550BA PMIC.

Describe the port and repeater, and enable the USB controller and PHYs.

Also specify the ADSP firmware and enable the remoteproc.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 81 ++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 90f629800cb0..3e41c95edb28 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -6,9 +6,12 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "eliza.dtsi"
 
+#include "pm7550ba-eliza.dtsi"
+
 / {
 	model = "Qualcomm Technologies, Inc. Eliza MTP";
 	compatible = "qcom,eliza-mtp", "qcom,eliza";
@@ -54,6 +57,44 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,eliza-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 122 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -376,6 +417,18 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&pm7550ba_eusb2_repeater {
+	vdd18-supply = <&vreg_l7b>;
+	vdd3-supply = <&vreg_l17b>;
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/eliza/adsp.mbn",
+			"qcom/eliza/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */
@@ -405,3 +458,31 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb {
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g>;
+	vdda-pll-supply = <&vreg_l7k>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l7k>;
+	vdda12-supply = <&vreg_l4b>;
+
+	phys = <&pm7550ba_eusb2_repeater>;
+
+	status = "okay";
+};

-- 
2.54.0

