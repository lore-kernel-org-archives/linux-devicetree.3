Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CD44EC670
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647972; cv=none; b=c46vDbHFfFOoaARBwqqOv7aJPGyiB7tOQ2fYcEq84ed1Gz74MD9UwsPSgelZTuxBA4NTdI7YqatrAY7A3je7FIhF/9PncSm0QC3A83ItMB2YCDuWTsqfh4rwPMLGX8BJPYTzooyH/ToIkqcRUZF/jMjHQja99ZM00vsjc35kvUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647972; c=relaxed/simple;
	bh=wcVvLfMlz5riSmWs553D19WWY81mEZP/GQQgeVrM1KA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I8ragM2PdYGK2X6TKspmYUScniawPKpbrjw6Ysserc5bUEnFloMi+ATeuYbZVXTqUjvtEbq9KNI5y7N2HxhnLUVTBkeEU4/Aj8QRmHjoTUZFXS5rmF7Kh62A0o96rCbJf6C3DtqHBBVc7pj0NT8LYzJ0bqJ4zuVUAvdCX4bonrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZImrOUp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lyb+/6Zm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZImrOUp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lyb+/6Zm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZhUZ1257991
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XKULm6RU78Ys5LsZQmpXG27Sz2mKXEmSi8OnTIJfeLE=; b=MZImrOUpmrVaf8nI
	kON8lorztGUMYsU8BfiKwFVWq9w8XHga8shDOGL3Eop4Ui5ViShPFooBHV6x4x6L
	jJrsE3l6uMvvxBKjXERfyHH+tcAhDa7GTm9nN60/71ZOqnRzI3lg4LsedChQF1Xl
	3OrXw8BbeaGG/JPvuCuHT1uOloMSN+2IYhlFc0vg28Ox1A7rWXcTjdyStdHsTX/F
	W/k8m+E6Ic5ZNGnuyF+aOjmy/GduM/Jr0XubwlOPBlCY/tCB1KK/JovJipuODsFE
	CChDmPWlBSJ1mqd7ewNxUGOdUCSmrEK9t+x2pTFKl5IFP9NfpS0AjnV5fpRmfdnm
	uiszcg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftgqa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:25:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc489e7a701so1181004a12.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647957; x=1790252757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKULm6RU78Ys5LsZQmpXG27Sz2mKXEmSi8OnTIJfeLE=;
        b=Lyb+/6ZmX9AdFDaUWbcCL4YtYLfAP5bx3fllOq9Q2rkBVJYtHQz5fPQ50gC88q/v9k
         cwoZ8nCHb3slVMFpTM/qtNEJr2O3m/1KCWQqNZ+VzIXcSjzK1KZMkRxpKLJY1pxseDZw
         OCt0xdV4hzDPs3JAKXhs1GyiLF/k7gaw5EBcmxsY6E2+VbGspFPJ1vw2jWr57UGCTFIy
         0HCP15nsGu1U6UEbZywVV5a2m5l1Ld5ibr8UMeAeBfrGE/WK67/49eZaWlumVyy6mrAf
         /TcKPOjPNrRmeekl/36d5rCvHs7JnRbi7blj8xSDdR393qe9fIBetkvPyT+lRkHFCIJh
         N/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647957; x=1790252757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XKULm6RU78Ys5LsZQmpXG27Sz2mKXEmSi8OnTIJfeLE=;
        b=jczyW/b81j17vZBOUQSZZA5Q3jsljD4Ew7Nnl9tuFk1fp5BUwXcNqB/g8EK4kaYUyt
         ZWHzwdW7CW5NaV7GJi9FvXDqrlL/j3EBWd0lHTWoDnASTl9wgtspJhwCCsWmYCGPQbc+
         Ni+2ttnSFG7aznxW5hnIDvrFan/brjBzesAMSQDNmzLUCl0dHtju8FRwrMQM5Xy7x0Md
         Y8vJd86fiwLvLPeAr60BgYtvr1pu99P96VCOVC8ETiBajHn3fSTZC+GdEkMGfedsurYH
         G9+fHUB8/cG3N8ncTUAe9B8P6IxNgfn1TDVYNcXXsmu5oZGxzOOzeHAMiW7tfjlNF5Qd
         Gx/w==
X-Forwarded-Encrypted: i=1; AKwUvBzydfaxgUdv9Hno3h+6WoVZ6fLgeWAEXysm0UiPOQCkp/ZdHspLpmnoMw+b6iOcweIxoGbM+IquYh+W@vger.kernel.org
X-Gm-Message-State: AFuF++ndHKigz2rY97OaoETWhiJBeNSyQMGUaT/9j1PqxAtoOwbPTbAL
	sAhLlVFvACT9ZCbUJ1jE727j7dJVjJJvpsinGddVik9NEfRHRsRxfb8QyhD219Xt+RrUEMLVwWn
	zXxNlLh+2hpvjrtxlHNhVS7+g0cxgfBdTD4CGu80IxhaRPJl9kfYNIBQHfYOmmWK/8Ady4wxs
X-Gm-Gg: AYBFou2qANkjXbUlEL/T860Gm0/+/8FNbXZ8mAJVSmEqhXI6ZzRMpWPBlS+ifOUY8KF
	sh/5Nm8jB/kH8O9JtCwJ9zeRVXRpxYXviBfc4x0rIFq1f9yYcwASYlSdAZeDmljS1/8CYPtendr
	rVI5G1hgThtbqSzfO4Sf3LSkirif3851XNcIvZdqqf4vaEw98SumP7hYjBGr2M1uHYJ1jf3vY4M
	ACeQ/PqzfRvAnpa5QbaMTHyljsxl8hvFLekTiJJ2/2WSAzLBCN1PsMKKW5BYBU8fawY7FGN0iFO
	B7EdS39GHdbbuGNpgGO6fyauwCE1VOzSOGErKlfRBuTQLKoi9s3QJGgWTmCpsThbFiOGMx378sz
	BX7DIVIcYT7nEZoCRuOBumtzC7e0X29xFliY=
X-Received: by 2002:a05:6a20:6f04:b0:3d3:aec2:4dc7 with SMTP id adf61e73a8af0-3dd5f724a7dmr17382245637.19.1789647957164;
        Thu, 17 Sep 2026 05:25:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f04:b0:3d3:aec2:4dc7 with SMTP id adf61e73a8af0-3dd5f724a7dmr17382184637.19.1789647956559;
        Thu, 17 Sep 2026 05:25:56 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:20 +0530
Subject: [PATCH v2 06/15] arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-6-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=3803;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=wcVvLfMlz5riSmWs553D19WWY81mEZP/GQQgeVrM1KA=;
 b=86ZF4Ea/kEzihKao6RkKVEaYTkBEE7X5iDg1hFnl33qhmEgr1e8rdX7XWvF5+QyOQurq0Qh4g
 LSeH3WHYCRNA0g9StLHaABVdzAyrls6nDHtPLTQyEby9kg1W/DJCZHm
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfXz3eXw9VvLnE2
 NLu7kmswegGddOvXRRjERvvZZxu3uJi4j+XsU+PU7VbIg7vgFoLLJaNzYHRjQPfuFTXWIEQiB+i
 DJq0R5sCmON3Y27nyWjMVRj4hCUiEUopVALZcvXm1aO7cZKRQd+zIVMTxFcUZ7Z6f2W0139wcgC
 DF6JSHD8XCP1LoTOtuatulfTenwBaMKt556+FRt1ckOnVQ+f49zaLKsT5UiKQto+BBZ+7bI4tId
 8TSpXYVhOO1E6l1xAK0/2a6rwyVtmMrzEa90XJGzPKJxz7LBnGEqEVX8t0fwPcxOVT+7KzRDJeX
 rJmhRFuveC9OoVgBzzxTc39eQtY8svkGV3MLLmfT2eGHZXwQWc3I8y40tkx0kCzFsVYiuOUPLKv
 0wji27ahC+QTguVlMG5246H/tk5goWURYQFCZ7kihpJs4ot0wFX687/67MYyE4JbVZvttRgfwNK
 LPRCUDAgCDB598tbZQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX4Zw5wzUeaMxT
 6X6WgwuJCEiwHzLL90S0cmb59Np0fdM3FKmIpoQ4BBVfEls1QO42tbY+Fw95lFtxZ9mHNRexX3Q
 DKJqRmcr1PXcgGKxmd5iI+d8x0sTOR0=
X-Proofpoint-GUID: On4_IspamZFi8KChHHyUn_B57s-efRNL
X-Proofpoint-ORIG-GUID: On4_IspamZFi8KChHHyUn_B57s-efRNL
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabdc56 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
board-level overrides. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board files,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 13 +++++++++----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts    | 12 ++++++++----
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 14 ++++++--------
 3 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 3e636926231d..02cb29afb246 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -618,9 +618,6 @@ &mss_pil {
 
 &pcie0 {
 	status = "okay";
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
 
 	pinctrl-names = "default";
@@ -634,9 +631,13 @@ &pcie0_phy {
 	vdda-pll-supply = <&vreg_l26a_1p2>;
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
@@ -649,6 +650,10 @@ &pcie1_phy {
 	vdda-pll-supply = <&vreg_l26a_1p2>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
 &pm8998_gpios {
 	gpio-line-names =
 		"NC",
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index c66df45eee64..88aa0b7de5fd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -508,8 +508,6 @@ &mss_pil {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -523,9 +521,11 @@ &pcie0_phy {
 	status = "okay";
 };
 
-&pcie1 {
-	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+};
 
+&pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
@@ -539,6 +539,10 @@ &pcie1_phy {
 	vdda-pll-supply = <&vreg_l26a_1p2>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
 &pm8998_adc {
 	channel@4c {
 		reg = <ADC5_XO_THERM_100K_PU>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b1f6782a3ad9..cb7f93b02b5a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2395,16 +2395,15 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2525,16 +2524,15 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

