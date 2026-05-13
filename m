Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2E73A783D
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698361; cv=none; b=FsL4aMli/ARuG9FSPkEZ8ZdBH+/CehB3FTr2MInYSaW1f0SLBoS0LsJydocYhLeRM8DukmjtFK1dGPsAFVqXCFx4/V76LVckfZYDtL8Yvtd113nHmzhmrFEJCkoXRwfc++kMKTYi/mC5b3hB+jlvkd+HpL9wfYzTqA0qB0DcQnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698361; c=relaxed/simple;
	bh=i2kboZU5dt/R+5mvW/st3FZKJQa6BawWFhBJ4V/bm/Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oktofGlGtCqrDr9kc2GiROAl1CSHbhbnNx/gpPkTfGcgVHt108UMu1hqrFP83LjnI/4f9qNneylZRmX9/4kE8YF/ygSAYwSCXZLDBD5cTmn7uUFn4ZfZYootqoZg3OvogEXVovk3Lzkn/TjSSe3uIJArWdUasPEvMMC67vMRS9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQ6Fxbs1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYQkq9KC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQ6Fxbs1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYQkq9KC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DFdeWu1242787
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WHOT/4paRhmqMIJlArz9f+
	jJSRMrFl3T1rv/TsK5ZY4=; b=CQ6Fxbs1SOJNNwC2TdOMReCMGAi1Hq/eUG829Q
	XjuFbYSX6oCCtbNkONJvK8oHwn6aUPca+nh4hapXU941hb8ni5NpCSLozKyx+fb0
	sBq7LirrJ3VKSWqHUlBG5rlC2pKD08cW+6SekcJUT45h/3pQEfnMNboIbvV2BOwm
	Ms2J4I9GcYKbjxgkOqKZDgT7FaoX80XE6GJCQyk7FEQgfVOVYcJs2qFZfl6XR6qk
	17dPF/EjeHSEtPSir9Zi0PImglHh/BPSP7lCGNIbLb/SqHTaJeDWtYGPFCV5D8/6
	VqiE9v+IpIwKkBoDEq1F9t+AWA3eN469VRQtQXJcjWoTvcsA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4trtft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:52:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so6285040a91.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698359; x=1779303159; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WHOT/4paRhmqMIJlArz9f+jJSRMrFl3T1rv/TsK5ZY4=;
        b=YYQkq9KCkWcRfI8r3xzbDLYMMX806yN5FxVaOoLRkV20WdWhDbnq3DVfBxS8HaZOET
         B7Kd0ukEpgYURWDjHPA6s4NqYrK8wAjBqw8RlzmFgQfyVM9YLiVi4eE0rScsxrVnmhdW
         BOkjAcBMCCcY++vNoEdefPfmDE1Cwwr4PW9Befcb42Hab0i8QD4EHwJ5N/Nyrj2qgEom
         qvXN0TNoKDb/YEhxBZ6X0CeCCY16vvXJWGxrTAOc8IX/DQxQNC15Inj7mqcuQ9yphfln
         6KLYsBKHKg1HwQIOC+Vc+X100glcQpXycKBdrvfXpmNr3U7slOnWB4rleljrrxDFJkVS
         wHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698359; x=1779303159;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHOT/4paRhmqMIJlArz9f+jJSRMrFl3T1rv/TsK5ZY4=;
        b=LHDuPmR1ROBgbYsmsDdusD7UrGJcFm4ZRVgm5KROOLOVe5L7LUYFRPS7fnBep8QVns
         kYnA7jcZB3rYWvvGENs97+tZhlaselKMxWA6/BS8r0UOc2oDMeZEk6LiCHXjIOwTADfV
         Xymg4sne2nHSKpA4aTzlG7m1FLNApbFsw515sXc9oj0lSSQNVh9UuDNmvSmvsUkyL8HX
         xJRyZA/+cd3MbWHc3msZ8tkRh44t8JYBnA1zyZwwNReYSXJUxKSToPvfAFhzfdCKi6wE
         LY4X505SVZSNg/oPBjg76a0p3xng7WkBJWBAnvbJyNQPOhWyd49amAPu4yjzEu6ySwIp
         g0Iw==
X-Forwarded-Encrypted: i=1; AFNElJ+72fj+JrH2w6GjnQ3gKsXLligrMw3wBnj3H3epAwggUEs87cuOQ5hB8t7aSm0bqn77NtEuaayomZFH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3v6ZZCFChVjWrmexTKJcZ+CskHtqAhvkyTdNc9QGaJ62bBJ9/
	8dz/7XNNEt5GJPMwTiQufx/buOCte7P+dz7+GAqI62T+igRvjvizzlvxcx77suj1JmKxd+/5TLs
	WVlHGtXYfWXTz+YEoQ2/vkx4qJfZ2TR2fQxbVjuBcyfbI2ouFfO+7x84FRTQe8i7R
X-Gm-Gg: Acq92OEO9MVX4EMDZYbbXSGT2VUHoNMN0YY2G4zcj7MZaUIWF7PzW6vD6djM4B1y4sv
	FU+qHs5X5oAufN3ZJk0rKCOJdVv9dIWtzGY3hJ0oTfku2qRLC/pMCwUNQvw7IZ8U+iXZsj1Wbov
	gA07SzEG4h8u6as7WyuPml9nd/gfqzJbVvbvEF3U9+5S5YiDM95j+4Ex6eMByB0kQbG474fOXp1
	ETjGIp+/BVcxm8XQNKdlNKOgdoaxMqjxOvKEGJisfldS6eCKqdNYFDq7WwaZ2T9nEEPLsX1T/YO
	/gaIP5UaQE9HQvBfQR9QoWvH1tn75MIwyOuFQg7kme82pE8o9bm+2s5ctsoOqMwG5X1beFSz2xU
	pfnstdLzOLKeYHwUr5QYieDifbik5AkoIUKviFXUyQCNiDE0e7iI+me8=
X-Received: by 2002:a17:90b:5883:b0:368:f0a:1c48 with SMTP id 98e67ed59e1d1-368f2dcd468mr4923183a91.0.1778698359188;
        Wed, 13 May 2026 11:52:39 -0700 (PDT)
X-Received: by 2002:a17:90b:5883:b0:368:f0a:1c48 with SMTP id 98e67ed59e1d1-368f2dcd468mr4923156a91.0.1778698358696;
        Wed, 13 May 2026 11:52:38 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee626a04sm3660219a91.14.2026.05.13.11.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:52:38 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add support for qcrypto in kaanapali
Date: Thu, 14 May 2026 00:22:19 +0530
Message-Id: <20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGPIBGoC/0WNQQ6CMBBFr0JmbclQwIgr7mGIgXaQqlDoANEQ7
 m6BhZtJXvL+mwWYnCGGa7CAo9mwsZ0HeQpANWX3IGG0Z5Aoz5jIRLy6/j4oEoh1puuYJMYZeLt
 3VJvPXroVB/NUPUmN23wzGsOjdd/91Rxt3lFNo391jgQKpEqXKrtQiiq3zOEwlW9l2zb0B4p1X
 X8S9cCMtwAAAA==
X-Change-ID: 20260424-knp_qce-00f9df3e2039
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Arun Neelakantam <aneelaka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a04c877 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hpg_QQ1ef3WCVlx-FDkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfX5Yms6LuroKnG
 H/zBWUFS3yANH2Qy15UsNomo89YNfq0pMNmbcCqa4KRtNdHyRr7SkibN3XwQOfH1Cu/LBGcnvon
 JvgxbNOglMV7wAJOYqpXq0ppla3jVbLnLBQ39giYsShQV099VOabyVhqYVPjzJA5ve3KrIY+Cbb
 5m9LGxfk/S29wuwB7XJu1QWeKLhFzOat7cc2zbOvIK3TFp4DCkZGFu91OkRjle8DPmCpE+YuuA7
 oBSoT0auV22Mk84+j3Le+geazCJnAoggSo2FOn/8lPpbPTWPSheLDxEQIXiFKtlm4KJ8cGgDGbD
 roNvDQch2DKW2h/FqHXTDbZjsxoRco9KxBrH89AhsxndZJZcBdW64ytBhRcKRTUmGfq7fBxhrcv
 tXZyo/0O/e4DgNpElqdv9u586v5MKrGMkwgbiL8qbV+QAjWFXJivMtfFg97pRTKbCxBpoxhCvjc
 Tj4rMDOuGtXVN6f1TAA==
X-Proofpoint-ORIG-GUID: yAkIOoeDj_FGhXyNa2fhwn8wUF_odDQU
X-Proofpoint-GUID: yAkIOoeDj_FGhXyNa2fhwn8wUF_odDQU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130186

Add qcrypto and cryptobam DT nodes for enabling qcrypto on kaanapali.
Validations:
- make ARCH=arm64 DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml dt_binding_check
- make ARCH=arm64 qcom/kaanapali-mtp.dtb CHECK_DTBS=1 DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
- cryptobam and crypto driver probe
- kcapi test

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v2:
- Update commit message for patch 1/3 as suggested by Krzysztof.
- Collect reviewed-by tags.
- Rebase to latest linux-next/master.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com

---
Kuldeep Singh (3):
      dt-bindings: dma: qcom,bam-dma: Document BAM v2.0.0 compatible
      dmaengine: qcom: bam_dma: Add support for BAM v2.0.0
      arm64: dts: qcom: kaanapali: Add qcrypto node support

 .../devicetree/bindings/dma/qcom,bam-dma.yaml      | 21 +++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 25 ++++++++++++++++++
 drivers/dma/qcom/bam_dma.c                         | 30 ++++++++++++++++++++++
 3 files changed, 76 insertions(+)
---
base-commit: 4c406406070d57dbefeaad149181785330c23f92
change-id: 20260424-knp_qce-00f9df3e2039

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

