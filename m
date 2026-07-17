Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9A632ABCD
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273530; cv=none; b=qgOQgmf91fVDZUzbVoSQ4SWzks0R5HRAuzEwxTIpQx6xr0JXR3tlXyWY5zgo47jtEAy3KaJRV2K82dD3kuDqA44Y0edjVjGlVGuYctMbQmN9cJ5KXsuOpZuUfwVZu2FeotnzpqijXJ8A6LtWtTJ6DAhHhtZlfpKYCEdIs1PcyOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273530; c=relaxed/simple;
	bh=/blHfR12euFXpMvDmiOiktkEDJghmhI4AR6U2S3gjoA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DH5cPugr4+Kl2gX6XPPd6R4qYKy7AXejIKZt6a/wokyOUwvl31Fc3xTAyelTLfZgG5W7zI6/VPzL6397jXtGGY7loUy2DAHlK1taoPNoZY0Yuc83XfXKYlDyPaNy1SBdRYb2sLMqge/ZtRyg23rhrPXWuGp3yX+Uixdu1/KfNEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bnTGWMS5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajRtKUsV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnTGWMS5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajRtKUsV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6ci9H1093111
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hJ2+RsjIu1eHK3Gfe9Whoy
	COoyu0fRnru2GWuIngT/k=; b=bnTGWMS5RWeZ/AFSSYaHklNPHV99mFQNQoOI4z
	jV/mcWRp5hOUlz8KOOHdXIfQBAriVOtYJHnLlfkAB+LrGID79YFm1sL/Hv8yql0d
	plZEKzOcZvO16b7KcCExc46d4o5yBIvOnbSuPQRbDL5wUCS8R8thYTTtex/zdvf2
	11KcDOL/K4zgPq9CyS451XPIu5x/yCk1j3wnLCP93uXFM+fbUhvHAyNneFiu9frw
	HtnXj1YtiEk3URujtb8bldj4pwJY/iqSwGl/0kk3kOubaB+BFCJ/wpQzRImMq6JG
	RY9zYHMwj23OLM8IyC2LEHDFUNhpso5JACWt4Ky2fk1T2Nhw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0urgxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:31:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca8aee88725so11281142a12.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 00:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273517; x=1784878317; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hJ2+RsjIu1eHK3Gfe9WhoyCOoyu0fRnru2GWuIngT/k=;
        b=ajRtKUsVsuORnUxTmVoeOYkvRY1GLV8nyiaT7NkUR+2paFIMENn1Z/JRP5uFyMDopi
         O7bYa/pEPneM/VlGR2JLyLGBkYPvnrGnu1w8DjXx9bw5djKv5aKdJcofxqz/9E8VpFgv
         BfaSJxsSIENnhBvn5Ej5Z17cIZDZ58bQ57mhqWw/KT2dAyHIxJ0kQQRyCgwpHLwIMK93
         jiUZhWYuFQrmd/X8OoFlwX9e0CrnHnHtBO4evCCf+kNqN3/9xg7HBGh3WWQaGVXYlVKl
         1y9gLKGHRibfOymyqFwZXRxCYPxCF17Ik/SmdsTlCQEE3+Kx3F2/orDtbcuJOsHvVGpX
         FFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273517; x=1784878317;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hJ2+RsjIu1eHK3Gfe9WhoyCOoyu0fRnru2GWuIngT/k=;
        b=Cx8DyeFz7n6HuPvF3GjaCPjPDm0Q4cr2AII8Inx5HC9r27hiJGLoK+kp5p2yRW6f2a
         r+fBZYbxWnzSEDXaoHm+w/GmZk/xFmfPyH/bGvOy2UxYqQiYdiI2x+PJYXIDnwPbRvkI
         jNOOPDSJnHSeK7s/pJR09q/86/qnVXF8d/PSyOzMxUuwOa9IbgPkSZ96kcJ48IBA/nR2
         vh0Fs3sJmhhgEtz3qLzh2zJeM4dlofjXaoltYjHA7dnjZFJDaqZLVh9GI2ZNn+FZSY7y
         jbv7Ctmg1Q+swKQ9WNT3zipm+qI6cBlW2fng0zIPWYUxsp+bosqEE7Dxrjw382t43gRh
         h6+A==
X-Forwarded-Encrypted: i=1; AHgh+RqoTCtslDrZ96LEr3XSUTU4ala7Q+yOmiZ3/Kgu8Ixbr0V3YnInbOoXwUJb7TdfBkfh+EEMYye0lGT/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7lbv07vXspG8OKFBOTivTwIsrDYKLPdbHjMzpMr1g7KqB9zvh
	iLspG8ngpENDh5iOfcw5ACFc0IOP/Q+xiTDD8uOSCkT81S6KkbOt4ntXiBjjmmV0nwCwKyBt8jH
	3NN4tzKztUxUJZ4YYWt9+FazeUSVVy4hg05nAGxtVa+nmk6jn8RX78iEf3LzLLRNp
X-Gm-Gg: AfdE7cmEUy5qpzfAeyraWYxOBWg4q+Z3gsA4TJ4UWWw8zNON+kqeN5R9oJqSPtFp/BB
	UHPwxIpEOha2XRQV6vT9Z2h48aJcA5Orus+1pb0ObbbpI6JD/jH4PKB0oBTD21mVOMOdGJS8sLM
	ymge3f4Shltboccy6oCJtt42ZIA31ufIpwEVHy7X9/+yL15JF4PPxn/By67Nj8ZA8Iy6RXWzqrg
	k6MgkVfcqRGLmtEJ8FB1AjjWV99q2tiYajKy9McKVQFqAYjsJJddqCMQ5wrG1qRWjbe+cKFaRwj
	644uKLIj16IbMrLmRtk6uEotQu2Tqq4LkUsfluWXQ5O7pGAel+yDvudnjtljKlfne6dBrT20518
	jI+8hVdfI9iB8+erFzISsZt52
X-Received: by 2002:a17:902:ef01:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cf349aa87emr17541725ad.34.1784273516604;
        Fri, 17 Jul 2026 00:31:56 -0700 (PDT)
X-Received: by 2002:a17:902:ef01:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cf349aa87emr17541225ad.34.1784273516079;
        Fri, 17 Jul 2026 00:31:56 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:31:55 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v8 00/10] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Fri, 17 Jul 2026 13:01:44 +0530
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGDaWWoC/33N0QqDIBQG4FcJr2dYmeau9h5jhOlpCZmbbrIte
 vdZN7uJweHA/8P5zowCeAMBHbMZeYgmGDel0BwypAY5XQEbnTIqSckIIwJ3FMNoPrK1tlWqjQw
 zqlRVayqZaFC6u3nozWszz5eUBxMezr+3F5Gt7T8tDcEF1z0RUAtK1MmFkN+fclTO2jwttKKR/
 yBeVHsQTxDVougU9DWBbgdaluUL3JTTAAIBAAA=
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
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a59da6d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Y_ikFBnX2WV78VM4M2oA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfXxe6Uq27PaHop
 1eMqcCtoIcchemHm2Qd550eAaE/+peDUDQMwWpw+lVltRkXMj+U8ZjOZ2Jz5Uo/yobmffXk56Xb
 CThsL79Q/YAqdMlaOyQe757GWjRVUOYayECnwinEv60mnRM9B5iCwcqHUmyDGGbk/ZHW0QGJRXO
 Zg8zr9uJdkTG8FlGuwgF3j71ZI+MRx/TpnhrJ4lLNV8HsNZOLPvzcPk1yGyJNm9TfkAvnVfcn9e
 azzpZGwezYNwTWpTtroOQiYKkDOAR9K60EM1LO83gdsI1ffpvV9/SR0knbZh40ToOKVFiuJcZiz
 WdSayZf/IMZJdxbjFXuk1vWlYvm68uiGJXGqJA2DA8C9uClzmKdpEmIdF6n+xuVSurfFor6vunF
 pTZi1E41A1Hi77HS3806ttim3LHqrooAC9BfaZD1Og//9hFc41smZsYaOsqo7oQt2irMfHLMCaO
 OIXX9R9pXlsjotFCV4w==
X-Proofpoint-ORIG-GUID: YJsFuoJ7f1COurOGahKccrGhZo8CDvJ4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX1zNUFreA2AaS
 AT6xlZnrYUVkndo4we36EtWyn/ipLYuiE/LUd1vYRFO5qpwwnGwkCTixpeofzbgjCbL7B9jXY37
 yhMErVKlpm0mJ2XVPYac+ikidPoqmLk=
X-Proofpoint-GUID: YJsFuoJ7f1COurOGahKccrGhZo8CDvJ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170073

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Add explicit power-domain voting for Milos
which are required. Hence extended the Milos camcc & videocc
documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v8:
    - Remove unnecessary '#include <linux/mod_devicetable.h>' from the
      videocc, gpucc, camcc and cambistmclkcc Eliza drivers.
    - Added the RB-by from patchset v6.
    - Link to v7: https://lore.kernel.org/r/20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com

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
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  464 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  606 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 15 files changed, 4727 insertions(+), 4 deletions(-)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-b4-eliza_mm_cc_v6-64cc35d4a698

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

