Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F147F3B14DB
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021785; cv=none; b=FMVAkVDiB0n46QWcwa46MzJfD/tEF6/JnWRbfDdWHVSQRnzKGztWHCbYV8Hav8CHR+u/QDpgytvXS8S9CnypxmzK4onPmBQuzor6YjPIVDyOA/d7Fvw7s9+CpSmgTMGyfzwTeNoCeqRVRZpuHICOcpsViuN7jBeBVgzQIQyWcpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021785; c=relaxed/simple;
	bh=SeMHQ2hd9piekHYmbkCfwtXupgl21jV0AZlQflkeoo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ayZef5oC3C1op+bJ7Bwb672Q1t/KWOxvulR/lcGVginAtMvg7vZnrTLt+hYIDA13LG+oR5IetBzA2vqs8G60N5tbo0byeRk6nnCpS5CVb1w9bohl5rjoNgJ+Ri2wofPP8CDfMYBbUhdZ8ruhQkdNaWkzAE9Gq4q79LPyWiQKo0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TOdZnM1r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGYgtywc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOdZnM1r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AGYgtywc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClZWa2183118
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 16:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NEsM5geSJx7r9+ui4cXhoCdcaAtYGtGt0TWvN9cfDdU=; b=TOdZnM1r2bC54AbF
	cAXQl6KB+etV9vV153azLc+Hz8uTadbfNyPD+DmkOOjgHd79bk1wkM7uODmsJFVV
	YZ10qrbVZy1ncDMwa91TRZoWa8PiIZ4rasXSZUkNaICKnNn/htPz+/k4ldCFwgUT
	sdUdZM51GC2en66TeDOtEpEDE1uJuYTNcn26lGACqWTP5FmiRPM/Lbb7uiO+T0da
	23uXF4phM+He5hdH6xapuvjZ86azRBbmQHiDtfYuLuDmyf7ZB0m3y7wrIJjgszDu
	96+XuMIiIYOR4UcrtIfGki7rv4QYHI/ECbOgFHiomcWN+qirSuiOe5rovypWhuYU
	NX23mQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenraekg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 16:16:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0b35fa876so69964295ad.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781021782; x=1781626582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEsM5geSJx7r9+ui4cXhoCdcaAtYGtGt0TWvN9cfDdU=;
        b=AGYgtywc362trBVVu8Q/wcue8MrJ9USp/yGz803ZNoCpwh6TNmYhp89vTCKgRJ8Tel
         A8fsUblnNzlCtUY/WLyL28zGcaFX4XTco53vXjzqWcvrWlALEEq/7VcWCJe23vO9LOen
         TClfaE118fL+UAz4A8xnFeJA4Xye0ZFUnFClo89s9B1/kmKhir40pQaXYg8easclmmWE
         x7uO5XXQDIUI/uVt97ohkcXoNnUZJra6A6uUc+uItGv9NgmvxvbT1yO4rizsDeArCxOC
         qiekaAO7NXQBulhtVGiIVG5oLmxHF0zRfaaRyfPhQg8Cm14WrT16nDtzLERFc/zlnNtp
         xORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021782; x=1781626582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NEsM5geSJx7r9+ui4cXhoCdcaAtYGtGt0TWvN9cfDdU=;
        b=tNx6pqcnno6rZjv/sAHx0W4YWHHceOz6JYxZePteJAYZ3erAu8dKJncSdosjm8gfhg
         yl6vVPmHBXRHW+AP6BXgsHqOL/Swbp1/UiBEH6g1Jn3/iNy04p6CiG8ePO4RCLsFvTMc
         IcfCU6TjvJWtNV8d6eT7rV5k4r3L7Fwfom1w8LiMGlq711VtV+/YpFgccLRhanVjY5C5
         pYZrP1DCLfAXEc3gak7fFahsmJNxAgW5QQ5yLEeKz2yU5at+DengfBHld1nmpZ2FoLhY
         8rf+QckEyKULvLK2zQtFJRf6Wtn5+CK8TiZ6mxLWFfFRxc41f8aHCLpPNhqm9jtdgkQJ
         +QIA==
X-Forwarded-Encrypted: i=1; AFNElJ/NM1OQMLaHMk5ofDw2aMIaEnBw+rAUIunNNKBCz2j6KlP+vG65NUF5jg2X6pnxwIQCFPpJRuC3BXEk@vger.kernel.org
X-Gm-Message-State: AOJu0YwcEA4QumzS0l0evawkFmfCuZ3iTzLikye8+OAYqcRHRO/ACdsD
	UA3tIhQYWFoE4qFVsriNf404e/1rkJkD+t5hGRr+5ndbBbUweRUTAHAVJLtNUrL4fAnckK1+vJ5
	m0jLrpH0Eeql58uTuh2onJk9eVIal8eK6tzcCkHcs6cUTNz4aCqCKjHa24H/pHfHv
X-Gm-Gg: Acq92OH6+Pp+seGiR/W19KklPd4yQUo0piWOAIQbYvKXwANAwDpX0Y6R5WmnyaUbWE9
	BhfSEK5yGAQha8d0qhfU82km1CHWyweEgvCeyqJwdJK3dAboxFV27zXO5610O/0pV2Thrl8pRCD
	1FohXH7zcYJZmwyxSavo4uw47DCPdceAPA0lIFg7BhoQqsozurUGnl5WBxAv1ID695/besZW6zn
	3BtGFTCMxytzzBLRXqu0vRTWTqV05Sif689r5rIheMuiO0yg/iwKTmZjrlid9qyZmfQMJn+j6OH
	bKJwyh6y0L8d+sIYNhotwrOAG1eIFpjHU1TrRHTePMFEES9agtZNQuIBsZ/5nUSt3bogtgRJv9N
	+yqU8CGwkAZY3Pc1SoF9XMkJP4to9E1weyGwRwcm9WMQZZwB5YAthMyTGznLS7zsKu1c=
X-Received: by 2002:a17:90b:1d49:b0:369:1dcf:4a46 with SMTP id 98e67ed59e1d1-370f086eacbmr23196346a91.25.1781021781906;
        Tue, 09 Jun 2026 09:16:21 -0700 (PDT)
X-Received: by 2002:a17:90b:1d49:b0:369:1dcf:4a46 with SMTP id 98e67ed59e1d1-370f086eacbmr23196273a91.25.1781021781302;
        Tue, 09 Jun 2026 09:16:21 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f711e52b0sm20391897a91.15.2026.06.09.09.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:16:20 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 21:45:41 +0530
Subject: [PATCH 2/3] arm64: dts: qcom: shikra: Add Iris video codec node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-shikra_vpu-v1-2-3a32bb38b080@oss.qualcomm.com>
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
In-Reply-To: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781021767; l=2734;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=SeMHQ2hd9piekHYmbkCfwtXupgl21jV0AZlQflkeoo0=;
 b=8sqWNhZ55ELFDqp3tcm6eGUmS3CCVb8wag5VZYLr/ynKFiRzX2Cz+jprGsrR3QdTozhCQQ3QY
 DxZeOClK28hC+0puj2vMwWajvsk+5e4ObZBAMHTBwkcjns06zi5hwan
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: 6q98U59FyvY-sN2erp3jF9uGf_JeDplk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE1NCBTYWx0ZWRfXxho390xLPunN
 4bR+yJa5OX3TEhKdu19A/PfPhv9FFMmowGw31Uo/D27Dex13e4Jz3FJRprFJ/H8pKJweiSbQXbp
 U83weCeUbsCOpPmuf4nfRxBaxSnHPcDVrfEx4r4Spldtu+h995MVQKMStL0trkIVGJMLD6FjofW
 UWX9YUyI7Btub/cmzYCH3ALigZpF6jP836GF7T5pswtb4KHFm4Lg3t+Y/rnYAzEEp81Qht1nOqR
 0G5+u8AIjr9fpo97Mq4aUVu5YNVs+3BN7Grwehe+5++OgTVaURRUuQTCX4ipfc64TMeXBeftWWD
 HnLlppttGz4gmwJAa1PzmNZ53hdsuFDBjgTEQsi54KTPAKWVMydIKGLNMO66QYlw6SwWW3P2UIj
 cKYnXYfv+T/lOA4USpFPY+ZswJN0PgDlXJSF1ua1hzLXReV31c0pNdvj9gB1Nc+tHFublOc5WI3
 WC3tNtPgoqirWsud54A==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a283c57 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=R7IlRtgiQXbz3SMwMBcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 6q98U59FyvY-sN2erp3jF9uGf_JeDplk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090154

Add the Iris video codec device tree node for the Shikra platform.

Shikra reuses the QCM2290-class video hardware and programming model.
The video node is added to describe the Iris based video decoder
encoder block, allowing the media driver to probe and initialize
the hardware.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 1ccb0f1419aaa34d32f3c3eaabdb8727a497b501..b77cc9d7d65a6876b4aa058c4e0de8c89cea81d0 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -655,6 +655,67 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		iris: video-codec@5a00000 {
+			compatible = "qcom,shikra-iris", "qcom,qcm2290-venus";
+			reg = <0x0 0x5a00000 0x0 0x200000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&video_mem>;
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			iommus = <&apps_smmu 0x780 0x0020>;
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133333333 {
+					opp-hz = /bits/ 64 <133333333>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+			};
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.34.1

