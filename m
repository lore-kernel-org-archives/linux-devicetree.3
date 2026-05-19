Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1605C4963D2
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189736; cv=none; b=lGJxaNFveOkxJWJvW45lyO+R++wfQS6ES2EDBG0RX49wAt7wIWThli2zBo7qlImFLCIttTzT0m4/q2fZf7Ohs4ELZ5v76CI2+c5Cbt0qBC4j+LDVVhj5Cb1vOu2ZI3CujEufgzZ8xkvCeixnjxMET/1z1ntiIRDWzkDmhCaQF10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189736; c=relaxed/simple;
	bh=ROfWYzqfLTfeWEuSE0CQdQnZtXIf2oyWevn96M+Mxqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DBLbYoUmIpTqebt9iQPLEGxuMF8bXOIIJpzj/reaWcsapReQO7PuL0CDTBbSYUyRMZyAk5PL5I1TWOI9+hCzs7iUnumvItRnkVOBjq7Pm0rTs1Swk+V/TKE7nKmThUuqQkkVR6vLdTpMp8W0u8NV8ub29dQL+c42VRbDMPvZbeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WnTob3+M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NAiVWFS9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WnTob3+M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAiVWFS9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8EIQ73612464
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IfCZBMhzSxU+6bFyzhG5aUVHXkjtGzqCHGeI9Odt9/w=; b=WnTob3+M2nl9fu13
	YqmnFopwWZ4Uta0SKpMeP4yYCkLcSl+3NGgkbQI8ZQIGhaepN2/BLVsDOK0gkv/W
	MadvYwIj7OcxqJ+WFmWCQUYGwez95sHcaMdSqlvB74Rxt8bGp3uG1eIeBWXdMNEN
	vasCf0vMLg+s6fJD1TMQgLixZbSNNCLN1uOALYkVXyDvh4t9ETjTmgt72+6QUVRw
	2ocXhyH9k3gXRjX9d8ig446PBNvusNm0QbFJ1A/hUx9jX0XGitrCOjScvHvqwOki
	1fwBiBvEwT4ou0n6YkN2aSrXolcgxOuiP1IqB5Wb5FfsYUrGyqzwDLFwm5z2OAxH
	byuFkw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8m64rsbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:22:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-369166fe5e3so3060781a91.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779189731; x=1779794531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfCZBMhzSxU+6bFyzhG5aUVHXkjtGzqCHGeI9Odt9/w=;
        b=NAiVWFS9Gf/ClcganLy2iOBYB/oC1UBCb1BqlZLWT9MNmEJZbJs3FTIq/3JNItJXVT
         muX5di7jSZIYX9LMDg/tYws7UTKW3eY/W1IFvtA+9zS+MmawBUvv80udl0rDD2Wj4lWJ
         nWP0QCp1t6OaQejten+O6ch0E4Dapkw91IUlc49vUWl9+Bx0Os2AQ0l2dlXr6FoblvVL
         2tz7rohPbDEOsGjHWEZ6npOXANrQrFELXJRFz2ZfNsokC+QxSmoU9nObvLyC3Y5jPmnK
         1cJS3+uBHzj4sfqEIhamL1dHMi4ihhapqVbgDd1XLBQB9oyiLK6B4EbAic78ri8xFrkw
         5WDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189731; x=1779794531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IfCZBMhzSxU+6bFyzhG5aUVHXkjtGzqCHGeI9Odt9/w=;
        b=eKB/uRte6EJJB+56RrfB8G3hRThfoqEtMnYtow7IlloR4IgPM0jIxEqbkZwBxIu3oF
         8Ga/4xcsLABg888Nf85DY1yUoNJfM+GQtPVBXF+FDh6sk0MDQrwz+2Xpmg5NQkhIL6zb
         iCfGGVS4w9ANgm1l5oX+dOXylkI8uSH7iz4CU1V7YqKkDUgYqrFdXVvTrs5fjmXaSSMv
         93Mcuw7uxHCr1bajbw/EEapMZJtkQjzDOY56pDOlBPQZid1FPW2pGlaWnMamEfDOI77M
         E/bZ+8NXOe6ygnvJdCPkgETReegNH3rtdsTb7ydyE117qwBPnwuTujks0IYunhJNgUBw
         /iFA==
X-Forwarded-Encrypted: i=1; AFNElJ9WPEVCzE8hBJ5tVDfkI+mnyu6jc27ovBU2qwVUss2MIo1QFHfR+kOrZoqRvrG0gXwJr2rDE8O0fnyH@vger.kernel.org
X-Gm-Message-State: AOJu0YyXojFSiL1k70f01ukV2z/lwkeiFMZHZ98PWWf4hVoZQtF6NWvJ
	rPEpxytDhfCK1SDio4it8LPNkEie9NOPdrW4zyBohF7uObyk/wMsmZPT5J54E3dnadsuLWlu8Qh
	GI+Mfj9msbpYMpET78v5mlNmb4bBwpv0tDKU/4Y4u0FY9HKO35Cg8WD2S4xrwJOBG
X-Gm-Gg: Acq92OEIEaC/olyapIuIR8ugXmov57dUpmDjQKbkNW6wNKlXWTTQb+6TmPFdr2ppDPF
	UMwLNqUDPumcCPXt4aLZsvKTDxyOr0BF97qZWMsN1ydG3tCKKvUKGk8nWYjbT4608V+5ylt5Dch
	+Q0Q2Fq4lAlafCJLnNGSVEss+ZurWoL1V0EzLOjDqhFAYNP/UzTB2pFv8vLk6OVyh1wYWTaSTfq
	6HHw/XdOUP8xn5039Nh0E4yLmW+UhyNypDYxQ+CYbgV1z06fdrO292/TMHrqzL0x2OQgGqs2YiG
	d5HNAB4vbrrPkvo9ebVrg/AU6YiDxnRJh6JNc1FkTlpicqzBv42+8LMqyARmWtO15iH9Bk/p9Xt
	DvVlDz/TdAU5uwI1U8YiVdWrqNcgiDgFau621Id/WXOXJzzs=
X-Received: by 2002:a17:90b:5110:b0:366:1c9e:99b7 with SMTP id 98e67ed59e1d1-36951dd286cmr19479025a91.25.1779189730756;
        Tue, 19 May 2026 04:22:10 -0700 (PDT)
X-Received: by 2002:a17:90b:5110:b0:366:1c9e:99b7 with SMTP id 98e67ed59e1d1-36951dd286cmr19478978a91.25.1779189730169;
        Tue, 19 May 2026 04:22:10 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe78b9sm192743605ad.43.2026.05.19.04.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:22:09 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 19 May 2026 16:51:23 +0530
Subject: [PATCH v2 3/5] arm64: dts: qcom: Add Shikra CQ7790M SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-shikra-dt-v2-3-c01b90fb4395@oss.qualcomm.com>
References: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
In-Reply-To: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779189702; l=3493;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ROfWYzqfLTfeWEuSE0CQdQnZtXIf2oyWevn96M+Mxqo=;
 b=pP3MfIHGhn/2oScZhcEZ5nSDWVAT+MjrRFL+l++qEoyV2NLrC91s2HU+2wfbjUJBflxtID4b6
 GO7T2+s7/HFCQdZ5ob9rgpy/+9aEd3YuQE0d14egoVbvmn8RILw7tki
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMiBTYWx0ZWRfX/KO7GzpT+vYv
 ma4y2taxVjBSx/STl83ehl1cSBB+CGcMW3dit3l81RcMXoYTttrmi5u2wkvIvY/37C3Lgs6AXaL
 bD1iSl7g+sfgQKdBwjO07MWGPhCFgoaj902JoDlgX5nzQxz3kMboJWuVgane/Jpe/yrJWlTNZ1+
 hJ4Go4MoTBrCB0uee6Kc2+ksLmfAzWGLHWg/zPuNUNY4yd/iEUiMtoefCxgi2C7qPSGXXxo66qI
 M5KRosDkTRCKRlz2Mc0Qalbm/eJQFKWe24myQ/2ORDr8HDKu2PezwE/Wy8GV9yX7onBvbLBoGpZ
 DREUpGLjBq6Y3uQNumJNG2t2LY41I+Lj7mOYwaprYjoD//JyithOgoBOwA1ZIt6VuY/Pp+hvB5g
 FDt29+SdjZuyO1eFVvRLRwWzmWuEFSNSQbAK17KlgNI4EZAHP0UN9VrybCCOhwPGLjuwEsB0VpO
 CfrlPz+wgfrqgpuL8NA==
X-Proofpoint-GUID: 9_I_8wBkazo7yGUUFOZiXuH-WNkE5AR-
X-Proofpoint-ORIG-GUID: 9_I_8wBkazo7yGUUFOZiXuH-WNkE5AR-
X-Authority-Analysis: v=2.4 cv=J8aaKgnS c=1 sm=1 tr=0 ts=6a0c47e3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=yuh6J1mAL7zzRkeivMgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190112

Add device tree include for the CQ7790M variant of the Shikra
System-on-Module, a compact compute module integrating the Shikra SoC
and PMIC for IoT applications, designed to mount on carrier boards.

  - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 PMIC)

The DTSI includes the common shikra.dtsi and adds PM4125 PMIC regulator
definitions specific to this variant.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 112 +++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
new file mode 100644
index 000000000000..401e71720519
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "shikra.dtsi"
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm2250-regulators";
+
+		pm4125_s2: s2 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm4125_l3: l3 {
+			regulator-min-microvolt = <624000>;
+			regulator-max-microvolt = <650000>;
+		};
+
+		pm4125_l4: l4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l5: l5 {
+			regulator-min-microvolt = <1232000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm4125_l6: l6 {
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+		};
+
+		pm4125_l7: l7 {
+			regulator-min-microvolt = <664000>;
+			regulator-max-microvolt = <664000>;
+		};
+
+		pm4125_l8: l8 {
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm4125_l9: l9 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm4125_l10: l10 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm4125_l12: l12 {
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <975000>;
+		};
+
+		pm4125_l13: l13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l17: l17 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm4125_l18: l18 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l19: l19 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l20: l20 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <2952000>;
+		};
+
+		pm4125_l21: l21 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3056000>;
+		};
+
+		pm4125_l22: l22 {
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+		};
+	};
+};

-- 
2.34.1

