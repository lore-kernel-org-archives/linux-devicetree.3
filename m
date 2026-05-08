Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8FB3976A9
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 11:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240506; cv=none; b=BtilLREWvlCDDa67P1Ok8SQZVPTaIGyioAJvFJWHaDz2GdjwYJ+tvgQzp7FvYcZq38OZG0I6AO69z8fwDLpdWPTBZQbkbuY8wEn25e2OTMpKg35F7EplSW9KplFduzY4NPc0CGiR7QrOoWY/okuR8QBUhSvTQyVqhlgkTtJ2mug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240506; c=relaxed/simple;
	bh=32jODA13rVX71Zub9iZ9JION5MzYjUkv5FW4RsKBnds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ub7YVhYTxzVAwM3F4KVvZ/c0GGyWR9hvOkSvH1b43amSl890Pt97YgGZABbxv5qcSRwh9bKETcsI9p8rz48U8ROHvnFpREzUjOMbRPfL4RYjBnIDO4T5S8HbkAObtt7tQQLu06iXvPdZ6jKPsUMbsPCuPyvcz0ZX6BPCuCx+bkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdAfwAgf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMprfOk+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdAfwAgf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMprfOk+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6488Auw92384213
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 11:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	msDCUaDZXyv1zY4HE/5u9m4Td5p9+h60WHj5PdPUy40=; b=GdAfwAgffubA/UlP
	7ento7RCBt/jJNAUgbQYKFTwZ6YgH+zZeJbdKQt4o2LRJa5ZbjSanxgDjVo5p3ho
	O3Fibcf8v91Twa9Fi5YrAom1Z2MSQ+CJNYGKIMHkcgzeDOL01lbatcVZjGZ2k1lV
	5n29ZDDnahfpx65AOFv3OEtzAF7kf17ELITdUP3nzaR7VwEjxA0cr5hYOEfTQ+lJ
	MRdJdSSG7Ivj5CcoQO8/xsSPxjJYF3wKAwR7Pbn7Kw2JTSV4RDx10oQ29dS5h30r
	HwwmwXuB+qlZa3Bs+cv+z8AgPam7PM3FYAH4y4yzQbmufu0ItcY221RP2EKO2Oet
	JtmxCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwukwjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 11:41:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ee1a909037so382801585a.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 04:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240503; x=1778845303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msDCUaDZXyv1zY4HE/5u9m4Td5p9+h60WHj5PdPUy40=;
        b=iMprfOk+L5oV3GGM5HexRpe5o8INKDbqktBuzejZalS+nR2FDR91f/QZQ/0+XuhKOQ
         L+AQdQLmmmuflmHcOhR5B/yB69pfhtqAGyWP9Z3fGG3gzsM8JXVkMl6HgTROVSyiJBQH
         snWlmqTKqKSl0qaJ6tOoh8J1fXUP/59FvNivHD5IT62T5YFWRZlHgCt4IMBzBwLf6JJY
         xAM6qlgxKtR6EyLL4AqICZzngRM4kB19JIJsgpJuHtS9Vi53+dZBkPEG50fQPQcCjfKS
         89mHujdUC8ZJY9YEg6W02SjfL/rcp0MBPEuaAa0blGx2G28zDdKcDo8iN+Yr8KO1szh0
         gdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240503; x=1778845303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=msDCUaDZXyv1zY4HE/5u9m4Td5p9+h60WHj5PdPUy40=;
        b=qMJ4BKSKKsp1P9aLxTKCFkVGQLWIQqpS6qY7WJZZp2xCPkKF4OXZta9zSrlzBzbEwS
         8A91PUrT5LErtO0+7H3b3nzGsSfivCxDs2RsmBG4kdxHxdU1kP0hdpmaGcJOikVgPd13
         D7F4M85950nYqwZ7nGR8LhDw4CrWvrygcuoMbfVywIIg8qLM2DDt0PxTHO3SMgMZ9Yok
         QS5XOqIKsVBO0nZJ1y9H92A/MCrAo30XqmqNBuMUSyPaqvQObCwr+42RCWRmPbD0Tl65
         lfXW0sFiA+cSgaeg6fCWuOxcufvU68WFdFStfPaUm7PQrvk1otNcb456y1k8TpHVwSx2
         UO6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+dFrAmW7KkBawjteeM6JGgWsDV0/THIgbCDx+r6BIqpzVXBtK8fP8dfuO5r/vZ+Wl/JY6TtclA1VZM@vger.kernel.org
X-Gm-Message-State: AOJu0YyVSMfurRsVmyT2DgWZSKBwc/QJPIjKpfJPRtDmdo2fQcY6meYy
	fLLYy2Ycy1CXbifh/NQNeYVYPUFiliPxYaFKDDUfKUZF3HnwdIJ+vmM5rBIz4RvU34ccy/iHOzb
	teZpHcMFpdbtPL5QuHW3IJrnSt89/n4GT17qWAxXAfmO771MbYiVdHRfb2a02jMqGT/h/qo5z
X-Gm-Gg: AeBDieuuU0tfEfKzSWG0qcyCsob60WtevHvbXMVo859FVkcQYRGxRka4tsuR2j595cV
	WPNL0UsgzdixvwHlCLxC/c6KFLRWaCC4S4c2NlJDOQBKSrqSZuhxFjiYTSYB26gf+Z2iDQNoKvZ
	HBz5Qqm7DZah9buEC2Gpwb+jmmhT9KPUX7mplNZG3WeXYMt9F0fKXLgUXb+6w3a89+ywTMv8fP4
	/I9U8GC96pNw3Cpz+6P2/ecGhTo7xlQAud5Qg9V8EfCIFJeuPvFx8dmBiPg9KFsMYOfv6WGRsOT
	x3yizjB/H1Mritk5ppidAbWt5wNq20Lg6nGV9TUyoLPafYOfX7ZJlUzJViC9hcN6oe28lkzixWJ
	M3j4z07w1pUJOvCp+FTIYYwmIDNS6HO5Z6xTeFRtUu4XheATBqgrs2KEWTjCVmBASoXl2zrT2Pi
	Qlgw8kYTqoOjepaGmdZyIvRGQ=
X-Received: by 2002:a05:620a:408d:b0:8ee:30e:cb97 with SMTP id af79cd13be357-907b9674f78mr285704185a.21.1778240503052;
        Fri, 08 May 2026 04:41:43 -0700 (PDT)
X-Received: by 2002:a05:620a:408d:b0:8ee:30e:cb97 with SMTP id af79cd13be357-907b9674f78mr285698485a.21.1778240502612;
        Fri, 08 May 2026 04:41:42 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:42 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:40:02 +0800
Subject: [PATCH v2 6/7] arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M
 regulator
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-6-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=1119;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=TIwiNaPtfGEt7M6lhlfidGbwYXL1gLP4Ebpm5LfFo1U=;
 b=j2xXh8saEgkacjWqHlWFnlm8eiG2Fo8yBQdInRz8Wor/E59qm4wk9Uu4mQ+9JxOMgl1DUPP3s
 +hAxpV2N4eyBKU1apy7polO2QWDqEgYhPEOF3Lao/DsaUEnCMw0WvTm
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: ICenyvbjekPOvRL6iM_qlqji0dTccLp3
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fdcbf7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Qfmkza9QUpqA5zW9Gk0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMCBTYWx0ZWRfX2PXlMmgN9EmQ
 RpsGDU/UaFAt4/5eFfJ5Hr8r+Jpyb4InFDQ6XdDOTBFJspiNPRLpnSVzy+SDoyo7EnnOm2Bem7y
 Voksjn/p5GulMux0I9NIrFm9c66ilSjLTcln//utHkjZH7ZShYKKjf0r08YLclrUolUKjJnTAC6
 aBDER1pbNn5X8h9DaSWw/G/nlpojKDVhdGS3E2ffC2ejOI7LSarMGKXXjbFcH02Xj9Taz/Uwipt
 EtiDhWX/d5exAWuVokZ4Lb4/0sUP8ggK9aZlkLs1ipSit2yo3kcEys1CxeJQcd/72/ec+CxYcPj
 6vMwPn8JWbP/9FIKbNrr3OmBTlKzXVYr8KWN018fxMzfcyYp4BLk1R77v8BgM9TsDXea9A2mgjS
 ud1FrSAVEq3hbFzkY4qXTeJve/AGIIJ4YURzW5wnIPhfgqVXf7SlsgKgPln1cm7hzFm3n4VvHv0
 +JPas6KNgGtMNODeQRg==
X-Proofpoint-GUID: ICenyvbjekPOvRL6iM_qlqji0dTccLp3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080120

From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>

Add pm8010 L4M regulator which is used by Camera I2C pull-up.

Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index 9c5e77df0054763c8a1bc8de72e296f4efdf9c58..5c9fc0315f7dc125e3176dc4038ec655b7fc4018 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -376,6 +376,21 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	/* PM8010_M */
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &iris {

-- 
2.34.1

