Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8B33CF1F2
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096284; cv=none; b=T98k2eHBbWucVW8duQWiGT2wmNhuzZok20M3GgxkOxHwpb1nIqpoDqA6HudCFgrCPl56BhHCnwxzt5OvRz3P+x8FZJBftkjI5hSWygIMIvunOYbjfoaSugohbppBdF5UKQZwRWkNd7t49iUsDuMhPW73HltHJc2ZnO7vp0skbtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096284; c=relaxed/simple;
	bh=fRskgt/l1zaOaCfvGYuKNUzaILMzSpnTzlyDqSFgiP8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T5GhOcOOx3uwWMWyWCf0mqVqtvUn7m0H9+zrHmQbwoEGGI8bTjkBSjBZ1bu9b0PJer3O1oSqAbr0VtSa4KZiVb9z3HOYnCb8rH1HYUwpsfgtPWKHq7nCpb8VWTpNrbJZuVjEBPGaeNH081bdvHhEYF3kXynMnPjGmlooEMQS2j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICmWro6w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPeOtcla; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICmWro6w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPeOtcla"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67781mQH3176962
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 09:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2KjfQByVGMlCxNzQZQ4Op5
	9mLqA2oFBeQLC5znzLbzU=; b=ICmWro6wE6OXhSQxIZE6k/JNm/1mU9jeaHq3DZ
	oWiMj6z0bpGpuMbX7QVPAN6snXMxw2/RDbIbT7dvuXqai//bp8X4widpLLesquym
	5+H7SCyPFydPzqPsrU/k273iyUrtPaLg53wlPw+ow3xh3nQayDUTv0+zalmTYNm5
	jRWBSh9+T49z7gQFH9QkGqFc6M1eXoIvdeSx372+MG/XPdAn0w/TaRp3rmghQ6Dy
	+5eExIQao5Bj11jLfpwprhj+joqx56m7WSUpvdpr9SmiWPP3mARlh2sYdZ//9Ywp
	ai2jUwmFE9Ao3h/qyfMXwQ+wV5IKiMT+dZhWsgP1YcXWUr2Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jk970-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 09:51:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so1771874b3a.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 02:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786096281; x=1786701081; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2KjfQByVGMlCxNzQZQ4Op59mLqA2oFBeQLC5znzLbzU=;
        b=PPeOtclaPs+PgIlb3tLxlzSlygzQBjwjvFvmiuvQaNQlcadM7J66FE4mS/SrVfI6rE
         MGYwhsIhD2GeinVHeshP12O3Hz6c+m+PLVUUhWCQhe429tTm1PA7IRYVTiqpfTl7eO5J
         M15MXzlspe7nGv9X1ickY+1JmPxyGLmNwD0ftOGhyT2m/Y6dOV2Zm9qI8R/io3jfQHJ3
         5tmq+nOlHr5Nl5ClXua3I+3YKTEgKrbfTdbuR9CdiHKIpIeBJldFSCN4wx/qnbwNcQoo
         MHl2bXnsq+5n2jhEXq4fTOyLF07FgukFW3ifENfd6Sc055Vagh/lZkLbpfqgq1uZsQ4M
         mXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786096281; x=1786701081;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2KjfQByVGMlCxNzQZQ4Op59mLqA2oFBeQLC5znzLbzU=;
        b=nO5+mmdx9uGQ8PBo8XDysS3kndVSz5NsApMuwBAbpjZcd32K6nSYECB9snl8uCQTFi
         z7zxqsSARtV+shvVn5MnJnkrNQ9mzKoMtewVghyZ3Yfe3rr5WdVyyfqcOe0dzIoqF4zM
         3IJli6yMMheZ8y+EilReaz5d2bHz1ghcokWkjMjLDOX3Z3yrYS3fPvYGWFXQ/1zUXU1t
         o/Mh862OqXIz1y7nyzWMS9pskAUHlySM387iNpJ9tf418C+Q+lzgasYbaFucwPCfF6Zl
         ITt5maoPpcLI+FdQ0QaHwO/dKZ1SwHU/3f/wbkhoMfoRuyleC3sXjZSP17OTXAzAQik2
         12Kw==
X-Forwarded-Encrypted: i=1; AHgh+Rrhl/s5wwDguUkEGjEer+Cs6TglGLUKBZsbn5rlbQ8ZomZe4TmkiFdYk93R0yupY5Ryw6FIetGpl2IE@vger.kernel.org
X-Gm-Message-State: AOJu0YxnivvY9eWHMJzBP0HoP2wJDMg2TrQvkXzHgZilS20pBrfSVPiM
	Zn9aiBOpaeU/SX4oxDzMOBU7gURMB015sEgmKiG+z08K4rCKTlzX2knc8v3MXO5ZSKb6+imXnGO
	2X0bafyAIFP5HjSIsKALNdlt+rNDn4p3p1H9C/wSd5zW0E+A840l61zvBu1tx88vX
X-Gm-Gg: AR+sD13SIlxo8z+DP6Eb3Xc7eqqEu3uII+I3f882cAZLvSqN7to7NTtAsi2bumCUb6C
	O5LQfOasppvHl+13VKYqHBMX6AkwLAbj3a0z/IJb6+kwWTs+X8Tp2P35gt4FaHehCNHIg9jPr2z
	Z4iHP0xC1K7+/10r49k7iF/J2klPhJGSzV8smEWkciHB4hVpqgCoGW886Oe0GEXe3HkmYvi4KQT
	hbRo9OcQHfgAV8xyNW0TgxlTMw5YVLk1D38oU2y5C+nwK2IURsfKAQwEzvRbvkKrfWnJ4Wx7cB4
	TLZvRLYNLHBbp1fKsY4Bdc8IodTi1NB9Y47A+XzWRoyjwtuU3LWtxtYvm0gErIjtHHCibRjX9jW
	iXfjujTqrv+AKQ3UuEAOlgDYrYELzbSdQRi4a2XuAYzVUsx4=
X-Received: by 2002:a05:6a00:4485:b0:848:52bf:4296 with SMTP id d2e1a72fcca58-84f41e3ade7mr15838820b3a.15.1786096280771;
        Fri, 07 Aug 2026 02:51:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:4485:b0:848:52bf:4296 with SMTP id d2e1a72fcca58-84f41e3ade7mr15838766b3a.15.1786096280234;
        Fri, 07 Aug 2026 02:51:20 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cad9dsm743785b3a.23.2026.08.07.02.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:51:19 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v9 0/6] Add QMP PCIe Multi-PHY support
Date: Fri, 07 Aug 2026 02:51:09 -0700
Message-Id: <20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI2qdWoC/yXM7QpAMBTG8VvR+UxtK4ZbkcQcHC+jDZHcu+Hj7
 6nnf4FFQ2gh9S4wuJOlWTskvgeqK3WLAdXOIJiIWMxk0I7ntJliJD1Mc43FN0ohq5CLiPOSg7s
 uBhs6vmyW/7Zb1aNa3xbc9wNkoVhAeAAAAA==
X-Change-ID: 20260807-glymur_linkmode_0807-727b512611a1
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
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786096278; l=7505;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=fRskgt/l1zaOaCfvGYuKNUzaILMzSpnTzlyDqSFgiP8=;
 b=yQfXVxmRqNN2Y2xwloF2df3ORdRYyw9biWggiVlF4jPLvZEHoqQlQmHyqCknPr8XneO4k/XuZ
 KruLy9sR9ZhAnHzsIzjXO5FmickY6DMnqpgdSy6DynnnZC3mHzBdCL3
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3NCBTYWx0ZWRfXxa1CapxKbJ44
 06XyOoDdVnj/u4d+NZD4vDoRoLiVwpI+H8EIo927uG5yefzHrwQYJ+BByQJ45aa1K5EgUflmM5d
 qt46P5fCS2w351aFv1qtrlZUZMawwayZeRJSrjFwyTDiHs7RR74D8e3vP2n2W1hpi1Wf7AxBISm
 WreX7Xn0FhYbsFigdqAr/lPVORG1cYuZchQyzn+Zk83N0zVUxtjIJuYKynjn5opCvKWtEnSLsUd
 HIgzs9ROd7RwEzl9ejZ4eDI0CgpU1DA8QtHHOhR4UVy8yYDqwzg6EUsndScWL9tCwOm1QPdy9hn
 UCGwjuGnsj0uKRabCUStcqcwmSyP517veVScGRd5PhURnWuiMrBazlmBH715Mkwdn1rf6uM1Otu
 R0Qu7paYN2sMoFDf/5F0ioxN4SONrvGwp2Gm8EC2cXDa2lg14N8o9wPzSo+LGyF5VE9f0/lPYm6
 IsfDaXCFcqRGIu56DHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3NCBTYWx0ZWRfX5ttnTLyMuv6W
 DVCDbV4xBejLjeFPMp+nS43mQIMCcTfanLe1CzWohRYXcuLOUyOC4yorWbD35pTgU8HYFJf465D
 ZDK2gQm0a0Z1eO7iniphqHba3/4T8ns=
X-Proofpoint-ORIG-GUID: 8Mpo-56P8zOq25olJlCCFbmsBEZ9KqJz
X-Proofpoint-GUID: 8Mpo-56P8zOq25olJlCCFbmsBEZ9KqJz
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a75aa99 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=JfrnYn6hAAAA:8
 a=qMU6Vhuv4BxmAn6ANj0A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070074

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
Qiang Yu (6):
      dt-bindings: phy: qcom: Add Glymur QMP PCIe multiple link-mode PHY
      phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
      arm64: dts: qcom: glymur: Add PCIe3 PHY and PCIe3a controller nodes
      arm64: dts: qcom: glymur-crd: Add PHY supplies for pcie3_phy
      arm64: dts: qcom: mahua: Replace pcie3a/pcie3_phy with dedicated pcie3b_phy
      arm64: dts: qcom: mahua-crd: Add PHY supplies for pcie3b_phy

 .../phy/qcom,glymur-qmp-gen5x8-pcie-phy.yaml       | 177 +++++
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |   8 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 336 +++++++++-
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |   5 +
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  89 +++
 drivers/phy/qualcomm/Kconfig                       |  10 +
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c  | 743 +++++++++++++++++++++
 8 files changed, 1367 insertions(+), 2 deletions(-)
---
base-commit: ea2bff00da89d7767d677bb68470130ba96f4928
change-id: 20260807-glymur_linkmode_0807-727b512611a1

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

