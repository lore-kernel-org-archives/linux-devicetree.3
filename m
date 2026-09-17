Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED37D4DAF90
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645298; cv=none; b=IIWvE2i8QCf8SHF7gG6G237axFZ5JH8jF9AWELNCc0CG/hglwz+0QbRy0vQBarTH8jX6sCckSXr04kWs4OPZKPJG0Vd+orBCqCXI7FdbXSsTQO7yjjFkpc1gDqjphONoZAw8DsYo/QdI76xBfWjtGA6IbqV8CU8oWjnwoWsMiXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645298; c=relaxed/simple;
	bh=C29tX4FRzcgmif33GVTX6zsYFWffRjwZBgWZudoP01E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jd7GqvYf7UR2PyK4ARY9mCWnx+Lr2K4y6FhHTxp/W3a0zgs1TAFze2pF9FeegVPBtwv/YekxwZa0PmX4bSINSqoEwzabsKY2pM6QHpeMf2RSvJ3kE47pHvA4r8aWukQ+7fkFzo31Iao8ZDvJhSY4N4tBcG4qqM+/fJiByjFnxTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oSF2AOlt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R87kXLtS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oSF2AOlt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R87kXLtS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZmkL746790
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZecxAZHHCtR8vBT/I5lYYisvcmBfN43svb3hSSFCwGQ=; b=oSF2AOlti7hnaEUl
	LJjZ64ooCgg7CcQyHp/1SHBViXqUX+LluPxpeO4mmUG8ERXc3Ip3Bp9ym8RsxXv5
	GOXXSLffY8WROWMpm/i+BiLsWbIeLXTJmVUm8TRZ+GUugDJuHrp1D526/GzxpLCQ
	TP0qNT6KB0fKIkAahjEhxF6AKfhRDN9IBbMa8SQZMBAvj2nKoWoLlpJR04vAkdB5
	nQCDZn1TL+XAGOeU3fkbbAskT700o/G84WwXlDG0DXAqkJfsoDYq8e+WyJBzckCl
	ZGL/p33x5byVp7kRf/Ezb3qgUbZUQ3BUd3EdincEYhOIQY81KmGaHh2eNCe+arMl
	EEmG5w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra8rph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:41:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so658428a12.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645295; x=1790250095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZecxAZHHCtR8vBT/I5lYYisvcmBfN43svb3hSSFCwGQ=;
        b=R87kXLtSttKhc1BCwpCnwVpP3b0rU8vcoL+LvJS66puyx8Qk8lavuRoTngcCWqZ/BX
         rSysZbHp6YZ9DhVT/izxdfbNpywPcUKes8gPWkueconV620wGEmJPBJtDbFvPDPxofuF
         iZy5iQE0rhwSqKToYXpd5evSuj4bNqEMx9O0iRPh8Bc3BRlTgbkZDxRUkVlE16ot2yrK
         QXc/KytGTl80TuzFvplCRB6WPBJoKYiLJVu9uXjkGFDrc/yYr3CEtBk7C1FsWsSzpELO
         gHMr2defHUGysOmEY2jGC0mNyoVEP4z9z42Jq+uKjOeuPVeC3eEo92NdT5VxFdzY4HgQ
         7x9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645295; x=1790250095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZecxAZHHCtR8vBT/I5lYYisvcmBfN43svb3hSSFCwGQ=;
        b=xMGtw//nA9d/PL8Y43FpRpI0VA1Dn+jtV/FZMo0epfquCVlDNkh93aQRAcd1p8imNo
         HaG7pWsUxRLvRVgFflAZkSKsCRK9XlZ79yrY87TjW+TjlastLNsje9BmuwTN19cWw0Qg
         4AXzJtT1fY2mjjS6OYzcF5sodWbK+yB0RL3xM2PMhpEq5H9adC0eJOC5VaZr3vtTI3Ur
         MedIb4Ya+yHuYIgEH3yimcnoQobxWH7Cmgl8bsOJtRscKMreN7/ZerB1xR3Wfx1N1I2i
         eQHtdFji365i3c9IrasYckN0L6J9yxrSMqKwZnoKDogUXxOm52LTohVrsbEelRxurxWd
         blyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsAIIzLSDtdGDOYymkFiu74yonXOhVzp25wIOrGbWZerRHmC9LFxWRsXguZKQc2bGAt3fvrS7OzhFv@vger.kernel.org
X-Gm-Message-State: AFuF++msCqMIzJ/zb36qJJabg476oqxZw5UlwDGJbRcmIUVMWB9T2zjM
	j2n3DDpRogLw231Wmojy0N8qkes1tVPOzMg3uWWHCA1S65FXHd1kUyDxO70ADaDTqCxd6UuatC0
	EnteR0lAriVfowmoVhraaGQm3ht/s1gy409vkkRNtYIgqSv6X6qSXLiOj2DQHksWR
X-Gm-Gg: AYBFou31lqAdS6K3G4zos/VtbEQQDByaU10eEuLQyQxYOv4eDgIZwfdbyv/wAnF1dgA
	YlbmSdrhE8iCm0fr16/R3mbvc6MXLzGs3BjRH3/cYtIuUJ64PQKGpb7nEl66bfDA9qPQAUhVyuJ
	KJtF+vz2fbL/8kP9GGPSr1DhQTeu5JEEnTnMHgeisQarqEk/XMUBS52u9obf2i/Ci6stbNM7+Z4
	rWiXAg+f0tf5FF8jBchDRcrAMG9pKFTxpQzY/oFyJWkNm0Da8Y1KC3vYbb8yKZXdo3Nez0BA6Cv
	3hcoBBwo3rKNGp6cWYRGsP+dIs0USXBW9AYSc5q7VggXVJGJlnjPgVwTeA3ODvtChgt5MFLW5+D
	+USiz0yHsHDtII5/JDpysPtf/4rR8Aw==
X-Received: by 2002:a05:6a20:d528:b0:3db:131b:8d8 with SMTP id adf61e73a8af0-3dd72665d28mr5070580637.14.1789645295168;
        Thu, 17 Sep 2026 04:41:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:d528:b0:3db:131b:8d8 with SMTP id adf61e73a8af0-3dd72665d28mr5070531637.14.1789645294657;
        Thu, 17 Sep 2026 04:41:34 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc1178sm3066557a12.30.2026.09.17.04.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:41:34 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:11:02 +0530
Subject: [PATCH v8 3/5] arm64: dts: qcom: shikra: Add mclks pin
 configuration for Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra-camss-review-v8-3-9b9596221cfa@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789645263; l=1547;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=C29tX4FRzcgmif33GVTX6zsYFWffRjwZBgWZudoP01E=;
 b=+ThXIethSpr4dc1t7AXKnXGlk8O7tt/aAN7e5eHJMwBsFjAbYHKM0hdc9zbVJy/q9yDhXgnYz
 NN02I8qmQYJBSrtIlA6mpaV2cl2V2LH1in1X7AwS42iGACGyt9ozb2L
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfXzAKWVcv5MCeh
 goJSJeQ+8WKQDRJoNuK6ddZvUHy5QEofimTeaswZALI21pvFmAzY7AG6QCVuu9GUOzbqdg1o6Ct
 nTaqOu3F8vAfsS0hXoHkKS/O2pL/kfs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfXzox+D9vxRjBI
 eWqESHfU0tD5kSnQFpFsfhBhJA7JeMWJc9oi81zC9ptxNZxX/wm7w+sh1OqCTya+4fv+zjim/T4
 S0Wu9IwM05iJY/ZbbeRTjNiVBExBrkC2SSQYh4lQ3auhXfpXI07o4TDC74kE0qlr8SRy7ksOtpz
 gtjq1yVNiuYTUSR5G7x4kbQExuq5vkMGEJMi+hI5bAl+BTnDMT26GyWzkqQkVJ6wZM7I/o3iRXO
 FKagl2eUh9LE4RvniUwzYDgh8iS9f0Aper0xGHWk9IfweYlrJm437K+lgbp/0xyx+cUxVioON0O
 AbWVyNFnkp0F+Gd/foRP9ynRxPSZQZioI19sFBXEvZ8tZJLHAKlyXgzU4BP1VtTPigaw5KWDbI3
 dr+Jqw/QEqe7k5Q9mNBFOc5KR2F7WunWJJjFmr0315fj0AnpnunOozizfWoeH9xB41AGtigD1QV
 UCEkvCWyfh+/EK/Gz1A==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabd1f0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: UK8X9ZRZYXX4bwjGBSn4PA707ezfn55E
X-Proofpoint-ORIG-GUID: UK8X9ZRZYXX4bwjGBSn4PA707ezfn55E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170162

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 5f64b4e50967d61846b7b0c565380a58e4ba3210..682f2c933c3ae76282cc399f8bcaeac3a3cdd654 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -924,6 +924,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.34.1

