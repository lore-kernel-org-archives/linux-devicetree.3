Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFDA4657D7
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124700; cv=none; b=c6a6b1jmN5+nPvXOGCOUYI+qY1sWM4P9fncXJTMeQEWqSRaY5goqncPuZRoiBEI92A/jJ6iODLNfBDd0krOz4AIlDRlNZs3qMEdF8zvA6aVAs/T3W1gntmc8DwdrZcfMZhoBOzv3iQGkHcrJOB7EcCZUvZAybcfVfjhK21w6j24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124700; c=relaxed/simple;
	bh=ThEpJZbAgvG9pFpNsommlTVzoWTwpScz9NRkCoa7E7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MSBxBroR3LT/e88n3bLDC0ZutRVy9CORElD8m546rkdCR4Zj3OXiksGSXXtxH6/NKJ7Z+kJPVYaE0EZvvFsGYp8yH+04FZwVPAaal8rRAQC+cEb3s5stWGKXjArBCRpXposNnpcsiUoU/1rPh9HYiYQe9OhAUMayomRnJ2UKLaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqlTzEc8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBSERJR4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqlTzEc8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBSERJR4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3cUV3664316
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vvV4pvswORAcEQzKnup026bCMWgfqp/zeG31LYavPqE=; b=lqlTzEc8uu+6lhsR
	p0PT64rERBqTMNOoaJ29a6OamYGcs15P0W1NSl5jmBE+oHGAuy8whoMotkIcVCLc
	sSLOiGyW7XYvwbNFsQ3G/Sf79WQivb4xRCMEdVHKzVdBfIRJDiRxX2m4LMBPXptr
	cYDuSJj8QUQ7N69uGtcVMQ+PjjdmFqg51rjRsf3CiE5X3mWY02BxVbsPtMf1Ce1/
	hkOXNPCtxk8eOPhqDbG6ChlI+02IUqWdO0ytswLBGtEFWYIkPOw0F3bD/ZLTFH0T
	8tGN8QEdcfwEm+N7ucXDUu5sOq/wAogG2UTBylrv8Zd2d+gYlByf4I4Ohbq0aaB6
	NB0bxA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mm28j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:11:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2caf4173b1cso40039765ad.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124698; x=1784729498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvV4pvswORAcEQzKnup026bCMWgfqp/zeG31LYavPqE=;
        b=KBSERJR4EibAhG5nqLAnNzfc8GZ/luHnRWfrz7dZH++ftYHBw2FU08Epx2jOT9ENa4
         Cpw3R7CBrgI9u5P1Lc5S8tFEn9gbK9vVfYLGG9Y/9fNTkVCdfmO9v+L7RZ9aNBi67Fy8
         nyM20QHGuxcknKmpp7slied6ET+SYFz11Q3lZhWaJwpaD4T0Kt3Jcjje47tVfa4AuMIk
         u5D74Z4DkZqWjWx1YzChJzwYTjvU6dHBPCX/AxG0eHGMOzzI0ENF/hWk6daAZzMxRd47
         Schef8Qd91F8nfXLFcP6BFWSsYb6yq/XA3DQhZ4DQpbNymm9le+123HKbh/X0d8MCrAP
         n/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124698; x=1784729498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvV4pvswORAcEQzKnup026bCMWgfqp/zeG31LYavPqE=;
        b=tZg7wiL8iDjTlqlVJW8OrSoQPNVIVEu8oP8iJU/rY1qxFlEq/4gW0GbeFq6wmBau8T
         vP9c2xOFdU62pmc4AsQ/A8fErksS0JeoLPn6WqqzsDVoCpoz2OVo4nFSlW4MXmnvX9xD
         HBgsajiONiaQXgi6GKFlo5mcmT7JwxVmWO96tlV8pyEHw2MAEuLNi/ykR4FHtM/03CaK
         bbVz2f1abxuuIG51SRhq9yna93RNFNGXlTeQPgG0/m+MVAFE4cuIwZ5/dPQAlL4dS5zS
         uym1V/JQtH/Niyn5XK+FNFKqnZM3gE7iOm94ZEA9wJGgfxV1pNhhwdmyj5tUcZTfvTSp
         P55A==
X-Forwarded-Encrypted: i=1; AHgh+Ro3/lL7Y2+K66MkWSnCMM3a/wEYoOLpyuv5C0ZvMoXB7ilxW3v2ECgN2r1tp/wr8Z0uqkPZf/r4zHRY@vger.kernel.org
X-Gm-Message-State: AOJu0YwtO22/oP+XFIndMO69en19pYIYzSgUtTpk51AKuWgWT8WB2f0j
	wRhJ9z6J+svQfeVIbA3F4svY7YzSZJkefNAZIErzJdMuX8LdKp8+D/juiw/RYVLYx+wEwdAm1gI
	9retPbaf/RK36SzoA8PnmnLnQmzjQ+chBLLZMORfSkLWrLS/d4GaXGc+Pm9nKkt8U
X-Gm-Gg: AfdE7cm6AjRkiWrBf25sBW8bzxmDPu5ewKUBm7832KBZ/hZECJ8W1sz08gUrCyVmGQ/
	LDqWBjc4BpQf+87qhPM2xVx+1q4EV62ULyBWCZAx5NcTm1+0XUifpTJ7rGJgb/0KFndDiwrok26
	jAF2RHBsoPEZfJ0x/vNFBqBHdOtja3Q7FjMECCkJGmodHUaGr1Zpr5giB2gVAN78jPh8zsD2fsJ
	70HvbdIThtwoS2BH6BeRJQ2gGrSlpWxL8voG51cHRH6ZesUbbe/PSEE3Wer7A4Xf54seSsIRXaO
	ERn4ZuNlIu8Y4KesTqHwzoKj60HaxjMDm5fxGqsvhIDIM6CCrb9fmAo9l1/kjbD9617leFB4SUJ
	UADkmaXy3QsgSt11zqG2CFEbXwDAejF0pTHSsJBV4NjuT
X-Received: by 2002:a17:903:2347:b0:2c9:e961:d256 with SMTP id d9443c01a7336-2ce9ec0f113mr171957685ad.27.1784124697710;
        Wed, 15 Jul 2026 07:11:37 -0700 (PDT)
X-Received: by 2002:a17:903:2347:b0:2c9:e961:d256 with SMTP id d9443c01a7336-2ce9ec0f113mr171957285ad.27.1784124697088;
        Wed, 15 Jul 2026 07:11:37 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:11:36 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:40:07 +0530
Subject: [PATCH v9 13/14] arm64: dts: qcom: glymur: Add iris video node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-13-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=4709;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ThEpJZbAgvG9pFpNsommlTVzoWTwpScz9NRkCoa7E7A=;
 b=9ujYTpL9Bpg/XiFkL/oBYJbhhOvFR9zlKPdFHI1S6pIGQONr89kga4PtLHFj0EE4yrzDsfSGf
 vZClSs2ZlvwB4pDrCWWJ2drTRWol8wh8HdgdZllJG6oDbuMKh9gvFac
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX7yKi2vRDcpZ/
 XzbxabO0+1F4R4xp6bSKScY9BJmm17skBaJMUtw7kurketXaFyBB6DPZM82hyaaTX0VZ2Trdtl0
 j1/5OgsGWMho1c/DLrCYo/5u6AZGNaEqWiDI2jJpXtX5UNaOdoxwm/JHERwDalyOzkZBgKehpis
 N3wg7ckopUehvORwzK8+p0sZnHQLdIhd0kClB0wmD5PZp0/hexCKm8l2OkqUIsYmpz9rlUm4sy6
 G6xjBlodVV+VLToRB2YuEk0oGPZipksYslGKkeRyvsQJ5yx1wOkpPupeOyehrzzXfXgZEGtj8cp
 /uSP11Lct1yLsiFLv+iNeRmHdv0GW00N011i/GZ4oevNYOmQqh+IJvwaUqkAd0myxlYddSqCtsI
 5FS3hgSxxeqY3Rh1z/BsNF7GqplsOE/c7BAGEe5eUuOG+yQ/t4hmi96Zr0dMthuNKTA9ojIHYpF
 DxzcL0yNHqzWmdZBmtQ==
X-Proofpoint-ORIG-GUID: 5MzJI9MoH5dc2XvIfWwcZjn6_veNwStf
X-Proofpoint-GUID: 5MzJI9MoH5dc2XvIfWwcZjn6_veNwStf
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a57951a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6gKgyGQvtKUNEtbwe4YA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX7FkdiTNtw/K1
 XrxShXvHZLADb3A6HLcD4JZ0CVkNLweDRR/f66pLEaG77sRn9L0wMXoaBHnJgp7UXkNZaN4e0mZ
 cUkbh3MXYCnNFHLo/tcbwYozG1fSpHM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150141

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous platforms, thus different
clocks and resets.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 128 +++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 55d91c696a3a..0c09e700f6b5 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -695,6 +695,10 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -5321,6 +5325,130 @@ mdss_dp3_out: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,glymur-iris";
+			reg = <0x0 0x0aa00000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+			clock-names = "core_iface",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec0_iface",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "vcodec1_iface",
+				      "vcodec1_core",
+				      "vcodec1_core_freerun";
+
+			dma-coherent;
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			memory-region = <&video_mem>;
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS1_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vcodec1";
+
+			resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+			reset-names = "core_bus",
+				      "vcodec0_bus",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec1_bus",
+				      "vcodec1_core";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			/*
+			 * IRIS firmware is signed by vendors, only
+			 * enable on boards where the proper signed firmware
+			 * is available.
+			 */
+			status = "disabled";
+
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>,
+					 <&apps_smmu 0x1944 0x0>,
+					 <&apps_smmu 0x19e0 0x0>;
+				memory-region = <&iris_resv>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1943 0x0>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-655000000 {
+					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;

-- 
2.34.1

