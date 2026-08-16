Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5718A1A681E
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786884910; cv=none; b=SIBKXeM8RCgOnmGCjLCndrOpP4VB7lhzzs1Nec/2blU+rRP9zKvDA8j1GfCOavqS6sS5JB6Comw2xzBneR1E7CilAijCJ41+QEjPWUjfZNL8NxTGSDtp5tNXpC7xKa64qiXWmyzGv/us+4SMxGbEv+7IHOVFCSVZvtvzh9VfMvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786884910; c=relaxed/simple;
	bh=d8fngDZHzo0mpKnMJAJCjN/ZyJ0og6JVIb4mMebmmFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NCFmzLDUKgB/jGGcZHn7BKN/pmS99cglpRLvSZtwfvXMosip6H1zl3JH9hye7ZdhkFF/eyn0ew9SLhHzp5BQhoGdGNzDPZTigYahnTBjup+UJV7pZv9a3OwWwZLdvIxRQClIFMb/AGiHePvb1hi5z0I2N+mMTeGpeBlQr2jMPag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h5FIx1ln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FCqazqGp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5FIx1ln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FCqazqGp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GAhZO43256416
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pii0aw9ZziwZ2SqRv/VR55lsF7TaTPEUEFu
	aGcSFswo=; b=h5FIx1lnFCFLzhzrWlmkO1MPncSqKoT4AdPUyGw/DwmXWkODkPb
	ZkmLVCOrJhoFjcA5bBmyRBfBj2nHRPEtgOkkB20Hku2ml1UJsVUWmzySCEGRlp3E
	YFzRftOiGZqhiSF+fb3G55JbAqQEMZ3azl2qK0tXmJFW0PU+5/ui0dW2X3TB+4Io
	glo5WRlQzuFfPpoTzQfYFN57e4KjcXRrabYyJY4+z/7+J0j95oQ67WQsXePonWt8
	mSy+BlfW1GBzJFEePrTQoVVLDZakM0w5RdQsMGXRnh9via/e2D27FwkC7xpNpDK1
	mGs2iih2tUwHmFZuNAbLEYhLfvX+jKgDISA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghekghv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:55:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so1712464a12.1
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 05:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786884906; x=1787489706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pii0aw9ZziwZ2SqRv/VR55lsF7TaTPEUEFuaGcSFswo=;
        b=FCqazqGp+XLMhZ4w61wDuD1YwHT5I0Gm1ICUNsYS92c8OQd8d5nGR4z5XtRvCDHU/A
         AKCVJT+/2rPvhTsJ2X9dvf1aeOdWb6HDr7hUZrZn33/f5tULpAwcaYLjGiZfDkGnHAU/
         6qtLC2s2n6BrltjsLvzN/il3F9f6KmrfOum7wlbEV/8u7av3e1Tg7GvBIanY0GBtgI3y
         XtFMm9h2sPgsuDCYCz3bS5qi6SlpGxGPcAI0no8m22oOKCjTk9ebTdiRlLnJ418uvkhT
         EvWBELh9PTIcVXgwqkhjgDTqErly5sR2RZrFTu7MdWQw+RTCGuXTS6LuJbUcWN80IU46
         PaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786884906; x=1787489706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pii0aw9ZziwZ2SqRv/VR55lsF7TaTPEUEFuaGcSFswo=;
        b=Tj1VY7fzP/Y8A+HFKrtdIvbTNuAfpHkCmUPuBVG6XyMWI/2120QQFuNcncbLB1gV9C
         1q692qJE4/nw92BfbzjLqNyCo3Xc0wKNIPVE/aUd2vUXE3DUcpVdAMG99l+Ibim0VrBM
         L5K38JbpWrFwZIdUM30H/MpVRr7pQmetJo980tvbgUbt8DMepW4VO11HoaElw2/Q9iY0
         nhWi13O6/2o37PdG9M98zZpebEq53CejS4rsp8OD2VOZo0IqdFly773jq5oSgOD5Vlw0
         ay4zQCnHHOJ1Td6uS3zgY6gT6kqDSvC6ZJl3T3VbwO01vvT0llH4vXhP15OhBfE24jdf
         Ieqw==
X-Forwarded-Encrypted: i=1; AHgh+RonovtyVUkJEcZHEYBPtnRSb/NV27a7g8cDvGPMo1rXCSPUiB6OlpVu1vUv4mzt5asz+5qh5xkIGC7R@vger.kernel.org
X-Gm-Message-State: AOJu0YyHPDDXTpT5Z4tGJegbent7aVkZlnGJkH4FUTHVcsAozxHG6Ec+
	EQfWY4RFWEkTyv6BiCLb2b5yy8WEV3qJekIaKA8lBJ/pXKyf2CYKCncRqeDgzw8vVTFvQ15wv+p
	a0qLxgZVTL3OAYkySu7rOUUZ5bzEh5vf/7/6fbYZMjDEXSD6ORZT7XlOUnrn61s6T
X-Gm-Gg: AR+sD11SLs2DWs915la7sgPaSEyZyvxliksaCBt7v3kSgYKzsJzmmNEgPQaQBHtGKJK
	XRMHu60te2zRPWnSEb0PtountTnOitidmS+PwjrB8lGYgAvI2XKpWpV08jw1BZpiNfo5wX7Uhve
	OigDF/nK1vUQC9t8mpXtAJTO51GXLOvad48/fFx3CwiRs5rXnh8M8uUMqoP8nCjtv6AsBniJE0E
	4rGPpAYP6ge6O975c8SnAPopAbIy8C/hmycWvr3062/2T3mkwPFvolYuGdxSEuhTDYR3ZBS57Qo
	bIa6Hjc5EcUyOmjhUkdsFgSFR6YY72DJbbsTabw6yk60ExItWpZKDMbK+otApLQemKj4eTvukGQ
	2OnIlynA4gqrlvraqn+GPSs31W9WgvjB5W0wKdjAURA785rt9jrF7iiz9hwUW
X-Received: by 2002:a05:6a20:430d:b0:3c3:bbe6:95de with SMTP id adf61e73a8af0-3cc71d533c0mr19161904637.6.1786884906089;
        Sun, 16 Aug 2026 05:55:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:430d:b0:3c3:bbe6:95de with SMTP id adf61e73a8af0-3cc71d533c0mr19161864637.6.1786884905581;
        Sun, 16 Aug 2026 05:55:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141388bd5a7sm40072703c88.15.2026.08.16.05.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 05:55:04 -0700 (PDT)
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
Subject: [PATCH v11 0/6] Add initial device trees for Nord platform
Date: Sun, 16 Aug 2026 20:54:07 +0800
Message-ID: <20260816125413.1635150-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EKc2FVZC c=1 sm=1 tr=0 ts=6a81b32b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Naiw9UJaHRUbRcGyrnEA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDEwMSBTYWx0ZWRfX+dSw7sTifGE3
 2yQQzZz8+JGloKRsIHciQevLd7HA4ue9heeqOfoRIY22Y9Ic2lLWZxv/zzafP+DxCbzhPcY/0yn
 0HgcLfwzCVPGV9M6fAxZRD+XIyCQcq8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDEwMSBTYWx0ZWRfX+WqwX0Z1nwlo
 ivpzsnVkUKxc++Eldb9b36kwCre/bt0BbSaOecou2RoHVgswN4B4LT66xwaTd4GO+j4tlvrTEp0
 zyfLv2CcGJrDTlGx/L67bl3+t7ViC5Tz5VQQcyefqBs0wAEwsT/xKS8Rmlm7EySF81Whf9kkI1E
 qseckdojVNds/luVAOiQT52OFeuurXCL/Z3paBxAjVKkszVZWIw4FJUEo+mAcPepAGxU1BDHyCE
 UXO2w+OOszPv8f1Zj7EWY3cxQCtOtkymJqGeNsjdlfmQiIzrWrCqZxt73oaRH9smwIfnY5gYwsD
 qQruggmsi94xeGYqQoZRpc0D/eXQD8z+ImpG3JFsT9WNH01okHOTKi0cu3MWNzGakRX7X9gNlwT
 e7RAMZjcOeulCNIPAoOnDnqYsRVzo2/t1UeSaKfynzFmqt7FkPhduxjKTlc6F2LGya/GhN4pQEz
 QEK3bkUbvL4T/mj8wTw==
X-Proofpoint-GUID: pQS-jxcK2ha0QD_S4NA6enrMNdepzgZ9
X-Proofpoint-ORIG-GUID: pQS-jxcK2ha0QD_S4NA6enrMNdepzgZ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160101

This series adds initial device tree support for Qualcomm's Nord SoC
and the reference design boards, SA8797P RIDE for Automotive and IQ10 RRD
for Robotics.

Nord includes two variants, GearVM and Embedded. The GearVM variant has
platform resources (clocks, regulators, powerdomains, etc.) controlled
by SCMI server running on a VM. And the Embedded variant has the resources
directly controlled by the operating system.

SA8797P RIDE board is built on GearVM variant, while IQ10 RRD is built
on Embedded variant.

Tested on next-20260814.

Changes for v11:
- Use hyphen in rpmhpd OPP node names (opp2/opp3 - copy & paste from
  lemans.dtsi)
- Link to v10: https://lore.kernel.org/all/20260810114313.776563-1-shengchao.guo@oss.qualcomm.com/

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

