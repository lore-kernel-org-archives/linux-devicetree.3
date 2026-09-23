Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45760239E60
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161475; cv=none; b=HiwfyErzFrnRaobz7bjxzPXeXg5lBX1paHeq/od37SYyCaBkgPJuPU4mmnV8RBuynaGBC48ifP/mSPbsglmN5DUhilnH88KEoN18d5aA+24PqoUC0Fp9XSx58lkJAj5TE8KtCr/Qspj95UeRU8UGZXxM93xbfKLI8aeYzujii30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161475; c=relaxed/simple;
	bh=crvh2tjmlRAsxQV2O/n+KwVFz5C3EoHCAKb4c6quvEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sI70OJGZw3WnwPOuuE7PitmgMxn1iFkCldkx/Jy5cS1ao5lG0Cq52jeNSeC8VGwFTgC/AmJuVeVN/snm+Or5/x5q3nQzLuCMW2HTizj4HRUT62cM+96Oq/od/bZBcYkFkmsEo10xibUK5TV4fYE58GTFxZyI61XXYjf2jZ6+0JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RDEYt7Ai; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KnukJNZO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RDEYt7Ai";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KnukJNZO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2vFK3409851
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqPWSpC8t1ndXxUwrCDaURIaol2XTCo9QNkJi6Rc+DU=; b=RDEYt7Aivhw4J2xk
	uBy4pil4vvIe9hK4W9heq0p/IRSvWwJW5evPZdOsZkFtWG28oZsT9KYiIx7ZpYcN
	/PzCz+O3+XXhofyQsVCbJa2CFOpJ1f1G65B6T0wVrbZ0LjjBa6hIVIyiho40Jm+h
	ZVcaTNcw/byyMsA/dwEOva8MuK6z6jjxuQm8o8zZ33sJob0fTWpL2uU0G6ay1ZMc
	YLpx2zzRww94BvjPEB8O+TaCpYEOVPYIIHh7lxjHWTXHin0hnyWkZ3nyFLSp+YZN
	OfYzntd/loWwpmyA0AC0oO9aEx99AqzoT2RFrbRvxwzwwaSzqE5E32Rzh18wL8jp
	SEcuHg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux864157-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:04:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-32850005b6bso947520eec.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161466; x=1790766266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqPWSpC8t1ndXxUwrCDaURIaol2XTCo9QNkJi6Rc+DU=;
        b=KnukJNZOkgkoI2DzZKTkcPFX6aoBxxLEibs6qus9zpR4crPkQXRV/dm9uqxvftZOZJ
         LpYOG8eGrU+0Wv6AvauvPMpRcBlKScJ5coU8MD0Mbj6sqpNDuI0DzgsGjIf7liDrk8HC
         hHDmWra83aqbv1i+2bp6CiX9+Ofw06boQUBgWN3TRm+XChiOA7tWbJUVQMoUErJUpef+
         s7DR6ngEkWm7/Gsri9zT+aOkyHVYEOlRd13G/wIh947y6u/xZgdWjxusyM7fG1GmY57U
         oViSfuFBMNabmZXhYA8Ew2asONxPTSMvoMt+8+h36mqneNQStpbmapVist5a/p3/aC4M
         eRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161466; x=1790766266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqPWSpC8t1ndXxUwrCDaURIaol2XTCo9QNkJi6Rc+DU=;
        b=rEnJZSaIV5fIGC5BgGPNKxWSW4muhOiFHW3+z3U+kfyYEDyQWDCJjGsnwpgX4uLoS+
         EAWtsMzl/PXCtOoPwXe0l/si4MYGWXry0fJOj1cHkxCD28DxMITrWyRDCHUgTZKT8s+Q
         JvUQ10IaKo/U6fWH6OmrVvy6vmidZE6aXloHActpOd23+kjE2zOt6NeYFv/IqHR6z41e
         rCM07m2kAuPyIgEcvWYlg3BuJz7hQs2qnz7Znuw3R7qNmGfAyaL1/zvt6oawVwQjYdh9
         Ak0ReqdUhSljzcynqfX2tpM9Wd5VdE0vzyN7dDU8pDmiNDF6CRrF1zPngEPMrnomaiX1
         OBtg==
X-Forwarded-Encrypted: i=1; AKwUvBxilXu7jhwUDWD7dRGVGWzK5MkBqd5C1Tma24cpUezlDj56QVDalvJDo8TFXHGZ9mwLjoQabAnxUeQG@vger.kernel.org
X-Gm-Message-State: AFuF++mnjhRM7M1BRFJ+9ya5Z39UF+9FGTejeDNeQqJ9GcTw0dsjs5XH
	eF3JvePhZ2RK/f777bQIf+L/9r+ZI9E0rvZARUtqKfOcc0JJUQMylqw5R3OgPzQEr3PAz8D9TVs
	akf2iF/SY+X2Kj0Ads5E844zjCIFQYuxWbH5mnMK3vD0D9GpNxi1d45YojwvQmZh9
X-Gm-Gg: AYBFou1OsBvdw+1UheMdlRddili54sORaHPlFxG9ucyIArGhbfKfBJr2CYZPGVk/Sz2
	ais6Od3dt70dP4rstt3WQGB8L0OSkfwU7JrhDD0SqngREFuggBrmLSPidj/Su/7M1OxgcOsJryU
	0OM3ORrEB/AmwDsp12EP0KeH7+yyp30uX/8CbwlSOIO3ap4hWTvgR5q0bXkMxb9MM1FWt+jPq5e
	LS06DjR1tEtwjAg5q0OevGe5r9ndc98CKpRFqn8bHNTj0OCqkb0KWmO3u9MhcwgTHpI31dZcXwf
	lbUOAuRf/s+y9enOrWB1oRZTmCvMFTbBN+N6T7/NdGtNryWNL6t8RmvZCKqKG515CV7En48SUkm
	aI6BsYrGwsmJYHeT+lH0L/NGHkgseHg==
X-Received: by 2002:a05:7301:6187:20b0:332:8b9b:bdc4 with SMTP id 5a478bee46e88-33e8d9c99e3mr2410683eec.20.1790161465537;
        Wed, 23 Sep 2026 04:04:25 -0700 (PDT)
X-Received: by 2002:a05:7301:6187:20b0:332:8b9b:bdc4 with SMTP id 5a478bee46e88-33e8d9c99e3mr2410630eec.20.1790161464309;
        Wed, 23 Sep 2026 04:04:24 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:04:23 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:39 +0530
Subject: [PATCH RFC 08/15] arm64: dts: qcom: hawi: Add CCI definitions for
 Hawi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-8-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=5723;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=uzN87Bor3v4po2HRCTy8zumIiSq3d30Edi6HA7/8OwE=;
 b=HKUbHBO2YWh1omIj51o9cciIsCvJaFnbW00DAQEK7Q/Z/4rc28/6szbPbPIQAgALZtkw/Kj2g
 oo9YxXntkFYCw39K4VYYbChHVxY286++wvSGgzQEuHMzOFWAvpSDCiR
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: SYwf5zJWJColEllNofReTSX9wkrcsdVo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX+m3881gflALY
 WIjSYKuJQeTg7Oh8uyWgLTKVuliRq/2wYt4Ky6pQ6j6sdIOPb8vwWqIFauDlqtlgqcWL62qKQap
 sZGyZDycWZobIrQ6x6dphIxbfZS+g8o=
X-Proofpoint-ORIG-GUID: SYwf5zJWJColEllNofReTSX9wkrcsdVo
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab3b23a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=X2WgV2rLM5XfhhVvZvYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfXxm6uy15qTqHP
 ka846PfZ2JeiQEvR0p/0JEOHKqhAA91AGcOWWoLLw9fL7DMRQ75e4qzrkEx6gLdEAibtPvn/dJQ
 VO59SjdI35D/sVnEcy6kkEZt7dRKKSrhIsSXw57UwlcQnEHcyQmE6hGZzEWhXPTE6TEXD9iMX7z
 ms4kIV/zj+LiIk+u18vFGB1MuWgtQ7+qx193o6ZwyH2CjqrWCpvbTCPo4pbM3jEP82za8bhFAL1
 DM45sCTAGWPamT0Y2HfAjowkZT06wBsJ5VDLlMVgjqXyV2iLOa3chrhkbt3PCX6mtvJWFMXL4ir
 OJLi0Iak6A2RkDv0TvUFwuQhyjywisMUGCPmaugbC7Q10kAG6njYnEotLzqIOYGXj7yQ4M6mWpE
 qRfSxtMbJkLaZe96BHL94mf7CGTFza9YlumAAj0SqTZ/Tbusrloe7pHyu7ESPuw7iLOGbdqexRq
 06F8ejs8U4k4IDetaeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Qualcomm Hawi SoC has three Camera Control Interface (CCI). Each
controller contains two I2C hosts.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 194 +++++++++++++++++++++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 2e3286f29d7d6ed007289b5e04fcda34dec93039..bc7adf10bd4653cf50527a1ebb38518c66dba900 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -4064,6 +4064,116 @@ camss_csiphy5_inep: endpoint {
 			};
 		};
 
+		cci0: cci@941b000 {
+			compatible = "qcom,hawi-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941b000 0x0 0x1000>;
+
+			interrupts = <GIC_ESPI 490 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_0_default>, <&cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep>, <&cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@941c000 {
+			compatible = "qcom,hawi-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941c000 0x0 0x1000>;
+
+			interrupts = <GIC_ESPI 491 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_0_default>, <&cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep>, <&cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci2: cci@941d000 {
+			compatible = "qcom,hawi-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941d000 0x0 0x1000>;
+
+			interrupts = <GIC_ESPI 492 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci2_0_default>, <&cci2_1_default>;
+			pinctrl-1 = <&cci2_0_sleep>, <&cci2_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci2_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci2_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		csiphy0: phy@9523000 {
 			compatible = "qcom,hawi-csi2-phy", "qcom,kaanapali-csi2-phy";
 			reg = <0x0 0x09523000 0x0 0x2000>;
@@ -4602,6 +4712,90 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci0_0_default: cci0-0-default-state {
+				pins = "gpio109", "gpio110";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				pins = "gpio109", "gpio110";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				pins = "gpio111", "gpio112";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				pins = "gpio111", "gpio112";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				pins = "gpio113", "gpio114";
+				function = "cci_i2c2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				pins = "gpio113", "gpio114";
+				function = "cci_i2c2";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				pins = "gpio107", "gpio160";
+				function = "cci_i2c3";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				pins = "gpio107", "gpio160";
+				function = "cci_i2c3";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci2_0_default: cci2-0-default-state {
+				pins = "gpio108", "gpio149";
+				function = "cci_i2c4";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci2_0_sleep: cci2-0-sleep-state {
+				pins = "gpio108", "gpio149";
+				function = "cci_i2c4";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci2_1_default: cci2-1-default-state {
+				pins = "gpio115", "gpio116";
+				function = "cci_i2c5";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci2_1_sleep: cci2-1-sleep-state {
+				pins = "gpio115", "gpio116";
+				function = "cci_i2c5";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio0", "gpio1";

-- 
2.34.1

