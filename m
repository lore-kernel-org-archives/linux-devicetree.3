Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C530D305E1F
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 20:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783456397; cv=none; b=tyvSBhVRrHgUiznDajVU4QjN7gD/H4fz5TI5gzSAw+RFqfxtX4oY7IhQFt4pATj+uCHIqWAYiWfzDNRCHJZPR9NoMXHx7KGXWJkXPgKFpZ3PZb92sCJeX9N/IPWexcFWCGvl1zF90PduHOyk//WVucXEnx4O3/91JWDcINF2BMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783456397; c=relaxed/simple;
	bh=gVizImy89dLlQHCSXj3sY3Aa7FEYtyCZy0xM9oJaFxY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bU61v3B8PXvSPaBQXY2d3Ay0cRWLr04HROBik8oIhWj+JtU08PrUWJs+i8yu513k3dxjqLHpNBf/6/PiF98A6VxZj74mfoZmhzoVDqF5M54EnhZjyZypVkXvxls2r6ghyt87432iExj4NUysvGdw+26FBOKeAJ2ziQ5vRbhl030=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILFGH1CX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHNSRO5I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILFGH1CX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHNSRO5I"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5UbO509552
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 20:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9W8kXXmEwm1yikiuYV/Gds
	qOtO+zyMBhGu2oOaEsvuI=; b=ILFGH1CXb+c3n7EqREyxaG7ngb1be1xqSIQnYm
	ff0iL2qymkn2KNUG+q860YOIdOxaYGF3kQ5tKqBNajjy93ue/Bb1pG8pPEruLK0y
	aNeKosipVKMwwCuMVvGhpXzbXPR7yJWbp2uesSrEu+HixRcpl+CijDNZOv6KtDdB
	7WhgDYhFHpxTprQ8MRgStm8kobCHcnFbuv2oGLg0uPqyIOkqju8bQHpeD2fB6wzp
	QHvMvrTc7BNwD7zdz8JtKi4wwq1IvUO7ynk0y+lRo7uNAg7fUPyxnIng57ppV+mK
	Vg2VvOLne+Ira+MdyrVE9z4EzipFdxbVqgqtr6LEqDUc0rRQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep370f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 20:33:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811ae55313so3987301a91.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783456394; x=1784061194; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9W8kXXmEwm1yikiuYV/GdsqOtO+zyMBhGu2oOaEsvuI=;
        b=SHNSRO5IvpLOlGnQQFWhGNWlFgpHYccd4uwsrulEaqwXjMP1or8bnSo97Y5Y/6eEvl
         sBKUYBlZgMHX77MTttWgpZDsad0U81UYD8GQ9PvWPXomPiU2gHx5QT46cUJFS3Khsvs8
         0bsT+OwKkA4WGEdQ7ErgIjI3+J353ebXCNjdTm1xHbXb1hgyiTKWqgy1oD2kC89MrPeE
         4f2k7j6S4NaywxrWLGhaRGAZFUMOHcGRjZsGKfFDjDn1Oiq4WgFF7NMOB5PRyv31Mc4d
         Z6vn4NSXV0vzcXDGaakyfTmTqvBmCv4P5Z/xH7TuOUNEON2Y/DOProLBKbU55cIFI3oD
         nMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783456394; x=1784061194;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9W8kXXmEwm1yikiuYV/GdsqOtO+zyMBhGu2oOaEsvuI=;
        b=nNx66h3P1Z3hzHzHqGjkwgWxd5KIjTu/h2m10t/dogVjpW5wPsr66MiHDUO+tcKixF
         H0bq2BBLTEPC80TkpE2BQYLuL1IhPmxjfBqxSBr2nBzEwb+m1L1kj+bN8eMZ+4ny2tU7
         lohdsroMjXz1WhYS6xF2+bkFmv+2m/6XfZau5rjVP2zOA0iAczvXpkPDyokEYeVR04b1
         yrssp3Odqo4BXdf/GGpqKTd/jVf8W9EV/ArAZbnM5U9xg9jNaNG2VfHm40NFXYAbrCh7
         vcPhO2UA8PzQ2/afYPV008+VZbJdvCrSGSskZahU/sXe5kXjKIBbTYpmFQq0gpbi6gLW
         FYfw==
X-Forwarded-Encrypted: i=1; AHgh+Ror3C1CgtwMiLp2B3lgWpHnHmwD1aBeJk7ShSA8H15w/iqn3hrK/5KsyQDk4YCoD4A23fB3YDHzc5m2@vger.kernel.org
X-Gm-Message-State: AOJu0YwN1zDvODhRiwHtKn6Loneriv2XPQ3MP81Z5ipz7GlfqEnU46Wb
	LaDXj14o1UeyPl9w7oOA7yJFovNSmiTs8tpsaNf4Aq6u6GLmxnVHXokk2UN3u+TM/qcdl62XQo9
	zFZcLDbH2PQj+1KYGmJOWjzKglfdmyf74hPyFoHf83KqnXZVmyNt999icydjDrNsN
X-Gm-Gg: AfdE7clmw6BNXuuiXRD4uFqLzrC01ZEpkfLnjaHduV52PfsvkQHGJO+WbLaQRAHbbZv
	FCz/549YrM/Xln6GIxCFivZOgi2Uk40m6jGxLrPKPdCO+GLWHcUhVtTC3yY9k/k5NdrxoWLm+V4
	0UvdLaq3mj4a2ud9kcHnyI7qqbHimFz3ucZCaspGctGt9LbAM9Wu9+jNsXfskb8idmk9nPS+2kr
	aFptXN+xIIZQ9X1zvvDk6g1BSkPXfH6GT2mPcLLADKwx9UMs7p0HaO6PCF0d0stMAQtVw6KNjck
	UBOuAt+7eQ4XO80kJ+fVOjNt/ZUGMMM/kqgpCxhrggQJoh1tz81I+k7Ss9yuviZZipMhXd1poVy
	WPQmMyJ1tOKdznUtbaj74xqtacl7jS1z14VfHtOIpc4GifwY2
X-Received: by 2002:a17:90b:562b:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-387e0fa6abfmr4419241a91.34.1783456394270;
        Tue, 07 Jul 2026 13:33:14 -0700 (PDT)
X-Received: by 2002:a17:90b:562b:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-387e0fa6abfmr4419214a91.34.1783456393688;
        Tue, 07 Jul 2026 13:33:13 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm11975804eec.10.2026.07.07.13.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 13:33:13 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Subject: [PATCH v4 0/4] phy: qcom: qmp-pcie: Add PCIe PHY support for Hawi
Date: Tue, 07 Jul 2026 20:32:45 +0000
Message-Id: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG1iTWoC/3XOTQ7CIBAF4KsY1mKAobV15T2MC6BTi9FSS0WN6
 d0FjdH4s5nkJW++mSvx2Fv0ZDG5kh6D9da1McjphJhGtRuktoqZCCZylrGcNupkaddcaGcsUlF
 ACaAl54Ak7nQ91vZ891brR/ZHvUUzJCQ1GusH11/uBwNPvaddfNiBU0YFzHVRSsigNkvn/exwV
 Dvj9vtZHCSdCOKF5Ex+IiIiGktWVJDlrNJ/EHhD+NcnEBGolRRGyQyV/IGM43gDIKHOlE0BAAA
 =
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783456392; l=3439;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=gVizImy89dLlQHCSXj3sY3Aa7FEYtyCZy0xM9oJaFxY=;
 b=CWzG8LfkPqz35P743PAxAul0qjSWPYaaSUO2nGonYTWvGqz2FvPIhY2fUtcdJWhhlW2eTAhZZ
 qgEuJ2MHPPeCbgD6LgJP/TWoHSFKkOjcWIUYQ0Zh3V6yEc5ZArerHuB
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-GUID: G4ecNlRt5VI45slUBl914UHtdSXRsgPF
X-Proofpoint-ORIG-GUID: G4ecNlRt5VI45slUBl914UHtdSXRsgPF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIwMSBTYWx0ZWRfX9O3KD6PMX1OD
 Zjudg9off0yhPumCG5IdBsA/uYjvIMcx807N7sje2natoZMq16yOezZyCWi2HBO8oYA2u0FP+MD
 J9Ahg6LU7jFTATnA18jgESESBg3vQfAs2Y+tIMgCXuD9+oXACLFqHZbzuYWkFdGjxcLNUoaXKgy
 xr9l7HeApKxggocgoxQyScIKwuXnbpY+519a0Og5jKTOQIc+oGcOey1nEu4KtcTDkW2gukvKeIO
 bsmmi9+UFNtsfjsTceXVS7K53Y1jdoR0bzpc8pqXA+45TYT5NGr4NQpENWsjPef+BLXe+VcMUCu
 BklHxoDO9y4fYtJKqCeC3qSGC0noeBfWSy0MBEjP2KjzVFgNNaWrUTkdwAlGKFMnDOawNFO3L1W
 no5ggOaXH6FrXJhV8D3s4D1yrFz/IhF13BM89VXfAjggkFVs3GR+Z9HXG6ZXzMlsjFc3dmGMf9l
 czIYceFRamKxvBuk7Tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIwMSBTYWx0ZWRfXy8/DTlwk7nr3
 xntkQt4YbB8WQbSTJHfz1VcTu0KyXwO6CED/dGtKMS4/Wqcwu3giiIH1/g70JHh8nBDYKkK6CAj
 cK9rLozgKIsgXmF95/wpyi3Tc9OdqIY=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4d628b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8
 a=JfrnYn6hAAAA:8 a=NdRViCHAqdO61CPby4IA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070201

This series adds QMP PCIe PHY support for the Qualcomm Hawi SoC. The Hawi
platform features two PCIe PHY configurations: Gen3 x2 and Gen4 x1.

The Gen3 x2 PHY uses v10 register definitions, while the Gen4 x1 PHY uses
v10.60 register definitions.

The series adds:
- device tree bindings
- v10 register offset headers
- v10.60 register offset headers
- driver support with PHY initialization tables for both configurations

Overlap:
The series has overlap with "phy: qcom: Introduce USB support for Hawi"
by Ronak Raheja (see link [1]). Both patch series introduce a subset of
v10 registers (this series for PCIe and Ronak's for USB). I have
coordinated with Ronak regarding the overlap, and we can update the
series to resolve any overlap based on the order of merging.

Link: https://lore.kernel.org/all/20260508213234.4643-1-ronak.raheja@oss.qualcomm.com/ [1]

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
Changes in v4:
- Rebased onto v7.2-rc2
- Link to v3: https://patch.msgid.link/20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com

Changes in v3:
- Squashed v10 register offsets into a single change
- Squashed v10.60 register offsets into a single change
- Removed USB mentions from header comments; offsets are PCIe-specific
- Reused the tx offset for the v10.60 combined txrx module instead of
  introducing a separate txrx offset
- Link to v2: https://patch.msgid.link/20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com

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
Matthew Leung (4):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Hawi compatibles
      phy: qcom-qmp: Add v10 register offsets
      phy: qcom-qmp: Add v10.60 register offsets
      phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Hawi

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 375 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h   |  18 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h    |  26 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h        |  22 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h     |  23 ++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h    |  49 +++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h |  55 +++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h   |  47 +++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h    | 109 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  10 +
 11 files changed, 740 insertions(+)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260506-hawi-phy-pcie-283933b4113e

Best regards,
--  
Matthew Leung <matthew.leung@oss.qualcomm.com>

