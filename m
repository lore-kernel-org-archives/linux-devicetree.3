Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0531C3BFE3A
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 05:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550790; cv=none; b=jajoEuzzZ3O3N2rfhZ8sj4s9Pd18kvJJU4p/28f4bdGvrvuHo2Bt3osP1xlVtUagd3je1E6QWXZBTtIE7nmELTMdDBhR0inUGQqZFRTfS3UOnLH+G7XXzKyT36MPA+amWDoNPairWIp1w55VO0+V7xeuVMnHyDoj1NfRLJfpDHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550790; c=relaxed/simple;
	bh=JlKh+5TKy2E6DukNpKQOl02G3HujIDfErIuyMU5zelw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LqyfcfygxAph0bGDH2ddEhjZDlVSFygUMZW+rkDHKcPAOioZAn1F5iHIFBw+a3MsKjhp5GOJa3p457VVd2txq84pf8pDoe5I01TqZ5GU7yirwKIcIgkDC4N2ZtLTvJo+K5MywjrOtVaU1UG5CPJ3fXuXwM5rP3dpOBh69vkfIYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aiiIwK5R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YseLSIt/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aiiIwK5R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YseLSIt/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653N0H0h1476852
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 05:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6ULxxNQ2twQRZfxGQlDEjx
	1vOZlqIbbF2YSfri/GGyU=; b=aiiIwK5R7y9zku7tpXabwHsZ4N2EBYRcDNoNB7
	ZXa586fqCJJ7ZxzNWTji0hesjFWN7ldyDL1msNVwGIulYbLADJscUnrzQbaK0afD
	KhVfr55ZSlHVZMYKTcgNy/Bo5F4aqRx9Hu2kaZs59uEnmJ1O2zQR4XysvjJMauFW
	KbqVwwVoBh3GkYbnnAdHl/zunum8aYxAI6x7EJzRHrnimsG4YF0MTjDsF1aNSakv
	k0+iCsUktyzVtXQJg9rqjRw9gPnkGW38PoLv6gpwrmBZEdoCLDimgYJlLaAoVW4r
	NB44p/K7Y5kM6Mily8DVJbzp6M7krPSsONAa3JFvLW4Q6vRA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nu4k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:26:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f544944so257530b3a.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 22:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550787; x=1781155587; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ULxxNQ2twQRZfxGQlDEjx1vOZlqIbbF2YSfri/GGyU=;
        b=YseLSIt/JIiiqeLQVjEDOyEtSk8CtSOXzFufKFiHDeyEdU0W53aqeIWjw8fjsyusM7
         1tYOxOK95giWZ5DUHGKu00JL7YkPjihKh++ic7IyekUt77AuoxeGlk2STeUiyzgM73Tj
         ERdTNkDaEtL0JCnBSmDkmAprORUgJAz9K3+So5gTEV8FiwkLiSg9/XsTQKJPHwr8Pc/2
         BvmBmOQc2FRiSH8RIpTX9383P2YLwzLK9z+MkLpDYlD62VFbZ+dtShFBrgVknH1Novm+
         tPN2ltUT//r9O1J2IgIcS01BB6FH8kpDshiBM0g/VJ0qjdN3pNpoYhocGUhW01PlJlmB
         pPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550787; x=1781155587;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ULxxNQ2twQRZfxGQlDEjx1vOZlqIbbF2YSfri/GGyU=;
        b=lwtjNpYkaEv+Sfs/eDtxX26Rif+JqaurDMgfasBXoEfvP87Tefm8Gdg58X5gcIhXS9
         ZSSwnswJvEoL073wDcoxxMNQCJrDoytDQTqjucOmVPe/fR15MFhKR1sj+RsklIpJsWMV
         ii5wpYQuL2OxBKYQPPePwh4dqNvAbbBmXgdwSIFdRdNZhV/IIo52tSCNai0zsQ5ZiKvZ
         DrzTwz4SiPc0tcNJMr9j5CNyH3v7PmrgIC9JIcvTtE0PQhqKnUFLCeWCPLXc8OIsArE8
         IxlcGR+mBz5pxS3MCf5QMyXlwiOftavZw9zTqinmREvxAKsSSwfERV7JicS0qTLXcc5H
         YnAA==
X-Forwarded-Encrypted: i=1; AFNElJ+1CF9wQU1fE+pt1/sR/+TzWYIIWw3hU9hWZ9xc4Mu8AiGmayRWXtL7YKgTwRgvYSPzpy9HqPtJyCSI@vger.kernel.org
X-Gm-Message-State: AOJu0Ywncb7SwmsPiwA/RrOGRXRgA328HMrK9YA6ayLTHU1rUDUnYd+A
	zlQ2YgUyT4XqOGrP1fk/7yud0Abr2ElJB1yUM9vIwFDjoyaM55M8wRoB1SpchByPMKGYsaMX+gg
	baQklJyim9EpHuI5iBWm3RxVVAevetZxmPWyvurmRNV4jftaQA3pY9i/012Llw+Hp
X-Gm-Gg: Acq92OFDHbJI0GX+xwFBeZWUgk1Ty4rFs5cnpNMlOrYQCEpwP7mQuZYyewQLiG8AfhP
	175Z4Onxrrels7swlgMjcJO62Wwxf60aJlh+6t++zmdkdsypRwcuEAy/+qA4Yl3dFBmMY3EQBCh
	6Q1aiFucZyg0TjBure+5j3u7kieDMZpOhSNn+6migsbQLxGqB9CUOUf+t/hY3qGiuFEbVJAz8JP
	CD56yPL0OjYrVccl2tPkzwF+lX1vLz5OVv7mk5dzMRsXIa9rRzy3xbRHS+lwqPoBdUVqMA407o6
	Im4fsK23T75DyCl0EwCCshTckAGYMf7FlBWxCg5iYJdn8NCDWfPXqhMDpAKRnBpBWRIL8BVGUwU
	ZzVHHwg47eri5naHrZsoo6rv9IqsDyCr2ody9dT4iUjv63fAXcf8Jh6KAPTPuqlA=
X-Received: by 2002:a05:6a00:a511:20b0:842:8985:340 with SMTP id d2e1a72fcca58-8428985054emr4406582b3a.35.1780550787423;
        Wed, 03 Jun 2026 22:26:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:a511:20b0:842:8985:340 with SMTP id d2e1a72fcca58-8428985054emr4406562b3a.35.1780550786985;
        Wed, 03 Jun 2026 22:26:26 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:26:26 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v4 00/13] clk: qcom: Add DISPCC and GPUCC support for the
 Qualcomm Shikra SoC
Date: Thu, 04 Jun 2026 10:56:06 +0530
Message-Id: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHEMIWoC/33Qy27DIBAF0F+xWJcIZgAbr/ofVRc8E5SHHXCsV
 lH+vcRpmyzSbka6SHO4mjMpIadQSN+cSQ5zKmk41CBeGuI25rAONPmaCTBQTHKkZZO22VCfyug
 cXY+nOlWU2gEyYFGSujnmENPHor6933IOx1PFp9vj3e6bRRagf+R1BfO4r9PttoUC0yL4GCNa1
 s9IHot9L0vOf2tN1LfS61ZIoYTqZ3FdsKYE6ob9Pk1943hwFlBHg0IqCdoggJQodXRtZ5UOVvt
 OtOTafJPKNOTP5TwzX6r/e4mZU0Zl9KpFLpSx8DqUsjqezO76/aqOhZ3hgYLuOQWV0hIjVIhFa
 /+g8E4pxp9TWCnFHbcGW5She0JdLpcviLUrLw0CAAA=
X-Change-ID: 20260513-shikra-dispcc-gpucc-6f59c23020f5
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: k1If5QFvW9phazP8HVR9BHT6851hxndB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA0OCBTYWx0ZWRfX6bp/MfLunaQV
 yKmx2BaE5Y+rskPIuLtJw2y7dDTjv86GPUPioMgCm87DjRljqD3rFiJoBVgXGNVmJmTGMmRFZIL
 4hJl/S4N55yXJKqYauah1ttx3Ift4Ck7t9kEJjlrzEIL3DvwcSa5xYIUZH5Nfxfpg87KvQQt0SE
 L3Mbof5s3aVzjbnOdQVw20BMnUY9DL4tKH3HvrXkoRSyaUeVJ1IKQjQXEuk6Bus3WSD0IaMn9bW
 p8j5WH+1sxOg/xgC5Pn5cgUblZDQ6DPQnHQ3fwt7kz+6fkYrCmvirUy+m6TnAISskCwdUhjlzPA
 tMLV6tVtG4PewX9e/g/tzFGvEyyiLxQs6xXFc2vJd9xjBzdK9ygMcedv+tqY39Hqz60Od9Y8FM7
 YSiO/xJ0O4QYGx3LlLNG3p6NFUMBnN1XKxbDjOFL2+gMQoQE6r5iEx1TKkX1a9UQdu5iQeGcNNg
 GUEa1IKwPBKuLDMjE4g==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a210c84 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pcGu9BRYFhf5DAYLC2UA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: k1If5QFvW9phazP8HVR9BHT6851hxndB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040048

This series adds support for the Display clock controller (DISPCC) and
GPU Clock Controller (GPUCC) on Qualcomm Shikra SoC, by reusing the
respective QCM2290 SoC drivers.

As part of this, the series extends the QCM2290 DISPCC binding ABI to
include DSI1PHY and sleep clock inputs and updates the Agatti DT
accordingly to match new bindings.

Shikra GCC series link:
- https://lore.kernel.org/linux-clk/20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v4:
- Included new patch for Shikra DISPCC/GPUCC DT node support
- Link to v3: https://lore.kernel.org/r/20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com

Changes in v3:
- Updated the QCM2290 GCC patch to use the .clk_cbcr convention
- Extended the QCM2290 GPUCC bindings to add DSI1 PHY and Sleep clocks
- Separated the patches as per the review comments in v2 series
- Added Agatti DISPCC DT node changes as per the latest bindings changes
- Link to v2: https://lore.kernel.org/r/20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com

Changes in v2:
- Dropped QCM2290 GCC critical clocks modelling to kept them ON from probe.
- Updated the QCM2290 DISPCC/GPUCC bindings to align for Shikra drivers reuse.
- Reused the QCM2290 DISPCC driver for Shikra without modernizing
  (keeping the clock-names approach) for now to avoid potential bindings ABI breakage.
- Modernized QCM2290 GPUCC driver to use commmon qcom_cc_probe() model
  and reuse for Shikra. 
- Link to v1: https://lore.kernel.org/r/20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com

---
Imran Shaik (13):
      clk: qcom: gcc-qcm2290: Keep the critical clocks always-on from probe
      dt-bindings: clock: qcom,qcm2290-dispcc: Add DSI1 PHY and sleep clocks
      dt-bindings: clock: qcom: Add Qualcomm Shikra Display clock controller
      dt-bindings: clock: qcom: Add Qualcomm Shikra GPU clock controller
      clk: qcom: dispcc-qcm2290: Move to the latest common qcom_cc_probe() model
      clk: qcom: dispcc-qcm2290: Switch to DT index based clk lookup
      clk: qcom: dispcc-qcm2290: Update GDSC *wait_val values and flags
      clk: qcom: gpucc-qcm2290: Move to the latest common qcom_cc_probe() model
      clk: qcom: gpucc-qcm2290: Park RCG's clk source at XO during disable
      clk: qcom: gpucc-qcm2290: Update GDSC *wait_val values and flags
      clk: qcom: Add support for Qualcomm GPU Clock Controller on Shikra
      arm64: dts: qcom: agatti: Add DSI1 PHY and sleep clocks to DISPCC node
      arm64: dts: qcom: shikra: Add support for DISPCC/GPUCC nodes

 .../bindings/clock/qcom,qcm2290-dispcc.yaml        |  28 +++-
 .../bindings/clock/qcom,qcm2290-gpucc.yaml         |   4 +-
 arch/arm64/boot/dts/qcom/agatti.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  41 ++++++
 drivers/clk/qcom/dispcc-qcm2290.c                  |  87 ++++++-----
 drivers/clk/qcom/gcc-qcm2290.c                     | 160 +++------------------
 drivers/clk/qcom/gpucc-qcm2290.c                   | 117 ++++++---------
 7 files changed, 190 insertions(+), 257 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260513-shikra-dispcc-gpucc-6f59c23020f5
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v3
prerequisite-patch-id: 5a0fbdd458785da2d0e850c851a05046672ecadf
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: a64476b2ba6e0f2a55928baf72ec32672ee0123c
prerequisite-patch-id: 63e4153eb0a47bb23d906be97cc4ce84f9821248
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v4
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

