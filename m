Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560541A23A4
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 01:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536804; cv=none; b=qO2q+saF7xssQAa5ZN1UXT5uP0N77z4VohVlyC6LPdrhzkZq1kprgMVpPUDDq5qqeCD6rGmrVwYo2jPlkTVZZX779K3+1zOSngRiqSI+nR+uZtHyDNZQ5w3mYVYv4vwWspO0A8qYxgwqsHiq9LlCFdnypt8g8XUXNlEoAAGiHX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536804; c=relaxed/simple;
	bh=uTCKAOimS1e3IAJT8RyhpxQQI0cr7ZclI5yzTrMleqQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gGr7AIbtypgGNQAY7rHZlMnpCfLoII5O9/Y6RHa5ofavus+6RYoGcxFNTHyqc6fF4bl6MnYSqYKYydgUZsxmdMSZrVf1OkpBtgV6mjRFo0j6/Bk2lOSaHkcE29w8Z1VtIswG5xXYsWmrRcT2Tj9Ph99WEJnfbJ1Q99dEn4lVro8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fo1ujcOa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iaaXdt8C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fo1ujcOa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iaaXdt8C"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653Hw9cJ3234874
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 01:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=17PcoNEeNo90Qm4iX3hBk8
	teNDLcrwWXo6ltz+wsj7M=; b=fo1ujcOalTQDpF/eq2+Z0Z52zTm9Xp44jCswuP
	k/SRSAMzpmot8VcqFC0yEXonuqkiUqsSLctpV6yHSTWWGTtGDRfY/XrIWR8tLbG7
	dIpeOwtQbHx9pkBnYAN14yf10t2fU+WiCI9ou2+PS4SXP191cutfqrUOsgODrMRw
	7bFmXu0MoHte303a6Icj6WD4gSxrHbCMcnKaOz6wvb5wav+OfEDIZUj32Z12s5QA
	qg6pq9WJo2ccFzQA7f7tm2MVtz6YETti/AUIaXqAaKbXqFqCW2CtLVH7k8D7SlfJ
	IwF3bCgdgIt2FJc1YFa+mqcFprE0HuRQ0mby3leqF8la+cyQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s1fep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 01:33:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304df51ff3eso124973eec.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 18:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536801; x=1781141601; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=17PcoNEeNo90Qm4iX3hBk8teNDLcrwWXo6ltz+wsj7M=;
        b=iaaXdt8CsJZlAml85UCUs25eghlyI5TWfaAnIfH5FFi1C/+Bo+c9aRKIm4wPjH+CbC
         PZs4ZBWLT9HWE0dcQmTLaR5DpYIKkZYiCSiJK0CNxcfnN5lBBXBriNCqE+viuML2eKTw
         mF8fDh0e0TYtozltQ3nRrB2JQ2S1zPNZaeVSJziRO23zwF/eOFB3m6RrVh2LaHg9CKCC
         fKaI9ix/1PU97M/oytb1vvyqwabt+8Ym7fnhyGsffxSh1vtxmugvcGrTsaYK4ntkmYzM
         cUTF1CI9C/Zg4mTPvvxNvbvdFpS+afJ0UmdRw/yC8Ru0LOdmWj2hQ0XEqOXzpbnZ6VNp
         QxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536801; x=1781141601;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17PcoNEeNo90Qm4iX3hBk8teNDLcrwWXo6ltz+wsj7M=;
        b=hdEJj9faGwGF9bjDEPjJdpitmvsiJTEHmXSpGf4BEYnL1ZirRye5Z3fRdWZAKBSk9P
         xtNuX6bddeWV2IGfN2NYZQs+NF+XzUIkvb/uSAg6ZsDu5ewy4X7RElvXD+FUCQ3U0Wa9
         sKT6SlFlbTIXbBBuwUYHT4yGgHLKR4e4NfXo2Fr0KTE3I9oSNlMZls7szcBwpfGqz2Al
         zEhes0tbZGglq27UqYdHegpwTECSQ3e3egvlFQZfsURWPBvqCnlKMturYJGRVioUJ8wC
         IP42ErA7F/rUXwA4G+c3noqleD2gkeqZsajMKdogwLK1DjVikcGeIh4xuJ+Yy8SbItxv
         T88w==
X-Forwarded-Encrypted: i=1; AFNElJ8uIgZvB+XSIUAl0DwnPjo/yhAWxRESyUZ9pzve7Gzow6oRKP8qfumhZDSGvDU7tG382VCEeLQDJtgi@vger.kernel.org
X-Gm-Message-State: AOJu0YybGX3QenDvn5VJSeNX1bANjBDf1DoqoTUDy3L+hljOOMsBZ59/
	AT+9SrdrIBmj2sDfFWtbGFHoV1Dx3VzgXxlqovjs07OF3Z0WjI/qpWIaD/LjuTOcyFSPfaZKfE3
	2d00dmlef5nqUFTpSNzo9Gk9Rg67sydJLf0ZAW50E929NaKMrOwPfseN4pepEjwpv
X-Gm-Gg: Acq92OFxgnoJ/Tbtxr4qn0s5OYlWfGl1e2EVG9L/nniVqk20LpXDGU24x0wkhZoT8EQ
	3jl7lOBK0vB4gz6uKgAlGnCHVa7kkrd6t11SM8SWJPKglNiCbqIqm+Ben3xIRYYQtJHXgOhp4K0
	1n6gsHVkxdpHqC94lA08PUMtAsEVIYmshE4bmPVJMj8KWKiuxqRM8xr9crqrnsa3xnXjHjYLtKb
	LAUW3/3ISRAezMd30Xi/Qf+y5HSTS87ndNG5hsRE1QfjUP+SMbOD4VfVQLYdCZkiTHgH1dIQhKK
	FyZxk+uQ6JRiQgg+5iR+lYwVHqv91T+iclfLnIA/RiBddfJqNY/fMDPowZEMJOXw1eIVTg9awNN
	0OyUeWRUBKmxIiZ6KO4AtG55AfsY8Iwz6kjuNT+4KTZmS+TxjLxgayKaSOB8+yFoQeMPbjA==
X-Received: by 2002:a05:7022:1b0c:b0:134:fea9:f107 with SMTP id a92af1059eb24-137f6bd09camr2140775c88.33.1780536801107;
        Wed, 03 Jun 2026 18:33:21 -0700 (PDT)
X-Received: by 2002:a05:7022:1b0c:b0:134:fea9:f107 with SMTP id a92af1059eb24-137f6bd09camr2140762c88.33.1780536800527;
        Wed, 03 Jun 2026 18:33:20 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:18 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Subject: [PATCH v2 00/10] phy: qcom: qmp-pcie: Add PCIe PHY support for
 Hawi
Date: Thu, 04 Jun 2026 01:32:54 +0000
Message-Id: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMbVIGoC/12Nyw6CMBREf4XctSV9AIIr/8OwgHqx1wjFFlBC+
 HcLxo2bSU4yc2YBj47QwylawOFEnmwXQB4i0KbqbsjoGhgklxlPecZM9SLWm5n1mpDJXBVK1Yk
 QCiFseocNvXffpfyyH+s76mGTbA1DfrBu3g8nsfV+7vzPPQnGmVTHOi8SlapGn6338XOsHtq2b
 RwCynVdP5LDLqfDAAAA
X-Change-ID: 20260506-hawi-phy-pcie-283933b4113e
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=3318;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=uTCKAOimS1e3IAJT8RyhpxQQI0cr7ZclI5yzTrMleqQ=;
 b=y8pI9fhwl74kPeC+ouRPoY00C4rw66ueKur/P9ExNw3XdUoF/+dyqbO4Mq2iOdXplm/hJMmew
 2zXpR44WGJVBSah8G000oG3ontyhBmI9upH8Oq2K7z/WTmYnhlxZlN3
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-ORIG-GUID: RRsCWqKJs_U7QdihIzpcNrtZjAjBgBC2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfX62Ss1mvQh9Ya
 kIUawV7EyHdvn240eVSnvX16Ud8t0PRCJCrVVhOgB6QwqcjsmDugVnuoiXmV5Sx0WlAYdWWgBxM
 lxDtaCM+0NFNmh2Jxk8kLWfjeH/llK8u/OS15kQ+ZjF0tT7JwJ9E58iqRPlVvJalaO5yXmtEDXa
 098JK/IxaGPmaZ5v31xulvf2gFVjIIZxh/bK9wzAS4OKEfCVzgiLaLB9zqM44dncR8wZPvA45x9
 D+p+/Z7Cr79S6UgSaQgicz4bTzab5RipM+VxIjzImI+Z7DSuCuSZvdN+vS4/GtptKzpcLiCLVpW
 2WZ9zmR4261bU9SPmgo4XwK5uLkIDn1anozjeMBmqwqhhLqyUhtaLP2zNDqsgaVolcHCFuoQgN+
 lNI5zC0czNhJJECoQMg8Gu16Nk6b0Ev/LKVgYCeHfP+AnOWQoskYJUb5WXNBHg3VhLPowep4JQf
 JM14VQX9gOT0xywu4OA==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a20d5e2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8
 a=JfrnYn6hAAAA:8 a=lrmUyyXwqMAXkeg-CF8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: RRsCWqKJs_U7QdihIzpcNrtZjAjBgBC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040012

This series adds QMP PCIe PHY support for the Qualcomm Hawi SoC. The Hawi
platform features two PCIe PHY configurations: Gen3 x2 and Gen4 x1.

The Gen3 x2 PHY uses v10 register definitions, while the Gen4 x1 PHY uses
v10.60 register definitions.

The series adds:
- device tree bindings (patch 1)
- v10 register offset headers (patches 2-5)
- v10.60 register offset headers (patches 6-9)
- driver support with PHY initialization tables for both configurations
  (patch 10)

Overlap:
The series has overlap with "phy: qcom: Introduce USB support for Hawi"
by Ronak Raheja (see link [1]). Both patch series introduce a subset of
v10 registers (this series for PCIe and Ronak's for USB). I have
coordinated with Ronak regarding the overlap, and we can update the
series to resolve any overlap based on the order of merging.

Link: https://lore.kernel.org/all/20260508213234.4643-1-ronak.raheja@oss.qualcomm.com/ [1]

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
Changes in v2:
- Rebased onto v7.1-rc6
- Patch 1: no change (Reviewed-by carried forward)
- Patch 9: rename QPHY_PCIE_V10_60_PCS_PCS_TX_RX_CONFIG to
  QPHY_PCIE_V10_60_PCS_TX_RX_CONFIG to be consistent with the
  naming convention used in previous pcs-pcie headers
- Patch 10: update usage of renamed macro
- Link to v1: https://patch.msgid.link/20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Matthew Leung (10):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Hawi compatibles
      phy: qcom-qmp: qserdes-com: Add v10 register offsets
      phy: qcom-qmp: qserdes-txrx: Add v10 register offsets
      phy: qcom-qmp: pcs: Add v10 register offsets
      phy: qcom-qmp: pcs-pcie: Add v10 register offsets
      phy: qcom-qmp: qserdes-com: Add v10.60 register offsets
      phy: qcom-qmp: qserdes-txrx: Add v10.60 register offsets
      phy: qcom-qmp: pcs: Add v10.60 register offsets
      phy: qcom-qmp: pcs-pcie: Add v10.60 register offsets
      phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Hawi

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 382 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h   |  18 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h    |  26 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h        |  22 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h     |  23 ++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h    |  49 +++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h |  55 +++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h   |  47 +++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h    | 109 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  10 +
 11 files changed, 747 insertions(+)
---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260506-hawi-phy-pcie-283933b4113e

Best regards,
--  
Matthew Leung <matthew.leung@oss.qualcomm.com>

