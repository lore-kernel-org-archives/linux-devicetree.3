Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EA831D72E
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787717591; cv=none; b=c9v7/i0bM1qTLTiD7XAqEyVxnIitrIVqEf3xqT6OMvgEOUXyQGe1ECOL7zu3pr+Gr/YoDEhlO7dKw9VNeJ13T6HRWJqjr1lEEBLdm3KQ3TE3V17XMI5YVQctpX80p1gvT2Fk8QWdlUWxA2aG/NCDsWeYqhApGBKpJqU2DVa8pXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787717591; c=relaxed/simple;
	bh=N/RGtCRgDJ/w5yD5Vu3M2RizSc4LlIsKGEIEBPJmhwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sKLWu85MmnGGTnj4KadFxHcfq6SVsAEwZx2hOHM2adE8kVNDstUDUI9L6WtVTkyjzFOVWPH57fmKabSUAMvsylB7qH7dSxpxENITiijnZc0MajZxGhSghV0npHnFq4ml7cj3+1/kkroar8beJEm/k5yJirRNljaGSfIiGvq2tnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Db3Q3YeW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gu9Pj5Dg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Db3Q3YeW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gu9Pj5Dg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3HOYD3381097
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gMrqSg+e8HODoLwM7PCa+vpFzuZmkg0AX+C
	B3GQ2Q7g=; b=Db3Q3YeW+vbD1nh0VcNra96I4O6+pgTM5QIg7W23/KB98Y9ZJFy
	AJPsULzqL+RWAeASHo7uz9YqSa1QOVUS9WZ1jEMkG6uTw05Opkw+gewVGNQxcRxE
	gict/DA37QFqjMAdAaOoIlccrc64C7CsTQ16Rp/moZbYYEx+Fr/iTlYs6J5ie/rY
	pupsXkZQbIcrJ4I92A/mw3LeBjqgoEpir8tO4V0NTEjNtgc6aZWJAQCj/0c3n2+6
	zh7b6CJWHc11j51YK7n1dQyjJsixdtPBklB5EKkdJYwCFsrZojfuD4VQTXNQ8O75
	0JefB1XOtX4fSN/aD9/jh/P6zfBJ1PYfE9w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g98hp3w94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:13:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so1902584a91.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 21:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787717589; x=1788322389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gMrqSg+e8HODoLwM7PCa+vpFzuZmkg0AX+CB3GQ2Q7g=;
        b=gu9Pj5DgQfBC3Zgmx766nkf5GMWG/D8TYPrvZBTn7BZQtbbB/RjMq1UoTqRK8LmHEy
         EZnToQhDzaZH+by7ATNsO4bEH5UC7jNCNDYuV66lpOHBLI0u3TVW5WdLH3aRFtCoE+5V
         E/UQo5Wf7YsFNHN8UXotoxWZFjxHLgbqL4PWbE8nY7hRLEc94TP47EUU8kSZCR12m+fO
         FeS0+eOcqDrBCbTFYr/7ApZEvum0hBUUGQoV3+rMBHoGFq0BGh8u5PyfOset33Rz1aid
         k3n+I3jjPXSw3KS1QED+KoHO9dEFgOZWwa8vZDKNEFmypiVe733imbwdCDxcAxvgE/VD
         gngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787717589; x=1788322389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMrqSg+e8HODoLwM7PCa+vpFzuZmkg0AX+CB3GQ2Q7g=;
        b=hUzWNP+KiAgSV1IItM4Ri6+4wBgVR9i5NVykridy+lGMeX+BdVZdusx+hPSxEir3Vd
         CjhqEt/4neJCY0tFDkVMkKdETxBQZYxczaAywwtI3hOQjCan9BT8/jabC3SFz2FV4ooU
         dPVCk0cNytuhDbFL+ItYaAGxpFKLha98zhHStgHvenEMSl5bTP2300xgcBVPL4KamLg0
         GI3uxQvg4SgDiMJmrb6OHFXl9G262d7CYpvesb2aJkTrxsDB9UZ2e5jVloKi6ZADDupe
         sqADuW6ndJ1JCKmsnupUiofwelM2mDitvSiOzL8jE2AAEmIhbPuGYiGWGp+I3jy+kdmP
         h22A==
X-Forwarded-Encrypted: i=1; AHgh+RqdNr7hcQn9pC+yu954cNMgCkrm21yIY/RsNAZeSqPLrN618dV3LNLk/0QgZ1ES2mXu9wy7fQblPNac@vger.kernel.org
X-Gm-Message-State: AFuF++nGemSuKrePpuLOBxW5GRAvQ9pyGcSckVHRaXW8+4z4CDBxuoVi
	8KVHCVI4Y1lkdr/lZLaulNA/ni5yim2xaznbM9JqLzYCjZmDz4sLsDVLoXvMRt2tSjaweTebgwF
	M30HHm/IvdmQ2aACEup/ZcWwntFYCSgGbfSHqQC1W+2QQbx9U1pDIlP4u6MioAid4swjVDHl4
X-Gm-Gg: AR+sD12Q5zSNz3pED5g4LlWGnEhupAXo6AGIvFnSLaNdvrKAlypDGzcpp+75fpHLwii
	4yGgyA+/fxV/t3MpdQH/Yy2pW9F4IMT9CJR8ZS5CVE6Vly48c3Xt4MJktt6Tn39W+lMCHtZwau1
	8C2A1k5dm1P34pLET6849JxU078yW68g/yZ+HszjZOMR1iiLRhfsabrTonwEKvNSKVLJm8OBw2K
	4nmaGAMyh4dQ6vbl4cfj5RPuOru780stg8lKuy6b0xypsYzV+rpFNvU1hTDD/xBVbm/WYFHXrs6
	+eain7RV7W1AjdKKuRNEAXGvfBEVdEjB3cJgn08b3vp9vvDunF5KohZkg+FifkUenE0lvDb7oYr
	dZ/E7xrBy/qgH3H3tkFBZTBbNPkxgRmlaBpeBC9pcoXmiECkF+guZfdFI/uau
X-Received: by 2002:a17:90b:53c5:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-396458291e6mr16201427a91.3.1787717588621;
        Tue, 25 Aug 2026 21:13:08 -0700 (PDT)
X-Received: by 2002:a17:90b:53c5:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-396458291e6mr16201368a91.3.1787717588090;
        Tue, 25 Aug 2026 21:13:08 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm5979471c88.12.2026.08.25.21.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 21:13:07 -0700 (PDT)
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
Subject: [PATCH v12 0/6] Add initial device trees for Nord platform
Date: Wed, 26 Aug 2026 12:11:54 +0800
Message-ID: <20260826041200.528588-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Vwr_eva72HCLyipVbbbu2siizISpnz81
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAzMiBTYWx0ZWRfX9pLXzTG6h+il
 t7iDAtLdsTdBs7uWcXzjXoion4hihXZ57P0gDCWweLUqPO6lY+jRYN0QHn4sJJLop5mqShut5g7
 ua0AXY1HI+vxkiVfbLy8irl7NIANl4ZUknxVCbqQ0RAL+tJY5BdHLN8cKFYgUdbSuSXkXCIOQiv
 1aOaoOKF34KA4ZFirS0o1FNzRLmQC+OVk5dw4PvTzGsJXBEj/eyeX5HTXF/03QP4KkYY1q4u57c
 H+P77YkjTYCQG4q5sRj48bF2ywwVsp8G/j/s77j2V5YO45KcsQYV08tW4ik2uuK0xbwhKvKvcnR
 dM8sO+s+XHlozJObPPWcs+m5Ta20EHqzWeN7+UiSXeLvyigIRBAXDhiM8c74IpMQzVyLc6hlNIP
 6wpuUI14rce/IAdE4Ho/5GQo9Ey3Ft+Il/N0wrguqMjQnygy4RIW7mrZse8hLvYZO0tNdfexjBk
 I2A2Xeqt6ELrX/JMd9w==
X-Authority-Analysis: v=2.4 cv=B7CJFutM c=1 sm=1 tr=0 ts=6a8e67d5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Naiw9UJaHRUbRcGyrnEA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Vwr_eva72HCLyipVbbbu2siizISpnz81
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAzMiBTYWx0ZWRfX2rAK4uDkf5jr
 +3YybBmDhO5J+005E5gmqT+A9N/TK5NUwYEY9IwDhFnG+KgjI3odpxm3yHpdwYvIXCx5ZqeEtNn
 f5klUo2Y8sRysD5EUG1pwwAgVM79Lw0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260032

This series adds initial device tree support for Qualcomm's Nord SoC
and the reference design boards, SA8797P RIDE for Automotive and IQ10 RRD
for Robotics.

Nord includes two variants, GearVM and Embedded. The GearVM variant has
platform resources (clocks, regulators, powerdomains, etc.) controlled
by SCMI server running on a VM. And the Embedded variant has the resources
directly controlled by the operating system.

SA8797P RIDE board is built on GearVM variant, while IQ10 RRD is built
on Embedded variant.

Tested on next-20260821.

Changes for v12:
- Update interconnect-names to be one-line-per-string style in
  nord-embedded.dtsi
- Fix SCMI channel for I2C and SPI in nord-gearvm.dtsi
- Correct cpu_perf node in nord.dtsi to be a power-domain provider
- Link to v11: https://lore.kernel.org/all/20260816125413.1635150-1-shengchao.guo@oss.qualcomm.com/

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
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 1820 +++++++
 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi     | 2848 ++++++++++
 arch/arm64/boot/dts/qcom/nord-ride.dts        |  254 +
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  548 ++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4605 +++++++++++++++++
 7 files changed, 10083 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord-rrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi

-- 
2.43.0

