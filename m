Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069D143CE62
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786445965; cv=none; b=cxOrUbz7DPwTe2eeiu1F9mMY3R1A754NRO6q+TjvwKh9F5I91QMuVjHK1EPAXxClTig+dHMyBJPJIYPvZb5ezXhpxL9sg5TinYaVX+KQc/eRLlaiwAA8dvEwrdrlbClOMnpgSelNfoMriA7rCMSRrOzG9qdpIm1ifZjRDR5t3MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786445965; c=relaxed/simple;
	bh=V5Ss4ZXm9MXFjoDYFImLDCTgyhW59nD5qjgPYogx/xU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FrWEC1+JlibvfFAIQbNz78v1PzIx4wvQTI9RhiVerNAC/vqOzGD4A7Yx1xUE/X0EfJmb3fbqMfmyF29vvNWF+VS9hNxt/82khslh1Nw2qG3niXZE2QL9eUNPGIwf18mno8tGSfvFpq+XFL9BxIa5RTls1zJKSDTICATHwZ9KOb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QNF46aMD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggUECvPI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QNF46aMD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggUECvPI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BAMTFu661239
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a6YjjHD0GWmbFHh7DIFjdLWdcNY7r2aLEwUsM6cuKEI=; b=QNF46aMDo5ff7HDZ
	srR/VfeXrFpdj+8h+TGznfybWWCr9/S4zYBzpRB1h8oIeg5beOWa+6gapQuwqmPX
	LcLtUvYM/0iXybX+DL2NDPE71QRiYh2yPfzHEXYaNdfFtIEFuaRUR9BDrvtT9o4Y
	awCN/OYmuTpKHjP1t0cdWyy7TRyBwa1pDZ5W8wwPlomywggL7+wDPPvZ9sQwrchB
	cb4QDyDDH6HwPszdf39DxTysS/Zl2liIgBWDCfmqhHGmvKsyLycE7MWnDOSwJJ4M
	SMhAwCF8j/8L/GU/IPPZ34g+JcjtP/aTrNB0Ej0jMNT4v5M9CDnYZIWX6l9JErJZ
	1olkgA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfup5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:59:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb733fc5024so1098660a12.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 03:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786445962; x=1787050762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6YjjHD0GWmbFHh7DIFjdLWdcNY7r2aLEwUsM6cuKEI=;
        b=ggUECvPIMeI5fxq0Jul9BOufcs7E2fxjJ5/fcFBfjRsPsavjswMoM8191z6/lMJF4F
         rzjmyrd3yJbfT5e0rovIvZK0z3iUA8hRfEoxJyvJvAe46DqMWJLCZUG57UG2IDZ6IlLW
         1mNSSKIQyb/QTOCwXYTa6Cx2XzFa2qM2aZLTPNxK4aVQXMDMdjVNwI6vTmqP8wei+IRw
         jubXE56st1B1V/LdTk9p1HFKST8bSGNfUqQ/xrXyYoebfPjO9a3ufub5EyshmMQcdqx6
         ZHZkIRTcJH74Etp5JxgPmu8cQDQvghp1ktJLytUfYr/fWJiuwNgR9GCWWxB20UoFc1Zx
         MCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786445962; x=1787050762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6YjjHD0GWmbFHh7DIFjdLWdcNY7r2aLEwUsM6cuKEI=;
        b=s1QMV0z0C1XvhX/ROrBySeAC/+pKjhVKhxrENpgIyunacdL+jyuswQ9/bNT/KdOYMY
         qq/FKzYnh32EppzO2A1tKFxWPigLH571Xrl+YhlEqcrpBdCn6i+ymVBW4JwTd6UaM4Jw
         1wEdKHwxeiYlcFlKknLkj4dMx6K71jYQlUNhjRC7u9MmpcXehJbsvgzOr7yYDL5JPK0/
         iRsy3y6SoN64GrHDZwPXaDEvOPLEPRIoXiH18viE28ZvyTaCS39SchmE4F2O+kMy4vBe
         pcm8n2cgZOP4CJQB8hp5eygZpAfjlrVN54GbUgdCz2PiEwPzuS+xkPklz2Fd/5KxCXqo
         BQPw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0usZEEbeESOS94DEFCXT/CB7Z1aUfnKk8/wfVW9HZb2qlPnbhA0rfGbN3FtgJVFdNHpB8IgLmYG3x@vger.kernel.org
X-Gm-Message-State: AOJu0YyTRYix36oTHtKUYsvrZz5i7xclbxRPXvbt5TsRTl5uOraUMlRe
	ojQGBKz7Ph3CJUxUg4riLnVpYgv5RKvXm3I2Pu50fosUtwWJc2gwiYb59YWLSpMrI+jodFkb2Y5
	S9LF71DswKfgKiKrfnUGDtYnlXOWhzrkuJUFzGmGVg/sOvkQsNUYom+YLzH1Ey+Bs
X-Gm-Gg: AR+sD11ccbp1HF8fP8HV2B4OChQVwoh0BeT4xZJDBh7hEfZz01BLtoBesnk5b+vAndH
	yQftFRzmGdTh5k7Sn3Q4dYJEXpb8NftHK7j90Ql6+U7g2cS5/BUqiKG6OmgyzLbKViegQWJIyu6
	4Wl3AlXJzDMmxxe1ZiJV1phYIl86yTw8A+vFRFGldCvDPydjGxt7cfvuEIofxLiXQGwxoGkmmoV
	UOjI4gwRyqzn+m/NkGfEasdHL1mUcJdUJBmzl3UG++e4ZjaWU2Lv/CY4o7/xK44eaZA3rx0gO++
	yitMP06skj2tB6JobyxlXDSug60ipD7v6B3SbeljodgWRhIjOad21koRLF4W3LNPiPwHyzoyBvd
	6U/NPqDTzo79hJKvq8Qe3Y8mkE+40ADAA2TCLGM7OJKcy38Ow+2MG8qINbIu+OFIkrrJvNA==
X-Received: by 2002:a05:6a00:6ca5:b0:843:468d:7804 with SMTP id d2e1a72fcca58-84fa8a3faa5mr2310742b3a.34.1786445961775;
        Tue, 11 Aug 2026 03:59:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:6ca5:b0:843:468d:7804 with SMTP id d2e1a72fcca58-84fa8a3faa5mr2310684b3a.34.1786445961175;
        Tue, 11 Aug 2026 03:59:21 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa952841dsm529322b3a.30.2026.08.11.03.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 03:59:20 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 16:29:08 +0530
Subject: [PATCH v7 2/2] arm64: dts: qcom: Enable USB controllers on Shikra
 platforms
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-usb-shikra-v7-v7-2-753e928f37ae@oss.qualcomm.com>
References: <20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com>
In-Reply-To: <20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786445948; l=3488;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=V5Ss4ZXm9MXFjoDYFImLDCTgyhW59nD5qjgPYogx/xU=;
 b=wDOfVCDPfSrlbVXGgGJEj8xEBcmjXFKjdNJW6ABGEucWTUqKbdJ7v+bgqxBVft7vhdBtfYsJs
 LAczIhI8g6VBxlAsGEfuJ75+LgOAExWJVZmxLeqSvGbWXLXOUTG6p54
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: uFqFuNzgOF0LCbr7v1sntFuA4vkROp2t
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA5MSBTYWx0ZWRfX9IAcODIZdKjS
 sV8mbOPBYKI9OCAmqYDA8jW674nMjNfusVVT85XOw1gbZ3BzsP+oiK9IN/FlyTd2RGZihhNU6is
 irF9wlFDPlVKB9NBjPYVH/g0uuWpzJw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA5MSBTYWx0ZWRfX8X89xVWZ/MRp
 efZ9XY328UXdGhVMV9rkHQqTkispYqqKbiKzjC9eT0+ie6/CfQFCYeeweg8BQrCVJE9SO4ee/B0
 kPJDT1zywcIP/hJpFZNmQvgpZ3OZWhJzXSdwi4KhVOTeDavHEcofPPaOUTau/KC/DHdaHGGcB+r
 B1ojAVUgDNn3aNzy9g9x6bSE+mClcxa9lZCXxiYZ42El4/APz+HBfVh4pM0jYoVTvb9tsynMzIc
 aTgeNPaBoX3Q/UxkmKvORwo4EvWBrBaI8ubBHM0tb9CJ23FVGO4VYCM/vzkT7BSwMLbL2X/q+d2
 ClD8KtQqYcqWnjUUnb59lx4Jn/iBzZnshzmgCuIXhpzp7dnvw7y7TmsrjywQRkl9RGyJ2umGf3r
 f2lQbPCMSI3B9QPFxmCt+j1t3vFyszV3mSHYNl+4HpBjwVPkrEkZX2LpgZmEE/MKK+wHbtQZuB1
 K8RZHpSLyMdTyaEJHmQ==
X-Proofpoint-GUID: uFqFuNzgOF0LCbr7v1sntFuA4vkROp2t
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7b008a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=aobenoHkLCnGjtixFrMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110091

On Shikra CQS/CQM  platforms, usb-role-switch is handled by PM4125 on
primary Type-C port and Cypress PD controller CYPD6129 on second Type-C
port. On Shikra IQS platform, usb-role-switch is handled by Cypress PD
controller CYPD6129 on both Type-C ports.

Since those changes are not yet present, enabling both USB controllers
in device mode.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 23 +++++++++++++++++++++++
 4 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index b112b21b1d79..3866ab8b0faa 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -57,3 +57,26 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index e62ba5aef71f..34568f1c7b63 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -57,3 +57,26 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 6eb4184f7642..8ad0819c9520 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -12,3 +12,15 @@ &qupv3_0 {
 &uart0 {
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 727809430fd1..543d769125ef 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -57,3 +57,26 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm8150_l6>;
+	vdda-pll-supply = <&pm8150_l12>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};

-- 
2.34.1

