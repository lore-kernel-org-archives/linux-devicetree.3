Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE0A2DA75C
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283086; cv=none; b=oqzU37QbOtbABRVpmhvpYQkWE43MM1t7t8m49laP7ewgGwerCWq4QVB8l3fWY4j/F/DRPi/JiYD7/iX6TB/y3vMk63LQz0nt4Jkz31jE+SlhxlAJn6vZOz1i3/xuNTsT62j2J98Wzsx7K49o12JJG2g+Ay6I7aXJ1shI5xL7UFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283086; c=relaxed/simple;
	bh=FpOZVILuZdKgJAFxsw9h/rPIUNFgYb8dRtvt8QqP9Z0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fZd71M4hHdoCxQoXw8MHh/BBHpOIQLz4ht077T6qwmM+XGcQYeqKRWXv4+vG0z7aeDdXqyVF9555v6CrpfVgkVDcIP6NNL9Q0oqDVcFWs+semVHhChQwCgDUWPyD28jCjv3ER3rGOWsk6AT1Xw75VJQEHWIrzvbQBSzg1mfaMOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MgO4mjZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5SFyknb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MgO4mjZp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5SFyknb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G479o1093543
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 23:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4t92/qX9kUehyfMH3mnM36
	DEtVPBgU9oqlpwHP9gFjs=; b=MgO4mjZpb9vTRGQpEIzHi1/5l83GFRdVDU4IKJ
	hd4AjQZVKpvd0bEOUbD63Gej0nUspthiQglmKa1tD/4KQ160uDXBqi5/CbC4H67e
	i/WfntjqvlES1kQ60CykUDr6buYwSHm5zE61RHkeg2b4E7cx9MogoNoMk2BwneK9
	ydMWAOeymQz9RY3P1WITD5NJkNSJ4SjaUt47zZ+nEEuzMSJDg9dOr1YsFvSBtkNg
	2dGzD2rHBqXGgjH7Ts5dFMwzg0uQEa794QOYnGdL77CHHMlEYeFIqoz1KtvlcEsZ
	ArnL57uVJojkQgFLzqSyPJHbxscaNdi0SbvEBzSUJ0SJOPdw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k1d1auv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 23:31:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ee34588671so3728637eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 16:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778283084; x=1778887884; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4t92/qX9kUehyfMH3mnM36DEtVPBgU9oqlpwHP9gFjs=;
        b=J5SFyknbdq1bwEkRSuAC2dfcRF+X3nqOu6/yiF1eek8BSFYiR47bByYGpoPl/sByZ6
         QmaTFScLcVU1HQOrg9iTeGjucL7ZTr2sicnqgj8d/vcEKyDg7VYFId9fV78iajIdxX2t
         MmWmvYR0w1EvY+PF8o8DYQhpD+GH247cJOL6LHq8qQ4BKv0G8/OwdMEkR2se4mH5xicb
         p6fbmvYr5cd5v5DgrRctNt/wiA3OUkRif7W9VPGpqrTHI41H6rhmNN++nVEybwK5afSE
         8XcSjweyhkAI/0FssDlI9EEhjw5d390QFDI/gXOCon0qQHVBDF4+B+UTNjdc2J2lCkBe
         1UWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283084; x=1778887884;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4t92/qX9kUehyfMH3mnM36DEtVPBgU9oqlpwHP9gFjs=;
        b=JI10TZSNLy7YvADWFR2MjR2aamZbKwmEk1yuDAur+PaQ5U+iGYYZ7AeLU8TOx1vBcq
         IST0jfxRdr/RfQUNnRcgqgygrSdAFT4xs0dLSHi9Ikinwiz/AkGI7fcJ1CrgRnzMOMH+
         +31bgoxocAnPQ6TXtOngY09/EMheSZVqhszDijfbXYwAZyXKcSDL0ZSecvQk286vwvcP
         oA58qoslVWGobuGJts78fnehhNP/Ljs/grps9sUf7/07/B4EyR1vXCMMaZnnQYI8s4og
         iBDnG6JcnUZvjcfTb84CnnBsJrL80vLQ+50hU4RabVJjLj1litMhLw8/rOn68LTj6dz2
         8OQw==
X-Forwarded-Encrypted: i=1; AFNElJ9eowXLVCRN5+IbZED9YX2VR6oIoK45XUSPEF7v3wT3hHcA0yt3sjKC1BDtfbQqfG4Vd/GKLz0OjKYX@vger.kernel.org
X-Gm-Message-State: AOJu0YwmGZmZ6hwFaRRUwcC/xa2KdtIRybGq2vQb/nsWtScZW3UhiaxQ
	YNGpMIzDnBsbrnHJG8izUhCeE+JzJG3dL/sAfE5m1shoMKiGPr78f2SUC0AJ3tVa2LN4tFJn28G
	7DrOyCgvo/88Dsm3KlbgQNJBoEN1BSO+toepVMmm0konwDXSRgHXHB/FMqXQZFsqb
X-Gm-Gg: Acq92OHbc3/4arRcPKVmH14KH3fV8p5EBrMqvEXd3P4txJOxScyTP4RNG24YJKU4Jj7
	HJ1dzXqOk0wnfuYqC8dDhVfZgFP/NxgBQrkX65BQrxGcKbNij64xAenAJ8XOyAKaXWpu52ymdlA
	KrXlxxBvZJ9i165a9D4uo88+MW6vSb15KwDSofhMi9uo5DFc94T0nOOX9Hynbb93eF3/khwqDpk
	7DKUDoGfB9fY266OfP/tQYjy9jdc5Qb9KhC1bFJvoY3l53crXfGk4hBYbfLjyvntxPrX5VciVVc
	4fpS9ev5xgv9HgMj0nantnyMGsq6X8GRthL4y+aVIy61Hy624FPkkC0vfpzUlMZNqqy4mjqKzIl
	qmcfZ+716/rc9drw1zQjgeNKQMSooDu0Hv57Ajrh9i/QX37fpCOTqefZYULg=
X-Received: by 2002:a05:7301:3f07:b0:2ed:e14:42e9 with SMTP id 5a478bee46e88-2f54b57793bmr7581893eec.34.1778283083896;
        Fri, 08 May 2026 16:31:23 -0700 (PDT)
X-Received: by 2002:a05:7301:3f07:b0:2ed:e14:42e9 with SMTP id 5a478bee46e88-2f54b57793bmr7581871eec.34.1778283083309;
        Fri, 08 May 2026 16:31:23 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm5033122eec.21.2026.05.08.16.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:31:22 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Subject: [PATCH 00/10] phy: qcom: qmp-pcie: Add PCIe PHY support for Hawi
Date: Fri, 08 May 2026 23:31:15 +0000
Message-Id: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAERy/mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwMz3YzE8kzdgoxK3YLkzFRdIwtjS2PjJBNDQ+NUJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaAOIItllxAAAA
X-Change-ID: 20260506-hawi-phy-pcie-283933b4113e
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778283082; l=2557;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=FpOZVILuZdKgJAFxsw9h/rPIUNFgYb8dRtvt8QqP9Z0=;
 b=zISOr8IB5ta3VgjDqkWMsbaZncXLlgITdeAIOxr1F6HLT9iX94noIF3XhYRlttW32yw5rlE5m
 DAb3mVjQeKfCTa88BX+irQNytlAtLaNU8tzuew6K2KAtfaQ+l/vmAye
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzMiBTYWx0ZWRfX0i9DA7BRa0qa
 SymHIfJASDvZ6hKizy4dWvklgzYoIVhuSRLJz9g9D9Y5PpLXmu3ODedO9iHyTN0TawxEjm0RSNy
 wSZTrk0Z2rR3/dJmIZeu/z5tUsCEifXjcsBhHqAfivqQo585X6+7QHLUsipt59X87K8euFmRao6
 U2EITxIWmEkQPs9vFmu4bUXl1tzycWf3EWnwaPmJI7fR4lmzYfxWoQLTJz47RIB/kd02NEsrJF1
 ByyCcyi8ahURmPf6r8X9qcv/RwQp2mvBbhKqDdyFrswN6Akf7jPJafALuHkz68brypfdEp2tt2Y
 o7gF8uejrstcryEVmeFbtM+cA6Gc7pSSTLdatzo0PZBSf2LZeeLNUkZt7jN6gBb5uPnI6YrQVf3
 i2JL96FVazCemTZHIZwbfpVGQo5XuxMEKqhVJybKBPl11GSVIypcuM6Z5kbzdU/PJa2nPYbK+SB
 kjiNmark3eJqEFiaKDQ==
X-Authority-Analysis: v=2.4 cv=GLU41ONK c=1 sm=1 tr=0 ts=69fe724c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SUFyVy6k7XmgMTdL_LUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: JNoPDAF4QIO0INcSFa3-p5KdtYjL2IG8
X-Proofpoint-GUID: JNoPDAF4QIO0INcSFa3-p5KdtYjL2IG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080232

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
base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
change-id: 20260506-hawi-phy-pcie-283933b4113e

Best regards,
--  
Matthew Leung <matthew.leung@oss.qualcomm.com>

