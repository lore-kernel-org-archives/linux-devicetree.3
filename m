Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B876370AD5
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887307; cv=none; b=cPk8dHY2yJq0thYn0265sDs2xK8oG2csbtwzLEcFkOi1b4y2dIjz5fcKOJv8qDBZE1gnFtor1/ph4Zt5kOUAN4NBhVYUrn9f9AnWgFRMVv1uFMR077WTUjr4fgBIvZhqM66twOBLYzLetTQOyJ7mdbXw+UhGvbqMm7vgOn8PlxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887307; c=relaxed/simple;
	bh=Ws+/V9u2biizU4r4uBqT7Test8WqYB3ENS4IQxXb+KU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KvVlbFgN9yiLSVK+VXM1slxVOS8cDleTgQvzUXZsuzNgr9EBsOoS7qjWvKRPcw4qZfDDUqi9asNkU2UIERLGuqICr/CqjtvtKFcy/wV7e5Vb3PJkGR77rNr0lxH8vLD55DkNxX0oHNuE4DonQn1RrI5y2EFvpolcZ0g+jihhLHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enJuLXUD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E9ClueP4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enJuLXUD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E9ClueP4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lYmp2099161
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/2JQ099oQdzraMS/tGsy/5
	kEGHTpxIWzBEXjEGB/ewU=; b=enJuLXUDA+a0f+eg/tB18/mQUm1MOPJhOg9ykp
	2+3luCO9GjG+eyJ/ILb6JBoZiFTpBf9iFmP43cR8rJKOVm4/QUvoPSmJyoKiZd1J
	mce80LmoEnqdG9Svgx//S0W7tudzSOFR10OjX77qXD4C0SMOrj3HdjHCQqw1DxdN
	j6fRz5027DgOqNEsICBI6iZ/hzqUfJIaoo08fBOC8aDXsEGslbXC1sEi0XtVvloQ
	nhSQs4vKCKEhPrqcUPD2K3KaIbGctF1JmZhctkbFqaPOv/Ev/W1cSrtMyi5KyJsp
	niqDxfBzDPSWPxqxoOcsP2q6OtYk7+iLlKObGi0dNYgnrqEA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahte2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:01:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e1da97175so403375b3a.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887303; x=1785492103; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/2JQ099oQdzraMS/tGsy/5kEGHTpxIWzBEXjEGB/ewU=;
        b=E9ClueP4Ty0EqvZiY/UInAULcGZkJCpcOh0PCizoZdm7xrsu2dJ3G+W7EuHS22wizR
         it0z/KAqfpI5ASRQ4rH44cFjkB1YyOKeqVpZu40czcnXH0mECa2Wd2QNF9Wo3ax0Qz4P
         sVp835VU7ApDU54J8os9avxYsrU6dR14ufHV7wh/iNPV/GV+LcMivJnv36Fi+IrsT7jJ
         p0yD5mQXQtur73AfTNndkZLLa/InTNnWnWq33pkxfNamcTRjkDAkSdDCK0V5PbvJfGiS
         LGx4zOuNFxApF/bj/FAN0EowEqNqN4EesuilXb1pYKCfv6//0nrxi/mbHpZHHl5ME6iz
         Hq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887303; x=1785492103;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/2JQ099oQdzraMS/tGsy/5kEGHTpxIWzBEXjEGB/ewU=;
        b=aSZ6Pp5aMY9GVFxiQwIZRBsSPQiWA1qQdbu7tXK11kE/AMqXJvUVb8+FSX0E6JtQt+
         XoU5AdyRcmMKjM5W68Uv/KaWUREClazm08SZhn7fPdLXEsLY/ZE+Co1Y7THECLqjcb6/
         PR9UmY+U81EYUQOj3fCk6zB1PYKKw+sBv62avTDwULiOiS5PbCjf/vSnGkWZRR7/Wckb
         BvsUxwxnt9QiHgktxK8ltGkNLAsoDxr3C0meKrnl4eccpDXRzps5NQRDsuVfbAn3Gfgr
         lonq7jNNfnPpndn7fRzGILeZmT1/FN8MIPsLD5p/57SE6pINH8LgoaLan8QsRTLqzrUv
         ruRg==
X-Forwarded-Encrypted: i=1; AHgh+Rrv/MJ1DwU8fnIxgwhmXJV9uFU+0ObqfrM/Q6KaYOUOOSLltrto8hkDKy43PU7I5jqbRe8QnBGFETg8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5A0MxOyMHtFcrErStPjMLSD15r6BerGIhSPNqnk1mdiIr/C5q
	ndJ7c3YK2GU9v9EC/6EYrTMGh99BDO/LbfbWhrpJr4FkcyfyafkVUycjhmfVDIq0X4QHYGf+J44
	yHFa508DkfK4r6XXpMUN/wnlEkIgxXsyRwY9dBp8+FmibwWM2mdjj3uD1P7TRlzAWF2766nvJ82
	Q=
X-Gm-Gg: AR+sD11EzrzMKnNWnUounU9BVcAEaO4mm7pZgZROe/8eIHxWg9fh+WUj6ERDc43Zl1+
	C3sYdHizE6UYEx3iVsYTGtxyzps5ucBa1a6j2owFRc5V6xRVSol9w3jKzI8378LFg6wyUYFVIBF
	J8imwGjbNexK+0zSXjE7DDnMXzNqdpum9ZqZ736Tw018YNX9adUc5YNokEwjRNuIGwHY4zsnC6x
	owMjNyRt8KG9B6QnZ7bFn4RuGzZbxLsZv94OnXHS8lEjUXCAdvc3/x1EvxGYJ79ZTdVmsGGHIAA
	7br1jeUwwZcd3dAlp3dW5ODCYtZZ4yyHK9x2R7C5Ab6xzUSVr2hEzoPZU97zmheLTedsDkvpIW2
	bmSHJHd0jVLNf68RYqc+lvhSa8vpd+sBr5eoSPeNKUivUgMY=
X-Received: by 2002:a05:6a20:c78f:b0:3c0:9c19:65b1 with SMTP id adf61e73a8af0-3c44b28fa1emr7787060637.73.1784887302730;
        Fri, 24 Jul 2026 03:01:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:c78f:b0:3c0:9c19:65b1 with SMTP id adf61e73a8af0-3c44b28fa1emr7787026637.73.1784887302279;
        Fri, 24 Jul 2026 03:01:42 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c9289sm29515427eec.29.2026.07.24.03.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:01:41 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v7 0/6] Add QMP PCIe Multi-PHY support
Date: Fri, 24 Jul 2026 03:01:18 -0700
Message-Id: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO43Y2oC/yXMWw5AMBCF4a3IPGsidUttRUSowbiUtAiR7l3x+
 J3k/DcY1IQGMu8GjQcZWpRD6nsg+0p1yKhxBh7wJEh5xLrpmnddTqTGeWmw/EYM40TIsI1FJcB
 dV40tnV82L36bvR5Qbm8LrH0AjAfIingAAAA=
X-Change-ID: 20260724-glymur_linkmode_0724-e3569c3f59a9
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784887301; l=6821;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Ws+/V9u2biizU4r4uBqT7Test8WqYB3ENS4IQxXb+KU=;
 b=tur3EG17CjJaE7HCArVUygrz7CgvfFeiQZum5ubJQfQyoZ1M5G8qttHZyzJgbfPvrtV+AmhBx
 eCf6Uble7nICirfFK2CRkYaa5S/pZIU6UxgamyMsVcjqRDcfFUxp+XB
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfX99+aQSuo47gd
 bO2UV1uEWEtFEOKQmoz341+OtjGKFUkePzCUj0muRPkzQsrktQQzbUyel26FBXx0Gd3le6bXksi
 /8tQsD8QctEIHCAHn0kY6D4IQJP2f5E=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a633807 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=JfrnYn6hAAAA:8
 a=aO0DoCCV54Ih_QmUJo8A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: oPk64EfQflT4fAC9KVUCukynRL2rYyrX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfX5NPDQeaOnohO
 eBpAn42fz3bwJXgyko7vEicun75QMRDeKGHoWGvhswh7GIX+Wb1aQTwxbCNctXsmeM5paFNr4Gr
 o2+630/03KJH9stS5wd/U3Qh9Oxlg+jbbFpN6dzqHFafcFEhH3E/2gyvZJ/4Pm7rTuZ2mX/x0Pi
 7rD45o0KToJwaBwshGL/hljp7DfEA/beobnBEu54CobppvsZMJsFvdIVbNbRXr9tFj58rhJgvth
 SWkDKrfCotuQ95gEohjRPJTvzH7MTlc463tstl+m2wTLoOALiuj2UfNAgHAxVzvNrSQ9MWQhGda
 QVWy+bQ6k/w/RcLgan+fSqtj1M1dbLcCg/IR4Leh3AYNumxAGRi39spfkzy5YeW9hTU4MYhoedk
 3lBF5fePl10+Ay26pNVItQBnwbZ/u5vB/vpn535eRJhKb0tv3B4ekB5xW6WdibEMBCQgbZYZOYS
 5R2L1h11TGd8aNPlMpg==
X-Proofpoint-ORIG-GUID: oPk64EfQflT4fAC9KVUCukynRL2rYyrX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240091

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

Thanks,
Qiang

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
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
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 336 ++++++++-
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |   5 +
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  89 +++
 drivers/phy/qualcomm/Kconfig                       |  11 +
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c  | 754 +++++++++++++++++++++
 8 files changed, 1379 insertions(+), 2 deletions(-)
---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20260724-glymur_linkmode_0724-e3569c3f59a9

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

