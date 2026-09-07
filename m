Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E44846C84A
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778296; cv=none; b=uzyFnWO/+GG64z7Rj3ds4P9mxFBZeFBVqJaS0PeAihabcqU20JVwvpaevzBwX1Bqml4pXm/bO5EIxRxe3zNdgcDQN9tM8uu1S7CzhKfFxwUCDODuGuZPNc3vXK3bo4Xc85motRjCQ/3YY2OF+sHpH9VUFiF9Cy7TepeeGqdLlaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778296; c=relaxed/simple;
	bh=kOCFhhQ0VijDiYHFdxbLlhsq1O5lYtGN+9F/Wbv7TyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LXcX3NuYqUt+bc8b49GOjiQ6ZiJsnku3BClR1mOFCZ8JI7gWNvmjiMdGjnVUTJijkIMuBxJJ4x3DYXLNWMXWbQR1x0ygcSWpz4bo3wUbtUOWH7KswUIUUna9Tns7EGWVob4ZPXmjl+6N/O/43+AnSZjcc+nMtc2uMu6Sie05HHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0omYvJa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iwg9wsaj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0omYvJa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iwg9wsaj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnAwn4064246
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 10:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QWbxMpa5nhV1kXJg4CePUUc7pdXqjJ4vwZjQZIPaLO8=; b=p0omYvJaxSIdW0gN
	BNxAGij8whOVkqITZNP3MqRlQMPWofwSUmAb2sybnDXi+kvzLvqWBjTOz99AS99p
	8OrrldqDzZCmzN1CLwWy2j8KDBHVGuBOHJRs0BoJNswbQIddLhG8PgLfNt51llZy
	XGamVsweidCN1EdUhwvO7G5okBx9e102YGyRRrKYv5gNkHS6d+Y4CywcwMkBm3BR
	UTiGdTgCIzodOImSLNr2l9RZ+N/a+axFzYmMtbc9Bj3xq+3B//0SVxsjTAnb6+r/
	GKSEU3LfcBK9pE01qb7IpZuTKOhmmaI/BwzDyTFMzz2K2EuDMiQd4AVwOEVvvn/7
	4U7Jsw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86rtft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:51:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9394ad7f64aso567420185a.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778288; x=1789383088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWbxMpa5nhV1kXJg4CePUUc7pdXqjJ4vwZjQZIPaLO8=;
        b=Iwg9wsajIbDgG4IMrtL/LEuN5Qbnwxc2oOhonb/UKaGS8zOW4Lsh6VAdI3qS2KmuJT
         aUiWoVrRjNXeDdsqdFrHG26VNd+z7zL/596E+NpBL9WyGi0TtM3MoqDcZsMryE5CxLUh
         oHodhgWPps/nPjlFlI/SOvpzUuO5QW8Pi0qIfseyetI7fkAiBdzevZlDq8HCjNW6AUpV
         S6EU/sZln2VxhEl9rfr9MGQH1lZtJB+ONJ2U1t7lgSPmOCCf47anavmo0HIYD43uzk/p
         9FPjDds9e6AT46Po/QMta5FJFKHQ4tHcb1vpT/oxrtoSkJM8YoUIw5i5A4ycWuRoqZvX
         3tVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778288; x=1789383088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWbxMpa5nhV1kXJg4CePUUc7pdXqjJ4vwZjQZIPaLO8=;
        b=P87a2eUt8oY3DMLUcR0Bun2OojFamhxBw8RN26xNkOdbGujHYHAacIiYAnTz8Qj+7k
         cA4TQ/hwhJHHyOHerP4/IU/1Xc9rsmlM1zNvqoZeCC4VqHcUpWe/qzhdSAhubEw5z9JP
         87vcGQVkFUejzCm8YLsxtyknPkG+3onyMJeoq1WBUSty9ZbbxOzPRafUjRF5OnIOVNYX
         fSPluX59vsyNF5FbpyX3FqJg3Jx09AroKEW6HMlqRqL6OHL92aIoKXnErCZjCtQWxmmb
         SuWRWHvqfnwRlwBpuwt8NFqf6tMbZmCNWd1Aa5+LovFlHrj+QIyKtTHuahVP7LaRWy43
         bOMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMrSK1LuMJWaSo8+L9Lm3/Hnj8PByUJqBxdPZMbqJ7ftvhJDbrrN8Hf10xUgccwHo77lwElxO7lFhG@vger.kernel.org
X-Gm-Message-State: AFuF++lYx6Bi59VzCGZGVP26KLaVX9ctqdDRzATVkORw599RZeyoIZYZ
	PQNH71rhtiEGuZ5jy2vvTF/Bor//If8LZ4igEcE4uSBRDALay3O9g2k0k9pCPo/wAHnU8gQaBdy
	ysXzrTnADDR0FzYcGcp7sVYZ0aDwFczwrE/aqMCZobPNEIHZfwWE2cRvAkLFRBX3OtxPAGyCX
X-Gm-Gg: AYBFou3ag1OeaaRn4O8uhhNvLeeZiD7rtThCYkeW65vw4TEFFLIvJxFOdK/Gty+5erk
	PffTnxIMMIRIK80tOHNPfwSSmDTq5Y3vh7HzzfihLiDjIr0sjA01Nr1KxffPymZjsdHE2eKOtyE
	jeEButsMLM/Dyt0jwW/EDzdRA108Zda+cBBaAZy50/ejdfI+/Xs3hTqC67bYmWy5tIIJEXXYDns
	rAL7IJqd6h9PKDTVilh/H6Kz3C6A46Fk+N/LT+lZzMxIcCiHsfcywwrTWQX10XVYCQyZZSaAcZW
	yviG7S8O7Ahd4Kp9H+hY1KnN+uOeiA/4sR4Luw2fbf4etzAqCXzVKe/zn7b8J+rNZzO3su2G63a
	7AL8W3Ecn6i9hjlY2T+APqdMcKdwTd0sp0gqwloL5Q9UNFY7ZyfqaAnXelSUFMECKjxHnnLk8Ed
	5A98Q4xfQwdf7s5TLnPRugtV7Gb5brRLncxSCqUuVDNGvs7OZwG7o=
X-Received: by 2002:a05:620a:f04:b0:939:57ca:7e07 with SMTP id af79cd13be357-939802f3248mr2190093185a.10.1788778288538;
        Mon, 07 Sep 2026 03:51:28 -0700 (PDT)
X-Received: by 2002:a05:620a:f04:b0:939:57ca:7e07 with SMTP id af79cd13be357-939802f3248mr2190090185a.10.1788778288072;
        Mon, 07 Sep 2026 03:51:28 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm410263775e9.5.2026.09.07.03.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:51:27 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:51:17 +0200
Subject: [PATCH v6 7/8] arm64: dts: qcom: agatti: Add OPE node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-camss-isp-ope-v6-7-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
In-Reply-To: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: AAYqAKHLBn0AbUMaqAn-fDlKwWIfTh61
X-Proofpoint-ORIG-GUID: AAYqAKHLBn0AbUMaqAn-fDlKwWIfTh61
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfXyE4MIJGjZsQT
 PGwwS+pcCkHFdi4BVB2CQpsPTiS5mXg7zW0ZF9mzOKVo58YZ8aHwmYeJRGCrHqQju7PJtA/glu6
 NiyEC02MSmC5AhL6YH7I1Yz8PItcA5o=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9e9731 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX66fD1D3TQPmP
 4yo/DEs4vPL+UfDf4+pF0c4hoi3y3EaxK7WvzeJWwHgoBPnqSh0Lfmz5qWzBwLgR5x8SWcdtNKc
 Yg+ciXMRCFGrScqz9iu9HJpSZ1ACKOS/r2W2u9GDFTSNB+3jOGAAkikMReDWfbcXug292BeGbVV
 S2jpzEhmTuUY5CcxBx0hL7B9TLUvjFOWR/iDVssb9Ob/HiX5Rrv7bWbJY1ikYUd9BsSBX4M+6LR
 aqesPQMiQA4QFmOdOEWMeKEaFxS2165VP7REtFTQC6l6umz7qg+bYRo5rEf+DHAjiBIVmCSyGlb
 n/nbsWxcq6uK8jrS8waLIe3W8T+7R1jjZngZDTac89b/BTJ3UKhLPn+CwyrMNAlntW5pOZd9TUn
 b75Kfxh/J6dBfZHdY9w4fq4jonoGxZBV5lRptNg1lgZAdUbv7CwoiSMsZbZZR1hXdiRPX/Sowyc
 KRou3c8p39+55OjMAcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070118

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the five register
regions (top, bus_read, bus_write, pipeline, qos), clocks, interrupt,
interconnects, IOMMU mappings, and OPP table.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 79 ++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 397d61a8a27c2505833466bd349acc27ef4ffe0c..360faece59aa0173615eb4d9d06943a4fa623d21 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2020,6 +2020,85 @@ port@1 {
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42000 0x0 0x400>,
+			      <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c42600 0x0 0x200>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>;
+			reg-names = "cdm",
+				    "top",
+				    "qos",
+				    "pipeline",
+				    "bus_read",
+				    "bus_write";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi",
+				      "core",
+				      "iface",
+				      "nrt",
+				      "top";
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x800 0x0>,
+				 <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "camss",
+					     "cx";
+
+			status = "disabled";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.34.1

