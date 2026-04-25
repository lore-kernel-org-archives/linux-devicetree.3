Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF8D313543
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 07:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777100423; cv=none; b=ps0CxJJXoHURzZHQDyKu9od3VTqfUecx0mzTLSX1VKNd1+KVUg9YxU7gus2HTRECIwHtPUoJ4ryBImSFy4G40PKXu0gb0Mf3sJzmRoKdbeb6jXyjBSoMK7mtbUQXaIW3Fg7jCcjGNImu1KzuaPk8iSp8Q220eiSkyeB55lyTlDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777100423; c=relaxed/simple;
	bh=wp91t95lhjh15mikAKqw1dtodhywMRTjcp8qVMa9ghU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UiTihCtVpmakJeq+8M9/brjDQ5TjjWgwbEFDqJQFgSD1b3NPCaYwy6FPAu4UYxaCLyRHB4Rei2/ptNYcDrG76ijHv382eIXuWZkBwFcLy9S26eVbCXtbxZisrQqFeY7yj+eBNU/Wgp9HLsGAgrwMpFeCQV82Sq9umeWk4kqs6uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYpQeRo/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PIo7saEM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYpQeRo/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PIo7saEM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3RfE22952676
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 07:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=u95S0dwADM496+fuZWR4w1DhE/LLWmP01tc
	nf4xUUdg=; b=lYpQeRo/gUlm/XZu5UEckjqsRJS3mZnBg+1THadc1l14reUD3yL
	kvo4aa1oLI2gKt2o4J2+i6J+vcZV3YHw9yI/AmYZl/4TS7kuINmKzSczsHujT9Lk
	6Z67i4LLnGIhQj9X8Fgci2/93oqqY3mZpbWDA3dTB0D2kp4jQ/VVKlt2IhEc4tiR
	5rTzahFD+3u/lPBqXHqcHEt1v3Wi2HO/Gq0CDTIcEiM0UN57+mRCzo5gb20apPjf
	hgYAvIPm+AAp8BPNjUAwSGLcWYv47P24ohgkeJ94nooge0qY5skngOqQjXxBRUd7
	keD+28d1IGYj8N7zdWLqVFRbdSIp7cc1AHQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrgbga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 07:00:13 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c8ccc7593so9868418c88.1
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 00:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777100413; x=1777705213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u95S0dwADM496+fuZWR4w1DhE/LLWmP01tcnf4xUUdg=;
        b=PIo7saEMpzliz3lGKSOHp2azWE5xm8mt1Go6i4tPZ67BrXUlWuTFIy1jBln2360IGS
         SdugecTQb3s74Sh1WGbBILcfpAGyfoUdIlB0Zelddpt0BaTEMOBTty7phYTIBotECLtz
         3pf/3dnu3S+u6Ao3DfspiaRgkkpUZfm3yjP1gnfh74frF5EBlASCU0Ed1Hm7lMt8giX+
         iFKXkv8ZXzQjZ7yL6up/cKVVMjmQdqF36KYoodjg8MxbMZL2iZCJvIA2/RGC38hVs7E6
         GsiwXt/S+CbChYaJP+pWvBCqHX9NqDf96/jG3x5ogC7BaXP46KxyckzpPEg1n1pAm614
         sKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777100413; x=1777705213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u95S0dwADM496+fuZWR4w1DhE/LLWmP01tcnf4xUUdg=;
        b=KrDH8JABLdKlNOfs1XYR8djjFSnm+9DOlHr8uNjSuBTkf3kovGD4wgHqAPM4/QdgxV
         vk6QCDxtm6+uP25oJEcKPAFAel/xJJcSfW0iZojRRBjAgOhuQa2nzhv6buKouAoK/bF3
         igqj3hlUX300FJiDsPImu3oc7L2SAYPSd78xUhdzPkNSxdp5U1WHgo6gc6EJM7Kn9vv+
         1ozithwdC5jwE9TZQ0PwbmnrdfhEX1u4Ckk1N95nKWUa7zZvt3Igq5GhcipCnkTrIMGK
         ssYBhDasmS+Qqr0pqovpWlvIhg59kVH0irmD+CgK1S8TutN8OI1l/Qm9+Ef8UHPTIz0O
         LNWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GRWH2modWn2LPnoy/I0CUX7ACIz9LtVGcgDPDQniWQEaDXiiksSi6TgxO3XuvI7FnSRGGAu81apMc@vger.kernel.org
X-Gm-Message-State: AOJu0YzZcS5RjQMZaIWfXCduopyM4NHXAMv9Qq6Mi7n3PT58car3PL2v
	2fUMRgmCS5QMYVH1IrknDK0R6WPrtqh18diiFw5jur3ZlRMnRFOw/eThQ6ht42ZdCoUNTN+1Awm
	fRLW5tK2dPU7jj+vZdZ2m5RadydesFYPF56K9gk8b4uw38rdkmjTjSX8zKbADo7tQ
X-Gm-Gg: AeBDievFsfa6ow4Agj26MF+l1oOLFGJvXXyzPaWsGjv0yYQrbBzIigcjZg8yYr+9Q5l
	MpoPYVxJFPy6FWug59ZyagIMs+lHzZK/3OEHHhYlPrjHMnmnzG6Dovlwztlt6iFIzqnnoBFHd7w
	7tUJ8jW41qqE4wXGJvL2tSMM9RPVRDWlMg5D+9rC8n6ozM0r2K4CQ5QO4WPWfgwrcgmBh5quNkd
	7FVJfol6BJakegJnrIAGwzpfqCVtvJiQJNj32EkJSwL2VCwQaSzuMP49Ht4K/KR2bzykrqTkY0S
	ococoYJYusmQxEzWfdYc0QuEo4+pLXYJMdB7fxssZUHsqgFse34DlyelljynN6yjX4JSWXdIsrJ
	kTBNUwa5jdUuJIeVcrJerpKrFjHN6DWryGgPqYwSqoO3mnKs8FWeA4iV73sF+QA1a1MIdZUgym2
	ZDn+kker1cpQ==
X-Received: by 2002:a05:7022:90a:b0:128:ceac:6db1 with SMTP id a92af1059eb24-12c73fa71demr16584841c88.28.1777100412458;
        Sat, 25 Apr 2026 00:00:12 -0700 (PDT)
X-Received: by 2002:a05:7022:90a:b0:128:ceac:6db1 with SMTP id a92af1059eb24-12c73fa71demr16584822c88.28.1777100411921;
        Sat, 25 Apr 2026 00:00:11 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dc2dfad8csm9430630c88.3.2026.04.25.00.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 00:00:11 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] phy: qcom: Introduce USB support for Hawi
Date: Fri, 24 Apr 2026 23:59:58 -0700
Message-Id: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDA2NSBTYWx0ZWRfX7Q2/uHJLhn65
 JBU+eSnKRrrBJm1pO4YCUiiQb6PDGFE87xEaCmBR0JxfQ2V3Xd2ECRuSQBDVkA7vvvVufM7umfl
 shBZbdLdPm56I3c4316RMx8Mx0uxsX+CmR1amtkjwoZbMJMO5hXm+BFhgj6fNbrSkKuqlDATTRr
 Mh8KQ9Csl0tpORx/lqlcZesb2ax/rq1easqB4zD94RLYizjVo8jXO8YiRDfV+mSlWPR0TJnugTo
 OjWmM0a48+HmiFUCS/+vHoady7kRvGwNfZUyA01jIklVxi3+sQz3z0DkRXg7Lbk2XjuVA3Hzoth
 qh2NBy1L4Ek0jLqAIMJG/2751khZgYlZiySjLhoatUg6mXLrGoCF1QmBsorYXQ3wCp+XFhO1hGv
 9qutTwblFo7NhyP0VV98M7kcZCyrcv5xqROM9Bk/B0JCWJPOG3uSCcnX/A7+wDUUdqOeGH9kT9e
 0mvZJLr70eUZNMXeEwQ==
X-Proofpoint-ORIG-GUID: j8QFCDz2qtIrsqEQg1dkUICuirDmnoDG
X-Proofpoint-GUID: j8QFCDz2qtIrsqEQg1dkUICuirDmnoDG
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69ec667d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=MeUEimlcFosfp0q7v7UA:9
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250065

This series adds USB PHY support for the Hawi SoC. It documents the
QMP USB3-DP combo PHY and M31 eUSB2 PHY bindings, adds the Hawi
compatible to the DWC3 USB binding, and adds the PHY initialization
sequences to the qmp-combo driver.

Ronak Raheja (4):
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
  dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
  dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
  phy: qualcomm: qmp-combo: Add support for Hawi SoC

 .../bindings/phy/qcom,m31-eusb2-phy.yaml      |   1 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |   2 +
 .../bindings/usb/qcom,snps-dwc3.yaml          |   3 +
 .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 232 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  34 +++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   |  89 +++++++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  89 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   5 +
 12 files changed, 513 insertions(+), 4 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h

-- 
2.34.1

