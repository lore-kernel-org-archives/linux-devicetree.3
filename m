Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A666F38F93B
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865836; cv=none; b=cx7tKtt2k2buLNAfZ3Bxy+1Wt2xxieYTS1hz/FfrlB/r/c2Bxs9VAUjKJS62EGLM/hNUH7ifQUl+g04Uvb/knQmQcbzDa/kRRpENKdaVqqdJB4lbP1zAhzxLLyqxZlk+aX2U9Xt7wVHxWc7nUhmHqF3hfR6khQbrjhUL54lYob4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865836; c=relaxed/simple;
	bh=4HLWFOIJoKrAfczj8cSYP5QPntOP9ZRMrRl2nIPmrtk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PwjtsHuj7ON1apMbUi41TIOCtHOnK87QQXMitft8ZrDqCU9+X8jjaVfs+3CM2L7Hj0wzo0Y1BqXx4onZLMXq5/9mUSfUDFJsrNdj6DPN+1sqtudrbFyxp2dyvbgL4D3ihj9WcNGFs9iAFpjyk+WKymoysqZUpLUhHGgb/5aSwAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9dOD2IF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JSRuq7dL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9dOD2IF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JSRuq7dL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H3ShO404557
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 17:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DCj2HtSGnhXe/Ygho7KA2q
	0SbWlkqUr8cQ+cFl5j0aQ=; b=Y9dOD2IFK81gElcd1KYYdzgmaWqFV6FKlLknQA
	W27ku4pHnad6XFinvORylWWRwyuRa9NMUKPwuGxMc2ejwrI2YFbcP/SeDqGiQY15
	LC6O3ebT/8+G9ug4BWiEO2oNS08tjmvwImlDwrpTKeOVB07qVbd6cEmO1QU7Be+I
	ItahjrfHPQJ3SRZBYsu240+sxqhsRlFmWQ5EmMJakMMmwDL2sb5I2pLPPA1L5Ouv
	GTOHuUovrYVpvR7oRGi5IxQCv9APVzMC9wncfMVpk3uGdQC0ekDQV9oFtG3+LvlN
	1z70dLK48E+ws4FPrQ6X9Hx8F/L6BRXQtCpDWTMbghkZCv4Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56g7b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 17:50:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca3673560so2146475ad.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 10:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865830; x=1786470630; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DCj2HtSGnhXe/Ygho7KA2q0SbWlkqUr8cQ+cFl5j0aQ=;
        b=JSRuq7dLHP9H4dOp1ZXYNHy1LobXtBk7jWvgK6c2TnBpVutNCHKaAh37VEviniTaar
         rjvwyWwk9uToSaOToAGgzG5kTw2CM/pGKnItL6/RuP3EKpK1AFq4wb0HaSig2GYxnsk/
         bzaKU4VUQezzwOFugeZLRG61Bb0m46ppAGVpPuhGKNlXbEM4mC3s0G5ZA96kECVuYbCu
         7HyJ2Sh/4Rbb3fhIH8/Td5udRDDbjMZ1xM7ApiQrq93HfQYJDWrfnipmluykRSy0TNV0
         s4RCG9RiO6GObDMvmm/c8+QPjfYTFu6xR6HvA7coCLpAm/rc5miLy5y7s/5fg4eLxyVF
         Hr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865830; x=1786470630;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DCj2HtSGnhXe/Ygho7KA2q0SbWlkqUr8cQ+cFl5j0aQ=;
        b=QUuoke3yrHsGjBUoEWagOPb1KngRLVH0yuMFWW7AKgo7D4uqMxn+EVi2s0jI635Z4s
         7QmGTJUVOxdMDsQEPOQ2fVjCsKuxgGe5Nx6FTnq+mYDl8bOEaoakGu8hnimJRGZPquMr
         mi/A9gUzslMP8xkxltyI/CeY6ct7Ha1uKwyfgoEg3JMXrpzGn1LL9s2V+Nb0yNfYgHnX
         z7Epz0hsub6wprVWjWliWAOXgZeWrgvm71mke302JND/PiJbqxgGBJ6RqL9o9kf/Xhr4
         L1Iqx1uJtkQ1nRmLzDE/MRyz1cV4eva6w//tXhf4fO8Uv71++Xfpkh/FcvSXcpAHGu1e
         F8Eg==
X-Forwarded-Encrypted: i=1; AHgh+RqPZI6fVB0nYUK1WaIiqoipEBW730p7rxJcM4rbKteo2iAlJBzIBIqIHdkFXwLhAJ2svrlA51AF9Y4K@vger.kernel.org
X-Gm-Message-State: AOJu0Yw41N6LXwWmdrpi+NcU3J64YH4xtqB/VFoBLIQIQB4Yaiu7AdVR
	enLEmBjHvtlLBdyd30X+4NUIZxd98j3GWWo7/w1FroELZdvF2/MiglZKtPDLC48d5v2vqX8x2TL
	IaGmjFB12kMWhphbypOjxqmVBr2FBbRkymyo1AlgmTSj9IGL0l98yLVkKqMxeceSH
X-Gm-Gg: AR+sD11xsEaFVBxsMN64fvVwR7MTQrftJH0Msm9ajy27eiLrk8hvo4oTSy6Qfvt/btj
	rGUfCL5Y+JGsJFY7kX4As3O7bnNajOznAIuxyqt/vUk68uMrxkTlE+Ef+RLtf3k0PXtOQeCwkpR
	CRz2Koo8wSLPVntnpvSyuGOJ5CdCLGVPr6G1MRKYOWNPO+36Lkm+YzNmejxciCLqjd6RXgExa9E
	PNTU1/bprJ09xUL+gN9nPkpMbfLivl8t9yk6nfxW5LWF2Tpz/lDWUDwiDFx7wnjfbjhLgUeLVmM
	Qk3wILXrCYxTXTpZO+q4Kl2SAZETVAL3QvgKifz51G7Z079XgRJNNB9Ev/YJRevsY/AnwjKxRsi
	J6y3jv9zjWOGM+54K9jRm9yWn
X-Received: by 2002:a17:903:b48:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2d0ca9d0975mr4965115ad.32.1785865830517;
        Tue, 04 Aug 2026 10:50:30 -0700 (PDT)
X-Received: by 2002:a17:903:b48:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2d0ca9d0975mr4964505ad.32.1785865830115;
        Tue, 04 Aug 2026 10:50:30 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:50:29 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v9 00/10] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Tue, 04 Aug 2026 23:20:13 +0530
Message-Id: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYmcmoC/x3MTQqAIBBA4avErBsQEcmuEi1sHGugPxQkiu6et
 PwW7z2QOQln6JsHEhfJcuwVrm2AFr/PjBKqQSttVacM8iq3x21DIiwOrY3eBOcmTR5qdCaOcv3
 DYXzfD5WYpL9gAAAA
X-Change-ID: 20260804-eliza-mm-cc-v9-66fa4d99b2ca
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: PR8kXQAjjMRh2SVhSdtHKZn9GjXw5rYl
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a722667 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9qvLLBMeT0BavxF-EG0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX3Tm3OIg8rsod
 Lnn3VNTNFtUWGkgn8Fkg1V29Goqd2PzDNH5CBBbK+9aH3Z/QY7Tc1FoXTW8jtbHn5LCR9gADUQ/
 RwSEzg2yCBPBLdpNIOcT8Rtz68XD9G4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX+9DhhQ/DwG9t
 4Ssks/T07o/O+FGMW/EBR8pYbXFRi8hYDAt2T33B2ijnx8+nnk1j7VqhLA6WrQq04bLdqGZgQCu
 TUpAQtHK+VfzedVlX8NLKgogdpr57fYXALxgUZ1RFyBAi8dyz/jRrqxdln/4B1Q0RNLv7SOxknv
 Wff6UMtwWVMfllyUqQApii/cbzBqYdAFRsR9Zkw+5h+0RDe1kqu0xAomyAifNNJtdCXJyVSjJuU
 iR7FphE07ZI2yDJ83SW3kxroLLRmt5cHe73RCnzixKEKqFjDiFKaGJamscYSBAZJr8Bq8MNurN7
 1vB8U3hDA+UCFc+ck9kXoHHXQ+zsgCeTlL5bdFl53V2nFEY1q9KYn2R/MyP+u2NLnLnPM08ICAt
 my4dke7nJr5aAx3y36zNooWk5gtWID3LCYqFNIkY4jH7xWH0vniBzT7lbbYApHwRzPFa1TKKFws
 fh5ta7V/sNYFd4i7xKw==
X-Proofpoint-GUID: PR8kXQAjjMRh2SVhSdtHKZn9GjXw5rYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040144

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Add explicit power-domain voting for Milos
which are required. Hence extended the Milos camcc & videocc
documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v9:
    - Rebase the patches on tip of linux-next.
    - Added the RB-by from patchset v8.
    - Link to v8: https://lore.kernel.org/r/20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com

Changes in v8:
    - Remove unnecessary '#include <linux/mod_devicetable.h>' from the
      videocc, gpucc, camcc and cambistmclkcc Eliza drivers.
    - Added the RB-by from patchset v7.
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
base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
change-id: 20260804-eliza-mm-cc-v9-66fa4d99b2ca

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

