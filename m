Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69932F8EBB
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787629238; cv=none; b=CEqgtf6ESfofDQQLXuQAiXfBGRNFGcOykVwWZlDxrV5ouJ6MCSYg8/SzBEoVsMsOwCNJS0s8hgxBO41Tqi7AuTLBcOO8vKAqwMEoR++VWIU8BG6hEEdU/gQz2pxU/IKmLr3FGloip6Hw+9bH635N7bMEKfE/iaL6zdhhvI2a1yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787629238; c=relaxed/simple;
	bh=ikgtOzxSpmJEr2Vr4iz9UntK5xaE/Y36dBEnPiBcCa0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uUkspBHQUV6wCQzchOlRSpoIJ5vzyVssNi52W+5oh/2Dxrk4DuUmGRZ9irjzcv9D53ZShgiK4iHLFwly+WnUUFOvX21mSoAzALtc2IyIEQaJNOGEJzRlbA1dY50q6Sbp/9q0IdoOeA+cRKwYjTvfxj34t2/4dD5VFT2sotd16i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MsKhtae6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H1WQ2y7X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MsKhtae6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H1WQ2y7X"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2R2YS125606
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EdSzuYafGONS0Am+NH3il+
	2M32HWJRjQj8BDLM7qMfw=; b=MsKhtae61WryQuYzE2Agnr8RN2h1adhMWYc35N
	pndzy8cI9B00hzhzFB4bO1xGdOUWpyaGUfARn8fzKdkbRZDW6u+9pWVifesDbSNc
	Wr1Ln1c4KYsw7S/ln4zW2u0yack5zMEVMXLTbksuXyxPd5IqLObWpUzgoq5rpLH/
	nb3RWaQ18ePSwJ7+KUoPvZxyTnjOAcGFoUJ94zesEFG8jIj3xZ5Gd/k9Ex6j/Vzn
	0jvW0T6cAuhqW0xxwB6mN5GnlfE+KcC5KZ7RrzV+rn9OwmqmQ8VZoyN6NaTVPpwu
	bWHMzVCoRcE8hLI7Qgydo5bZQz43SaN+J+9FJvZgp43+Eabg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8rqujcf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:40:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso4926383a91.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 20:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787629235; x=1788234035; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EdSzuYafGONS0Am+NH3il+2M32HWJRjQj8BDLM7qMfw=;
        b=H1WQ2y7X2zXBn6xvSVdlbhaCL7VfUmIgHX7jxOVXCxi/7IPzHv9rCn8Icd6CFRapot
         vl3MhfdOCJMTyZKLoLsHeSK9HVbRZ8S8BxgVYMSvaMfs5vNpD3Yx1juO2Vgr9aTOgp6/
         RLqFwHGBiFCkd8fBe8Hzkt2v0sMTJ6sY7gZiTq5JTCip3TC7F9XvV9sU/Klp6wz3QVpI
         GEtYEigCS3y4rQZVlfoL5eXcEPWaY9Rq92bzRdZPQmgEA25puIYQ2ECY5IFYvH5Au8N3
         +BG9mYW3PQrwU1ioZFC0xQXFHsO+l2ZHWcGi5fcojjizm1jpWMJdUpmVQKiu4R89Dusl
         r14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787629235; x=1788234035;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EdSzuYafGONS0Am+NH3il+2M32HWJRjQj8BDLM7qMfw=;
        b=FepKnF2OSA+8yFF5gVsXaF/OZ1+sj4xx4OhQPfobXHRa5mlsO7Ue1LDOrOU0108bzk
         1RF7UcODPtQ49tspJ1cowCqz8XZq0Se/naE5RiUAb2JIL9elXV9jo6SFp6+fPuW8SKN4
         WKwWL2DP6IFzmPC7Q26RDksZUT/94Sai2ry+M9YHxI29fF+YonsrgUpBXIaxp4a7u3XA
         I783QlTr42vG+Di+hb4R/O2oE5DEP8XeBda2gk5kVkuIBmlQP4h7fmdXYl8g0yEvKqrB
         /Ko17MZapxizYuYH6RIpZOFjfE1Tu0fa1SGmzSwGYxOe8pqn9GnPgNcsDIWCNXnMuLNP
         ABYQ==
X-Forwarded-Encrypted: i=1; AHgh+RqcKsh7o0glv/fWFhqAPC/gyIdWpxmQ6+QlXza/6Iz/xmIdSfwpDdOcZiw21dHF2JicYdt0A34WEoyg@vger.kernel.org
X-Gm-Message-State: AFuF++kHmKacRsiLjK5zaQx/RuppvzcfRgjrJZ2G8p58j5pQuc20lIlY
	uFtNbVJIIjyP6u0DSufo+LN2HmU4Od8B7LS8ju1QI2+LSe96VXhMcViBEa9ovHGsFMmPjOeiVRa
	RhsD7b+FBn39ciqzceglC2XN+L/ADj3wLYaEtP4004Cqh7dsxWoughvxJiqZwcvCL
X-Gm-Gg: AR+sD12OZjJBnUXSZR4xJGwVL/PJXIoDzzfOpZJvxiRC7E69c2Yzr8jhRDZlIUOwtwr
	4vhsBuV554/2kHjfx7csiqrSo1IZDRrMvRqfhA2wQOFIFVS/YhCgP30FP5yCkxsjgum7BIH/oZf
	w27mXH1v5pLaYPW20VPoRiDtlTtkuGIeYsupkYe2BmpTZkJeTBKynHoiLqr+ftK3BlTJOVLKCE7
	hiq4unJa8KpcchSlQ7XZsyAJnHmx+ryo5heo1HDVxFDzkNv7srKh/4O5iYqIlH7w8n3obf382Ig
	X3HM4feBqUSUGglet0x/nXE8Wc3D8nNNyw8BkSInsEvosmHMhOc80gRWicTBT5xIu94PaLhR+tO
	96WgU+8p/TMbgtQp03oJh4NBxbY6g7p/wCso=
X-Received: by 2002:a17:90b:224a:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-395df677766mr37994679a91.14.1787629235216;
        Mon, 24 Aug 2026 20:40:35 -0700 (PDT)
X-Received: by 2002:a17:90b:224a:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-395df677766mr37994607a91.14.1787629234742;
        Mon, 24 Aug 2026 20:40:34 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d36f9sm46440083eec.16.2026.08.24.20.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 20:40:34 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/4] Add PCIe support for Qualcomm Nord platform
Date: Tue, 25 Aug 2026 09:10:21 +0530
Message-Id: <20260825-nord-v1-0-7c02f2b8765a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKUOjWoC/y2Nyw6CMBBFf4XM2pI+kIcr/8OwKDBIjbTaAaIh/
 XcLuJnkJOeeWYHQGyS4JCt4XAwZZyOIUwLtoO0dmekig+Qy56XgzDrfsSwXJa960Z01QlRfHnv
 z2TO3+mCamwe207bdjMHQ5Px3/7OIzfsnZXYkF8E4q/KqUUXR8EKpqyNK37N+tm4c03igDiH8A
 F5hWHSxAAAA
X-Change-ID: 20260810-nord-461809f1d5ae
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787629229; l=2871;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ikgtOzxSpmJEr2Vr4iz9UntK5xaE/Y36dBEnPiBcCa0=;
 b=avFVHuaMXIAEXZtr/CJr52BQYBvSUlz+tIenooznuEo5NzsevM8LKP0sDuhG1fR8bCXs2YdNJ
 aHvip3la/HEDzSm2RrN5VRBXAZDwzLOSGvC6onVRrAH0r/tYmYn6wZH
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 4g4wlVes1OquxR7FpdKPKkeLDwjl1u_5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAyOCBTYWx0ZWRfXys2EDQlHPJAF
 6OIr/DoC882evCTf6RgaRjy1sKFfNfh0hOPeu3tUS9c4WUCIRff/MwFWI6f2+eiFWA/yJh90fKw
 qjx8C11Jrw1tvEzxqeFUv2km8+4zeSM=
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a8d0eb3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=1XWaLZrsAAAA:8
 a=P-IC7800AAAA:8 a=JfrnYn6hAAAA:8 a=mkAmWphk72FtIL2ZoEcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 4g4wlVes1OquxR7FpdKPKkeLDwjl1u_5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAyOCBTYWx0ZWRfX1om+XVxeaqp7
 w0/1RNlGc6bRuan/8+FUWuZL7sQDZtWyZZ+pceEW0eWvbRLT0ujWbKAipUzoOeA5LmkKN7pYEuA
 sjXwt5CHwBD5ESz0i6p17pSFgajQg7Y6/vk7FX72DoyzFYKZycRAi3rvlOcNinEz+nKMWK+8W+9
 A/CorUl6lzdm92Wgw0QIj/6/LOl5gVN4OKgpwbPg06VVheACEqU0Ylmff7yPilNNL7ZLfA854nV
 yUwc2paLN5zwjSqaEcHlikahWJUvSBmPv8V/LsJrJ0UqOF/AMLSey5ieB14faC6IVe6IcMgeVyD
 uWKgFAlTPUlExWO6Yr2+YKbhDf5PYH1uxDMYVo+x7WNmvzPUVfhvVp3uhbxqrPDczAPSrjbXtB6
 l0M3QmyeW4xF5BZMajTRw5FTILDT3RDqtXl6Le4/TkBH7Bl264nvx5Cw7ofPiCNH/WmX93rQil/
 OPcRf5yJFaUxPXR05mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250028

This series adds PCIe support for the Qualcomm Nord (SA8797P) platform.

Nord has a single Gen5-capable QMP PCIe PHY block split into four
independently-clocked and independently-resettable ports (A/B/C/D).
Firmware selects the active lane topology at boot via a TCSR
configuration register, and the same PHY block can appear as a single
x16 port, x8+x8, x8+x4+x4, or x8+x4+x2+x2 depending on that mode. This
is similar in spirit to the Glymur multi-PHY support already posted,
except Nord's PHY registers are programmed by Linux rather than by
firmware, so this series adds the PLL, TXRXZ, PCS and PCS-lane init
tables along with the power-up/power-down/soft-reset sequencing needed
to bring each port up.

The series also documents and wires up the qcom,nord-pcie compatible
(reusing the existing SA8775P PCIe controller binding), and adds a
CORE_CLK_CGC_DIS/AUX_PWR_DET workaround required to avoid a timing
convergence issue in the PCIe power domain.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Wilczyński <kwilczynski@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org

---
Krishna Chaitanya Chundru (4):
      dt-bindings: phy: qcom: add Nord QMP PCIe PHY binding
      dt-bindings: pci: qcom: add Nord PCIe controller compatible
      PCI: qcom: Add CGC disable workaround for Nord PCIe
      phy: qcom: qmp-pcie: Add Nord Gen5x16 PCIe multi-PHY support

 .../devicetree/bindings/pci/qcom,pcie-sa8775p.yaml |    1 +
 .../bindings/phy/qcom,nord-qmp-pcie-phy.yaml       |  276 +++++
 drivers/pci/controller/dwc/pcie-qcom.c             |   16 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c  | 1077 +++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6_40.h |   56 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_40.h      |   14 +
 .../qualcomm/phy-qcom-qmp-qserdes-com-pcie-v6_40.h |   94 ++
 .../phy-qcom-qmp-qserdes-txrxz-pcie-v6_40.h        |  194 ++++
 8 files changed, 1688 insertions(+), 40 deletions(-)
---
base-commit: c76bb6ed13d3c7dcd1ab3b248299c5a6f1460ec4
change-id: 20260810-nord-461809f1d5ae

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

