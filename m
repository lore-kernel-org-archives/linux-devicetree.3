Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF7638BF70;
	Mon, 13 Apr 2026 18:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.147.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776105202; cv=none; b=M8s5iPm5u0Pj8n94rMQL4rk+DsT1W/XQ9R13A0ZeMLRFeT3PMybvgPzP/5Jii+Oj7ferouGBfDBAGMqu02Uvq1W4oTRvfSjJzd7s4jXtRdO5u0a2WRjep9jiLjtvb+y3R6s1Ubc3MghIUvpsrBazj4HJb01+yxP9vwKP8vpj4bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776105202; c=relaxed/simple;
	bh=xwczmOkQN/cprckHj2Efhbi7tU387h86G/dSep4yi7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZsYmrI2h1M9qtcAsPTC9E+k3LIN78XU1tmpA2UIWaQcxzKTOyXf/PJiRlKAH6aGfcRukU35wKVZGlJ0xi0shcARfveQWb8gNSqohyyqEqfpqwEWEE6JeFdlT3+QnMCP1JC/U1TykdVwpfrT6v3gpom9/m5kfXx9JJAIml02I9bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=Vmcr6Xjy; arc=none smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="Vmcr6Xjy"
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DHUGdW1213164;
	Mon, 13 Apr 2026 18:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pps0720; bh=0xfPVMqbMrk5xm6gzuOFdQges0n/boK5z9kg5
	ehdISo=; b=Vmcr6XjyZKRkENYgRSzCAYe8RQ13+MkR7I5kfkPdP9DRUfKQiG+2z
	ChsDbUukTWKOhAY6BeiobllyC87P/eqkX96gg/YBJ+eyqFHxDMoYX7HhlYCkhWs3
	8CZ1Ui6915Q8qKA37LnXk9NoRWt5RK2fwWn3l0rEV+gYr0LdZptfKOGs0hkG2yiM
	IC0t6+7f/B5t6p1/WgCwPSiYHs6WHgWyyk+TX1RxTcW6UCI/sSNTUB0hHleurcOz
	RMqclxAqoQFYt3PiiQ78/ynBCvIoWM9eX/sYUqbJwjmbqeJRolw3C3iZ/XJR80UF
	mioYnCyQyN6+yezieZGBRrTrXDmVoAOvg==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4dh2x92ah2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 18:32:53 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 8861688F;
	Mon, 13 Apr 2026 18:32:52 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id 0377B810AD8;
	Mon, 13 Apr 2026 18:32:51 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v6 0/4] arm64: Add HPE GSC platform support
Date: Mon, 13 Apr 2026 18:32:43 +0000
Message-ID: <20260413183247.1381172-1-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Zqjd7d7G c=1 sm=1 tr=0 ts=69dd36d5 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=J0OTuHAx6l5K1fCpvPfz:22 a=MvuuwTCpAAAA:8 a=YyExuVZ0kDJ2kK-KbWQA:9
X-Proofpoint-GUID: 5BHUSoOwr-7M30sj0V1tv-vizT4Ca3Jc
X-Proofpoint-ORIG-GUID: 5BHUSoOwr-7M30sj0V1tv-vizT4Ca3Jc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE4MiBTYWx0ZWRfX4uL71o7Smd3U
 +gDtQUCXZcOXvKhPi27IEQbrmFV9+pbW5Y7HjNGU47SVNSl/D733ulVDurxFGKPqJhT9ftmcvgt
 CieacPvZF8BdN6Qova9aSnsfzgzuWG5itNL7HSl/J9v4UixGRIElRW1WCX+dbwyod1I1Zf76O3r
 59SPkfO6oOAsaTB2ODzO0rMctQ+lQqbJveAonYK7N1xjF5r9nCE/UHNIYTKPCG+6NDy9nODjuxN
 e+y+RuE+FB0GnBYaTxaIfYPhhwwwxZjiS1QmLnzhj3x6Nmqs0KTEfwvIXBnXpSzxvIyb0GreIwP
 vRqSDgREmUNuvm7hHQTSOQJ0rugqqK6YX5q/Thur5NKa8o94aklvpllU3/VaORcLHzValM62faf
 8zK6GGkoX6W0kkDDZQpsNxPYo0vudJ7FbOzMWxr6FZHrBnN/Uk04/Hy2rAcj3tdXSOpRUwOqEWO
 NPbN9grEAOKsdftakdw==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130182

From: Nick Hawkins <nick.hawkins@hpe.com>

Add initial platform support for the HPE GSC ARM64 BMC SoC.

Changes since v5:
- Patch 3: Renamed GIC nodename from gic@ce000000 to interrupt-controller@ce000000
  (Krzysztof Kozlowski)
- Patch 3: Added Reviewed-by from Krzysztof Kozlowski
- Patch 4: Added Reviewed-by from Krzysztof Kozlowski

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
