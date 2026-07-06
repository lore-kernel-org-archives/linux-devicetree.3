Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C712341C307
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 16:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357012; cv=none; b=Yzr08MVrwrT7SyqHwm3ajtlZDS9qFLoXwjwT578irzjMo6qT91iHAXFPfOCbNaGCfHfftEg85S4KvgrB3rzyRgWSillj8GUeqcs2DTm64y9nKOWqqpulDcj9nhEPjyLNsFB41T9r1D3hGxt8pjqOloZSL0D98AEtJAG6FgkCAus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357012; c=relaxed/simple;
	bh=pNZbynUekfOmHusDUjDc/vF186uS4D6Gv3Un79o2yrE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FKQVWPL3bXpiI6/mkl70u+ZBQHyGnBlMNCN4w3mdjuXuOHStJOh3bcACXhpa4+RZV0VkZ+ciCgpeGQpqlZzAVZpoaB3iJKnT2LhsZw+NpeP75zpBCQl8OlE4Y/5d1XPg8RiIornE4pQKz1pfWX/rQShy0Z3xrz+rZZY5LmOeNB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKErIk74; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kVLnzPwg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKErIk74";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kVLnzPwg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFBnW900892
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 16:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XkGXfX6x37QUZsM6pLd70y
	JpzoAVIy49ICSIs9qnngE=; b=ZKErIk749gR+S6axVFdqFva+LjBiOK52IOsouG
	mYaDGQjZRfPMHEVQM15EHooOgt3dL6n2WZW//bASMB9g3s23HUPyS7yIzMR75dRG
	ab2tKtEJYDD2EBjU6YrqOhGnN+pKH3hIZpEyxF4YodPO7Yl19RK2+ZVsMA8xiBRv
	D6lwJbA1dHr8r1FcAydskeS3LT6GtvyUiBFIIdx3yKH/lmtmOg8897vqbrvBgPUs
	PQDCtQHqxSkngaInscpyDwJBZS7swlvE7mLoxnPkkercpMXN1fxqOo924aGoteWz
	EKuRcjYewMAT7rzgI9Vtkz9QVzbjbG5u88TbWCTnD43zsu8g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7jkbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 16:56:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so4667944a12.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357009; x=1783961809; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XkGXfX6x37QUZsM6pLd70yJpzoAVIy49ICSIs9qnngE=;
        b=kVLnzPwg1+qEOwEdKrOMcb1Aq4LNPSAAtXYwJQL17F8V3Uo1NALk0phzBxAMOAVvrE
         ilTIeAqZFqUrEpxbkZY5DfIRurzx1RKEoPFiQyBJ1d/nhoHei9RIiEBDcevUsXEPlE0m
         nd+h4xS7X7cqMrYXNvNyFCsBjd0vZXnMzoTV+mERpfJOtT4HNj4dM89DhCz5aNXozXfT
         Xo7upHwc7spXUPYWHcFL6VXitpXLi5BVd8E8JCG8Ss/qbvpprGO1R/HYmCWDR6zEcSE2
         tGwTA2OZhxHkt9q2ztsNJR2agpwzaxtNBQ28DuJUjAooZLqOXPvAR7eLusSDzFLvF5Uy
         vnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357009; x=1783961809;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkGXfX6x37QUZsM6pLd70yJpzoAVIy49ICSIs9qnngE=;
        b=rLe8apUB+LFEhlKazB6jiX5AFdJUzWkIaTeqmcSqom6pni0cxH4W2WJTF18EDpWmtf
         dZev2zfLUOv9dFhVWgBQCJbGa+OyWLLYuvbEpcEcM6KnQMy+KCltjGSqHDxdoxOmiA1D
         epFgLKUEEnzkGB4nKGQDVYOyaxrET+VQUTj54x8D/29pKaPZWknsiGsJ1tnKM8iFeua8
         C4ENAsqHJ1iaU2Xs384SrZUkVvEYessvgaGi32Ldmh6mIB/W5GlBFb6R1aeeWKwK/c7+
         YdQahPKROJtkScsHsH9EYlKLGODqWc8ANir4jN03879H2in3RksC1LA9uDGOLsh2cPiV
         AHLw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4dt9ui5gBSbLkvIqoMwSHZFcDd4nmhW/wVF6SuAyGiiPkBlZqHcbIKXSFM022NZXr1jRarPfa8qM3@vger.kernel.org
X-Gm-Message-State: AOJu0YzMnO8N3GOYMNy+nHnTFtcXCSiaDV5/JHQOp567Tqku6Yq2keni
	y6YtPP/Hff6c8Agwo0ntKyziIfFxd3laeZvGNBkME2Q7b3cfQNTOWAAZrsdTs2ls7NDLNBjOCkJ
	P8PUFGeMNrzSyJopIR0ZRtr0MVik/gJa46KgwdQHR0w2/ei4zoR1OyrXh7ffYItLupTHJ12k4
X-Gm-Gg: AfdE7cmez/lIwGOah/cmc7hIq9rpdU5VfLmJybG7kjjWZk+x0PTh6suU25caeArWgp/
	6xpd4eNpF0X/9zpJW5NQlQMVidPfuZ5hv+u9+UYcuXOzcDlTr79w505AkSgNbsLbPOW8a8WsAut
	rCddTiW1T+HaiegMl+LxP0issAEB3611Mvr2mxXY4e3IVW+H39zVj+fhI2AsEvktn7L6UbL4R3S
	AVjSiy4yN/jnvMR00ufQW39b3SbGANrGgGaLoXA8c17MD+ePJXNiZwF4yWMsorXLcb+7m1EgiT7
	anoUdsMyiqxmpJhOSHnzWAlwbuFydEmjGsCw+vc0050LZ5KCI781CU5qaJ9ZeigixvsX0G7RZva
	Mfnr2eOJ+yZu2x7Wmb5L0mJZ9NeMYk2PhfVgjAJf9sw==
X-Received: by 2002:a05:6a21:7704:b0:3bf:7f0b:2f70 with SMTP id adf61e73a8af0-3c08eec7ba3mr1828033637.34.1783357008349;
        Mon, 06 Jul 2026 09:56:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:7704:b0:3bf:7f0b:2f70 with SMTP id adf61e73a8af0-3c08eec7ba3mr1827965637.34.1783357007495;
        Mon, 06 Jul 2026 09:56:47 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm6960604a12.5.2026.07.06.09.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:56:47 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: [PATCH v3 0/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Date: Mon, 06 Jul 2026 22:26:33 +0530
Message-Id: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEHeS2oC/32NQQrCMBREryJZmxITklpX3kNKCcnXfjCJ5qdFK
 b27sbh2M/AG5s3CCDICsdNuYRlmJEyxgtrvmBttvAFHX5lJIY3QB8MphGnAWCC7FCO4MljvsdQ
 Z9502rVYaOt+yKnhkuOJrk1/6yiNSSfm9fc3y2/608q92llxwaY0/OquEN+qciJrnZO8uhdDUY
 P26rh8JQKYrywAAAA==
X-Change-ID: 20260516-smmu_interconnect_addition-d9567535e9d7
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783357002; l=4134;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=pNZbynUekfOmHusDUjDc/vF186uS4D6Gv3Un79o2yrE=;
 b=zVp3IoV1k1Bdu5+mmVSi/MvhRK4jbvL2R7AbmXGDNW3lBmkJKhNXSYfKXr2YxUIPSNUeOXVL5
 85tOcqpdhETBWbyyTnM2s0bd36rcuYFlF3UntoiBA0kE8UN9ui/b5hn
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX9chldJEBYUMm
 WMbVRJJ4FgU616xd44KhVpQFTyd59HTOQBgGOC6VrF0Oic7wNJpksR5jM79iOaabdHoy+7tP0pe
 DHaQffcy+xVUd9CN5yLp4LsDCfdHDiiFQ/OzO/KvIL75vRn8hLWWm0JfDWvIs84rGifDkFnMcLj
 g+yED3JSf8w17pzibM6p/sT3IfNTIK121wtouQqyxQQqAVg5C6odyQcVQPcOhfLIrNDYzdA6T4F
 HPYqxDsOB0gHPvnWB/YbISo/wL/ZMIofDQaxajHVaPKkRb/k+YHwcVmUOlByi9Mk4Z1D5QEEGNJ
 igPcsGDQxqdJcH/+FpvMHi9yFQanlM5iKaVF6tJIhUAvLukGU0/k+uNTYjJ8HbwZi36kagkUx1a
 xlQy/n4NcO9mKN/8d/lfLquooqiC4iVqKbC3AaYEmXtfodnOZaK/6ALbXhNODpNiaxrzjKTmNZj
 aiFjzzemDN0XNGUncAQ==
X-Proofpoint-ORIG-GUID: EvneFxzFODwIUzbZa0AAq1rA1wxtgOvA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX+EA9L+gV/QnV
 QKWO5z94Tg8vaEAx5Ds/JqTN9UNkwNwcs+thyFHR+vurVe8PSWf24xcvI4n54JTeIIzFpZNfQpy
 RhFo4CQ9ShLj+ieIrUvE7AZ9byyOLNs=
X-Proofpoint-GUID: EvneFxzFODwIUzbZa0AAq1rA1wxtgOvA
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4bde51 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cnCtU0XpSSdWNXPVHlEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060170

On some Qualcomm SoCs the SMMU register space is gated behind an
interconnect fabric that requires an active bandwidth vote before
registers can be accessed. In the common case this vote is held
implicitly by other clients (e.g. the GMU device holds a GEM_NOC
vote whenever the GPU is active), so the SMMU works without any
explicit vote from the driver.

However, during certain power transitions — specifically sleep/wakeup
sequences — the interconnect vote can be dropped before the SMMU is
powered down. If the SMMU is then accessed (e.g. during runtime
resume) while the vote is absent, register reads fail intermittently.
The precise ordering makes this difficult to reproduce consistently.

This series adds support for an optional interconnect path in the
arm-smmu driver. When an 'interconnects' property is present in the
SMMU device node, the driver acquires the path and votes for bandwidth
before any register access, releasing the vote on runtime suspend and
on error paths. Platforms that do not describe an interconnect path
are unaffected.

Changes in v3:
- iommu/arm-smmu: Moved ICC voting from generic arm-smmu.c to
  Qualcomm-specific arm-smmu-qcom.c via new runtime_resume and
  runtime_suspend hooks in struct arm_smmu_impl, as suggested by
  Konrad Dybcio.
- iommu/arm-smmu: Moved icc_path from arm_smmu_device to
  qcom_smmu to keep Qualcomm-specific fields out of the generic
  driver.
- iommu/arm-smmu: Restructured arm_smmu_icc_get() error path to
  exit early on success as suggested by Dmitry Baryshkov.
- iommu/arm-smmu: Dropped if (smmu->icc_path) guards from
  icc_enable/disable since icc_set_bw() handles NULL path safely.
- iommu/arm-smmu: Changed WARN_ON() to WARN_ON_ONCE() and
  propagate error code to callers.
- iommu/arm-smmu: Changed ARM_SMMU_ICC_PEAK_BW_HIGH from 1000
  to 1 kBps as a minimal keep-alive vote.
- Link to v2: https://lore.kernel.org/r/20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com

Changes in v2:
- dt-bindings: Cleaned up 'interconnects' property description —
  removed "Optional" prefix and driver implementation details as
  flagged by Krzysztof Kozlowski.
- dt-bindings: Added allOf conditional using 'items' to restrict the
  'interconnects' property to Adreno SMMU nodes only (qcom,adreno-smmu
  with qcom,qcs615-smmu-500, qcom,qcs8300-smmu-500,
  qcom,sa8775p-smmu-500 or qcom,sc7280-smmu-500 compatible), so
  non-Adreno SMMU nodes on the same SoC cannot use this property.
- Added DTS patches for kodiak, lemans, monaco and talos to add
  the GEM_NOC interconnect path for the adreno_smmu node on each
  platform.
Link to v1:
https://lore.kernel.org/all/20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com/

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
Bibek Kumar Patro (6):
      dt-bindings: iommu: arm,smmu: Document interconnects property
      iommu/arm-smmu: Add interconnect bandwidth voting support
      arm64: dts: qcom: kodiak: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: lemans: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: monaco: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: talos: Add GEM_NOC interconnect for adreno SMMU

 .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 +++++++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/talos.dtsi                |  2 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         | 55 +++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h         |  3 ++
 drivers/iommu/arm/arm-smmu/arm-smmu.c              | 27 ++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |  2 +
 9 files changed, 119 insertions(+), 3 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260516-smmu_interconnect_addition-d9567535e9d7

Best regards,
--  
Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

