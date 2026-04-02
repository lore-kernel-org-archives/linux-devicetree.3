Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F0437CD4F
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 06:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775110591; cv=none; b=QZmR8JzbNO1p61aq4MqovZ+1Tv7bAPvtzDTyGupQwl4pCnfEHpnQzo+PJubZsSOAdHkGqFCg0whUJY85xtzgXr2rVNgVaBAPZJVVQX2G/+Jfk62WelIRIaVLfNM15fUTKovZUl35J7vw1ScY3KrE1nviQ2jD19g6o2oAdr3Ax+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775110591; c=relaxed/simple;
	bh=SnlnvFvNXltJOABCkMLBX/l5jnrfqsE/n4a8CvOEVH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HbzNECYQvn3B8CABv2d5S9O2C+YpB6AONuxkDwMUdgHAjH/bsNe9i8VnHo/E9ME/UZ0vNWhYYaGvs32f+aVAH6bPbJ2jmwOKdK4xZsoCqGPwf8zz2VwmEwnDXxm93DH5hHZKYmOoEkioUeN1pw276MFLKv5nHDhl/ksMg4/zuM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8dFjbm2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGTgsw9T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8dFjbm2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGTgsw9T"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M3xwt3745854
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 06:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ptCIlP6pgcTOp7E0wbs0Bq+bVgH3nVEeZjcudJT4oFo=; b=o8dFjbm2k03WDcfI
	3QUkAjG9FXexlABQa+DeBY7YUlysHbpjm8zWxBVNRiyu1mQIMUEQvXZlSkS4nolB
	OwKoHdRuas7uXfKKtpff/uFkkFubvWLg00Xb0QIqmQz60BqExVOYHNY3UNIQdikr
	DrnSi1mmBOkGcQ1oKsJou41BLWtaoUCyBGAlVu1XeUPRoL6OYw/P0/GTGp9qaW+I
	FEVQEkJY9shSCNeYEESS8CrTWalvLsDwRk1OHNFJThKcI1iz7OjYL6KPEy5d/+u5
	DuVyn07nI4xmM8mOFYQNmWFE7txHsdOYrz8Dkzd4+uSOSNmRL8CkLNeuuhiSj7TP
	6POLTA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9324kph2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 06:16:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24611696eso3349885ad.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 23:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775110589; x=1775715389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptCIlP6pgcTOp7E0wbs0Bq+bVgH3nVEeZjcudJT4oFo=;
        b=CGTgsw9T094C/8PVe4PZvNyC5V+FeYWdkt/PCwCRbW6YVwuviksANrkwp/ist4oFAJ
         5unRBRoxuSYVjYaryYG+u5lrVWVxM+74OPenMOsLc8I8mqMZes4omv94Bl3PTPxq660R
         BdhBQeH5mmh2W32aCmU3J5DLn+KRGOmQ9dshkZ3Ce43g3y8lX1MGyn9k+K/aOLhJ8II0
         PQ44ueyHGmHrq80tjBDc2+0DRuRzgT6xZQneYrmCkQ2PoK1SJXmAn+MYA1/vHCiBnPyw
         /rGfqF8nvcHqxeWvfR2RBJiDTLW/fmoYhn0xPxVvHZESzuDw7PQgTVTNbSTXcBH10l9V
         ADGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775110589; x=1775715389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ptCIlP6pgcTOp7E0wbs0Bq+bVgH3nVEeZjcudJT4oFo=;
        b=QSVRMBZ+06e8x8N2MGHgUpR8hh9E1klGBFcUQ9RjAcdBldQwidYjI3b2YN4MGEsimq
         dM6Zj4MId/sT1WEGJY4MK48e17NE1oYjgZgc3BpEWWNCdPssY0D4jMdvpeA4MJ9VhXOq
         q6LWgDgoFwsigyCeE/mQGQpHh70YiP9CFtkM4TY2j7oP1CfsxjONVIJng6Uar4v2NyKM
         bMpc1kFQ59oTyF9/eg0ej/InQ9GpLGR5fijyBEFTqiJRVU+csUkAwqGjafBnCV6QF3eF
         DyJkQ8Cwl029SVk+Fkvk9wtbGQSWNG2TCOeVTO5Ui0Qf0PVhHMcf7zAsMJM2MfImoo5e
         YsFw==
X-Forwarded-Encrypted: i=1; AJvYcCW/wlcuOQ/BKj6F62802dfP5TeKc71Fi33r1IogguBVjcJ68ouZEmcS6NSkqdiusPaHSFrlXEH92/ms@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7HXabiWJllaA95DgUiV4aZekGydeo3AbRY6V0me1XyVYag4PW
	lsgMCJ/+dpdH/8k0tpSz8J5TrpdxBfV5/X0T1Xr3SrnZBEiaRccupAIyiU7zlq8TOWoWQWBvuSQ
	FoqWP64F8e310w4Q8bczbgUkRUX2hmN2NZ+/+pih81qMWK4RM/uq5eIJVrw8jZd6Jvv+9MFPv
X-Gm-Gg: AeBDievPSq94IJ/63XD/KzhkuWbz8K3EEsmBbaIKcPPtA+k6Z+PD8SlYoLUuIyQCkhU
	v+lA/hpU/Ph0CXceirBGg6AsFzYb3CHJBoUVAtJaXkKydN5shcex7eCIvqFvWQReW93kfWPZbz0
	F5lZHl3GvzkytHt1LtoajCmzhpINSj2jN5bP4CtfnkATyRbpwMnnQthVFD5sN+GfrVTo98RlDbY
	V8xuKPdOuzsp2VprvTNNXwnbJwoUeevXVskZhlPqg9omBUGBbOPEUjJsN6vGawwrZWHzqC1gA/0
	YHj+BM2s8DU134PNgyD12x6gIhefAp6uoe9CaBSfPzMgrHjU+mW3uDAsSULxi/IPEVuCHLOkYEP
	iS+BYReXmgb662Efnyd9zlTp/jVD8iysejvCHR6GFil2qibtXfuyA
X-Received: by 2002:a17:903:2391:b0:2b2:5857:6011 with SMTP id d9443c01a7336-2b269b066cfmr69582815ad.19.1775110588717;
        Wed, 01 Apr 2026 23:16:28 -0700 (PDT)
X-Received: by 2002:a17:903:2391:b0:2b2:5857:6011 with SMTP id d9443c01a7336-2b269b066cfmr69582575ad.19.1775110588259;
        Wed, 01 Apr 2026 23:16:28 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbc58sm16538615ad.78.2026.04.01.23.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 23:16:27 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 11:45:45 +0530
Subject: [PATCH 3/4] arm64: dts: qcom: glymur: Add camera clock controller
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-glymur_camcc-v1-3-e8da05a21da7@oss.qualcomm.com>
References: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
In-Reply-To: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: acX4orQOmGKT0EGyTSfUC5TNIcj4fpqc
X-Authority-Analysis: v=2.4 cv=TKBIilla c=1 sm=1 tr=0 ts=69ce09bd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3iLwGWznUEgL9WBE7MAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA1MyBTYWx0ZWRfXzHJZyJcky4vM
 SFUWgzX28SQx2ClwuSl3i1+bs5z58aQpQxitiQ/b93la4wFIJNIDCR7d3jI8hdbkvkoDziTUgDt
 irgq0q9ooB2dOw5FGGo6/2KlZemteYzKa6S6IMW6DzXoZGeKB3fsmhmcmq+/0UKsm8pGr11va7o
 h7LiyqMhWrCW0h/uR5DCYynXJO9yYUB7buzC5TBtZA8PXU56/SHeUxbgCJLRaDECsf46SVoJkjY
 d5WrbAHQH1nyp/luifFT6ZQNgdb9yqDgOg3q/tgjH5b5xQbe1sDI8Xrdt92pVyNeFW8dF3XteYk
 lOAG6iLqXPe58R42nYE15bWJ0KCVrqPD3MDn08Nq8h3lD10rMk94nhyNdHZ/GJ9nmpW/0G8Hxj9
 pFB2wReE751mILJHoCupLHFNmEHqQSITnp/orM71TBEOhzvGteqL0iX4ol3c8BI0LMwedSkNKMa
 XpfyB8DgcuxSOQ1AP8Q==
X-Proofpoint-ORIG-GUID: acX4orQOmGKT0EGyTSfUC5TNIcj4fpqc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020053

Add support for camera clock controller for camera clients to
be able to request for camera clocks on Glymur SoC's.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77a4138deeb4e00dd8b316930a2feb..c32f0b84db2f38ec567485e36e8e50529e886775 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4163,6 +4163,22 @@ usb_mp: usb@a400000 {
 			status = "disabled";
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,glymur-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,glymur-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;

-- 
2.34.1

