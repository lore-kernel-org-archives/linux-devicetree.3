Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9432442B731
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312292; cv=none; b=nYEi5EtknE4MZVYnb5uyjymM+g+WJaK19malCV2dNFpumnVhuQxkTrvLDhAkpdi9Su+IdxvZfAtxe9iDLxZy7V/0PY81cQDPe99H3xdTQFovB6KhyWq8dtvgLZytZqZw0/WmZQcxEa0KMf1BZ2wCwQCsb2zq6ySNvRRcEHnVBfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312292; c=relaxed/simple;
	bh=PouABadX/+Jt1AOVhbgCCNEjQ6ajOIWLp3o+AuDQzdw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Rkf/7hOYK2OaOg5dLZsoiKvzEjMkeo1lkpHH6zr+UVPFKclztKskQVATlhuohjCLPVtaxRuiXtXX2Q1Wh+q1zDxAWyvsLWKlwbAMEFLOmSF8BcKtgJGLVkKYgp6MfVGMERDDbMGwgYTpXg7cZYLWTMWFkMUBL0/TZgtDHDRzDvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0VJ6m6I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QuNnrvF2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0VJ6m6I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QuNnrvF2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f3lX1309768
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=em10awCLWennKk9O2Kkk8V
	F01q0fuL2yHIQrnTtggE4=; b=E0VJ6m6IbDNhcex3Acfb+WPyE4deYJPLHeM/gp
	bM8zCMbMtvrDBgBZc7XcD6pO0zptHFtJQWUn4RHYXACOY1jc2qN38A40QEXx+HVI
	uVUEVqREOCDqWFVsc59AYAQhazq86KUqEZs2TxRwLWvFKKSEQO6LPqGsegAuQEhc
	4cdmziHsKCdEHPEafYW8JdPy42daCAj3eRlqCGRjIYLZQuc/9PpgekcxWDS4M9Bb
	vR7+iToZhMQpM9EtxiVidrfdNSRhEzR8jT2kdWneW7gdeSXehUhrHAuMSzOLWi3x
	zJBRTAli19tPsZSRlG/WRdGLzF9OVB0c7pBroDWXzpuuzibQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqa330usm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:04:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bec738909so5814701cf.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785312287; x=1785917087; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=em10awCLWennKk9O2Kkk8VF01q0fuL2yHIQrnTtggE4=;
        b=QuNnrvF27Y6f++knJBl7gQtnsLaIoWAHLrISoWv+tTVq7P8lVa1fhLKUmEimSMQKm+
         5POblY2iDOjnOWoWx8nNFkjRiVK+CMak7FQn11uHXP04LaK4PsJeT0drBStaj4wh4FyX
         EPwQolVgNU1w1Jwnh6eTqEriMAddS+/ULia+PJhrhLcGGAqDnfcQWV/M5Z7BoQFSko0Y
         oovJX6S6cjF76obJVFEJMMeBxd8BG8koHgvVfKqiF4YI7m/yyhU8/ZaGEZkl6k1HXxeb
         VyBiqYFdXo0n74RC/+Wk8Neng+IxeQVQHW49oVfVn3Ln5fbG8XwTn1SQiYoeyXtqAyQk
         qdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312287; x=1785917087;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=em10awCLWennKk9O2Kkk8VF01q0fuL2yHIQrnTtggE4=;
        b=rQ20Nj5fjjnNP60DTz9mZEwT6LGfiwUyoBUOdb0h02J7/NI70TxVLXTwp4ENxvRvvp
         c105zOSbunpgCQWtb4hANhLCVvvt1scGJVZYgV4W3LV6thbQ2HMlpx3EY7p9MBkKcwnC
         3oyiWejBwKa10Pb7jbu+ITMFcgNPDaslSRpy4E6W/i4qM8UV7eG1Vfk+dgcr17bIoZbv
         TpjxKZ0l0CGyBmwK+8M7MySiW67G4rR6iGlDN1IBF8jP+RqWdODfzMPyVH/o7A/cSxao
         rIurr5qVDcxxeo7t70q+Ii1Je2fshCK2NaXW5S8lZgfYgK+VrPRx4nz8Tq79y2KW7siX
         2L+A==
X-Forwarded-Encrypted: i=1; AHgh+RoBOVHrxmeGsok0Ip+/WxeWk02sb3w4aF+/tL7UulfI/4OBg1aRH5LPdEYhffrJ8S1xJ2p7CFuhQzcR@vger.kernel.org
X-Gm-Message-State: AOJu0YzhFBNIulJrGsG49c+Omx9B0og1VCtNhY0vuGmdEWo+lmPLYXXP
	FW8CGG9qGColEftcnfqOw/46UXA+uwsFU3PWt7PCT3KBJ3EQJ/jZhpraCYEA62198v3F1vSG/h3
	ZRL6WYKXz73Hl2mZQoU5nTiVbmADNU6j7WrCopo/nB652bsv+69ohp5IIVThfFFiXB5muDgbAB4
	M=
X-Gm-Gg: AR+sD10qThE4VM4bmJlGvKbg0sBfQrNj9lGooyRwBZEGjlW533g5xn65x6WDxmDyJ1V
	qU4hVzjqACtZsmhzsF2UsVPmMQmxxK0biMPVf68Gs4ap+5kdcAVDgXfyE+5wGGgOUjnO8xC/Noq
	41VtC+h1asRYV+KQGPDL0vK87/k8BcrJSW8xXXfQbkDACjHF4ock3/9JIRHgGnoX6vHWzZsNaiQ
	KcXUn26mAgs39BG8QuRFP4F7sHSNdKG+0FaQAgB4Lf9XvI3V69gpuiW5DMdFlreu1aDmDR9CuUd
	c7Vtv5SbVJ19UGjIyaoiM5Fxb4sjFf+Htso3o050DeXVnv8ERfwsdlktO/jn9hzM43e7K3g4nHp
	R1qToFRXkZO29tFQOsgk7RTz1vQdDciIxgYg6u9tcCc+lpyLT28AxVyADqr/FmfgOzog5
X-Received: by 2002:a05:622a:89:b0:517:8a18:7624 with SMTP id d75a77b69052e-529d709e52cmr51651731cf.3.1785312287465;
        Wed, 29 Jul 2026 01:04:47 -0700 (PDT)
X-Received: by 2002:a05:622a:89:b0:517:8a18:7624 with SMTP id d75a77b69052e-529d709e52cmr51651481cf.3.1785312287044;
        Wed, 29 Jul 2026 01:04:47 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e30f2a96sm13772631cf.28.2026.07.29.01.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:04:46 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v4 0/4] media: i2c: Add OmniVision OG0VA1B camera sensor
 driver
Date: Wed, 29 Jul 2026 16:04:29 +0800
Message-Id: <20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA20aWoC/3WNyw6CMBBFf4V0bcn0BejK/zAuplCgiVhttdEQ/
 t3CBhJ1M8md3HPuSILx1gRyyEbiTbTBumsKcpeRusdrZ6htUiYceAEFq6jrICLTVCmtW1Gj1mB
 Iat+8ae1rMZ3OKfc2PJx/L+LI5u+3IzIKtGmwZFpXAmB/dCHk9ydeajcMeTpkVkW+4iXwFecJB
 yiZlLxG5PgHF1t8sy7mdVMZKaVSKPkPfJqmD8F/dHUjAQAA
X-Change-ID: 20260618-og0va1b-55bbf3cabb0e
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785312282; l=2064;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=PouABadX/+Jt1AOVhbgCCNEjQ6ajOIWLp3o+AuDQzdw=;
 b=qVbptrfAZUXO8jWSnGHsHwrbNpwyQlxwhKKOnE8oiPBW04C0a+geC1quP2CXKEIEF7EaXRlYP
 6bOhWpuEl+NCD/XRSJFVeeyK2BTMCHBmW2KbR3vxWil4LaVRgXiqZBQ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfX/RL1sv96riJe
 j6tag/mBxr8WOdihxnvmd4kOH56G6D9wdGeZa6fba8HbHjW2OBntRIi1V92nu/haGLBLsDqaUcQ
 lZaNnavQp8y3m2QMMsESwAe6Vr3JQWlBWqItQDqCYmkEzxopJNXzbU3cX+9FxghSIXoDzPAlq86
 GG7PGuqgIn4YkP+WfVZfZmEsgXmCPwFY0FtDlbKC/VMM0BByQ5iRD3WMt6YpJgEd9/LQ5IHz6rV
 7EZquBW6rGnDvT5cvhtoTjGphlgpTNRB4yOsTFmEC7KG5lYxHJj/0fatuaDIXMT65swdyWOPUFm
 SggZZk6oss2bcD/XkmpEyLGM9T+VLtzIn7+Ne5hTL8CBnImmmG5SixBiv/HQwDL00Ct0xFjX44G
 McRrOl2wOUs8hxBdNxhE44irLhwgcm+X6Jcy+02e4NAGpIoq8JyJLYAsiGwaxz36x/F336TQU4Z
 kOfIrn1AgMnS94WFuTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfX/T8vJsa8RaSq
 +Fq9Nw8KEK6WsJlRkbQhXZibNTNfaRq0AL09cJj5HvvIOG57JzqZbuh30tp9etkKVdGDSzFyZWS
 Hnh+www9JzuqCNierIe00lXeUnBiKfQ=
X-Proofpoint-ORIG-GUID: JpeHEgj3t2rMITDgrmGMVosDa4A02T2F
X-Authority-Analysis: v=2.4 cv=Ap/eGu9P c=1 sm=1 tr=0 ts=6a69b420 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QHcE8raJy8psccEy0TIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: JpeHEgj3t2rMITDgrmGMVosDa4A02T2F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290064

Add OmniVision OG0VA1B driver support. The OmniVision OG0VA1B is a
1/10-inch monochrome CMOS VGA image sensor. It outputs 10-bit raw (Y10)
frames at up to 640x480 resolution over a single-lane MIPI CSI-2
interface and is controlled via an I2C-compatible SCCB bus.

This driver has been verified(include tpg) on the Purwa EVK.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Changes in v4:
- Rename the OG0VA1B and OG0VE1B test pattern menu entries to make them 
more accurate. -- Vladimir
- Link to v3: https://lore.kernel.org/r/20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com

Changes in v3:
- Generalise the binding title and description for both sensors. -- Vladimir
- Keep the cached pre_isp read so the OG0VE1B test pattern still works,
select it via a per-sensor callback. -- Bryan, Vladimir
- Rename the "sensor" field to "data", drop bpp (derive from code) and
add og0ve1b_pixel_rate(). -- Vladimir
- Sort defines, rename the shared CHIP_ID reg to OG0V_ and order
og0va1b_data first. -- Vladimir
- Expose all four OG0VA1B test patterns instead of one.
- Link to v2: https://lore.kernel.org/r/20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com

Changes in v2:
- Integrate OG0VA1B into the existing og0ve1b driver and binding
instead. -- Vladimir
- Link to v1: https://lore.kernel.org/r/20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com

---
Wenmeng Liu (4):
      dt-bindings: media: i2c: og0ve1b: Add OmniVision OG0VA1B camera sensor
      media: i2c: og0ve1b: Use monochrome-appropriate test pattern name
      media: i2c: og0ve1b: Introduce per-sensor data structure
      media: i2c: og0ve1b: Add support for OmniVision OG0VA1B

 .../bindings/media/i2c/ovti,og0ve1b.yaml           |  15 +-
 drivers/media/i2c/og0ve1b.c                        | 377 ++++++++++++++++++---
 2 files changed, 345 insertions(+), 47 deletions(-)
---
base-commit: 3652b49adac266a3d27cb41cdfdb7d8790fc3633
change-id: 20260618-og0va1b-55bbf3cabb0e

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

