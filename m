Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E242E375F82
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 19:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293463; cv=none; b=jNn2tRoIoK+W5ETla3H1ddSFcCuPIdrQVEPm1Rta/EzuK2kesZ3U4l67F/gkzI64Ob165OL4J0GGrcw9LPJ3bH2AsveKyzvJMUa3667SG5qHf9fy2xvJ6M1X0+RFuEmb5is8sObgP97utGpwdG1XXzok+buGi77C1GfPUsBDEfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293463; c=relaxed/simple;
	bh=QNZ3+S2PpCImXGWksF7IvgVfrTcvdAu1a5ANpPC2IcA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PIoaJlffqUwCvRBCj8jpytyOB6F3ovTaQFpinbIJxHBHZ0AWf0jyfovXRCWJ6hUMtW64UFnnGCdhIRPBHEL7GgxKKqNoeoPgmtKB5P6gXqTW9IIsk92YXfRe7YAWTnws9Qh/EdByn9te6wZWBie/u+UL5n6OnmVDCGETXAeqeJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaEZBFKp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JIWyBKkB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iaEZBFKp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JIWyBKkB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGUJEI053983
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 19:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8vEg2rm8IN+wa6gpeS8irIAvx2VUQmNQssF
	ZCOYv0OA=; b=iaEZBFKpDZenxUu4FIYL00sKcjK/idjWEOa27XHVdEgldPrbEo6
	uXXtDiiSqSImaculrzr2ZJ1a+N6lQNijGg6HE3Xqofr5+qHop8EekLiX9ZR24ePj
	wRiBvxarWXCAjgYyy/OpjVlTbr4Sq4FKf2y/CFW8a0pzo6gapdm5ZBofgdyGWArX
	VhA/DijBR/AhZoM2UH7Ys4yE+Y8RFIYXYyttzrXA10ZVhR8/7OZh7XmYovGS1NRI
	bzdrYXo08nnB55eAUHhawb+lKJRVhTLD3oMGOMkQuMPdPlN/kLRIyrQ2I2UcFOCi
	9OKgoV+nGdtYLBuH74OKtYLVhqSKrffcHCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29uvdfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 19:44:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157ae36434so190913485a.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 12:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781293460; x=1781898260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8vEg2rm8IN+wa6gpeS8irIAvx2VUQmNQssFZCOYv0OA=;
        b=JIWyBKkBr1sJYqUGrjDSjaVaqE/Zt6uUDURCPRWneaI866IsI6PrZFTmLWnEIvHrce
         LM8Sx8K2WhvsyOaxSgbtZQ2W+/O3GVPIeU4wwEiFitZUO9Y2sKt3yuxYWLXc3FCJ6sgU
         8SwbCYGKbt+4VVmw7JmDZGS4vv8JCIxrdk/2Sddvi7eaugdLO2wvXP8tRtPTyet3Cfm5
         QPNZXZ/D3WBLBD+9HtHzPrP2T5I1+QLdsfcxlSVR2vI0etaAKNY7+EtrA4fnWzfDQk5M
         LGjryFZEjyw2gr1mWk8XFjOIIXE9bGNtAHs5DXIxAZ7J2QLeULzMJlQhB8hBe2KFOy4+
         QE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293460; x=1781898260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vEg2rm8IN+wa6gpeS8irIAvx2VUQmNQssFZCOYv0OA=;
        b=ruzvVTFzY3uAh8R7vXyp+AjtWg8t1iOe08LLoxrrRQ6qoRC906XMxd+vZpKeHH/dM7
         xEyKIA9nTYPyTZqcWPUlCXDl249SuMSEAGiCokKDVAEzyNDoi5ZsqZKDJ0aw17T0y5NW
         uLWwrz9bJW9SOX/Nc5j3OXQ0R6QyuC3pnVqJo9fZIvSYEFP7eNbuACHDw2DdA0FbCQYJ
         NKUp3mJJAPzRF+rArkEqjq7iVdnU61b/pF0F/PzPjc4oNrQQtHYKjhS7QYRqWQi9BS77
         6eQmjmhSj6UnhXGCykMsV5TeiQP761jYtRuuGuf7GYel3FRSNdeAUF8tAa54s66kAh3J
         62nQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OIhZWcGQqFMtdvAAPCzS+kY8Xzwgeq0DQDhemvNFYC+sUmN5ZMUwnyXRwIlPPHidsi43Qos6dhr3V@vger.kernel.org
X-Gm-Message-State: AOJu0YxhZByD+JM4arloYUvn7w7HSMULrHq9J0wiNx0KexQaoolnILF+
	KhYpPai9svuRq0wdBCVLgpGvqczG4Z0hae3EnUjYQy7mvfCiqMG15kW5ALZJXKoIDUPXfEqPki2
	iPRq3zAP6HcMSafSwIhmPCRmwvM2cImkz7SC140npiA4q8kCi0mLeFOd/eOCmcWTo
X-Gm-Gg: Acq92OFC47Ztf8QT7XCVfFSZQYu1T7zepBm++AO+H0FZRLAkD5QGtyqLIY8Apjr4tvC
	NWb3a6APusPnI0IUVaftTy+Z6wLYcPpafiD4eAp80UEWhjyACKqG2sn+6tQEQJOJThOjyhB5afT
	a3orlWTnhSfc4RlcoFlESSpxsjTMskFsV/9eBOTjOFwp0/iqkJqx+ci6+/8RYOb4fgePFnCfiyD
	ZWO4rbh6sYqbQBj0B8QoxCiZ1yU2mzAjbPBzQKYeo3ZIosXO0QbFFsWOzBdVsAIxJjmt8wHZhPI
	waOF7pYFWR6oQ9/dJNmZXIKKpbVNW4QIhmMJzSViInmZpaPUsZvGtNlTtQja9usXCVmZLvlCWsC
	2FjmFuWev8w6zGl3IGblieDgY5oAazqGxtkJmf1qZWdIk3w==
X-Received: by 2002:a05:620a:f01:b0:915:29cd:306f with SMTP id af79cd13be357-917f1c55af3mr187235085a.55.1781293460187;
        Fri, 12 Jun 2026 12:44:20 -0700 (PDT)
X-Received: by 2002:a05:620a:f01:b0:915:29cd:306f with SMTP id af79cd13be357-917f1c55af3mr187229585a.55.1781293459666;
        Fri, 12 Jun 2026 12:44:19 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420570sm138396466b.11.2026.06.12.12.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:44:18 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bod@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v1 0/4] This series adds support for the Qualcomm JPEG V4L2 mem2mem encoder.
Date: Fri, 12 Jun 2026 22:44:13 +0300
Message-Id: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfX8TcKA1s4NO6L
 dK7rcMDvVzsK2/HV8+HzCV+xpzq/vvQAwW4B7FlX1zUpkHuWDBt0dpyj9uk5UJSQ1zjI/3+6rzn
 KqUZTiA5w+n2JPD0KZNm3COP3yRCUwc=
X-Proofpoint-GUID: ZfuUwdexqR6etbIeQinmyNwQgB1b6uBC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfX6ML32ePkfHaT
 gR02HQnquInlcYD5eMQQyCqLm1cGw4U4arWce4rmWzEk8HEpuypDAzFSbPJno3FsMfArxvpo0IH
 7SnuV02u7HEI3ILiG+H9RMuBDG39dmp4TQgA8OPFLUSKw/VLl2cUBm7x+4XEmij8LhJenf+WkrL
 LXygdw9iK7zLR71XzbdQg6NvonOIsC23tIfct/dfrS8qQ6bNMokntxPpsLnBED6/IAJVtxfBL0o
 4wGTEXgaucA5DYL4FWqv9QJecniuLyW6LgLp7IX+vJrYqR4nIwe0AyNqcah/16m+LOeEtotljWo
 yQ6ta6j/K4/5dDu0OMk2Rk4mkcvO3BL/50OKruFfr0lphw5niqzl5CBzmfJkvaYFfAZJzpIc+vT
 9xenXZH8p0C4wkGPe39KMAGcu4e+RgZz3+8686eBeMlwMdQpQS1LCOiL12krcuJlC9oDr/kJgAY
 jJrG/TfMeCZ7xDuDwbw==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2c6194 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=yUVlmgnzSyTKfynlg6sA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ZfuUwdexqR6etbIeQinmyNwQgB1b6uBC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120186

The goal is to upstream a standards-based JPEG encode path using the V4L2 M2M
framework, with DT-described hardware resources and SoC DTS integration.

Patch layout:
- 1/4: devicetree bindings for the standalone Qualcomm JPEG encoder block
- 2/4: SM8550 devicetree integration
- 3/4: SM8250 devicetree integration
- 4/4: qcom-jenc V4L2 mem2mem encoder driver

Supported compatibles:
- qcom,sm8250-jenc
- qcom,qcm6490-jenc
- qcom,sm8550-jenc

Driver scope and design choices:
- uses the standard V4L2 mem2mem + vb2 workflow
- maps runtime resources from DT (clocks/interconnects/iommu/etc.)
- keeps userspace interface within existing V4L2 JPEG controls/framework
- uses runtime PM for balanced power transitions across stream/probe/remove

Functional validation (hardware):
- platforms (codename / SoC / compatible / board):
  - Kona / SM8250 (QRB5165 class) / qcom,sm8250-jenc / RB5
  - Kailua / SM8550 / qcom,sm8550-jenc / RB5 Gen2
  - Kodiak / QCM6490 (QCS6490 derivative line) / qcom,qcm6490-jenc / RB3 Gen2
- validated SoC coverage: SM8250, SM8550, QCM6490
- tested flows:
  - single-frame encode: 8192x8192 NV12 (v4l2-ctl)
  - single-frame encode: 1920x1080 NV12 (v4l2-ctl)
  - single-frame encode: 1920x1080 GREY (v4l2-ctl)
  - GStreamer NV12 pipeline to JPEG files (v4l2jpegenc)
  - GStreamer GRAY8 pipeline to MJPEG output (v4l2jpegenc)

Known limitations:
- scaling is not supported
- width and height must be aligned to 16 pixels

Atanas Filipov (4):
  dt-bindings: media: qcom: Add JPEG encoder binding
  arm64: dts: qcom: sm8550: Add JPEG encoder node
  arm64: dts: qcom: sm8250: Add JPEG encoder node
  media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

 .../bindings/media/qcom,jpeg-encoder.yaml     |  142 ++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   35 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi          |   42 +
 drivers/media/platform/qcom/Kconfig           |    1 +
 drivers/media/platform/qcom/Makefile          |    1 +
 drivers/media/platform/qcom/jpeg/Kconfig      |   18 +
 drivers/media/platform/qcom/jpeg/Makefile     |    9 +
 .../media/platform/qcom/jpeg/qcom_jenc_defs.h |  244 +++
 .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  336 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  107 ++
 .../media/platform/qcom/jpeg/qcom_jenc_hdr.c  |  360 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_hdr.h  |  119 ++
 .../media/platform/qcom/jpeg/qcom_jenc_ops.c  | 1658 +++++++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_ops.h  |   52 +
 .../media/platform/qcom/jpeg/qcom_jenc_res.c  |  226 +++
 .../media/platform/qcom/jpeg/qcom_jenc_res.h  |   54 +
 .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  529 ++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1109 +++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   25 +
 19 files changed, 5067 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
 create mode 100644 drivers/media/platform/qcom/jpeg/Kconfig
 create mode 100644 drivers/media/platform/qcom/jpeg/Makefile
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h


base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
-- 
2.34.1

