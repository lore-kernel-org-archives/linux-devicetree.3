Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FFC3E7152
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282327; cv=none; b=HgVnJ13MW6nQvc7QGp/BBFsmCIe0pmhvdixqmUDs3sExBoyCpvEotiaLMIlaRmxpWdxg0Vyey8XkJ/jzMU41ETkuEmKS7jGWQbJCx8CU3ZTzqVkQ/+eoUhJ2KYuawz4lA12HdW/3zbURmyN/orziZuQGHlOTYbteOPUCmIwA3Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282327; c=relaxed/simple;
	bh=9FeTXPQw+cQm9ysf+FsJrEpss3asU8i8cBWSUkWk0wM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qeEIX2MJWcGaZZgatv5FG7djDVX7LhxVOlao6o0ILASCcEh3BxpiSsxFSa95dBV/vLbwC1YKyBXLc54diKA2HqV4bypnXnMQDOpD8IPFBYAwnzrS5BzG8Ijb+7omdpnZDqG4pZ7c734seLQgtenP4m6DUxuTtMkiOCmQrW+BocM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f91NlvzW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFbNpbjR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f91NlvzW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFbNpbjR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cHj72098532
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8k0JwyDVq9pQhEGw3nEGQr
	d1JhB0VfPP1D53y+nXTNQ=; b=f91NlvzW7TLjlhV49ikl7QWEaHtp+dj5r7CFp9
	0mneO7MIRHAOIBZ8/jUbPp86zCElnfBo+2zKMP4drtBsGF23/zVl0Nbc4EMe0Y1d
	0P8a1IMVCZVWVNOjgqdYG++sHmNLJ3MTWJ+q/Gg/vvEjy3tDQpHwnkHszhBnbNcI
	pDnPS3pAlQM0jVFh4lJNzKThd0CrvzJgVX0d9dzctlZXGUi2rJNuNV316HnZDQjr
	gmoRdp7AJAUyVlocBZ0/zC6U0Zb4z/MLn6Z8L9XoGkFlF/TG9HtIELPzjRtj1d7X
	557uSJiufWzV2odQ2P65kQvBlW7OsrIhjkjsFgiNmG35lYKg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6k5p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:58:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so6126999a91.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 02:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282320; x=1784887120; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8k0JwyDVq9pQhEGw3nEGQrd1JhB0VfPP1D53y+nXTNQ=;
        b=KFbNpbjRkGNCP5c9z9tYDNvse9A3gFliIeECOOnK3X68oPCW8B/fvTyGn7jbR+L7vL
         1PavoicvoID6cAgQ4Cut5LmKLyqu0Y/yUxAxqjtMCIEFPJ0MRQZBS3AhvFlkMgG8942c
         v6XMtu+8vdON0sBgFkkhWaW0XgwV+ZSPEzkjlQvlmcUAaNpa4Y/Le/HfPb33mPnIuJ1+
         zY1fcgSss+MnI5yFQWBosrMpcba7pSbSgHDgaik5WV63Ivbrbpf44cYkaXBS8xe5e4hr
         QmZCfb0J2N5GqN819P+kYFgx91c0akZGL/rdDdsBBRsp8U2QNgRHfxLTIEXm2KGe7Tyt
         JR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282320; x=1784887120;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8k0JwyDVq9pQhEGw3nEGQrd1JhB0VfPP1D53y+nXTNQ=;
        b=tLIrua2uIk+DfyR1SaihPHxyD4widQXAJNIk8bfSmUgaZmFK6VQ2g/YhQysIOlOtM/
         p9esUxp8RvZNJlBjJlgzHjfyVLksUp4OTwLZJl1sTSTqmGNxGpc/sF3lFFfLGzYmYeZb
         Mom3ZJpXvHskMhh3PTJk+O82jK6ooB+GL7gQs675rxonPzHCXTLCnJRpNBk6sYVTpv40
         iOb0NJotxKxai1IvcUhdQLyjkqwZEq8DmlLKeEPS+fPKfS8HmAS7zZ5V47Lib7ohoavG
         AL31/z3Jbxe7aHRBIKVb62uaTaoL/lPtrEeRqcCLqPKlvhRZ0LjgSv0wkZp/2ZhcWQLo
         kW3g==
X-Forwarded-Encrypted: i=1; AHgh+RpKRneTZQdcyQTmkEqMhvkNbbFQrioQats2vmcOQvPpPvoVdyK2Mbkl9h0OLcJhddOkCSS9HICh/rpJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwAaGGbOCurmQfRJCO7HgmxYTcWbysADw/ofYXANTlR9DpyRZqP
	H9qtMj3OOR35xb3kcmzhcuEFBQm9o+b5qAHSapr4waUFmJI4yrIvjJop6gO6J/Rd1Y4mrhRhUst
	/5e7SRvJ4fCXo9SYGMgXSduMuEQF2DimyhpNl+llZGVvZ9E2I/Mx4so2OH9os4bpV
X-Gm-Gg: AfdE7cllDoWxSQeAAiJZg5Tm6e/rRcWSly+hKJGxHf9o8bxEAQkl0McYPv3PNZG32Qo
	pozDP1bRbEJjEBUxGljmCFC5qoQHyB0kUSKhC0DxwA+EQCnsq6amtbF9WzTc9SiRJa1pdRpeieL
	cxKTV/xm8SJbfd4XTzyTUuzvZtVWe4sPqel+tif2OVAaKUHVqkR7QRtY7/A+hv9Uds1pXo6EPF2
	YTQxKhpLGL44PQc0QUW/Ew5RJYsu76KbUC5O7r8En/quETD5qVYaFLWKy87YtKcLXRpB/Cx0Gjc
	bAEJ0X+syCP0qwUZ/K8Q/RH9r/E32smBpSmRhDz5Any6kxg4Aa6eOu/6eMDsAz+BfKo1APVONSj
	uo+ZLfwW4DaV4JX2lFw5DMBimDYLF9WxRL0pn5BFMhRQ8AVU=
X-Received: by 2002:a17:90b:1a90:b0:37f:9cdf:f0af with SMTP id 98e67ed59e1d1-38e4b5627f8mr1625501a91.30.1784282320311;
        Fri, 17 Jul 2026 02:58:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1a90:b0:37f:9cdf:f0af with SMTP id 98e67ed59e1d1-38e4b5627f8mr1625479a91.30.1784282319784;
        Fri, 17 Jul 2026 02:58:39 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a02b7f2sm5586375eec.13.2026.07.17.02.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:58:38 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v5 0/3] Add QMP PCIe multiple link-mode PHY support
Date: Fri, 17 Jul 2026 02:58:32 -0700
Message-Id: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMj8WWoC/yXM7QpAMBTG8VvR+Ww1aia3Imnm4HgZbYjk3g0ff
 089/wscWkIHWXCBxZ0czcZDhAHoTpkWGdXeEPM44TJKWDue02bLkcwwzTWWfpRMclS64akSWoC
 /LhYbOr5sXvx2W9WjXt8W3PcD/yFkLHgAAAA=
X-Change-ID: 20260716-glymur_linkmode_0717-70eacf08a5c5
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784282318; l=4954;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=9FeTXPQw+cQm9ysf+FsJrEpss3asU8i8cBWSUkWk0wM=;
 b=+Ap6TS7LJgX+5IelteLmIEpAzkNnSpPY5SsEbl87UBdtcznLcX1XlkXmtndQHcqKug8aOsv/w
 CC6OMcJB0WWDnlYn5tJQX1+7qDZ1QJ0Z3kYxLAKHSWQ4VBoqdpzE6eB
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfX5L9iA2aYX79Y
 rrTJlbevN5HpgIj+zwTKQ4csh023pm5zb36+zU4WXY5L3qqkSg4iCuNc2p3I8QP3UUhSlQREbVm
 GwFKhX5k3a2BNduU4ONnhuvHxSan62qH5D+lE1K8EMtvrkWclaFsEJNZcfzy5InVHTBfCpCeLHb
 Zn2DrmzJDM7NkLS6DTx3jp/1iuRHkYCNEWDt5pquHNNDUmf81BY7XsYA7PID3IzqRuV4HRrkgDM
 CfHNfO0dlp/BVCwd4kxnk6Xx+CKdCDDAyun3DeLg9ktKlH3VSQgF1FHtDlwoGYhlb3Vj+OmR2Va
 SE3d5x5lD5fhga2Kz3XgW27xqZtn5T0oMko1mXfHJssLiV9CXyc2IaBHEOeBGraTDggZ7dx6AJ6
 WaZZjtCtywxF4hKDT5Obil1vqz0zdldw1E3PZiGiJb0R4bqquMNxsKaj2yH3+r72ukGK5JX1vFg
 6E5qd4SDFTZt5eTRzRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfX0Q3dkprkWLQK
 MgQZ+db+5/OhTcYJruH9GyaD11pZSobtAuxLj/JxX4DbWUzhOfSj4+NompPDSfsVR5rOvmOXuVJ
 pVphHExAiDPP1pZJBMmwTPlKChYnpnY=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59fcd1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=JfrnYn6hAAAA:8
 a=uHxzPtsY3S2Ib2_9k84A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: j2HPysqXW13lDs0fe1he_Zlsw66UsOoN
X-Proofpoint-ORIG-GUID: j2HPysqXW13lDs0fe1he_Zlsw66UsOoN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170099

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
settings and link mode already programmed by UEFI, so only the no-CSR
reset is used, and no PHY setting tables or related structures are
defined. Each sub-PHY owns its register regions and power domain, so in a
bifurcated mode the links are brought up, and powered independently.

The driver is implemented and validated on Glymur, and is intended to
be extensible to other multi-mode QMP PCIe PHYs.

This series depends on a prerequisite patch by Krzysztof Kozlowski:
https://lore.kernel.org/r/20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com

Thanks,
Qiang

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
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

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Qiang Yu (3):
      dt-bindings: phy: qcom: Add Glymur QMP PCIe multiple link-mode PHY
      phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
      arm64: dts: qcom: glymur: Wire PCIe3a/3b to shared Gen5x8 PHY

 .../phy/qcom,glymur-qmp-pcie-multiphy.yaml         | 176 +++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |   8 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 336 ++++++++-
 drivers/phy/qualcomm/Kconfig                       |  11 +
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c  | 770 +++++++++++++++++++++
 6 files changed, 1300 insertions(+), 2 deletions(-)
---
base-commit: 59ccadbf59aedee486fce5b4a5486a07c3f4b5d3
change-id: 20260716-glymur_linkmode_0717-70eacf08a5c5

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

