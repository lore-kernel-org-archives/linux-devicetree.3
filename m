Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D12A1A683E
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603262; cv=none; b=eMjEK/XSxvl5274lIvG/PA3UGpsTmY6SviIYPiRyQn+Ia505smLaNSJotomHTq6kuQoCNRSeKgHMbNHEZJSlhJ1N6ymFbNHVE+3CQsfsdFStrFamAX79EtZBsL7U7Ff8fKCY+CcdjQXI57IxtZLgfQ/kDHe6MmHzh3Y/6M2hoZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603262; c=relaxed/simple;
	bh=FdEbwRGaxaxP2+aFzXzzXXq6+TMmDuzky2xTrUOc/q0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VNIQWFgGMqsIwmGbL+ygwmC3z4PnhkFFpHXptM0CzibKt4e1SDsBqg/vDgDwl3cnnM4lhdvivXED/pCFFpYl7B9Si5xSuflGhCN1/fvK0/+2x38JDZqfMA8xxGEERyF/DSh3SthELs/SNzHaAZeAVVsukCYUF36muo51ZwaszrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WiWpuK/z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oh2MJgBm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WiWpuK/z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oh2MJgBm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNmfs1628983
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=amj0Hje94YFu3mGWB0ohs4
	vbwDZGYOIJAVDivAP7AZc=; b=WiWpuK/zRXWu6zNAjlDuFaMJJ/60xe56CoMN1k
	DgNanT24VCNt/AvFyiDp0QTp7zN/SQGjNz0bPfoLCZK7kwHds/xMGk0rFdYrx8U/
	gh7GPI7cNEHIkzI4EqMTiWaPHzPpW4uZKfEDhcdTpjrrXF5xJaRqav5pOb/cO6Y5
	3nv6C5V4a4AupDgAwpuwqwQaYgI3jnK2/mC7Wsth1UU6kiFYbHYvR8NPK9AZhQvn
	rsxinzJ8sEjoZMA1F8CcmkLB03vth2ihNFOVxmmuzBJicQ4M0towMEAOlmeRk63j
	4wVHm+VkhVNb2LPzNcexa/ryaGZ8v4lIz0OPzoL8ZJW6+vBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvuuhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:21:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e55721a8cso215702285a.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783603259; x=1784208059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amj0Hje94YFu3mGWB0ohs4vbwDZGYOIJAVDivAP7AZc=;
        b=Oh2MJgBmShJf93zv9ecakbFvqTgDYhmuA91ZfgDzeGqOzet6z0x/cDDQrJsnO1fe6c
         oCL+FVqf3puBMV58laacYBfAT59mkqekSYvv5sEX+qWGovE95jslFQ3enmiZVbzPE1oo
         t9Zp8CnL6m0vxKn3+OYbruPlzp4ImKz9hrLYeNvsslPlE/ssJ1A0N2PzFEb0RDLtDXmp
         Q1JBQ+8RX5D3pxNT0OSHr606tG9+GqifI7QqXAzUJXYmrimp/0rWph7QYHxjG0Ks6UGV
         zRDGpWvFluhNiokaB7mwk8JVWywCfOpBRvnu3ZPctveC8bQmnRyL4Mxt/8frSfCjJSQd
         UDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603259; x=1784208059;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=amj0Hje94YFu3mGWB0ohs4vbwDZGYOIJAVDivAP7AZc=;
        b=GpsAf695ErgFTsFq37dWKsXwA9S1MnZ8jAqDb/YtbQPUcaIcvZQlJ4gl9/M5a/G6PT
         RtbbkBxAeMqo09SBPQiH2XgM3FmBsWWmFc7DQl1BiWYkcJxeM/mfN8OWCxXPytbn29Cs
         RLgS7yO0vWuuAyhSMhO3NS+BOqohwUqNHjI8RxBl2meKCUSAH4dSzKJ3+V+MWc6yYXei
         qkyZJGkdNFROB/j/JkqhZayKRsUo6na00xeL0kmWU8Jmcz+P3xCmK3VU3ge8LGg4hAsD
         x/3yneHV5qSY5CLBvKo4/MverJkysEONSqHIm7NGP8bpc1dsqQKvJiTOz5uOvIUlH+JK
         jfLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCk+8rd4Ar77pSngm8TA2SnXbuTwm0/Wt0E34tjAYoOH52ikgfrZtPank0IRs54H6I1OLmUerXW+YD@vger.kernel.org
X-Gm-Message-State: AOJu0YxtZPN2mQK5PW0Xtvo2m8okbrtVVCnV1WE/QaJhwluCdco9UAHb
	fLd1EzhPMzhhQG496+XoP7xssd+h/20FCkfngbC5+gNzFIpcAF5uh+sSmsIG+slJPrk/inqqOAR
	vEG7bp6dnXWEgmpbXe0d91BAFS/RF63dQD62XxMHHzmhhtA8GdsYepY6SQQXslVkiAJ2Y3fY4hn
	0=
X-Gm-Gg: AfdE7clTzPzcvkKs2+2y8anX1HCKqWl0bvorwabtutBmdi319Pyh4JwQlNCY9xENpf6
	aiUk4rm3hzZanoLw/RSWC4bsU2uWcJQfWeaso5efZrXWbyNv0YuxCJGg5roRLnEWmgYLXCKnmti
	RvOLKTrjxDJwjLByHHr0FHpKqOp07qYh8qs8SjUL8ZW/WWf+AS3gjODthFetkiuaf5QFOmDUwZs
	tP7GCPrlNFOysQtZRmlyc+Z8faINdJ+afOS+VgWJLv67OSm/ThavecW+fegSfE54D8hGHTLXMhR
	sDbw7Y7ss5eaf9kCgw5bhyZPnEbjcuP1LzzJgTQ2r4pThIzjA8tzkZ+M9Wd+jgJLzXdP38suMuP
	gXZJaq7yIre/H+yAaOySfjNmwPnJKFCW3apFdlw1AfcCX4DsJLbhgRN8K3TzBuhst9+cTOg8=
X-Received: by 2002:a05:620a:4542:b0:92e:8fa8:829b with SMTP id af79cd13be357-92ecf5f3f2bmr764350685a.24.1783603259212;
        Thu, 09 Jul 2026 06:20:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:92e:8fa8:829b with SMTP id af79cd13be357-92ecf5f3f2bmr764345385a.24.1783603258693;
        Thu, 09 Jul 2026 06:20:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ce5126sm1654976385a.41.2026.07.09.06.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:20:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 0/7] Add initial device trees for Nord platform
Date: Thu,  9 Jul 2026 21:20:06 +0800
Message-ID: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX1optFFixQIrp
 Mas6m7LK1K0BumzLpGHZPTgb+ZkYzbKt0PFuKncByGNi0d1s8skTynlYkruTecayox0Vdc5Set5
 eckLLVyHOr0QzBVtcrt2tu/Egnyh9Rk=
X-Proofpoint-GUID: Ri46WorWWGaRJi1Zbf7Pefa9sF8Y3FaP
X-Proofpoint-ORIG-GUID: Ri46WorWWGaRJi1Zbf7Pefa9sF8Y3FaP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX8wO8LUdHL6GX
 9d8dKM3ndbDRFfN9Lw+8N7OTf3Dy6HdMWIexbkL2Ct6kzteq51+X2TzPh/vgVuCGd+4vfKDoP23
 JZkJY0yvuzgs7DD4lwp9Ik+2SRqnlxcHEfuvSyx/6UIzeq949dyHEEmed2NHvcNen28dbh4gAzQ
 BiuMqFC3ulZ+kFYheaP6ZHcnggoHyyLZzSxnGQXa2t4eTXpZOoe0U4e9ieJsIUKPMeLnx2oyxSn
 4s8/9AMkC6YuplhW3uCy4U7k6r9pAKZeeGB2e8PXTpiz5fOmr3Om2Wbaj/HJJbt10Rr+vgWMdgb
 KsbFAdmdbjZiPJS1djXolv9tAsxBg/YW+qsl0Q4CKaq2IXsb6unurRELWHCNViv+txLfB9HvG93
 GUDDVbXDBf60RZZ6NyZltlm9K1Q9CoP37CfZLI420EtP5U8XgsPJsC/k6h1hJUYyt3GEpxuFx77
 CwHVeO5sbXBCsOZ/xBQ==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4fa03c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=avSFmSnnVhJmRsJhiZ0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090130

This series adds initial device tree support for Qualcomm's Nord SoC
and the reference design boards, SA8797P RIDE for Automotive and IQ10 RRD
for Robotics.

Nord includes two variants, GearVM and Embedded. The GearVM variant has
platform resources (clocks, regulators, powerdomains, etc.) controlled
by SCMI server running on a VM. And the Embedded variant has the resources
directly controlled by Linux.

SA8797P RIDE board is built on GearVM variant, while IQ10 RRD is built
on Embedded variant.

Tested on next-20260706.

Binding Dependencies:
- ICE: https://lore.kernel.org/all/20260704004408.2303468-1-shengchao.guo@oss.qualcomm.com/
- I2C: https://lore.kernel.org/all/20260707095708.3801043-1-shengchao.guo@oss.qualcomm.com/

Changes for v5:
- Rename nord-sa8797p.dtsi to nord-gearvm.dtsi
- Merge scmi-common.dtsi to nord-gearvm.dtsi
- Drop "qcom,sa8797p" compatible
- Add Nord Embedded variant and IQ10 RRD board support
- Link to v4: https://lore.kernel.org/all/20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- Rebase on next-20260706
- 1/4: Drop useless comments from arm,gic-v3 reg property
- 1/4: One triple per line for qcom,pdc-ranges
- 2/4: Improve commit log as suggested by Konrad
- 4/4: Drop 0 polling-delay as that's the default value
- 4/4: Name PMIC thermal zones with prefix "pmic" rather than "pm"
- 4/4: Drop 135 C trip point from PMIC thermal zones as hardware will shutdown
  at 125 C
- 4/4: Have trip0 at 105 C as passive and trip1 at 115 C as critical for UFS
  and SDRAM thermal zones
- Link to v3: https://lore.kernel.org/all/20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Rebase on next-20260525 and drop patches/dependencies that hit linux-next
- Improve commit log of "Document SA8797P Ride board" to explain the need
  of SA8797P model compatible
- Fix the real issues reported by sashiko-bot
  - Fix unit address of pdp0_a2p node
  - Add missing compatible for i2c15 and spi15
  - Drop GIC_CPU_MASK_SIMPLE(8) from arch_timer interrupts property
  - Update commit log of "Add device tree for Nord SA8797P SoC" to match
    code change
  - Sort sa8797p-ride thermal trips in ascending order of temperature
  - Fix sa8797p-ride thermal zones with identical trip0 and trip1
- Link to v2: https://lore.kernel.org/all/20260519063505.883379-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rebase on next-20260518 and drop dependencies that hit linux-next
- Include SoC ID changes into the series
- Include ICE binding change into the series as the prerequisite change
  from Harshal [1] was merged to qcom soc tree instead of crypto
- Improve commit log of SA8797P Ride binding change
- Use label in nord-sa8797p.dtsi for referencing nodes defined in
  the base nord.dtsi
- Link to v1: https://lore.kernel.org/all/20260427023455.236410-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com

Deepti Jaggi (2):
  arm64: dts: qcom: Add device tree for Nord GearVM variant
  arm64: dts: qcom: Add device tree for SA8797P Ride board

Shawn Guo (5):
  arm64: dts: qcom: Add device tree for Nord SoC series
  dt-bindings: arm: qcom: Document SA8797P Ride board
  arm64: dts: qcom: Add device tree for Nord Embedded variant
  dt-bindings: arm: qcom: Document Nord IQ10 RRD board
  arm64: dts: qcom: Add device tree for IQ10 RRD board

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 arch/arm64/boot/dts/qcom/iq10-rrd.dts         |  588 +++
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 1731 +++++++
 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi     | 2847 ++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4596 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8797p-ride.dts     |  240 +
 7 files changed, 10010 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/iq10-rrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8797p-ride.dts

-- 
2.43.0

