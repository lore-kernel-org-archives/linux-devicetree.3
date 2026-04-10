Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A48E29E114
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846527; cv=none; b=mvt3C/awjBBN4xFUS67Pb4D3UMJyX0oYtFZ2vAmIhJ0Hlor6tZOVpDMSwPa7fL0iTOhQ2jI/RxcT0V2KRRk1xqAAgo9ud0VIew6AWZDzeZA1kKWyWIkPO1eLFKws/XAEfuv75fgS/YuSbkQaSYNMxx4d8QYgIr6K3qByAJgjjTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846527; c=relaxed/simple;
	bh=Xii/ErT1Xj1n8XWw7mfOWIQJRcGW4d+b620Dqy3n2wU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GVBpkZKUymvsJtBS9eHr0nCAj02A5YZqZb98WI48c2Usp2FzwgNJIbCGBtoMU4bRJMoV3mbqGpXPvRS8gdZFfHknBbDxFBV4dZ7TxLv7HCcjdM2/A41siFN23awUWdxKgF5ugOdStykhLtgW+euuxebpQpBhXgwlD/4AMZxewoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yf60hlti; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hDrfZTk0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yf60hlti";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hDrfZTk0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAd8wE2698383
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LkOHEiyv4wNs2xK1MBQesq
	evDYPBfrfROxl/qZcMhl0=; b=Yf60hltiKqiThivHqk4rtxnqWDiK62w+uYyNjb
	lX5Luzuq2TAi2vSLKlT56hOo8WL3IrXT3oNDsI3HV5eAoEo9qugR2SDfwM2xd3LO
	Ijhm0Y3WavW4edGSuw5V62dVcw08Iby5i+1e/icYEapckfrqWlYSb87snmIYB5e8
	5cNvEwbgsOipzhT1OayzeroeHvQEgCtoUNHA2N1fen0U88I0euD0AWDtTKNonK3r
	HJC3n2ngP8g0W3v6umtyF0O52COAfHTv7tzMuK0qY9jxkAKkbn9wi8pQYLIIYx8i
	vsWPPjH5LFZsmGEgjnZLjvIOG/I7AnXQ7u3VwdFNDQnGqe4Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9v9kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76fede6ccdso1453257a12.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846524; x=1776451324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LkOHEiyv4wNs2xK1MBQesqevDYPBfrfROxl/qZcMhl0=;
        b=hDrfZTk0JXmLAe7jNgM2OQUY/zEkhK7J+37YDIj7W9DkJK+dAG3c2ZrYzt1M3MATG8
         SMYxfg8mgvDf5Py2IyKygWqVIQ4mS7LNAruvxeRa1ZYmhywwsCbYeR8d/zToromRKxAf
         7Si7Sy1X1Yhm/rq7Ux10Ge5U9K0bTNTv2h2sjS7CBIimMMcZfv9Y+GfwaMxhae5qhyup
         CJt/dvicPsd8WTKwNBdQj7qqTGxw7SND66CZ6DsJvqvNNgj750RRiJYWp3b3PD3WZU22
         P5piTr89cEsqw4SE13J4WRulwk1wuIT/wDH7j1TSL1Jz396hozIz7ZmqG94BnhTyV2M1
         hQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846524; x=1776451324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkOHEiyv4wNs2xK1MBQesqevDYPBfrfROxl/qZcMhl0=;
        b=OyDF8WFfLAWVvFbP8xx5EA0YGXaXOu/u4hsXqpzyKgwR7WvjkdD3ocpuvOYFPMhNW/
         w8zVG/W2j8wSbDp1zLjszUDo76X2mJXDQPiSb1REmlP78JzMoFTigeQ2WkKqC7nw99w0
         EVobaLU8p1VniylX5nhgTasKXKt/frVEc6ZKBYpmX3vuHRPCAtjeKVpLdkjVz/D/vk4i
         U0qOIAtBiyhMc/yUODKsK57SMJZDUGGn+QpULZyoS47TNmGg6k6w6FeKtxhsoU84U0+j
         1erInoKMKbo5QsYur1B6jQ3o3PxrWCT7xZ9iUJLFAom+Tk/7USeW20PoFN/J/uF1mIYL
         OClg==
X-Forwarded-Encrypted: i=1; AJvYcCWQTCGE2D5003er6KdGWSZuj3Re4zrnGFAwAVQbiIRIRV5C9/UzRVDuaGhb9WViX2TSisxEVLXhXAt0@vger.kernel.org
X-Gm-Message-State: AOJu0YxbQivo073YmdkkblPaVM9yVoourfc1Pl+HGYa0CL1FJYML7DuA
	g9V01m8bsUXx9M4ebu+Sojkye/I2MjI++Xs/tTbsQFt+N90CLyIT7mzTlG3v302MShcUhWur7bi
	3Lmtz8Lc9T+YqGWjNUPpTs3lR3uvwzwCzU6sh+EST+s7JgzzS5GrCZXBrLfGi4qQ6
X-Gm-Gg: AeBDievHJ6naY4SwePmstbR7qQ6x3MR1aTzfVbxh5vMUY+VNJB3NjNTvtUJ3gBCrcdi
	Xfo5E+fO8S5EgbTfkYiciRQJCa98qsJqIUR7UZWK+L48ATkdR0AWaVEsghTc+daEGs+CrfOBtX4
	8j8+pKsRSB2vCstH9RbtrxLgEFsZh5VVyoA9K84+6Tm2B9wY++WguwWjjBLRE6GwSC0nJFKYxm5
	hKpMxAq4vbWlOvW8P8DZkK0eRi0uK9bLu09C8JhQ/CVGulTRPDIMGbfT758Pp6rNd3mhnrKnnrG
	m3s26l3Mc3H/yqvLrNATbQtCwHsKbnqmEqWRPQxKUfkZ04K42kpeuoFUp4I93Dakh7PFm67d454
	pyQONCm+cUxnHSZWYb61xSyPELaNfUqHrGNTheF7XKT+fSEJP
X-Received: by 2002:a05:6a00:a223:b0:82a:7471:eb90 with SMTP id d2e1a72fcca58-82f0c299062mr4720881b3a.30.1775846523636;
        Fri, 10 Apr 2026 11:42:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:a223:b0:82a:7471:eb90 with SMTP id d2e1a72fcca58-82f0c299062mr4720849b3a.30.1775846522803;
        Fri, 10 Apr 2026 11:42:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:02 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 00/35] irqchip/qcom-pdc: Clean up register mapping and DT descriptions
Date: Sat, 11 Apr 2026 00:10:37 +0530
Message-ID: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX1ePTtL96jtET
 BKOZSMNMMDOIZhOb2eAlWTC2a/3/3aQrcBh6SR3I4YRCqiJSeEmiqYfk+FPUiiL/deCFpQIlKFB
 hHR5L9qjG+aYQLtrf2tPfD/5wNZoMxfwkR22bT+xxfEV3rJ3qo9YoIFp3mhOAshkQ8BNZ9t02W4
 OQu9ZCwbhobUi52dIopF0HVDMQ6qD4iucUIWr1UUkkPu5rLeKicjg3+fsct6RF4DCITZCqPOSCN
 zdAXu6HrgTWePgAaevkmk7EK7AigqiQwvFT49LCwkmh/3+colnvcDE5Ss+/a9s3bQ+acguaLWlV
 zdABMO8VVDC9bsg11m0ZPIRoP9s0bBbDGlUd8BfYLGGEmrDORk76WSyxsvwBs8OAjBiEJkBl6OL
 KVPfs78Ym2akZg1XODVESH3n4iHYeILJ1IbdmExC8MXKgaaUAjG28RWoYk3nqTx+NhPSDL+ZAUD
 R5t7AD7JgZwxiRDnZAw==
X-Proofpoint-ORIG-GUID: wTvZo_qg2mQC-Fb2qh6kuUBaTEMngAVI
X-Proofpoint-GUID: wTvZo_qg2mQC-Fb2qh6kuUBaTEMngAVI
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d9447c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=W6bzyTRxDKc9L6jH1-MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The Qualcomm PDC (Power Domain Controller) hardware exposes multiple DRV
(Driver) regions, each 0x10000 bytes in size, where each region serves a
specific client in the system . Linux only needs access to the APSS DRV
region.

Despite this, the driver was mapping up to 0x30000 bytes (three DRV
regions) via a QCOM_PDC_SIZE clamp introduced as a workaround for old
sm8150 DTs that described a too-small register window. Correspondingly,
most platform DTS files described the PDC reg as 0x30000 in size, and
several also carried a second, entirely unused reg entry pointing at an
unrelated register region that the driver never maps.

This series cleans all of that up in three logical steps:

1. (patches 2-6):

Split __pdc_enable_intr() into two focused per-version helpers
to separate the HW < 3.2 bank-based path from the HW >= 3.2 per-pin
path. Replace the pdc_version global with a function pointer assigned
once at probe time, moving the version check out of the hot path.
Tighten the ioremap clamp from QCOM_PDC_SIZE (0x30000) to PDC_DRV_SIZE
(0x10000) now that the DT fixes below make the workaround unnecessary.
Also add a PDC_VERSION() constructor macro and use FIELD_GET() for bank
index extraction to make the bit encoding self-documenting.

2. (patches 1, 7-28):

All 28 platform DTS files that described the PDC reg window as 0x30000
are corrected to 0x10000, reflecting the single APSS DRV region that
Linux actually maps.

3. (patches 29-35):

Seven platform DTS files (kaanapali, lemans, milos, monaco, sc8280xp,
sdx75, talos) carried a second reg entry pointing at an unrelated
hardware block. The driver only ever calls of_address_to_resource(node,
0, ...) so this second entry was never mapped or accessed. Remove it.

The net result is that every PDC node in the tree now describes exactly
one register region of exactly 0x10000 bytes — the APSS DRV region that
the driver actually uses — and the driver's ioremap clamp matches that
reality.

Mukesh Ojha (35):
  dt-bindings: qcom,pdc: Tighten reg to single APSS DRV region
  irqchip/qcom-pdc: Split __pdc_enable_intr() into per-version helpers
  irqchip/qcom-pdc: Tighten ioremap clamp to single DRV region size
  irqchip/qcom-pdc: Replace pdc_version global with a function pointer
  irqchip/qcom-pdc: Add PDC_VERSION() macro to describe version register
    fields
  irqchip/qcom-pdc: Use FIELD_GET() to extract bank index and bit
    position
  arm64: dts: qcom: sdm845: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sdm670: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sc7180: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sc7280: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sc8180x: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sm8150: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sc8280xp: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sm8250: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sm8350: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sm8450: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sm8550: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sm8650: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sm4450: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: x1e80100: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sm6350: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sar2130p: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: qcs615: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: qcs8300: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sa8775p: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sdx75: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: milos: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: qdu1000: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: kaanapali: Drop unused second PDC reg entry
  arm64: dts: qcom: lemans: Drop unused second PDC reg entry
  arm64: dts: qcom: milos: Drop unused second PDC reg entry
  arm64: dts: qcom: monaco: Drop unused second PDC reg entry
  arm64: dts: qcom: sc8280xp: Drop unused second PDC reg entry
  arm64: dts: qcom: sdx75: Drop unused second PDC reg entry
  arm64: dts: qcom: talos: Drop unused second PDC reg entry

 .../interrupt-controller/qcom,pdc.yaml        |  2 +-
 arch/arm64/boot/dts/qcom/hamoa.dtsi           |  2 +-
 arch/arm64/boot/dts/qcom/kaanapali.dtsi       |  3 +-
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/milos.dtsi           |  3 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/qdu1000.dtsi         |  2 +-
 arch/arm64/boot/dts/qcom/sar2130p.dtsi        |  2 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi         |  2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |  2 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sdx75.dtsi           |  3 +-
 arch/arm64/boot/dts/qcom/sm4450.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/talos.dtsi           |  3 +-
 drivers/irqchip/qcom-pdc.c                    | 56 +++++++++++--------
 25 files changed, 57 insertions(+), 53 deletions(-)

-- 
2.53.0

