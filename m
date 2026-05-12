Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D0C3E1700
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591165; cv=none; b=WeJszUglZRH7Rdv2rhEWgJGfWuuZwNacCBYLRcBe5lGTp9L8h9l8WiY3e+CpiFXSWiy01Dtr5NE8678qWxTWTpCla7y5EA2S2pHCvYxczOkrOZuqPvi6Ec+LODV9sFeHrLFH8tkboc8mXYx58RCRL+kVTmES2D8Dyyc5lZbUJsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591165; c=relaxed/simple;
	bh=XeBqS57b9KugXDq2jUjnUxXxTh2sUxtxP8EipmrTW08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CODCDnq+BfEml/LHog34LASrlkgLqpM7uOI0wktKmLS1rxWSX7253UMgH1siMgbSlTVYEDB6H+TxwgA1CU95J8wV8AC6vyodbRKlV3LC45HIm7/aXnqBfSVluNZZjaL+hysXQCjv848AWqWyh9hrXxNpGgClEJ7uPzpbPtZYbq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HK4a7bBX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3MKu6wN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HK4a7bBX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3MKu6wN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CBcej8075041
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y22l/ZS3tE2jArlLoAI0198lel8ZLaqnuMV87pw7o/8=; b=HK4a7bBX9IkKkEIs
	gsrYC2q6S9hGFEjhsN2hkemrnl++4102Z/g0ifh53t/zKJ3Te8acO4CFtDWXhI7G
	Pt8BWNAEcgOT1MOlTG6nT0wsscuMGgPRwOqzGdEyfcNRfsPalZ4ZVm723MnEqEdK
	HFF8tsgI2tYER0TqDvVxrlkz32nEQcIuGoUl0voCZPqmg5nNIj8xwkt/mdpTSefv
	ZkUqJlil7ybCQE5vhFkrhPUIe0emxJfXBFR1vkDzMJ8ffJ/735CXuhfS6ylpG4+i
	Uq7WrIL4cJwyPCIBPiT0kF5jWYTm7WxyCIB0p/6S9z9U38Y5NQWfBCoXXg71vtqH
	kvbYXQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43gygck1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:06:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so1420415ad.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591162; x=1779195962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y22l/ZS3tE2jArlLoAI0198lel8ZLaqnuMV87pw7o/8=;
        b=L3MKu6wNyQov75u1Q9eP19sMC5qfIS+mqS8RSMmn3SgMVuLxuXBurNjOQV9Ac7vDLR
         /hghGg5lVOxEI2/q+aN+Rxi29jt3f7QzD9mcGdL7XAf1EcGaD5TzhhWbLEOg7cC2RwAY
         DihNaPvQjpRm/l91OX4rHP/w4NQ6XXiZfSS48punrd9Fg1mlb5dEE/rQHodpQIGlVm5g
         yFzGNGAOFmvmHD27FWlt85At1mCIO+85mG3qxQobBMOuYEFp7IKqGH/3E6TutO7Tq3lz
         qW729OsQQOGeLpdvFg3jEVmFAaOKyZTMmNPYNqLZPG8jfxpXqC3dfNKA2xtXpR/PyrPA
         WE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591162; x=1779195962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y22l/ZS3tE2jArlLoAI0198lel8ZLaqnuMV87pw7o/8=;
        b=Q1X82+wxxevPZbweCLJbmNMPcGJIL2GpItjE1kbrsGL2b4VPZXr8VeA7ZcjWCGe2HO
         Kc2DGqovdKF2vWJrfCmDCSZM0Qh/b/5Pz6WEx6b27LZceXJOD+9AX5DygIuKYG/JXPOE
         TX9oeEhWWgshMvxU5dnSmMXqm/4zoxgxJepq6QwrgiEgKJ1dMEaIz2gtjXGWNrts4uE3
         NrBkWHvS6Jh4WNRKtyRN4Lmnjn6/LGlKzvqV9PTwdD203W5WrqMPFKVCiLItBXFh+sgH
         XcmTttZnG7Hx2gjv8cRXE2djMjKT/+ZmNdrjPH1QVwMS7THdowFsOCgf0AE9CRrcGcDc
         e83A==
X-Forwarded-Encrypted: i=1; AFNElJ97f3vVKOfOnbdVzDh7WpzbZPkw6cc6rRyyKUXr+kTYdBDcpSiS1noFhULKl/A9lSrGIiP9arCc/e0A@vger.kernel.org
X-Gm-Message-State: AOJu0YzBy5oa+8IwH1JGNYku/AkJqDV/y5WlnGre3McZvyL7QgWr1UUJ
	XfYO3FQdO4am2ptcSCi7acStBb9PiAl+gRRUkhMqVsNDVGFvYEyQC1G8cHqJU5wXia0rPjylrx6
	+ygLVFMVNXQ7UzQKdfpGRm9bShbMWVklQ7KUDxmaGUUCwa8YmZEQNRztdVwPrtJ10
X-Gm-Gg: Acq92OGTpq+noLwc8zMQDn8LLbxA9vpcs4nsUGcyByJMVOEikdzej92z7UoLp//UaBB
	jE29Y04e0NlcUg8Z0WfIKiQORRuwHfaeF0W44+IGVMQdDjMP4zxeiPtGZtxEIdQcWrixl5z9hm6
	8CDLUOG3D34aYO6RHaCLdAnJ58AwvK/Lw9KOVaoaZtZz8Yq2hyGoOHAOmVLfJxD2T+TNxMaWvFY
	O1HNBW9pMp8DAihoY/8xfRt5KTq9wzpXljFLDiv+cT8HcSSWOCl+lowPE22on3lfm8qZWhkSVvC
	oA6pzlMI2cVR0XGacxW53v8gkL2POs1yS1gGmrpWQRp3/Q38uQqVgslDuMCltWevS7jItRSUy+a
	xggSlFkE64DnFt52X/w8lBLZORMMkGmPnyhSv4d09c2zsinZTFM9w
X-Received: by 2002:a17:902:8641:b0:2ba:6ffa:bde0 with SMTP id d9443c01a7336-2ba79c20bb9mr228536495ad.19.1778591161235;
        Tue, 12 May 2026 06:06:01 -0700 (PDT)
X-Received: by 2002:a17:902:8641:b0:2ba:6ffa:bde0 with SMTP id d9443c01a7336-2ba79c20bb9mr228535975ad.19.1778591160755;
        Tue, 12 May 2026 06:06:00 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e36c65sm137630785ad.40.2026.05.12.06.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:06:00 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 12 May 2026 18:35:28 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: glymur: Add camera clock
 controller support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-glymur_camcc-v3-3-a7196fee2779@oss.qualcomm.com>
References: <20260512-glymur_camcc-v3-0-a7196fee2779@oss.qualcomm.com>
In-Reply-To: <20260512-glymur_camcc-v3-0-a7196fee2779@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=fMAJG5ae c=1 sm=1 tr=0 ts=6a0325ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3iLwGWznUEgL9WBE7MAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: IBsRgXmEszET2I09tr_isrj255h6fAuv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX1b/wg5S4wWLH
 ZVqfF9SaCN0lkiaQsgEk3n1QAVvnDIPY4ZyD3twOhIkr7bXcHzLKHnNAaKyK5YdSEgUSLsw/6SB
 sfjD516jnBB5j6qOFXdnSgfMYw0UAY3R91D8eZ/NhL+Io9izEy1GocaDUYXo/epsGaeO7g/i4PI
 F+wPWEnLtrq71QPC3Y621ckCYGIRppMeO1XfV5YhrrbfNtXnH8Byh9Mgb+Sbpt5qpwvldravq2g
 Y4chE3QOaD4VVKUJYWqZfxMechiJjk+vjqiPM80UVve+ddfJutkjmMTAxpH7UbPHxVf5wYbTeYj
 f7NFa4/dE1DecsLtRbZPvRve9jozFhG0/LtZCzvxcG9z5ldRZtfnBWHPLDC9T0KjphIgHHsPL/p
 5vhVYMQ5Zy2c5chWuzD5OkMR7YPdwwmdLAgRfZyLLWPg1GgL/TTHNHPq/PPxdZnUUy2FSUaFFC4
 8bJbmg9XabxkKkEa+uw==
X-Proofpoint-GUID: IBsRgXmEszET2I09tr_isrj255h6fAuv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120136

Add support for camera clock controller for camera clients to
be able to request for camera clocks on Glymur SoC's.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77a4138deeb4e00dd8b316930a2feb..de5d6085df13d58686b1e7959a3ca2081b19b01c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,glymur-camcc.h>
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
@@ -4163,6 +4164,22 @@ usb_mp: usb@a400000 {
 			status = "disabled";
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,glymur-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
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

