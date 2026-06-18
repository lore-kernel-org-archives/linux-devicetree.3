Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFC82DA768
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 21:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781819699; cv=none; b=HF0t5KNIwFov3fxv8z70/29F9tZTEcq31nHf8Exq9VddOqiF7iOkUsov8AF9ay9aluUKQHH7VXptsKZT1bT84UP9iyY6VlPC9UUIxpvRYcDE7LqHIlNU831syvW9Zi0Tos22ls42ThBlIsGglCb59TNoxNLqSIJ8oDlXTz0LLuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781819699; c=relaxed/simple;
	bh=RHPv53SnE8+XMk7kiNsS/IPw0K+WbzN9wk2f4cANiIs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fMl1pIk4bXwE7xIFtauWX05tMPh654Myo4A9YQ+0ht2bdgtupdfXzC5mexfnWwLnwNdIR8s2rbJ0FvJutrQCf20SYjy7wLFmzTcJ8u7lDdhZcbmXWfha223yZ6+bm+0J0Hji+FEOkw6FdCn4tb7YnQp2HNMzSvhsnzPpFXxXLQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W5xBCTnz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8rJxcx9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5xBCTnz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8rJxcx9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ILsd9V4078368
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 21:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cFhmc6tat5NN4iF51gvWQR
	hQtkdukby5rCSzb69wkuc=; b=W5xBCTnz9C4PWvZ0KwYkC9Z85RI+DCoWnM0z9T
	TxDgeQmxgffiG0dQ07hOCUGpeIUJyEeUYoiQs4doDQWqhnkRxjc7Kqdyk1gJzgn4
	MxrbR+nvseXvl5ZHm/NmeicZAFu7I2ONvqRJcEyOn9Ufma2xcHt1CKZOALYxvdVW
	spw1dYb092436mKOEljzDhQrrZdjQSZuQ3/vNZKou9PZdnjFhU1raTe2UEj7rck8
	Z9GpOdYTxK44E9wMCq7/g354UWHesXMP53ZKImDuBol3q55uoBha9qAncD9crGp0
	jPLagOtJ3DvsLo7nD11/zhoFvXzgplmqdcHKwJmcHrTH4WhA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evgtmjcmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 21:54:56 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1382f39e4b5so1615455c88.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 14:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781819696; x=1782424496; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFhmc6tat5NN4iF51gvWQRhQtkdukby5rCSzb69wkuc=;
        b=K8rJxcx94qh8X88nHjbyKDvr/asUQhhhQyd8tHw17YU2s5kh/fu852qkOldL8VT154
         kWT+kTKODsnUr/I2CvEZUZwV30mrB5oLvuD1LEDxp7cUDe8aS9B+yQBZ2QUDxoODRTc7
         ddnI8srNuRPqedyItSbHu0YxpYIWAqdbK4FxmW/SbsE5emxBDZQ6qnbUm4EsZ7+JBm5K
         Nbm73FO95CL0ovVVF0vRk/bqgARMIzcR4CmUxB8hVVd09HSdPt1r/Icz/V3Qy3S3Tv/F
         gjkvdRmu7Sra1L6o3gcHjVi31R6wdFgp8HYWBAHHgaWwuKtZjohsG3Cmvwd2dDsO8sDU
         rYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781819696; x=1782424496;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFhmc6tat5NN4iF51gvWQRhQtkdukby5rCSzb69wkuc=;
        b=EAq+4OrEBwOxCXaGRTJa4GtWXPhTGB9N2NpmyVmfvRvs1GKe3SpQj+G0+4NLIaQtYM
         HBGGB8aPf0wikkuko2cvR6pooK2WtVUlwcVqkmcrr+uTdBXjzNhySkYdIRAws9nYDegu
         DIo0Cydw5823mumyVoXbyHcpu0NbU7GYYpiZRotzFn63LjDfKx1Gd2r/euAZsVFoB6pH
         +8tAPX0GjXXUn5YwzczJu/9xMVFaahngfVYURXqBDyVgkTyl2GA95tPzADOY4trEaefa
         tEWNzilbxLh4aeqtPOW2ZpAeY4u2pZvGMZ0oj5ATxHSW9fEiBRZZN6qKEtNYy5k+AChk
         pL6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/346dAIiUwq7WDKzK2TpO/LYsl/QEHbAf9hnQMuWM23rW9oh7sThayZLk70c7+poXnHi6JI6+I6xJJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+O7whNS30ZLvLiVI5HofFlfulIoQ20GgLEY1iqKpq/EHxYd4S
	mp5DiWakRanS2jRHYzjU/fPJ4mFqabLq791GBIRUJb5nu31EZYTane74g6xVfBCNBvAyU2yt4fq
	bLeMkWLhhc6knn31wKABKEp0mhVJ0cfrFo8hydyPvoMeagi1Nxb0/9D6St7EWwm3F
X-Gm-Gg: AfdE7cnC0OFyG0RnnR0Pr58uxr47KHn8kIeDVIwR0BKh7l2loRTl7YWUjjEx/1M0CHI
	ZmWYYD+Uri9RdPPwyPESh55gSZm3u2JdKnvcDmOWgRrvhRYRJV+VZAncJi3baItztSkuPRbPbAR
	eji20G6K3g5QAMPNgSk/JxOhjVMcTSGgkPyzPcD1ZVJ5Y5xb6Cd8DUcgo+LgPhF7L24Qb56d5Kv
	A1J2Y+qV+uOXOMGrmk+c5hb4NFFqWdv6GNC7JPOkfLxZF6znQQVJ9QhcJ/5HIRn4J0eFlluV7Ko
	/3SV+DkIcDhx7v7BzwPKCi1xaTygsZsulqYZdDj2Ix68BtxQzAe/dqlT9y3SgNqmTEbwUIOOVsW
	e5Mfgz85zZ4bWX6/3PKBF3TwyMv/q17sJwzsOpcW+Iq8FFaZQ
X-Received: by 2002:a05:7023:b0c:b0:139:85c2:d7aa with SMTP id a92af1059eb24-139a311b661mr469636c88.18.1781819696139;
        Thu, 18 Jun 2026 14:54:56 -0700 (PDT)
X-Received: by 2002:a05:7023:b0c:b0:139:85c2:d7aa with SMTP id a92af1059eb24-139a311b661mr469611c88.18.1781819695614;
        Thu, 18 Jun 2026 14:54:55 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c0670a1b4sm619430eec.8.2026.06.18.14.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 14:54:54 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Subject: [PATCH v3 0/4] phy: qcom: qmp-pcie: Add PCIe PHY support for Hawi
Date: Thu, 18 Jun 2026 21:54:35 +0000
Message-Id: <20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABtpNGoC/23NQQ6CMBAF0KuQri0pHUBw5T2MC1oGW6MUKVQJ4
 e62GGNC3Ezykz/vz8Rir9GSQzSTHp222rQ+wC4iUlXtBamufSac8ZxlLKeqemraqYl2UiPlBZQ
 AIk0SQOJ/uh4b/Vq90/mT7SiuKIeAhIbSdjD9tA66JPS+drGxXUIZ5bAXRZlCBo08Gmvjx1jdp
 LnfY39ImHD8h+Qs3SLcIwJLVtSQ5awWf5BlWd7m5TkxCAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781819694; l=3298;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=RHPv53SnE8+XMk7kiNsS/IPw0K+WbzN9wk2f4cANiIs=;
 b=2vQ3spsrM+vhNVXBIP/ekl4DyABK1cAFh76MkEZM/E3wgDICHeWcVEfnhj40Y0pIYHkXW21CO
 MxsP++tKE16DMtFY67CG8GBrQpt6lrwh79sQ6hZOClUuOJdVrntstrn
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-GUID: rVcOnVpTuP5hgnBtYCZOpTMI31Tvz0Z5
X-Proofpoint-ORIG-GUID: rVcOnVpTuP5hgnBtYCZOpTMI31Tvz0Z5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX2XwMZKTZRBDK
 q/bQ9AWQ3F7+rG0HJ68S/l/Cxd8yvSi2CXURPR0LIgw4Bdq8bZ4qOc1gaDUHmmv/zWU0ZkJ5RBk
 o5TisJNg7J+F1uYNqgycW9x0MUqmXtvWhxyWnGyf7guLivP1uyONjkq0GbTBx/lWa2/SEZTMnes
 +nL6HyfeoM5SA1F3LJVu7jP2bek6SwvnMI7k3XlOhlY8fcMNlubR/pQxpSz47hwwKts2z7THct1
 9qfi0AqrprzQxav4QoJV4CGGJyexSBf4EYQwrMJMqaDxnid8XCZbBvTu8J5JS1R9HdsbDHadNGb
 8t/bfCPIv+LgFVdr1XgAXyGXeJWg4VUyKAevUgMq2U2Y4qcTGfro2ZUAP0hbTLkTqG9y36XXEF5
 eJyPOfXMBGZyswvVMhrYcxwostLeN0P8zyR15ZU0iY/L0CMoqMfjlvvJdCjhbknRM3gcMKJvZmb
 lSHO3c11sj4yjpi8kQg==
X-Authority-Analysis: v=2.4 cv=Qb9WeMbv c=1 sm=1 tr=0 ts=6a346930 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8
 a=JfrnYn6hAAAA:8 a=NdRViCHAqdO61CPby4IA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX7iaw2oT3p5MH
 kGXn4o9x34wm6w2l8O3iyxkv10DoLzl/VCx+Iq8gMzQyLDVL+amj3Z8JihinufTmZ/2tVcnVCj/
 2lVobN054uwv63EGadWYmdJox4qatTI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180200

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
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260506-hawi-phy-pcie-283933b4113e

Best regards,
--  
Matthew Leung <matthew.leung@oss.qualcomm.com>

