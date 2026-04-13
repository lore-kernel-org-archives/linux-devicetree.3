Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB02F3218B3
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 11:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776080908; cv=none; b=skJLKxOk7XN6i6+jqU2a0YiZQo9I97qTmmVCKtrpIQSL6guEY4BVkGjXfZya0H5nyffLV+NGNJ78/BOMK+/CfJRqT8QOXvupFl0ZfPsBFHPWDe2ZhBLeLuUBDdX80YJnxMoxwTkAuKub0Tl9SbXBCVxRmsWkRfsudTfK2By/d68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776080908; c=relaxed/simple;
	bh=aHl0fa1quWQEYH+LJ/cOsoc5q5lRYy9SI2o7adDAxAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qX2e/xexNVt9e/SZEJSl8fWfbMHirLK93sVDDIyxrnYrSsTLQnlfhdm1qAk6pRIjq5OFSysm0wFkuIs8vMkTlXm/t9LctWtXe0XwzdqmMrIFqgSOATEG//PNAfzPomOzbJxKbk0LxMHZRaB8QqtXtZf+UiK6bL5Re0cveqvD5i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLzzxt+2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U7tkS7Jq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLzzxt+2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7tkS7Jq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5MNdN2785003
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 11:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Pfw78ALMazQMNwKFhUwMZ+08i/aI2HMsVWb
	t4kZanXQ=; b=BLzzxt+22flapDvATEN6x3ysl/zmOBVLIQhDheOMWVP8J+v4MAs
	ZNXNu7tGfV8/fGS5PFTLqIhaujDqtoMwf2pUrbwBKOmHiclF0QFMPu140ZcKtqWr
	GfsrY0DiK+7me1QmCp9+Q+Efe/JYSg68ff3+3LMfzI54ROJd/UB0HXtVOA40qrg9
	qfN5MxGopVbvAXiGlJmn8TU65A66Q3xbeV/d7xC7hBNIhiQE3f2BUiMd9np6Vx7m
	P2mIKKFCY4kFpd7PT1cAbqolStulaSYda18zxZiLMZHi9G+Oc0tWX41i2gmsbGcp
	O5zuUB137+i/aZfqzPuLJS5L7BgPGeS0QuQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpct93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 11:48:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6e81e82a38so199199a12.3
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 04:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776080906; x=1776685706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pfw78ALMazQMNwKFhUwMZ+08i/aI2HMsVWbt4kZanXQ=;
        b=U7tkS7Jqy/FcyNVegYMoy41lKhWi/OD6AHAW8AnTwVpF9Sh+fasGg9ta52XHiFo/L1
         7vb9PGq9DfOmEqV+xOItdem/99eximZzHHRMK8rxImS6dpjx7sD1YCnxL1waLfHjekkm
         Zw04QP/REC3VKN1nqTiyF7LCF7VH5xS6bilMyzzjlFWNlnH1b6PoDtPNxcVVaXZomGBe
         Ya8r6aVB7LrQxePQFEcpwKfbhw2qab8RghMF3GrDy5e206ixSBGJfTlMKCnmck8dAjm8
         BZCPfYgaLxNY5KueKOnFpk9phUpxOzuQLASbTpIPnwXvDwUD+G2yi4iIc6tCZfffsya2
         fwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776080906; x=1776685706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pfw78ALMazQMNwKFhUwMZ+08i/aI2HMsVWbt4kZanXQ=;
        b=JbKa/S3RUpH8Yv+hd8y4nQaYIuMeOskFgpHVV74ZGIcCOk/ZCSsMicIGYhrIRNNMon
         xFNTgi03R3J733+sYiB/K7jiYcDtY/s40RiBIB9vfzGX2thR4ibYriroeOSKqQJAql20
         Xy6wMy9MzlrAmMmIf0iU7xffjy0QwQq56i6y3D/LSNH30kC9J829r3QOYN+H83L82ULm
         PRlwH+Tezkk1JKXy3fLKyWVbYyHvavrUfzG97LTkmsDJjTs68OGOqDqhTRBp5XHq8gE+
         lAIO4Qi4juQzrOOw/1/iwbgUlUxBBwbrhEUZ6lEfmQCSUFGATlILOXldfsQrg8v7ShaT
         BAAA==
X-Forwarded-Encrypted: i=1; AFNElJ+KV69jw9OncYej47X8oJ0I/DqthdBzAWkpFSo0pzQovUEFpqEuu/rU2FHcw3uDYTGmbgLs/iDTT/9p@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl7x19VwQ0UJoIVy8zpEDtyeOyChVScFUv4A1VbF5ZN6OjPIix
	hTwRp57WCMiRzTsJQlfVpCMJ4tNW3w8YnCuHpCOceizHz2GRV/NV0xMosR6F8yazJnk1s3G73A1
	k/jR6HCIyPWvtb/1dEmbmbxmFXK3//r3kKUQrCzgsskMfeJFRvepG8oFL6QYt+JzsKOJ1xlEg
X-Gm-Gg: AeBDiesPKtY1jbXCxzpyW+vzQpo36Onc3BRjYQK1CoorM0rHZfausbHNR99fxR/2ILj
	dWGvWfHMhqCMnHD18g+4zP2IONzkEzd2Kn5o3MrVOxLPxAHXgZ7lGp/fjNcCPkquBpng14gNicq
	FZ1wDHvT1D+HbWQ8qlzKxmx/Rk7wVZMNi7j3Hs+v9yGBPwOzVTju3VWELU1l1VFRxGkebL4a0zc
	2On0gjHz3ovdoGEBFMgMigKbYINzmbGWMpNdosb7vcpvH7G8xcSq8ryBFt9P0xs/fiGPjqnH3j8
	QMyCzhKqrYrcOkRHJNjkP3wkGo0LxT3p4hAv+BOVyCfhbBczrjf6B9EWg1UeUDveuWqN/rSmULG
	FN8FYVoAJnmJbPOuSk+0RCvYcN5A8rmW4wyzztldCCeWm64xoZ59r
X-Received: by 2002:a05:6a20:da1b:b0:398:f074:ad07 with SMTP id adf61e73a8af0-39fe406f9a4mr7664958637.7.1776080905873;
        Mon, 13 Apr 2026 04:48:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:da1b:b0:398:f074:ad07 with SMTP id adf61e73a8af0-39fe406f9a4mr7664927637.7.1776080905203;
        Mon, 13 Apr 2026 04:48:25 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a12adasm9822453a12.26.2026.04.13.04.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 04:48:24 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com
Subject: [PATCH v3 0/3] arm64: dts: qcom: Introduce support for monaco-ac-evk
Date: Mon, 13 Apr 2026 17:18:16 +0530
Message-Id: <20260413114819.3894307-1-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dcd80a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Li8ycNgQwKCU7nWBN7QA:9
 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: NX0KfX7iW2_uK8BQUjyfxUKVTW5-PGiN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExNiBTYWx0ZWRfX6/EZE56Hv2zM
 QqHhju1L/NRaGqn3lNaDG0vh2ShjuOG5iC8jF88pCkkoIxsE28LSCINBp8qfLwrNPhwpogIGvLD
 WbZftVNPxweNzJK3ue83TiJRbVHy97SooIZytaY5MXTNDbbSuwISy7PwY3TyE68QDT4R/SelyR7
 3dZ871HPoStzKbc6yKasnaL0l8H3vrEE/enX3LrAy7Q7h0wvr/Tw2ywT39KeWGmz1mUi+EA1G6a
 /im/fIy9uh/QT6J02MgwoSVZGYt9TcKBoNrZY0731NAVLnTCJumH9iZLeqXwJlqtah8sq0sKVPs
 Sjt61ezh2SixA2thVyx0N65sX8rV6ZgLfyFtiNp61OrWWKwZ+qRzjqOHGES2E1UoWQ+t0SnF+Hp
 SUYIN4New4Vy3niDPs87ebAxWq+aadN+LXBgh6c5D48hw9pGG2sBZjpvuCgwEfVbLaufCDc3Gqv
 BoBeuBX7/+0SzMaZ+aQ==
X-Proofpoint-GUID: NX0KfX7iW2_uK8BQUjyfxUKVTW5-PGiN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130116

From: Umang Chheda <uchheda.chheda@oss.qualcomm.com>

Add support for Qualcomm's monaco-ac Evaluation Kit (EVK) without
safety monitoring feature of Safety Island(SAIL) subsystem.
This board is based on Qualcomm's QCS8300-AC variant SoC.

Monaco-ac EVK board is a single board computer (SBC) that supports various
industrial applications, including factory automation, industrial
robots, drones, edge AI boxes, machine vision, autonomous mobile
robots (AMRs), and industrial gateways.

Compared to Monaco EVK (monaco-aa):
  - monaco-ac delivers 20 TOPS of NPU performance vs 40 TOPS on
    monaco-aa variant.
  - The power delivery network is simplified from a 4-PMIC arrangement
    (2x PM8654AU + Maxim MAX20018 + TI TPS6594) to 2 PMICs(2x PM8654AU)

Since the two boards share the vast majority of their device tree, this
series first refactors monaco-evk.dts to extract the common hardware
description into monaco-evk-common.dtsi, then introduces monaco-ac-evk.dts.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>

---
Changes in v3:

- Extract common nodes of monaco-evk and monaco-ac-evk into and common
  dtsi file "monaco-evk-common.dtsi" to avoid duplication.
- Update the commit text and cover letter to justify the re-factoring of
  DT.
- Link to v2: https://lore.kernel.org/lkml/20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com/

Changes in v2:
- Drop keyword "sku" from the compatible string of board bindings
  - Krzysztof.
- Wrap commit text of dt-bindings change based on upstream guidelines
  - Krzysztof.
- Link to v1: https://patch.msgid.link/20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com

Umang Chheda (3):
  arm64: dts: qcom: monaco-evk: Extract common EVK hardware into shared
    dtsi
  dt-bindings: arm: qcom: Add monaco-ac-evk support
  arm64: dts: qcom: monaco: Add monaco-ac EVK board

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts    |  31 +
 .../boot/dts/qcom/monaco-evk-common.dtsi      | 900 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 894 +----------------
 5 files changed, 934 insertions(+), 893 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi

--
2.34.1

