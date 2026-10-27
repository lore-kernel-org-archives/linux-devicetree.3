Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100725;
	b=R2SkPmxy3jOtdI2OT/bXbrlP4VVaRrGsXNWVxSM6kt5qmp+M9XhW/dzPcLfxpKxmdsbt
	 WariI8Wd8blNeYiA687LCjylW+8K3j2+LuA5xLVbb0CS5zI0TEV9QsXsGAmUvhUJlNqFE
	 VdWplm37D+w01AOCvMtRL93nRSbHDOXMNu2NU8hWlPmQxXEg/qHEUyhbyficyzxn0b514
	 QLR0CoLk6uLBSFp7sx1sSOyJ2on1uROBPI5CzVH2xM7qAsxLgLVKz3YETsle3ViaUyVFU
	 gjwtMm0MwQOOK/kRFacEpsmPnin48OpbM+B9OEXA43ExxmT6qztFyef9wQbujXQbDJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100725;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PwAgCMcgHnZ/bogI6CXw2isLPSLCqdg40Q4o+na34B8=;
	b=2yiqTGk9hax4PEpxsunWwnWMlFRAppqBiKiUyp7ZJoA77QsNcf/RU59DtLMnp/FgSmw6
	 3xfjuQO+I6OuFm0EenLjPQcG/EASdm7y5z2/dTPSO61eA+RFl2+GjEokA1dZFSz+0bM4I
	 38zDXFkIybMk5m/aFj9U35ABERQbX0M4M7TZf2nPv1jVTmBLT2K/XU7lGCa7laxlEgYv3
	 IidW8a/sfSeVFBzvNGhq305Hjmy2p2/YfN8ukwC8sm7V8O/6uT7+c9MPWw+zyUWcUWpER
	 cX7VfWlImD71wj+aI5r9kOdVd1aPJC3MMSEa049ItPGW1DlYw2IZ/V4cpT6KXJAGD0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LoTMbJfX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PF78dhdo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5C7606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF5C7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LoTMbJfX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PF78dhdo
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe5dD1922139
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PwAgCMcgHnZ/bogI6CXw2i
	sLPSLCqdg40Q4o+na34B8=; b=LoTMbJfXZjrpd7mVhKr3QW/qTk66GJX1CG9xSM
	Bony8VnhGl8rru8bIZXYw2juN8AyH76Eut6aQLxVRsJ/nps0FMdCgLyooY0MexGA
	J+fNBObaQBUpsfPakET/WbnbxCDA/FaGxkDQds+A0ANVNPKWzSO5mzxkxbUv+rsk
	kv+LX48JEco75Pw5aqmVbbvoKrFmP8QtrZh2vQeZnvTukZXdnPJ94e4vR/N2s/bA
	BpDvfrnbh+vOShqMLaGYNlFZLVrfYSFI82yAjw5grHBXkL0Z6cnxj8MW7tC/WgNB
	2SBBm/AvTj34bVrEfkLAoIDLdCMUqtbXU9Q0tiPo480ekPEQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq68mvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:32:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd8b299b0abso2216797a12.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100722; x=1793705522; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PwAgCMcgHnZ/bogI6CXw2isLPSLCqdg40Q4o+na34B8=;
        b=PF78dhdoHGmlaICc5CHVRdQyGAG9jJBT29ET1KcG5xyJh828M8qyjp/5Q8PKLTBSfL
         TI7a1YgCoh/tNedkyy2yP2zqKe77ExlgBlcbqFXpFwVNmHEf+wS2Bvlj0vDFnFF9JwuN
         w/1DZWVByuCqtXMA8Y2wXXig4RnGZ4lBAdBfswkX9wq+zqVvX44ja5/EJpQR5bRVpDu8
         mfULcUYx3svTTVTgcpPSpfsR7NcEmDY/00Zp2f7lbOIA4/px7AWer1IGc7wOBBsFwm3e
         XU39hsD/GSXpkBMN97XlR23PtWAJRLL+YyP/BNNRKx1TOCtyIvOhXOVySia4AxeIJUpr
         wPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100722; x=1793705522;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PwAgCMcgHnZ/bogI6CXw2isLPSLCqdg40Q4o+na34B8=;
        b=TuxRfmp5/7Y2hpqrww9ZyNx/j1aa6HlL/J3oORlq8D1wmdl/XOG1Nh0oc+WeGiY7JP
         lXtGxzc4GbuAbvNtnwMYRilxVY5azXHG2wNVuQYMP4IufjmMQr+9ja4ffWy+/VUR5CyR
         FRy/es9TfbP5Vaq7gjSN+bk+1aEyyiF5kYDphY3REMdzCItWU3gWJS2Nz1WqmEBREaJp
         50cSWB1TS2jqJG07hxVbg+GCcUYNdhrnAoiggoS4cRPonp6t7yvM0gofFd9MW56AvH0e
         31r16mQMEXI2oZWL4r/d9pnuEwNwnUDWfRzwiCVZsW3vfwcTiUdDSio5lkZLJXh8GOzn
         pxwA==
X-Forwarded-Encrypted: i=1; AKwUvBw99KvEAmHis0QQWvFVeK3oSrG5KumfvccV5QhUdt2a0vU/SCKyqBtgAaC0nGbOz6cUcofVrZkcdcfK@vger.kernel.org
X-Gm-Message-State: AFq9FYJl7SYox81D4m9tfgNAwXm45HePx13trYfmZa3+5gKZmMY0eC2e
	OGpTHewrnBLwXPV4/9vs0GHC09ia7ABldSAUEETxUULMfkGT8ejy0lZLgkduMfkTBmxR4ydyRYo
	/zW1cPiCXwJBdZGxe9m8ZlnukA0sw3pgjIBhd0xyxkzi1Uq5f+Hb3cCWIrJ2kgkPL
X-Gm-Gg: AYBFou1Ye9V6ig5JsfTrpeeWcQs50ZDCPq5QuBtbiUeAAHm6Rg+14V7KFfqZJmuvS0b
	KUymgwokG7hR7hg1rdTMe7e/K/OrPJzRtr9tivQmJcomUBTC+bkbdmzjAEt45jRUsvQQfQ1pFpw
	j5w95sACP6VE+osSnYrWa24EyZyo7FZlxPirVK4wS+vnF+CoSgx8lfn4ENNz9ii5qhiRkKJhHxj
	r8M2MKT2OT8C01RN8GhCtisPuHPZlZS42/WmJLPstiEHY+kysWCwY1MgHGoTBkvS6Xq5mnE4yhi
	vaePWzJjBWb+1sKvCjMnTe7agEjna3oPNGyqPEWJvKOW1ri9UI2tXU+2O5tSzWI0/fVo3iu938H
	mmOe73P5Xyf2gDgksJldBLSB3VREM1+45PMOFPkb4xIz5RSyI22l84czCuypFFcxlcrFkog==
X-Received: by 2002:a05:6a20:3ca3:b0:3e2:c75:2349 with SMTP id adf61e73a8af0-3e7af7e9a5bmr7938451637.8.1793100722400;
        Tue, 27 Oct 2026 04:32:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca3:b0:3e2:c75:2349 with SMTP id adf61e73a8af0-3e7af7e9a5bmr7938416637.8.1793100721910;
        Tue, 27 Oct 2026 04:32:01 -0700 (PDT)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c0fefa3sm2143836b3a.51.2026.10.27.04.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:01 -0700 (PDT)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add support for Talos Lyra EVK board
Date: Tue, 27 Oct 2026 17:01:54 +0530
Message-Id: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAKqL4GoC/22O0Q6CMAxFf4Xs2RIYguCT/2F42EaRKTBdgUAI/
 +6GPJo0Te5te25XRmg1ErsGK7M4adKmdyI5BUw1on8g6MppxiOexVF0gUG0hqBdrACcXjBxQI5
 pnovkXGcVc3dvi7Wed+a9/Gka5RPV4EF+QwpCkFb0qvFWj/MAR0Dh542mwdhlf2rinnPkx/xPv
 qsIKqWKJM5QyrS4GaLwM4pWma4LXWPltm1fS//yBusAAAA=
X-Change-ID: 20261007-talos-lyra-evk-v2-e2e588a34f6d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae08bb3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=XRYUP8yNB-fVxFRa9e4A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: g8Xts4Yq3LD23lABLdcK9VZbdmGI5Zos
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX648bvbcvihiy
 zSUEzuKp4G0xJX5bCjSxBt8LXCrTjL9ITNrTfG7owwWru52i6mUU9mMk41R47HOx1EmEu4st3r1
 NF5LyKJPPynMAV2sdyjcOJJjvErvEsg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXx2TMCX3ex6r/
 fJmRl8XNVdd1ABM2k8O2s395YEjoEPtvMpmHT55DokGMQP7nR8NckHxg6+STcnLUeGMvyk3Tfcq
 0uTUmOdIGVhxhLXXoTSenYk/3IUu2X6voCCIzyLn3Aow206D0+MjcPprt3y0+lEkc0SEhnB/hap
 IEZn2uxCVTQZ+ED5myKlSY7lE7YW64XOKsSVcMqwNSrLT/3H05N4T4BwGlX/RhsQAQeHw8vxir6
 dVWHzES8gy/+d0PSrGHxCJ37vI+ElHhN0UPsGGyQP58nTj1nOTw3IXfcRpowRlbRCD0bVY5Jn2S
 jd88iMDxV727ZnqFdcXNrWo9yuy4Cmm1AiOE1PMxNV53XH5VZeG7HT0WJVSpoLmzMdxVonyaJ2C
 iGziNTIYaDadmmrj7tvMwkjiBwiIzs6Q5q6vbwI58FHMxb+oweLC5P1k7hzHaZRDwwi2vB55cQ+
 Mx1riU8iAwBahzm4x7A==
X-Proofpoint-ORIG-GUID: g8Xts4Yq3LD23lABLdcK9VZbdmGI5Zos
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

This series continues work originally posted by Avaneesh Kumar Dwivedi [1].

This series adds initial device tree support for the Talos Lyra EVK,
a QCS615-based System on Module (SoM) paired with a carrier board.

The Talos Lyra SoM is a compact compute module integrating the QCS615 SoC,
PMICs, memory, and essential connectivity. It is designed to be paired with
multiple carrier boards to support different use cases.

Talos Lyra is a distinct SoM revision of the existing Talos EVK SoM. The
key differences are:
  - Adds Apache (Lite-on-Module) WLAN on SoC Card.
  - Removes SPI-attached CAN transceiver module.
  - SDC2 on the existing Talos SoM supported SDIO-based WLAN; it is now
    used for the SD card connector only.

Note: The following are not included in this series and will be posted
as follow-ups:
  - WLAN node
  - USB Type-C OTG role switching via CYPD6129 controller (OTG support,
    VBUS supply management). USB controllers are set to peripheral/host
    for initial bring-up only.

[1] Link: https://lore.kernel.org/r/20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com

Changes in v3:
- Remove inapplicable Tested-by from dt-bindings patch
- Fix DP HPD: use native pinctrl in mdss_dp0 instead of hpd-gpios in dp0-connector
- Fix model string: capitalize "Lyra"
- Squash EL2 overlay Makefile changes into board DTS patch
- Move USB PHY supply nodes to SoM DTSI (supplies are SoM PMIC-routed)
- Sort &node overrides alphabetically in board DTS (&tlmm before &usb_*)
- Reword dt-bindings commit message: clarify board/SoM relationship and explain absence of SoM-specific compatible
- Link to v2: https://patch.msgid.link/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com

Changes in v2:
  - Drop qcom,talos-lyra-evk-som compatible from the binding; group
    qcom,talos-lyra-evk under the existing talos-evk block instead
  - Remove unused regulators vreg_s3a (smps3), vreg_s5a (smps5) and
    vreg_s6a (smps6) from the SoM device tree
  - Update board compatible string to remove qcom,talos-lyra-evk-som
  - Add "talos:" subsystem prefix to patches 2 and 3 subjects
  - Set initial-mode to HPM for all LDOs (ldo3, ldo11, ldo13, ldo15, ldo16)
  - Add EL2 overlay for talos-lyra-evk as a separate patch (patch 4)

Changes in v1:
  - dt-bindings for the Talos Lyra EVK board.
  - Talos Lyra SoM DTSI with PMIC, regulators, storage (UFS/SD),
    QUPv3 instances, ADSP/CDSP remoteprocs, and GPU definitions.
  - Talos Lyra EVK board DTS enabling DisplayPort, GPIO expanders,
    SPI-attached TPM (ST33), and USB on the carrier board.

Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
Avaneesh Kumar Dwivedi (3):
      dt-bindings: arm: qcom: Add Talos Lyra EVK board
      arm64: dts: qcom: talos: Add Talos Lyra EVK SoM platform
      arm64: dts: qcom: talos: Add Talos Lyra EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml  |   1 +
 arch/arm64/boot/dts/qcom/Makefile                |   5 +
 arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi | 281 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts      | 115 ++++++++++
 4 files changed, 402 insertions(+)
---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261007-talos-lyra-evk-v2-e2e588a34f6d

Best regards,
--  
Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>

