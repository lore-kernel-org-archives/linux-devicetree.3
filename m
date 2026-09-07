Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA92B38737B
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775685; cv=none; b=ce9y9FzY4wwN3pPNbQq3Z24yMr5LojOfgiDoSK1K/hKrSQF6pnY/M03lM82DIa1XRcRPxXNH6EUOD/UZgXOb9mMxtZn94xULnn3cP6tMV+Q4zpiHrMAzME27VtjvQ9iGL0qJdrIefWjs3AWStugu9PW0pbpry3BT6eLnfEjwNYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775685; c=relaxed/simple;
	bh=uEZWjDTsQ+8roH8t5sOSrVp9ky6e0MLV/HPN49I//p8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRmo0oKPdyVjUDtVrNI6ho5vzb8fekVTb3Wj52bN6LHyipVYBUdewjQa2qgu3Kr9oRLitWOA1+QXtl3zqQ7nqRG/kzwEE2E543AcbBwOdpZQ+TC7beMBKYAQHvc0vIL/Ft9IZu+7K4jq2wcBzz7ofj440qBpdvAsxt5Oa9qAI/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tt0EcTZz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=klWaryDe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tt0EcTZz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="klWaryDe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bUBr3189564
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 10:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ku8TWsvVummAR1vyzmplfVablUDZN+ru/3S0kmxoUj8=; b=Tt0EcTZzDSyAQheR
	Mr8G2poosZwfqX+5+7JSVmA1l/gxL2GdhEp2MhFNd7vx0Es83WY+C6i0o9jF9ic1
	0dxxNkDk1oF21zkRD2kDtzlP4zUQoBN8+ThNlJKqXLeTmKZUljGHUk4eyLWbr/Xn
	S0w3AAPjiq+8YJ5cKzQX0iUA6i9L5CDnz9Q7XapSgaoy4jPZuDFVEsP4itlEM7Uh
	FuGOMGz+RNiKWd70EzylfOwp2Iuasn1cgJMtAyfpNqS7DhW1+6QPFyR07Lsv0eNE
	W/J2FAp2+7D/0P9PDBykghh2ib3y2aRy7//c6GvpB/ONGuTtfk/C3LXQct30/MEQ
	qhGqdQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx08eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:08:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso4100681a91.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788775681; x=1789380481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ku8TWsvVummAR1vyzmplfVablUDZN+ru/3S0kmxoUj8=;
        b=klWaryDelaM6HJMPlGbrG4I/sYh8N3KdJBe+86JKkNPzEX1YjbY6uOoGCQmAnrIxGB
         6TzN3Rte3AgIUzhoAF1Mg1z5IfAqmYutgeljR06w2dMmy7P8djql136MW73MNqNPFZO2
         TpoLZEXL+wJzxeEnrqQaGbspiyQgfJ/c/JRlmp4eAirCTdf17+OSLF5sgB67bHU1LJbR
         pKfVQ9pKf/fgzXE3WRD6GOxKQjy/vavVzFiDfSbOaow49aWR/Xbzqa8ImxPJSmnerbke
         N58IEsK41+xwRsBJGySSQ7SUYgFhMWznL4Gcm6HeIThbLEXC3uIrAn8OFjsR6lzEgAOK
         K/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775681; x=1789380481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ku8TWsvVummAR1vyzmplfVablUDZN+ru/3S0kmxoUj8=;
        b=SJUhU/cS8OsH0Z5oAczCUz5g2m+2iVuiHtRDayljb6ruQqSs2eXqSC3M+EYCvrdDU9
         A9JI63WztEvvSr93+C6mQlEQk6trUFlQQx8mlfm/sywAYRrryShoi0jMd7NECEeyykRy
         Q36LPZT5vqMaEnfHNpoA75FGY7VbtCdB76x+7uMq7SrFhJHct14vp1x6/NzUhxiAR6eu
         q72E1zKep2CwyzrQy/De3jvLPXn2ZcyGrJVo4iL1KP/x3LIhY/lOMdLzH9mD44dbBpcl
         T/7Cdu66xwGxzaNbBNR9emOOxXjuLM9u6sZrUFwV76uM3z7QGEQ8/K4HMarBjTAAv7in
         /a+A==
X-Forwarded-Encrypted: i=1; AKwUvBxdU6akPsHdd14vkZJa9ivlfvZyA9/qsPxdiWD3NNanD8GMmTmedg1/Qy9oE7pdyGXjryK+EY68OpEa@vger.kernel.org
X-Gm-Message-State: AFuF++kNnaHJlv/EiaTJ9XgaQCZkJW52kz3qqtN65d8b/E87xBno2nft
	+f07TXOGHHeEB07wAp+H1WDNm8QILy8Is1LTj8ZqTKK8qf36/XQ+WQ9ja1yO1CnJIgFFU12jJhL
	Nsct4qh8RYi9uvd8MkPYoUKHjSrGwZTq/x3pe3jCoqCnUU/rTpm4qMQnPfAyY7IY/3Yht+qEX
X-Gm-Gg: AYBFou2eu4C7DwtIHs2Wk+IM3B6L2hAJtQXgoisHopQ3mQPFsvxx1QQZQG48ph8WBYp
	AjzBg+ZrbSS2ueLjfIpaOhT871aLPMKo1tGcCVTFTyhk3Z9hfkvEZMotuFaY0BX+coeNyYwrDSm
	1EKKW9tLazk8G67JNKCfFgAYorg+zDcTjfB6hicQRadpAWprQw5bXWjDeItm0RlTr+w/LXDmqoi
	FK4KJ3BBB700TMccv572gqrN8xA1WNHraYM11eAdoLCOKgkH6I8G9HgHcclwcM2xJkw1we0L4lf
	Y8BFSkU6Y56YQ+5UjHHVi5vGa6+FxX+K3SfnEz7TjoM6d+zer8Khsj7lU0iBeA2DpMKk6y4EmMl
	u7SBPB9MkaQpUZOR2cwBpkwpM3YSS834=
X-Received: by 2002:a17:90b:3a81:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39b2612eaa4mr30668795a91.10.1788775681163;
        Mon, 07 Sep 2026 03:08:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3a81:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39b2612eaa4mr30668731a91.10.1788775680587;
        Mon, 07 Sep 2026 03:08:00 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm22891332eec.11.2026.09.07.03.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:08:00 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:37:44 +0530
Subject: [PATCH 1/6] arm64: dts: qcom: glymur: Add CAMSS and CSIPHY nodes
 for Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss_dts-v1-1-6c2ced5ea5f9@oss.qualcomm.com>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775671; l=9136;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=uEZWjDTsQ+8roH8t5sOSrVp9ky6e0MLV/HPN49I//p8=;
 b=zioPRw7RYGV9qSk5QCvaqwFlyCKrUuZgn1ZRvKIKlOJF/FSMNKuyjM9iClV45oNfo/c9YPELT
 RAYGfkWZfSIBXA1yD/tr/9N5FVYFS3UmXLwZHlrDGCjT3IS4dhiNaZG
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9e8d01 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JsC1sACRm8Jh_5Dfn6AA:9 a=CFd1BxUzzdwHJPb6:21
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: h6rwPXXSledBiVXHTQeeRY_QqJGBeauL
X-Proofpoint-ORIG-GUID: h6rwPXXSledBiVXHTQeeRY_QqJGBeauL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfXy+XMDJwKZPSh
 kH8fQ2g3MGcDDY8Fv/nVUN1fsZbmGF+LPc1KgBb4h069CcPxqqM/bdTPCHASR0Rz08a0a6076H8
 4x4Ops+4idCgYuMfuQKXXOGM3Hty9sY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfXwS27CXtHeGrc
 CeYIykuh1WxmwyK94xccMmgrlMDEmjPPBQYLh2dO60Sk6UvJQwDA3It8XG+c+6zFauwixPkDLS2
 uStYFQsX9Vc9Ma7Q8YN+yCGLeXLFFI90KPfF49o+b1AvTDpk2YgUBHjEMHA1bGuarFm9Dqwivfu
 65fzVurh5TpHZCcx3mRUT6ZBoBAAiKe/YCfLkYP3FBuM4mtfom0SvBHzR0Tj6N9yPG+q/wKP7LO
 3TD98sxoNOHiGwqfBMdq6yMv1SNjIoPdBZ7R77fBcjO5WfiXHT0n8lX4vtzRJ+wQmSTlfgyoZRa
 8hsKfrKvQsNnTPJFxpfs6KGzKkSRTAS9QocUYMCOGuWd4HseDN5uR0uIjcv8ZdeOqRx+IEM5bjj
 43wEqssxbn05FfhuVYt5s7z032fCBH21TA12QTpvBYRScatWrCwKXpI2ozRytdAc+xQBx3FNF0B
 aPD1E5yaH6QXQ80vliQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070110

Glymur shares the same IP as X1E80100, with three CSIPHYs that use
the new standalone PHY API. Compared to X1E80100, csiphy2 is absent
on Glymur.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 323 +++++++++++++++++++++++++++++++++++
 1 file changed, 323 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 624a9edd602cf2556ef2489c04b0f0203b312de1..c463cde46cc41acd7b8091616657bf49b38b7f9f 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -773,6 +773,50 @@ soccp_smp2p_in: slave-kernel {
 		};
 	};
 
+	csiphy_mxc_opp_table: opp-table-mxc {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+	};
+
+	csiphy_mxa_opp_table: opp-table-mxa {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -1842,6 +1886,285 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		camss: isp@acb6000 {
+			compatible = "qcom,glymur-camss";
+
+			reg = <0x0 0x0acb6000 0x0 0x1000>,
+			      <0x0 0x0acb7000 0x0 0x2000>,
+			      <0x0 0x0acb9000 0x0 0x2000>,
+			      <0x0 0x0acbb000 0x0 0x2000>,
+			      <0x0 0x0acc6000 0x0 0x1000>,
+			      <0x0 0x0acca000 0x0 0x1000>,
+			      <0x0 0x0acf6000 0x0 0x1000>,
+			      <0x0 0x0acf7000 0x0 0x1000>,
+			      <0x0 0x0acf8000 0x0 0x1000>,
+			      <0x0 0x0ac62000 0x0 0xf000>,
+			      <0x0 0x0ac71000 0x0 0xf000>,
+			      <0x0 0x0acc7000 0x0 0x2000>,
+			      <0x0 0x0accb000 0x0 0x2000>;
+			reg-names = "csid_wrapper",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe_lite",
+				      "csid",
+				      "csid_csiphy_rx",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 458 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 860 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x800 0x20>;
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+					<&camcc CAM_CC_IFE_1_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					camss_csiphy0_inep: endpoint {
+						remote-endpoint = <&csiphy0_out_ep>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					camss_csiphy1_inep: endpoint {
+						remote-endpoint = <&csiphy1_out_ep>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					camss_csiphy4_inep: endpoint {
+						remote-endpoint = <&csiphy4_out_ep>;
+					};
+				};
+			};
+		};
+
+		csiphy0: phy@ace4000 {
+			compatible = "qcom,glymur-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0x0 0x0ace4000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					csiphy0_in_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					csiphy0_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy0_inep>;
+					};
+				};
+			};
+		};
+
+		csiphy1: phy@ace6000 {
+			compatible = "qcom,glymur-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0x0 0x0ace6000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					csiphy1_in_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					csiphy1_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy1_inep>;
+					};
+				};
+			};
+		};
+
+		csiphy4: phy@acec000 {
+			compatible = "qcom,glymur-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0x0 0x0acec000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			operating-points-v2 = <&csiphy_mxa_opp_table>;
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					csiphy4_in_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					csiphy4_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy4_inep>;
+					};
+				};
+			};
+		};
+
 		gpi_dma0: dma-controller@b00000 {
 			compatible = "qcom,glymur-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x00b00000 0x0 0x60000>;

-- 
2.34.1

