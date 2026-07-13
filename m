Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F39D30BB80
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954441; cv=none; b=ftAsKVLzbFHpjVBEuqOJUqX76CF1CEYS8Ofq2m53a0Pkoo1A3Te9ZUlsD5tfA2ZRvaqlB7chHt/H0N/k2cEnUDU5Bz3bsAsGmMSlFLO2BPf2LYW/s9/cpTegQ+8mRKXxvdXyAuGaL7OpyoKbxagV1DmA1V5XSTTEDaX1+bCG5iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954441; c=relaxed/simple;
	bh=4fcQr0jeSwmpMk6DRW2VMZ0mX2RGcG1k3mY0pYm91I4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iNYsG7zW0pLYTuiP4dhRVG09N30Q8g6C+6J4UPwnq7AveuhkGJiuvzyZwNPR5z7F60NNWUmybQniwasZ1ucHjxoPySRzvXRqZsbsw3vTgYk8JefyMv2q6nbOxF7jjOrXhijEdSy7t7bhxMVeYUfaa9+en4PYHhyb2ejrt417Ogk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUvUi8+z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ivdYf98s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUvUi8+z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ivdYf98s"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEB9J1429201
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ez7YUef5mEFU+Crqyi0ygT
	IsVaTvNiD4a2c1lC/wGGs=; b=kUvUi8+z+4Crdv2DjL0RBFoT4EI8da8zVwmh5A
	b+iQjsWGrAURFvKsdvjeiQfPpKQRc2RSEQmZQMHeqmF0Uz8g5/p0NWD/FL1CAfz/
	JvRzjXg7N+acVhR1CLFJi2Bw5tf1348oVXtasYPzhlAvOC6LNsfCwvktq++z4gVq
	sXgZzqZ/nBZTXSzP2972s31YOeXTQfmSMIE8zMpM5/pqnMf3V5mpQtAIucT4P2cM
	4qmOhzrgvRlyr1d5DMtoJasVBog9jXyTnJUZZZkTX0L9MCvo0Mw/R75vjlGEsgwP
	ZLDeT//F+rCVNb2pO71qD+wOFq+ozCeFSB8w18Hjb/Kjs/0g==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn1nra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:53:55 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7ebfcb4c999so4506945a34.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954435; x=1784559235; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ez7YUef5mEFU+Crqyi0ygTIsVaTvNiD4a2c1lC/wGGs=;
        b=ivdYf98sBPuqXuMoJ/7mNpWd/LlaqLVV5G7NW5vZjWGtt6YlAP3JipfmkFeqqvvKLI
         3zAruhOAalz9MO2LlDFOg0ALmlKwpyE1wEovaNxd2Vaa5CuU4EEciTfWw57OkDdb2z1B
         rT+ajkORcL2IDzBEOeXydc2azS9rgOplwh7u4byJ9WLcnj0296uX/DwSFUZav2ReCT8n
         KvPF1C4Z1KbJ6jgfYa6eQZGjAVrIBfOk5oAGZID+oUsnkLnxQv2gzl/EbKH+ufXrxmJB
         w7xl5wDaCEy5/6Jpzygc/uoDk43boquRg7KxyHznYADDz4+18TxAxD0JSe0qYQ8RueCD
         bGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954435; x=1784559235;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ez7YUef5mEFU+Crqyi0ygTIsVaTvNiD4a2c1lC/wGGs=;
        b=InB94OS+OL8uosxUdOuicrxjodE5neu6AUoTKE1lrUz379tDCHv/GcEn+h8ooE9Lej
         W8n32wQFC/VPe9O7RkRzKFlWPC+W68dTnbPIRtC4SzzOiHzi3i5TYdN8YOB9kIOstQ9p
         13Wou7rJ1x5kS13T9nHi1Q87MY9NO1T4qeR2/abBYB2z1BDLHYJYVPCelca6pkAaJX3u
         hL4xfqCbYHmdu3MY8SE5sBZ+RT9BjynvNVfgQJkWx3AVCWHjb6JkbvOaDDYJ0GUv1SUT
         2Sf89Wn/HEeZqEnzFqZD3Vzlbp2/uQkePq2c/nIbLAR/KbgL+gfkjshdHeZRw+Nr4e/C
         YJ7A==
X-Forwarded-Encrypted: i=1; AFNElJ/NMX4Rv9i86c/bQfWzNctR1YFE0lzUZU9Dzi1jahVpU/JCpiw6rUSQ2VaLoqw//oPFbHCAEhkJ2d2z@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQDA3GQeseBLxJsDtg/c4yoRjnWVeHZYV7sDSuQgfDSZxnGAX
	IvGTxn3FZtBcb76Ot58tXApFYVA9rvAQ91tzOhef6E7eo2HxOZxku+NQn7mCJD0jHSyhbDHx30X
	IjVHm2AIjxzkUJMgttCwHGv3nM+MJe5MsI51X84jFxOqa10pDhXJdt2viFxVOKzaq
X-Gm-Gg: AfdE7cmk46l0IIAOThxDsmG8OxtqEI+JkrWaLFRouwWcGJz1/5h0/RFVBftwrc+Dbod
	QfaEV9vLz0OH1CfXI1W3HoXHQqIe8WK1a6E5njAYWL8vixYVj2smhuaHPvik99Nc2BBP7qNm4ua
	qvzl3HrVQKatus9OY2kwkpLt9AA5xoySJifwRq5Ca1UUstqKeD6b7jJrvPX4TegFqDQr2dUggRR
	0kk4aBp+S8SyTxWdZCOLm1U/P0Oa9h9jKX/M/WlTHXTguo8SPoOEe4rgum3+s3Rsl3l0PfQFuGZ
	qGAYD3/DTWb0kS1l4JDiUtRdS4tmSQBT8dFIyYTtqrpZExA9qPSsKO4/tSsBulDTkgWJYtyxp4F
	gfob3n4Sy9iIHSbfQAQWEo0/s+NeQnBrH2Os=
X-Received: by 2002:a05:6820:83db:20b0:6a2:b8bb:cb88 with SMTP id 006d021491bc7-6a39a5c509emr3590792eaf.17.1783954434686;
        Mon, 13 Jul 2026 07:53:54 -0700 (PDT)
X-Received: by 2002:a05:6820:83db:20b0:6a2:b8bb:cb88 with SMTP id 006d021491bc7-6a39a5c509emr3590770eaf.17.1783954434194;
        Mon, 13 Jul 2026 07:53:54 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:53:53 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v7 00/10] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Mon, 13 Jul 2026 20:23:38 +0530
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPP7VGoC/32NUQ6CMBBEr0L225KKpVi+vIchpC6LbEKptkpUw
 t2tHMBkMsmbZGYWiBSYItTZAoFmjuynBNUuAxzsdCXBXWIoZKGllkZclKCRP7Z1rkVsZy20Qjy
 UnbLaHCH1boF6fm2b5ybxwPHhw3u7mPUv/beWJMW+6nppqDRK4snHmN+fdkTvXJ4MmnVdv9RGP
 wC5AAAA
X-Change-ID: 20260609-b4-eliza_mm_cc_v6-64cc35d4a698
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: irTtq38quh_HDO6lDU5Mc8u8VIfgHoTz
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54fc03 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Y_ikFBnX2WV78VM4M2oA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX4zQQGQX+RcYM
 yPK4xrJtcwudJ/wxuXiECR5w8B9wHl4Q2l3Cilz1QkxRCw1XXwa/+c2GpQ4CIBTZnTGs+fkCjVH
 +qVfZyqjGkNZoD8veugEJL060E5gTWo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX1vcdoqsZfnlC
 MYo5lSx/VgAbduFUOcG8X4GNYEk1iN/xMgVkHaUueUPQyhlUQGbFTOCT02vPmBEpL5QUVR0dGSl
 aexUbVN+7pfTZ3NTBmhHIOr5VQPtgJOZAGWI4SSyaK2BfoLfViasFXR2oo9pVsBB6OnfEBI3hgD
 Bm9GaQb2Dr+iCLLM6vW6cktHlCXNoGMjoNEJA7h3NWIs7oaHgGvfEOJvv5WaylXtTBw/UA8n3gI
 fKeeAbti69oPjlQ6goZrYl4cGbdnahEWTjQQEWP6Da1TSsdLJKqa7JDKh3nLqrlwXtvfzpUVU7Y
 SGqfUW4eb+4rH0NiZhqIjN9y9O1b5V8gxPu7DKBqxs8pnVbkiTeff0R3Z15o9IUnGRWpYBf7ISk
 vpWpso5kDmIawq8JQX+1isjwB/+gs8Wxo+6AEH+SKSfPoaT/xiNQrY45/2uE2WCYOGvEIyIvlCv
 4UjcU9FAMQGaa0oI4zw==
X-Proofpoint-GUID: irTtq38quh_HDO6lDU5Mc8u8VIfgHoTz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Add explicit power-domain voting for Milos
which are required. Hence extended the Milos camcc & videocc
documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v7:
   - Add missing 'power-domains' and 'required-opps' properties to the
     Milos camcc and videocc dt-bindings, and the corresponding device
     tree nodes, since the Eliza bindings extend the Milos ones. [Konrad]
   - Update the camcc, videocc driver to 'use_rpm' flag for Eliza.
   - Add the RB-by tags from patchset v6.
   - Link to v6: https://lore.kernel.org/r/20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com

Changes in v6:
  - Update device tree to latest linux-next.
  - Update commit text for no ABI breakage for VideoCC and CAMCC
    binding [Krzysztof]
  - Added the RB-by from patchset v5.
  - Link to v5: https://lore.kernel.org/r/20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com

Changes in v5:
- Taken care of comments from v3, v4.
- Update milos-videocc and milos-camcc bindings to add '#power-domain-cells'
  as required property in bindings.
- Remove duplicate clock 'gpu_cc_gpu_smmu_vote_clk' from driver and
  bindings.
- Add '#power-domain-cells' for 'camcc' and 'cambistmclkcc' device node.
- Link to v4: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com

Changes in v4:
- Update the clock ordering for camcc and cambistmclkcc in milos.dtsi.
- Link to v3: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com

Changes in v3:
- Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
- Dropped the defconfig patch and included the drivers as m from Kconfig itself.
- Update the header inclusion in the milos.dtsi.
- Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (10):
      dt-bindings: clock: qcom,milos-camcc: Add missing power-domains support
      dt-bindings: clock: qcom,milos-videocc: Add missing power-domains support
      arm64: dts: qcom: milos: Add power-domains for camcc and videocc
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   31 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |   29 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   76 +
 arch/arm64/boot/dts/qcom/milos.dtsi                |   10 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2804 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  607 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  405 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 15 files changed, 4731 insertions(+), 4 deletions(-)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-b4-eliza_mm_cc_v6-64cc35d4a698

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

