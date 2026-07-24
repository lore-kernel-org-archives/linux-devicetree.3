Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B623AFCFF
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887821; cv=none; b=o6FAd2hHig/A4PBk4gD+COWxYT+GDkE0EliEmBIjip0f6VbitMcSN3aomDyELltm2zjPQkhqivXUrIAMIgRBtDxCPARTVlaBgd5nwL4RgB5GmYmOUc+zFGz+t2o1lurEfnHdHIxBc7VCiZkNuASZGMG/zbicoj24LvtEN6FpFqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887821; c=relaxed/simple;
	bh=wQKFnGdnJdY1FkH6do1pLGWIp/WKD3yuDJ3W4BrPTI8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G/83yMcxdDC0pGhBeMao+fOvymFJs8zKVmYzjTsJqAXXelfGarkLH+WlhSleYWbwHQSEwlOdIx9nbUCB746J7pjjX9PLEBBWgp5g2qMz/cd5f1PWwrlajFfh1XkFePO/mgcLVNx+4yPfJpeBXAsmvnEs4mo6+jkrVQzvCMC7z6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G5GWcjdD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AFrvC5Sw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5GWcjdD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AFrvC5Sw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lJmj1869101
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zostCU3MBRzye5WvRvd11t
	iaWCiDuX0d5YcjnjqN0eo=; b=G5GWcjdDEiD7lbKqvLETbD4MgnG8uPvkBLBvz6
	U26safmFSxhvQHEqDNnVPF7n2iH2U24RVWgctoNNgmdNOREfViFkiJtVPZ9RYxjV
	BnDiYyFcHLr2Mwlv23NwadhtHem8222eCIudkNQKpba8pgghSn+YcHKmtt3+vSQZ
	Uqa2U87kJhbyusoW4wKV/Yrvtce90CLzj0u7xP70Kya6p9w0+1xTXGSjt8a0IIAd
	g/dpjEYRDx01zTAQw5brz+jU9H+A8fvU7/N6p92Al+NGAug0YDv9hOXcNH5T+hPG
	py2Ih8gfe/My/ZS8wu0ILsb6EQ3ny3H+hhmBSC8dMc+i0s7A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw98s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:10:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc8bde6318so5359655ad.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887818; x=1785492618; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zostCU3MBRzye5WvRvd11tiaWCiDuX0d5YcjnjqN0eo=;
        b=AFrvC5Sw/2BaSzw72s6aYDPYUPnGAhtAetkWGfaCLoZcavXtkT4xcnCdda8rv/snTF
         LU7EcpskIHbpRGRCwQjL9RMQVdoP/NxJvQ2uCRV6E4ctFb3YMjHl66nbzGuZN5DzJYwh
         Qw74WQRZsAoQYeKKto8q8VtBkjlh4vnOzhNQLjvW5fi8WmwXljO06tGhtwXnJz01Vi7c
         AByOR6z246ifrNrOrKNgm3T+lcLUIYYZrtC0KZ3AT5cWJpU6PS75DOUcG8vfrgPuF67M
         BnQAIzGWmdP/OJssNU/H9WpX+eZGL9SvSv3rleArFdhV9FfyoMitmhETWfM83ppeHrVx
         1aGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887818; x=1785492618;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zostCU3MBRzye5WvRvd11tiaWCiDuX0d5YcjnjqN0eo=;
        b=naHCuCirCjKLQbMfnyuV7ioV5aqzcGO2CkpPOVUiVUMatmdfaxasP7hQ9znfk1ZRsP
         X486+5E5clExSz0hYiR+gEBzTYOkW3tcANCb8K5qaG1cBLO+6ATEZuXXfqCwfbbmtlCQ
         sSZmCucFN4xu9T/YMl7/mHLca01uw7jFD00de6PyhcxfZN1eGIynILvjElrqZ77GMVqX
         espdQfJJYZG4vI/EQD6weEqkigSuebLDLSemyV0HZZUCr6ecxOiDqDiGGq/opIQ2uVrC
         n1FxOSwxzta7+iJmacqwKBNYVtbGxe3iRwlBXKTajDQHl+wI24P4HRy+3fPeiKxBWc1H
         QI8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrpg8elUiXWv85v6R9RYfuxuAY4jfb3n1W8ykZH3rIrr2Wo7uhKNa5MNPSmymk7OYSdvOBdhenaruUX@vger.kernel.org
X-Gm-Message-State: AOJu0YznkaNE1tSPlZg9mAYsGAstVNUDxCArXiWEnayBQSQdJddCDtCo
	3t1UDEu+w68/b5e2CZvLnABAro66HKUTzBmjmq04YsIHCFaKljJ9ASWNcLEolFM0V9ZWUpNJM3P
	tob79pf0NYHueeoDBL8R4rsvWxz2RfrU/iwqk6FfHIIwPb3wH8KXw99MJfSlmFzq/
X-Gm-Gg: AR+sD10NouDcGn8hh0KVOmbncV2EJOnj3+uAYa/77VSdAlII3IWQnYoazGgnHkfOa96
	f00D5Im5ayLW4Stva5LrtmvzGZC5QmPQ5ABFW5uTdlpht2ALYxUzkEb3uUVEuVk9gGlFJxIIxMH
	CQufWiJj5pHXCCOYKGBxv6oepiqOgM+drsgQAtJCwO3hczKS8GVQwqvQzMA8Qg3AB1H20rts4bF
	JenISe69JCbfE6RaZp+spAcQ48Y/4O7CXOZ0f5k+TZzfiBsBP9XRICX5pIj5JaCNWD3+c6ICB+/
	rMMGOlAk3bvJWeJfJ4PDeAepjjPkmMxtDD+94sqNfUGw8PqtFFYS4toIaZ5+oRxWNub8edUO7IW
	FEessEVBe6eZsJilVmRbIC53X
X-Received: by 2002:a17:902:e945:b0:2cb:3f5b:6663 with SMTP id d9443c01a7336-2cfa6bbfb61mr75408065ad.11.1784887817861;
        Fri, 24 Jul 2026 03:10:17 -0700 (PDT)
X-Received: by 2002:a17:902:e945:b0:2cb:3f5b:6663 with SMTP id d9443c01a7336-2cfa6bbfb61mr75407675ad.11.1784887817417;
        Fri, 24 Jul 2026 03:10:17 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f390dd2sm47863705ad.79.2026.07.24.03.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:10:17 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/5] clk: qcom: Introduce initial clock controllers for
 Maili SoC
Date: Fri, 24 Jul 2026 15:40:08 +0530
Message-Id: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAA6Y2oC/23N3QqCMBTA8VeRXTfZh3Orq94jQuY289B05UwK8
 d2bQnTjzYH/gfM7M4puABfRKZvR4CaIEPoU/JAh0+r+5jDY1IgRVpKSStxp8FBBDyNoXxkfzB0
 b6VhdCE6sIihdPgbXwHtTL9fULcQxDJ/tyUTX7c9Tu95EMcG2dNYRLhil/BxizJ8v7U3oujwNt
 LIT+1OS8n2KJUoeRaEaUtdCNTvUsixf/GEVKQgBAAA=
X-Change-ID: 20260617-maili_initial_clock-c7e2b4530d80
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX8MyiyeiIZsK4
 9IWfMGo14IcfJRBq8RbZkgfPzCYe1W4dWIv4JwZ3sznK1xxtK8DpDomQQo4Nm1tHeBrYZXyqY1d
 QkkGgzHedIHhabjnxQ7Ef+8jk6AIrUrwYMxJXTAH/LNskDjqY5Sqoey1kQfPqjpjsyuK5MlT9Uz
 ScanB7SP16Fv6C/RjrLltIe7xj7fv4WSYCabHZNmSBE7g6fF1UbHDAhfeB30zbv49VHoZXT4Z+L
 LJIH3B4osWeGQJD60bmZqzaBDKncyQCa43aSxsLMAQvWR1Q6n1qL7XW6tfioCiXdJyMxFqcHV2D
 6CPvaVsClEeJJFDDwIMhjMVFfP1UtGbv6TyuEEI4FF3X93w7MyjqYsqJtb2kCatyAgb3ckQlyoe
 jOMk1Ot4PMwv2NzXtbRQsvRzb6K66oKCbdEHh5tz1H1LNRfsLdBWlQeWSVCWNVgO3QhyPZzGcxx
 7mnXRLJP2ZDDJNPItRg==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a633a0a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kp3T8kGXBi3sce7iFlAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Y-cWBTh3rRCPBxPzGOkdBwdt9k4osny3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX0nACJ4OdQDo8
 ZaAK6bJwSjNCyLsP126/jU3Vb1ErPOD+fJh1iJUV+iMSzWKNvjScMtNbFQFQQrGsNqlWEmkBfhR
 ou2lHfe3tTRmsA+2wrMQrYUkXUyKUAM=
X-Proofpoint-GUID: Y-cWBTh3rRCPBxPzGOkdBwdt9k4osny3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240092

Introduce the initial set of clock controller bindings and driver
support for the upcoming Qualcomm Maili SoC.

Maili is a new mobile SoC from Qualcomm. It is a derivative of the
Hawi SoC and shares most of its clock topology. Where the hardware is
identical, Maili reuses the existing Hawi drivers via fallback
compatible strings. Where Maili diverges — specifically in the Global
Clock Controller (GCC), which carries an additional QUPv3 wrapper
(WRAP5) — the Hawi GCC driver is extended to handle both SoCs.

The series covers the following clock controllers:

  - RPMH clock controller: identical to Hawi; uses qcom,hawi-rpmh-clk
    as fallback.
  - TCSR clock controller: identical to Hawi; uses qcom,hawi-tcsrcc
    as fallback.
  - Global Clock Controller (GCC): extends the Hawi GCC driver with
    eight additional QUPV3 WRAP5 clocks present only on Maili.
  - CPUCP mailbox controller: software-compatible with X1E80100; uses
    qcom,x1e80100-cpucp-mbox as fallback.

The devicetree for Maili will be upstreamed later.

Changes in v3:
  - Update the comment for extending the array appropriately size.
  - Add RB-by [Krzysztof] from v2
  - Link to v2: https://lore.kernel.org/r/20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com

 Changes in v2:
  - Split the new Maili-only QUPv3 WRAP5 clock IDs out of
    qcom,hawi-gcc.h into a new qcom,maili-gcc.h header (which includes
    qcom,hawi-gcc.h), instead of adding them directly to the Hawi
    header. [Krzysztof]
  - Update the GCC driver to include the maili-gcc header.
  - Link to v1: https://lore.kernel.org/r/20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com

---
Taniya Das (5):
      dt-bindings: clock: qcom-rpmhcc: Add RPMH clock controller for Maili
      dt-bindings: clock: qcom: Add Maili TCSR clock controller
      dt-bindings: clock: qcom: Add Maili global clock controller
      clk: qcom: gcc-hawi: Add support for global clock controller on Maili
      dt-bindings: mailbox: qcom: Document Maili CPUCP mailbox controller

 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |  11 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |  65 ++++---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  34 ++--
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |   1 +
 drivers/clk/qcom/gcc-hawi.c                        | 201 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,maili-gcc.h         |  21 +++
 6 files changed, 286 insertions(+), 47 deletions(-)
---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260617-maili_initial_clock-c7e2b4530d80

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

