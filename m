Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0FB1F30BB
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 00:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792195885; cv=none; b=jBe7P5hdjmIpAln8x95v4mwxEHZwpRrDVNy6uBK/FsiYdhmf2fxCOK27JEdz0ZbkmRUevVplF4IOtr8EYVy47HbnFF+zKav/choEP+Ir9TnLTn+Av2DyRNmyRhQJ4HTiRirVcOLqRyyQ4W3ZEiEkbchG81SV7qs1jkD6lgVlO1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792195885; c=relaxed/simple;
	bh=gIU4JmdM2CCRfRomzlBEIkQ0V1QKkJz8gjUrjz8Jmf8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CoMODzCfoyl5B6/cWqWN/w0BlHSc+vLIB4/BAd8Df4mZ4bNfzGNKDGmHgMn6Za7ir8DiVp0ZSaXCjK4QQqEyy+XI9PrDV85CadretN4yXQQLFGSRsjcIWKvTtrNbHUFzWVZo8GnAYldkMDEXy/f/WB+buksLrBivHTB3VUYe+2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cFEAlwsA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j1J4NO1V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cFEAlwsA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j1J4NO1V"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFlaL3323828
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 00:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zui/YxeP+Z4
	E2GLM7T0UElDR9Ti+KNAl7TJRjCokl74=; b=cFEAlwsAG7VM04vTxRvOaY5UwQW
	wDWGs9MZZFY4iuPgpx4lYjuA45/IoTt3Lp4TBIs7IAG3eoOEjCp4/y/e1L7EsQCo
	CkFhexAwhQ2TP7Zu5xaUcPuQHSNWExLpi8anZ1CEtvUfwJLHIuZfaKYg71h2RvV2
	Ii2F3FBThICcrlNz1e2jQ/LmxFYDUCyAbrKdO7MI6JN7/lKnWe4A2z+V4yvcGcwZ
	+sZZOtCCO7QuK0LFU+2Lam30Mg/huP8prSXH2DB2vM8JaUd3tcwo0AWeSD+uQmCT
	eG4Amsr3RSnHTZPsMyPWaSwxJQOdRmmhS6D2ibvXwiHcO0nvLboQQ71i1Ew==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhumttnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 00:11:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso633722eec.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 17:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792195882; x=1792800682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zui/YxeP+Z4E2GLM7T0UElDR9Ti+KNAl7TJRjCokl74=;
        b=j1J4NO1VPZMvBOsMdZObC6uuKMFgfyz/fwpWyXYAbgSPlkRPr203SuGf6133wMjuDW
         FlGL6J4HmGuX0L6ofCjEaWMtfPAeu8cQDjUD3HVED8mrdfWS6CYDinUmyGdgiHfZNfxp
         ccNfZ0x9zTDbM6KS1gRmMIg2hKuzrbu+5pu/u1fuI1U2Lo0L16Mc6535M26SRky8IP5Z
         uoiwuzlbCv5w53Vl+4x/4w4lhRfDEXvbRb1NhNiOWfmGcOeRELW6xtci449pam2Jrdc1
         SCKLXiFX1N2+dfkNDn+Z5BkFztH1mtn5pl8HCbNM57n4dQB0MdATSwqs0hDzfYixFRrn
         B2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792195882; x=1792800682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zui/YxeP+Z4E2GLM7T0UElDR9Ti+KNAl7TJRjCokl74=;
        b=nzCPPc1FPT6SHZV50ecHhbINHpszXUFGkjyFIyzmqIWcV6dZyq529jxV9+pUWQJy+S
         7DRlOtt3Il9q97SLLjW4uuex52X1neWvh7t66HqG2+NccLMYAI0wz4c1UvZ12OiW1HE+
         bf4aDv/SKFyfCn6wVSd0sVxX4QInbDxrhLeav39lyyXmWAHyy2ThJ09P91laQFjpBk+q
         9FZeMMiJMbfLnWv4Z9uvWgOCvUyCuNZHJzGpnPFvFuRBagfgbcJIPL3pwR7WXfMmUqZs
         ti8ZmfZtxok/UdyLg21GlKKkezKcvCGt8rZ5uikfoDKB2W2nEvIo5ie0IG/+e+sBO5wO
         amjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzer3Y0WHHy50Kjewni4XZUT3pDrl5+3KccahmaPBnuNm//crGZ0OZOWnoxTaWfdDNr9NiDrD46M27m@vger.kernel.org
X-Gm-Message-State: AFq9FYLyYIEsF8EiIOQPBkKYN0vNh1jNHj94wBltfhHtcBiCWxd6tIZy
	ioe0JTxk9A1YYUOVA1PnSS0bY4/Vri9zVhJg4ApqlNo5D+njsXjbnAjfYPLLcG9QEo0EdcSuRJk
	TmUvsh4TPIt7TdwYO1Q3paDFKjPyU+h8hVtIZNiputI4a2/m/CB3xw4Kqe0Zw0kI7
X-Gm-Gg: AYBFou3In8vwSvABR+jIInuU4YDsOD9Ce24/iBkKfPgolHIjRCDthg/tueb7u7bjO+m
	LLZiK+7H/uJjGaUvSyAVwhh1SU4KjVatCdQndtZIaqDPx+pxVgCElD2W+viFItKwx8LD/xgsqou
	DTwx8V7TTBdEZRxGIg/ODuRM3UWwprnZbd6bCyZebz1L0adtjfQZ+aqRmkiV+Xvo5caaN6poHx+
	4JkQDN2IEL2H4TGGvYM0pt4BCTYUjZSNOcjkJDaDBPM13KXXvXARDwqHaTZmgnAtiGEEB5QcqRF
	NCbOGwSOCwgjB9Rf0RA6E2cXhOWCOBuj6HNUGbPMmszI39/nosvPFmOYqWRIaALsmamcHMzqGL3
	ae3ICG7372xckOZBYriUMroloJ/76Lq/r+aBrFY5q/djHnhCyeI7tlQ==
X-Received: by 2002:a05:7023:b0f:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-18512c3833dmr2691558c88.13.1792195881884;
        Fri, 16 Oct 2026 17:11:21 -0700 (PDT)
X-Received: by 2002:a05:7023:b0f:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-18512c3833dmr2691474c88.13.1792195880530;
        Fri, 16 Oct 2026 17:11:20 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm13441361c88.11.2026.10.16.17.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:11:19 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
Subject: [PATCH 1/3] arm64: dts: qcom: lemans: add CSI2 D-PHY common-phy providers
Date: Fri, 16 Oct 2026 17:11:14 -0700
Message-Id: <20261017001116.2318647-2-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com>
References: <20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAwMCBTYWx0ZWRfX3kStHCLGgEhL
 GGDb8hhQKnbXb0BjSBcBAwqhcWV+P+HAntzhiihReCcUw30IpZAXPmRn6pbvCsw2LxrCYBMmeBF
 +OeC4hUpk0h5jwE+T6iOy/G0g5TrJLg=
X-Authority-Analysis: v=2.4 cv=H+BOUOYi c=1 sm=1 tr=0 ts=6ad2bd2b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=6ccVxqyIJSz3MSK1AKgA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: A5V5NFwwWO9NKtbKABkb7h2og7oHsYi-
X-Proofpoint-ORIG-GUID: A5V5NFwwWO9NKtbKABkb7h2og7oHsYi-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAwMCBTYWx0ZWRfX92zje0D5vZpR
 8K8aaBVgvvJ5BRbkA0IaCWhICJOPWIC2/iWmdd89PbGEzQ7QNR+mWqGGkCn16RbmYQurPDFJhdd
 jxrC+FRBYOLtq6hrWloDs3q+Hy9vv/AGkpP0AECW5WyUOkRNjPden4jJdpeTZQwbhIhCISj/pHW
 s3Ds5SPiXkMu5eGcEf4X86MqiUOUXcweEWWbIBv8oZLGKQav0gmXXtjH1vpPtxlD//vvfrn9iOl
 D6YNnyyIb6DUWMCNKbG6Bxf1ZIJU2iu8Sp3OuvbGkjlBetaXIihuqG9LB7eLDeT8PPm1nBrV7La
 96A7b9S7FA7tKi1ACu9eR1zC2uwByyIZBJxG7SoIhYbUHB8zh8zPmIuqFxBA0QNyWsK6Gl6Dcex
 c1JcIuM8DuZ9VQrkWHc333AAGVN0Kh6sFoT2n5B4WC8+U1+weaA9vkY3USMxvAu1zihUPFo5kco
 EFsSMTfkHTcIM8aJ1Gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170000

Expose the four SA8775p CSIPHYs as standalone qcom,sa8775p-csi2-phy
generic-PHY provider nodes (csiphy0..3) at their existing register
addresses, each with its own OF graph (port@0 sensor-facing, port@1
CAMSS-facing) so camss_detect_legacy_phy() picks the non-legacy path
once a board wires a sensor through one of them. The camss node's own
reg-names/clocks/interrupts for the CSIPHYs are unchanged, so boards
that don't use a provider still get the legacy binding.

The provider nodes are disabled by default; a board or camera overlay
enables the one(s) it uses.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 148 +++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..a92a06a5d486 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5166,6 +5166,154 @@ cci3_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: phy@ac9c000 {
+			compatible = "qcom,sa8775p-csi2-phy";
+			reg = <0x0 0x0ac9c000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "csiphy_rx";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy1: phy@ac9e000 {
+			compatible = "qcom,sa8775p-csi2-phy";
+			reg = <0x0 0x0ac9e000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "csiphy_rx";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy2: phy@aca0000 {
+			compatible = "qcom,sa8775p-csi2-phy";
+			reg = <0x0 0x0aca0000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "csiphy_rx";
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy3: phy@aca2000 {
+			compatible = "qcom,sa8775p-csi2-phy";
+			reg = <0x0 0x0aca2000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "csiphy_rx";
+
+			interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy_opp_table: opp-table-csiphy {
+			compatible = "operating-points-v2";
+
+			opp-300000000 {
+				opp-hz = /bits/ 64 <300000000>;
+			};
+
+			opp-400000000 {
+				opp-hz = /bits/ 64 <400000000>;
+			};
+		};
+
 		camss: isp@ac78000 {
 			compatible = "qcom,sa8775p-camss";
 
-- 
2.34.1

