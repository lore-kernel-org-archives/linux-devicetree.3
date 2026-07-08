Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76381430CCA
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 12:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513068; cv=none; b=ItAWGbo5uDp+a2HMGqPibCWbs1YmOiB9RRls+ua87pRZcrV5oi3RYX/Et/DsJWrGrz6oV9wT90ObfBRc7V6LpQjEKh/bpQTvHbPN1Nf2AaY+PX/610LGNut50yRQYNpuICs3NjKDmo2O0ZdUsFWl1W+UfT/m2DZaXfkUbPX4AWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513068; c=relaxed/simple;
	bh=2OTR4Uda6T9rFzecFPmo1D1H7dwe+VKFBl6L59G2A0A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fm544aUBo7d/z4B1SiCh2RJCA46l12mPUlEj7sMzjGXDHMnSyUxcL0Wx/ZaaZg2BAgb4C6SNaGUGz8OWZkCjlVxvYW2zsjUFL3tO3SEYhAvwhJ5XJJ/zAu65vJaF9Tt4KNxY8wats7ZPavGZ4d2acX5x2fvjAkscGIvuqvFDc6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ey/Uu70q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LlQCdeFy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ey/Uu70q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LlQCdeFy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3Ljn2753376
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 12:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q/Ar/kPupFf4wpR5UurFF2
	yKHdeIymF31jARad6asx8=; b=ey/Uu70qUeUksEJbhJ9mMCJc8BCsq7p2CZmqJu
	ospjy/nUGKuMya5eq+eMEVg+B/GuXO0f4Y/us8iJaMUV9KbbfBEUVOAalcHK9bC6
	o6zsv/1qNi4eteAwcaSbMswzqhV5WsXeuSkvnCg85wQFgGPbB+cIIv2W8NAJTXPz
	X9GDfc/mBgRR21kocufjfOxGToAG8ldn1NrdCaDg8ckEtr4Du5oSO+l1jzcKEWyJ
	HUud3iyv8upxDplm7/xYSl+KjZE4h6+rk6YVg1L/tS5nwep5X5h+AHz1D1dJVjdm
	YsoKz5wT4dS4OCCQgj+NzXBU6IgGU52IbkGzsN/+kYbCxzDA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hhjt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 12:17:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9fe2607511so891723a12.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783513066; x=1784117866; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q/Ar/kPupFf4wpR5UurFF2yKHdeIymF31jARad6asx8=;
        b=LlQCdeFyqsBLRzbzpQkfTN1Wkc6MB5pA35v8NXYUNvk4dIC5Stg1YIgjt28c8ifsDU
         6G3FEKva71zxLUa9Pdw5wLUoa3JcUskwX6u5PqUpNaBSwSVdN9N+n2ZsDtbztBi0pQ5q
         jHauhAmcfElUowRZipPVlCrqUkwsj0HDngjZf28+ezHD5D27ZBGnogB5dv5W6uygTQV9
         LGY+W6FBdag/sy0R2ltfN3mchLQqVzYRaoq7WGuHq1T0RkkD4Zc7rzRPCVoJzzpKE8Nt
         97n4GzcfMvt7xxRwh8FLMvz5WHez0A+BIcI975KVheff1YJPmgGCFMbrbLpMcKSJUuQc
         biVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513066; x=1784117866;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q/Ar/kPupFf4wpR5UurFF2yKHdeIymF31jARad6asx8=;
        b=l5yhZuYW01aCKNbUKbPetUEfV0xkeZeoZQznIWr5AlI6TaYXEhA6Pzjx5zjg2pkMNk
         KR81VrIJNr3wV85s7KmTB03x+tlnz+Py2mG+RdzFuqZ5IK1beZMBeaEH+3HpoHxGiw17
         hUp8JpaCZypnLIMHqiZ/LNefSWI+wWfhw0Z77+fwYA9t+2uwazl3qxxXPmX3jI/n+Xvp
         bYmx/tkV2KIgGbJOP7tOcAkRuoB4u9ERgdSdPg65WLtNvcxdsTXesP8wvBnqGxX+pkye
         fBUmgLqmiELIsVIa458+fUyaegsXtUKQz7fymWeOZa/0yeCI+DzqeH6VNr4d961VEWe2
         6CQA==
X-Forwarded-Encrypted: i=1; AHgh+RqXoBPKgmdW5O3k8LgVjmwRc1zrhZVL2ILjc/I8ZcZn64ITqxro4eS6LER/htX8BjHDjYWugKzjVP9J@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/zU4vxRzge+xGdFeAwm/51cXwUrMdvXhrq8rdQrm5bsLrS9zD
	lvRldaCBPWE9wdzhSPN5qzrWWZEFiMJ0vJEZ9GtZsBthe6zs4cBVaZc5UUglRxmHitu5IfYUyAQ
	jtB4UAZ5n46dvb2chFtQcoIyPtixHVChsgOkMls2pXJ3kdEFUi2M8fFQI1Tb0bCakacU4hr9b
X-Gm-Gg: AfdE7cnVk0aMu4ox0nJat6juD2MegXEQZfomSkf0SCih4wqG8Ck64PP7K7379qlzuAL
	X2iffu4kMvW0sxU71XZa0PVJCXqYghLYOLeiBHOrThQEC7xT04Bi/hoMicuEe7Xhk9Ny5S1Tb9x
	5RfN04M0mz8JIJ88qqaFP93LgoEeml2uZFpUjcOQsIH+l+JjcBquIf7DxcPF7ZnPsCjTeMZqq70
	nUjCERNSox/TEzGE2FtKkMYsQ9/x4KVXCVE7WEPDd1SPx20Ol9HPz4WqF3BcCa4G7GSr+yqlHaZ
	utKvOiQoN84Y7TEMOGtdeqIHhW2aTeNFn+wXYiaVdl32yWXmv3WDilc9fKTsM+NylAEIPAX5rWs
	VWPs12lGLzbIDEQfOjDL0oNsBOg==
X-Received: by 2002:a05:6a00:b4d:b0:848:2f73:9002 with SMTP id d2e1a72fcca58-848436957e8mr2546897b3a.75.1783513065811;
        Wed, 08 Jul 2026 05:17:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:b4d:b0:848:2f73:9002 with SMTP id d2e1a72fcca58-848436957e8mr2546850b3a.75.1783513065294;
        Wed, 08 Jul 2026 05:17:45 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848337d12ccsm2367474b3a.48.2026.07.08.05.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:17:44 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v7 0/5] arm64: dts: qcom: Add initial device tree support
 for Shikra
Date: Wed, 08 Jul 2026 17:47:29 +0530
Message-Id: <20260708-shikra-dt-v7-0-977b65a300c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANo/TmoC/43SzW4CIRAH8Fcxey5m+IY99T2aHoABJe1qu6ybN
 sZ3L2qtmGjSC8ls+P92GNh3JY45lq5f7Lsxzrnk7aYW+mnRhbXbrCLJWOuOAVMgKSVlnd9GR3A
 iqCVaLaRQQnV1/8cYU/46WS+v53qMn7tKTuePV7FfnDzB7MVbhUDGj6Gu4f2tEAZWREwpcQ/9L
 Lu2nUuYwyWchzgQnzeYNyvitPcWWaIKWT/Te1EJf+cooU2mJJPzCOkfySmU8S9aO6XK2CjA6t+
 odyWSsB2GPPULGTQPaBMYagMNQkSueeTovFeGU+MpRuoo646DW+cybcfv051U6zi53/GzZvwzJ
 UA0VYIbzgERnrelLD937v3402VdTtjMWsC2AKtAAOotJC+4lQ8A3gDspgNeAQMpYTSOYxAPANE
 CugVEBbwMjiYHnlv2AJBXQN08wVlWgAKPyJQzktkHgGqBmyOoCiivgpcGvdD6DnA4HH4AlmpJ6
 ycDAAA=
X-Change-ID: 20260511-shikra-dt-d75d97454646
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783513057; l=4467;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=2OTR4Uda6T9rFzecFPmo1D1H7dwe+VKFBl6L59G2A0A=;
 b=yYGvcWSnNDplQkDlmcBbZ0ZZTR5IN2C/Fuq11M5+K33m7els5MeYYAA4bVn4wV+oou1kLid7X
 I7MuL/OH4nUAUG4IZdDbjQ0m+LAgAibvRQwbNjZjDyBowj43dR6s9fd
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExOSBTYWx0ZWRfX6wYNPo8La4GV
 mg20nLnLBeb6fAln3Etg/9bx3RbYrWmvOtXNXaR/6JSAYUATDDzwN8+/WlveVs54/kzM7r2bA7J
 09cgqv7aB0gBrmEkt1otzlyAI/3bGX98y/xD/bV2g7Tg8fXor825TVY5aE2ZwxvZu1nYptYfqSc
 2gXQwhEMVQvgerMvaE8orQW7W43hYKkQNtG+qPq57ydqU3Hfp3K6w35zF2d0ZSLAvF6bZIoBtN/
 4NURAm9ptHUI819Shf05RzfF9UGyjrgVQKMCDzPrghGk+R1e6s+jleVYt4N8v8seVhz1dCR35yq
 km58v8R4zjbuGi0m7fRla17bNQJH2QTD5po2ojcZPwIXOVG4KSzgH25XHvZMPp+qRo16wb1Qv9s
 dGiCREFePW1fgYH8ZS1A47e8tUrMD1X5FqU9byB/qXjcnMtehyj4hEXrAd00Qsl7A8odVKgqlrM
 h/yD0JDFMSlY4fGdEvg==
X-Proofpoint-GUID: Fpev2TwrXcRqBD0nflxkrO-jD_9H0yxc
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e3fea cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=thxruFBVZ7uuMI2BP_UA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExOSBTYWx0ZWRfX6uRYpeJUZDhK
 ly1XFxh+/ulo7pzjrExjAVRKjIOQDP//SBGmR9oGNeL6mbBX/moJNpaPhc2dd/VBiTIDJ9SHWMY
 v8b3DgHzkOmxUGyWkH2+FLXId62C2Ig=
X-Proofpoint-ORIG-GUID: Fpev2TwrXcRqBD0nflxkrO-jD_9H0yxc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080119

Add initial device tree support for the Qualcomm Shikra SoC.
Shikra ships in a SoM form factor; this series covers the CQ2390M,
CQ2390S and IQ2390S SoM variants and their EVK boards.
The series adds:
- dt-bindings for the Shikra SoC, CQ2390M/CQ2390S/IQ2390S EVK boards
- SoC base DTSI
- CQ2390M SoM DTSI with PM4125 and PM8005 PMIC regulator definitions
- IQ2390S SoM DTSI with PM8150 PMIC regulator definitions
- EVK DTS files enabling UART and eMMC on the carrier board

Note: USB support is intentionally dropped from this series. It will be
sent separately once the USB driver changes for Shikra are concluded.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

---
Changes in v7:
- Rebased on top of linux-next
- Collect Reviewed-by tags from Konrad
- Link to v6: https://lore.kernel.org/r/20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com

Changes in v6:
- Collect Reviewed-by tags (Krzysztof, Dmitry)
- Fix ranges value and interconnects alignment in sdhc node in shikra.dtsi (Dmitry)
- Link to v5: https://lore.kernel.org/r/20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com

Changes in v5:
- Add qcom,rpmcc-qcm2290 fallback compatible to rpmcc node in shikra.dtsi
- Link to v4: https://lore.kernel.org/r/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com

Changes in v4:
- Updated commit message for 1/5 and 3/5 (Krzysztof, Konrad)
- Incorporated Konrad's comment
- Collected Reviewed-By tags
- Link to v3: https://lore.kernel.org/r/20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com

Changes in v3:
- Drop USB nodes from this series; will be sent separately pending
  conclusion of USB driver changes for Shikra
- Fix memory base (0xa0000000 -> 0x80000000) (sashiko-bot)
- Fix power-domain macro: QCM2290_VDDCX -> RPMPD_VDDCX for sdhc (sashiko-bot)
- Fix INTC GIC_PPI number from 8 to GIC_PPI 9 (sashiko-bot)
- Rename SoM variant CQ7790M to CQ2390M (Konrad)
- Add PMIC DTSI includes to CQ2390M and IQ2390S SoM
- Link to v2: https://lore.kernel.org/r/20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com

Changes in v2:
- Update SoM/EVK combination bindings (Krzysztof)
- Add per-CPU-type PMU nodes with PPI partitions for the heterogeneous
  cluster (Cortex-A55 + Cortex-A78C) (Konrad)
- Use full product names CQ2390M/CQ2390S in commit messages (Krzysztof)
- Update RPM interconnect tags and power-domain to RPMPD for sdhc (sashiko-bot)
- Update to use MPM for ss_phy_irq instead of direct GIC for usb (sashiko-bot)
- Add IQ2390S SoM (PM8150 PMIC) and IQS EVK board support
- Link to v1: https://lore.kernel.org/r/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com

---
Komal Bajaj (5):
      dt-bindings: arm: qcom: Document Shikra and its EVK boards
      arm64: dts: qcom: Introduce Shikra SoC base dtsi
      arm64: dts: qcom: Add Shikra CQ2390M SoM platform
      arm64: dts: qcom: Add Shikra IQ2390S SoM platform
      arm64: dts: qcom: Add Shikra EVK boards

 Documentation/devicetree/bindings/arm/qcom.yaml |  18 +
 arch/arm64/boot/dts/qcom/Makefile               |   3 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts     |  40 ++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi    | 156 +++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts     |  40 ++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi        |  15 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts     |  40 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi    | 170 +++++
 arch/arm64/boot/dts/qcom/shikra.dtsi            | 842 ++++++++++++++++++++++++
 9 files changed, 1324 insertions(+)
---
base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
change-id: 20260511-shikra-dt-d75d97454646
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-change-id: 20260430-shikra-imem-binding-a7bb9d2f16d2:v1
prerequisite-patch-id: 80d8ab865b7b0663c5b2878b45b55e2e4fde9c19
prerequisite-change-id: 20260501-shikra-scm-binding-a7ff5fabd0f2:v1
prerequisite-patch-id: 8e645e1c6ad6182de4813a726c293654324de1df
prerequisite-change-id: 20260501-shikra-tcsr-binding-fff1689e4097:v1
prerequisite-patch-id: f6781d2cf0829ccb32f1400623c95739972f2ee2

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

