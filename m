Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101823;
	b=BNd3ecbl65d3KKKDXVZoN4/zOSamgzSRbV6bVzj0MwBEYtNKSsqX/vA0Qvc0JLQAxMJt
	 GloWpOkrmFPrlXC9o6GkTbSmrV5aniK8JIozpIx+1dzEu4C7ceFPmxCcXiPqHPIU89iHe
	 SgIm9xrEKdgpYSFsgEfELc4tpH+QZOspG17TmYDg4A3+NKNGZI1pA4Y7C3YxwYE4wfEMQ
	 eePs99tB03KKEb1iJocjejxoNSiBEgy/VrGc8/yF0ZklVYdk1vnQhZldnAQlP+cs+u0dy
	 EqT4qZ3z4JvmtXt9Zgxc1u8+2d2UrYrQtgxlNIKZdjco/p/jzjo4veJBVhCK4gIivwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EOZp3rfp/w1q05Zv+KbKkhpo60K0a0nNrO/tuiZFfm8=;
	b=0oM8umVBjNOX36WAHFiSPUf+JC0D/zewInKRrIpvPq6EEk8Qou+q+p6Yx/F0++P3MP7n
	 FrbAdDzCNL60nouraX+0ArzmZeFAOqH4l55Cv9ZgtGwVoFWgTIe+lNAHr+apMM9DnbKrI
	 iAWy7BQ8NKyFTMQqe4OiHuwmioSvMvaCgNB3b07Pu/kcyLb9tgrycYz5C1MqELUkdbSfv
	 vCky3aoLWVvlhCHrj3gJ0+bxuJ94vbLJQNkLk1KK+m32hVJlNC7YarS0ZjFBmYwN96k39
	 6rvJQfbdfCwrYHtUO0ieYTVDLIYiuCMhc+nfFn0j6ujmoH3JKhgv1ztpuik46hzWkFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f6qEbW1t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EVvGrSDC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3489D60A2639
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3489D60A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f6qEbW1t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EVvGrSDC
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdw5s2458110
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EOZp3rfp/w1
	q05Zv+KbKkhpo60K0a0nNrO/tuiZFfm8=; b=f6qEbW1tNmn2+V28FVJ+jAvXtsw
	UCoT56LwFk93BTU3SftrS7yiFwdpK4pu07rdHrSOgJDKg0ufWZh3Qg6/6pFlAGI1
	SW+fOrmAdO/b5v35UPj7q4WkEsTDXWsCeSXBX+AE/MLl7qcluzJooHLS8ZwzHrfw
	OtzfDBe+nqxwCxyip22XdC5aAbbXhubWfOQbylUkCV8WBRckUumreaqelmaS/ph5
	+5cJmP8t1gxFvbU7S1WbRLrbpCBWUSv2X//N68n85HQ28O88b3Pk2WAZY6x7qKBk
	a3WAGfWY8dEJhBlDwV1RMI5H3fe5J66fCr7Qr4c6i4/i7JvkwbaZrRtqTrw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbta3ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:50:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so19115109eec.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101821; x=1793706621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOZp3rfp/w1q05Zv+KbKkhpo60K0a0nNrO/tuiZFfm8=;
        b=EVvGrSDClAHAngwf98nO90b0Qxv0Uz2Q47lFtlMBaRaBfXQUsQoyY5g7aLHSrYi7J5
         uwuap9o39E0MjT0STpVhyxVaFGFCn/6IPg8j/CEf7+qP2fdlpS0cD+GmDcYYgpdWtYcJ
         NUvifn6NOU8lQ2LCsF2ATtnkDnFEc6NiGawY1zHFy91Bcf31mu18Qf0G5Fnza7wEQNTU
         7Vo3JkUBXDfYsmEEp3DR1TYxbJzp3cdBLfklA3cgMC9BnorZuY8GwXBNF1k9DpaE7wFu
         nTatIZjEKLC+kXRY3fypJf0hKp0E+mDCBmT3QYvjiSYWn5+9hE15+56UXgvoX9RSCUZW
         ljPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101821; x=1793706621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EOZp3rfp/w1q05Zv+KbKkhpo60K0a0nNrO/tuiZFfm8=;
        b=uSKK6O6f3/DVHSrG53rIIzB2W5qaM3U9yNgoDmF/IZXiHh+M7VL4BCr9zwVjC7fUKo
         WTbDb43cX8draPGSrhE6BaIZeyn4GAcqaTRzIAtaJqUZNR5QdPU8MeuQXuJ9UIlbXNBS
         0BOojsaxYVipBZWpko3ohXZ1l+DrdA+teTxC+6c3jrlgVK3WWdqerGKPXSwtQW2Q67AY
         IMXz1GqXeut4WekJ09ozwmSAWsQ98tlLOrXzmep0tSMX9zaoHhlLhV7vaY7TM9ve2pG9
         r9pmxX6UfTMjWVnm0KUpod6SSbGSPIuUaorDi+35dypFCdqjatkbnVLVF9D+fJAI/hzn
         FH+A==
X-Gm-Message-State: AFq9FYIcod9m+Y4BoM8u5V/QsWr+3BLzyiGew32rpAM065NJOYYOOkuM
	ax9vWdoq/ZikrXnGAt2zBm/Xy6X2txdjmOkqimWjHwX5U7HCsF068Tik/tpO/mj/i1djUg87k8P
	0TzeMxBTUIDNOStctgnTbY1Z3+den/BrgV4e3yywR/2C6SjTe5fsfwXm4Y92C1OX2
X-Gm-Gg: AYBFou0KYrL1J1pdSisGXrMbn8V0glNQmBz06SdggmjjptrQKR3bDFQVrHy0q9pFBQE
	XVYoPcALDRIcBcASjVoGZFp4CGL7d5HlT0x2og1DO5QMu0Ku9bCXNZTMv+j8MjRiK7X+hM5Qdf8
	EjMknog4547BOL8hA1z3BW7NBO+OiaWD/Czh789P4mdQe6tRfz2JDXSRYHFbBuQrwWzf9Wu6w/9
	HkYP2hGeY8hsFdXkDShK+WyfSGd0SAQCNTbI74MmCgpqqMMP3BoU8zN0tKV/QwzU7YyyIeKQt32
	4oAi2Lyh+qNGlQ/Xr548vx1Y9rwvQ9jUT64zRBiv0YIttY7uSAXerK3NVfAo3agvCQw+3+RmI3h
	+VU77QCPGXaPkesZLpAopGkzsLHfuF0mRP3A0heqOahXREb91L2fGcGOISZZ98H8lwi/WibAF5I
	caywHzRINUsKdQhsUbWk7mYg==
X-Received: by 2002:a05:693c:820d:b0:358:eccb:af7c with SMTP id 5a478bee46e88-369e8515310mr15323132eec.33.1793101820929;
        Tue, 27 Oct 2026 04:50:20 -0700 (PDT)
X-Received: by 2002:a05:693c:820d:b0:358:eccb:af7c with SMTP id 5a478bee46e88-369e8515310mr15323109eec.33.1793101820441;
        Tue, 27 Oct 2026 04:50:20 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm61918825eec.23.2026.10.27.04.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:50:19 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH 4/4] arm64: dts: qcom: Add Mahua QCB
Date: Tue, 27 Oct 2026 17:19:55 +0530
Message-ID: <20261027114955.1266499-5-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX1F04TdhgIc0u
 ZFxeLbwbwqxiZbuUX1RmSQEoGchf8SNyeYA+iCnK9A8NEJ/IYwZ4FgwKdU7LPJCNyU5bAIZdonX
 mXgWJBFnkQn1JPs4wVKm8qICaC/ebTE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfXxflojy/pLv5l
 U5Tt64ARWTZQwjWI4OnalihK6dkye+dfnMtyfwb0tSlpSDRN4pu1tTd9PBm6MfEuctQNCL5jkxr
 cOdbOGt/yVQWA3aa8A3NAYgHZAflwep5zXn90a+BJbsPTkmrPamjI5nhKQkynbkN1u7FDqTRuqQ
 zAGet3DKBZufinIMnIRx/hX3fbb+JI2d9La2rXGgARh4gMBGZAkGqNYMoYXpAGRcorwKeddsiuY
 VD18NvyfbnPyNDjEBrYZ6RTjizQAiPLY1B0QlTdvZuBeerObqkZGXV4nLQqzU0ISrCjAlVgOC3T
 xSxlCpx3grCMo0Z+Tiey0EJatGZl9Tf51jHI7sZsVLPIDLjrnggcYM+yH2r3Rf/snidsNTGH7RT
 RGpIGbF6H9Mqe/EIkl3Yrm+PT7H+fDNUC4BWCfvql7H1mhFU3vz4BYXBs4r5E7I1E24nGrmndBy
 0PsKdR1Cnq7nxWKIbnA==
X-Proofpoint-ORIG-GUID: plsQKtf1EHgX0-DgHthiTSyH3RGgTU4u
X-Proofpoint-GUID: plsQKtf1EHgX0-DgHthiTSyH3RGgTU4u
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae08ffe cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Ajfpb6hXBSAmRpdWA78A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

Add initial device tree support for Mahua QCB. Mahua QCB is a variant
of Glymur QCB but using Mahua SoC instead of Glymur SoC.
Mahua is a 12 core derivative of Glymur SoC.

Unlike the CRD, the QCB is suitable for compute workloads, power
measurements and oscilloscope-based hardware validation.

Includes glymur-qcb.dtsi, adds Mahua QCB specific board compatible,
adds tcsr regulator-supply properties, removed cluster2 PMIC/thermal
nodes.

Co-developed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile      |  1 +
 arch/arm64/boot/dts/qcom/mahua-qcb.dts | 38 ++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-qcb.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..830c43000897 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -65,6 +65,7 @@ lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-lenovo-thinkpad-t14s-gen7-lcd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= mahua-qcb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
diff --git a/arch/arm64/boot/dts/qcom/mahua-qcb.dts b/arch/arm64/boot/dts/qcom/mahua-qcb.dts
new file mode 100644
index 000000000000..0c742c54a237
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/mahua-qcb.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "mahua.dtsi"
+#include "glymur-qcb.dtsi"
+
+/* PMICs tied to Glymur's cluster2 are absent on Mahua. */
+/delete-node/ &pmcx0102_d_e0;
+/delete-node/ &pmcx0102_d0_thermal;
+/delete-node/ &pmh0104_i_e0;
+/delete-node/ &pmh0104_i0_thermal;
+/delete-node/ &pmh0104_j_e0;
+/delete-node/ &pmh0104_j0_thermal;
+
+/ {
+	model = "Qualcomm Technologies, Inc. Mahua QCB";
+	compatible = "qcom,mahua-qcb", "qcom,mahua";
+};
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
-- 
2.43.0

