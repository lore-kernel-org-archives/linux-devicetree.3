Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87199405C23
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815627; cv=none; b=tq9cXVyDc4wsODOzTqjwESPov+Za4C3te2nkmHFKrGvCnSyfB294Aer3dthj+Jmk8mM1/rul9Ng+fXgqKUMPkSqdtOlV/C3I/PnN7GZXGn7M7LiUT2RAVCL1XpxT1uoTpy+9tvC1sf7CPgFuVpg+Nh/GyKsfuAKckuXh89+8eeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815627; c=relaxed/simple;
	bh=rNQVM20UUvgudFA/i6n3y1WsCxjVAxnVn14FXEO7CqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IC++G/+EeB3iWyRBBci0iFkAIP8orXZNwr+FwwazgeU67oSAQ0+HUN3xDknFv77bddjbkTAv8jUZxBAV315VSly4QWfrvX3qL0wDIadwflL4krpzrdU169quvopAHs1b1VeICMY/WFi8N+jlOMeQGPg4qUjRMnGPPmXTA9gsOHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEpLz8Si; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXz+Xz/R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEpLz8Si";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXz+Xz/R"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1eRm069522
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qsLRItlvQTaW1wXx2stcMbcEedskcqLdoo78VHGXMS8=; b=aEpLz8Si6+oGEx/e
	94nD1w4n3U/F1YKkmZ+bjrBcSs00ROga91Gs6ak/4IwKMhIPvN7uTvyEv74lLbko
	T2VRWTyyzE2amMz5ojCcfn+yRMf1jlE7vDrAUs3A5Bw1xYIiL4djmiyHbpKaaeKD
	Q54hOxZSbrIaHk40GxCz+uhdkLVnfzoOFMO7SkIwDYCdEzwvuVUiYxf61tEerfyx
	R8FYioriVa7PU8LnLaWEiydgMBOtLJaEaNiA/JyDpuj3othiOWBJdtx4H2oI52cS
	n4c+3jfeoMUw2wQAvH50k63aawjEY0ActGAJ10HjoMeqNJIcEHbfBNbNJnR6hDYR
	63d9Ag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edc2yhaf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:13:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2baf7748d0aso109364985ad.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815622; x=1780420422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsLRItlvQTaW1wXx2stcMbcEedskcqLdoo78VHGXMS8=;
        b=YXz+Xz/RZiGw2uxAnpD2qf8rNZOiUHG3QdKA7jiHxIGpmnECrJ/R/CgKAQHZ1aN0uN
         x/hOZ3TR2/FgNztJB8J41+jPdMtLGgWkxhxmhjenkMYeS+hA/6g7dsHjOpCskXUWoMR3
         /z0hy+exQIdKN2A2mPWnph/7ljLcffWGOlwLpFvSWM2W5HUjqGSiN9ZRbFoabNq9ytVr
         aLWV90wgrxrwYgm2EO40VGg+3eV44MOrZv0LC3BBkyTDaT4MK7X5CFDTZ2s4U13YKwbq
         s9hiPx8vRDAxlA3JO02QUagWuV0jZqlZBwRPM4N5DQFaf/YYoatYdVN9ILf4wnOxxNWR
         lYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815622; x=1780420422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qsLRItlvQTaW1wXx2stcMbcEedskcqLdoo78VHGXMS8=;
        b=ftO2km9b0BCt1vNaJRvxjR31PdFnfFyGPTRW95PXgbwVMSbwZHPePDyump7RqaeQff
         yZRmN8I2R1/xrfMipyx8zqUXaiPPGmwiFTg8CN+Rb0wymkXK1ZQJLWC6GS7DE6Ij6MKc
         zMLMX+DiPYVsVYqrFABogASA38fAUJwhsFd65XrfOL/OWXThffYl2Z1ts/ffiudHl0pc
         IknXXQPJ1D2REx+QZu2B0Ak6W9rBSoOVlOVXi3ONKk2S3zuw8huDODlxJRt4uggmKRMq
         okwRrBXBtEOalljBlL4GE0iKm6hGsepk3IgJu5wMNDdATRQXd1wQNTFEaOqKU1INswJL
         1axA==
X-Forwarded-Encrypted: i=1; AFNElJ+oh5PbTASYt2AeY6738b9NgGYM3pcf14kkgOBEzVASuYXTTjOqZu3r+ejIE5hKFyksifxuRLgqlx2R@vger.kernel.org
X-Gm-Message-State: AOJu0YzLGMCBkvIAx1dtbQhRwMSMrq5LCEc9E7VBqfTVeIYW6GrK9m7N
	oBUmZpYKm+Wp57KPp7uhTQjIuQZVl+aEme8WDh0TR3QiDN387AOH610a+hMoU/4pelXaw81rnpw
	nA1ijJ6HbyULnwAeB/mSWqiLD7xKYGL0H6iyVzLLKsifUl8BXqlAY6dgUdThip4tq
X-Gm-Gg: Acq92OErjDwqVGSYlKSbA6H14jUIHJoNn3UU32cx7e/zucNYQiYzT86L8vo6pTjEvkG
	aZ4NnqTnjDLHO0L4HW97CGM5WHpbuHx2svr9YIDFnZiO68CQPn/gkELx2rBp0sOBGZuS7QSd6kQ
	zi5NJRYRAdo1Lnl06t9sOipzLXLWkKdzglWx4VSfdDux8ypLCNnUhdo1cH0LnNONqFcqTbo2oM7
	4u6CtL/yG04uL9HGP+gCVYX2kpLCwneMTvNVu+9DKW+OiipICWKlep2IjmUXL0Gxuy1mEcilDAe
	7WRnugpfg+SOc9VUd/4oPnVkO5G/naUOL8olNctY76vzn38uxRa34uLZkidtlI55alcoOEBlnKC
	onyGon8pcmZt8JQwvltcHD4KgJvkAFkiy0IcTXblIXqQEskgywOyI
X-Received: by 2002:a05:6a20:244d:b0:3a2:d79c:415c with SMTP id adf61e73a8af0-3b328fde9edmr19895565637.47.1779815621726;
        Tue, 26 May 2026 10:13:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:244d:b0:3a2:d79c:415c with SMTP id adf61e73a8af0-3b328fde9edmr19895511637.47.1779815621220;
        Tue, 26 May 2026 10:13:41 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:40 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:50 +0530
Subject: [PATCH 6/8] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-6-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: O_XR2EGyoInBKvy8epbC1WUDYbLLT7ka
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX5nrgdpcP3wyv
 XzcZDHtdpkW/g+vA8qUA9vZ07qBg9PVD3VKcb19dhTmbJ0mdx4U5VzHgqapDcwk6oOGz5rGCxdq
 anAp8gZXumfFPqHuSzlP3GME+oF7uWMOjOL+4FTUQ/T9aIfMRBt72/eOXDojY+THkNIMtvjKbOw
 vJq9eTZLKllHCTOFhA5DC8BPF+H4onErCmy7O292V3knAQNdx03yPOUQv8uFU5A8+gFRe7lzdVs
 hv4cwkZBkcGuNobh6UqnfmyZkzAysCvzc59VVKhE7ErDlVsooLx4qGt0SvWqSr4e602wmFaD8s8
 b8Y/v2CvBZ21HE9yBnYf/tNvdUpFZzE0yrqbdUX5F2mNdocZHbla0mxwsAKVBhsGwZ8M16RP+RF
 FYs7ZZzrtMXQZWTJ2Optv4S3liB4HN5ATdcZiUNKlzwe/Ga/WBxZSOYbRdF5JYEKPZL/FNJyjtQ
 yziX3105m3NNJ2QJIzg==
X-Authority-Analysis: v=2.4 cv=CYg4Irrl c=1 sm=1 tr=0 ts=6a15d4c6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8fHhTolRNNEGZtKOGWoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: O_XR2EGyoInBKvy8epbC1WUDYbLLT7ka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260149

Add pinctrl configuration for the four available camera master clocks.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 46de35971f629ded990827ebd76134e652758ce3..3fdb0c45d17880f1c1c6b90ee6e91b154e313738 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			mclk0_default: mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk1_default: mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk2_default: mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk3_default: mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";

-- 
2.34.1

