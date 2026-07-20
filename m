Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A763E2AC7
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544683; cv=none; b=QXpv/HvyLCC6lfAlqfjZYL/EWr3HAPwHDiM4i33/o3QojFv2w4MspIdhtAlVqqlA7ZNnojdrQMANxpRotCzrg4XShkzkrSwxuPZhwAVumaDy4yOWSepni9bcvPfIzlY0714lZ4VwfM6SaU9FzobRRJUmThu9rdszPpxptrp9ikk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544683; c=relaxed/simple;
	bh=CunTSypJtWlyW28U7WXVoqOPrB/+X5MUi3tMnwngJmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b6f72FkYfHNXnlZEJLkdim1HQf/xSgohqGPOL8enKI2VK4I/VWTck+lMOoHzeg/hZDpLro6BGu5AIDa8yL5h+sc0NfCTuMkfLospgjHvQONcEqLfUdS0BkXTFJdNDdzFDDGsL0Pj0rswDXJ0VsaEdBbhwQDzvVnWjFGb5aHWunI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eh8V4Cb5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ky1TVczP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eh8V4Cb5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ky1TVczP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vtrN2023967
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dzzH2CnGNr/JtNcizsYzqX0tKbpUEyxmDzScPNkmqKw=; b=eh8V4Cb5YT57mN+l
	4glzBUnv8Byl8LLMndun/O4Chf9eS4drm1PXIW53H+cGW2m/KTGl4kb9ZPRTo3RE
	Op8IaAcJ9NNhyd7rDL4UDPPg5EfCI5bExPCSbBs7M7RzVOID6OjYWeaEY8YlvNNu
	h+10doGASsX1UlbS+hnzD/spyaiTS6E31+RZ6R+h/m5SUuHvoWy12LQbaEv89ur3
	A1Wmi+cX/wHJaHp6UN78NCl3rY/5yY9RNwP5QYOm+Zd2GzArFLoI0Db/AA7NaN1N
	rCna62tK4gqmu3I1aUJKKbv+wN4Wm1KmGiplzisT+6tskguJo/hJzuuhvEsaTKJq
	1Hmhqw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs00cyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:51:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85798977dcso11785776a12.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784544671; x=1785149471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dzzH2CnGNr/JtNcizsYzqX0tKbpUEyxmDzScPNkmqKw=;
        b=Ky1TVczPkxhbt/B/CYKFxAwmqH8VJXOli2Tx6rYNV16EqRUgpHNvBMyFiwp6kGjjhD
         hPjSmfQCrZgXWn3oDpmWfAJDnQYsAG3YiMlDex+Mmk2owE+MVwi3jiPdlXV3zSSZWhHh
         qkoKB1kz30T/RkR2O4hxgVLMYgqZpgYE1IMQI1omiL6i/W4qemrhMzoMtFrf6anrdtmc
         HWJsFPyewiDIoNJagM8AW1ANZVUQ3et1pQ7HhfKfs0F13fPY+YR+yit54Pl+gts7BEf1
         SkJFlG0ComL1+NfoJmqDJyVjfKzBM++nytubl+tvOI29Pzxu5IQRpLJq8KjozrtT/z9u
         zeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544671; x=1785149471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzzH2CnGNr/JtNcizsYzqX0tKbpUEyxmDzScPNkmqKw=;
        b=TwtSx6Vrzxd2BPIoW9Dm6svZXBZE6mIcu7obDt7sM8u2KmhWtwogKr+0ovQlpEzGtK
         0xlCZEQnF5yxhSz4kS1ymgFcuP1FS+6WrAsC2JCtSDFh9zaPgIXbkTfFUVP+QNqja+qC
         F3mZX+8cy6qub9wFdKkwCYBcOIlnjDDjyN5cmqKTnsIImZKs1D2UXxyfw90BSo92ZI1b
         Mpiav4jeoR7zwKTfbIRDlSZOCmZQ0zL13n07HXcr2/eopPiZeH7orINvsbwvcShzjcYL
         aA+Zgcy8BMBOQShh0oKKOGMtGxqnBJGnNIbEHGaCb55PDGFefORCFffvYfRykEMY7V4K
         MVPw==
X-Forwarded-Encrypted: i=1; AHgh+RryHOsTuAlq7jEPfgWFoXUNxlhQs31uyXsKSahsa+BdE8zm1SkefoA+18hjMTUa+3H6OdiEgD/xjg0b@vger.kernel.org
X-Gm-Message-State: AOJu0YxizpQsSWTAIsQZgbWHUVm8JLzyebTs5uESmWsxNZB1GKsnWcCc
	VnKr0wL0BB2kxtac1VkRF7OsefqKzfmZpQcm2EBmyJIHz+jynCuzZ11+0Fi7zsUYhcfRAKT/ldD
	D7eoNMPy1/KlTedmriTMuF7ZxSI/nVxx8ceDYdR+UwuE8wijATwJ07hXmJIReMWQy
X-Gm-Gg: AfdE7ck+yQ9OEazkhDRcpeTkqEPt7irw+I1yJ8B0cqvdgMmvcYoXMji0orrh9qJ05tX
	CYfKOA8aT4kOaJZftVp5Rlq2bhVt59x2zdpa5IsGE+cJw6m5qm9TSNP5yYsNA0TsZm/Y2cMwORo
	fhxuV5/ZvKHVCLjkboa/WxusD9GU0wzrA6z1L4K8Nv1QkFOGNARdzj0XPxLqyVplsXtCanN0GhL
	ZgWKYHA4GctSl63BZ8KBmgfCq4TUujiIXrDD5R/3WHugpqIZhXx/x+I1mAaKC9Ye+Lu+DFcPyxf
	KKeQyeToemb7s5EjZ2qSJ9kNynReHuGl4CyhtdNoq8Y9zj+C4gcz3m0wjQX8oJf7wtlMc6YEFtE
	93FmGFT+4lk9W86c=
X-Received: by 2002:a05:6300:48:b0:3c3:994f:b4f5 with SMTP id adf61e73a8af0-3c3ad67a262mr14617142637.28.1784544670862;
        Mon, 20 Jul 2026 03:51:10 -0700 (PDT)
X-Received: by 2002:a05:6300:48:b0:3c3:994f:b4f5 with SMTP id adf61e73a8af0-3c3ad67a262mr14617107637.28.1784544670423;
        Mon, 20 Jul 2026 03:51:10 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb5159b11a5sm4343368a12.0.2026.07.20.03.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:51:09 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:19:25 +0530
Subject: [PATCH v7 09/10] arm64: dts: qcom: shikra: Enable WiFi/BT on SoMs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-shikra-dt-m1-v7-9-7dc99100c6dd@oss.qualcomm.com>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
In-Reply-To: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784544606; l=5005;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=CunTSypJtWlyW28U7WXVoqOPrB/+X5MUi3tMnwngJmA=;
 b=cS46fBy5usUVCxNMIxKqU9RxEHeFsSaRgq1zpwyiGe7TQ5hHMbXR0zEEijy/85OH1f4ztCnfU
 HohMX2GHSzoBbH4+ArnCzOIt4pk/ig8OSEdHOTQ7Z1R/bZaMTfNHeeB
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX0cCU9TUxrn0X
 LVVTjhyVO2XIzgQbEHVZ9BrhdFm6jf8zIaqPQOh0SpQigKVaeSxb3sG0TyJan9ZOpD4Hd4EflQc
 qqC9d4xmglbYObAYw3cTBIxaqAxNaaA=
X-Proofpoint-ORIG-GUID: a5l22UyfTiKWxv0bIl_eMGxKO-Q0SQO8
X-Authority-Analysis: v=2.4 cv=DMS/JSNb c=1 sm=1 tr=0 ts=6a5dfd9f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4qNR6o1dbhOseOkXa0AA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: a5l22UyfTiKWxv0bIl_eMGxKO-Q0SQO8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX0o7VgVDZ5qxz
 0anHjQDx7AqEE0aC+3pSOxDYXliP4Ib88HfYo2DhDrFTyZmEE42jyX9l9H6o6CD8reusSCu/2O6
 Xw9QaVQZ8N2Zw+kZ1sUx4WcjtrduBy8+lUhejWahQ8oO/vll3jAZrbQIY1wqoMRNokXsBVy73e+
 wyUEgXACd92kFS0/OGlE+Vb7uIbiBC9mRqTPHE8t23DpkhfQZotmH7krTq6sTgfnu1ZbZNe0vhC
 L838FE/o/wRhENF7bIshTgC3KuHl5Wf4Y8/3cnyrQt+6/zX3/C+zA791aQWeAfHPjNVSJKpjW5y
 xxdEyFJj35/Q2eY9ChSxGMxsdvu5JD69vux9rFaHQNcZv8hW1xPt05NNCEwO6AAByMvYmsoCmLh
 6csvvgOmOEqtf2gEAEe471uGTQCO03OxMP6xrvfYBx+gIZEAt1GCDv0tx85hSyi8QTxpbl6WbhX
 NejlUdRo7Uw2XPk2JtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200120

Shikra SoM cards include WCN3988 WiFi/Bluetooth chip, with supplies
provided by on-card PMICs. Enable both interfaces and provide the
required supply and calibration data.

Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 74 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 82 ++++++++++++++++++++++++++++
 2 files changed, 156 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index dc3861489f64..2fff5fe9f6d2 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -11,6 +11,10 @@
 #include "pm8005.dtsi"
 
 / {
+	aliases {
+		serial1 = &uart8;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		label = "gpio-keys";
@@ -27,6 +31,42 @@ key-volume-up {
 			linux,can-disable;
 		};
 	};
+
+	wcn3988-pmu {
+		compatible = "qcom,wcn3988-pmu";
+
+		pinctrl-0 = <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply = <&pm4125_l7>;
+		vddxo-supply = <&pm4125_l13>;
+		vddrf-supply = <&pm4125_l10>;
+		vddch0-supply = <&pm4125_l22>;
+
+		regulators {
+			vreg_pmu_io: ldo0 {
+				regulator-name = "vreg_pmu_io";
+			};
+
+			vreg_pmu_xo: ldo1 {
+				regulator-name = "vreg_pmu_xo";
+			};
+
+			vreg_pmu_rf: ldo2 {
+				regulator-name = "vreg_pmu_rf";
+			};
+
+			vreg_pmu_ch0: ldo3 {
+				regulator-name = "vreg_pmu_ch0";
+			};
+
+			vreg_pmu_ch1: ldo4 {
+				regulator-name = "vreg_pmu_ch1";
+			};
+		};
+	};
 };
 
 &pm4125_gpios {
@@ -154,3 +194,37 @@ pm4125_l22: l22 {
 		};
 	};
 };
+
+&tlmm {
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio88";
+		function = "gpio";
+		bias-pull-down;
+	};
+};
+
+&uart8 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3988-bt";
+		max-speed = <3200000>;
+
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
+	};
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
+
+	qcom,calibration-variant = "Shikra_EVK";
+	firmware-name = "shikra";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 73945bf42112..657a14ca9606 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -10,6 +10,10 @@
 #include "pm8150.dtsi"
 
 / {
+	aliases {
+		serial1 = &uart8;
+	};
+
 	gpio-key {
 		compatible = "gpio-keys";
 		label = "gpio-keys";
@@ -26,6 +30,50 @@ key-volume-up {
 			linux,can-disable;
 		};
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "wcn_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	wcn3988-pmu {
+		compatible = "qcom,wcn3988-pmu";
+
+		pinctrl-0 = <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply = <&pm8150_s4>;
+		vddxo-supply = <&pm8150_l12>;
+		vddrf-supply = <&pm8150_l8>;
+		vddch0-supply = <&vreg_wcn_3p3>;
+
+		regulators {
+			vreg_pmu_io: ldo0 {
+				regulator-name = "vreg_pmu_io";
+			};
+
+			vreg_pmu_xo: ldo1 {
+				regulator-name = "vreg_pmu_xo";
+			};
+
+			vreg_pmu_rf: ldo2 {
+				regulator-name = "vreg_pmu_rf";
+			};
+
+			vreg_pmu_ch0: ldo3 {
+				regulator-name = "vreg_pmu_ch0";
+			};
+
+			vreg_pmu_ch1: ldo4 {
+				regulator-name = "vreg_pmu_ch1";
+			};
+		};
+	};
 };
 
 &pm8150_gpios {
@@ -168,3 +216,37 @@ pm8150_l18: l18 {
 		};
 	};
 };
+
+&tlmm {
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio88";
+		function = "gpio";
+		bias-pull-down;
+	};
+};
+
+&uart8 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3988-bt";
+		max-speed = <3200000>;
+
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
+	};
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm8150_s4>;
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
+
+	qcom,calibration-variant = "Shikra_EVK";
+	firmware-name = "shikra";
+
+	status = "okay";
+};

-- 
2.34.1

