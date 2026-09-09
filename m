Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5137C5328A3
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 11:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954519; cv=none; b=SYb7pSXXGrASojpXQijLCOJ4JMYuUduZEoJCI1Nv8ZJscsSSTrbyfyjXHHW8YZIvjcy1cNOewkDXDUKxMErQrgfWItVdf0JKQZPtoJ1XoUXkOjwElBGGdT4n41iIjUcjdVSjLVgQrIpLSAfTyWYjkiLZN8DAGPbIMXF8qBqArY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954519; c=relaxed/simple;
	bh=QOH9VKcTjY4fR2PU9QKFwEi3IrUNdtI6tTSaKUmMsSE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LbHM5JjixXxXDO3yalQzAXErKoWLTeyjOnjGg0wFNzmVz9IJrsKk/yOtoNlQOf+00W+cxepyygT3CLRpGzvAlzENhiWnzjUH9kVrJxA2ogFOtYEH9ANuIx3f3TIpX0RHUtDqrjr5FG0hVWh0N/6VF9JnsoftTNaU/mK25HL+kB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c28PXU+9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6ljffh1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c28PXU+9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6ljffh1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUbOK2019807
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 11:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Mquv4bvtnPno64YDX0x59O
	34H98rzwKzFq0G//K2ahY=; b=c28PXU+9BHslQ80MzI50lJD6r16ZlkoABtsPeC
	7btrNYS4ihawUS2vMZpNXjg3CYrrICdbyFt5n2dAt2LIoE/3gy+cdFcCPcGrkbEF
	RNV6qMILYQI2Bk9OUD90SS2uXDMzOBo/5oUxikt+0jLv3Kgji+O+u7bxxvTjk6ZI
	vjis3Uotyvfk3lsUtpe4hdFwVhdEsPFpsjB4iR8fgXTAunPNMTCRLOwsx+WHm5Sn
	qxVSLp9C/h6KA/HzhzsBrANuzAHPner+eEfEy40cZSuc7QvbBplLnjI7xIgZt3A3
	utMAYcmXJxKrsuSOSBr4Ej+zFDn7aZTRQPFyK+g/zuU4H/lA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x869p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 11:48:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b90cc0d5cso3112646a91.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 04:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954515; x=1789559315; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mquv4bvtnPno64YDX0x59O34H98rzwKzFq0G//K2ahY=;
        b=F6ljffh1XgWDbRxxygz8dfhrfUXN+v/kR5fA768D0uL1vD9CBrIe/pAeAcXwU1p3W7
         h8/nrEpzNa9GAncjxqaaaJbJVeBpbRTiitwr1PKR3hQdJOecXdlRXDLfN8JzAP670LBQ
         JmZg6kqQeCDo0Op4oufqc1U4o7pz1knZt4NFIjvBwmjCvSYzKL7vX1kO3wDy9IzJdqlW
         utwKUydAgSR2jIo9ZvZWCZeLDnc/XdJWgMMzReVDE5fctRZ4p33mCLsgrxo76l2WkR2l
         CD0VfrghpxiWBhs9/rCPX3VFCrd/mHZ82S+EnymEP/ecwPBgKmBKMU712U9/gPg7WiQc
         fPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954515; x=1789559315;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mquv4bvtnPno64YDX0x59O34H98rzwKzFq0G//K2ahY=;
        b=FqqWgFn2MNZj1qSjyjswa0JpG1pFTuuqnrvbE7l6GXWurafdV+8dig5aTMTMt2pQg+
         zdM6yaWPo74Z6lZL4I+lvvOW6bzPbXdPK4WtLr62KXU022XmtVhfYobDzX2OHVE5sFUo
         EafS9ERee8oHwj8bfDl4yCUQYcAJk+IC68le1EIa4e6g3JBUFs27Mz1eTL1ndm5FfvJN
         4RLL7/Cl6jYaZQ8g9a7AtJVGI5udQW8ZNkqKdHU0pGhvUeTl3pbC839+bdPpMHRYkB9C
         WnLrHlV78d3SLkU2FdE4/HIb7Ck8K66sNId9cHteCO/AFif6/F8thogCrLiMEZHT4cMh
         0LYA==
X-Forwarded-Encrypted: i=1; AKwUvBz4skeUakzWVIkf5Fuo3IA/m9hle+YoiJQ1Oe4dBmLArVCj1ecobzAzwQrowhAai9FtADrCCe+xYwsV@vger.kernel.org
X-Gm-Message-State: AFuF++nvdhoEL1/EI/xhloqpeoX/80TG9/f5G+OY0qgQv0LnAUu7zre/
	yC1PeH7QzNARjg8GT5CW9tGhHV+NTycEKpAdM00WaTl45HcvyY0bTlAZzxiVbL16cXIWrYeZMz0
	ue6rudTlFlubBKvaw7zsokhoHtLq1Y33rdPE6U6X3aSplogpjCWj7YfOKy/7qaTOI
X-Gm-Gg: AYBFou0d63co+M3TR5cREAQJ9e76/8t3/yqXtVa6MxdKDPyGjHkQhKZfUhpvRuzGg2j
	Fy9vGkwaYgxLkHbx6YvMwg2jw6mPR8tMK08p4Zdt4tzeuiJBrBc2LvOMmMlHPW5wWAmX38e22Ri
	2RjI4s7eHoCz4uJuzbCVoSl9/RA6IIQ0CUiT8Dkn6y0gw/nMBh9/+bksQ0xlUVKsGci/eeaIwx1
	227P8yxWUopLd3lfJU+y1Uo/I+N5uBwNQ24+E+uvK55MmDWLklbHrYDs1B6bFqmXRkoUS68vJ/8
	5IbwBG6v6t1oxI6NokiuQuKR++2IARfWAjjtX/jWylSWQlBvC3WZVLxUgtGnXgo/VBoZfN6lRTf
	XY4dx8VaIcow2RoSNdE7+XeDCZWkIQ/BCVnA=
X-Received: by 2002:a17:90b:2d07:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-39b262abd26mr51142954a91.25.1788954514305;
        Wed, 09 Sep 2026 04:48:34 -0700 (PDT)
X-Received: by 2002:a17:90b:2d07:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-39b262abd26mr51142876a91.25.1788954513683;
        Wed, 09 Sep 2026 04:48:33 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm50156857eec.21.2026.09.09.04.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:48:33 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v3 0/5] Add PCIe support for Qualcomm Nord platform
Date: Wed, 09 Sep 2026 17:18:15 +0530
Message-Id: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH9HoWoC/22OSw6CMBRFt0I6tqQt0I8j92EcUNpKjVJtgWgIe
 7cFBiQ6eclN7jn3TSBob3UAx2wCXo82WNfFUBwy0LR1d9XQqpgBQYQijhHsnFewpJgjYbCqag1
 i9em1se9Fc76sOQzypps+sanR2tA7/1l2Rpx6m5KUq3LEEEFBhSwYk4gVxcmFkL+G+t64xyOPJ
 2k2ptoxrEHEEMkZrepfJn0zkv0e31gSWcylqYTCQlHzh53n+QsrnqtZIQEAAA==
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
        linux-pci@vger.kernel.org, shengchao.guo@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788954507; l=4014;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=QOH9VKcTjY4fR2PU9QKFwEi3IrUNdtI6tTSaKUmMsSE=;
 b=auKGTwrVv5IN7itNtVlGJ1e8h5srMRxNRaR4A0lEnaQrxsFjIB3M/XkPmP3CFE1mOItWGseV9
 LouQTPgNx61AkZAiSmXHVZ/ulkKoCvm/xdTjk0yknOiZrgOO3xhEO+K
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX3QcRCCypa1Ls
 vPbs1y9W9BlMPRcfFHTTNHVCR+xmz3egaHBxGuu7DQ/IIVtfNirZH90cLt9vjTSeMzVZDWrQ39S
 +LO5mTFXAhDVu/p2hJqyWjazR/Su/pY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX9fpkTU6WM7gh
 n127tzY9oSuSYdGf/+pS+v0Sbz187mqQsKPK5uIEFN5mfnk6FySp0mdLt39leYWJefntDVotd1m
 NaIhimhQ6XvaSr7fVaf7pLUQveu6dfkIDi89mxKJR/CEkUIxVufEkvsyv24AGSOqaVIbNvNIfKz
 2smdw/Do4Y916lTCk6suvqMy1nWkbQKJJ5Aa8rbofxBqudvzXp6smJRcgVl9eNz5ixfOwHjX3jh
 yhjzOi56E32JiXQ57ANWX/jUtwQASioiAyOO3t1SvnYoj6XrimR1wbW4LZiEm2ETuiOOL1i9thk
 L8ters+wFyT2HIPtSCbGQzaSwsjOvkDor/EGvReb+6kbW282a8oMAIeRSwT5Or2i9/brmYJrNnA
 Ec62ewJ2yqHMB53WjXSYlN5++Tz9expJMY6HLEo6FlUWccfmniOhD6t9rKCr+lr3eRydeeQn2cZ
 fYRlZSy3rE7r1ZjlnJg==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa14793 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=1XWaLZrsAAAA:8 a=P-IC7800AAAA:8 a=JfrnYn6hAAAA:8 a=_HC7VgZuvUK4spJUPywA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: FInRHji6aSehQAAc6VQp9NP7QBvLE6_d
X-Proofpoint-GUID: FInRHji6aSehQAAc6VQp9NP7QBvLE6_d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

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
Cc: shengchao.guo@oss.qualcomm.com

---
Changes in v3:
- change the name to quadfurcated phy (Konrad).
- remove min items and change clocks order (Krzysztof).
- Factor out the common config and create overlays & try to use common
  symbols for glymur and nord (Konrad).
- create  qphy_setbit and qphy_clrbit (Qiang Yu).
- and in qmp_pcie_exit() apply settings only when nocsr is present (Qiang Yu).
- Link to v2: https://patch.msgid.link/20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com

Changes in v2:
- Fix dtbinding errors (Krzysztof)
- Link to v1: https://patch.msgid.link/20260825-nord-v1-0-7c02f2b8765a@oss.qualcomm.com

---
Krishna Chaitanya Chundru (5):
      dt-bindings: phy: qcom: add Nord QMP PCIe PHY binding
      dt-bindings: pci: qcom: add Nord PCIe controller compatible
      PCI: qcom: Add CGC disable workaround for Nord PCIe
      phy: qcom: qmp: Move qphy_setbits/clrbits/checkbits to common header
      phy: qcom: qmp-pcie: Add Nord Gen5x16 PCIe multi-PHY support

 .../devicetree/bindings/pci/qcom,pcie-sa8775p.yaml |   1 +
 .../phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml        | 272 ++++++
 drivers/pci/controller/dwc/pcie-qcom.c             |  16 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          |  24 -
 drivers/phy/qualcomm/phy-qcom-qmp-common.h         |  32 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c   |  24 -
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c  | 938 +++++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |  32 -
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6_40.h |  56 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_40.h      |  14 +
 .../qualcomm/phy-qcom-qmp-qserdes-com-pcie-v6_40.h |  94 +++
 .../phy-qcom-qmp-qserdes-txrxz-pcie-v6_40.h        | 194 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            |  24 -
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            |  24 -
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           |  24 -
 15 files changed, 1543 insertions(+), 226 deletions(-)
---
base-commit: 1550287484d29e68055ae4acf52d9324835ef9c1
change-id: 20260810-nord-461809f1d5ae

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

