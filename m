Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7987E1C3F0C
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789894181; cv=none; b=uk+RmNa7FsJYfLf61/1FEcNmqPzhNBnd6SBCWaVIbZRDahfE6uX30ifFzYQkApezSbI7FJNkl7nYO+fYWWzKgPs5jqU9tDyspnL0wPEzdYAXGruH6udEgqk7KfQVczF6GlVudwdgyFQGXkCic+uG9bd5YU9w/ce7prhAVZ3xtjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789894181; c=relaxed/simple;
	bh=JxpFjcchiG6Xh13i4eU5vNvZPmGsunNpe9P10/u/k4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HPRJjwM77NWpEGqjnkg5AgRFsgU3/5SqzWDEm+QkP1qgnstidkgOJl6vbbgBrZoEA4qYUs1YbXpCVqc0xwKQyT5ZY9XF2e2iJRmR9tX19LzK1oR/mh9NZ+wcv/ksDffoPNarcSFWxANwhbm7gDRkBTn8OisQumnpqAHxCUHgdFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E20f+JOk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBPvPVUO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E20f+JOk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBPvPVUO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8VVn62873092
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 08:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UpT1tEVtAo/+O7tOUvHpW5WT6sKZ4zfBFFs
	t8WgyJbU=; b=E20f+JOkALUk0A438H0GWXhaCbfQRcxi8Nb9oX/B/Ypyp0A6j7s
	0/idLuY4qDoYiPEgu7LSytf4GImOHfvMfHtHac/qaHwuco16cYp+plD7q+GrAhcj
	qfSoLGRh7PZtFtQSmoGIQ6xSiIHUmIy4XFn7b9ocq5yM6Piqr0wJurUpVjgd9Z9v
	afxgbVGPyFlj+k56tQTQP238mMPnsNXbXV7W9/u0XJ+0P6X0fPP0hGLhfw8rB6Pv
	EUeiNiS9PjvUIL0G6r3d5H51q3aaxgX3HXTpouGQhlKcnSx4sNw3ZpmoDTbvP/81
	a0aiIyRrBiWP6WEfbn68lOJqeCEwmsSAV5Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshbsaryv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 08:49:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee1ec30f2so29794035ad.3
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 01:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789894179; x=1790498979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UpT1tEVtAo/+O7tOUvHpW5WT6sKZ4zfBFFst8WgyJbU=;
        b=BBPvPVUOhjNBafoR2MOhAlZAv3njBME0GtUlcArmJ8dZFQnsdLZaGXgIgs9+MjqXNw
         s/IdYDSeWJxi/jGRCyrJ0MlTDal+/bT1Gffw+evozBz5hUpc2OPrqDMI2APFHVDJO1ci
         3OucM7B2N0gitKGDdnfGyL4dg0uIlUMZrXMVp25YnxSnePRZB05qzsKqFCg2j7qDgNxV
         HLmiHqVNe2TzRGrXhug/B6nYD21hfoC+E7eizPyegR8q02EpJ5odWAGCyebsATx5/HVv
         O58Mz/1i7izMf2TGK7bcDN1SJLGVyTPMDV9qg82KlvFOjA98sy3SiLIgEGwO7mKalUzP
         +qxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789894179; x=1790498979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UpT1tEVtAo/+O7tOUvHpW5WT6sKZ4zfBFFst8WgyJbU=;
        b=YhU1lecZ20bO2WAJEupFv4O/YEV33ld3lJCSfjcSuRFqRxJyTufBj0hjLhFSE8OgB8
         12+0OmGSIa7PqFhxapybjOzZQv7hUyVbMTq3rYEbuUHpfyCioyenGKKXfcrvezD4vpWD
         ymJU0AKyitAVGku2AsB9Ruz7OcrG15cjWSzy5YiTI7qsWlbgSYIt8CT5RlLm7pM5QQ0+
         sVGliDTpCZTJiq3NiIGzjU+U9kfs0ZWqmCJf1W/WZDhcwU1aCSj/aKj+6HHB6VMnS52X
         ApXE/VizVeY82Xr61wvxmwu1avHvO5dCg6oAuAnVlkQcpAHzVQeWoz1uonrDjerH07ZW
         zGmw==
X-Forwarded-Encrypted: i=1; AKwUvBx7LeilUPakxeyKppqQDbP/8bd5uoMO1UgMjE27SVzGAOgMYGkVxLkwlPahEc3RIb80Dqe1aPSNzU9P@vger.kernel.org
X-Gm-Message-State: AFuF++mZLopRN3j3osZ749XgsgxxGynyl7GxXVnWNLQPCpulBIY7pxGV
	65JADDtAryLB+4EqEnioe4PNoFoJPieQyecJ2dytuWS6PIJOFJMVjUGbl/dHoi7K99/4gi58VNE
	FDqf9plens55iJ0rck5giUToqVEPiAYB+JWX+iX5HE8LlISBhR7ec/jDhbr1+g8sP
X-Gm-Gg: AYBFou3LpBp6zcCpFM/24GB4FrEX4I/+H4NznN+JiNBySbo88xF7VCpZky4YnHwW3uH
	T41HN5zgHWTSycB+PZjiMc3hYe2S0bC7PehrIj8oYwayL1p1dhke7TnWigLuwVQBxBaHfBMAnT+
	Cfh3ltromBQTAvb0Xrr4BcB5SDPp26PSu+w3pVFyghbiZnex1q6oTWUEQZl7trC8otDikZzwwVV
	aCgqoYnYTJ8Of7Gd+ZdTTFDlJKqYbaD+IhYB6M8y/WblIaGvg5g7qRYn+r0nSn2hxYCRjgX000Y
	Bw30TQ93aUnoE8LV+Q+AbCf2/QUnbdSygatW8QfgfLLXm7c9URV1cHBULJrC+xAzmlEqqin1Ngt
	IDU/Da4Qwx3cpVQg5sSLS6/OgU40151Acim1tXm6lWtASJITsnCGK0kcqYyvS
X-Received: by 2002:a17:903:8c8:b0:2dd:c053:ec71 with SMTP id d9443c01a7336-2ddc054099amr67982485ad.36.1789894178882;
        Sun, 20 Sep 2026 01:49:38 -0700 (PDT)
X-Received: by 2002:a17:903:8c8:b0:2dd:c053:ec71 with SMTP id d9443c01a7336-2ddc054099amr67982355ad.36.1789894178477;
        Sun, 20 Sep 2026 01:49:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm11180808eec.14.2026.09.20.01.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:49:38 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC support
Date: Sun, 20 Sep 2026 16:49:14 +0800
Message-ID: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2U7UuGQyTXc4ZKBLqRbfj0Z8BRi0_nIY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfX4VHpGIS395+I
 cqzkm8OebhjIk360t65w6CzHLkF6tXUzriEDnn/0+NzG5GYACPGGLUVpxzGl0GgEfdCo78lgOtN
 nddHsCbSr2uTWuQXTejz7y6xOSGQYEFrrK9t1m9Hz5FoLt1siP4qpP8IGtLiKWtvEoW9KmDS57R
 7aJuV99DnYOukoOlmyelm9TkwKyhBAZ2wEvOyScmEpl83YsoZWULyE152hE5JtyYMunpvCPKJPs
 Q7aX/fnHqMlb3iiVJ2tFPO3X8JgvrAm/zu32JTUMQf+60FcrlqlrSbfsT0cnPpoTxkEy713xWea
 qMbmDJMiKcuZdjLQZ9tFOgORjfoOpoFKTd68RlMRewXB2H6JpF+6lLZ4WB6ACXW0eMIfGkcTW+3
 tUInjhv3iTT0J8Tl6uWdFMhTElXL/P8/GtDYqr8RaFQlSP+QJ5wuwYHzUtFG+2Mtq3h77EwgzpZ
 SZ2Sb3LbW94ypyjR2bw==
X-Proofpoint-ORIG-GUID: 2U7UuGQyTXc4ZKBLqRbfj0Z8BRi0_nIY
X-Authority-Analysis: v=2.4 cv=bPqDs/+Z c=1 sm=1 tr=0 ts=6aaf9e23 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w1NXodApJG8VjLo62iMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfX9/ZECnSssy7+
 uak17APFKTTAsIBKdpXUsDeu2GMNFs7MM0oqz9ikFoq2GvV84YoSGPjIlHvCUevaySCOpMtqauK
 NHkYhZ3Y6SFXLqPHX7dabX1lWDiswKY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200126

This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
and the PMIC descriptions for the Qualcomm Nord platform, and adds the
initial device tree for the Nord Ride Embedded board.

Tested on next-20260916

Dependencies:
- NMXC define: commit e484a765f543 ("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index")
  from git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt
- Base DTS: https://lore.kernel.org/all/20260903140617.441111-1-shengchao.guo@oss.qualcomm.com/
- PMAU0102 thermal: https://lore.kernel.org/all/20260830101025.191697-1-shengchao.guo@oss.qualcomm.com/
- PMM8654AU RTC: https://lore.kernel.org/all/20260904074541.590485-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Reword commit log of 5/6 as suggested by Krzysztof
- Add memory-region for ADSP fastrpc node
- Link to v2: https://lore.kernel.org/all/20260904081619.593602-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Align PMIC comments in nord-ride-embedded.dts with nord-rrd.dts
- Drop unneeded regulator-always-on and regulator-boot-on from RPMh
  regulators
- Drop SMPS regulators as the resources are already managed by rpmhpd
- Use pmm8654au compatible with fallback on pmk8350 for pon, pwrkey,
  resin and rtc
- Link to v1: https://lore.kernel.org/all/20260831032103.341633-1-shengchao.guo@oss.qualcomm.com/

Bartosz Golaszewski (3):
  arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
  dt-bindings: arm: qcom: Document Nord Ride Embedded board
  arm64: dts: qcom: Add initial support for Nord Ride Embedded board

Dhruvin Rajpura (1):
  arm64: dts: qcom: nord: Add PMAU0102 and PMM8650AU PMIC support

Shawn Guo (2):
  arm64: dts: qcom: nord: Add support for ADSP and CDSPs
  arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  63 ++
 arch/arm64/boot/dts/qcom/nord-ipcc.h          | 144 +++
 .../boot/dts/qcom/nord-ride-embedded.dts      | 442 +++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  37 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 907 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi   | 543 +++++++++++
 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi  |  54 ++
 9 files changed, 2192 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ipcc.h
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
 create mode 100644 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi

-- 
2.43.0

