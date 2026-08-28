Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7049D274B53
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 03:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787889038; cv=none; b=OdPH2F9AIPztDcq3jL+XNLSrOC/a7zAE4FEKDesM/DoKo+Zuwx40BTwUuqE1ztAy8VDMxN+XlStHJBML540AJ0qA8MBFm+Xf0eWzjksraDY4Lh8w4ZUxA7TNpvsT4rY6uorwoe57kmifar2dDkObRzBjEv3hKyDomFtHX8YKaFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787889038; c=relaxed/simple;
	bh=geWrLN1/J+k3Kz2cEBadQ7sZvi2GRaJuUH70TUXL1ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ur+OpsY2V91EjveTFojKAgsp8FJsMD0FlyOkUijhYTCbZfYWzznVlrfiaHW8+77/Y/ZYrX3IhBrg4nggzr/0cQzFSXAskEjnEvTq44UG4y1FPKbF3kcdcHUdL3RqWpjUzfJSTbuUYT5gi4xzn1MMO4FnMd/q2bU4+OT+atv6fT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U49GZ7KB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I52aShr2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U49GZ7KB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I52aShr2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S3Jihu1153396
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 03:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Fa5QEbRUffF9AhLgAoUuujXNq1YP5CuIe3K
	kAaoOzKE=; b=U49GZ7KB4pPEXmyvVCBq7CRXEEvyJm8SUwjN8yt2CuSx1H5Qq6C
	I3SpxZnc782VErV49lm2MUkTOzJ8jp2lQige5zlhnJyrGNREyaB49GulGkfWQh6U
	4t5QVNTtYyKqbFEq/HZbcJxEyUfbrMQ9J+CFbwKKXUzqcOkshlGr+UEc755E95My
	vgwwLAwlIVHmvyuVUbVkswpQ0XK24f+PO2c971UaYuopEveU8mmV1jy74KHOwh2o
	gC21P2obMBD/BP7zSbZM2K38Age+WOkMcN3vOByl+ED39axeK8EIb9b4T2m3hHLX
	O4AtD4nEov+GZ/6IZNAWg0IuRhEVq6s5lMA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7v3eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 03:50:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6fb956002so6832535ad.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 20:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787889035; x=1788493835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fa5QEbRUffF9AhLgAoUuujXNq1YP5CuIe3KkAaoOzKE=;
        b=I52aShr28Bdpv9VNTG+C44CqbDXmVd9Oz9puazPU/lPmQfghqVqI1gmFVTlvKjD+um
         1aUxoEoqpWbCms5uphMtordozh0nHNOU/t7N/2I7tZlIZbqlDLzl6aE3GLWpNKHDjdIq
         GOXfN0NGHIWk2QsvWAl1hvxwWODt5RxViFvsCPIQ6zgP7xuW4dCYJ8war0IIhbYiM3ii
         S2zIGLBGQ3vwvHY5QXEKd1xHyqeDxT3j2uR9ie6AFg5GOdzj/QQCQXccgpugOhcw1Ray
         o/u8AURCUyDmzhk4xmvV3Ssojz2pNe74AEXpyoIOhkRTMGAlUf04orWuSod+M5SyDE9K
         +TZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787889035; x=1788493835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fa5QEbRUffF9AhLgAoUuujXNq1YP5CuIe3KkAaoOzKE=;
        b=DZhbQDPOX2cbftMyTrLJHnNhX30GT7wYtNDOGMaqKfWmUabVq57WgByEFnKQ3bGwiY
         lk/rVyEesFTG3Ewa97tCiaO0lSPGjS/pIGBBluE6X1wQRcV873dhK1OyvM89zLb6trkW
         NgV0OMcvqa9zrLsG5E1UH+7fqJqZ3yEQ7QNOMuz8zmg6Sxo9+HoyfoPSCTjM+pVsTBdT
         /WlBfRSjOw0cpdcmhfqjMsS4SDDZ6LjSJYvvLqvHM988bNJRnf+pssyRhWj3vcNrTgJ0
         AwAJh5t1IPINvEISA91KhOTDvp2QJT40S/+UHko4UkbTMDak0G0XWAfwElLtqBKamViO
         QgJA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7iAENcvzBbiM722mO1L8LWR51z9MKfoxDQ2fp3cTh3++3dBprF6rpZC9/NcNRLBQn3N6CtqpL1/KT@vger.kernel.org
X-Gm-Message-State: AFuF++n9AHAg/ao7M/Zx3FxQfxmL8LN931ybgKu6lHZi3/+td9TLtSsb
	WYICH5jrCQ7fgToGJGRkIbYFlj/N9Wu5Ak8hA1Mhj5Ihjutry3WSGKecWjwRChq1gf0rFsdd7mI
	SYJTV8GOekJI4+xDrTzTvxQ3wFuIKeitIg7+3IJ86g3WZhvIRD2KEPsQVorLzuzRo
X-Gm-Gg: AR+sD13CxLFfizYLNlQ5CfxGcTrGmu3lhj/MOjSthz4wSH9hre35/5vSfOGenkNG6w0
	CHOE/UdBllg0Hj77NwGZGhicZTOgXS6ZfjLEry2rjVdSdn5fWZ8RAyCCjF8NBUDechmfirsL34v
	PUrzvC5nVZemviezVMKDqoqOMFKxqP6T+moCRse4uldj0o/hCUlXJZdq6fsIKAVKD5PBdfksRt0
	/VBIca9oAtJXvgkZYzRo5+TWizr0ulmFgrQOYFVBXgvQ6RRri0Px9T6jI73tKQHbikV2bTmptiz
	hxKCYpAOXK2Vpx+FZwgXhTkJp1MFYrE+PeD2G7zZnvofkw6nOl/sdr83oqPCp614sIciuKMZUym
	oFI3IiLAewQXk31XxZmXumrP6R9XNk2wddZU6UJun35aKuwDcbX2ozkUvH0mu
X-Received: by 2002:a17:902:ec82:b0:2d6:3c2f:6a4 with SMTP id d9443c01a7336-2d74df293c5mr57232405ad.13.1787889034997;
        Thu, 27 Aug 2026 20:50:34 -0700 (PDT)
X-Received: by 2002:a17:902:ec82:b0:2d6:3c2f:6a4 with SMTP id d9443c01a7336-2d74df293c5mr57231075ad.13.1787889034033;
        Thu, 27 Aug 2026 20:50:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm1133357eec.22.2026.08.27.20.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:50:33 -0700 (PDT)
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v13 0/6] Add initial device trees for Nord platform
Date: Fri, 28 Aug 2026 11:49:52 +0800
Message-ID: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDAyOSBTYWx0ZWRfX0lPmiT1Qheu8
 ZlsZyTIjhKKNZoAX5lsUw9I+MLQEp3CVK+akIHNGg+QXiTbihPnxdyh0XYVFO9z1n2Lzhokounh
 fJBLNuY0ZEPyR9e+eaMuqHVSuclbQUNp3NTD/uyUJikqY4EC6YLm/2SV3Kcf4FTfWtugICCy0pz
 QZEQQ+9SNQOCf+JaQYnvmYTtdgbKKO3z1XqaylY2bhspNy3LcevezDEVrsiHkkjfmXMAISkXEgg
 WzC9kdALa3yyC9amcehotqHtOdWprBuaaWSk+4PuoWujccK4GHE1nKD4uEJHoCA6Ow7PQz3GAQS
 MU1bwsqI23mieU8wgOCEd9ccmiAoDQfBLBW58mdejPh3X92HGE7twP9q/WVdswE+qHfngSPbBsd
 j3BoCv2THJmFzYB3WNRUqqVNhZ9BlpsIYsG1iddHu05ipBLHi3n3A2aM8MyQY/heBoU1EgQHS5j
 2YqaPthG7UOdDXfRslA==
X-Proofpoint-GUID: ZwDAqJ6ENhBHjaYWlwcylpkFr_3E-kxl
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a91058b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Naiw9UJaHRUbRcGyrnEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ZwDAqJ6ENhBHjaYWlwcylpkFr_3E-kxl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDAyOSBTYWx0ZWRfX2DRAiB2Zjj+E
 vyEe3PZcyXiPIyneWvXFWdHDmRBxl2ygQCFvmXHQlWT5RQtlG+STKghiruLX8fjQO2ZbTIcjPj0
 dr7WuAMXou8fRZ/Rg2ES+j96jVHLfG8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280029

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

Changes for v13:
- Update commit log of patch 2/6 to reflect SCMI channels for I2C/SPI/UART
- Include qcom,rpmhpd.h instead of qcom-rpmpd.h in nord-embedded.dtsi
- Link to v12: https://lore.kernel.org/all/20260826041200.528588-1-shengchao.guo@oss.qualcomm.com/

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

