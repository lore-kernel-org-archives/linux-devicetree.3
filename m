Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF562E62B5
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 02:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777257325; cv=none; b=lo+zJGE1PchgGZVLTP4+wxMsinM8eAwywy+sc6dpcDGhNsfMGUyxDcwFawTFhFDHFwE+2Hk5GaS3gnVcNQKDykXAbrl5KYB/wKr2hgn8DzMEhWTzZpK0z6Tq8Yxm6bDkhNi7fbv6lZVnE21mLoLzcd6MJAl5TcO3yPj2i+iw5yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777257325; c=relaxed/simple;
	bh=WgIwEhQWBLCpSWCFtwu4ZW1y8BfE4OLiC0RqGot6eno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ge5zaIKbwgU1a2sXkgvsj1pRfWaJfR2ls4Xj7Ml6PzKBUEIdhYm62mbRaCejTzAS7/phkpJrMJ7wRsaCTsQRkf4rgu9wEShOL3WijZGYg07kLFHTIbQYLYPHgubprNvIo+KLzrUuyTtrNgwLlvjq3ZOetlPoiYB5ztNZ4X0jBpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1No2E06; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H5TIUzoV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1No2E06";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H5TIUzoV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QMXiGT3585237
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 02:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KvyUXeaNJ/bj+E1FtiJrSA
	emMqmopoVbHlry/+nJw+c=; b=k1No2E06X+0NL4csP+P5DuWW1oZRjK/o7sJAYp
	yzljKiRu6EFwvh2ZRSmAlZ54mORLpZICWxaV8k7F22rCFm0EuF5TuYEq8uPCYu16
	zcwnDA3H7EABJXJgmpY5+K6mNSX/MZ0tCoMsfEK0Iy8cylDOLqh0CETuyT29IOs8
	Cb8BkKb54o+me/8OmjYti1aAER6I8mIzQ6wtYphcyZZsV6PRgP4gR/DyduwwE0h6
	lJm920C1EIMZMDKMBIxRQAzYrrZiRGvLJNaj28il0DrBKCqc36PjAR/6OIISOtzd
	r5liDQ5SD+RLZbnHLqEqpPbgCK/63EJmb1dRveX5ZbORNm9A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpcdm19t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 02:35:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so15082722eec.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 19:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777257322; x=1777862122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KvyUXeaNJ/bj+E1FtiJrSAemMqmopoVbHlry/+nJw+c=;
        b=H5TIUzoV3Kh8cRCHKDFTTfR8q2G4Uh7JEhc/kRd/TV7/ChwHVXxCNwTbD6q3Hs1tv9
         oZphFKPIyubWtoflH+lHFFG8i1Y57Dc3aytSkxzh/s3fx6wYzm9TJnKPviPOnAZkYy6Z
         TckRm5zhNq3Une13uMAGM7QVpJ4Z8sJQVxm94cXhRwCo1N5yLUy5j4MDxVXEEeVNLjx6
         AI6zxLMCPtSAz0TGtuJmFu+wxxmnHFHQMBdKbXBYZdkVzxGT4OQqQrXn7yXBzdrjbn8g
         7YkF0L7XZcrVQrvrRMd1MlsS4eLSmLB3ip05hvK6udHIARfYhKmSNMc5B2QDsZBrUcOC
         7vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777257322; x=1777862122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvyUXeaNJ/bj+E1FtiJrSAemMqmopoVbHlry/+nJw+c=;
        b=CcZ/M+F0xolfWv9za0otKIDKyV9MwSQNE1nTIKIOsSYeLufsQ97zwkF9dL3KR6/2su
         15RlFQxitE4p8jj35Jv6IoFtuXqxOQvGLwORog0SOfpSm2BXlcPUo0S6CJkG7rByTHuk
         lkC0HtgVak5bf+X9DXg5qkm4Nbp+VKgE5VzupRBI0NUntDvZdljITjtaVHhJFJaSuB05
         6Zllnj3LS6JDQ4WLbCuCZ+KpjsQsmtFP1Pfrjbv471QddR7KbUd/6aBxex3Guv51xTAN
         bU9n0uBNpeA/FQIFnGG2StZkh6umwHxDAEXQOYJ7/VDP2xCIaowj/6uaKBzE2pmJHjcL
         xFKg==
X-Forwarded-Encrypted: i=1; AFNElJ/6zzdLjjlFWFoNse9iSNM/z4OJNsFfYRyqGpdIIm/NNcmK5mDhm6Sa7+2iWv4+MKFtCCiBScZaHU7B@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy4ZirueR554xgemWms8Fs6y5zQjTLAyGovevGLAstTGgCIrsn
	+UXr5cE1YkMz+/rW821WJyHi+23PHB23ZR8eJ4zfUqwl2VUy8z6o8v8ZUt+avZh/f0wwzpY6xty
	iWhKIVDwhBqa3YiMJKLh2oPSGwuV912MxHw82Y47H0R746TzuVEA57kVbTj8v7ezw
X-Gm-Gg: AeBDieuJ+s7dVjkwJrp0stmtIi4wxs8M+AHvGFUbhYkStpPwrSEO0F/zRpwPZ2LHo/p
	LtQvXptCDZ9pLla2oHEAnVH+eDUFXKB0IO564cuCw+UvgFTvaTQI0QBYGDnuOqFTez/zd7vI+qq
	Fq8WwI3OaSRMJqOwcV98CWgpr9WAqfKWr6mqrVi1dtr9Ay7+LnMGi+VbvjAtR6ff3xsTGDHaJt9
	3jTuF6mPp3qXZS/VUglWdpSIK4vzseEud9IQ1boBHBmqw4lpgw+Aj5OVnX0C5GYL29rlQczsiFZ
	PguOZnZJHHsuADHCwZa6GJx51+/SRRDbJrCoP9C5ieF3YXx0lT0O5y5GvSky24B0rXC4Iz/OAT8
	9MYDQG5eRi04CnVy8MD7ZFsUWh5Rzil4go3z2enY5FkHEYTs/U2N1Zw319YIdFLLphDj95KxdtQ
	o5wemI47YqRIlKTeZs
X-Received: by 2002:a05:7301:6402:b0:2e6:ff79:e356 with SMTP id 5a478bee46e88-2e6ff7a0423mr12870714eec.11.1777257321851;
        Sun, 26 Apr 2026 19:35:21 -0700 (PDT)
X-Received: by 2002:a05:7301:6402:b0:2e6:ff79:e356 with SMTP id 5a478bee46e88-2e6ff7a0423mr12870700eec.11.1777257321246;
        Sun, 26 Apr 2026 19:35:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm52916316eec.8.2026.04.26.19.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 19:35:20 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/4] Add initial device trees for Nord SA8797P
Date: Mon, 27 Apr 2026 10:34:51 +0800
Message-ID: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAyNSBTYWx0ZWRfX7PzymMvu5kUB
 9c0CRi9Eodmh4R1O7uG3dmXOH1cziDM8xD00TumhDrEUeGJG+Dyo0dAz029/BJco78h1a76sVx9
 qAC5XP1ijhpKQ1tDf6v+1vZDnwuw6qBCyYjdkrbqvIsSq+sPTJWuTrVCSwuNVU5bGWMMZiJGzo3
 VvwSo+JU+Qi/4/lfF/WL670JiDqJ7eDE+2rx/wVjn8gXtW+XyRmsx6A/I4VdV3LC0yTPIpmCrh2
 2x//S8RKV947bMHurzOOkkyxPtN5eZ9QhHcXCaVJU1zjDepnfEa8V7Mo2Xti0L7K4yzrbKiRZQf
 dsFe7eg+lpTYpM+bHtBw5wst1w3fVi0C0yQ1lYs//kx19BXrnsgBg0CiaSrsolF+wLWPLkj1w7w
 pLOCr3pRv27QtECu/FLXJhFXqeK5HVH7cWdj7iZRFbfJTWGBFcDKAnaMZeL3szNvrLpnaub7CvR
 QuLDlhrUtl40YwbG7Eg==
X-Authority-Analysis: v=2.4 cv=N5IZ0W9B c=1 sm=1 tr=0 ts=69eecb6a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RxILFXLYZUwLOxrMI-MA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: NvuiZyrbJBpUr_EzMYA4_UYPnxe2iJJO
X-Proofpoint-GUID: NvuiZyrbJBpUr_EzMYA4_UYPnxe2iJJO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270025

This series adds initial device tree support for Qualcomm's Nord SA8797P
SoC and the SA8797P Ride reference board.

The Nord is a new generation of SoC series from Qualcomm built around
18 Oryon cores (qcom,oryon-1-5) organized in three clusters. SA8797P
is the automotive variant in the family.  The IoT variant IQ-10 will be
added later, by sharing the base nord.dtsi with SA8797P.

The series is organized as follows:

 - Patch 1/4 adds nord.dtsi, the base device tree for the Nord SoC series,
   covering CPU topology with PSCI-based power management and idle states,
   GICv3 interrupt controller with ITS, TLMM GPIO/pinctrl, 8 TSENS thermal
   sensors, 3 APPS SMMU-500 instances, 3 QUPv3 GENI SE QUP blocks, PDP
   SCMI channel and mailbox, watchdog, TRNG, TCSR, CMD-DB, firmware SCM,
   reserved memory, PSCI and architected timers.

 - Patch 2/4 adds nord-sa8797p.dtsi, the SA8797P SoC-level include on top
   of nord.dtsi. It reserves 64 SCMI shared memory regions for SMC-based
   firmware communication, enables three QUPv3 UART controllers with SCMI
   power and performance domains, the UFS host controller and GPU SMMU with
   their respective SCMI power domains. A new scmi-common.dtsi is also
   introduced to factor out the firmware-level SCMI channel nodes shared
   across SCMI-based SoCs.

 - Patch 3/4 documents the SA8797P Ride board compatible string in the
   dt-bindings.

 - Patch 4/4 adds sa8797p-ride.dts, the board-level device tree for the
   SA8797P Ride reference board, enabling UART15 as the primary console,
   UART4 as secondary serial, UFS storage, and thermal zones for PMIC dies,
   UFS and two SDRAM sensors via the SCMI sensor protocol on channel 23.

The dependent driver/binding changes:

 - SoC ID: https://lore.kernel.org/all/20260427003531.229671-1-shengchao.guo@oss.qualcomm.com/
 - CPUs: https://lore.kernel.org/all/20260427004619.229843-1-shengchao.guo@oss.qualcomm.com/
 - CPUCP mailbox: https://lore.kernel.org/all/20260427005236.230106-1-shengchao.guo@oss.qualcomm.com/
 - GENI SE QUP: https://lore.kernel.org/all/20260427005901.230237-1-shengchao.guo@oss.qualcomm.com/
 - Serial: https://lore.kernel.org/all/20260427010114.230341-1-shengchao.guo@oss.qualcomm.com/
 - ICE: https://lore.kernel.org/all/20260427010527.230473-1-shengchao.guo@oss.qualcomm.com/
 - Interconnect: https://lore.kernel.org/all/20260420021351.1239355-1-shengchao.guo@oss.qualcomm.com/
 - PDC: https://lore.kernel.org/all/20260427010922.230586-1-shengchao.guo@oss.qualcomm.com/
 - PMIC PMAU0102 model: https://lore.kernel.org/all/20260419131523.1232835-1-shengchao.guo@oss.qualcomm.com/
 - RPMH regulator: https://lore.kernel.org/all/20260427011159.230698-1-shengchao.guo@oss.qualcomm.com/
 - RPMH powerdomain: https://lore.kernel.org/all/20260414035909.652992-1-shengchao.guo@oss.qualcomm.com/
 - SCM: https://lore.kernel.org/all/20260427011346.230844-1-shengchao.guo@oss.qualcomm.com/
 - APPS SMMU: https://lore.kernel.org/all/20260427011728.231026-1-shengchao.guo@oss.qualcomm.com/
 - TCSR: https://lore.kernel.org/all/20260427012116.231226-1-shengchao.guo@oss.qualcomm.com/
 - TLMM: https://lore.kernel.org/all/20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com/
 - TRNG: https://lore.kernel.org/all/20260427012308.231350-1-shengchao.guo@oss.qualcomm.com/
 - TSENS: https://lore.kernel.org/all/20260427012511.231475-1-shengchao.guo@oss.qualcomm.com/
 - UFS PHY: https://lore.kernel.org/all/20260427012732.231611-1-shengchao.guo@oss.qualcomm.com/
 - UFS: https://lore.kernel.org/all/20260427013115.231731-1-shengchao.guo@oss.qualcomm.com/
 - Watchdog: https://lore.kernel.org/all/20260427013236.231841-1-shengchao.guo@oss.qualcomm.com/

Deepti Jaggi (2):
  arm64: dts: qcom: Add device tree for Nord SA8797P SoC
  arm64: dts: qcom: Add device tree for SA8797P Ride board

Shawn Guo (2):
  arm64: dts: qcom: Add device tree for Nord SoC series
  dt-bindings: arm: qcom: Document SA8797P Ride board

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi    |  941 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4511 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8797p-ride.dts     |  306 ++
 arch/arm64/boot/dts/qcom/scmi-common.dtsi     | 1918 +++++++
 6 files changed, 7683 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8797p-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/scmi-common.dtsi

-- 
2.43.0

