Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94DD3955FD
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977779; cv=none; b=J96l5LVSX4hvchLrWxMI+AuvbC+4j64x7lUgrly+jU5t1XvFi76Tq2ViuKy8RBdWjViEK4PM30O/dcGjwRNSRBWzVUySLopBzlJrysth1uuv7xfjBlU02NGJFEYISlblEWR9i0kVnngV0e8AFZylI+Tdh/ymgx2ds1BM6rjNpeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977779; c=relaxed/simple;
	bh=+rRbjOQEJVB7oAEtMoR+MjQTM7mfWC0gwMJWvhFdC4Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=erl0/A7fGFdqsOTjKQXyxdOHMDj1Eyafd4Jtr4zRtG4ccPEB1WlNNwqDb/HVLQLeh5+qBYLRXCA9e1zNswQq7q/7t8wnbYY286++kIlVGf9tRaOthuMGiM0remfWQv8Ebv83DjZ5vC46Pw070WP9qWPFgEQPmBYnpdB9QgqO7jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGvNjU3s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVSSzlnf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGvNjU3s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVSSzlnf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66242uBO3460384
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 07:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xnfuZZRf9JLy8gf5Kw3Awl
	zTM+tJaop5EysewtXJkBE=; b=KGvNjU3shnswNgaogJiezWwMhBYs0w50mFgj0x
	xDdz57e5R5MpjmrkT8vzene7z/Q0JMTWqHGHSQieZ6wiOFwLRmCUwT/PRmp4zJSo
	txesravP6V6tc9FFEThkyIoKMDzdsk5afGhQO8yROf4E/VEGIVPWe/2FS6RdCsy2
	TJD3/HzEZdJjS22UV9AM0O+Z/Z2QYwnUnVuQ9Y2Z7xFEAmHJLgxO3u1HEhXkyO2u
	cc1DIQo8uNzDwcCBtETXUZz/aypX02SbDWkcahirOlyOHRAmT5YifZp+6aHrUkNt
	v9vSOyEa3wBUbDavv7LYhKTUgRIRExhzpiHs99GTVvQ0WUdg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb0p5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 07:36:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c9f452d260so26475225ad.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 00:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977775; x=1783582575; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xnfuZZRf9JLy8gf5Kw3AwlzTM+tJaop5EysewtXJkBE=;
        b=iVSSzlnflIicq3dNNeVW0YhIzwivo5Lg1GpOLoNdOQ9cjmqYpGs9KaA9Gg1bdjE9gN
         K2/xL7jEMK8zxLtNsAgVOJNpNolqaTcmhNw3bJBLXfW/aAO0Hvs5D+a60uBSdvaoSJYe
         HdSgs8vfyRr1UQXbqPrQorszB4938giUwOdlJ210jTAGHANBl1aB85IV9glhdg0Q6gdR
         mFxzIjxmtI7HxDt+uSwdFEVXgjpJWhsFspTrH91W/aOmk9H/Dpgh7Sm9DgdBGBkoks0e
         3oLsHScXNABNCMmVOLV68SuTpc2XQoL5pQyngBipaOdRF3ICracO2LtsYEMkkPbGp6zN
         jTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977775; x=1783582575;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnfuZZRf9JLy8gf5Kw3AwlzTM+tJaop5EysewtXJkBE=;
        b=Ct28mWIusqAa80X+SNwRamGnfSLvmQRYay7q68PbH4prQqr4KlBjbVVlKEFRjqcENA
         OCIGkXx9stlC3shVIWvpu0MO0Bf/OPLOzYjTo4fwnfIovRlrkmw6ALn/evL8+xrY3Ia9
         7D4Ef1o7OFUN6uSh+gq2XaojTAQPizawGtrJ48XbVFiQvu+XuJncSQxMLklVGJi8osC8
         DFNGWwWZmwqLbj/tWi00SwkrEslV+AbMUqT1DJttf6jGyA06FNLHWjUtEA6SYKTo9RuY
         55QQNCrjk0Tbla3/XfA7aNPrmw8hnJEolxrHC0XH4UNWNlkETltx/AMd0bQOBjvdXKmV
         3L6Q==
X-Forwarded-Encrypted: i=1; AHgh+RqItpaIHSofgc5Wfqqa8m3A5ByfT893RioxKJyQMZvA8mbm83lDX8ksMQTQkWG496QeMcmsSMY4sYCQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxpZR6hYT0r5TZir0LPrtDNn/HJMPLkfZy8Q2IG93zuU0PSiXXQ
	3injD6LyASOjdBnnUUqZif+qGBY+RdGK1VQ6jwDkDZjbN7mCMJHmXOj9VdJLEQkTsVyif7+DsDE
	HQdE0ZROFSWTQy3WnWmkhGZnFHnEnC9faxa6ycTGpPusPA7r6oOO+EhVffVokmUkr
X-Gm-Gg: AfdE7cliGS1JcNBXmYR4kyrwqaIN1JlAcAYmwgdzR4/c3815aYrPrFWN1mQjc9n93ti
	HKBuf74B2mKeBra9dxN7/8xjoMnfhHWAVB391l/zm3SCfB3Z7+InTF3b+ppJDU9kANoqFgxN0kq
	PG1OOBNWn1Qz6XG+XNz8O4chyesc3o/JV4MqGIBUvtLvmQioYX8dRzjDmfvmP/PWscfKtuLJHZA
	biz6LUp5n6OJkRvNldD0nQjLEYvDBiVCfWAydpe/yzrR/qzZ+L6B8XwYjgFUx79HdlgWsMPMiAH
	tSnHz1hqUOujOOzpcfZ6Vq5AmWZrFWaZt7YkZyf6fIfRJuJ09l/PRt5UPWVXDaYEmn8PQjqQpuy
	yIRtfukr9dk2Tz5iT09j2su4SEMjDkqBu2m4BQLncxf6C0ntp81LAGNZ0QA==
X-Received: by 2002:a17:903:2288:b0:2ca:bba:b35c with SMTP id d9443c01a7336-2ca7e8db6b0mr47607115ad.31.1782977775240;
        Thu, 02 Jul 2026 00:36:15 -0700 (PDT)
X-Received: by 2002:a17:903:2288:b0:2ca:bba:b35c with SMTP id d9443c01a7336-2ca7e8db6b0mr47606535ad.31.1782977774542;
        Thu, 02 Jul 2026 00:36:14 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a905d0dsm9342275ad.24.2026.07.02.00.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:36:13 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v7 0/7] clk: qcom: Add common clkref support and migrate
 Glymur and Mahua
Date: Thu, 02 Jul 2026 00:36:10 -0700
Message-Id: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoURmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwND3ZLk4qL4wqLUtHgg10jXPNHS0swoLdHAJDFNCaipACiTWQE2MDo
 Wwi8uTcpKTS4BmaJUWwsAdtX9YXIAAAA=
X-Change-ID: 20260701-tcsr_qref_0702-7a9962fa04af
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782977772; l=5473;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=+rRbjOQEJVB7oAEtMoR+MjQTM7mfWC0gwMJWvhFdC4Y=;
 b=B7/DzyxrYgARr9EmRwOJS6Afl2xOxLT9lC4SKABIQ05+HWDoMoxGNNq9e1pjuUe4zglDKsOck
 DJ0XSmaBfLFDhHv4yUY29EdMol7jmRajqABN3oHNdBAlSdV6CrXdy9s
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: hzRf7JR7LJ3ohhvf-EmTGZlrdNqzCDbN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX0cuFq21PBQkN
 hf1TCY5iYyF/oY8ZDuKZxPvSeENP8yYm1wqJd4emVCo4QZ7CYymx6E9SqFGYKKISUE9LNn7IeMA
 3Sys0Pt/OZpkWqIBrrSWKv40T/j+gi0=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a4614f0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=VBF_zcjmYl_iqrD6TbIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=xwnAI6pc5liRhupp6brZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX5ArNoz82clBE
 CNat5LRnRm/tI7JsDCBqEKkj1//9Nx6rEeqoI30TJbvcNXJ3JcxZHrE7CD/BRtwGDUFUT0p3ZiR
 O4F+P/a/ZySjAeHQyAgD12vE3qTcId+SDE4PMlXaY1QuTLlJzRMomUtNgMnyywu8lDc9bPW9fmw
 X8KFNMNpSBXrxDiQzAkdqmRaqyI1L947FA1ciEyyIsfBzYtunEGoGVojdwuSeW+73S0vHMeXwvI
 Sajyp2735GoiJ7gVmoWG0GAEF4g+Lgc6YDXb0gEpe1x0zyHWoX2enpnQ3w+/Os3m0C53JSAb2S+
 shwaAkLa92xSEAS9psan7vq0DiMHQXJgskd/OLLi40/ogmACl2Gj0SZ3Vdf0XVvBSI5WVjPenDi
 T1gm22ZO+jKjzHZ4mDkyI/M/tCXIkk0CkOcI4ld9jOqRXE2nRLYC6JVn4QQKzZAQZ1TFnVjlr5m
 rTkqr6zJG+YzExPfppQ==
X-Proofpoint-ORIG-GUID: hzRf7JR7LJ3ohhvf-EmTGZlrdNqzCDbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020076

This series adds a common clkref_en implementation and converts glymur
and mahua to use it, along with the related binding and DTS updates.

The PCIe clkref clocks on Glymur and Mahua gate the QREF block which
provides reference clocks to the PCIe PHYs. QREF requires LDO supplies
and a reference voltage from the refgen block to operate. The refgen
block itself requires vdda-refgen_0p9 and vdda-refgen_1p2 LDOs to
function.

Previously, these QREF votes were done in PHY drivers. In earlier
discussion [1], the feedback was that this is the wrong ownership point:
those supplies are for the QREF controlled by clkref registers, not for
the PHY directly. Based on that feedback, this series keeps the
regulator handling with the clkref control path.

Another reason for this series is reuse. clkref_en registers may live in
different blocks across platforms (for example TCSR on Glymur, TLMM on
SM8750 [2]), while the behavior is the same. The common helper lets each
driver provide simple descriptors (name, offset, optional supplies) and
reuse shared registration and runtime logic.

Glymur and Mahua share the same QREF TX/RPT/RX component naming but
have different PCIe QREF topologies. Both are handled in tcsrcc-glymur.c
via match_data to select the correct descriptor table per compatible.

[1] https://lore.kernel.org/lkml/aEBfV2M-ZqDF7aRz@hovoldconsulting.com/
[2] https://lore.kernel.org/linux-arm-msm/20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com/

Changes in v7:
  - Define compatible as an enum and add the per-compatible allOf/if/then block upfront for glymur. Reword commit msg for patch1
  - Added a comment noting that on Mahua the REFGEN4 block is supplied by the vdda-refgen3-* regulators, and mentioned this in the commit message for patch2.
  - Change the descriptor array to an array of pointers (const struct qcom_clk_ref_desc * const *). Skip unpopulated indices with if (!desc)
  - Convert tcsr_cc_glymur_clk_descs[] and tcsr_cc_mahua_clk_descs[] to a pointer array.
  - Add regulator lists for clkref_en on Mahua.
  - Null-check device_get_match_data() result in probe.
  - Add rx0 regulator in mahua tcsr node
  - Squashed the former patch 8 (switch pcie5_phy ref clock to RPMH_CXO_CLK) into patch7, so Mahua PCIe probes at every commit.
 - Link to v6: https://lore.kernel.org/all/20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com/

Changes in v6:
- Split dt-bindings patch into two: one to move glymur-tcsr to its own
  binding file, and one to add mahua support
- Use regmap_set_bits()/regmap_clear_bits() instead of regmap_update_bits()
  in clk-ref.c
- Move clk_init_data from struct qcom_clk_ref to a stack variable in
  qcom_clk_ref_register()
- Add Co-developed-by/Reviewed-by tags from Konrad Dybcio
- Add missing regulator supplies for EDP and USB clkref_en on glymur
- Link to v5: https://patch.msgid.link/20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com

Changes in v5:
- Return 0 if regmap_read fail
- Add a separate file for glymur-tcsr and mahua-tcsr
- Link to v4: https://patch.msgid.link/20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com

Changes in v4:
- Add mahua QREF support (binding, driver, DTS) to avoid dtb check error
- Override pcie5_phy ref clock to RPMH_CXO_CLK on mahua since
  TCSR_PCIE_1_CLKREF_EN is not available
- Rename regulator arrays to topology-based names and merge duplicates
- Remove else: false blocks from binding
- Sort supply properties alphabetically in binding and DTS
- Link to v3: https://lore.kernel.org/all/20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com/

Changes in v3:
- Fix dtb check error: allOf:0: 'then' is a dependency of 'if'.
- Link to v2: https://lore.kernel.org/all/20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com/

Changes in v2:
- RFC tag dropped
- Changed back to additionalProperties: false
- Moved all Glymur supply properties into top-level properties so they are explicitly defined.
- Link to v1: https://lore.kernel.org/all/20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (7):
      dt-bindings: clock: qcom: Move glymur TCSR to own binding
      dt-bindings: clock: qcom,glymur-tcsr: Add mahua support
      clk: qcom: Add generic clkref_en support
      clk: qcom: tcsrcc-glymur: Add regulator supplies and migrate to clk_ref helper
      clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator support
      arm64: dts: qcom: glymur: Add QREF regulator supplies to TCSR
      arm64: dts: qcom: mahua: Add QREF regulator supplies to TCSR

 .../bindings/clock/qcom,glymur-tcsr.yaml           | 146 +++++++
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  20 +
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |  16 +
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  13 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-ref.c                         | 209 +++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   | 471 +++++++++++----------
 include/linux/clk/qcom.h                           |  67 +++
 9 files changed, 708 insertions(+), 237 deletions(-)
---
base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
change-id: 20260701-tcsr_qref_0702-7a9962fa04af

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

