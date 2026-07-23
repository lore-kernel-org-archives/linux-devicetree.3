Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9773FA5FC
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802844; cv=none; b=UCkK6xfON523bBpUdtXN2UafiLqy14nMK+7awWVdh30/+yY+NpVaE0nDUaGh6jB7r/wXNIfHYdZbFqbaJw62hMB3bPniL5GE4vkq1y4mUPxC5knkigMEVJ3crcNSXgPSnXXNeh0OvP4A+UUc1bFA6dTGkM/byILvmsEdZ+vVp8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802844; c=relaxed/simple;
	bh=YItNRAgZfyzYsKxB/mo8wzkxN+0B5MX7n9bA2JEAzGw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZOQRgGWXOkirUrzn2hEqiC4Z1HTql8psZnYDCVJV12MkRuWqKRjBMzR+n4+kQpyACDQ6VrkJ1SArr1kh1rYnuYz+MvwDbWvTo7ufZaULd9vrVosZhqqb9zhDD4SEF+O1gloxn8BRVNsMdDPyAFcmbJt1XicSOQ8D9uDTUsLElXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3/z7GDy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihMIQ5ux; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3/z7GDy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihMIQ5ux"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qXsv3044796
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yFwvTEvbxitTnXVvq9g/N8
	U8oJCFWq8coef2LtZTwW0=; b=D3/z7GDyh/jfJMPhato4Hr7mDNEdOFCIDnqrpJ
	0NLJ1YFdhVELsU7HfK5Lgd2tVr3dOX+WeGY/6o6WkJC38Zvaq71swG8vIYjXdSFG
	A1et5nEKxvDw/AI9StNeiIrUsqgohc6R12d8uE74cSxPjjj8kAvTkbKM7dPK1B6z
	CjcefbiTBL6Urfc+m1oJeAJvE7EuaaVQZik23NBf2jsRPdwUhtMszf1G8Og8RrhH
	1xltYT9axMcKHu3Kk5QNEdc5QeeAqJOCLxnve9VdtFwnVPsTlNKqtd0qu4yusqEc
	SLZiAl3uRC39Y96NKqgjKWspjqecdACoGBU/F7zaOAf1tpZQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq8n1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:34:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc86a9ef97so13363295ad.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784802841; x=1785407641; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yFwvTEvbxitTnXVvq9g/N8U8oJCFWq8coef2LtZTwW0=;
        b=ihMIQ5uxmpzLC3c5Bxfe/xxZT7Nc8pbfWSIg7CJpJWEJ7p7WPY6G0Enkp+UK5V/tMw
         ERJT1J9j4o2C3CpYoWwofLCRBFOouesp0OmF94r3BB3znOrCGpEpmJbAMEgAkz/IFEX9
         5Yo1YXHONPlQA6hfI9op/k2/KzSnVKEHmxG2lfICwwCjzatH6ypfJ6eYEmdxvI/yeIhc
         hpbYTGxKrobn6oj1fby7uEk0xKpHi9xAPZ7KdHRncWPcQGsk4vpYspXGoVVu/Ga/Y16L
         atIK94Q+WD6HmXx49KLmGWE6LwxXswbZiiJB1/VkAhS+v4WcCwiSdX4IB9NXnUVoL7q0
         1iDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802841; x=1785407641;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yFwvTEvbxitTnXVvq9g/N8U8oJCFWq8coef2LtZTwW0=;
        b=AH+BbYSv/Nxs1NlizmFIIZax6EUZvc0fpXTlsoRH1+Ntl/R6yKueAsxK45rESW1ZRN
         xv1VUUXTZdq7PcAfyNABm9Rl0B8f2OwHUAyYBKSmu8OMR6FoCBfgbzWQZfqspTSBvsGg
         nq7jDM97xb6Qw3Q1Zl0ieCgGayA7TiifBlTMFy8ViBTm/zo3VdY91179JXxuYSGSeeQy
         W8LAfQMKby2jByqXcor/kLRD8Y/PkC8HqatnZscySYjWLyitarjbQOAwtCLq7LgzbF9u
         +ut3lrVZkTyTn0NeTdmU/5WpFTLojBzP9y1RsZgHAaWIS0yjMOJDVHxQbvs3aUDOJywO
         eqhQ==
X-Forwarded-Encrypted: i=1; AHgh+RrimUqAjiIQ015xQZX+RgcqEAZoMOjdxdHxbR87NMfcO3qQCXfrp9wyYVjVwxpxZcJ6IBngxrRip4J2@vger.kernel.org
X-Gm-Message-State: AOJu0YxrAlxsqQZCeECQiJWpBbhvBYXx04bWg+fDPHRBjc0OxEqX7QzN
	+KCqXSUtgew5L8+3FXY5h79mqu+ZlnuOGZ4CDUogVRI5/KfYkdzSo5y/TH7CWXr8SmvPxTx81ZC
	bS/1PLhcD4lU0yVcVPjNY127tFny/gRVuRZko3RNwJkYtdQ5hzy8AMVTAuKct03fn6ti+qj/P
X-Gm-Gg: AR+sD12OcJU27sHdBP7OMbqUHgb3Y8mtdHvzAFjyFSgNCpAi1/HKkqVeyNsB+sHPTbE
	GdRFQiDZHyBR3WLJOX/VMmq7cyeNNlVQzl3OtfmpWhqRAI8ad8U1cMk8JPlgs9rKf8h4gwFFQGL
	R63tX/bdUWZmCNx+SIdkhV+L85PvllD8AkowSdsYMvj3wWHs0BJrI04HMFHyrO9LafSD2w/5HzN
	JV+0mwLLWiOGjbOVi32xcl/UjD4wJnlJ1Ga8a/nkgdRDgYWdr8Wt5GERRHOwC1YOj2OCYVrvZ6k
	X2Zr2eXHM6yeZ3P61JBjuKD2wX42XoL0fi489D0aH158HftNVMWgmRL2TckbmpSvRo1gKHgqA8z
	Z6xmAc4cQZMjvkVYKo5DPQOfXiDpJUTQgVf4bKXeVFN2XmAbaTK6H/SikRd/I2EySuJCdGA==
X-Received: by 2002:a17:903:41ce:b0:2ce:8e70:3210 with SMTP id d9443c01a7336-2cfa7436e9fmr30204255ad.16.1784802840868;
        Thu, 23 Jul 2026 03:34:00 -0700 (PDT)
X-Received: by 2002:a17:903:41ce:b0:2ce:8e70:3210 with SMTP id d9443c01a7336-2cfa7436e9fmr30203945ad.16.1784802840322;
        Thu, 23 Jul 2026 03:34:00 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e6203sm32416155ad.44.2026.07.23.03.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:33:59 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v5 0/4] Add DT Support for USB on Shikra
Date: Thu, 23 Jul 2026 16:03:50 +0530
Message-Id: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA/uYWoC/2WNQQ6CMBBFr0K6tqSMaMWV9zAsSjvIqFDtANEQ7
 m5BdyaTn7zk/zeTYAyELI7JJAKOxOS7CLtNImxjugtKcpEFKNgrnRVy4EpyQ7dgpOvlmEsHlTp
 scw0GUcTZI2BNr1V5Lr/MQ3VF2y+epdEQ9z68159jvvR+esj+9fGUBNRGFeB0DfrkmdPnYO7Wt
 20aQ5TzPH8AooR0yckAAAA=
X-Change-ID: 20260719-usb-shikra-dt-v4-d2b083472aee
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784802836; l=2560;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=YItNRAgZfyzYsKxB/mo8wzkxN+0B5MX7n9bA2JEAzGw=;
 b=CD5hdST6Bx6ejP206TKSz+gYcXRiGPzssE7hTx+s+1ftBc/4O41yOFok+2BBXjq9GCGLjgyFh
 dLoyvo+3EPUA85wSr1o28pqxZgckfH2PIwq+kM9l1ZGifHMnLhGThXG
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMyBTYWx0ZWRfXyOELmZNKM2Zr
 IitFd7DY1loa3NIwul9qv9vlvSx6OzG5vvIELIp5UQUX2sHJM/obt8LPgWitMwywJYtqiqhxGhX
 /CtY+zXAf5TlgaYzYXW/iI3wJDAuXLc=
X-Proofpoint-ORIG-GUID: ZfciCdKWn0y40hvpDBJ_CWrifXKg17rt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMyBTYWx0ZWRfXwNTbhT6PvZTE
 lQDafY9GGRzMljhMPWrChJdZIRvlc+39jr6I13mA2RaXkIucOgZPdrSXWAVJY8VrwArtBgBhjLa
 Onk7QqFxZydXFnXqwu4IUA5MJ4E6jmVWZXZkKA8nRYdjZDk0sR7D+dKpmUWBzpWikq/FiA09DcE
 iC2OGVq2HEO6erb/Uqa1owY8ksvplaTKaLjg+oTkeuzT/BJfLOL21cwLJpsqdo7c4jGTTkzAiFu
 WwiTo6Xdx133bdS75KgmlTZR7acXiy3+ONgGlib0VbqyenieKKg1kdR1OTIj8N/HyZIOuNOcyuf
 SsCIYe70HTK9ce8WpTY/EFzf/7JtlY36rfPLH7XxUgEbUdEkDhYLW4iOWNVm/WBiL4OHsaAC+1s
 y+Vvm0f3IkkdxweIo1YJmRTdG5urWecWT/xYXKR8+871iAspz+xKLzz16nDoQ4h97SO2V/bTkFY
 oKuro9BdLnJsHVJ2ebQ==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a61ee19 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_AVwzdTWJwZJkuAtZNAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: ZfciCdKWn0y40hvpDBJ_CWrifXKg17rt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230103

Shikra has two USB controllers. Adding both USB controllers support
in device mode in this series.

Changes in v5:
- Added interconnects and sorted nodes alphanumerically - Dmitry
- Updated commit text mentioning that device mode is being enabled
  since role switching changes are not yet present.

Link to v4:
https://patch.msgid.link/20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com

Changes in v4:
- Enable both controllers in CQS/CQM platform
- Fixed iface clock in usb_2 node
- Skipped adding RB tags obtained from Konrad since on CQM/CQS, second
  controller also is enabled in v4. Also specified dr_mode as peripheral
  for first controller.

Link to v3:
https://lore.kernel.org/all/20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com/

Changes in v3:
- USB changes were sent as part of consolidated submission in v2, but
  they were later dropped since bindings had to be updated.
- Remove double vote on USB3_PRIM_CLKREF and also removed xo clock.
- Uses &mpm as interrupt reference (sashiko bot)

Link to v2:
https://lore.kernel.org/all/20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com/

Changes in v2:
- Moved to using mpm interrupt handler for ss phy irq (sashiko bot)

Link to v1:
https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/

Binding dependencies:
- USB controller: https://lore.kernel.org/all/20260711-usb-shikra-v4-v4-1-9d59b9d9aff7@oss.qualcomm.com/ - (RB'd)
- QUSB2 Phy: https://lore.kernel.org/all/20260712-usb-shikra-phy-v6-v6-1-1b3e51bf1541@oss.qualcomm.com/ - (RB'd)
- QMP Phy: https://lore.kernel.org/all/20260712-usb-shikra-phy-v6-v6-2-1b3e51bf1541@oss.qualcomm.com/ - (RB'd)

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (4):
      arm64: dts: qcom: Add support for usb nodes on Shikra
      arm64: dts: qcom: Enable USB controllers on Shikra CQS platform
      arm64: dts: qcom: Enable USB controllers on Shikra CQM platform
      arm64: dts: qcom: Enable USB controllers on Shikra IQS platform

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  35 +++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  35 +++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts |  35 +++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 233 ++++++++++++++++++++++++++++
 4 files changed, 338 insertions(+)
---
base-commit: 7b3363bc5e08c0a7f64b5a822a9b6e2fbcfcc401
change-id: 20260719-usb-shikra-dt-v4-d2b083472aee

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

