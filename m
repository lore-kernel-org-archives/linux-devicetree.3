Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439854502F
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 21:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275986; cv=none; b=jB7qtNFLsZ8Mm791Lel2Q4FDvvKUdo3bA/Nk9CoPstYG+KMYyqxuTB6JeH0nhOfLnIrUyP12qkSgZfexePlvDpaNh70xTVK8kmwzgJr+x90sgiv1T4yYkRHIaa8Fg6tM5cQ+iB5oTwa27gK7kUqv+oJtBqGlEs4Tvg5TzMioZuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275986; c=relaxed/simple;
	bh=pCIGMlA/nMC5ncud5vvgUb8fb4QYErXq3W2kk7NW0Mc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CsQU0c2uqbTiOw4IhlUjReWz4htISLPrJBKUv9dDg6xIxftFXAIKuBekevHLGow38ocfS6MIivActUrtaJ7gz0+YCwMrzxv+XOemRGO+Jv6HXFEbcbHiuTPZfP2/QLNucf1QWX9n+Gt1xtIEh96i3LvwZXJRZQpH3nDHSLsSwKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+m5M1qT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDEgrnCN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+m5M1qT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDEgrnCN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G55FG1116855
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 21:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ishO0sGDv2e12plW9StdJroZu9Xzo2EbYqG
	B0f+M3M8=; b=l+m5M1qT3cR4+K1Toao4eL7iI9DEAg9lzroeZrfiA/h73eCraqM
	brJj8tWcAEELVWLz1ebnhtCwPTFIJKp0W/qgzEqO6+pwtAD4mcqDfAk1Cb6CidS4
	lsTzmWXAHrZAjqdBArEbF6O5vT/bw2dVwYJTT47aRl5CCYfFuTSa1ac+at9uhDBU
	Jpdk5RO//cHez6i0diRYQEilIXlF/X9ZNgxnAoWgvDY6bjCMenIcZoqSmfV7OhGC
	HtC0+lCqBdxk7stGcPl7ELFqGL09QIZ0brCryBCDi9IqGNlXRilSb94+OH9OADh5
	sicbCXienX+rA0bFKaEp1+z2BzQhPGgmo5w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k1ph0y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 21:33:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f3eb8f3419so9226766eec.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 14:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778275984; x=1778880784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ishO0sGDv2e12plW9StdJroZu9Xzo2EbYqGB0f+M3M8=;
        b=dDEgrnCNge7A9DuQRcuWygVd9Sn67Daqey3tedJfDhp/pABOmvIaJPjQ08RMDUdqIs
         x+wkFUUKjFtp5AABC+2Of4uFG0GcaZc2HuX39hmUfi+qRx3brCo4oI2FEWHDpkbT0QJh
         tSrg3SjRheUWCMBWPrgjFDQi/W8jZf5JrS2Uj9A6kvvKLTN+Yf0h6OjOVWm/bi1QVMxw
         9+iD8UAQ8qMJ07tFN+OoAiCCajGoIu0Qv9TO2DtC/wPvj2wdvamsSjMpwBuMUNXqtQZv
         bCgkZ0Qc6XFBbLxq7rf1wkTSBFPDIQEOVZUdfnDJ8+TSPQ2DPqtZRdxqZNVb5Vilnpu/
         URsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275984; x=1778880784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ishO0sGDv2e12plW9StdJroZu9Xzo2EbYqGB0f+M3M8=;
        b=h7aGnbFG2IAwy2AjyW7XIwxQmTtj2B7tFf6iVOv0XRKyrmrjJRzhb5C5ZlTE7m8T8+
         2TVBGrjqYs45nhKIEG137AcFrkWyBaSjUNWRLC9J6A08IK5i2DJzNmji5S8lImq117qM
         Dt4yxIDCUKH6R2ns/e/LEusBlkDWmtHtCx2FdR4eriZXL0braX92dc9h4aH6+9pGntob
         ESyZ6TX9GDcp1WQ0dvDxqJ2LiBZbs+bdbHkCKk2Tppa9OvRqMlK0eRvzJhXdUJQRE/5Y
         4QXZRYTjoLRnHuRE2+vDNxMkt00wwEBm/p+kd3zp3gDkZrR79F17bGGrLlq1RUHK94Er
         L3BA==
X-Forwarded-Encrypted: i=1; AFNElJ8+IMv8ENdO5Vpc0vRuMXaVg0c5pDwX9xvqZODY8fdkwvkQygqWrRxmnOzfQhd/jtLeg/T8JDIYoPDz@vger.kernel.org
X-Gm-Message-State: AOJu0YyH1yB1AzbiI3Zevg1CHQxC+Hbn2m0LuezKzgS+e36o1BC+EklK
	te1YA3f12MQ1vTGxK2pBsygfQZ8o0m6Sn8UEDjDckI0GV4ve8cqrhVztnhW6VOjrGLNN/C615e8
	WsyvoJjDY1q/0T2vJZJdK8LyPe4SGrvmOPN0+9ItKXJSQOsi8SNF42IV8OK/xdnmN
X-Gm-Gg: Acq92OFDrRih/weJoHJV861y2ug5xpAQ+ULKH4JyxL+X1hjGVidlko1fbDbrLAzNGuH
	WGfqGCi0sZ/SeuJxjuOGkKasK+Ku9TA/lEC0ITI25Zi9aPwzpA1Do/8DPTR2xpm5Mh264AmRHNP
	sIKutvEzq38k0p4pEazP5eIz6IDaUPhLpQT3UtP3V/Jr4YoCV/QfF7pvWMw+xj1fx6PKRbgp8lw
	dRx60pf0R4y6iwZ8BJG8+o9Xjo7+mgHchBPY4Lks/nmfjWvMo2iHMbw0yTl1a4Hq6CJHFoJGc+3
	H49UCokSn/EsSKnPHLnTwWcvnilkvGJPICCja63TIygwgfun3eRpZY/dQBQBKQ1+XJBbr9J2B7a
	13i+8UKWUq/nXclVYrpn4sXpza0stYPITihgwP2lEN9Rd2rPqcX2zH7m/3+u7PIkvon1FK3QdXS
	w=
X-Received: by 2002:a05:693c:2c97:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-2f54be949a5mr7815877eec.34.1778275983807;
        Fri, 08 May 2026 14:33:03 -0700 (PDT)
X-Received: by 2002:a05:693c:2c97:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-2f54be949a5mr7815852eec.34.1778275983281;
        Fri, 08 May 2026 14:33:03 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm4871285eec.27.2026.05.08.14.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:33:03 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com
Cc: wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] phy: qcom: Introduce USB support for Hawi
Date: Fri,  8 May 2026 14:32:30 -0700
Message-Id: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Z-I1JC6qX6lXIXTPp19qZCUdkLsxijDo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIxMyBTYWx0ZWRfX1lw+sPI3z1A5
 SLSsa7l9HtI8BuwqRNe3JJleRi4PqjoVdSGpMJ/+nV6MN8iMYzUcN0RI55gcgJLGfn2KI55rjvG
 l2emVRmbesLrNRldH07OKrXWvQdzlnp2VUb663hhyuoR2q4UcnWHuWlsOn8fhlX9GXbfTmfNy4C
 oF83o3hnUCugA+9160iympa31Vme2tkoHqap/FDllNUCMg/CIA7fVp324dCCK/UsSGMCeXvAaOm
 IuuRfcc93NaNqFW00csQiY/fx9rk+id0iv5+ibgm9yoJGhF0tOz2JLwdoFdvXu/zQwTdHoDUHhy
 gvhkHN2aM/RAv97e/V1rZhHNAV0bxVcneBpjsUvkPqfqvNdIZyMc1GxcqFo+M0ZzpLuG9UMfD7X
 NN7/Zowow4OUpbkbrREJO68OhsOF64Wa77AxnuZnRpKNa04FcuA0DfLzx8x1SBUgeFBPnelIWqq
 kMnPkHjdWNRK0eoGGlA==
X-Authority-Analysis: v=2.4 cv=COwamxrD c=1 sm=1 tr=0 ts=69fe5690 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fySfh4wnc5TE2N7XS4QA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Z-I1JC6qX6lXIXTPp19qZCUdkLsxijDo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080213

This series adds USB PHY support for the Hawi SoC. It documents the
QMP USB3-DP combo PHY and M31 eUSB2 PHY bindings, adds the Hawi
compatible to the DWC3 USB binding, and adds the PHY initialization
sequences to the qmp-combo driver.

---
Changes in v3:
- Fix missing version tag in individual patch subjects
- Link to v2: https://lore.kernel.org/all/20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com

Changes in v2:
- Clarify in the QMP PHY binding commit message why Hawi needs a
  dedicated compatible string vs previous targets
- Remove stray blank line in hawi_usb3_rx_tbl
- Link to v1: https://lore.kernel.org/all/20260425070002.348733-1-ronak.raheja@oss.qualcomm.com/

Ronak Raheja (4):
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
  dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
  dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
  phy: qualcomm: qmp-combo: Add support for Hawi SoC

 .../bindings/phy/qcom,m31-eusb2-phy.yaml      |   1 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |   2 +
 .../bindings/usb/qcom,snps-dwc3.yaml          |   3 +
 .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 231 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  34 +++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   |  89 +++++++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  89 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   5 +
 12 files changed, 512 insertions(+), 4 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h

-- 
2.34.1

