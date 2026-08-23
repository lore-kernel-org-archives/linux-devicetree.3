Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138643B27E2
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 19:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787514495; cv=none; b=uRWqSYsqW4QucehdtmL3wytVLzj9Sy4hiccN/odXr7En64klBHXAaVPd/24NTJXU6cBC2Vm1BGRzeHINX1KPLCVL8OnolI7NNOYg8pkEJFnzUn6NySOgISrGR335aUx5RWW9Bke71v/jI77cgFvs9rw3WERxeVdMyYRXPCqmzqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787514495; c=relaxed/simple;
	bh=64Yx/oap9bx7pLvcpGavfWziESJkglcJnhLN1D4LXxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OGMXFny/2sKXxY6NItjZJyzmPmxwuVgJq6lxWoXnVAyQt13i6CIkwrOas9zFm3yoadHS5GjLH0kDubSR3NCpWF2MJirqGGDFVx967ZeEvRnybmCOfjfqNqnK/Ba8tT6fiB0U1jvZCLYwUpwK+epHgzZbdCLrfQZKjAB/QoA1oDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g3qe2F36; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPoSqhcS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g3qe2F36";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPoSqhcS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67NG6xZU409032
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 19:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iupV9vOqfaNe4LW/SncYaFTBIZ2zIXSFduS0Q0Tf91Q=; b=g3qe2F36j6MP6SKF
	uAX+PVAQfW0W1L56WxWjb37/iBu9awLQ5VbJbZKH5/5w4hCVQhNWB4AHYXIhsUpn
	3CHh480JaoeaxrhmmQKtK7YG0kQYA3qKeAEK29w+VPa3Zq1t6UyMrck7rC1NN0Z1
	X3NAHvcZBkUc37N8wzXCshN74fGotD+G02MFE7toSI661Jw5pJq+TcgUJa9Vy/JR
	twBUJNhjpjG7BmwmiT5/IlHJ0fAaZml8W3RLuZtmAT9zd/JcxHxXg9db1YRmP449
	TM4Q21pOw9/48zD4HMLW+65LIirqlxc6fCvL0jZy4Ue35Es/1SwzBCop15J9ZtON
	f/ZWwA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744a4c65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 19:48:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39512608fb1so6820859a91.1
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 12:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787514491; x=1788119291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iupV9vOqfaNe4LW/SncYaFTBIZ2zIXSFduS0Q0Tf91Q=;
        b=fPoSqhcSWSSPW4c6gLnT4qaXW/NJXeXKHNx9UV0SXadfom5OHngMtc/keNxo6zY+dA
         0rjotFT2pAnyx/pmzHZ4I2UO6E/SwAigXe3CsmOjxvq7bOCkxMKhAMrKTdja2yozWN68
         D6okLgwQA2lXpXruKCx1739hT7uNMVo6ZU2uGjhGhBKUt9IzHSl986Hh34eNp26lT2dR
         Y2ynQgM0vs899drNFdyL2pijI/hPnQHYzhEmy6eJbgbtbEsNOGKcAQQUfypxL50PxwHf
         Ua2Vjaa5I6lF55CuFWQvq2K7THQOcrADG8JytsiumNbkl3fE35DoJRed0iEEpG/fTC3I
         eVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787514491; x=1788119291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iupV9vOqfaNe4LW/SncYaFTBIZ2zIXSFduS0Q0Tf91Q=;
        b=O7lBSKaVialKKaiAe/meotGdqca3hOo6ppBOEqizHX9pjif39+QvEE90je36c2wPn4
         Bw/C9U7NQwSSjMefU9gbEKbiwYihPtsO463562gD4ZTh8EG8I3N8FUjXp/jqx3K+uwKD
         S7m5MMQPn7VGxa2zQTdXuRIiahDZQgFyVni7M1XM4+lThQCyMR1T6G9r1qOiGx2DXwBP
         bwUX47O2dOfWEKeN4imbZkHOS/Obefvbi8dJr0vMbjlXZpVujq3dTjKSd8ajz5ceK961
         rL6ATk/4mkLCnvf724iDHUx/5FVwxi9jffl9TBc1s5eLSRzukX/yl7amnv21qCdB4HBu
         yJXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbP1RrKF6TdO3hNEmm37dtvrWbpTudNwtbnL2nV4xX8kCa7Du/U+sf+6jgzj2IFxFvMegMw3KNQE62@vger.kernel.org
X-Gm-Message-State: AFuF++kF9O8UkFES7OtT+j4quSF+rMAo8/srLfJrCl+AmHLt+/Bt4M4V
	sZFD8TjLt5GMs3VyKM0XC37GOWWaVwrXQXkuFWl4hl+NO/HqlXYDGDnb5n7OYSFxpwHRRw5r3TM
	zk2OWDnOUDYIZUp3fCiyr4NO45Ozc1o4fqXW2w8K3ykTl8INfyyyGDI99GpCzgOvf
X-Gm-Gg: AR+sD11UMaVWwEp8lSyPP0rbYjiy+vVGuxMoUHJIZ+NJBcI2oeAML7DEeGY6BU2t38V
	dE3EqXPHLMyJ+xZJuGrHzT7eVtxLGTL6yQJVcKX9QRWnyLNC14A03SYqRZX0sbW0KSYat9X31Sr
	qNy2XJgFyyDLehWf9bU6kXZolW0JPBb2HU6GyqXDD0ECyo/OZ3BA45NSrGEDnMiu/7xxPZqLVtZ
	Ee0a/rCz/ok+xseL7NVVeG93HgJi8GaoDOcahKqPDqi/gH7bCP8p/pG6T21c4K2IpapHXYGNWr/
	tgf+NkpKwSj+aJ4uJGPwT1MtX6W7oClVdiM01ghPdqZ/sAWPHW4N9z8okzdUsqYm0Hz3f9Z5mhv
	9Oy5EY5QWQNwZgm7Wbrn5SkkDGyWc7p7Rayv0IQ==
X-Received: by 2002:a17:90b:2712:b0:395:543a:cf3b with SMTP id 98e67ed59e1d1-395c3518185mr40793795a91.2.1787514490596;
        Sun, 23 Aug 2026 12:48:10 -0700 (PDT)
X-Received: by 2002:a17:90b:2712:b0:395:543a:cf3b with SMTP id 98e67ed59e1d1-395c3518185mr40793752a91.2.1787514490142;
        Sun, 23 Aug 2026 12:48:10 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f925190fsm32321623eec.31.2026.08.23.12.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:48:09 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 01:17:41 +0530
Subject: [PATCH v12 4/6] arm64: dts: qcom: kodiak: Add OPP-table for ICE
 UFS and ICE SDHC nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-enable-ice-clock-scaling-v12-4-09271f583dc6@oss.qualcomm.com>
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfXytkkmSYZb7A/
 Unu2t+Ko+U6Kio/R5iAosUbXU8SJBbqiHFZIlFtkJ9pGUeCCDKddBUWcIYxDHq6LFW1bIxt8zWp
 ICaci8iz2YE1oWjqHUUyRPrGMwIUKSM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfX93ZFDFedoWlb
 d1PtwCENfi33ci8EA0j2aTNWPBpFlGECQDCV/XysRGuhNcuSM47ZfjX2tUH3HqeY3fP1Zuy3o6A
 KINdvisxDtyGns4Fj/PsdRoVfLD5zp7oh/nafNK95EhtduTQGOAwlzXx8wPBIyl6Js5/XYOPRDv
 KHxjVVbjCGKlTzW3+XUITIeNPqIZwJAWogMuFjo0lGsR6Ey8124VXAsEGy7Yosbpka3qBn3kZez
 3rULygZfkSNISGzNVL1QnMWe+ORSTGwEpCbJb27Bc2HF01q5SZeS6tUEby46aE2DbwZz+l0shTX
 Kst9Duk1fGOSDcSsw4pG0wmowuzoieEByROUWEcD0WOFy5MsPGol4uXJCCPlLI01sCOC8x7/5r2
 03lxsrMQ2ruL+qwAR3ixPwnFsXrIj70FGPOOqVdvfyaf5QFCWkBXYvNGtvoTpUOzOhwtopsn2MV
 yBcQiIqqmLUj4VVyoFA==
X-Authority-Analysis: v=2.4 cv=JPILdcKb c=1 sm=1 tr=0 ts=6a8b4e7b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Gfx0KCctoiflwLzBlNcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: QvHnQSmBRgEP0ThNwin1_IKIzmrbuuAI
X-Proofpoint-ORIG-GUID: QvHnQSmBRgEP0ThNwin1_IKIzmrbuuAI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-23_06,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608230181

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE SDHC device nodes for Kodiak
platform.

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 3692be65cc21b2b13a024d26c05b98032488ecc8..ac3e458ef70fd2e68650505b402d1ba924fbfe96 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1087,6 +1087,27 @@ sdhc_ice: crypto@7c8000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmhpd SC7280_CX>;
+
+			operating-points-v2 = <&sdhc_ice_opp_table>;
+
+			sdhc_ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
 		};
 
 		gpi_dma0: dma-controller@900000 {
@@ -2597,6 +2618,27 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1

