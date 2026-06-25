Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110F131E845
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782394739; cv=none; b=Qkev9XAe2uN0kz1IEzQ55Po+EnHKJg7RINawv05QPZtm7ZK3I/kZ026nVDTaTK/OwYmMWswUkK1VmPkX36MVdQwjSp5trxgnr4G6wecShk2IpW/Gr3VNVKYHXxCkTncKYQPI5SBrh/J0NAhs73Qgvdmu0p50onqX4wVCmUnBExg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782394739; c=relaxed/simple;
	bh=oYWkP0pmqxe6KndoKRn7TRgu629HFHLmEdTwDpLhYBA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jpVT7JY8nVXreqfRCP1Pkx2WFcBsBCAd1Bs0qGMibOsmxhHvhcY72g4Ztl3LbzTOyzsZMnTHrpWdqHOtiYjFQai9rmdVrTfNb1ZckwoDbHvZSTPgiYpyAroj2D50U87JXWh0SYdgy8ibf5DDHWxpd/F4HJLnyBboKpt7fh9TjfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSstLolM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ax0Xhu+f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KSstLolM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ax0Xhu+f"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9k3F62048169
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wUxMXib9zaC8reGAmsfaOzOGvoqPesJ2hZr
	MmwuGftg=; b=KSstLolM7xiD5AJGNyH3vhpZrf5n7VbWZbXSlIbWjbmg0+tI1fT
	HkCm3v9xZ8yVYG01kjzw0lqZMoHAm2YUQFVRSIxU4cj6iuXk5m8kOfEdE5DMRmgY
	OeoTKzXaTJCI7GFQWpRt6BT7/jrwOHYOkj/cQHpbYN1OXpsJZ81VFjUew1qBlCos
	SzkyZOymcdRzEJ21BakKPrEwbw1wVGQZDuZ5W1KzXS0yfW8Hl/eZCI4kRUzSDRRz
	I8icXK4OHldK+2gnbBVGDCj9jAaKV2V++Y1J8zHhjzsxgtDldfDPbNY0ESr+O6dq
	Kwsc6Sium9tsVJCWE185j1H6pDc96gYwPQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uyqj9sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:38:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91576c147a4so492996285a.3
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 06:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782394736; x=1782999536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUxMXib9zaC8reGAmsfaOzOGvoqPesJ2hZrMmwuGftg=;
        b=Ax0Xhu+f2LA/eIjqu3MunxqAWpk8WXeY+TpOIZwt7y+cYwklRE0MzQKEmdjBe8rYAC
         MttrgIvjXL6CleGB0W8IeStzT9h50sT6/1UwdL4PJYzSynpDpXM2WsuDzTPsaCTG8Gwj
         w6xxLeZhsLjMZnFhvH/LxNOL33GAFz92kxTWN/JyAmLHlzmz6blOEg4BHofNCglb61/T
         +dnE/4etR39qbM6nwWWDTMWOAVk+SGARzaDC8ldrSJsnErTvw0O9MytDchRQ0t0watIq
         hcDd7eHxWV5UPafxPFamPP3tpaeX3hD1F35SVrq5ae4biFAqXgGq9i+IPen5BEwIXHjW
         q1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782394736; x=1782999536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUxMXib9zaC8reGAmsfaOzOGvoqPesJ2hZrMmwuGftg=;
        b=JPPzPsHKKbQQNksuKqoYDaHTMOr8rvOUvfHO8XXdT3jtVVTwH0ejlzyQw2cufKLlpY
         GRJ+CZaqwjIV0kkgMms8AUJ2MlxmznYrfdrrHAF9BsbZx7h06DuJIjRg5nebAqc5JgYp
         CeVzvPcJ8TFyt4fFPwZDcFPO1m4vvFTVXg2UcgjS767Nzr+LHJjsfddAY2Bzo9ihd/M6
         bIluinCyi1VIZZawZTjt/I90AbAEbvPdTnM3glw/eyqQkbfWMFOv68fkZ1m4GvM2bTo0
         kwml41fzOZRrpQh8wxXOBopBnhtZuEZUvfa5J4YSI+bdwF5hkGr5Mq4PmGuQUJ/G6nVZ
         8TqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1VaY76i0f/VUOjf9ai1wSf4uzp+XkaaxR1oqAPvJfB7Nx9D+mVmp+HuPm7a0NW1dH275oKpOcUw4F@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5A6s/zmBRenRJVbe03YrYSJ+T5BXbuEgsGy1K9wit31/hO9uJ
	aKdMp4LDZ2ZeXUz/oQD/ww7FpgPg5tNRv2MDyID6pi1S4dXSVKFfKhSSBtCg7TJU51/8kBkK/Bj
	hY5qZKam7rv8GhodDoHSDzns5kwVI7JtrK3Rx38hJs8GGwwww4zO5mHm1pbvU3h+n
X-Gm-Gg: AfdE7cnSrmkeS32mJub9upjjOK4Wh1Mo75onX0EePjG2Enr17S5NlT2WnxWxI3KLwFw
	KRK1svPZEJRCN32QccbJHFC2w/b9g4RLrFAFQB1XJXXtZEQxuJB7BoVmOzUBoSTLE5K5V7IXgP0
	YVMM2qIEdCBHrJIIRxRvnTta6IOb2FaAJC2ffJmEzKrxNQLtG4IzjM7qRnkCoAvCUsd5j0RDQg6
	EP2aKHS2e9ucYetUSXtsgJ6xhaRxL3hFuOAmJvVbIvoYR9RQ3y7jhyKPG0TB0INyhjqxyaBnuE5
	s77Yo06L5K4pU2s/dleiBT8PJFgVTuQOJO0Ix7QI6pW8YCeS5DbALxS42HC/m/o8LqadlpKiOvE
	NhR8vKxVNOvdHxj71OasljXAiaV429hJDWiw=
X-Received: by 2002:a05:620a:2994:b0:915:5379:b511 with SMTP id af79cd13be357-9293ddae94fmr368992185a.43.1782394736243;
        Thu, 25 Jun 2026 06:38:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2994:b0:915:5379:b511 with SMTP id af79cd13be357-9293ddae94fmr368986185a.43.1782394735613;
        Thu, 25 Jun 2026 06:38:55 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbaa238sm189172266b.8.2026.06.25.06.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 06:38:54 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add Qualcomm JPEG V4L2 encoder for SM8250
Date: Thu, 25 Jun 2026 16:38:25 +0300
Message-Id: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wWO4WE12SSJTZ3hAw6ndESaIB7LIxcUB
X-Proofpoint-ORIG-GUID: wWO4WE12SSJTZ3hAw6ndESaIB7LIxcUB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExNyBTYWx0ZWRfXzvRL/S0YAb9d
 pPHiTD6YGkeKet4ajzDCDsDadGo3uHsL5KnwmcBvl9XELE5LK30Bu5uKyRlDlv4p4ENVbH+DEOj
 cIS+yItZVnsGNelS3E/XMsx/89B4c4k=
X-Authority-Analysis: v=2.4 cv=EsLiaycA c=1 sm=1 tr=0 ts=6a3d2f70 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bNK7v6p62rK0NTNIeiIA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExNyBTYWx0ZWRfX7t5rbvxtdlW5
 ZyYQTnVzlFwHa0L56HXzD17k844tXoyzJhhVLvNaTdbGRzDjsSKKxz9A1bwf8znzopZoZ0x3Qj4
 CoN8IcVitR9UREAuD/DwMWmMgNFcv2cOly6vzIlTPmPVRBFTkjfVdG2D3XHo+NoWtnQ3Wz1/K1p
 J8MXFQ4iKvGm7N+WdqrDQPVAoRVN2vP+IlHLMqE1UmrAOsoYFiSDHHsLNrQz8jfn6P/GhvwhxYV
 uHmrqedtua2X+VMij4zxExfj/M9MZr3Am8eNEv0R/ZwF5wR9mXetWv1JgkpvV21QXmBmRupAxoa
 dcATW0qyxluch6MVrbhbxIw+1Q2m/WmWlNJSBM5YMcKRbpm010ylql6LhUAOrSZ/x3CEoetp+OF
 TUzhZcsiJhHD2LEXAeiLzOiet+rp3n8eKNcPM62DM6dMA6gn/CVU+P3xfFToF+lOFsJq+Ax3yD2
 2vYeJCjc+KzQeOhHEzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250117

This series adds support for the Qualcomm JPEG V4L2 mem2mem encoder on SM8250.

The goal is to upstream a standards-based JPEG encode path using the V4L2 M2M
framework, with DT-described hardware resources and SoC DTS integration.

Patch layout:
- 1/3: dt-bindings: media: qcom,jpeg-encoder: add binding
- 2/3: arm64: dts: qcom: sm8250: add JPEG encoder node
- 3/3: media: qcom: jpeg: add Qualcomm JPEG V4L2 encoder

Supported compatibles:
- qcom,sm8250-jenc

Driver scope and design choices:
- uses the standard V4L2 mem2mem + vb2 workflow
- maps runtime resources from DT (clocks/interconnects/iommu/etc.)
- keeps userspace interface within existing V4L2 JPEG controls/framework
- uses runtime PM for balanced power transitions across stream/probe/remove

Functional validation (hardware):
- platform: Kona / SM8250 / qcom,sm8250-jenc / RB5
- tested with v4l2-ctl and GStreamer (v4l2jpegenc):
  - single-frame encode: 8192x8192 NV12
  - single-frame encode: 1920x1080 NV12
  - single-frame encode: 1920x1080 GREY
  - GStreamer NV12 pipeline to JPEG files
  - GStreamer GRAY8 pipeline to MJPEG output

Changes since v1:

  Binding (dt-bindings: media: qcom,jpeg-encoder):
  - Removed qcm6490 and sm8550 compatible strings; this series is SM8250
    only.
  - Fixed clock-names block in the binding example.
  - Added operating-points-v2 property documentation.
  - Fixed reg in the example to use the correct 2-cell (64-bit) format
    matching the sm8250 soc node address/size cells.
  - Dropped reg-names: with a single reg entry it is unnecessary.
  - Removed description literal block scalar (|).
  - Dropped _clk suffix from clock-names.
  - Added iommus description in the properties section with
    minItems/maxItems constraints.

  Driver (media: qcom: jpeg):
  - Trimmed hardware register map and definitions.
  - Migrated to devm_clk_bulk_get_all() replacing per-SoC named clock
    arrays.
  - Migrated to the OPP framework for core clock rate and performance
    level management; the OPP table is embedded in the DTS node and maps
    performance levels to frequencies.
  - Switched to devm_platform_ioremap_resource(pdev, 0); reg-names no
    longer needed.
  - Switched to RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros.
  - Switched to devm_mutex_init().
  - platform_set_drvdata() moved to immediately after allocation.
  - .pm uses pm_ptr().

Known limitations:
- scaling is not supported
- width and height must be aligned to 16 pixels

Atanas Filipov (3):
  dt-bindings: media: qcom: Add JPEG encoder binding
  arm64: dts: qcom: sm8250: Add JPEG encoder node
  media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

Atanas Filipov (3):
  dt-bindings: media: qcom: Add JPEG encoder binding
  arm64: dts: qcom: sm8250: Add JPEG encoder node
  media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

 .../bindings/media/qcom,jpeg-encoder.yaml     |  135 ++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   65 +
 drivers/media/platform/qcom/Kconfig           |    1 +
 drivers/media/platform/qcom/Makefile          |    1 +
 drivers/media/platform/qcom/jpeg/Kconfig      |   17 +
 drivers/media/platform/qcom/jpeg/Makefile     |    9 +
 .../media/platform/qcom/jpeg/qcom_jenc_defs.h |  259 +++
 .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  313 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  109 ++
 .../media/platform/qcom/jpeg/qcom_jenc_hdr.c  |  354 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_hdr.h  |  119 ++
 .../media/platform/qcom/jpeg/qcom_jenc_ops.c  | 1510 +++++++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_ops.h  |   52 +
 .../media/platform/qcom/jpeg/qcom_jenc_res.c  |   39 +
 .../media/platform/qcom/jpeg/qcom_jenc_res.h  |   30 +
 .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  527 ++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1136 +++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   25 +
 18 files changed, 4701 insertions(+)
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


base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
prerequisite-patch-id: 8bfa054e24f9de8d7a09cfab8db0efff173d98fc
-- 
2.34.1

