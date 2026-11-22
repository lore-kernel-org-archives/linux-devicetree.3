Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316194;
	b=3bhIed7cxFFh/riy1Y06LhPkj4qWijob4nD8ez9etrhIoewl4NjMwyTuWZMJNtUUfdCU
	 remiY+XIkrf/LBndWkCd/mqVU3yi1BG6STUO1u15RS3q8YiKYcmvxjBOImlujwa2Ryjyb
	 EepdYVMF24/VvMRa/zps2v5skNMqPKrDraz3FUC7VaO4RTqMTuP+Maa9obLgW20gmunSD
	 u3vtnabVhPsbsEuoPQe6riEituu/VdKXWkq3UuBOBOvgaJBzZVKVgp6TYDFF5GzHy6yt3
	 2+AbqDEFDNtRQEC4kKpVUk8Ulq09WCjxLZ3wKxHj0MaJbMxRX684yRBfUost43BWhZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R3tSSWYPQrETVDjfSFXNDw1wYtJcf93mV9ZliLI0xY4=;
	b=bpyygvqoEhWoNEbe1ovci0aFHlX6Lvf+HH3OXgWhs3M9ObfAOSFLxHxUR4ADryAGCD+Y
	 NzixP/xHI+HWB5stOyozAA2cG1C+UaTcmE7hmTSnA0brspYdL2edrskRxjY1Phhjd+zJB
	 yAs3y4n1nclRjDfk487bz7Gs8R1dnwcvYE6VyEuaUsZecA1+c7mK2VooQD8/Aea+1D58G
	 P9HLq8YCqm7E9FX+Jgh+VQ79CWPKBwzYQSXPNNGrifaUALMf7gJGFMM2Y9Ub13Joq3gki
	 /b9eTmo0BfRIbhR7VOduZNRKDRvtLUU6wZwyJfFxCBx9r5/3d0tZUp6/7B+HXbx5Ljw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XGilMkxt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jQx1A0aL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CF0606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66CF0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XGilMkxt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jQx1A0aL
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM07poH2905399
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R3tSSWYPQrETVDjfSFXNDw
	1wYtJcf93mV9ZliLI0xY4=; b=XGilMkxtU5MPR2MdQvH5iyCExm2UtSoU4z1J54
	+lTV8+vUGMTIWNOPN1Sm0MzWa1hzHm2j9w9O9GjMgu9dCt3iNPS4mijr7Y3IfT9V
	Q30REE4LuUUbit1Xg8xL0k7aTTkeKKgpyXZGwAVJDYjis9Q+SAD8HxCl8NDwzUBS
	RRdyhZc/rgOUJPMaI95vsOL/AqtaVww0SA/E6pL09mPOlruOPOiam2CoHQpKNuWM
	+ONevSO6lLvqatKZS+skhek/f1LU2aGYa5NStgX/DWn5aSrTqTX7ATagS4OIT6PK
	VOiVTSDOWhNmYq1t9qvuzNINgSbam/IecjKt8COxVWEcOWWg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j310faty9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:56:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a65fca25so360299eec.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 18:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316192; x=1795920992; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R3tSSWYPQrETVDjfSFXNDw1wYtJcf93mV9ZliLI0xY4=;
        b=jQx1A0aLu48vLa/83kpeO8uNu1MJ8qqPltcKgbJkd49OE7OPwGaKjHRXU81vL6zc77
         hI8TQEP3rXgJ7CnCZPgJmm2eANbLWbGNKieiiGHFOP80On23gMYRi9jXZRN4jkEjE2C8
         wYmBHqlmlWnNVPStyvVBBKvW0xMZdW9Ld8G0va1irCvBjjlbIix1ImeOCHjLOq2EbQ8F
         cQUOmwj77p2yv0gLo1LiZvgF+eJuuLGQh9Oe6/p23fHVcMqX+r9Xt0wIvwQPmBYmZRKf
         guXQZF2ke4NSh8j7q56g4IJcwqZNzjztFwzGK76jvjJsVqlMTtO0deG0FbcVS5eu6I+I
         lDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316192; x=1795920992;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R3tSSWYPQrETVDjfSFXNDw1wYtJcf93mV9ZliLI0xY4=;
        b=r0fXEo4+CQEq5i7UZQsfXUhycOkInwa7ap959Nv5eIktStn6QKR7+uiLbQ8TU4Wpbf
         w3P0boEVk4nQY3IdNiSVnAiT5E9eDAePJtskvEAhgjY2VpDI7xTKRpqhfADRfnbOWzaP
         sRSWMn/yE/Jqz9gBDqSv7DKVbDhbfy1ecoE6HvYW/pyR8YPfeoJR9CH8lQSrwH7Sbkoj
         +mRCrjgG9WOG7nG+YoyDlUiF8WHRu3Wo9tEHVAkhhnGEJwewZ3AjQ3bEbGKelhKfz9VP
         qjGXxNZdGebp2CZii2jyX9HyrT/PCNsk7QhA4rp63xYc3IB+70dllnFkuk03S59Gh5Ki
         F9DA==
X-Forwarded-Encrypted: i=1; AL+hErH7ZQ+e8vGykEb4GSFb9fYElrM4Ol1TmhI935AzQcnNPF34/z7R1bynZiIWPwVDYHuL4jeM5OS75KW6@vger.kernel.org
X-Gm-Message-State: APuU4Z94E2QzJKP+e0jyBQC6rZLA2FYaRoy0AhVZMETbsgl+tQI2jKht
	j2k4VZuTry9dvEJdl8Dz9F3tP80Rc5zfYaDgnWe2qryAqz5tvLlpEpJpNghGKxs5Z03Gem0TEPo
	A/iVbxRz3k2VzQW0z3Qd6h83h8OfOOGwHkPJ/hmtl87M9iPebKMIgVQaHUNJi/qEd
X-Gm-Gg: AZFdTZcyFQGqza/X7Subityh8MJr17wFKgXbjpu+EWG0WrLnzJPEfjcZ5UQ0pI2dNjA
	IPNXkW3E6MeNnEEyh9ZCaVwQNN8QRswfsBR+gzlu3TkB37cdZmCVFQOwhbRGe5d14V82Ar3ZsVz
	g+vE1Ip/YeXj0DaV2Jta8kDVB60ORNfF4Atl9kiRcSjTMdqJDA6Ss9pjrXcm0VhB9321aT1Arnr
	B4JYILF7aM4p7T3aFvbvo8Rvqg0Iwki5yf9EA5+3rqiMMD8fLhsDXDs8jq7tgbQfme1SabnhVFj
	Txpb0lK20Rfl2Hh5p7FvajlTJIEqSlBGRhbauRpRFQ5NsrSfk5mOakHWkiqgEHNQrCeRHka5hVH
	6kXv455HoHjpy9iexm828/hHg+P90suKVoegTughx0qGFf0xl7v2JJPPNDniuvL29gkJJPacAgs
	RFfPal/qhk
X-Received: by 2002:a05:693c:62db:b0:386:a7e6:79c5 with SMTP id 5a478bee46e88-386a7e68253mr696549eec.12.1795316191451;
        Sat, 21 Nov 2026 18:56:31 -0800 (PST)
X-Received: by 2002:a05:693c:62db:b0:386:a7e6:79c5 with SMTP id 5a478bee46e88-386a7e68253mr696514eec.12.1795316190850;
        Sat, 21 Nov 2026 18:56:30 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:56:30 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 00/11] PCI: qcom-ep: Add Nord PCIe Endpoint controller
 support
Date: Sun, 22 Nov 2026 08:26:13 +0530
Message-Id: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM1ZAmsC/yXMQQqAIBCF4avErBPURVZXiYjUsaaFhVYE0t2zW
 n7wv5cgYiCM0BYJAp4UafUZoizAzKOfkJHNBsllJbhUzK/BDrgxV2FtlW6M4ApyvQV0dH1PXf8
 7HnpBs79zuO8HGfC76msAAAA=
X-Change-ID: 20261027-nord_ep-f6e8d7b9c107
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Niklas Cassel <cassel@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Anvita T <anvita.t@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316183; l=3900;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=II104LFoYUY5bCZ8dL7uJ2flJ9MTEs2ATqgjrm8Rkco=;
 b=Ntg7aOOnLDOr1w8i2c53tVY/kOb0lH6r/CYyPBiWkneCkTr/bxCvNhbKpjfNZoLJIvOXy1+8+
 Njf0+TGjGSaAZ4mMQbKmueG1j92os4RS3EA/8VCY+R3lSnJ76GNuoQh
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfXxv/GBBOp3GKV
 DT5HsMrnWTeldTSvDDqlSLrqtiB7gMjaP5MvNpIY8TS0Jhciv3YohGXz6fQmMpSc9aDIf8fCfiF
 jDeHntEBHF8DB29o7DnzShP+rKS+C/fKM4S9NnLTn7dK6rn3+VE1OxHZLMlKnl4LQChvvDTQbPH
 OeavfqXh9Jbt4lxykueiDTAKlyoZVuC0y37TQTrlTuWA4i+kfSaXJ9xd4pzlSJYoPd4F9TWSpKJ
 C6LUcHwTm4JjIS62F4ZE6mCixbVZ+maVX+AgMq+TevbhorZxqU28WGabyxuUQgH3N2tbSdOBTUj
 cZvtbPrQCZ49VKMOCNENf+SLgIs5aTlUh7APLSo/nb6cV21kEYHeio9tv0ocbwY4UqWtEZb94e4
 9aMcZd0elVvgMkOy1xJokz+8eQ/dD6lY/5x9V5FTHygyHGZkNWlV/UwAsiOeUk18Cq8MpxsqvLD
 ld+5atOsoxy6ptsy3kw==
X-Proofpoint-ORIG-GUID: 3lbE-8OFNnMC-7YKfGiahucq-pWH5r9p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX7buZl8q09rcG
 85UmktdaS2t5h/EMcjlhJqXrrNH3pjC9MDK29u4akjsjsPyb6OfB1Ap5uhEjh06VV4npd6b2WnO
 nYqnL2V9Kbr0h+Ba08YrY8XI6pcWI8Y=
X-Proofpoint-GUID: 3lbE-8OFNnMC-7YKfGiahucq-pWH5r9p
X-Authority-Analysis: v=2.4 cv=UN1Ijyfy c=1 sm=1 tr=0 ts=6b0259e0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Isxxj8DTuwmncN1cjOwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220011

The Qualcomm Nord platform has four PCIe controllers (A/B/C/D) that can
operate either as root complex or as endpoint. The root-complex support
was added earlier; this series enables endpoint mode on top of it.

Bringing up endpoint mode touches several subsystems, so the series is
arranged as a set of generic, independently-useful changes followed by
the Nord-specific enablement:

Generic (useful to any platform, can be reviewed/applied on their own):
- PCI: epf-mhi: Pass the actual number of MSI vectors to pci_epc_set_msi()
     Fix a pre-existing double-encoding of the MSI count; a prerequisite
     for the MSI-X patch below to request the correct vector count.
- PCI: qcom-ep: Add MSI-X support
     Advertise an MSI-X-capable epc_features variant and route
     PCI_IRQ_MSIX in ->raise_irq(). No change for existing SoCs.
- PCI: dwc: Preserve glue-provided eDMA HDMA channel separation
     dw_pcie_edma_init_data() hardcoded the HDMA channel register
     separation (ch_space_sz) to 256 bytes, overwriting anything a glue
     driver programmed. Only apply the default when it is unset, so a
     glue driver can describe hardware that spaces the per-channel
     register blocks further apart. Builds on the recently merged
     Channel Separation support.
- PCI: epf-mhi: Add MSI-X support
     Let the MHI endpoint function raise MSI-X when the controller
     supports it, using a dedicated MSI-X BAR from an optional "msix"
     region. Falls back to MSI otherwise.
- phy: qcom: qmp-pcie: Add PCIe endpoint mode support
     Add a .set_mode() hook and an optional per-config EP-mode table
     delta, applied as a second pass over the PLL/TXRXZ/PCS blocks when
     the PHY is put into endpoint mode before power-on.

Nord-specific enablement:
  - dt-bindings: PCI: qcom-ep: Add Nord PCIe Endpoint
  - PCI: qcom-ep: Add Nord PCIe Endpoint controller support
    (HDMA, NO_SNOOP override, MHI RAM parity-check disable, MSI-X, and
     the 4K HDMA channel separation via edma.ch_space_sz)
  - PCI: epf-mhi: Add Nord endpoint support
  - bus: mhi: host: pci_generic: Add support for Qualcomm Nord
    (lets a Linux host enumerate and drive the Nord endpoint over MHI)
  - phy: qcom: qmp-pcie: Add Nord endpoint mode init sequences
  - arm64: dts: qcom: nord: Add PCIe endpoint nodes (disabled by default)

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Anvita T (2):
      PCI: qcom-ep: Add MSI-X support
      PCI: epf-mhi: Add MSI-X support

Krishna Chaitanya Chundru (9):
      PCI: epf-mhi: Pass the actual number of MSI vectors to pci_epc_set_msi()
      PCI: dwc: Preserve glue-provided eDMA HDMA channel separation
      phy: qcom: qmp-pcie: Add PCIe endpoint mode support
      phy: qcom: qmp-pcie: Add Nord endpoint mode init sequences
      dt-bindings: PCI: qcom-ep: Add Nord PCIe Endpoint
      PCI: qcom-ep: Add Nord PCIe Endpoint controller support
      PCI: epf-mhi: Add Nord endpoint support
      bus: mhi: host: pci_generic: Add support for Qualcomm Nord
      arm64: dts: qcom: nord: Add PCIe endpoint nodes

 .../devicetree/bindings/pci/qcom,pcie-ep.yaml      |  38 ++-
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi        | 369 +++++++++++++++++++++
 drivers/bus/mhi/host/pci_generic.c                 |  13 +
 drivers/pci/controller/dwc/pcie-designware.c       |   5 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c          |  33 ++
 drivers/pci/endpoint/functions/pci-epf-mhi.c       |  74 ++++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c  | 123 +++++++
 .../qualcomm/phy-qcom-qmp-qserdes-com-pcie-v6_40.h |   7 +
 8 files changed, 654 insertions(+), 8 deletions(-)
---
base-commit: f3ad6a695e245798f9a5bb34f2c7616880bac3d6
change-id: 20261027-nord_ep-f6e8d7b9c107

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

