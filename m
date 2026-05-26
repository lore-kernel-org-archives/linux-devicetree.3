Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1583CA4BF
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792904; cv=none; b=BFp1Km+knv+UozjN2cZ0qOW3cYztY+F0zRZDseqJ8WLLiSjI+1d3zWSZpFwFpkG935UCDfXKCWK2kem6ycKSBOmcrAek028Xh6Kldcm52GFG26hASWoUUxSLL9JE/IyqVM3iK9dLBTsNj/bz3FqL0nXPHTAiqkBtqw4KdWIoCNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792904; c=relaxed/simple;
	bh=7QQkuBBYS7pvOUikI2IIrtnwYTffSUSoJ2JsUGfSCaY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jd6sGyDkWaKfplELd190Ef+KpkUgwwr1WXPsU9yKvNuYpBKZJOFwAy5hFBL0xnNkhzQBOARPaMRF/fanPhoVbJCpUroN2fgDQ0jDjrw0Z/FVKKVQG7ZaTSjQxGojnQn9p3AxevNW5vkH6K+7P+zutHSxDhWomS0ENkiE8ERKexk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LbNa3nBZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K02s+KtM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LbNa3nBZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K02s+KtM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8VdP74117392
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=z9OmQQ157cSEK+FxDkUlOF
	/YiToZ8p07ytZ70tIEE4g=; b=LbNa3nBZiJgnGfOJ/tHlIYisijhzveDZGc7fbZ
	3wsubZo6eGpPAulLpDCbj5E3Rq8Yy+VPGmVHML7MtxwI8P/PsQLSqaHE/QiJixuz
	tuFgT/THf8uNu2ogMs1tAU7mORyWZwJ8GtaRxP5gXNclwpOrJfxh3/vk9eZtfGrY
	gfCbh2Y9dTA9o4vqDWlZL/1CjV0vxrn7Xogwjrj7x41wMOY1hkEKplYbiZk0gx7X
	ApDztm4haSdfk4e7QHxHPSB36UX4GZ2fV+Mjn1OLgO2K+bdHkGVWK/zw9n8zh23c
	j3UkUIDGvoc1J6dr8/7Ry4wMD5UWMyphfD0gFHNHIeb0oBNA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudbgma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:55:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so36255765ad.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792900; x=1780397700; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z9OmQQ157cSEK+FxDkUlOF/YiToZ8p07ytZ70tIEE4g=;
        b=K02s+KtMUpCxBOEGBnJf5iYw0j3udowqvXthvWJYSOE/8QESCg7zgBvihYR65pBEuj
         nebkP/hiGY9NeMEchYbPIM4HFP6ba1+H3IFxXFrntB2vAPA0DhaLX8cg+YNde8fGUGcS
         ezjWd7VsxcXIEkPh3mxnvnR80Qglxk5c6LbmletO6BQ+ah0eFSsgxVRPP7d/EonnxRDz
         m+2tBJJkZin391hbrTCw9KzLdBMTJW/QCH+ChsMK3sZ9IGfuwfT41/ZBDQLnXJzCkjrN
         cz1iS408Xx8czvgVdG75BAjA+bz1d1rv/3P+CwSMlCUT2nfI8+8xW3inQ3UsjS1aHRBp
         kbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792900; x=1780397700;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9OmQQ157cSEK+FxDkUlOF/YiToZ8p07ytZ70tIEE4g=;
        b=jrvD95A2hYa8KgF8kcrUK7WGEKKgqQ8nzFb+/lZezrPc2CkS5nq4QLRzinewMcxRhl
         eXNHYoP+UPKyUaI3bY5sXOAMcCJf8gXF3U6WKyVcVX51mIOYZwDh1OcFACmhVC7ziYfj
         o7WrejbZVmJ2mTNuRC/u0IRGpJEPJHL1YQ8BgzdwSMYBdmKZLgB8rsFGTeUltRhAAM6Z
         FXt0ws2/ofnBqtGOSbbFYxp8CvLaoC1m6wLTZbpLHL28t5fuqwF85BhqU8uFhaerZRsK
         aKddNFu71p1wXQpFPqH5tl34q6j0H1rHowV33oapmPF4Z3LfXMnTxjaSB53EeQLGgHpF
         EJ8w==
X-Forwarded-Encrypted: i=1; AFNElJ/XMtYhuxNtqoHPfHG0sxM2ndQLcTJw7JLSwILJPSA4rInpzHxtQcWAQClGgv2/eVoDDKLlzu0EEC0C@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi/EW8oXud9jx/wsZ+sSGTJ/2mIfmx8Rev9W6Wz6xtxgJwqMvL
	Cg1vA4MADGWWfO8ImtYGsyysKQYjQFXfb/ScHqSecancdgIk61xndZOjnMCqRmmypRt6+5nRjEs
	B0mwBVRqn4yvu54nPf7nX5pvVgcoQh3z6K/EqzBxNVWaKUoIVT7yLuEbKJJ2w0sxudLSg4btf
X-Gm-Gg: Acq92OEFcYlnIFdZjFTmiPV5nNfEkD5cBbwdYuyLFE7GSV04lFJozoj4BDhs6Lw3iPD
	3z9qJ34Xm+WOoIEM138aNZr5bBgxcacz+BZmChXbdif6em1pl8ajh7yHsx/xX4GkN5Mc2e8v2V5
	nysxZ3SQYXStUIhyEpbiJ8rnbN89WwUap+Mis5l3jU1idrhfxthsitcSDxcVLOwjAOpiicwMdB/
	zYOCc0B7YEA7WZEL02IwTlU6zoNYYu4Ops2+eOIjF16Ri8qCGIKV4HApjVPBSmAVPMBr8yU58r/
	dVsJwQ/V7epUw7KHkKGJNGDiUjJkdLg3HrBtYIeWYadotfPZXeG/M/1P/7hy0Nh5M1bmvBXWFC6
	pbuMoKrFK2ZH643ZU1RStVIw8EzBh+MiGhZWY/md+dhPvx7nt1A==
X-Received: by 2002:a17:902:f650:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2beb038f177mr216266085ad.1.1779792900400;
        Tue, 26 May 2026 03:55:00 -0700 (PDT)
X-Received: by 2002:a17:902:f650:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2beb038f177mr216265565ad.1.1779792899963;
        Tue, 26 May 2026 03:54:59 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f3dsm120890025ad.1.2026.05.26.03.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:54:59 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v2 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
Date: Tue, 26 May 2026 16:24:36 +0530
Message-Id: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO17FWoC/2XO3WqEMBAF4FeRXDeSiYl/lNL3KEsZJ2PNtm52j
 UrLsu/eqDeF3gROOHxz7iLy5DmKNruLiVcffbikoJ8yQQNePlh6l7LQSpfKai0HHAO+Xx1JsFA
 hkXbkjEj968S9/96tt9OR49KdmeYN2BqDj3OYfvZjK2y9wy3gr7uCVLIqFdW2KYiteg0x5rcFv
 yiMY54ecXoc/sS3JU2ej6Ni5Bhxn9xmz7tsQEFtQJscVFlrUBLkuHxyHPJwHvCf/LLN7DCy3H7
 83GbWqsS4kpqu4Z5qlxzs+8Y4KhSUjcEKe8ecNj1+AVsRHXtOAQAA
X-Change-ID: 20260522-hamoa_pdc-1517acc2dcd4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792895; l=7143;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=7QQkuBBYS7pvOUikI2IIrtnwYTffSUSoJ2JsUGfSCaY=;
 b=GMIMZ+Lkd4rMRHNisTf1iNuVseLstw7F7nn6JgTieD8ORy5eFHPgpeZLuYke/ScF56QGUCh2Y
 cjWoNizVRSpDRcBDDNXKMNKQdACNCm1wyz6dq0zonjfRaUj+znhlYS7
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: NRukAACwaH7LkUFtzAA47nlggqmbdrv8
X-Proofpoint-GUID: NRukAACwaH7LkUFtzAA47nlggqmbdrv8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfX42ojlNK7v49g
 Rjl+o3NRXfL887tF+Z9B4tY7Km/Y988LqIzUEriCqT2gJKW/MmqNwwO+sZpCGgbp8FzBXI+EVA+
 pRFrXZcez0eGr1w4/2ULBVHb9ys/M7rfxArFoQixiZjCBdu6eGKG7cgvCXpbr97g0m5ZD1LbN0u
 YmSoj6nUUOyaIUglHU7ZKdZxEr7t4jWgp00GGqTrLH2DTUEafWqKQYH9T0fbaVUfsaqQ1n2VQwX
 SlHlZR4050ApHXZ6x4yo9qcFq3DswsOoCGlVCY8d2tkt1xjc7IJE7T9XqbujpCOCJl+whM3U6tL
 6Uqm1I+r8c26E7j0bXrDd/1TMFRYSI6puMOhxgV04nQu+ZMRYdmYcIICWawU0EKeAY0dpTRAiJ4
 DO5K5h4nwcc5wN8UV6Kefg1nCAHCwYVeg5n6Y/rQ5vjbwJv5euck76JvA3JNqRrpGl5Cnt++I/S
 P2yvJNyz/oHwynejTUA==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a157c05 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aMSERw3ZVSxg4zp0N1wA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260095

There are two modes PDC irqchip can work in
        - pass through mode
        - secondary controller mode

Secondary mode is supported depending on SoC using PDC HW Version v3.0
or higher.

+------------------------------------------------------------------------+
| SoC             |  SM8350, SM8450  | SM8550, Hamoa   | SM8650, SM8750  |
|----------------------------------------------------------- ------------|
| Version         |        v2.7      |       v3.0        |       v3.2    |
|------------------------------------------------------------------------|
| Pass through    |        Yes       |       Yes         |       Yes     |
|------------------------------------------------------------------------|
| Secondary       |        No        |       Yes         |       Yes     |
+------------------------------------------------------------------------+

All PDC irqchip supports pass through mode in which both Direct SPIs and
GPIO IRQs (as SPIs) are sent to GIC without latching at PDC, PDC only does
inversion when needed for falling edge to rising edge or level low to level
high, as the GIC do not support falling edge/level low interrupts.

Newer PDCs (v3.0 onwards) also support additional secondary controller mode
where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
still works same as pass through mode without latching at PDC even in
secondary controller mode.

All the SoCs defaulted to pass through mode with the exception of some x1e.

x1e PDC may be set to secondary controller mode for builds on CRD boards
whereas it may be set to pass through mode for IoT-EVK boards. The mode
configuration is done in firmware and initially shipped windows firmware
did not have SCM interface to read or modify the PDC configuration.
Later only write access is opened up for non secure world.

Using the write access available add changes to modify the PDC mode to
pass through mode via SCM write. When the write fails (on older firmware)
assume to work in secondary mode.

As the deepest idle state as the PDC can now wake up SoC from GPIOs and
revert commit 602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC wakeup
parent for now").

The series has been tested on x1e80100 CRD with both old and new firmware
and also on kaanapali.

v2 series is dependent on [1] as mostly all changes are already reviewed.

[1] https://lore.kernel.org/linux-arm-msm/20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com/

---
Changes in v2:
- Update to mention SoC names along with PDC versions in cover letter
- Drop devicetree change to remove scm interconnects
- Use qcom_scm_is_available() to wait for dependency on SCM
- Drop binding change mentioning qcom,qmp and PDC config reg
- Restructure version support and move all statics to struct pdc_desc
- Remove pdc_enable_intr() wrapper
- Differentiate direct SPI and GPIOs as SPI using PDC IRQ PARAM reg
- Add changes to make PDC work in secondary controller mode
- Rework and include Stephan's change to invoke irq_ack() for edge interrupt
- Mention dependency via b4 prerequisites and cover letter
- Link to v1: https://lore.kernel.org/r/20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com
---

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

---
Maulik Shah (7):
      irqchip/qcom-pdc: restructure version support
      irqchip/qcom-pdc: Move all statics to struct pdc_desc
      irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
      irqchip/qcom-pdc: Differentiate between direct SPI and GPIO as SPI
      irqchip/qcom-pdc: Configure PDC to pass through mode
      Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now"
      arm64: dts: qcom: x1e80100: Add deepest idle state

Stephan Gerhold (1):
      pinctrl: qcom: Acknowledge IRQs for PDC interrupt controller

 arch/arm64/boot/dts/qcom/hamoa.dtsi     |  10 +-
 drivers/irqchip/qcom-pdc.c              | 381 ++++++++++++++++++++++++++------
 drivers/pinctrl/qcom/pinctrl-msm.c      |  15 +-
 drivers/pinctrl/qcom/pinctrl-x1e80100.c |   4 +-
 4 files changed, 333 insertions(+), 77 deletions(-)
---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260522-hamoa_pdc-1517acc2dcd4
prerequisite-message-id: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
prerequisite-patch-id: 152df6e30f70eb1b45909ce2793bc4277554b7ff
prerequisite-patch-id: 118bd4216e0386e7214133f53153684947fa8dd3
prerequisite-patch-id: 1f2f272d8ad1f7930d462e6349bc49de815e1ba1
prerequisite-patch-id: 3754ffdf536206353f74953fd6d39804ff7787d4
prerequisite-patch-id: 98d2cd93554dfea42da9bcd1ba53b0239d6836f4
prerequisite-patch-id: 87ad71a0f5768ae94456e5ab4bb00d79800c4898
prerequisite-patch-id: 6c085ea456451f2e45c339230e90ae5e86b6c483
prerequisite-patch-id: 135746d47f49e5740b917e2d53d32f73a4e472b4
prerequisite-patch-id: 95dcb247828a68acf40f6551eea717bf6335006e
prerequisite-patch-id: 0a5d81e083380e81e2f1c90a75cf1d9391af3d64
prerequisite-patch-id: a936d4e6bcda340617e2f977d8fc643987737447
prerequisite-patch-id: 73ebb3cd88252ce27917ae14ada516ce7b7d716d
prerequisite-patch-id: a468354e609e85a34b65a9942c5266c172b863c0
prerequisite-patch-id: 9ef9f964fe537f16af2dd5ae6fffefb674ff7fc3
prerequisite-patch-id: b2c5e1056112e55ebc4d28e5fcd9645761c582eb
prerequisite-patch-id: ac2c5816c4456eb74af62169c25c1c8aa8ad3c68
prerequisite-patch-id: 3816d06da5c4c0b30f410ed2a42ecc65d57919d2
prerequisite-patch-id: 14dc8923207eac85455c5b880b2384c5b5922888
prerequisite-patch-id: 6d342fae37bb7096493233b7a971252ef7745b01
prerequisite-patch-id: 042f78e8746e14be7e1a0730fd31d45f8ad3b81e
prerequisite-patch-id: b8e78eb60dad553179effa885e404ce2dd8f5e14
prerequisite-patch-id: 9b8b5ac855b66157369facb131e0f3b4765d2126
prerequisite-patch-id: c6fa9f4d6e29daf186636f13e3a686590025cace
prerequisite-patch-id: a234c590c1b226d7072e8c5246cb0b916f3c72f9
prerequisite-patch-id: cb2695d6935b41293f463ef69b7e3cd782201022
prerequisite-patch-id: aa82039b51c95f8dc7ec6413e9f6ee92df00e4fc
prerequisite-patch-id: e47eff060286ea45f93b035cec769ca7bd6b2132
prerequisite-patch-id: efb84c7428f0cb84c0e1b4554c0c67f473a870f9
prerequisite-patch-id: 8de545aeb00a2d25c4f6fd0665ad8e84d7763d67
prerequisite-patch-id: 251020fc087715650a42813ab123e753b4b6175d
prerequisite-patch-id: 39634ab0203158a4a334a1c3042a70a4fd718ab4
prerequisite-patch-id: 6a42906498b1e801d396bd8919ccc53914dfced2
prerequisite-patch-id: 66ffd9cdc62e63dc45f9ad0fb567288277efe8d8
prerequisite-patch-id: 7a2734805d289e8f22c51b2f7cde5e19b09d81fe
prerequisite-patch-id: 5d9d0287da0a0a0b37e23db5c15b1bb500dee308

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

