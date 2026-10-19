Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA686390CB8
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401930; cv=none; b=l6eqv18tVqd9KYXS4RrAGjxt69ZVyQut4H5qerkwxGSaxMkXIfiNIbG4dHfgzUMin4WVlLE42aicY5tUT5uQ+bbrKQuSp0HnUtIiOWAcL50SrFPcM/fbzZe8W/8LcqP6Sw+wJrjV7PtH+7+EOtCPXrXiaLzdsZfjO4jn8Zsn/qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401930; c=relaxed/simple;
	bh=UzSDvDLHIR8vUD/PBF+z84UxETXjLN+aGG5mAf6AxMw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pw7O0lVD/X79wSykYx4dyyfCbp9ZLTkSF2COEZ2v0BvbAQgnO3WZ7woBsu4DkIrZCu9qUrQ8dmNhDK5vC49lQ5UXIcBQtZ/neCE/xLuZr1TUgbfn1/F0mLXD5LY5OQUSqtsJmwyjVhQznjNeaHhqswgzd9fpZAgjolPe1/x6B9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqqz0XSA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpUyemUl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqqz0XSA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gpUyemUl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PCkg2193383
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EKRFsN8rnMk022/cD31rwX
	WBBc2zyHwGF5EAKF+r0uU=; b=pqqz0XSAkxyEKEXTnfiSjPKcE+uvf8TUJkj+UK
	o7tJ+gJxbcmynZ5K3ytgKWTLBftryrcf1bd7Bh4Dm0uRrGyvv+9ZHgSrXWwbd9yR
	tv34CSZSkkfzJKGj0HXcmyKweDVocVBKHm5yz2rr4oVVIoBsfx48UGjWLU4cUjgR
	c0sjYprxKz0N1ZLKyZoZKbndZUCHZyHgtl/KQfkj2eEIk57ff4Jo3OG0DcbXZnI2
	gF+jwxThJ7cCtw2YWnJ6UZuFep8TBeh0/terMK5G+TLxeqrDMgB+2KMSQGwKwoZq
	fuZliSFQQJj59IROGk4YfHLUqvt0PYwOMddQ5OREeE6q9xiw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w1a140-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:25:27 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso3852896c88.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401927; x=1793006727; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EKRFsN8rnMk022/cD31rwXWBBc2zyHwGF5EAKF+r0uU=;
        b=gpUyemUl8IGOKS+JJLOB3DrI7V08/A/c3mq5iugTRuD2+MCdHpA+9nEi04isJSt7xl
         qCUGcSY8zdNbTKGB7EKiUUwMxRqtLqDyD96AVUWoD9ZMOZK0S63niuiJgnO/9Z8BFlI4
         FtI/U/Vgni98V5aekDCnoiawAXt3apfk2BMOKqyGcIncrAAanrE9203oph2PiR7zyvF6
         tvWsReV7tCiqPGQN1i3BxuRRs1eC91AWBhV+cdMRmhrrDSyBmdwJz4oSxewARgeAfRqM
         FcQjSMdyjv7Sja9YOtgdACEQx+l3ZXz8+N2QalbiW0NHjOWoGAwqktQW5Qc7y/9Fl/Cc
         nlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401927; x=1793006727;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EKRFsN8rnMk022/cD31rwXWBBc2zyHwGF5EAKF+r0uU=;
        b=peJQ6Ze1VZDWYN8jHBkdBO3aMYvgboFuawxOYb3E+baSFZYtQpFrZu68AtPc/o3aDC
         mqpZNiukfBImFeYEac0YtGIUmVxkjoVY9C1OUPkYU7sodM7dPT1+7+x9jYm5GxAZRxWU
         OuM6L7brT/dpga3LkHPmw0sansSm2XNe3nl5tp/QMvqovqeL+RnkOnUhVTnAm3RcliN7
         pvCqOwhLHwjyUDzZ7fVZQ4hRj8kKp7FNDf/YSyH/w0Vy7PO/dafpaeBjryYi0M1RoEcQ
         otwy/WtArE7mN0r+FUynrPxohpszqWqgiHknKnufEgandSe64ThsplTI23H6iA1aoTrE
         eVFg==
X-Forwarded-Encrypted: i=1; AKwUvBzfpFv9+rB/9jeeUAlaWLUch3wUFYOHyGagRHJpWrnpms9CSCrlxFrk4B45tH2lymg31X9OxOiTeYhv@vger.kernel.org
X-Gm-Message-State: AFq9FYKCLLVisfkV1+hpHsdlIu12IB2iju0ZH2YKXkcW/Oew2efmmHMQ
	0OT1u6NWK50U9Sv49tSXQb1BQQCBWRGCQ4JgYeLboYiC169zRS0Bw7YfiMGLlLEJvZBbZbJExAR
	7ShJn0QSMr7HEOYtMO9D5kiWqEbNbLBXjWfUsiiVVNpNy8kuvRpS4zD25mwv5PiDa
X-Gm-Gg: AYBFou2FkTxbJmxhUXVj5MF9952c2ZHQglBrWt7likGwnR7kOiEOxhzbKDSkKrum7lR
	FGPy4AzaeWxwjPBwDHsYlbG9rSiugqPz0R21PxdtnbyqZdDn4OaxycVendVkBg0Sl5enFRWIBdW
	B+WYwV1PZsuERLLanNhJUJrE1ECpU62cuAtD+JIp9rSiWCK5jFzx4hKpAh04+NSJXcY0Lcssuf0
	6SyZ2kwpzjHFSldxOOZcJzmahM3WR4vsZz9YMJZoiNUvF/hg7uU+25GqnA1gR9DmuaJP564yF8y
	MHL1JOxA2u7LjB//VY4l3VS/9MaiO9FMD226SJDIyFhbJvD7/KjjU06OagYiJQnEedoGOPMTB7H
	k8aKLwp4JBOmp66cRMBmhbWEnAlWR5QcEdw==
X-Received: by 2002:a05:7022:2097:b0:143:46a6:b01f with SMTP id a92af1059eb24-185131078e1mr11974398c88.31.1792401926419;
        Mon, 19 Oct 2026 02:25:26 -0700 (PDT)
X-Received: by 2002:a05:7022:2097:b0:143:46a6:b01f with SMTP id a92af1059eb24-185131078e1mr11974369c88.31.1792401925745;
        Mon, 19 Oct 2026 02:25:25 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm26682584c88.21.2026.10.19.02.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:25:25 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/6] PCI: qcom-ep: Add PCIe Endpoint support for Monaco
Date: Mon, 19 Oct 2026 14:55:08 +0530
Message-Id: <20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPTh1WoC/02Nyw6CMBBFf4XM2pK2PoKu/A9DTDtMpUYodoBoC
 P9uQRdubnKSk3MnYIqeGE7ZBJFGzz60CfQmA6xNeyPhq8SgpT7IoypEE1qD4UqdcFbtnHGVJER
 IfhfJ+dfaupRf5sHeCfslsBi15z7E93o2qsX7dbX6645KSHHY4l4X2llZ2XNgzp+DeWBomjwNl
 PM8fwC7j2WOuwAAAA==
X-Change-ID: 20260918-monaco_ep-fb14fafd0ecc
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792401919; l=3328;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=UzSDvDLHIR8vUD/PBF+z84UxETXjLN+aGG5mAf6AxMw=;
 b=bryinFnw5NCiqJHL8v/CpYKB6l3W2+oZ/5pLQk1mj3MrBtN2HGUDcFDKTsTU/Wd2enwXYRCI6
 QXqkSi7gwv8Bpzb7Tbzx2fcadlYuQLSE9hFfDqROS1WL0GJ2sfzMAIP
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfXyG1Tq+Rse/va
 qaTnhmO6seK6fNHCNyiCy8g/XcoArgq8xtyZ0yMyvALd8eHLAowIbB1KPxgd+Lc20vTm2wPH+C3
 qPrl77H76+w7ePnRGUAxwHzih6PH6Yg=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad5e207 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=adqygFarq3v0-pgez_gA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfX9wWP/ErtuP/R
 xdqYXgeZ9t4kOo71RSYfnLH7pCm5k1xhlVxZFJHBVkqqg1367USKfQ5VwMgRu6bDb5rbKlRQ0GQ
 nGZV0Kmld1h/nxtlpxMuH+4rrnqpQOjKzCR5c+M22yE+ltnaTpVdJrAC3e+WjUjDOqEctYJYXpr
 Dk8HJGG51XAclTyFBFOhNg6aBaqp3INENHbQ2ItF+ROYnCv0U6hbSC+OzTpOtjwAUwNa+weh3C0
 crcuDDlT5sxTAPmMHlDQpieXyTYzQDCkE2dfNE9U7Ji02MHofclYFleV0LCvFEkUTPQKvGf3DqV
 YlRrQFY+Z0sRBFRegxxpAiPsDkqEscrIcUF8alCgqCmLVj/ObH+vh8NrxlVCMhTze3EvEGtLNLu
 9a+5fFvjoXXvxSMig9A2yx6jZ8VpE3pBnuqDTs1pOsXWdk+pneX6+gmvvisCYGY1FKeAY322Ckz
 gdLId7mifoH+DNqSfTA==
X-Proofpoint-ORIG-GUID: rEMEReJNvBYQ6UZ1mBlctYBLxN2eDaZn
X-Proofpoint-GUID: rEMEReJNvBYQ6UZ1mBlctYBLxN2eDaZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190037

This series adds PCIe Endpoint mode support for the Monaco (QCS8300)
SoC, which has two PCIe controllers capable of operating as Endpoints.

- Patch 1 documents the dedicated 16 GT/s x4 QMP PCIe PHY compatible
  for QCS8300, correcting an earlier gap where this PHY variant had no
  QCS8300-specific compatible of its own.
- Patch 2 documents the QCS8300 compatible for the PCIe Endpoint
  controller binding, with SA8775P as its fallback.
- Patch 3 adds the corresponding Endpoint PHY register configuration
  to the QMP PCIe PHY driver, reusing the existing SA8775P programming
  for the 16 GT/s x2 PHY and adding a new configuration for the 16
  GT/s x4 PHY.
- Patch 4 fixes clock-enable ordering in the qcom-ep controller driver:
  some platforms require the interconnect bandwidth vote to be set
  before enabling clocks, otherwise certain clocks can get stuck off.
- Patch 5 fixes the existing pcie1_phy node's compatible string to
  list the new QCS8300-specific compatible first, ahead of the
  SA8775P fallback, matching the order used elsewhere in this series.
- Patch 6 adds the Endpoint device tree nodes for both Monaco PCIe
  controllers, covering register regions, clocks, interrupts,
  interconnects, IOMMU mappings, resets, power domains, and PHY
  connections.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
  -  dt-bindings: PCI: qcom-ep: Drop qcs8300 compatible from the standalone
    enum list(Krzysztof)
  - PCI: qcom-ep: Fix qcom_pcie_disable_resources() to tear down resources
    in strict LIFO order (phy -> clocks -> interconnect bandwidth),
    matching the enable path's error-unwind sequence. (Sashiko AI review)
  - arm64: qcom: monaco: Add reset-gpios and wake-gpios to the pcie0_ep and
    pcie1_ep nodes so the EP driver owns and correctly manages the PERST#
    and WAKE# lines; drop the output-low override from the wake-pins
    pinctrl state that was permanently asserting WAKE#. (Sashiko AI review)
  - phy: qcom: qmp-pcie: Reword commit message to clarify the new RX
    tuning sequence for the 16 GT/s x4 PHY is common to RC and EP modes,
    not EP-only.
- Link to v1: https://patch.msgid.link/20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com

---
Krishna Chaitanya Chundru (6):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add qcs8300 16 GT/s PHY
      dt-bindings: PCI: qcom-ep: Add QCS8300 compatible
      phy: qcom: qmp-pcie: Add endpoint PHY configuration for QCS8300
      PCI: qcom-ep: Set initial interconnect bandwidth before enabling clocks
      arm64: qcom: monaco: Fix pcie1_phy compatible to list qcs8300 first
      arm64: qcom: monaco: Add PCIe Endpoint nodes

 .../devicetree/bindings/pci/qcom,pcie-ep.yaml      |   4 +
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |  87 ++++++------
 arch/arm64/boot/dts/qcom/monaco.dtsi               | 150 ++++++++++++++++++++-
 drivers/pci/controller/dwc/pcie-qcom-ep.c          |  36 ++---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 105 +++++++++++++++
 5 files changed, 322 insertions(+), 60 deletions(-)
---
base-commit: 0927a1e73df63eda38bb120b91e50d746d640e17
change-id: 20260918-monaco_ep-fb14fafd0ecc

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

