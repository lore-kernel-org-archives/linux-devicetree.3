Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59B738C415
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 07:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408289; cv=none; b=hKxmcPbLP/ScR23RmRpo2fNfjvY9nL48SwJBNDZ/svBTCPJmLK0d4Gssukqs2ldjDaaOcxW/viwqkz/hAVsRLUcL68P92mpm6DzqADx3h4NPLuuFfmimnxPD5CVR9Y07pi/FtnGkWhkZ6StEtVg8b95vWjD7gVmYC+HfZxXMUPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408289; c=relaxed/simple;
	bh=eL48R+jt9Vy0uloALyKWUiD2ANlpBgAy/ZRCcJtjHbM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oxsM33B8OSZSbiAOJLJ/eMROKA/0wwz5UPCUusCHiMs/ikT7UZ9OT8ZkHSQl2V+Y9Xy54Vc1+9mX+J5xZXn4ZZg3UBugBQ1azpPNfE2qb07DWtPB7WJBfEA0F8F/yFCM0tIEuWQjBxU+LlEKbkOldd1YFUAxQ5wxWEs8ej6lJ0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXjg+KA/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DuZjFYYR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXjg+KA/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DuZjFYYR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748mXE2585297
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 07:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LOFlYgHVuwfuahkGIwISfQ
	vVzq3AYWaHFg0t59mafAI=; b=PXjg+KA/jnicVnyK7d1S6b7/L/2OW16HlSzoYa
	IxIzsy/NS/2TXIJ6B6TjJVENCubfolWNonFkYDkUpI4e3XKykDjAfOdPxtb5GNX6
	WgjrUMz8xivsNEJ+aY/0QYpsNi9fJcgLNqdlh1YlpGHxyfa1fv/ZbHQAMRy0bJQu
	CNelH91a0NmZAe47e4gK+Vok1w8WQQbFwEHoq7endTz+NucX2Z5slvSWY9Tb4E+4
	sT8qYBKvVVoBJcj2j6dQruOXvyNZFyOCVuSQFXw9mId6ojgsjQMFxSk48PjP1PJA
	k3g4LrSSkd9gosinPuZC2hfopfCWSEzDkS5isI4nihO7uw8g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t158nsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 07:11:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37e24235ce1so5900840a91.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 00:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783408286; x=1784013086; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LOFlYgHVuwfuahkGIwISfQvVzq3AYWaHFg0t59mafAI=;
        b=DuZjFYYRC143C3GRGBp40rxWsvIpZFZgvFzS0SwMGgfB5uFW5/7f866DZUYm/LmrnF
         kWfxnF2aU4ijOIuLdC5aZL6GzhPIRwqKr156HD1n10RpEw4slN5mKPcBqmnf3RhzDXLF
         XV/UAs73z0g940bJH2i0hbj/0fDi57KrKweKnyHEwzDNMT+5vUP5IWMeCSROgxpznGAV
         OkJRfmGTnTOJfVgCE60XCy+IOSEf1F9nMoXfPLLwD28WKHhNhI/wmBfGc3bxDu1uhjdN
         jOvBD5Be+etY6IQ72j+PnTgineYuJtdVz4Js6ZC0ijtEx0u8Yfn4sbGOqUR0MrvAi81t
         tLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783408286; x=1784013086;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LOFlYgHVuwfuahkGIwISfQvVzq3AYWaHFg0t59mafAI=;
        b=ChXmeC0hjgOiRQAx9zFyVj8ToJ9PP1mI4QodYqdSFP150VRrcuQL/mSTNBN4FS9WLH
         pL9tbTA+W18lTdjcNY0/4f5LyltxqGetuEUJ2L6e+UCl+MWHyxX+SB9yMfTafWevhDax
         uJ+YJs8TzYFPmr9RRsrgr3Xw9D0DgYuhZH+6K7co4cbc7n7LINL88j0jOH4JOxVCBn1g
         tgjujszb5fp156w1V1QFOx6K0JVQzQouUrz/L4x7MHvmyGsAhrE5U9UOMStrjLJZoBXR
         V0Z3qDJiWxecEO8yq0Z+/u3UgG/bFBLRr/b90lQQ4U4uZuPAMfOOh91nCn5gFKaEIlfJ
         xnMw==
X-Forwarded-Encrypted: i=1; AHgh+RpboQqxumyrtXfXlEl9JDSX39eBXITSO8ig1Vb8pwFrn0pHX0XVYrO4f9/lBPAYBoX8o498nuVyM8yr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr4HLSRDUl70HHGKv7daL4Wx2LJop7NsSYfp2+NIXHsMMvxCpz
	QmP9Xbv4gcfXynXiSRUX1+H8Xvl2YPpfxQnVkXdz9x+kQaPYG4BNk5f6dx954wjSq7KI5XPQ9/3
	j54CffmYmiOOv9Ny5xt9N1Ictx91LD/m7hc5piVLMr0uIg2PEMTGgbJEXqVS6C5lP
X-Gm-Gg: AfdE7cmmTrbX2FtgYNz+gSA34tDB+CG3ZoofdXOv7nfOkS9GsQxm4r0Fd3CGbGrm//r
	bzuIhk6mvdm+npWYW50185RZaCLirTJF5K/t4UL1mtVzeuficUOLx62Dv74Es6QWJ879UGUqvl0
	reX9N1TUEySC4Vxi+kFYOe6sf6AUT26nJsN/ghbiq5I+FIJO4lD9t3oEJb6fq/QGHR37mW/zqbF
	1OlDvh85BWQxrBdqFGUOKP7szSx7DdceNnIobXWOwn65fytw/DRJUkn60yHYiwTSwFBSlBbKI0C
	YnWP52pcx1npMaws2u/biMS0pT+7o0iGWEIxdcqDNc1gIb68R4vT/Az+cRxc9VZrUYWaaH2/aZM
	NrUJrfKa5GiKncNvIthkEQH0nAkOqmDOqdDVJO9jenult
X-Received: by 2002:a17:90b:510f:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-38756dd971dmr4124280a91.8.1783408285705;
        Tue, 07 Jul 2026 00:11:25 -0700 (PDT)
X-Received: by 2002:a17:90b:510f:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-38756dd971dmr4124242a91.8.1783408285228;
        Tue, 07 Jul 2026 00:11:25 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d13fd7bfsm587326a91.6.2026.07.07.00.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:11:24 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v9 0/2] Enable sdhc inline crypto engine for kodiak and
 monaco
Date: Tue, 07 Jul 2026 12:41:11 +0530
Message-Id: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI+mTGoC/02MwQqDMBAFf0VybkIMiWhP/Q8pEtO1RprE7mopi
 P/e2F56eTDwZjZGgB6InYuNIbw8+RQzNKeCudHGO3B/y8yUVJWsVMO9gw5CcB2t85xw4b3Srta
 uN9JolrUZYfDvb7K9/pjWfgK3HJ3jMWAKfBkR7F9a1lKXlZHC6NJIxUseAdBOglL0l0Qknqt9u
 BSCyMP2/QMcNr1cuwAAAA==
X-Change-ID: 20260629-ice_emmc_support-b24c84cb5054
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: dB-SOMl2_OPBAmpmsRbOxbdZ7cwZsd8v
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4ca69e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=xtQGQhj0aSk4Y_6bxbsA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: dB-SOMl2_OPBAmpmsRbOxbdZ7cwZsd8v
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NyBTYWx0ZWRfX2ds5Mh+Gg0FN
 GZoZsHZRUFjk1FRMHtLjL+DUssKrshgWQvXSojWDD8cuit9DLOLwJccX+2FnVrQ4lKRuYYEKXVJ
 uphhn/W5fP/komPCyR2ylJMOIzGPAIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NyBTYWx0ZWRfX6h+ZmfwhMQ2r
 jWaJYm7EgRb0sd1QMSirTaFpN2iif4h3ZG1SG7NoJjcypc+EQ8vpAQvfwLJZ2SdqcfmGSYvC6CU
 P6+7L9UWzsVE5BLnwfYm6vyXnoFToQCihMcg6PKzHzA/ArnoRSNb1tWxh7H7imP0a3ExcZgKPWQ
 hmvkblmyD41lFII2bvcQU/EfT1bKVc6OmIZqdv4CLtG0PfSw6sMLBFWYwMfTdHjSoLZoEadFnn0
 e5eaY+cw/ABUOWMadXk8bYk00nJ9AThXJlOZ0bLfTBfr2ur56Z8VNVRzKTXzvjSk8he1FP9Az8/
 nlZ4N7CI4cXy8svhjABaSUYfeiRlfDVZ8u+ABeHOzI68oWl6GHfev3trFtK9QaLvngUzqW7P1Mu
 E5cuJqVLzi6Mr+GkdeZkCMFw0uQT1mJ5oamqHT3gexBqCm4jsNVRzCZn2GucOrkYsdK3mAc4ShT
 lsNGjrUj/ZZ1K6TQY0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070067

The series is combination of below 2 series sent in past. Since, both
need to be picked together, combine them and send as one series.
- https://lore.kernel.org/lkml/20260608041650.541502-1-neeraj.soni@oss.qualcomm.com/
- https://lore.kernel.org/linux-arm-msm/20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com/

Document and wire the SDHCI to ICE relationship on Qualcomm platforms
where ICE is modelled as a dedicated DT node.

This series:
- adds the qcom,ice phandle to the SDHCI binding and enforces the
  qcom,ice vs embedded-reg modelling rule,
- enables ICE for kodiak and monaco by wiring SDHC to the dedicated ICE
  node,
- adds interface clock and power-domain requirements for the ICE node in
  affected DTS files.

How this series was tested:
- make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
  DT_SCHEMA_FILES=Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml \
  dt_binding_check
- make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CHECK_DTBS=y \
  qcom/monaco-arduino-monza.dtb qcom/monaco-evk.dtb \
  qcom/qcm6490-fairphone-fp5.dtb qcom/qcm6490-idp.dtb \
  qcom/qcm6490-particle-tachyon.dtb qcom/qcm6490-shift-otter.dtb \
  qcom/qcs6490-radxa-dragon-q6a.dtb qcom/qcs6490-rb3gen2.dtb \
  qcom/qcs6490-thundercomm-minipc-g1iot.dtb \
  qcom/qcs6490-thundercomm-rubikpi3.dtb qcom/qcs8300-ride.dtb \
  qcom/sc7280-crd-r3.dtb qcom/sc7280-herobrine-crd-pro.dtb \
  qcom/sc7280-herobrine-crd.dtb qcom/sc7280-herobrine-evoker-lte.dtb \
  qcom/sc7280-herobrine-evoker.dtb qcom/sc7280-herobrine-herobrine-r1.dtb \
  qcom/sc7280-herobrine-villager-r0.dtb \
  qcom/sc7280-herobrine-villager-r1-lte.dtb \
  qcom/sc7280-herobrine-villager-r1.dtb \
  qcom/sc7280-herobrine-zombie-lte.dtb \
  qcom/sc7280-herobrine-zombie-nvme-lte.dtb \
  qcom/sc7280-herobrine-zombie-nvme.dtb qcom/sc7280-herobrine-zombie.dtb \
  qcom/sc7280-idp.dtb qcom/sc7280-idp2.dtb \
  qcom/sm7325-motorola-dubai.dtb qcom/sm7325-nothing-spacewar.dtb

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v9:
- Rebased on linux-next tag next-20260706 (base commit 8e9685d3c41c).
- Drop dt-bindings as already picked in -next by Ulf.
- Enable ice node default for sdhc and ufs and validate DT schema(with
  dt-bindings applied locally).
- Link to v8: https://patch.msgid.link/20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com

Changes in v8:
- Added iface clock, clock-names, power-domain and disabled status in
  kodiak and monaco ICE nodes.
- Enabled ICE in board DTS files where SDHC is enabled while keeping SoC
  ICE nodes disabled by default.
- Updated trailers to reflect co-development and sender sign-off order.
- Revalidated with dt_binding_check and CHECK_DTBS for all impacted DTS.
- Link to v7: https://lore.kernel.org/all/20260608041650.541502-1-neeraj.soni@oss.qualcomm.com/

Changes in v7:
- Rebased on latest linux-next (sdhci-msm.yaml renamed to qcom,sdhci-msm.yaml).
- Added links for previous versions.
- Link to v6: https://lore.kernel.org/all/20260310113557.348502-1-neeraj.soni@oss.qualcomm.com/

Changes in v6:
- Wrapped commit message for patch (1/3) as per Linux coding guidelines.
- Signed off the patch (3/3).
- Link to v5: https://lore.kernel.org/all/20260306093332.4193993-1-neeraj.soni@oss.qualcomm.com/

Changes in v5:
- Updated the constraint for SDHCI 'v4' vs rest to reflect the 'qcom,ice'
  constraint.
- Link to v4: https://lore.kernel.org/all/20260217052526.2335759-1-neeraj.soni@oss.qualcomm.com/

Changes in v4:
- Added a new patch (3/3) for device tree changes for Monaco SoC.
- Updated commit subject of cover letter to reflect "monaco".
- Removed the text description of constraints from "description:" for "qcom,ice" and
  wrapped the code.
- Corrected the schema code to reflect the constraint of "qcom,ice" usage properly.
- Link to v3: https://lore.kernel.org/all/20260206112053.3287756-1-neeraj.soni@oss.qualcomm.com/

Changes in v3:
- Described the purpose for phandle in "description:" for "qcom,ice".
- Re-added the "if: required:" description for "qcom,ice" with proper
  encoding.
- Corrected the uppercase for base address and reg address space for ICE DT node.
- Link to v2: https://lore.kernel.org/all/20260114094848.3790487-1-neeraj.soni@oss.qualcomm.com/

Changes in v2:
- Removed the "if: required:" description for "qcom,ice" dt-binding
  as the ICE node is optional.
- Corrected the ICE dt node entry according to the dt-binding description.
- Added test details.
- Link to v1: https://lore.kernel.org/all/20251124111914.3187803-1-neeraj.soni@oss.qualcomm.com/

Changes in v1:
- Updated the dt-binding for ICE node.
- Added the dt node for ICE for kodiak.

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Neeraj Soni (2):
      arm64: dts: qcom: kodiak: enable inline crypto engine for SDHC
      arm64: dts: qcom: monaco: enable inline crypto engine for SDHC

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 13 +++++++++++++
 2 files changed, 26 insertions(+)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260629-ice_emmc_support-b24c84cb5054

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

