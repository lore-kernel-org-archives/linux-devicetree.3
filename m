Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EB33B5310
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360087; cv=none; b=elzPUuuIgeDEtQNws/E+0ypg1GjB+7/8QmreXOf3xHrH6MOb/tkon9u/Rmk05fOL1QT55qpYEIgay7RHQOGDnYd5PWOsnR18J3X5u9qdwuf732FoCHfb331KACZwanW0hz3UaJz5vXvi90nrBgBKILZw0h7rbAzvA3i4Xdq5/aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360087; c=relaxed/simple;
	bh=o/v0oGXnjh07JApPNTAMuA4JzV235d034TZ6d4R57dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UA43lPFpV8vOLzMlepaOmj8OvvYanj7Vtc25FexfGA8VaQFS8NNdeFzv/AYFQ3lvzhbRd3OZ9iBgxHIf2atiqlNiPDPmqJReCZjgw++8ICMokYCE/bvyRGkW7VkVQBEvnooot++kVAEresLujZKTNHiu9uJGO8/GfjL3j2ouhyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WzOf1nqL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZBroyLr8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WzOf1nqL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZBroyLr8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AA07KF009825
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hunTmViFHBzqK/rRXpj7sDyyW3qMEqW5F0L
	vESP6UxQ=; b=WzOf1nqLRPNLqw5k4dPOq3t/IhPOsM84Jaoc3gw+OEUERnaXlxl
	Hhp3OQz78QrTQgw1/oOqz0AryO8LZCKgWZUU595x60g21jHOwVWHW8mYle0nwsie
	PUQ4tmpWRelhQkLo1qWFddoH2aXHTR9HP1RIUepoGhliYvRDgAmtd3XvmhP6Rlg6
	qp81c+tVEoae5fXkUnoGl21XaYO4deAUd/E9bqAezwlGtLWBGqzzhagXVySTaxPu
	my03lBckHsAo6QCv+q/kJCfaJky+bC5ILgBfT5YWnTyg4ROrsG99EE8QWGvG1Ha6
	hg+pD3Mdh3PakXEYDp58LqCFIFTsutAVmdQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fycger7t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:08:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc640dfde3so23821595ad.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786360084; x=1786964884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hunTmViFHBzqK/rRXpj7sDyyW3qMEqW5F0LvESP6UxQ=;
        b=ZBroyLr8sRnDMRSTsIiVURmkaZNANBA1A09FPgnvH5DCiY19YjvGePnkUM8fpotlcJ
         b1AZouQdDPb83/ZFNtaFw4qHWe7jjaPYWxk5RaydoFfcBrDnaIUKbKR5q9yBhQpg50EG
         JHDJ6Hoa5DlRkSPSOSDnDkCChcoptL4kbRjgYcOziZG/4xoIDGaRD6tqzg7bzhEMdi6H
         U9ryDDTd0e7y/yskJwU44brWKhPZLUmKvOOkoHAutn+C4bHMVQx0b4k9xdGLoVtQLbQp
         7v/KumC4vQdLIbOkce+Dmo7FG65E19717XwcQ+x+95Hpn97PYkAaWUk9SWTt3LXa33jn
         6AOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786360084; x=1786964884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hunTmViFHBzqK/rRXpj7sDyyW3qMEqW5F0LvESP6UxQ=;
        b=UTmlWostnhZWvv/kqDEN+8CZkqQ7BruMvLWP3S73FkV/1PncvxJb5lT3Almb0p3RQo
         2NQ4d/qZQAe5r0WJ8Cl+t3r7w1U/Za34J4VMrmz7taareNw3Wh65Qfmsi0Sr/VhnsHsM
         hJsgUPAeabnvd7wsANtx0fyA1QKr69WtfdxeTC75dqGVtrnPaywYNkXIIitnwCpn115h
         EXW7saD6k9e9h7I78OhGRC+SRgcMk4X8AuS6+Ai49/7KIiPJF5HXvrImf9lgRvqU1YEz
         iPVaTwqnCymendNn/iTlMMCyT16vqI35I/6SmTAV+oQOls+VXPUNVVkCGILGwBRJ9zgy
         gokQ==
X-Forwarded-Encrypted: i=1; AHgh+RrixVtr3GoSK84vlb+H2h4a/7o4EiDkuOiJi0pXUraBWPa68PcJp+QVGRyszjNj3pLK+JCMEoSH/G0k@vger.kernel.org
X-Gm-Message-State: AOJu0YzHCjDnl6L0eJgOLFgG0250Os/fOeV0wbWbUiNES/0Ql+ndXjHL
	iylMzrH+uMy69FPjI6IemLp7vo+yWy24O0t2Wvtz6eto4EC3EHYcRL6pLWUEQi6rVeAol02213b
	ngasrEBBxIGSjS4vXyTd82PTToWZgOQd9G3W55a64RU8M4xOaDbvC+uNYATd/8tu4
X-Gm-Gg: AR+sD13XBtJKNUq0KFYJcA7ELQg18v3EnK1ike0qkEIHVs0u7eEh5EBUIrVzyy36H7V
	km0p68+m7xPr0m2TFg/sMto9gRk4/MUue4oz8OEL0k07VGZMX7mrNaCIy2U08/qZV+nJULVbgkU
	e8QV8Cb1BtZE9toJBh0tQ41T42slfNP97gGiLIxJG2vlfV5g6l4d0DH0EZ6AXGbctCjqqBQUC9x
	pyC0taMdusaJsjU5HKvXIiaMXt/BgB+FYFoltldZX2ElVO07pzagw/whS+i3c4FQ2qFYBegDi+W
	FpFb5FoooCCI9CreRmsr+nnLWHX4ZLYpQjzMzfru3M4tvymStnd71VErm9Wzd3xfeWAI7DWfZyL
	cYOgb0WNcl1/H1mmyvm0qLvC+TBqT1W3mlWptNbDWYuyZrSY4lgpYtkFDKPGT
X-Received: by 2002:a17:90b:1a92:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-392823bfc0emr16723040a91.13.1786360083628;
        Mon, 10 Aug 2026 04:08:03 -0700 (PDT)
X-Received: by 2002:a17:90b:1a92:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-392823bfc0emr16722976a91.13.1786360083088;
        Mon, 10 Aug 2026 04:08:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde353sm46520198eec.23.2026.08.10.04.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:08:02 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v10 0/6] Add initial device trees for Nord platform
Date: Mon, 10 Aug 2026 19:07:19 +0800
Message-ID: <20260810110726.775084-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RHp8av3iLr-tmHJ6c078K2gKtcklS-RA
X-Authority-Analysis: v=2.4 cv=R4cz39RX c=1 sm=1 tr=0 ts=6a79b114 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Naiw9UJaHRUbRcGyrnEA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: RHp8av3iLr-tmHJ6c078K2gKtcklS-RA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5NyBTYWx0ZWRfX+M3P/ExtoUhf
 /675NUjjhfFuPh6QGKKgaiA7yHbiXL/RMfsba3PtxI5ADvqGwdIOCuE1vbQ9sZ143IrGTCw0Ne8
 Uz6GTA7k4vLqZQ+8d4fJvosjZqLUO34=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5NyBTYWx0ZWRfX3Kmd0EiFUvlH
 RfPY+gtgRboB5uQmYxDRw00VQt0VE82q4Mzy2+/LdsvWuO6sZyelQx5CA/qwcxdsDfTrxExEMI8
 4Ph/EmYj79cJzCVuaZD2FMNXDE+I3wWScfVEINmQy6wFfwDgCagobMUonsu6KEmUQNVllBFRKrR
 c2wSQ6IHRcrDvYuMOrx0DGt1NV4ZNdV+0WJCvjkr0HgYsvALo41hk2s3FlCztthXpQ2ly7pjWZg
 5dPwMOGWKs+4njvhRdqn75SvIkIi3LuNM015WVaqgPYl5gX5aJHaZ/dLQFtY4/EIMaaIO3efimZ
 E1LH5gK2vWNjbaBIT0TSuSj3JAu3CCQ+ufpJVdQEF0Sb1koXZpcEOmwQO90oOr4Z2O9DHrN1AhA
 6QUDzmjGyGJ2ZE4p4CwlNfR1PY6gnsyj2FcRcE6L1fvvFQspcJ2XF5NXKk8Na244VdDq304Pmbp
 EuPqq7Kvc6ymiYppzhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100097

This series adds initial device tree support for Qualcomm's Nord SoC
and the reference design boards, SA8797P RIDE for Automotive and IQ10 RRD
for Robotics.

Nord includes two variants, GearVM and Embedded. The GearVM variant has
platform resources (clocks, regulators, powerdomains, etc.) controlled
by SCMI server running on a VM. And the Embedded variant has the resources
directly controlled by the operating system.

SA8797P RIDE board is built on GearVM variant, while IQ10 RRD is built
on Embedded variant.

Tested on next-20260803.

Changes for v10:
- Fix reg size for ICE to match hardware specification (Thanks Kuldeep!)
- Link to v9: https://lore.kernel.org/all/20260806081554.448531-1-shengchao.guo@oss.qualcomm.com/

Changes for v9:
- Re-add UFS support for gearvm variant as the binding dependency is
  resolved on linux-next
- Add #cooling-cells for cpus to make cpu cooling devices available for
  userspace to control
- Include CTS/RTS into UART17 pinctrl state to ease the Bluetooth
  enabling
- Link to v8: https://lore.kernel.org/all/20260729010022.875799-1-shengchao.guo@oss.qualcomm.com/

Changes for v8:
- Drop UFS support from gearvm variant to clear binding dependency
- Link to v7: https://lore.kernel.org/all/20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com/

Changes for v7:
- Do not paste the comment of bootloader updating IRQ number for each of
  the 64 SCMI instances
- Correct crypto status to be "okay" in nord-embedded.dtsi
- Drop scmi15 from nord-ride.dts as there is no consumers
- Drop unneeded LDO/SMPS regulators comment from nord-rrd.dts
- Drop regulator ufs_vdd_hba and ufs_vccq2 which do not exist on RRD
- Drop always-on/boot-on flag for vreg_l3e_1p8 and vreg_l2i_1p2 in
  nord-rrd.dts
- Drop untested I2C device and add tested EPSON RX8900 RTC for
  nord-rrd
- Restrict nord-rrd UFS PHY regulators as HPM only to avoid potential
  intermittent failures
- Link to v6: https://lore.kernel.org/all/20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com/

Changes for v6:
- Move ufs_mem_hc reg/reg-names from nord-embedded.dtsi into nord.dtsi
- Enable crypto by default only for nord-embedded variant 
- Add a comment above each SCMI 'interrupts' property to clarify that
  the IRQ number is expected to be updated by the bootloader
- Improve commit log of Embedded variant patch to be "directly controlled
  by the operating system"
- Merge two board binding patches into one
- Rename sa8797p-ride.dts to nord-ride.dts, iq10-rrd.dts to nord-rrd.dts
- Expand RRD acronym in DTS patch commit log
- Fix copyright in RRD DTS file
- Add firmware path for qupv3 nodes
- Link to v5: https://lore.kernel.org/all/20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com/

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
  arm64: dts: qcom: Add device tree for Nord Ride board

Shawn Guo (4):
  arm64: dts: qcom: Add device tree for Nord SoC series
  arm64: dts: qcom: Add device tree for Nord Embedded variant
  dt-bindings: arm: qcom: Document Nord reference boards
  arm64: dts: qcom: Add device tree for Nord RRD board

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 1726 ++++++
 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi     | 2848 ++++++++++
 arch/arm64/boot/dts/qcom/nord-ride.dts        |  236 +
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  548 ++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4623 +++++++++++++++++
 7 files changed, 9989 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord-rrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi

-- 
2.43.0

