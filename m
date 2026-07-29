Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635DE213E9C
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785286842; cv=none; b=mzOIFilv3FfSWnNAlatQCnAr4n553nXB7VPp02KJ8Zqcxa50HEshXEC6UeTRvHDhg4N836HfygOpVqgc4ZGU1z7Rbr4ks71WAKtsUs8gDglqPCM4hAjrnKY0f5NZlCzs0YORd1wZda1PHt8nPD8r/8FSyCdnprqUb7dnW1iOVC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785286842; c=relaxed/simple;
	bh=pNkOGzAuW+AjCB+izF3yqPvkbuGXMifHd88ZV0z4YPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KN8ORHUzVMSpxiNtr/KsqHAjac+xzhwfN65TFDgwcsVo+sFqvo+HkPTnrtqohR6d++s1GiqDkN4FDqOE6yt/y/7i/5bau9pjvcOwwwpL90GQVxRT63LmmIAq1WQsrNaLd0MGqC+Lr5MI6K81Uidti58aFwTf71S4Bg6ZoDcmdxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E9VqK0BQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KHQCNGAu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E9VqK0BQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KHQCNGAu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SL2ttN142730
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zAijmp+H4zfMwJLayr4qlhbrAyxo4Qng2SN
	w+oDBoII=; b=E9VqK0BQ4AhBZfX15SWi8N2xd/kPP1PWnVVx9YBXihD9Wo/NfVH
	dr+02+crc5MDz+BPsRHEt58tKRl+0SUk9rQBJ7KvJ4MvK8A+zFrfPO5UwZQ0XNo6
	rPeWsINXf6rE66Mv4ckzn1XDka1PFGEeIrhJSKxeSfLh7QR121nkDGyFGqkAlYJM
	Hm5IkrqhemXBA8sL8CfpQsZF2VYAKdg7W1OeKjS8/sUPHjgSPART/Px79j6MkLp4
	j2qrX/wnibyNfHWuyIyxmaINYke8B67GDqOGgmiRd0GpSum4vP3UlEy69xPOR4p7
	0uUOitIZMPX6hpxC772Ik/7kH34Bw1TiqVQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq108sf5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:00:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d001671a54so9364915ad.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785286840; x=1785891640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zAijmp+H4zfMwJLayr4qlhbrAyxo4Qng2SNw+oDBoII=;
        b=KHQCNGAu2dQaa0mE0jFNT7BSFKnmiWJ8+UKtLK11g14IwrmuNeweZP4xLC9WlOtUMl
         QgDgu19l2tVfeCRrDR/87t5Wi9MFO5RBjXzR4IxhA1f1aYq7zQtuDcePO5vYnVp1YBkf
         NA4HhMrfBjQM3Rh05W+7OxJJ2w4rONuzaeekG1Nf5W8OnIDTwpvyAsJbL76Mr/Px/jW/
         B8kXi1x+DJwQ8T9DvVl/4kyke340o/9l9jmVHzCseko3VdvUJsixPLQZIgrIfNTlZ4Yf
         f3yC9T8GRbJjp1Ryd/8YyzqIoe1J8WmdsiYouVQPUsanH3tNEA71PutNA6tsBb57IDLi
         5PXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785286840; x=1785891640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zAijmp+H4zfMwJLayr4qlhbrAyxo4Qng2SNw+oDBoII=;
        b=ioOdHfVtRsMXGayDss6j8EIwhnjRIQlt/rhDyMFYiZPLhXkKLcUgt9XUFOmJRUr+Y9
         39OVjjTr/GiYUhp2kTTHyhoxtcyDydVV3i4q+++NPj0ysHSE+3NmQa088CxZBhgrcB57
         h0dW9htNuOmFZkpBp5WwERaf+ST1mZAfzocYrZ9rUmLnH/Cd8mpHH/34h+qnWgZkgQuo
         DcmJrx0dAh+/1uBtH+f22HR9Q1IjCyzQYlYRDlmukvqasdlVosJTfv5cijkS9MYWEg1o
         R+t8hAQ9OhsdDS68dODQlH6RzH9j+g21aIXjgxB0VInjtCMmlUTAEMgvVWGlkFIyfNY5
         /9uw==
X-Forwarded-Encrypted: i=1; AHgh+RpZcQNKxkeg7lZdSNdApdUEVdD+3vSxVTkojcXPUQpn1NOEAjcaGaZ1/fpEZftD9Jrx96MB3Bh0c3WP@vger.kernel.org
X-Gm-Message-State: AOJu0YzoPd115LIegIQS0uAT933AbjTY9NugiN5cPB+Gvm5EjYewjATw
	tDYNngcObLcnylvO+qeq4Kh3hQnkj7ja5maNXZWNWueNtjt3hc5BuGHEan1Jjc9PJ1OvB9CGS9k
	tVH/fn2YdcqUs7Aa1wZi6uCyrM8Dv+KhDAS91uvZ8uYpFu/Gfhna05zaBi/rFVUo6
X-Gm-Gg: AR+sD10ssf0TaDzYJObaKT0J1liwPDGnBCltsjYxadiS+6QmZ7cFAR9nkYbJc/CNYkX
	PuG4rftvFxufoqkcf45NNTZitZUt+loRcqFjNS2OUX5/8VtoWUT38v29ifwZT+6XUBXx/CqdIu/
	PolPWSqydn4swzEM6Ewz2zNSZRypzanfgdVr2/OHM9bcj2w9gAlZmdl8y+vxlVYqosNYTdpAMaL
	K45IV4/BlFv2wKIkmp5i9Iv/IUV6icdXKY5p2XwgxqUflJ93g4+X7zOmeFrbFS2eUnSnT3UeJNl
	zljN1VL83551q0b/C6azbi4eBG6XQVEjviS0nchbXC4v5Pc3RcClCFDOpIdMts85vbGYLWYht4c
	6JY0jCdONJ+Pm5QlbWbIZAM/DR/XpHcYJeYSH/pw+C9pEr80spMAt2aDNt1KS
X-Received: by 2002:a17:903:19f0:b0:2ca:e19c:986 with SMTP id d9443c01a7336-2d015b15bcbmr51872495ad.1.1785286839686;
        Tue, 28 Jul 2026 18:00:39 -0700 (PDT)
X-Received: by 2002:a17:903:19f0:b0:2ca:e19c:986 with SMTP id d9443c01a7336-2d015b15bcbmr51871935ad.1.1785286839055;
        Tue, 28 Jul 2026 18:00:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b88e12sm3456696eec.11.2026.07.28.18.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:00:38 -0700 (PDT)
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
Subject: [PATCH v8 0/6] Add initial device trees for Nord platform
Date: Wed, 29 Jul 2026 09:00:16 +0800
Message-ID: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iq0xpxQ3n2TGm63ZsLPH_Irw4_9r3GkB
X-Authority-Analysis: v=2.4 cv=fufsol4f c=1 sm=1 tr=0 ts=6a6950b8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ezZJ2SQG6veOboB-108A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: iq0xpxQ3n2TGm63ZsLPH_Irw4_9r3GkB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX32sYkZQcaQ6t
 c1KumeuZUhwgJpGgNIM8WwQBd4ZsQWdbhmSWvyOa8MkWa4VYgyufzVmBpWLyrMMMdRKFturET7m
 +8bc8mi6OF9XtciOkdNGeho+wiPekUw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX4uDa5djPSIbC
 8q06lFFM3WO2OorkFUmwCvN5h0BOvFDY80N4v9ffaHs/6WIAyu7CXuB4TK3r3UpWV1UpY6bJCm/
 JNwDSypMxUoSEb6uqzNt4P9lMKd0k+ws4LZpg+K1LUAd+hT446tDLVrihCEt/zi1I1viP6TX701
 6SY74musycooXB1FVFEykXs4iNGFAUGBriUQ91q1egco8NVPiSec5KLLMxfcHxEPP5MRo1wX/74
 GN/Wj2cr/Cums9gQQVwegFmdcYMwGPvQxG9uDIUEFNFGriniT7vitrbjfXd9z5Aho6vnZ0NETc6
 Z8wZdYop+Vn4AkK6GDch+rjIk4bucYPoiuqiKAqTT48TxHOOTauXPDVGz5kO/H1KV3FAC2QS63q
 1Vl4m6ijV1pKR3k+8OskH4i7+FfeIj7fuBoACtvlv/JOogyxbq3uY9Mcs4yf06eYw9EFSB/i2ut
 ktK8Ji3aFAkF0bNd3Cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290005

This series adds initial device tree support for Qualcomm's Nord SoC
and the reference design boards, SA8797P RIDE for Automotive and IQ10 RRD
for Robotics.

Nord includes two variants, GearVM and Embedded. The GearVM variant has
platform resources (clocks, regulators, powerdomains, etc.) controlled
by SCMI server running on a VM. And the Embedded variant has the resources
directly controlled by the operating system.

SA8797P RIDE board is built on GearVM variant, while IQ10 RRD is built
on Embedded variant.

Tested on next-20260728.

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
 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi     | 2842 ++++++++++
 arch/arm64/boot/dts/qcom/nord-ride.dts        |  232 +
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  548 ++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4605 +++++++++++++++++
 7 files changed, 9961 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord-rrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi

-- 
2.43.0

