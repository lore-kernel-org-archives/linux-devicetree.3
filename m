Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409B03AA4E9
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717761; cv=none; b=XrmhfBg7aLWvg+FR0YrFeimp2/wx+6AyhrGrARuDQ4i0rPApKPkEmb3H8S05R/TnZgTDN6oN8UaLRYU6mHePzOG5OhHAGPrg/iwbrwu/A8ItUcoyBkj4PUAphEyZB85wOxBXuAIoVGtx//GNjiSCMhs6a09SX2IbKA7n7UGTqWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717761; c=relaxed/simple;
	bh=ngdTxAvXfG6ndCG3TfQS0CmbH+Nqn8eIjLuojkwWHGI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lZ2aF/Phuy3UxACO7bA7N/3BJbeg3g7EnKdtzC1Rop1KGc8aZtpmK9iihlIQMrHYrOYIFX+hDs8X0qtxgY+TCean8U3wD3gmiph+2sod/amF7SFTfksWqraON+Us2dOufPDL++3Fj1EeBjr1rg5pBRhfwTDBCxuumSESJFuLqnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zl79R6ft; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YLJv9lbG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zl79R6ft";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YLJv9lbG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x9wS383782
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yc5dIbEuM+PGY2hwvnsliH
	cBpFlRH+vWpInuyqh/tSw=; b=Zl79R6ftBfX0Q1m8/Z/4Bkw4R/sEm/Z1I8E831
	7huue2kc3agQDxFKkGzbuxzzmeV7xUIJcqQ3WJ85cZQ4gvUjJ1in53+AbZeIHyKT
	wc5nFLbHW1dJuReLkdazTn2tjuj+o/fUzu/1gRbbcALArOYUzRRARd1Q28K+xOEX
	y+ugUSUwJKokvrUB6y98hVZBmQxR+g/Fp5hSIyunXDzQgNm7BYKZWzf4sYLxFpB2
	xEaB6tQFhw4IQPHm9MtM9k0ilQ5E10nck+AsJtMsW3twgKkP2uD73hw9SgXxpCxo
	JyJ4LFKGFYiVVkfYUXh8b9KgiCnyKMRPCXUMkGXSDfm2gsBg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs928wqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:55:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb7049fa552so2836646a12.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717758; x=1785322558; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yc5dIbEuM+PGY2hwvnsliHcBpFlRH+vWpInuyqh/tSw=;
        b=YLJv9lbGRg6prqRrQsC+4VO0NK/o/hY66KxEEJn5TY853V8l2SvPagaYw6tZoiQxsl
         Ewf0xT7P13x9nOnZiDpt5hMjOh9ALoCOY/K/3WIEu4u2JQWRAkELtWNwwnvBjhKkbz1u
         F2lOnf5jzSD/I1OwnTn4dOt22DlRSFOljiQ6e1Q0DbQeGsi/skjrnaBiFAY5mNa8YKpb
         KXzA0aApjqaaeVr4MZBsduDT9dGqjb8lpWGy3Lq/gRPwXF2loq2nhsmU/e3fKILSBcPf
         nL2yj811xmBgjpFIrdNNxRG4Rj9jF451QmscIx+kuf5la3TwySKvez2dJDgt3w01E/hk
         1l5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717758; x=1785322558;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yc5dIbEuM+PGY2hwvnsliHcBpFlRH+vWpInuyqh/tSw=;
        b=ID5vf4mwSXupT9zQYBI214kNeXw1p6q3p7AWR20lryh+QMlQKjvD5tsIsIAStDWGl+
         qMntintkTP+t3l3svuVMh/k65cd+oiRHwRDEiPXyLhflDVXXyDWdBIzlge1hAfgAH6DY
         gbEPYBpulijEqEDbPLwEMCGHzwTe0ZL0b5GzKXxHmcFfGFMCWuO9vGBUhlQiROzphCNk
         Te8GAHEirDhkOTb5KHt2C4vH65dT9ra3n1ZSEM+e1F03WFhZY5McrxjsDT6VGYQtbKxX
         P/viuIQOmKvA+eJZvQh24CVCAJodTlY6J/ZRn33cBtDgjEwMYZRrrC0muBt1XNm7JgkP
         Fqcg==
X-Forwarded-Encrypted: i=1; AHgh+RqhmL4rp+6NuE64blbGg+tVY3oGYkjAumEIPT1H/moE2Melv9JMIZur2WnCbRHi3Hkv+QaR1xX6fMzB@vger.kernel.org
X-Gm-Message-State: AOJu0YwhL27Sw75z5F0JwDtAd5a1QoNVjmAeDgjlk+w7A7lzwctg12Mk
	2IH0lbAqNVGu91LIfszMzsubqtMwUx3gAPlAFAiVs4JQMDPHOaEMBaC5ZGG+Fe8KMinFVWS9DsJ
	pru3Hc67CmQ0jEZR9vz8atepWNItTCJNPwkZtejH0SBQaDsKufggGBVKDlSlwj3cjjNg5+c/C
X-Gm-Gg: AR+sD12bkRpi/6iTAapPLjZdmXLcn1yOErkJR2esvhllg+YUiuO+SpigtIHkCvaiNK2
	JSz2UzNpZdjtEXgmNDBh7gLm4WJtBYTbB9WNJjvFXgHiVZRhmNOyp0nJXcRvdzbUembbLG62YBL
	QsH4H63Jgmr+3HP2eAruu0Ulsz9nvYz0StUNPCTm8Y4ZLaXAA3fLP1TabvtisdgVsox9lyMfE+M
	tfJjuUcAiIKavmOQY2yugk7W0r7YHIjwy1Jit6+nCe1vX8b/MlSzyciylrlF8zx/kFpuvVHbmaa
	YwLAxDxQwFkYVw5+wOUDmTHxFJDRJ07r2bSTz0r962b2tfhfWFKWyh7/F7uFkJgLAZqdTEUNu+i
	hXMHOqFfsREgJfLKFbuEf4joGR+AnyfOoJZf/z1U5wdHydsUFpqMgmvbQTaSiBjwq
X-Received: by 2002:a05:6300:2285:b0:3c3:6c90:65b3 with SMTP id adf61e73a8af0-3c3adb086f8mr23935695637.65.1784717757679;
        Wed, 22 Jul 2026 03:55:57 -0700 (PDT)
X-Received: by 2002:a05:6300:2285:b0:3c3:6c90:65b3 with SMTP id adf61e73a8af0-3c3adb086f8mr23935665637.65.1784717757221;
        Wed, 22 Jul 2026 03:55:57 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1302659fsm5809160c88.8.2026.07.22.03.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:55:56 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: dts: qcom: Add Kalambo SoC and CRD
Date: Wed, 22 Jul 2026 03:55:31 -0700
Message-Id: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKShYGoC/13MTQ7CIBCG4as0s3YaQOnfynuYLgaKlliKghJN0
 7uLTdy4meSd5HsWiCZYE6ErFggm2Wj9nEPsCtAjzReDdsgNgomK1VyiOuCVJnLKow4DNlXLBbG
 9UoOAPLoFc7avDTz1uUcbHz68Nz/x7/dHNf9U4siQOKtaJUnUsj76GMv7kybtnSvzgX5d1w/Ke
 dhRswAAAA==
X-Change-ID: 20260715-b4-kalambo-crd-86912a03bbd2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784717756; l=1647;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=ngdTxAvXfG6ndCG3TfQS0CmbH+Nqn8eIjLuojkwWHGI=;
 b=uO+TOiA+n/EQfucHWnqlmjsdHsKD3qPsDuVauLRwAi/Pfqk4Liz6xzqVGy/NGiClpkL4O5DAV
 Tht6XsG3vQiBHLXmDyhtTjmYr3VfXyHM8X3ntnllLBOl0Hgz0fA3DLa
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfX5WFyd/5vbVXd
 94dmB8VbyArrsYNv7hEufgviEWAw83JMR51UVXFaQt2nsmyInBYfPhEC10bI2la7A+0wZYlRAty
 y0frgTdjEEpFoiWJniNO3HaJ/6vuB6k=
X-Proofpoint-ORIG-GUID: u7K-i9JQn_UfBofrzCVudKXXoZjqs4WD
X-Proofpoint-GUID: u7K-i9JQn_UfBofrzCVudKXXoZjqs4WD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfX1nUFqrZTY4n8
 rkmbXugG5B+Htds0sZnqaRQBNeWBeLlrt/qMyh1l9cfi+wt+opm6WTUbN7wCcxyozbAxmJeX8Cr
 hVCeq+7FcaVDfF36lP6LDq5cYr2rABB/9zb3M91IK03BKpYQeaL+WZBX0mcgBa8An+v7yPNQxDI
 kmb4Y7izVsDm92mmgbwsFF5XEj4gSOHLro7CdQuhrCuoZHkEY7KmSRWKzZG0GfNlfZ+CkS5d6a0
 nY0keLX9iFihQPDqFRrrr23HlJiF5xbXhFVnlnsjW6RScaQvfLeSCJZQZEYjW0vMToriQPBMHkD
 nVkWna8XRDlw8GvwReC86m2VJun+BLLlxDIJLv0cojTDgxO/uhCInTyUcU6kc8C65xLk5hMWr2z
 Er7lqgHIIFK4mSAS6rjwNKMUFjPi/fmO6cRCRvuYTcpWJZbu1VB6rxHLWGOU3aa+5ekCiBfWCT2
 K47ex/drsU5kc4rU3vA==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a60a1be cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=C5uekO2B6f1wSzXi7RYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220105

Qualcomm Kalambo is a Mahua derivative with CPU cluster 0 absent,
leaving it with just cluster 1. Everything else should work as-is.

This series documents the board compatibles and adds the SoC and
Compute Reference Device (CRD) device trees. It also adds the Kalambo
compatible to the UBWC configuration table and allowlists the Kalambo
CRD for QSEECOM to enable access to efivars.

---
Changes in v2:
- Fix the cpu-map and SCMI perf domain for the single cluster.
- Give the SCP shared-memory window its own IMEM section.
- Rebased on next-20260721.
- Picked up R-b tags.
- Link to v1: https://patch.msgid.link/20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com

---
Gopikrishna Garmidi (5):
      dt-bindings: arm: qcom: Document Kalambo SoC and board
      arm64: dts: qcom: Add Kalambo SoC
      arm64: dts: qcom: Add Kalambo CRD
      firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
      soc: qcom: ubwc: Add Kalambo UBWC config

 Documentation/devicetree/bindings/arm/qcom.yaml |  5 ++
 arch/arm64/boot/dts/qcom/Makefile               |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi            |  6 +-
 arch/arm64/boot/dts/qcom/kalambo-crd.dts        | 21 ++++++
 arch/arm64/boot/dts/qcom/kalambo.dtsi           | 95 +++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                |  1 +
 drivers/soc/qcom/ubwc_config.c                  |  1 +
 7 files changed, 127 insertions(+), 3 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260715-b4-kalambo-crd-86912a03bbd2

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

