Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2172F351C2A
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 17:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705618; cv=none; b=bONYEqHLMjRgbY1HkmVg/8WysL4zWpFj90GLehksDAmxFVE2jey1R8uiCv/gz3n5Ldq+89ZaCIJmY5/E7cP5gRlKGNlBiQpoBeLVDaRt2nBcta65mTpIzb8gSlwmh6pokOpLUMBTeiyGV8ZRJ4rnOIDfc3H7nsDna6o0korURe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705618; c=relaxed/simple;
	bh=Y8JPCXG0ZhSLrMqKLkgn2ObmahE6GfacoqYF1bj80OI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LrXtQCb8DrlyOhv3reHIi4uxRqb+tEkrhuwdnRjvwY/bSrdFlEDr8JYLCCJzt6dgDQErY3rPlYEL+iOak1VZ+0EN0Bawzoy/ROu0kLMWFhC01WxPnWl44UyZ+xJ88PZ6xI7ItLIBDOdMv7mRbvxyJHwFdRlK7rK+uC3VX8Ssjow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xm+N4F6L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kv/Eyly0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xm+N4F6L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kv/Eyly0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3aKH1453049
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 17:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mlfY5KW2Ubph8SuUrGt9q/
	dW8huEOfRAa2uT5hWsy2k=; b=Xm+N4F6L2DAuL2F3+Fsixh/2+uQPBknj2boS4L
	XLEboubLolcTPHdFENet6F0k/mE9lHPUVvWaQJRwL7yMpjR4O0VPgnniBT1KDNYg
	nvcAbBq1D6qRmRJzJ7wV+G5ne0Ozim+vnYrMiQ7fZmK+WMOM/ZMPX9cORfScQy/Q
	qQ8EUR9aymM9W+DOUo91roC/6OwPa0Iy4KVo5axEP6kzPM0H1JqEtZ9S3wrjYBEN
	LbA1t4J1PIqtUcP0TqKsbTpMJ/m+fMMc5b16yeVq/jX89ePOi/hPoAea+31guCq/
	UPJzEzsAPlsQ7+S7jNU3FiMlyEAVK3yzjDasIatW8ZbP2mLg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb3xn0byv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 17:46:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3812b0c6f23so1397720a91.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783705615; x=1784310415; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mlfY5KW2Ubph8SuUrGt9q/dW8huEOfRAa2uT5hWsy2k=;
        b=kv/Eyly0l9cnA10DzhHkHxLJfxaBdV92S14kFoF+yJ5cu11YySFkQ918rH/c8NwV8Y
         E4W7GfaqsLkOowU2wAxqfWCkXSN6lnkzP2BHk6eXjoqnT1UycI1ZUzrV5XMHwbnAqGre
         1MvSxV5GbkJEFBtDZb2dqIUxRnSbXjqvz8Z31jSQ+NVCP5AWZHdAYoJIlrtNKMVmTrfp
         cuafqIgXg0Uz880KOtswbHC+1WOn86c9OmAFFk50h9zegE0prsuQQ3dAsHSC2I2C0GkK
         2mbhBqKCNAD1ORVQ8SDnXtk+0Hk6gGa1aw+l7twZkIFA71RPrI/cXonvdapRQmmBF04r
         h51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783705615; x=1784310415;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mlfY5KW2Ubph8SuUrGt9q/dW8huEOfRAa2uT5hWsy2k=;
        b=RKis2aFjL7Nc467HUA42L7Fn4D1si0dFp5lho6S5QK12nSPTShob6G2UnhuTzH2bku
         BXBWpGZ1Qw800wMlT4afAxxEYuA1cSFTEb4JjPJZwUSXXLvGnbbP+iC7jsZ3rKjyM7cL
         43u8H/kfSKg3H+CPOdMRsz6sRGwRmUa5JUwHqyk3tnbwpM9gsr9nWjJPNZ2KbiNrCs9c
         r5x9y6O06oPGyjbYTMYZx/uY5ch91Go3pq/cAx3f2h1y3vpwLvIUKkG+h3Ft4wrvmSon
         4aHK4WeBB/DzPoNDCXScsWBbJq0FxQ9T2lm2kC7fNAgD99paZgfjCn32XgGYU05o9cF7
         vbwA==
X-Forwarded-Encrypted: i=1; AHgh+Rp/Vn9j5U4pRwNSPSo7ILUZ0L6jI+dLReP9NDiODxRpxrc4JiGQjPaeQKeEoibEycKJE5Jt/76uBUXh@vger.kernel.org
X-Gm-Message-State: AOJu0YyhibbQUbykA/5vCXFRCO+mjIqYgGO/pvFMJcYfSoKYVkIpDza/
	1SJ2KCCHonP70lNr99jvDkgMhNnbe4VyhTfR9UmA70FnZgd6JdAD4hjTiGXJ6thZRO1ym18Wiy/
	KOKUSnqOV7PZIhRMWv/hV8xTiZTFuo2pwNvGLx7RK0X4AlViwahGeIiM2rJpmATLZ
X-Gm-Gg: AfdE7ckBrSBEwqOGBZ5T5j75YMbbONFDepOObZlg7VYTDnTDBClbTbVj6GsvxKwOWs7
	BoDML39o6wxzP1UrMBkqgS8P+Tq26yAzmHX48RmMVKNYsF5UQnCg7tHgnxnA/ibK86iszaqWwIK
	mqSaGQhcpzBnhDTYeFn3un+sXWeHtyYU5Cyh7F8FahfgKxfzE0xXLBYdWVg3CAyq1XoJqVWLsNj
	GfyXQlAiokwhMIn+7Zy8/ni8BYtlx9wmkpljnUpjzSnm26PZcbpwloFgMZUnGhT6az4W9RWQfst
	eYkyi6c4AsFSYatj8RUhWTY5Jw9Ci3Vnvv/eK3hXZx5QYS23xEi7npLY/LHwG1C2nOJKogCMuOg
	qlmrdF/55FdV97k9XS4mjUEgJvtg2glvqwevrD6sKtWdYh4fud88m1/FTW0cCQ5PKFoyVr7S+FJ
	x2st7Izl3xuAKH1OtHkVMpT0GPwJc3mNRTA0WTQwtpWOEh1Q==
X-Received: by 2002:a17:90b:3943:b0:37f:9ce1:735a with SMTP id 98e67ed59e1d1-38dc7777c02mr2432a91.27.1783705614707;
        Fri, 10 Jul 2026 10:46:54 -0700 (PDT)
X-Received: by 2002:a17:90b:3943:b0:37f:9ce1:735a with SMTP id 98e67ed59e1d1-38dc7777c02mr2391a91.27.1783705614218;
        Fri, 10 Jul 2026 10:46:54 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm33008273eec.9.2026.07.10.10.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:46:53 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add support for the QMP PCIe PHYs in Qualcomm
 IPQ9650
Date: Fri, 10 Jul 2026 23:16:39 +0530
Message-Id: <20260710-ipq9650_pcie_phy-v3-0-ef6018818d33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP8vUWoC/yXMyw7CIBBA0V9pZi0Jj4CPXzENsTDIuKgIbWND+
 HdRl2dxb4WCmbDAZaiQcaNCz7lDHQZw8TbfkZHvBsml4VoKRul1Nprb5Ahtijsz3B99UFKfhIO
 epYyB3r/ldfy7rNMD3fL9QGsfnr9q+3QAAAA=
X-Change-ID: 20260521-ipq9650_pcie_phy-60d7df32581c
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=JJYLdcKb c=1 sm=1 tr=0 ts=6a51300f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=JfrnYn6hAAAA:8
 a=_lxU6AF3MxErEUeOnbgA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 4-RbAbRq9N0ChA9hnQA60VwhfFJp2Qm7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE3NyBTYWx0ZWRfX5jnHYek/idZ7
 x++I1tQU6L97EOCq0NgnQRK9iyfTdQ5khxRw8oxt+Ssh4gDRWXSW/HC3NJqDEoLnQcHlqRirvr8
 nkXdtfkkRIV6MzGilck0SAnfruXfj9M=
X-Proofpoint-GUID: 4-RbAbRq9N0ChA9hnQA60VwhfFJp2Qm7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE3NyBTYWx0ZWRfX2ab55dtWhcM6
 SC/tybtcd9hcuUx+aHMJcEyGTyg44stGfIKyh8M8Xh+lwDQSyn0mUHmlOUnHRPR1llFqvzpOGRp
 ARr/F4L/uHZ4p3TShR5KnDD6Yv7BPPsO7AsIJJ0iQc8M7dun6fBRgBvJYNsuYd5ycznPH0QbMFf
 O5oXyZX36tlNrMK/gpwEiB1z685S+B1aLtLXUHqZf+vOuCAr4SwJHsLpNwVq6dkJuZOUWl8/a4a
 IoQMZnT+cDq2o2mo5TqatJMiAo7HLZoLOi8YCN+z4fwezWrqUcPmtETFtl/wKda/XwxlU6aM5o/
 O22P1397ogZnuf1OoLU+L/5fzMEvMunA4cfRYj2e3EhlexkwHq5Lc/ssp+etoKoMNZv/9bOpbfj
 EsT9qOSk02Kg7qrRE3N0o39L2N4PbSmnWjO0fw74Im8jXH25Lf+CjqQrR38RV9izqXCKtzYvw9P
 m90wV7htpxPHpEO895A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100177

Qualcomm's IPQ9650 SoC has 3 Gen3 dual lane and 2 Gen3 single lane
controllers with the QMP PHYs. Unlike the PHYs in the other IPQ SoC,
refgen supply is needed to bringup the PHYs. Both single and dual lane
shares the same HW init sequence. So reuse the tables.

Document the compatible along with refgen supply and add the phy driver
support for it.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
- Rebased on linux-next: next-20260710
- Pick up R-b tag
- Incorporate the link stability issue fix (QSERDES_V4_RX_RX_MODE_00_HIGH4
  from 0x35 to 0x3a) recommended by the IP team.
Changes in v2:
- rebase on phy-next
- pick up R-b tag
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com/

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
Kathiravan Thirumoorthy (2):
      dt-bindings: phy: qcom,ipq8074-qmp-pcie: document IPQ9650 QMP PCIe PHYs
      phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support

 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml    |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 220 +++++++++++++++++++++
 2 files changed, 239 insertions(+)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260521-ipq9650_pcie_phy-60d7df32581c

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

