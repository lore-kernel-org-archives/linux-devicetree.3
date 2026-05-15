Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E058A47D952
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845635; cv=none; b=sMq0z0cMR40JrY2AzyIUY5S0fQilEwfZEQvDevnWyI9GmoqWAYsAF9ldI1cotbAmQJUsP7m9tFv2Y7De2kZxrlbnHLHDyK0ZY6Bz2nTmMvoQzdoJPEq8vZcTvklTzvoj3lh1ZE3cgChfG7ynJeWTezhk8GQ5Ncjc1mOJY7iHNVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845635; c=relaxed/simple;
	bh=AefraGkBhjA85yc0aNpkRsthLtWWbRBEb5hUi8maZn0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UC7uzcuiBTNk4QwSK9YOPTYNt6yRUHbEbkSYCWq0JDod+7U2aLoG+ZJ90Ug0IuYXmIdyuKnj3yvyz4cWHKm838xxD99VfY+p5qn7GeWtq/Lhzoh2TCy1l5IPBjs7c9QIRlprDfsYbJUiAQXlJeq7LEi44gUlr5oz9X8jvlSNh0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obtxanzc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBdK+KwC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obtxanzc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PBdK+KwC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAhYmX2676446
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t6qqW3hD3ibqQwwI8IjK9D
	fhS4qtV9tBUuV5fjw0IEU=; b=obtxanzcfFUgcA+ldkK5uOmCf6O+Yjj8xzv3Zu
	aU2IekNvFbscnDYUjjN+Z//sdg/e4e4QghjZ4fsfY5uJ6uTi25IWfzadwMmUPftH
	5M5730WQaS5iNLny2pSr+IVgCJpXOrrfH+O7ldPNY9kLdN1bl56ewhZM8jnfSLsB
	S1s+YwhvvfLpjw3+B+3irQMVNVpuSg9qgsUWBv3nRar5boYg755VOQ5mV7VRsIvI
	WlZiWS4v5kFa6/+POf82QJnpj4Y00l9NEj+YP3X+YMxtZ/SekmviCjnkr2HtZviW
	uITUVqnLRUfwg9U1e0Mi4dFgX6Kv3RgJ+I8BGP/uBcSQr2tA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vu40c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:47:09 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95fc647f356so483766241.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845628; x=1779450428; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t6qqW3hD3ibqQwwI8IjK9DfhS4qtV9tBUuV5fjw0IEU=;
        b=PBdK+KwCWMjUYMD6VKk7x5KKs1+udoaKm/xpjZ7a3TUFfLzawWdbTxzeXHHIAAF9ey
         DK+r7d+7Ae30AHaAJFs5BcQUAcMpHyvpPaneypJW3oYJpfWDGK6bTkV5pPfzhZhPM9gc
         lq/BasNukFQLkDEym4IU6G6tye64hGEs51d5VlYTaYCwrOcbBb33fWIXhfZDWPd80sQz
         xxnqlG6NvrYVvYeYcLUsaXzii8lgaLwyj5q9M1BKHs/dRj9jSzvFF1tny5s5w5cRjJ/u
         M0ygdndcEYcMgS8i3L0yLdA/zjQqmOXv2yecqhbv4YdN8lJd7BZeR41eDBHxhXPIIxRs
         xZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845628; x=1779450428;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6qqW3hD3ibqQwwI8IjK9DfhS4qtV9tBUuV5fjw0IEU=;
        b=CeHkItttqoEa4OCP4IxrQ9ZlBcUGteIPMcUlOYx3LcpC1M95V2eeULwREbI7iMIz/9
         zVjUdH3JVO1ivgM5V1yiRRsbVglZv/U+hvKfo3iCAyrFis10/rmmCXvG2xqUjrbtEqSQ
         qGwbBOUGb2Y6zCOdsbou31gm4e6CppDGSkGy1JGVBJycflkQEs461NjJOaFaAhGBE/Vm
         4VgI0tlAOrTP1NjzMzLaLz975454POPEUr1muOfpzoKsYQ+WvcKg2O1tJ4JDO1zpML3e
         nuzBCo13RaIoKkZ/UwaVzpVDhGusB0d1i8YXRCkb+sas8weM1qTGy/hI+NlgQaAHui8v
         2x/A==
X-Forwarded-Encrypted: i=1; AFNElJ+/2OFJUrGJ0kIUNxfWWKr7fh7b7IfvxO/4kfnUWbSsULFmYSgIQ3jqLAQHHfosFo0agYlenLebT84w@vger.kernel.org
X-Gm-Message-State: AOJu0YzC/QEPjT3bzIEZL3r8Ao6LodKj7iPIRBVHWV83xLW5gSuPJwCV
	5+jsD3hOxPU/yje8rd3z1ToMWAp4Z0AclC9ze0xUY3qD3iN1+BrJI3Fpp6JLYvUPPfdxhK3drg1
	2uBvBAb5m/TKFyS7wkBr9q9tAL2CXINRm+sN47U8xmlOnrAwWIDZ/cBO1dLyO8fnp
X-Gm-Gg: Acq92OEVUd/fIFjq7z/T4PFq7m7uBWxm3cKIk3M70u8yUJTKSsrU4ktneL5zZKBGKm6
	nn+cOrBfeWBPTTY9mVHa9MnbMW7yJfXHI12Zcf2+Jxec5/apfbakveBzccXj7dSYSEL1vn63lzt
	rHQ0XzOFqfWjQG/5N/sasWXb2DOVcOaBUqafLz8M4a98f1H00homcAW6E7DlEtG1ZHpCViXOHk7
	qHGZU07u59fSkecEmLPeFf2G3uUGVQ1ezc6VoGcGrZGBmDj2jDLjyxTyZrFBxOywPQrSPRlvA50
	0Nl0mcVqo3rW5NYGgepoQ4nLeA9TTLoq6tPsyVDJ+/8Q7+R/S4P5G4aXm522eot8nFbRGTXv5Sd
	dMhIUi+l124R08yq4BSGw5BqCMZbvu+vV
X-Received: by 2002:a05:6102:f8e:b0:631:b365:40ee with SMTP id ada2fe7eead31-63a3cb1412bmr1858538137.4.1778845628100;
        Fri, 15 May 2026 04:47:08 -0700 (PDT)
X-Received: by 2002:a05:6102:f8e:b0:631:b365:40ee with SMTP id ada2fe7eead31-63a3cb1412bmr1858517137.4.1778845627647;
        Fri, 15 May 2026 04:47:07 -0700 (PDT)
Received: from [127.0.1.1] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c3150dsm216853366b.24.2026.05.15.04.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:47:07 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH 0/3] Subject: [PATCH 0/3] media: qcom: Add Qualcomm JPEG
 encoder driver
Date: Fri, 15 May 2026 14:46:58 +0300
Message-Id: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALIHB2oC/yXMTQ5AMBBA4avIrE3SNmrhKmKhNWXEb4tIxN0Vy
 2/x3gWBPFOAIrnA08GB5ylCpgnYrp5aQm6iQQmVCy01rnYesV+oxSMbFGohs4ac0cY6iNHiyfH
 5Dcvqd9hNT3Z7L3DfD09VY/NyAAAA
X-Change-ID: 20260515-qcom-jpeg-v4l2-5014defb5bcf
To: Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed <akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gjorgji Rosikopulos <grosikop@quicinc.com>, afilipov@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a0707bd cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=0rZay79RH03Kq9A5n6cA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX/8gDea+hL9z0
 ksu71EDdOnZFZO66RzDpHItCq6lx/rBDQ93HCBZeUBNxbXw1Wj/dGsHxWtuRuYel9YTZhpxGIal
 /y7+MMfIvNzN772n94hQf88I19u4+Vs3pgWTSrYsp00H1M5KLd7eku5BaiIYeg9csDqMJdzytWw
 MKSUstVph1YtaHgpc94NZ66mImsGftatfL4J+VI59C6QapLk1hf/udx0/pWhezGU7z0uOn4sS+/
 AIO/qYEAPCdlwPwIhe1Lrxgx56txQiKER+U7defBtZwnt3jxCqEGfrJGEE8u5VgJnp3q5lzQrg4
 as1oWj1k0ewjZQQScOXFpZqcV0XighqRPljOxttXdZW0N83pe+7YBGY9ZdRR/6gspyp0SIm5m+5
 /yZlY7aPBj31tfpogLX1Ue8s+GhtwJhDyPukPEFFRLselVNGBVc1h3gBNvdBKM5lVBfrRSKcps/
 WrinZjue8rhX4BxX9cA==
X-Proofpoint-ORIG-GUID: w6FASq1QCe6ym1TS4Scj-cjJxav3h1iI
X-Proofpoint-GUID: w6FASq1QCe6ym1TS4Scj-cjJxav3h1iI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1011 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119

Add a new Qualcomm JPEG V4L2 mem2mem encoder driver for Qualcomm SoCs.

The driver provides hardware-accelerated JPEG encoding through the V4L2
mem2mem framework.

Currently supported platforms are:
- sc7180
- sm8250
- sm7325
- sc7280
- qcm6490
- sm8550

The driver has been functionally verified only on qcm6490 hardware at
this time. Support for the remaining platforms is based on matching
hardware compatibility and available platform integration data.

Main features:
- V4L2 mem2mem encoder interface
- Hardware JPEG encoding
- DMA-based buffer handling
- Device-tree based platform integration
- Runtime PM support

Testing performed on qcm6490:
- JPEG encoding
- Multiple image resolutions
- Repeated streaming start/stop
- Long-running encode stability tests
- GStreamer pipeline validation

Known limitations:
- Image scaling is currently not supported
- Image width and height must be aligned to 16 pixels
- Other listed platforms are compile-tested only

This series includes:
- DT bindings for Qualcomm JPEG encoder hardware
- core JPEG encoder driver implementation
- V4L2 mem2mem integration
- platform support for supported Qualcomm SoCs
- runtime PM integration

To: Gjorgji Rosikopulos <grosikop@quicinc.com>
To: Kapatrala Syed <akapatra@quicinc.com>
To: Hariram Purushothaman <hariramp@quicinc.com>

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
Atanas Filipov (3):
      media: dt-bindings: qcom: add JPEG encoder binding
      qcom: media: jpeg: Add Qualcomm JPEG V4L2 encoder
      arm64: qcom: dts: qcm6490: Add JPEG encoder DT properties

 .../bindings/media/qcom,jpeg-encoder.yaml          |  122 ++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |   52 +
 drivers/media/platform/qcom/Kconfig                |    1 +
 drivers/media/platform/qcom/Makefile               |    1 +
 drivers/media/platform/qcom/jpeg/Kconfig           |   17 +
 drivers/media/platform/qcom/jpeg/Makefile          |    9 +
 drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h  |  253 ++++
 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c   |  370 +++++
 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h   |  111 ++
 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c   |  388 +++++
 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h   |  130 ++
 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c   | 1522 ++++++++++++++++++++
 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h   |   49 +
 drivers/media/platform/qcom/jpeg/qcom_jenc_res.c   |  268 ++++
 drivers/media/platform/qcom/jpeg/qcom_jenc_res.h   |   70 +
 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c  | 1082 ++++++++++++++
 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h  |   27 +
 .../platform/qcom/jpeg/qcom_v165_jenc_hw_info.h    |  509 +++++++
 .../platform/qcom/jpeg/qcom_v580_jenc_hw_info.h    |  509 +++++++
 .../platform/qcom/jpeg/qcom_v680_jenc_hw_info.h    |  509 +++++++
 .../platform/qcom/jpeg/qcom_v780_jenc_hw_info.h    |  509 +++++++
 21 files changed, 6508 insertions(+)
---
base-commit: 804a18eddd6d57bd554e0716034c764f48659b0a
change-id: 20260515-qcom-jpeg-v4l2-5014defb5bcf

Best regards,
--  
Atanas Filipov <atanas.filipov@oss.qualcomm.com>

