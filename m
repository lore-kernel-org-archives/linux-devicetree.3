Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0103E4C67
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 16:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912287; cv=none; b=oZ2Tu8gfJl2Stf86+RuRisgMTwGldhKj+l6TUvfUvFx5IXjERbpV1jlYVXlTAIJsecYhfrzRmhqpwgcV7o8DYh32VwZH3GR0qAteO6aY5EkrYMan+EeYQi+kZmgLEfO4LXT+YJm0XKIChL68ayUoGP9Gm/jaItHUK0QgwQXf9Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912287; c=relaxed/simple;
	bh=uRIBRQsQHN1k8SN0i1NUocaKTlyCV7C0B7ba92hVDzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tqbJdw9tfZxY673yAm2s9at/NQ9AIMxPnlmoXGBE3FQndg9y/qWMayEFYpMQwrRaf0ucgGRdwXhiy5kL3H3c9i10f2HZvGVRvo56R8/2UdaDrzwSJI39iNOuysbE1IoOh3i3f7HjLR2JSUIUGvpFHR1DoLwCW3WuW+GZf7LY5HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LaLX6fMq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UHKiWTG3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LaLX6fMq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UHKiWTG3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644Dwb5O3467601
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 16:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wgnV2scb11GhDS3a288DgK6vG9GrzpI1FMk/LFDbTXI=; b=LaLX6fMqRURvbSuU
	ZlJENdSa4WhHHrVYcoSnBumA5fBGOW2JOsdfsHy2mxt4ShZ9vsNkVYqFtDJAqJ8w
	Jx45hxDRWqHf4Qul83P5uNYXr8bk5rpQ17omaLs47SiBtEngFp2qblakFcjrZYXO
	zkAtosMR9vK/r0rR3QdQsSPxpdNmZVlGgyBPLPZuC94C+zDWO1ynT6FD5YxBD/Q2
	YCsqcAPD10opvA2fyOTJ2f+PRi8lxLo/tlLh6yvj0ggnzZOrAAFv4WP5VzQgzYCd
	ZEPC1tDldu2POCROp/B0S2jwptAqDqDhM/u6iVlL528Vm8exS0vmOoTEjH3Tn3vN
	i7r1xQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvtjrkw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 16:31:25 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-47bd318565dso6203817b6e.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 09:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777912284; x=1778517084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgnV2scb11GhDS3a288DgK6vG9GrzpI1FMk/LFDbTXI=;
        b=UHKiWTG3aGfqBE/NFnzQP8ft8pyMglFmrAOadozkIPYWSWdANBrU0MfigwVqIDs7xC
         NxK6U7Tth0bluK1BVgddSwiTg5dDJAHokTGxlAKv9S5DrifVsatRYAisgGy+VwF3L/yS
         dOF/pqCfmJmB4P4YwIwBqnI/g0KLugeYXEy0H8K9WSaXKk/flGiHwhKvcX24dxdaGDYr
         MczXLMqbEajTsDQTl7UqqCRUidSEISS7siiUrlqzvxcQwjn2GPKmUp9C87W051GphINh
         LqLGtQCftvyPeHe69vBS2T+J9U/Dp+GBAC+59PG0mo4DUucTwM+DWsag+qe5JPU7/ayS
         soug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777912284; x=1778517084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wgnV2scb11GhDS3a288DgK6vG9GrzpI1FMk/LFDbTXI=;
        b=I5Hco5Bqyj3IHrIzBIr2t8jWRRc2DFTz37y6V8OnSLiLcpo45Pomm5ztwWCW5VW8vM
         hW2xpeKUt1zqkNWy4dl72eNOB6Vy/P9NwbcocXdDfGzZg9csk4QL0FwOt+0LMGh0wI4l
         SYnhyHcZX0k7AHtm5tK778+t9DTrOMNjXh72YF5Q1ocXKY+MAHtyFmKVqat4iTdOe/oQ
         2a4XLo1XGVD3mTwJoIxzXigkvJgly/YWsLw4hiL2E9Vcb2bZ5m7HGmhDVP9bX7ewCiUY
         Z0FYa+nvI4F0K3QzytCcYrJLlhpGaaDZKFL4wSa8MaU2KEu7Oqmw7r8+e0UcQb1jbqR0
         4ddw==
X-Forwarded-Encrypted: i=1; AFNElJ/Bo3qmIj8DGPYaAaXatMRTfCiqpQk81KYwz3zLAXiXH2oi7vlR5s6CqzNNTT5RH+oYjhW8gzZmpwmD@vger.kernel.org
X-Gm-Message-State: AOJu0YwZmMYuFo1BczJrcSsSrTyq2PHcYC7N0H84RvDDFlcgTnVBgcoX
	NgpqJDIMTkZ+ZkWUlVsHzB/Eg8Pi7MbTarvxikQMFnFRrwL3BQnYII+/nBsPHDyoEPUk9dxfnZJ
	G5fOaq0Dzi31uxaquOjT9Y9o6w1+g2/RNZSdOPjY5K5fw4cPquudDR7wV3SsV8xhh
X-Gm-Gg: AeBDieumcS+iSDEL/w505L7rUZtjmLRHKvCLpsdSBwt931IptoQ28h4KVrW4rsf5h4u
	fBMi28wmLEeFWZ+8l/A7lTnjx+06biGbfp2Blwyz0pwVbTVTXduzjrznlnPdjzdM8A52gS9YDgi
	BZ/2WThe9ZHK1BrjOfUCL6lwFln21W1x3rggK5eyMM/NJgFd6lEBTxrhLUgHwslFP6m2RJFtF1Z
	OvCqaJD4kqpQqIGzojNp2Z0PIkroCfE05bKekzNNxumMgZkveQsZMy/dylBbh1MGIQbeKAZcnYg
	DqV7DRm5ZDkFGkvrarfou3e4OQ6FpGs2F8BclM4b1dxW6S+lrVB79aFam+bztirKbWLpoYE+ou+
	VEYz1KWeYKB2ViiVKbSCzJT7UuL308QKC5O2x1Wvh
X-Received: by 2002:a05:6808:e3c5:b0:467:880:7441 with SMTP id 5614622812f47-47c890544ddmr3649136b6e.18.1777912284262;
        Mon, 04 May 2026 09:31:24 -0700 (PDT)
X-Received: by 2002:a05:6808:e3c5:b0:467:880:7441 with SMTP id 5614622812f47-47c890544ddmr3649102b6e.18.1777912283583;
        Mon, 04 May 2026 09:31:23 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb75fc1sm294986075e9.7.2026.05.04.09.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:31:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 04 May 2026 19:31:07 +0300
Subject: [PATCH v2 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-eliza-adsp-usb-v2-3-18e0b0b0407f@oss.qualcomm.com>
References: <20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com>
In-Reply-To: <20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2796;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=uRIBRQsQHN1k8SN0i1NUocaKTlyCV7C0B7ba92hVDzE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp+MnTHP0mtIo8i+IfrdskVx9DwQqDy9Uj+JZSB
 mGmd9mmaj6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCafjJ0wAKCRAbX0TJAJUV
 VgJeEADIgb8S7wNNL4zaVmSAr4yGXRpe3rSa50hs0r7xdGPE2D4/Ozu5MZw545+Aj/vHCsNBXuG
 63/8Rq80NOxncJmDWFNs/YWeKGPvd1OmP9NSt0jJgUXiWic73uHiKLU5u3EWJZVLBUrNP7GlCYO
 qXyjgm8hxkuxg6OsKCrnb95Q4f0TYqEcVgZEd9dyRezfT0RYnUW0DCMVHBFOXuWbXJybZ6tW7nr
 ormb56f9tG/mR0tDr4wdZDZ4l4fN9+MGGPIX8pHfYVOZQAKjYvmFpQjZY2CyzlmUxkqD3T4DiHf
 4Jq5sgKkMkJ/H6tMNL4nIZxVtFMFN2OxFQwLPFS12vrenBzftc5RO4Kkaolk0F5rttAzi03vYxj
 +reF8FjqUfSq2mJPYpWlYuSdRoGfT7uiv/yzh9UGde7A8xB6h5VDveP+KJPnTijcnB5lRhGLPPo
 FGnx763sR4iV4WqALfwKX/i0tb3F6xN6i9UJgnMU603oJSfXPM45R5x3ya27y48/qLKifak1rfj
 hGOfLo+Y8h/zMeI8m0jb+vbYcT9xE8bIEjas8W4Jw95c4vfSEnDoB0XTwcrWALLm6Ovi/UyJnbI
 TZ8CkdMERbgFtYtEspNfUckt2wDd9dFAQZCLUoC0rfvBwh6XMScMxfUk1cVPgVgSvp1JaVzUQQQ
 vFZB+eq5iFd6uEg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: jS1O8q4sP_iPtRkmOefCB2GNuSe2PQDp
X-Authority-Analysis: v=2.4 cv=KuN9H2WN c=1 sm=1 tr=0 ts=69f8c9dd cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XerPLwBTpPCFuubScswA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfX3dCr84OlzKvN
 kZUspSd0hxvmU51u7r05WrIHBjLFk4lKiYZB9qeSIOeeakmgbfCkafaC13S1+nr9pZE2qPaAWn8
 3pe7mAeroh8lUnqyaAjo/D8ciZGTUXyitxubySCaHMsSyNsvNxYCw8KTLwN/ygCIN/Zm8Srscqw
 q0japWhMY2PBpqUwvmLXMNrvCzYM+diLGH66B8uxCuAwAUrgwkx9jJiAbIxqE2d4gPX9C0dNl0/
 7a9WWnJdpL02kuv1H0XKCffWUMp367Kpr42Yn+YgAXFy7ppy9lZy/l+dU6aCA/e+zbbSuCDc0pz
 ny3cujmeza3KybuXRjGuGTSF5iR+S6jHEvgoa0D4SvqhUBMxhiTjWQLon1+h5PTKYMl1SL/SaOa
 KM7uxNzlC1jGuOJnzvsMdYU1A6bAfZafdOtIrMRhtBTJdRvqttByOqnlzwlWVIU1kDHzsoO8jan
 88cFuGWD4UfkFYFRH6Q==
X-Proofpoint-ORIG-GUID: jS1O8q4sP_iPtRkmOefCB2GNuSe2PQDp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040151

The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
routed through an eUSB2 repeater provided by the PM7750BA PMIC.

Describe the port and repeater, and enable the USB controller and PHYs.

Also specify the ADSP firmware and enable the remoteproc.

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

