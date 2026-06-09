Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D024418E4
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 15:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017394; cv=none; b=mkhKx0JNtU/rr+9uC3wM9vvafy84KzqL5B+Lg+S2Pbr9eMYYEb2Fdf776CDLwd1zdR5ZWGpgCn5eoM2FuBvsFVIQwUO6tIXmYbkpBFcwGtsAtoPWMhknq/YSN6Vk57JcPO1WrsMG3OMJxpGM9nVfpvczCvm7NlUEbBzBQAPFGBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017394; c=relaxed/simple;
	bh=MIqe8qokVa8YYJZkAkG1yXNBwKSVJLC1luMdgyTvEI0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dpP6ZClBHu1IWJwzKOG/A5ZhqJTmPHxEZJsICgRJkrhdkbeU1B3bvTbOciQjuBUv0Ck3Lb36VMKQFhh2oKwvFg+5U/umNltzC0npDMRwG9OuHmecZFEXgc8sP9JlquEQ4Wfvq+q1qFdsNi0hTNz9es5edS9PuLmENbOh08/iI/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aglvGCQC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXGhiI1S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aglvGCQC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EXGhiI1S"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClQMJ2286783
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 15:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=88cwJVjL2lnzu2cVHtBfD3
	jOAXqQUPFnSKVzm/xtaEI=; b=aglvGCQCGidI5XCIJbp+GZNa1nQ1FJjU+LP7vo
	wQ7+ec43PuohSglEXOsgxFAGBOPD++z69+aTRHyvHVI4rHMq2ev6ZkOtzqjZnoFe
	p2uG4BPfUjDe+JA280ag11U5PJa30CIYH0Pu6cUZyK+vrqlcLur/lT3i6mZSkqyN
	3VuQN1thZ1eRFN2EAN6NQ4s5MXhXRK0WcaCebhHRknwZh9jvupER5vrVoRcb8/Rr
	jsmjA16PMwZHUZ+/3Yd24fA72VMFVPpRkKF0HOgWpo/uZIyH7Kxx6DGIjEDkifDg
	k14dXD2Lsu+jw2UIW6tyimzvbuC8LHsNNFgawH5faXuZhgeg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jsnr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 15:03:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84247fed609so2763347b3a.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781017391; x=1781622191; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=88cwJVjL2lnzu2cVHtBfD3jOAXqQUPFnSKVzm/xtaEI=;
        b=EXGhiI1S0olozg5UwqNp4uHplGPophwcxpwBCT1xGuqBPqkb4Jk48lZYFACIcg5Vg4
         EjdKXbisEFrDchfKKgFl30R2KkBsbFHqIttkGl9Yf3IDov/q+6SQoo1KaCdsDcLWRuag
         kHN1qrTFrO8n9674qkNixfpb+oadY3wLB58MDv3FV+nVivD3Xxlc6uE/b3HwReHBvBP1
         yAKMpoVYAmNvZn3qZLtx1eAgtoHS3KRpPLa1j1b6/U5qAAo7MvelL9QQXJdukwLvLZNT
         qh+3mGiL44ZM1gObrwhrptBeVzFdB2DDE9fQnFRxOhkZGDAjmsiB6W6ch/va+c/em0hU
         juKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017391; x=1781622191;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88cwJVjL2lnzu2cVHtBfD3jOAXqQUPFnSKVzm/xtaEI=;
        b=Q89XKWrwkNSAPo+0Y9yLeE+dOvN+OYG4CY8M4PhFsDELQgeVeRZYeGVJ59dqlP07kK
         mwrMF/ozY/wfQAAgHAY8CMyaU+90ZQ59+FMzLEWUBHYTMxHDjR4TVZ7fHRvFKNugVxyg
         F6ojTaBA7sGnENK+RZdl2ROmPHUjA/qYNyr64hSH4sxcLIgrG2wjqDVwh2yNWanDoRag
         1TOsbZC76u3ERfOINR2+GGMT2xEt4VbwU7bhI50wCimW8VovGiqk9yAcPrvIy42qIsM5
         Bd6Kk0Wku0nLOsV7ylMDVLv3dHP876dY0gF4+eQA9bIImFq0zRNXejkpvSMzzxK/yEBD
         MugA==
X-Forwarded-Encrypted: i=1; AFNElJ/efzc8g+jxRwvgP894TsLk4e0ePb5cC4fmZr1/GuWedMYhoJWQIoC1bvCBHWQOkrF9mOWNUpGHMj3W@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1C36hkQwm9O9UC/DPMoT0ZsclNaETJR2Gphc5UEGjCymOfopI
	uYEC9491bxApC0kKsbR/4FIlSd1fWZamHHOg4gTdwUCK2YgHQzrlHAsaQHoLuPyRgyzdBX0DTY+
	74fiincMzabOOyymnp8jxZ7tRi8cAMzfHiLOqdW+FqOlLgaN8IlZ+sWd4CNCx4TAP
X-Gm-Gg: Acq92OED6W16ZGnPvZJC9HBG4HAN2O1EZn2GOMdQxYfJhkhlt+JJynBUyGBQdmGpOFV
	vKwlNez+NFn0ttEFsuZMF2gBqP+jzZGt3fEkLqEdCg5URpluQ7Nzw10++KmGIv18nqfODCUz9iu
	Btrpve2j8LKKKF3u/1tksnDjDg50uBv5hkNONfSVvbLsoz9EBkx+hG+fypmEAPDx4C82rhXPaBZ
	QpIaKodV11bmdHEhGtbVf61y7lJPzlWQfx9QVxPA6AXJGkIBd8IG1jlMj3YSM5VV5sszMjS65Yw
	ZCJoDv2fMXFJW3GWRbz8lNSfqBOYgE5jbHqvl6Er8p3d6qnwQuRf39NFo2Qpc713gLaO+kH7qob
	1rH+DTQGybQnYp4Jp2I/onDBnYU/IbmdvLDXXiaKy6bAcY42EWU15USDX
X-Received: by 2002:a05:6a00:1946:b0:842:75d0:7e88 with SMTP id d2e1a72fcca58-842b1064cc1mr22480515b3a.27.1781017390668;
        Tue, 09 Jun 2026 08:03:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:1946:b0:842:75d0:7e88 with SMTP id d2e1a72fcca58-842b1064cc1mr22480295b3a.27.1781017389562;
        Tue, 09 Jun 2026 08:03:09 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm26987659b3a.44.2026.06.09.08.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:03:09 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v6 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Tue, 09 Jun 2026 20:32:51 +0530
Message-Id: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABsrKGoC/x3MSwqAMAwA0atI1haK1qBeRaTUGDXgjxaKKN7d4
 vItZh4I7IUDtNkDnqMEOfYEzDOgxe0zKxmTodAFatSNGoziVW5nt80S2YgKDVFZjcZhU0PqTs+
 TXP+z69/3Ax0TjeRjAAAA
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
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: GLh0mhXKkKe3flu2OfWVPrM2EqeTOe_b
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a282b30 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8HYrQF7E7KXWYYjJzRwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MyBTYWx0ZWRfXzgmzp6M5RjS/
 fkqh5HvcJ2tUpM+fyZ5iTbBqJ1fPkcuBHFJxRsaU+x8ukZcO1aNjY+/P+1EdqFdcIs7dXorlTlk
 HZHP3MIaT+QGl4j5cK58uELtsO82eljaG6SWACsSssoLxcjSbMRt/1CSNbBRY53zsBcwHAgwSRV
 sJMy1NIE8cbD80MWcD9NMQxK8gfHg6MvGa/DeFH8grbxD7zz03FKEMyAu1+G5fNnzfiK7xqgSbq
 BVybJ28AFcNDeig0wVFEkFtkWLtu4Ql3a3N+pdJhNs6f2QNtZbjV4OMyfzN+Hs9AIhinOlQa6PF
 YfxCIq/6SW4A6/6pK31y0zSTdeZJ19k71doIqceHKcexkEAUZ4caYRUJtmwJeu9i9fVIVS0pExc
 DRZqzGfd6PyujEorI0cgo3N70b8tbOiknsr9UEF/yjA1kzLN1BVhALlwLPBU1ttYUSthFt6pbmI
 beG831zGZm87zhmvNew==
X-Proofpoint-ORIG-GUID: GLh0mhXKkKe3flu2OfWVPrM2EqeTOe_b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090143

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Since CX and MX rails are already ON when APPS
is active, explicit power-domain voting is not required similar to Milos.
Hence extended the Milos camcc & videocc documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

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
Taniya Das (7):
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   12 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |   10 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   61 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  607 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4666 insertions(+), 4 deletions(-)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-b4-eliza_mm_cc_v6-64cc35d4a698

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

