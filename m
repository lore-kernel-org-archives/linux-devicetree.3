Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C10B3A1698
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270711; cv=none; b=YL+G5gWfOr8+D2DzWVhKq2V2gAShK/UrJevOCF9GbBm63FlfunWr0NNob4gu+5Q+lY+6ZWSHao7f2JXEfBEiS/UB1w2u8eGzEqlh+xd1aR+MFsIMcHdzvK/pjEmE21FzeB+5W5J9eRxXB2pahLNrBWDBf02l1kVUKJk5Yy0RbZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270711; c=relaxed/simple;
	bh=Wi6Y2BBnsOM46XGjOTLIrgWTvNj8GRhq7EiHI7Vdrwg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H13Nam5nyA8Pgq9a+MM8FDFML8iH8qfMOZ1sNUd1pqCZgNDdb9XQ/Cf4QuqjnRe8pYVjH90LhHSM/bF6OHBsZLCt5SNxBBgYZ6+ETuMpf/ExkZiEBxGy9/uV933ni9jTjksFRt0TfywT316tGopfUGN7iB/NTtpdAL/VkJsjEZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUO+jJXM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OuGJ1eQj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUO+jJXM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OuGJ1eQj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N73Jit3452104
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PmXbEe4RrtLmKI+wjThuaUJn4LtpM14Al6Q
	ZbrWnkaI=; b=kUO+jJXMEnRIHtbIQGzgHfoB62E41pPCxRaoMRIVDlI3hSyRTGD
	5xMBE9efjjSUby/gFadznBeJDdNruGabFXjPDI/2QNeytPWa2xqZH7jHSM81ByXq
	DDsaSdy2JdKoOASIUuGZiNn59pceZrawZja0s00N6yFFuSZkw2OJmU6oSO6D05nV
	KtVc4mqBLUoQK0niah0z1L9kG+Wy7NM8djS7IiHW8leCnRyc7vMCE3WtGm5QYUF1
	J7XDuAX0JDjzn4YfmIvwEb7yLO3Enw0t9s4QSmSB1IdSEaKT9p7jSQ16EBDoDLMp
	OSjQMkPrRFZRwqpX5eKpu9CZHpbAapCp1ug==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8kbcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:58:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509070bda13so325063951cf.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 05:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270709; x=1774875509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PmXbEe4RrtLmKI+wjThuaUJn4LtpM14Al6QZbrWnkaI=;
        b=OuGJ1eQj4BijZh/1eccPUuFgoy7ykpDLHJLH61CTYFvWBBftP7SXF/rNs7aA7V/I+7
         caTRJhVxCH9rTVn5cxW1N5xiuhHaz/sa6lHYzs3sR3Q1Qkqp6aTOYhDcnGLlUfmXD2fs
         ogGo+PvyXDx4FwLUMbo/eN5MVHYKKeiiP0oqLjmrZfLz6J/M76xnSXfHoWnWz0S/MXAL
         4bDNzXWO1qmR0AdfTpNMHFFKBFyKh5pGl6W+qYwRw/E4XShM7S/WWL8dnJiVXoD0moWY
         VkFmmFx4hpUpQ+OSZJHx3+qekTITfwTbLMQKlyrSvpdIsqtGgzt34tldizWbMYZXGOWR
         CuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270709; x=1774875509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmXbEe4RrtLmKI+wjThuaUJn4LtpM14Al6QZbrWnkaI=;
        b=jRC3YYp4NEOKRayocS73mATmFWTvtM/B+VP7Z4DrjuWg6DSmYy2JwbCQ0/zx8BT6HR
         TZO3o2xjqCnMwUVB/LtylDOxjeJ2fw7/EwIm/c9TRVMiMV/3XfQRx6D59xV0cMY8A//R
         EhiK3sP4/3q42fIz1rvX/CAL8xkqZD8GNeXhaS/PzpvajU3AX7UQJf4aGSShubL/Thfb
         4mzd0VvxVMFW9XGlC0K4AlqueDNlC+U7PiqVYD8Q4DvdnvTHEQ5wmJdR9EUFw9pjat14
         emQ621o38/KB25rIEZg6/pOAfcnAOnfCMEGJxTl4+2MlxZTKsnRg90EwqcAicZALd5Yz
         LmzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWKl7ngj3IlmCYpihzn1QzYonSyD/J+26vKlv0UnDIBChYgBq0JFlR30Uys0L/5ic9tv/Z4mnIloUM@vger.kernel.org
X-Gm-Message-State: AOJu0YzUVaPR/R/iBlyjx5z7JlfpB/GHTYuba6HVIVCzrdxFmWYg5p+F
	6NR/RVysIDalTY9ilnjBVHEDU174/heGt1R3SWYUpEnk5dtI2EMhsa47oifS17+tUBVUuLStPpY
	/Hauy5tiQDzs9gImFpJOBi7PG4dXjw1CJc+nTf0EGMGTc7qeT4MYT6du1dDnvZnUY
X-Gm-Gg: ATEYQzykKOE3rfrX0XJJquj2I41UHCaIBHvawb8PiXEEg/j93DH/EMtbAFoaKZUnkFB
	yy0SoGPHSa1BaoxDlD77p7OMGmdOcwIP9mwYQJMuRPCcFPP32fUjOwKab+XfGimWAsa+PtnJY33
	l+URC52Vm9tx786HNvB90C9GwoniJy3iI/58XGLgg+8j0zuEkQlYw3+ahZxfIVPRl4KrimjMNeQ
	rXNVMaib0ij8ZyVHoCnIT2+TxofsnYzrd+bsP7WxiifTZqDOX/HY7YBCHNK4MpdMaFxvbj7uSF2
	wBvoR/LVcT4MhmyQeYLTMmH/1/uc6Bh8wFBg4BQLLulG1ptYQSja06ivafNbgVVbR2WeoPK7Wtf
	+3RHxIdKIfkcUsux41LlpJPc2ZnY5RJXL18sfq2xvx385nAkmbOm7CN4oq1uMJQNky4mCbnRfhy
	kVQ9HGcJtq1I0V
X-Received: by 2002:ac8:5989:0:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-50b245b643dmr219189771cf.5.1774270708671;
        Mon, 23 Mar 2026 05:58:28 -0700 (PDT)
X-Received: by 2002:ac8:5989:0:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-50b245b643dmr219189491cf.5.1774270708236;
        Mon, 23 Mar 2026 05:58:28 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:d9f3:cf55:9f3d:be1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335ddfb9sm487139066b.37.2026.03.23.05.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:58:27 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bod@kernel.org, vladimir.zapolskiy@linaro.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [RFC PATCH 0/3] media: qcom: camss: CAMSS Offline Processing Engine support
Date: Mon, 23 Mar 2026 13:58:21 +0100
Message-Id: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfX+0Yhl6oUav9+
 VkUmwSJdaLbC3Fs3svbSbjFPv4fjrFx9eEo1EyPPmCAF+PRF2yL895KevjeFK/aka8lhaDX/Jj9
 v+f4emu2kp7kzQ9JacJ8+qmkwEI52ZLo8GBCqmTSQZDjrd09/IJfNoP3FMwXk0MSTlDtJv/yJXp
 JDFDvrYLIH5EZREAImAv1cLiL8ros5q4fTUZ7r4APlZb4QAH4AWX0fUtmChL1CsLmLJ6lpV/V22
 j4es4yiY7WquBAlykrHF6I4FHHOlpCoaE52wgPdzUPFtC0kRKenHRXXEvkNZBoKrb1KYT7zQOjF
 UEAwAC0a1ZQe6EiOQTVRHPUu7bvqcwgn+EMa4KDS9xLHCUgfzGU+8uNAvJSIwMi3PBtpNO3bMD5
 dsphgpt3XQaAos2lkzAWVQRgzwJgRO/LvToXlopVlkAXp4AQHgcIePhPxo2iP63yQiRbYk4iUTX
 Indcnjf1n5x/uT7lv1A==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c138f5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KcaBgNpwSxjJcJ_5TmQA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: k_HmE7dketizCvn439MZ8nTKB0HSvgVh
X-Proofpoint-GUID: k_HmE7dketizCvn439MZ8nTKB0HSvgVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230100

This RFC series introduces initial support for the Qualcomm CAMSS
Offline Processing Engine (OPE), as found on Agatti-based platforms.
Boards such as Arduino UNO-Q use this SoC family and will benefit
from hardware-assisted image processing enabled by this work.

This represents the first step toward enabling image processing beyond
raw capture on Qualcomm platforms by using hardware blocks for
operations such as debayering, 3A, and scaling.

The OPE sits outside the live capture pipeline. It operates on frames
fetched from system memory and writes processed results back to memory.
Because of this design, the OPE is not tied to any specific capture
interface: frames may come from CAMSS RDI or PIX paths, or from any
other producer capable of providing memory-backed buffers.

The hardware can sustain up to 580 megapixels per second, which is
sufficient to process a 10MPix stream at 60 fps or to handle four
parallel 2MPix (HD) streams at 60 fps.

The initial driver implementation relies on the V4L2 m2m framework
to keep the design simple while already enabling practical offline
processing workflows. This model also provides time-sharing across
multiple contexts through its built-in scheduling.

This first version is intentionally minimalistic. It provides a working
configuration using a fixed set of static processing parameters, mainly
to achieve correct and good-quality debayering.

Support for more advanced use-cases (dynamic parameters, statistics
outputs, additional data endpoints) will require evolving the driver
model beyond a pure m2m design. This may involve either moving away
from m2m, as other ISP drivers do, or extending it to support auxiliary
endpoints for parameters and statistics.

This series includes:
  - dt-binding schema for CAMSS OPE
  - initial CAMSS OPE driver
  - QCM2290 device tree node describing the hardware block.

Feedback on the architecture and expected uAPI direction is especially
welcome.

Loic Poulain (3):
  dt-bindings: media: qcom: Add CAMSS Offline Processing Engine (OPE)
  media: qcom: camss: Add CAMSS Offline Processing Engine driver
  arm64: dts: qcom: qcm2290: Add CAMSS OPE node

 .../bindings/media/qcom,camss-ope.yaml        |   87 +
 arch/arm64/boot/dts/qcom/agatti.dtsi          |   72 +
 drivers/media/platform/qcom/camss/Makefile    |    4 +
 drivers/media/platform/qcom/camss/camss-ope.c | 2058 +++++++++++++++++
 4 files changed, 2221 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-ope.c

-- 
2.34.1

