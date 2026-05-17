Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFB035DA79
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779029781; cv=none; b=S5LU7ArOHxibWI0SAxsc8DYCx+p8jX3+IdY7KT0Uf5qz8F44s5dWW+gPivn7M4c9lXSZqIwQmD//ZOi8P9mqBajo3btSe0Ac5fqTpgKwrD8CWbrv8v1mqq5buH7S9/eXbHlBOD4jzaGcsMiTvfImplC5AVSbhFRV97/39UNgCBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779029781; c=relaxed/simple;
	bh=q9B3/HxPM8LiJR7e38jupoj6d1gJ/EiYwRz0frDFIsY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pGd1E09lOGkRmPCpq+yeBszPjdAgv4gk4KJUC7ypzuQtD1jsOMfs3cxj6evs6PDTUoovqjFaj1+62+fQkOifAg4PyDRcc6fHdFYa4UZXlzEqvkE7xDCqQIvGJ79CaoELAZQrXylHMzvm2sllNiPTRfmkFieZsB3F+43bNWWsUnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OxNa/O/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dtl5XfHf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OxNa/O/Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dtl5XfHf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HANRk01888240
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tdx2730hCP7/lzgiJ6Hr1A
	i4NuZaqlsJ0h2QmgQUw7o=; b=OxNa/O/QTDfnl7W2/8ugSZ79v7HbuDnKn7yUC8
	VYf00A2J5wPHezeroR1ZkdT9lc6MHLfSP5Rf+HbFYdoGrGlZze8CMl5xxTWJqdAD
	SeNennfSkvGxZfgHC/c0fJ1Ro127f4mNnYsqR8fgusfgkBo1nbLV2CU9bXrooVMB
	2PIqRull6G48JhJc4oP6jhHUIDG1XV0oviYaucI+Z54u1g+bxOeKSArhQHVOY6tB
	ObrJ/jkDk8EaG4XschoseRzjVQyRZFCK2YUVvL0OjO+CPWMKRJAcaNDD798OVJDk
	XmBQEPYZ11o7sldFglmVzBgF24baC26Z89RDa3oKO5lwZ2uw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gwmb20k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5165d10e036so25176761cf.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 07:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779029776; x=1779634576; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tdx2730hCP7/lzgiJ6Hr1Ai4NuZaqlsJ0h2QmgQUw7o=;
        b=Dtl5XfHfJlBwyKBzUnNiOzt4yXQTJ1Zn+oLXTEwCZFcYlxjdr6W23wa/uZKJucupjX
         ZXUEOG2PqtPVpfokTDKLrCSSsDdCEuEVU3rXz2A3JpPliVoo3J2KDk8JlwMoEqn9j0lm
         WK8mqiqlt7wChMHIfK8Hk/IjWJ4hSE7fhouJAzGenSgRNHktpE2enSC19FujVjcq/CO0
         t8opWk8X8c7torB8nbc+o5RoW2NykYYSXyepH6UqvNSThNDZoFPMFoeM/pFlGkJpzY77
         68OQ9ELv985HXkkk9E22Pte8Nco5e/QBTQmir2eNIWkGxW7gUWeZT0kr0ZfWx/SGYgE3
         3daQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779029776; x=1779634576;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdx2730hCP7/lzgiJ6Hr1Ai4NuZaqlsJ0h2QmgQUw7o=;
        b=a5WuBFH/iKTPsHWCwbjtf0fnSGV59eobjEPmWo5+LIxSGzvw0LtOENb+1DDb1/SFSk
         /y9EADEanGhfXNagCv8XmNv+xZZw6yRE49fbqiqvaEGJ4IwPPfeIQ/3TW42vqXlo7S6u
         RQT93bR4LjUu1pSR3eKApmSxpDtGB7EJ7QLbtiDSPYE1ZQsdaDq5ySod4Gevk+f6Saoh
         AQXKZ1UYo3DGHY1v2Ej6K2v2PmIELYSocOtRPHThAwuGypXAQhIeQZHfV+6xhnp7K8zK
         isC3e8ilxFfZIilYfzunTGtB6Wx531kyENDBcj70zxw7Wp0QYRfyDRLD6E7ruMi9d3Ry
         RoVw==
X-Forwarded-Encrypted: i=1; AFNElJ+B6t/nEO2/jqbS1gjnA9YsiekYFSCIO9h+A7xPjrgl0R+P7502a0uWU5+hDJzoEqcy5EqTb9jRmdHC@vger.kernel.org
X-Gm-Message-State: AOJu0YwHIT34SNXARBxBVkYmXMzoXCqQIvgvH9V/GD1yRvl3gQjs34vt
	RW1OdOsgkb1cCvnZnwzGE4aR1fL1C3JmLjtWSM3pDKw0R3y4betbsPab+8M18ebMy8jRi8M/TQj
	xrnN+UlcXVbf0e0GYNSLEuXDIfB1g8SQu6qv5UG6unNWocxG/YWWIdvavBiI+LcRc
X-Gm-Gg: Acq92OHpch0vtGkHpGboEMvvS4sPVS9eCDbVhZ7ouL4Iza9t2L27bOjEprQ6Zl2tHFF
	Xkxm+Bv3NthY9xvCxo28uc3o0q6MN+1Ckb8QYZQg+JvtVcFx/7F92PFTMY9dvPYc+O0i8QNUWaH
	xRyEWlIU/o2zDPqKvARZVkc/qr6LaTDEBaovb+2V27BLYwggUxCok1t1J8H5o71IU/NVH9TrXnn
	J9iF/0D28U6BdPSbqRhcCHyTTKVxdlG93ISuUN45/OBeLZEQF5yL9ohrXaHH3zgrdt8fK54J1yq
	CYvqRKkcIyfdbtORyyC+k4EkqJ96U1llWjMv6J2g0WG9meaNnUR9kRN+KpRAsSfqbFC3nOYarFz
	SduwRWK9Wb2Wd7rdC0gAHv5ztjv3BC0JeC1YD52Et60F+YcrBfBsB3mdu1g2rc+TCR0FH5O0mK3
	PmcM77nD4BhcGPCr+kqq/+5QcunmeBdm1ugcs=
X-Received: by 2002:a05:622a:a06:b0:50f:c36a:3826 with SMTP id d75a77b69052e-5165a0ae89emr169500871cf.16.1779029776089;
        Sun, 17 May 2026 07:56:16 -0700 (PDT)
X-Received: by 2002:a05:622a:a06:b0:50f:c36a:3826 with SMTP id d75a77b69052e-5165a0ae89emr169500581cf.16.1779029775603;
        Sun, 17 May 2026 07:56:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm2733339e87.18.2026.05.17.07.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:56:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] arm64: dts: qcom: consolidate IPA properties
Date: Sun, 17 May 2026 17:56:06 +0300
Message-Id: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAfXCWoC/yXMTQqAIBBA4avIrBPsz6CrRAvTqSZCRSuC6O5ZL
 b/FexdEDIQRWnZBwIMiOZuQZwz0rOyEnEwyFKKQos4lJ6/46pTBwCtR1rJRRpdGQwp8wJHOb9b
 1v+M+LKi39wD3/QCmDjH5bgAAAA==
X-Change-ID: 20260516-ipa-loader-403567adc3dc
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stanislav Zaikin <zstaseg@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3618;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=q9B3/HxPM8LiJR7e38jupoj6d1gJ/EiYwRz0frDFIsY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqCdcMXTHL+0qFr/KT0H8gZy8epAyWN2fap9/Jl
 S2qlrE8LniJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagnXDAAKCRCLPIo+Aiko
 1QRVB/9Pyi6rjMQPMtmQoKAh6RmTspEJ7YABeti2mivou3+bUoGmgmUjKSSh2nQ9zo8ncFeFa6Q
 MyLF598kcrNZafb/nrj1VsgokNU4rpeUutCBppQJ1ZfiC47IWZYtjMS5/djtyOIpiE2mUNImMTd
 7KJenFlBshp/tV2U9w687U3KEOWwTikehcLK8WaBdXHX6upglyeWYvT7K9/sohYCYzawxmdEfw/
 OcHRMaYW8t9RBC+bN0+7IwAMSg/JpWrKllruhZgsQPIL4Dqh6309W10RRn7Ey3S1cmAut2bOV3E
 ZD3M/i1ZJDCqzzVMqVxxjb3mJffM7gRPpq90H5p04Yze2aRA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: EV8nbsHlZHG2AGRCaDwOW8D_OG6pgYjU
X-Proofpoint-GUID: EV8nbsHlZHG2AGRCaDwOW8D_OG6pgYjU
X-Authority-Analysis: v=2.4 cv=W/AIkxWk c=1 sm=1 tr=0 ts=6a09d710 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=lGjpoEL64WzembFprfwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MCBTYWx0ZWRfX8Lq2fkaNopLM
 TQytc0fIwoywh556xajQoLMlQGC2x972s6dWISz1dLucEW+9dgEuein24teKetIrVZ9F5/CNEPG
 boMw/NHZrIjzrjfWvZ6Dz5yEU7Hkpo85i7WkRv0FEOpBc4N8oOQDgUsym4GMkq2zgvrpYShdout
 7MLyiEGelX/J3SZ/0Y6P5AKRRqUNHdiPb/q3DSQIj22SBHMntDUPNwfaTphGUTIcmmLV2Xu5DJS
 iXWx2rjDi3/lQNm9HDMvWJZ+lJCtxI+izLF5KF7jEIfAYwmhaiDj72sArr2z7FIHbe9Rz8w9UV/
 GyC8NYJdu+PNBDiHbuuxw3YQ+SX4hLIMnP/15PWz1jfp9FxCTbGFjAQHJv386oSV8Ltc4JdFoeY
 ia7gLakBxA2f4TVOtdA+Bbegoap/4hAKBG9b8LOYN7NqzycxJj/5jUzRZHm46L5446lPOddz1jn
 /SD7HhFnElzxsBOy6KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170160

For most of the platforms the IPA uses qcom,gsi-loader set to "self" and
requires a corresponding memory region. Move those properties to the
SoC DTSI files, handling the outcasts (mostly from the Kodiak world) on
a per-device bases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (7):
      arm64: dts: qcom: sdm845: consolidate IPA properties
      arm64: dts: qcom: sm6350: consolidate IPA properties
      arm64: dts: qcom: sm8350: consolidate IPA properties
      arm64: dts: qcom: sm8550: consolidate IPA properties
      arm64: dts: qcom: sm8650: consolidate IPA properties
      arm64: dts: qcom: kodiak: consolidate IPA properties
      ARM: dts: qcom: sdx55: consolidate IPA properties

 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts                     | 2 --
 arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts         | 2 --
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi                        | 3 +++
 arch/arm64/boot/dts/qcom/kodiak.dtsi                          | 3 +++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            | 3 +--
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 2 --
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts              | 3 +--
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts         | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 4 ++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi        | 2 ++
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi                | 3 ---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts                       | 2 --
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi           | 2 --
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts       | 2 --
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts             | 2 --
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi  | 2 --
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts            | 2 --
 arch/arm64/boot/dts/qcom/sdm845.dtsi                          | 3 +++
 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts    | 2 --
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts          | 2 --
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts              | 3 +--
 arch/arm64/boot/dts/qcom/sm6350.dtsi                          | 3 +++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts             | 3 +--
 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts            | 3 ---
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts          | 2 --
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts                       | 5 ++---
 arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts    | 2 --
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts                       | 2 --
 arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi       | 3 +--
 arch/arm64/boot/dts/qcom/sm8350.dtsi                          | 3 +++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                       | 3 +--
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                       | 3 +--
 arch/arm64/boot/dts/qcom/sm8550.dtsi                          | 3 +++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts                       | 3 +--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts                       | 3 +--
 arch/arm64/boot/dts/qcom/sm8650.dtsi                          | 3 +++
 37 files changed, 46 insertions(+), 55 deletions(-)
---
base-commit: 230cbc83bec52234e456f33a01f400f78bfac0f9
change-id: 20260516-ipa-loader-403567adc3dc

Best regards,
--  
With best wishes
Dmitry

