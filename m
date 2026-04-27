Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B300339708
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309516; cv=none; b=Wx8sn2//TEd/Xccz8wywgnILdloSOAiI93V3zcqVi15254bPj27zUjgT+b/q4Ng4Uajib450OxnQE8+3zihw4cKtr5/M0dF6ZAqpj+i2THt4Uy+S81lMUW2FNVWd8abPh0jjnEK2BLg1q5NjNZZEvir14fBQez1gdC2C6DFl0Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309516; c=relaxed/simple;
	bh=Zn+quWISx8wdQgasUcyf/jemL/P1NgshIDgkVf7rrUw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eXwGjvGHtRlqKidp+f+PgHNilIbtsfgT+83WMfxc+GicHbjh7/jnhYy5cRFE+3PMSvdf+GBoPbWivimfEb5Ov2cmQgkiI/sbRzCgS2YUzSfriQkQWtRA2SXtQq77tFmpPO1YMnwZRMPnMBc4ApSgqMZcroPdnZA6b7X9InbUFGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+1Jmvjw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+EZymF0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+1Jmvjw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+EZymF0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RC5ajM2006188
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0STSTfIUJw33bLSHMvbgvTD8SvlnnlxK6m1
	VbziWVaU=; b=Z+1JmvjwNgkQ30b/3P/sGwOmJ2/Fq+tzD4s1/Sczg+aDNq8IScs
	vDyI7t3znUUkWS1d+a67Jf39ofN4rf22U9JbH2vc/oO1mdPOJulbPn8qKxkXKj7U
	t0WWdPpuu4ItnKuVbOQzMXrZMOK3pZdSAx6c9+XdRV/gxD7nbUgRFa4IQOdecshL
	D40adoLjGadSgRi5L4mzuGLSJVfJSzefybi34lrPLa0MoO+q3UGcxcAZnCqj9lKs
	bdgtLAknzg6CnanGoi2OMS6vMXKXxdzcasy5lDRafYsWDr9HRQNnBz6sZ3fXqUFD
	mAIA0Z9jK87l8RBvtJ7skDBuqwmXpOrULNg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7gkh4bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:05:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3586513febcso4610241a91.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777309511; x=1777914311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0STSTfIUJw33bLSHMvbgvTD8SvlnnlxK6m1VbziWVaU=;
        b=P+EZymF0pPnnh+vH96Ao+N1bMLYS8pDcy4B0HbY+PdmG4orDqR8wZbVbe82ntEqr13
         yqoQ9jal3KqS4r5WRzVEswr2sY4D3FWakJZYljzmf8z7y+ciySFywOd4JEZ/5+naWZue
         2yiCww25QQevkmqD5DU5TnobGxqAFHpMQcJReVbqflzsx934/m9AdsB5HEsgShoIdQJy
         499VU2bixXc0IjG/U1iZbQdizOFcaS4kKvedcjMl2z/+DS9TooxhqAFpVLd+YFCb/R67
         3WtCHUJ1Oiss0i4jipCCglF98Mn0xG0jP/7I6kimUMphCxYvANnVgfgLUIeD46RDGJWq
         qC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309511; x=1777914311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0STSTfIUJw33bLSHMvbgvTD8SvlnnlxK6m1VbziWVaU=;
        b=qXWqmbL4DGKOIes4NZ//Ke2BePaYXm3vE9Ddzo4v2pw68SnBqgPKxxQeyn4xaePkKe
         CUY79AfE1u5oik45i926PYUOe9S2hn6R5vWfasO+hBh+8kg4a7lUiA6PYlhkttR0xt0o
         zjuqtktfHDDJhAmROvfCCYOZQapzIYReh785Lzjz0XnYo4R+g4QO0FKdvmWIaMUVJjlC
         PGi4iDb6BeiAQ2dXxvy8x5313Wo88KEDTLJdMvg2y3dT8NM/ZX/YbIMAUpdsWl0S8dbY
         5cpS0F5JaDQMbghaIrJ8DogDpfuvwZS6N/ZgrAtvcyBUxhPZAL/Xx122jgUoHETcIiIJ
         Wxxw==
X-Forwarded-Encrypted: i=1; AFNElJ9qfDeiYX6EKVnyiU/K3yuqGi4RiqqNnps6Dw3ihrj0SnvsI8uBUIwYr9KiIuv+pCKPlxFA4ibbR18P@vger.kernel.org
X-Gm-Message-State: AOJu0YxBmPF28C9c34V22/D1fuNT5bk6vL5W+gUfZ+3OeNBTdjGvfKgS
	mmDlBqrYHRxchtoh3WaLEAveuWY2bS7lpqDciPAj45HIG+CIeDlBJfaB9GC3Jf5jmzpAMSU1XAr
	/tYWlm3POeWkINvreEZMZEW4rHP5A8tR/cZWF5I4Bio5lBiartKznyuEq6EHZc73L
X-Gm-Gg: AeBDietjAGQzYzyQMJoKPbK/WjpKM1wpIndZhQ5hsHKmNExmOlUI4P/HXSp3+oGen5D
	VGkS7EsvwRzRBF4WPwsGW+Bc6AM0fglTj5gq4d0dS61EdcoeKCVl5uHS22DqH6IYMZngipFe83J
	sU4gkZYwvuO063VcCl8IBJueARkeBo+A3NcW+ZvVqj0csgNMeWWjHbvrtNu0sHhbS/WhPd7Nx3O
	/OdqQPEQPMRtA41g/MgtLt3gtz3cqMw0o+HTybK82k3tN4/47FiWpPOlzabqed9r3hqhiRj0EWc
	k9wqnfMJglaa5NRchWZbbMYVxaVJP0w0EH5kF30olI2auqoyRpI6qth7R0F1rvlzIuN3c0dgEqC
	hDUoQ/p2jrGpmR8bXGVHk7pOy6r/nNoUCUYvmxU4c334nOCWM3eWVUoS4SkPjGY4=
X-Received: by 2002:a17:90b:224c:b0:362:bc8a:9c1a with SMTP id 98e67ed59e1d1-362bc8a9d80mr16809742a91.8.1777309511281;
        Mon, 27 Apr 2026 10:05:11 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:362:bc8a:9c1a with SMTP id 98e67ed59e1d1-362bc8a9d80mr16809697a91.8.1777309510623;
        Mon, 27 Apr 2026 10:05:10 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490025d98sm99313a91.4.2026.04.27.10.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:05:10 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com
Subject: [PATCH v4 0/4] arm64: dts: qcom: Introduce support for monaco-ac-evk
Date: Mon, 27 Apr 2026 22:35:01 +0530
Message-Id: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5rqlu0ghrgcJ5y9UoRgAmcQAwF4JWl0D
X-Proofpoint-ORIG-GUID: 5rqlu0ghrgcJ5y9UoRgAmcQAwF4JWl0D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4MSBTYWx0ZWRfXyV/K4g4svd+L
 1vLNtmRqdWk9lnjCnqAtP67Vua8eK0lyJGw3TbQUW3g2P9Srwj8jL9ZE7EYFE3tPvKsZGSE39VY
 WmfIoP94TYJSAAyUioHm595QACwjxWTYCbY7Q28bq3HoEkegYfMJBaJLcGArXIe+MCMi7MEpyGq
 zL3O6gyqqkEb995DQVol1au0yd4XG6f4Rw0VjyE2wQUSj8ocld8s9hSatQDDtxjr02lodMykwlF
 RKFolozjmYQl4rLx0XWlDfdnE0Drjza1TBWCnIsAGIOAfioQNINBvMjOqu9+gKDDqjbv6SuLLhU
 cMPJTH7QEMJZxgBv9tVsCIxv/yB8+PsZ5wmWkKoIjVKxlgFuVDv/CKzXn9uzXAAKOgS8dWiVS4r
 FylWr4ZzOIxupC88EEPiGVCFBY6a59PYPzYJo4aIGiyakkLHg+w8WAvj6R7A/ELC9l1bW9XuwGj
 DjBmPr9W5Iy9CoU8s4w==
X-Authority-Analysis: v=2.4 cv=bJsm5v+Z c=1 sm=1 tr=0 ts=69ef9748 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Li8ycNgQwKCU7nWBN7QA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270181

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

Also, monaco-ac-evk board supports monaco-evk-ifp-mezzanine attach, Add
support for combined dtb "monaco-ac-evk-ifp-mezzanine" as well, which
overlays monaco-evk-ifp-mezzanine on top of monaco-ac-evk DT.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
Changes in v4:

- Add support for combined DTB "monaco-ac-evk-ifp-mezzanine" which
  overlays monaco-evk-ifp-mezzanine DTBO on top of monaco-ac-evk DT.
- Link to v3: https://lore.kernel.org/lkml/20260413114819.3894307-1-umang.chheda@oss.qualcomm.com/

Changes in v2:
- Drop keyword "sku" from the compatible string of board bindings
  - Krzysztof.
- Wrap commit text of dt-bindings change based on upstream guidelines
  - Krzysztof.
- Link to v1: https://patch.msgid.link/20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com

Umang Chheda (4):
  arm64: dts: qcom: monaco-evk: Extract common EVK hardware into shared
    dtsi
  dt-bindings: arm: qcom: Add monaco-ac-evk support
  arm64: dts: qcom: monaco: Add monaco-ac EVK board
  arm64: dts: qcom: monaco-ac-evk: Add IFP mezzanine overlay

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts    |  31 +
 .../boot/dts/qcom/monaco-evk-common.dtsi      | 900 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 894 +----------------
 5 files changed, 937 insertions(+), 893 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi

--
2.34.1

