Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D68322749;
	Mon,  6 Apr 2026 14:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.143.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486376; cv=none; b=X0biU5g62RkanETS5MTGsOmextENN5e7j6RP4s2pAYkngP1EpWOdp+BjBXseBgEMYovVc+UvCne+lDGT3GIstaWNYCPq3odO74RCoxfVc+9HockntGMkOa7dukZbqjU8YKS1PvJ8t0wchQC25z9xV2qn7uDromc1YKyEdH+3VPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486376; c=relaxed/simple;
	bh=ydlRW0YV1uQr6bij4dLlc8E2/6dPbyADElwmXWiJwUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NqnfRRTBn1rGWmNJJscPawdvTr4o3YOIQdnez5bpOGXPaODlGJGOkFrYF4jHrZ3nMyAMWZjpmusQjWKLAaSRjxSEkkI3Di0vXd8R2gl+KpGNmeBzmjXf9FmpKV/yLYqrkX/Mj5+kh3XZltX1t8ECbTLoqVXKJWJ1UbZLIPQSL+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=Clz/dp29; arc=none smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="Clz/dp29"
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636C8rh31225568;
	Mon, 6 Apr 2026 14:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pps0720; bh=QrAv4VGSoq0AOCco2CYmzJVKP5jzWlstWu9rs
	fotWO8=; b=Clz/dp29FSGmmFdIGus5vL2pgiAAV8yujFfDMgZ/VwBTaTywvcNXQ
	X+F6+Kemzly74JMls4CvBVH8KJuQFFRT0kpEi9m2XScZ186prd7O56dnwKWpW46z
	ATWr4o9KQ4o/zqkk0SXqhGc6I9EDpDz2qs+RScG4HqKWuqZcHjwSMxW4m+RGO/iX
	i3jDa9NPJHsokkXDjwycYAypOKE1r/5MsqxDRdT7Lj6EnXAPyXf+FfIpsYTLyVOI
	xmu2G+lM0NBDlMFTpYjyOJm3VcQgcBTZnHX6zw6KtogzSSclZJivfGnho2IjOS+0
	AxD1lgHs2Wvx0thnTWcd9kaICa4GxHzOw==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4dc8vyux84-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Apr 2026 14:39:09 +0000 (GMT)
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 1904E2BAD6;
	Mon,  6 Apr 2026 14:39:09 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.39])
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id 052C88081C4;
	Mon,  6 Apr 2026 14:39:07 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nick.hawkins@hpe.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] arm64: Add HPE GSC platform support
Date: Mon,  6 Apr 2026 14:38:17 +0000
Message-ID: <20260406143821.1843621-1-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WrEm8Nfv c=1 sm=1 tr=0 ts=69d3c58d cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=ZSrvDirOKP4VPF05hnFf:22 a=MvuuwTCpAAAA:8 a=ExUFRefvzqp9aA4d7S4A:9
X-Proofpoint-GUID: Lrzc4rr4drxOjdqLW_-ySY8y5wZmGS8h
X-Proofpoint-ORIG-GUID: Lrzc4rr4drxOjdqLW_-ySY8y5wZmGS8h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE0NCBTYWx0ZWRfX235CH7KTSfew
 cGpJm8gYxUErvBhNLmQ0ZRyij6TRLVnypoHTk+qrZIr6NfwWKerDTTUbakWYZfCUiZbZ2ZIyaIJ
 m09tLwxfo2Pjx88vsjmIShR5z620EoK07UeMMA86V8NBIaf+LTA9alDn/yZoqUF4GkwgvpOKrox
 t0izOx6sihna7pvHmmnP9SoR2a33HKyMxG3tzPlvNTdROqvO0phCr87wRjSBjEe3GNzbvdLggAh
 S7hF5Gdn9gsOlhYkcbUrdiaMfdbt/+KKr10ctnmx6igeiECRD5HGkLcHu3vOYEh+T0ju97ruE+v
 wfNtYx/Ps8p5fKz0l4cDVYzpLtBbk189GXYPodoyYR5D9L2EidvnobC8z3qYxGckv1/Mu76LlVv
 Mq4sfwsvf+zBiJgpT02Ncwutc+qHULVV3Dxgd5YFGY89Jlq62/anzxugDeonBWBw0HPwrv8gTkf
 LbGg//18vAAxJ7MoUDA==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060144

From: Nick Hawkins <nick.hawkins@hpe.com>

From: Nick Hawkins <nick.hawkins@hpe.com>

Add initial platform support for the HPE GSC ARM64 BMC SoC.

Changes since v3:
- Patch 1: Moved GSC entry before GXP in hpe,gxp.yaml to maintain
  alphabetical ordering by fallback compatible (Krzysztof Kozlowski)
- Patch 2: Added Reviewed-by from Krzysztof Kozlowski
- Patch 3: Changed SPDX in gsc-dl340gen12.dts from GPL-2.0-only to
  GPL-2.0 to be consistent with gsc.dtsi (Krzysztof Kozlowski);
  reordered nodes within soc by ascending unit-address, placing UARTs
  before GIC per DTS coding style (Krzysztof Kozlowski);
  moved interrupt-parent before interrupts in timer and all UART nodes
  per DTS coding style (Krzysztof Kozlowski);
  reordered root-level nodes alphabetically: clock-33333333 before cpus
  before timer per DTS coding style (Krzysztof Kozlowski);
  reordered properties within all nodes to follow DTS coding style:
  compatible, reg first, then remaining alphabetically (Krzysztof
  Kozlowski)
- Patch 4: New patch adding CONFIG_ARCH_HPE=y to arm64 defconfig
  (Krzysztof Kozlowski)

Nick Hawkins (4):
  dt-bindings: arm: hpe,gxp: Add HPE GSC platform compatible
  arm64: Kconfig: Add ARCH_HPE platform
  arm64: dts: hpe: Add HPE GSC SoC and DL340 Gen12 board DTS
  arm64: defconfig: Enable ARCH_HPE

 .../devicetree/bindings/arm/hpe,gxp.yaml      |   7 +-
 MAINTAINERS                                   |   3 +-
 arch/arm64/Kconfig.platforms                  |  11 ++
 arch/arm64/boot/dts/hpe/Makefile              |   2 +
 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts    |  18 +++
 arch/arm64/boot/dts/hpe/gsc.dtsi              | 104 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 7 files changed, 144 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/hpe/Makefile
 create mode 100644 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
 create mode 100644 arch/arm64/boot/dts/hpe/gsc.dtsi

-- 
2.34.1
