Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4FA3F929B
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119212; cv=none; b=Z6OnYaANPmKGLkC30CbGhGFx3UpgR99zukPtx3abUSQJfHlyperflZ/sKpTXmHImc6qgtB2mPvolSuwLpTxnMY0m5406b51/3mtQhcyhK7WfRSDL1bZKqdvOwvJZxnndykh9o1UPvd+7L3clJAU6XubDbq/qkNcKvox/lOfZ8U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119212; c=relaxed/simple;
	bh=0/pIibNBgNzOYu+fYPazl5eO9Jow36HYy/Z4txXMszQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GrBvCCg99e17AwbpNYA3oa2xT3EYaGvFFAl+xNVoWrX8o8iQdsgxZMuDZN7aJCorK5AKXvTob82IoDXnahPQb4G6sa03G4Vx8CDXa0TZkCC5SDKLBWZ+1P0IgR1nOxRGOwWX1Rn0zHSnQyN2PWG+gjXMqvKDwX23RXn6cT4R1aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ftgbw1RB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPbNV9/1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ftgbw1RB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPbNV9/1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MIXSpS268429
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sZGnR081XRF/rlNAhxt/kX
	CtD3kJxHhZmxCbBVLj1qQ=; b=Ftgbw1RB+V7y5fke3cKDOkjCyaiDUwbt94g2Ew
	+jwKcr/VkQyFEGoa1vSd2WgZZPZcEO/g/YNKh1IFMA1JNphhlplyuP709AOWt6b4
	36C6OBNuoQXTPlrBYKkSN/GJyko5qJo7CjEwRSInzHfJRPQDOEpV8RM5l/LuAl3E
	ZHZcX8ityQx6IaBEA6Po/4m6JNuGhA6ts/wE5Fx7vxs9hXRRO8IaUfNQUotwFtid
	U4AecczFMrBs1FConmgm60QSTZgFfHoI6s9e5oXRKpC1DUtvVJoIwh28773VsGGT
	oqv0Vh5biGzrNtcjPjDS2xq8CRq6Ap7S3EkOUDtUWgWe9hJQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c1745-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:20:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso475180eec.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790119208; x=1790724008; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sZGnR081XRF/rlNAhxt/kXCtD3kJxHhZmxCbBVLj1qQ=;
        b=NPbNV9/1HPtKrddDJJm+XFbV/RnKuy+mB/Ryy1u0B7PLWpAlrSbAqkHx0+hw5TULEb
         EfMwpTfi98BE9Q7osnMDU+VuZ10f0MuHYFo0j3a7BYL/r22xkjy/qFrGPvAbKayOi4RI
         T7jF2ve6IRv0mtxbPf3iG3/UahPOTYDvEHR5o9u85a5/bJzwQx5Q7Ut8kN58lT9/MkVD
         GK3/rC7mY67IdL8qnkSaSfIaVXlUelpVqIx0+B7GEwZelkEGoXDYTUE9F+OnOUkZNN5J
         EgUz8iHtm/FtLWfxvMlzVRI6pw3GigbKvYHVc594jES0GgeKrWyqneJxmibwE52gy3TQ
         fStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790119208; x=1790724008;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sZGnR081XRF/rlNAhxt/kXCtD3kJxHhZmxCbBVLj1qQ=;
        b=ahvlMjsi3/QszA7zTmT9ZCgm7aoRH54j7NjyZ38foLu59m0h2wZQjchYLxkdvmNRFc
         trY4cfLNUcBDQ8KifNu3Za6VXJtNbY17IhQEEdM8HiRTIMX7gxen2NxfAeoNQ16Breqk
         02/+pDJNUxm0hZKxJr6kg1uOGu5QDM3y/1ePtSTMWovmSTG7KQVwnYPg0BL92LF5aIJn
         pE2bW8pp3SCud+9qQlVTY6gCFDYTT99T3TyGBLzkEQaYdAygi5P9Ozwv3Y2P0NpFXlZQ
         +0QyjV4zef398TWbyH5IGJOjhJOSKktXQTDIfIjL56C06lrb0RsBDQPEMs7D695iisNu
         nAfg==
X-Forwarded-Encrypted: i=1; AKwUvBwT91i0+FVpHP9d9T0kJ+76qfnLBttI6RgVOyPt1/RnNSMqgORMQRhuqpnTsw2fPIC776I61/z0d5ra@vger.kernel.org
X-Gm-Message-State: AFuF++lUccDtCw2FY2J9SFjrgGh7dlaTG9A0UQ/L/WuPvfLWP0lb3jVt
	HPU73qNaISvLBZrf7QzhZSaSA5oft4lJ9aOMc6B3BTELUn1NnT/rbf4r19SAQ0Xgcr5hlpxNV4i
	lDy1DmiLPT81m0yCPJ5n3lsTSY0UE/zunYm2bqNwbXnPsjw2ny+mjPUZjF+E9LTeJ
X-Gm-Gg: AYBFou3stjWxfcH5SiXanDiCAdn+YHYotNlxCCARyzrEUkuIwJslHgx05WfxXqyud6M
	ws+gsvNyrJ2Le0XzXNe3oGAe5s7GobhdLxnfuGT0nePu0+8Yy3PrbQq7JVn6axMAHRpLStooKHv
	Imiegi/OSeIUxiIZFg7apt4sGjcJVt0/akoMYo3PyC0PV8KVRnWraZYcEqQXa9xOJHyv6X42io7
	0AA8JDqTtZOJwEz7bIgzfEPkWUOJP3LynVDtrpfPrY0iTLdx6NHObS1FnO463SOZlYaqhk0SKee
	l1y/KSdSIa99kkinIfaaILAKE3lSAq1bhVUSDMgl/Sc2IY+PraDkpzF4ycYZs8gM+d027acY56E
	wbFAwQPCzpvFewYuLtNUITfypa8ENG6+OkVgI/sagdOUjk64mOA==
X-Received: by 2002:a05:7301:730a:b0:333:f303:502 with SMTP id 5a478bee46e88-33e8dcc695dmr674287eec.27.1790119207809;
        Tue, 22 Sep 2026 16:20:07 -0700 (PDT)
X-Received: by 2002:a05:7301:730a:b0:333:f303:502 with SMTP id 5a478bee46e88-33e8dcc695dmr674247eec.27.1790119207024;
        Tue, 22 Sep 2026 16:20:07 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96f47d52sm1412845eec.28.2026.09.22.16.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:20:06 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: Introduce Maili platform device tree
Date: Tue, 22 Sep 2026 16:19:57 -0700
Message-Id: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB0Ns2oC/x3MQQqEMAxA0atI1hNou6h2riIuGhs14FRphmFAv
 LvV5YPPP0C5CCu8mwMK/0RlyxX21cC4xDwzSqoGZ5w3wTn8RFkF01cxtZa6zhMHaqH2e+FJ/s+
 rH6opKiOVmMflPphgPZznBTUawXZyAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790119205; l=3190;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=0/pIibNBgNzOYu+fYPazl5eO9Jow36HYy/Z4txXMszQ=;
 b=c6GApqGSkHBu+/2NPBeI+wt0w24ksTXfoehkRCxqEgZDYPkwgdgj2iVz0OJrOYvv284JU/IKw
 jmk6RUcjyvWBna3SOMw8Z+YKqjK43RfSIiPYjeiAyKXtL4Mvz5SIst7
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: D6thrV-cLd0bPxj2MvTLbyOWx8vACtIc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfX23SagXmmKx7i
 JGNgt5iQ16rNTrCxr48zGPL+gjxejQPOziUeUyThboKNrX5I5Xldpt47QICRDY0PudOgxRFO5B0
 w9H7cr3vI4xTQ3suCuF5wGP2xNgi0wk=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab30d29 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8 a=_I6dFAXXm9IZ1C54fn0A:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: D6thrV-cLd0bPxj2MvTLbyOWx8vACtIc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfXySx1FIWoLSHC
 I2SpcC1DEALncZjUyEKubEc+PVRZByjSQBbuo0GajahyY7IGii8YjSJMLzqd0iVUCz/V6BmPWkK
 HJ8Uqh3FFlv4bxSNmfdY1wU4a+mTJEXg2wWEdEBat4obc0Mt/5WUl19MPeR0X222hoYoLlREwBb
 koXprFIIbQABTReBsL19QSzf9jCeA7SR2VOhWKKlmj5pxdtb957KkDUG2ESdgRbl1Vs+2EB3SS2
 OcQE13SxFbyP4jH6JtNXvYJesbUG7XrnKU7eb6BINM18GWdrKbsOseLA9cTb1rbfUHcAl5TpyT6
 F7jqBs0KmZRUwNvOsiW9QlXyyeolmlBWYFeHtRSQGL1N/n19MeoCMkKdBVMhbAM0QaPKPDsT8z+
 kdM2Oq6zq+Y7K2f5vj30x9QHB176yh63VNevpgTG4dwuTvImDWLrMCZzhwA9A+rowOmYhrLCJCH
 ievg/OuW1cuowcvnHuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220306

Introduce the Device Tree for the recently announced Snapdragon SoC from Qualcomm:
https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-gen-6-mobile-platform

Add bindings and base Device Tree for the Maili SoC, MTP (Mobile Test Platform) which enables
boot-to-shell with ufs, PCIE, sdcard, usb, DSPs, PMIC related, tsense, bus, crypto etc.

Features added and enabled:
- CPUs with PSCI idle states and cpufreq
- Interrupt-controller with PDC wakeup support
- Timers, TCSR Clock Controllers
- Reserved Shared memory
- GCC/RPMHCC/videocc/gpucc
- TLMM
- Interconnect with CPU BWMONs
- QuP with uart
- SMMU
- RPMHPD and regulator
- UFS with inline crypto engine (ICE)
- LLCC
- Watchdog
- cDSP, aDSP with SMP2P and fastrpc
- BUS with I2C and SPI
- USB2/USB3/type-C
- Modem and SoCCP
- SDHCI
- random number generator (RNG)
- tsens
- PCIe

binding dependency:
ufs-phy: https://lore.kernel.org/lkml/20260917080622.824253-1-nitin.rawat@oss.qualcomm.com/ - reviewed
cpufreq: https://lore.kernel.org/lkml/20260907-maili_initial_clock-v5-1-e79bb6b93a49@oss.qualcomm.com/ - reviewed
oryon-binding: https://lore.kernel.org/all/20260923-hawi-dt-post-v1-1-e41473b6298b@oss.qualcomm.com/ 
spmi-pmic: https://lore.kernel.org/lkml/20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com/ - reviewed
qup: https://lore.kernel.org/lkml/20260901-maili_gpi_binding-v2-1-c10dd2324a09@oss.qualcomm.com/ - reviewed
pcie-phy: https://lore.kernel.org/all/20260917-vdev_next-20260916_dt-v4-1-e2f22f67646e@oss.qualcomm.com/ - reviewed 
gpu-smmu: https://lore.kernel.org/all/20260830-maili-gpu-smmu-v1-1-253e1108ce82@oss.qualcomm.com/ - reviewed
mpss: https://lore.kernel.org/lkml/20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com/ - reviewed
cdsp: https://lore.kernel.org/all/20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com/ - reviewed

For convenience, a regularly refreshed linux-next based git tree containing all the Maili related work is available at:
https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/hawi-maili?ref_type=heads

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Chunkai Deng (1):
      arm64: dts: qcom: Add header file for IPCC physical client IDs

Fenglin Wu (1):
      arm64: dts: qcom: Add PMIC support for Maili platforms

Jingyi Wang (2):
      arm64: dts: qcom: Introduce Maili SoC
      arm64: dts: qcom: maili: Add base MTP board

Yijie Yang (1):
      dt-bindings: arm: qcom: Document Maili SoC and its reference board

 Documentation/devicetree/bindings/arm/qcom.yaml |    5 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/maili-ipcc.h           |   62 +
 arch/arm64/boot/dts/qcom/maili-mtp.dts          |  960 ++++
 arch/arm64/boot/dts/qcom/maili.dtsi             | 6956 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmg1110.dtsi           |   57 +
 arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi     |   57 +
 7 files changed, 8098 insertions(+)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260922-maili-dts-d71b886be9b7

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

