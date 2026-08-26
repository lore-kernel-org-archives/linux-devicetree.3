Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8B213D891
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787713194; cv=none; b=j/PZu1FzsDlzsbjGyA+aJ9kPN3ocjNBbom2+o3/hG6DMftn0osB6T159TOaSaeparelueYGFyESlsVivXswi0g/qAV051c3sIrgW1FJvRTECwnTu9lbOJOTeRtkDjVk+a6I5Xv4wT7UqwDul8tLuhyaGD03Xdqsv+WHqcZLdmvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787713194; c=relaxed/simple;
	bh=rZHcXUpQLfOGoX2+9MvzzR5kJp0s7tU1P38XpiNjR6Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TAqkC4zy2JuK+X3Puuzj1h/aoLgVR6+wchO2Blwqc36YI0JTLBWPab6c9ZpHO0P8xo506RpL6mnmBzeT+u27yV+NDvxXuZGSsyj9FzlZDToytjDOLixB2BLzECPdjdkH9Q5Bd5gPkFaNcQEJ5A2kot91RHeLJxrcAw4/3Xgj1nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mk3CIDXc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6GOrj5Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mk3CIDXc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6GOrj5Y"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q07Dil2388169
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tsui+jCLbes+AY1aeuJN4x
	2smWocT5xCPUCpoX8LYeo=; b=Mk3CIDXcp5//5XKXXA2LD+DUcXa6tBx2EUhxQn
	/sjxV1LvmNteCpb6ORA4OKveiVGNM6lakDJ4lkn0+0966CmITnkntoP5cccfkm1Z
	oRairDi0lfZxNOKZjnWYClLW4B3tGVq3YvkGlhe46+js9BhtLIc/u6pg1PUKfF6B
	SxSQMhc6q0rYeVQHDDbNDryNDTBwv6/Nrjl5mAfk8JFCrjiFe+KXm4+mCGNOiR2T
	WiYIbIjzNhyyiMW2PHSdYWdKdd8A6vfkqzTBQiLbuoI4qRJG0VhkgVBkI69aBOQz
	3EEGEJtysCQf4TsoWDkrGLtQCoE1fLlf7/yr2W3T2uQcXpVw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgr9q7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:59:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c5810451so267573a12.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787713191; x=1788317991; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tsui+jCLbes+AY1aeuJN4x2smWocT5xCPUCpoX8LYeo=;
        b=c6GOrj5YXkm65uAejWGaWykvN9Ud/1GJdbh1/tLLyIzc5CeSQqEWlnv5khh9ItFAMP
         +5exErsGxrvGqZDsa+1raCRnxYqdm7R0PXtMDNpW/HcaI89/X3lUP7KHuKuYMkQAAHOK
         I0nuidFI3lVKogtcJuRHxA+UIhe2nrRWZNxPRphNYNvuZVXTrHgNQmka5+b0eFHfu7UQ
         +Sc6tx9jwsBHa9TlwC2p/SUAull18z8Q416FaMQbw0eyEPeEUCfL4lIRbHjPutkp5h20
         UIkP9DObaCxgKFpd1d44cjoDlO2TlgjRqLixOzxk0xkgLn6TDsPfNMx0GgGD+CquscYL
         JUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787713191; x=1788317991;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tsui+jCLbes+AY1aeuJN4x2smWocT5xCPUCpoX8LYeo=;
        b=UcapWi0cPGuwrqqY9Sv1Y+8tRVOp03IYCkQ0Wx4drDNMB9+A/zPoYjfUSIz7UPVTGO
         8y40mwderT1izy/Ye7TMEKnGLi5N09tFhT3vWGD1kO0X5odE02/CIGKD59hnn38K+Oc9
         944zsUqjEfEWAZOY8HdMq3iwT3meRDlR9goegnD5CixCd3bUHlVXqor3VUI1fYgN/lD4
         bgvF8rK4KmnBlWZe4ab7ch2RT6iIzsOjnNHpcWHMLbS2kZFOtSlvj+7RxZ6QMpQliI0u
         /gBkPELUTC+tYupwq6as/W32QSCGRUheMcuE4QjZ0AcySnpV4C5VjT2PVDP+wAXTKhBD
         Ld7w==
X-Forwarded-Encrypted: i=1; AHgh+Ro48AVZwwcq1uMdTIE8hgjxQJWaAf9DO9pBRnM19dRUV9fAOMd1/CrFwCo7wstiIFrX4M6t7VjRPytU@vger.kernel.org
X-Gm-Message-State: AFuF++ko71kxLk8S35tL1WjHAOAYXvTZrvNPHyKCC5PBymosbsWNZWqp
	hyKKtpOD0xHQzwodI0UsyJ8fG5m8pvIiEziTy9ogt6Ke+jaS+5505zTwLzR1VOrIvYX/KKN7fqC
	+JiUxqLfQb4xFuuBh8qBbXzNbJCt8lT2IKyE0tlNN8trqi2tJ1uH+XudPGNlsAXXS
X-Gm-Gg: AR+sD13UJDe++AWFcFZZU9X4NfOJ9tlT7i97Yqa13+jI/+blug3azEaNfqCdLvPGKgn
	HhT/sVWeFLfxbsLFMjfdjZRPVjDfeEWqVhkruDXkzun/OHHzjCoidLXYxpLzltEkAotkX76jaRW
	x1bvTAUhVsNOh9uDop6f2QJhKcuiWIy5VGIaZsZRwQDwVGPyh96ZaCPLBPbcYd3kxIGDxAlkkwr
	u/GBAs0/+bqSBewiR51V9tBTVkKO1uCT4bsZpJ4Ptpxs8Kc0mL9BPlEq5/0D/XoisGGhyJnKgYY
	Z7P6e2taD3ADRo8Mt8nTgHNk5grZuEbyOkPm3Bk4QBu6aRCXObYov/0Ip0ncgc1VlpdjamiPk/Z
	eX0++n+1CPbhlRj1PUHRWyBh+TO6vun2I80RGHrE2gDcfg+A=
X-Received: by 2002:a05:6a21:730e:b0:3cc:92d9:80cb with SMTP id adf61e73a8af0-3cf83c17b2bmr6238662637.12.1787713191418;
        Tue, 25 Aug 2026 19:59:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:730e:b0:3cc:92d9:80cb with SMTP id adf61e73a8af0-3cf83c17b2bmr6238539637.12.1787713190851;
        Tue, 25 Aug 2026 19:59:50 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20036sm5222405c88.5.2026.08.25.19.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:59:50 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v10 0/5] Add QMP PCIe Multi-PHY support
Date: Tue, 25 Aug 2026 19:59:19 -0700
Message-Id: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIdWjmoC/yWM7QpAMBRAX0X3t9UslryKJLaL62O0IZJ3N/w8p
 865wKEldJAFF1jcydFsPEQ8DEB1lWmRkfYCBBeSpyJh7XhOmy1HMsM0ayy9lCxJY60Uilo2Gny
 6WGzo+L558bPb6h7V+r7gvh+IJU1HeQAAAA==
X-Change-ID: 20260825-glymur_linkmode_0826-584dcce2b6fd
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787713189; l=7214;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=rZHcXUpQLfOGoX2+9MvzzR5kJp0s7tU1P38XpiNjR6Q=;
 b=WSUJ1UMIBRSomGIUr7FGfQvW88zyL8Oq921Ni51+tTua8+qfI9Uq5xhZTwPKgPuq/EWttsdUd
 mUgAYyDnR9yBbfN5e2pWchn+g5bhZJJQSIU2p7fTJVR3Nu/N+PyGPbA
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: QS5_GDnlNxBx6Uazff_S_cVkBzyK5ezf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfX4JAyb7HSWuBv
 Y8msvDWsNSET1Nj3OY0WQs9FMbDe7lVM2F7CLMNNFglD+Xulvy07gCDQztved2fvxpQhrlN8RCx
 TFb24pJrqFhfm6zFkQ17MWzklprCUEVRiAOmvs8DJfX3G7dSo+4OslIWC/S4vlxUYHV4x/Lx6Sv
 LnjhQyDb93zDqTNhcm6+cc2rQLNWdWQeLdIQ4Qcl94WAmt3iIwKu0GzJQPFAiYCMI+zt+Ot1KSh
 tQ9tYvHQcTCu9hzBC/LdHE+DHo5UZOv1XM11mWk6/DvCyIX9HTd9CJXtp+ow4k5vXHqcpXHPk5V
 tPrDjaW6BO5xBk9NVTU+1AdXuSjCEsV11lsN/ugGj/U+jMv7+WfL/A1NxZJtZgyylHvt5qctUE1
 MpUIpWgeqMZI99kHDMkr+0htrrM1Sa4pvlmi7puGYGIBSHQXhZuzMsgndvWae0tIg1HTAQIXlCU
 FSaywBSomWmvde7I+Gw==
X-Authority-Analysis: v=2.4 cv=d8LFDxjE c=1 sm=1 tr=0 ts=6a8e56a8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qMU6Vhuv4BxmAn6ANj0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: QS5_GDnlNxBx6Uazff_S_cVkBzyK5ezf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfX87xtPMDufMQM
 fgBconA9528C+kecJwSxFHMbj2rgsi1o8/NGqJl5XrRflDVtD1uIBxgi8LKat7d0zZXoZjfySaC
 X3m+OILU27SMHVzUBMQ1v8AAi7+L/vY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260022

Hi all,

Some QMP PCIe PHY hardware blocks can be configured through a link-mode
register into different link topologies, such as a single wide link, or
multiple independent narrower links (e.g. x8 or x4+x4 mode on the Glymur
PCIe3 PHY).

Earlier revisions tried to extend the existing single-instance
phy-qcom-qmp-pcie.c driver to cover this hardware. That added a large
amount of conditional, multi-PHY logic to a driver whose data model
assumes one PHY per node.

This series adds a dedicated PHY provider driver,
phy-qcom-qmp-pcie-multiphy.c:

A single PHY provider node describes the shared hardware block. A new
"qcom,link-mode" property points at the TCSR syscon register that reports
the active topology; the driver reads it once at probe. #phy-cells = <1>
lets consumers pass a logical PHY index to obtain their sub-PHY. Match
data is indexed by link mode, and each link mode has its own array of
per-PHY config tables, so one shared provider exposes a different set of
logical PHYs depending on the active mode. The driver inherits the PHY
settings and link mode already programmed by firmware, so only the no-CSR
reset is used, and no PHY setting tables or related structures are
defined. Each sub-PHY owns its register regions and power domain, so in a
bifurcated mode the links are brought up, and powered independently.

The driver is implemented and validated on Glymur, and is intended to
be extensible to other multi-mode QMP PCIe PHYs.

Thanks,
Qiang

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Changes in v10:
- Drop patches 1-2 (dt-bindings, driver), already merged via the PHY tree.
- Fold in the defconfig patch (previously sent standalone) per Krzysztof's feedback.
- Link to v9: https://lore.kernel.org/all/20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com/

Changes in v9:
- Drop the redundant default PHY_QCOM_QMP and fix minor style nits in the driver (Vinod).
- Add reviewed-by tag.
- Link to v8: https://lore.kernel.org/all/20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com/

Changes in v8:
- driver: drop the always-true fixed_rate check, the impossible
  num_pipe_outputs < 0 fallback, and the unused pipe_clk_fixed field;
  collapse qmp_pcie_read_link_mode() to return regmap_read() directly.
- glymur.dtsi: use GIC_SPI instead of a literal 0 in pcie3a interrupt-map.
- Pick up Konrad's Reviewed-by on patches 2-5.
- Link to v7: https://lore.kernel.org/all/20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com/

Changes in v7:
- Pick up Mani's Reviewed-by (driver), Ack (binding) and Krzysztof's Reviewed-by (binding).
- binding: fix commit message to reference the actual filename.
- driver: rename Kconfig title to "Multi PHY" and driver to qcom-qmp-pcie-multiphy; PHY_INIT_COMPLETE_TIMEOUT -> _US;
- Print errno in error messages; reverse-xmas-tree probe locals; handle NULL power-domain with IS_ERR_OR_NULL()/-ENODATA.
- glymur.dtsi: reword subject to adding PCIe3 PHY and PCIe3a controller nodes; node -> pcie@1c10000; drop num-lanes; add pciclass to pcie3a_port0; fix 32-bit MEM range identity mapping.
- Link to v6: https://lore.kernel.org/all/20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com/

Changes in v6:
- Remove dependency description since it was merged
- Rename the binding to qcom,glymur-qmp-gen5x8-pcie-phy.yaml
- Drop redundant minItems on reg, clocks, power-domains, and resets
- Rename phy_a/phy_b reset-names and power-domain-names entries to port_a/port_b (port_a_nocsr/port_b_nocsr for the no-CSR resets) match reg-names.
- Add a description for #phy-cells explaining the sub-PHY index meaning.
- Drop the unused "pcie3_phy:" label from the binding example.
- Drop the year from the driver's copyright header.
- Fix a pm_runtime refcount imbalance on the qmp_pcie_pd_power_on() error path by switching to pm_runtime_resume_and_get().
- Split the DTS patch into a SoC-level patch and a board-level patch.
- Add two patches for Mahua, which only has PCIe3b wired up and no shared Gen5x8 PHY block.
- Link to v5: https://lore.kernel.org/all/20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com/

Changes in v5:
- Split the Glymur multi PHY binding out of the shared qcom,sc8280xp-qmp-pcie-phy.yaml into its own schema.
- Reworked phy-qcom-qmp-pcie-multiphy.c into a standalone driver instead of extending phy-qcom-qmp-pcie.c with conditional multi-PHYlogic.
- Dropped the "link mode value" cell from qcom,link-mode.
- Removed the QMP_PHY_SELECTOR_0/1 dt-bindings macros.
- Link to v4: https://lore.kernel.org/all/20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com/

Changes in v4:
- Replaced the static bifurcation probe model with a link-mode
  architecture: the active topology (x8 or x4+x4) is selected via a
  new "qcom,link-mode" DT property and written to a TCSR register at
  power-on. This replaces v3 patches 4 and 5 with four new patches
  (driver refactor, secondary PHY clock/reset lists, link-mode probe
  infrastructure, and Glymur config).
- Updated dt-bindings to describe "qcom,link-mode", #phy-cells = <1>,
  per-mode validation rules, and added a new header with
  QMP_PHY_SELECTOR_* and QMP_PCIE_GLYMUR_MODE_* macros.
- Patches 2 and 3 (multiple power-domains, multiple nocsr resets) are
  unchanged from v3.
- Link to v3: https://lore.kernel.org/r/20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com

Changes in v3:
- Add description of each power-domain.
- Add 64bit prefetchable memory range required by some EPs eg. AI100 ultra.
- Move PCIe3a after PCIe3b and move PCIe3a PHY before PCIe3b PHY.
- Link to v2: https://lore.kernel.org/all/20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com/

Changes in v2:
- Remove pd_list from qmp_pcie struct as it is not used in phy driver.
- align clk-names on "
- Link to v1: https://lore.kernel.org/all/20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Qiang Yu (5):
      arm64: dts: qcom: glymur: Add PCIe3 PHY and PCIe3a controller nodes
      arm64: dts: qcom: glymur-crd: Add PHY supplies for pcie3_phy
      arm64: dts: qcom: mahua: Replace pcie3a/pcie3_phy with dedicated pcie3b_phy
      arm64: dts: qcom: mahua-crd: Add PHY supplies for pcie3b_phy
      arm64: defconfig: Enable QMP PCIe Multi-PHY driver

 arch/arm64/boot/dts/qcom/glymur-crd.dts |   8 +
 arch/arm64/boot/dts/qcom/glymur.dtsi    | 336 +++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/mahua-crd.dts  |   5 +
 arch/arm64/boot/dts/qcom/mahua.dtsi     |  89 +++++++++
 arch/arm64/configs/defconfig            |   1 +
 5 files changed, 437 insertions(+), 2 deletions(-)
---
base-commit: a8406e6c0b793ce0788019683837c40855b55995
change-id: 20260825-glymur_linkmode_0826-584dcce2b6fd

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

