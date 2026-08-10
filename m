Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CAC3C1D7A
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362232; cv=none; b=dpEhREdMBWk5KzaPxJ2aCPlP/rA49e0D3/9KF3yLWUsTAIE7Y752iqzacuWdDX4ZqHwhS6Wjjq/BhRbjsm+qmdJCLKgTWhbo2V5snaN/XQxvkN6wuv7XjxNlXBn1Llg0rxXT8qJumT0n88DVFtyFXPppEgzSHkTSwF+9I9eU8qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362232; c=relaxed/simple;
	bh=gGaaR9Pq/8iSDZd29DSEPhL4tGkKyi+bDmBNN3ZvrXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BlDw1Ow0DRz+GMRsfaueDjxwnIs4F+S1+SOkL3sVocjqfqf+1dtKZAXWYuNTUmXuUVKgA3CuhLZ4zidcrdQfBwbhWrNX0tJkJy+VUDxjZZGE7GBMR8LyhcjpEG/cjPkwi6KY3mzURRIpY+VrdQsnNZ7FGakO7cDqs5CqlucTw4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pnE6mTYE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvWTta9l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pnE6mTYE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UvWTta9l"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9RuCe1727540
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9m+sbjvT4RDNrya6Fxb6pNmdwh0szTKyVTa
	246+CFZk=; b=pnE6mTYEGLXVUkwqFnlz87UoKqgnGb1d2qwen7AsMQ9Qs2cfcAs
	XfA5r3vA97ImFJAHlDMdVvEAF2J4uoznqFPkuOBWTIo3k8AMbl/XPPkbIs+X+4Ob
	OeQO6AeGf2t4tuRYRpExf3oBx8C7dMahNA2psD4xZlb1zm8KW9e5kxcHPahQwjoF
	N4jerUK1QyuHvRgA2AVfTS7MHSCQKZ7orMBVEPYxuiAzVJZfgF567bhXpSipE2KU
	FGoWKn+Ww1Jj2BGM6djO7HJrGcCTAdWjtX2jW8IZ22BkY77gMlnaBCxgsaF6VUuB
	j4vcX/CM7xv6BSCFyoVeX5VRyjhkpi32T9A==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v3s9yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:43:50 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a7c64fbbc6so1770805b6e.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362229; x=1786967029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9m+sbjvT4RDNrya6Fxb6pNmdwh0szTKyVTa246+CFZk=;
        b=UvWTta9lHmvtTcFyoM6bWOrxWAxD3/54uTFs3+/SjQzo1ilXKsmmyNVCbCj2L8I8rd
         uOz5fptf4vdbhDS5evbCaV0lCUwH5mP1RvmLWH3eZeejPL2Xdp9tYcv/kFSrcq6Oscxu
         wSBdBcyy521zCCT8YyI35aYFEu6FCDWB/ckRtfkTtNFVRH/cW762wW0kz9WWKSiRBnx9
         hh1/3VKu1VHC0rs64mV7zHQzYQK7hBeA+hdxBR2WFYibAN2RTXzbmraaGEUuJI2q27Lt
         M/LfNjh7AuznkjE4LtnhMkMlQ1x2n4AgpA8kud3LQQgXD5rsAUNkoPBFC/w0+y33Ffhz
         t9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362229; x=1786967029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9m+sbjvT4RDNrya6Fxb6pNmdwh0szTKyVTa246+CFZk=;
        b=K6AY29pX83pLVlat3xXMN+fa09lyat8mIuEeA8YsTU9GjfoDKMp56ddoI1CUi3WzDp
         RuY2fCDFAmXpIyu3dNHFp8VN/rhq5KzKFjPwqmG9V1OaOATtnFb/vv0ubV9Isehaaj89
         gOeOAzyKsUJaKD5YhhJ4OU1xXdVwmzNLHYqmZlSStb5hNMoxtMoTBW6KM/qxASV7clBJ
         zm9/xRONbMImwqhEVgSRg5kjAGnqQQMgo+r0GxO5lu44XxYtFstjjyCaurAR3KWgqg12
         WYxwTJmSNv5i0Gci1sYn01cRr26HOIbgG3azdxcLdHW8qg4FMDGX6igY09pStcKcaui/
         7nZg==
X-Forwarded-Encrypted: i=1; AHgh+RpWgFeMYdl627SmiAUzi87XsUTQvYeKO7LAkv/sAFGITddBdDmKu0W0eM+C+kddQQtbGA3VOtaqMV39@vger.kernel.org
X-Gm-Message-State: AOJu0YyyOynJ1zdRowxGbAmX8GnKkTQTNmcEQ09NvsaabjotJPStY21a
	l7yDOWESE3VXlHZ9Rvo+N1CcNcD4omm/N5AnOH7vei8EWtgbkrjdzKpLer4Hs/GAEyZcoiD8zqM
	rlCeEyiL+Hdgi6dbcvyJC/jgZEcWB7/yvRp3lofRxd0myNqomWKCfTG9v4NqyqIAj
X-Gm-Gg: AR+sD12kvL6uc9kDu90RLjLewqGXLTiQoe1GYsaGyOwkx6+LFmoXjSNpW3dHuqtwkRv
	R5FRKH9KbvQ6W0hUmfg5qgwHbHoFrNN6TBBhAIx52GlcKPfulT61gmr1O/t2+Ygrz55JSPv4OUh
	zGiCkMeNk0FbLbSo92kMt2t/fs7lUoQC/TJ+UmVTC4DdaNCEziybCWgGt8uqckVOV5pAOzBHR1W
	Y+d8LzFCq7TOgzrHPCuwMcAC3ZVRHYUdfo7x8L3GhlPn9qwiCAEVVfFWmZ8hV6ReTfqhArT1mYo
	wFeSz0cG4p5EkYy+v9i4xLSdze/9PcHi9vbdeZ7/uH5SfwgbNLnLAVdjFgH1m/mjeNMGiBJUreo
	UR2tBAcLWBgxcseg/O2EzpBDE4YvEBtjBJKHVmKfNAVN46n0d6719TVInonU1
X-Received: by 2002:a05:6808:d4c:b0:497:df42:1de8 with SMTP id 5614622812f47-4afadeb9e4dmr22910804b6e.1.1786362229389;
        Mon, 10 Aug 2026 04:43:49 -0700 (PDT)
X-Received: by 2002:a05:6808:d4c:b0:497:df42:1de8 with SMTP id 5614622812f47-4afadeb9e4dmr22910771b6e.1.1786362228922;
        Mon, 10 Aug 2026 04:43:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b1af06bfc6sm6035281b6e.2.2026.08.10.04.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:43:48 -0700 (PDT)
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
Subject: [PATCH v10 RESEND 0/6] Add initial device trees for Nord platform
Date: Mon, 10 Aug 2026 19:43:07 +0800
Message-ID: <20260810114313.776563-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bz47T07F2aw9xbdZFHsQHgQHhJgxG9Vy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfXxVwSLXy/e15e
 9mQJ1mGMvIvXZp8CMcSihGz1qHoyjeFzHs8qHw7iblfhmEBcTUO+3tgYuqQuExsCtq/CPej3W7/
 SYQUbMLLWccWiMFDTXsHjczPIngz0KeyVGQjjF+xHqT+drhFDR5FOmIED993eVEDub8/axGSm6z
 AxshUGfEDl8SVi+XwlTjAX1kWz8cumxGpWFj/fz8JbY1ra5uBD+SypCPsQS8sdDv5HY9Reahy/0
 4xGwai6/t2gPAzP0kJt9wSN3hRvRFN1LO5i5tao+LwuM2ZM0zGYvsEHtx5Ki/wiP+6mHvtcHr4J
 jgM060cJhCp85X3H4Z59mKs3RS1gPTDscqWNZaeKvP5tlky4XmFSH1HuW2l2HllkYEcsnTRDtnp
 1+l/xoLCYPCJbpaEYBrA9TbRXOr06nDlK24e9kHx7TTByfCNYw/C2O+/H+e5DA+NgGp1jBPTC0o
 2x2OgPY/TM69zt5OKiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfXyonE4sEuhKbJ
 yeEg7czYbBRD3Z8n8xk7F6nW7NmWrWN+Fj3y6483V4x4iXN/FhI3x6Z3jS+hZJSPI7wC9eKpr4N
 qG5SpQIrX6j6TX/Ed27zsPMaCM9qpKA=
X-Proofpoint-GUID: bz47T07F2aw9xbdZFHsQHgQHhJgxG9Vy
X-Authority-Analysis: v=2.4 cv=c+mbhx9l c=1 sm=1 tr=0 ts=6a79b976 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Naiw9UJaHRUbRcGyrnEA:9 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102

[ Resend to drop the remoteproc WIP patch which was included accidentally ]

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

