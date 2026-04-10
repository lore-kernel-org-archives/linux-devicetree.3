Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1EC3DB657;
	Fri, 10 Apr 2026 17:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.147.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775841404; cv=none; b=dP/xTf8fO/7PLKbdsv0KilQDW8jU0TQ+czjG6bIhl7nF7VQvJBbvbDRgw8RvyvvLKV5KlfAIamFpSn/Am9bzk/INNSZmNg3u/5JzQpSBUAx5QtRpbxtKzIOF4tgYUswouFy9dQHa3aTgNGMY9QRg4klKni+Cg5WFm4gwvElswag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775841404; c=relaxed/simple;
	bh=Qv8FRle++iZeXo3+NYVybadkO5nJEX6mgSGs/OJzGdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y527Ah28aenRGqGai9ZEa3KzOK1T1PiOoJ1uyQh2BaSJydKtVQPd7CnTOOyb6jvUYQFnr7TAc57VCmReKMgbBMWSWJ/mkSv5SKbVzX0SNj7oeq+3q5Wi1y9DsykLrbSwJf+IwWR1CcjjRdK00ApU2dJj5nndk0uymPr2XWT2SbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=Rb1/ii44; arc=none smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="Rb1/ii44"
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ACZTxt899128;
	Fri, 10 Apr 2026 17:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pps0720; bh=SZVUfBIQb2Ui6vuA6D3k2GsGmi6O2ydEt7Ly6
	7PTyHk=; b=Rb1/ii44YFlFTkz4zWsJqqAY2Dd2pouc2RpjJdEqRh617EXN4Ha+M
	bfI0PMeM/vUwhhKwjVFYktvld1Fpldr3E1CNWnKEBIx8661Q9/heRUdF7qgtegf9
	KhvDlMoSC+uKZfKWCg/q2ihER0L76B4YtA63nt1CTv0hbxk1URAb0yOpWhK+7uOE
	1l3pzYgxB9VSs7xUlgI6bKO5OWzGEfjKFhRqmkrdQ/6yYiW1mLfh+NNKgs54INYv
	DZ4T/z/5HVR7UlghBenoK/B6EitnkFMg4vy+Vh+ZDff6pRYLGycb+C03JPjvPyVn
	jKKY7IDGZv+vk7roo8QYF1T99HZNj+zzw==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4df1bgb2na-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 17:16:17 +0000 (GMT)
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id B9565248;
	Fri, 10 Apr 2026 17:16:16 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id CF6BB8081CD;
	Fri, 10 Apr 2026 17:16:15 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v5 0/4] arm64: Add HPE GSC platform support
Date: Fri, 10 Apr 2026 17:16:07 +0000
Message-ID: <20260410171611.2547255-1-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE2MiBTYWx0ZWRfXyk1n45w5BWY6
 NgVT0mitzAHJQJuscq6tJVq/BaAUjTupO0nCq5gicAD/pqtlWKH3fqRt4OC86oDjmbAI1NCPPXL
 UYqe91GtOM3H0Xn9Qxknw1PzqdP3cy94PI3PB2i8sGvhezuag8SB/IrImPgmcV6/s9//WJISY/n
 VwBeKGIfjEiE6nEY2juwBlnjVJ3nagQGHkMRxFiU1j6l+h7IkspLpoh81GsIPsdmEFuDhBaQWDI
 B1RJ1VAL9vxB+00PBA05gnOT5fHlWjFYfH0vWqyuWMBbFjHBZ0knf+mxYKD3leNAiZvuAoYKBbI
 uuBvNXE0LBPFJY9wpjdGcaDdpuvW2buEIxBbUL9O7GVTb3VH5zu7I5oT9CDiQVCftgMx3iBqPoS
 VorhshQORK0nbu8ek7aS1j6OANg644i2vQFZfab2NQfxtqUsB1a8BYZ00qxAfoU/xtCDZYPxPMs
 BtX3eRq/HFl/1doQs9w==
X-Proofpoint-ORIG-GUID: N0e4h1GVzPKGCLJqHDKMV14A6i0AqGY9
X-Proofpoint-GUID: N0e4h1GVzPKGCLJqHDKMV14A6i0AqGY9
X-Authority-Analysis: v=2.4 cv=At7eGu9P c=1 sm=1 tr=0 ts=69d93061 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=RtSn8ETxjE2H05FtM2s8:22 a=MvuuwTCpAAAA:8 a=YyExuVZ0kDJ2kK-KbWQA:9
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100162

From: Nick Hawkins <nick.hawkins@hpe.com>

Add initial platform support for the HPE GSC ARM64 BMC SoC.

Changes since v4:
- All patches: Removed duplicate From: field in commit message body

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

Changes since v2:
- Patch 1: Removed separate ARM64/HPE GSC MAINTAINERS entry; instead
  renamed existing ARM/HPE GXP to ARM/HPE GXP/GSC and added arm64 DTS
  path there (Conor Dooley)
- Patch 2: Replaced menuconfig ARCH_HPE + nested ARCH_HPE_GSC with a
  single config ARCH_HPE; removed extra blank line (Krzysztof Kozlowski)
- Patch 3: Dropped clocks wrapper node, renamed fixed clock to
  clock-33333333; renamed ahb bus node to soc; reordered UART nodes by
  address for DTS coding style; replaced raw interrupt triplets with
  GIC_SPI/IRQ_TYPE_LEVEL_HIGH defines (Krzysztof Kozlowski)

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
