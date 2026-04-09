Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2313446CC
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 21:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775768502; cv=none; b=jrYDPKaFZ9Ieu1XY/Q6UeqKHCtzT2j95VasOtAOkiplUyg6f8haybSIR9I7DKr+S4jKn9oY/Puo/8rpN+0YH+dVS9C47EP0FXNQMuGvQbxXpv9wfUN/S22bJZhueeYUg2ZZnjdj8xbwb41D4U4o3aYGgcjArhh0fk5NHrW0fZOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775768502; c=relaxed/simple;
	bh=vZHVaFbSwQ1qSUva5/AHIir0gLS9fMoZzp5OXBqA5jE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z82X/6RY0h2S4NNpGxZ+cEtH9Joph5EdbZ4SVYd+I472SBcu/q77/xlucIfPFBj5KWKtPqALFBHg4Whx4bqJkt2HYjs5tLbW/B3xu9o1Z292f0DOMQTyun/vuRB/pGgeng971i2Tx7bsp06lJL2Fj209xJk0yjzYlXH+VKZDWqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c85I1AWg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jW6szNAO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c85I1AWg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jW6szNAO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639D1RqF1972532
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 21:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5dEL5MOodw+HHIahyhw+Hp
	mUMby25CJ3xWcG0oDGS5g=; b=c85I1AWg14+OWNu7z3e6Bj1RuzgGV+X2eey+pn
	+ZduAVIEPhxv0mFsa++QFSwAyynp+ULcSswe0siaht3SI9W/4mBGISctFw2fFOFf
	J9I2qJ5dXI5fZv5Tb4SDyNK9rMG9hP+2nsOD25XGeICSISZYBqVS2FGdWnsYq1Dt
	poMftjJltU6bxTbxNkCw4UTI5iB7MFQZRwBbiUHCNdr9gkaLQ8E/OtY+nfJJNXAE
	Su1PnnnqHiJONGxwdC9QxGSkw3LMbGGwHkpzFSi/gn2wVubReY37hlTrYN2W3Bfo
	VL78hiaG2O0FfX6sBdL8gM7eTqyLktPssRqgKKqlGmn6r5Bg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms1p51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 21:01:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2d443c3b094so1839387eec.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 14:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775768500; x=1776373300; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5dEL5MOodw+HHIahyhw+HpmUMby25CJ3xWcG0oDGS5g=;
        b=jW6szNAOzwkghZDmi7IeqIa8ueMuUCRZ5THo4XE2/jxEQK40KXm1rCwfN1jAI4F9QQ
         glx1Qg+Hg2r1gdPb9tGb1qopCl+GEWVw90roWw6Gc9rz6BcIJbvlwj/dpZNI2mqvYv2D
         MpauJyyiOnKjfKO/ERCAUmik5YjmEnNXSN5ZDBITqZLRGDRvmJzHuYWFz/M5j9McqXHz
         kB6/lXLC57Wm2S8NUtMChXGDTZqG8I2e5sULvqBGu0K8Oc49j7HBwBEXT9yQU7edF9x4
         9+GyBlH4a9OoryVfsDvvi0R7Z9jheIHKubEGiDegEiIXnXe3KssYcIv29jXq5wtlkOuT
         rNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775768500; x=1776373300;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dEL5MOodw+HHIahyhw+HpmUMby25CJ3xWcG0oDGS5g=;
        b=jCAJJvOlneGUNWJ7z5WZUVdeZK4xC61FSA2qC3s+7nuCgI1HvWmLQ+q/w37JF/Jg4i
         Vp4/xamPBEl/6Psawr+AIM2BUROtIHKpSVf8YbAYKDq9jNQH4wfKGy1vUibfYtqn8/az
         jFBZVdCqrfgfbsfycjjLYwfm0wCRkj4iZweEwhvbbQg2b0Tt9u+fo/axjeQzA599lIG2
         TzmnUxCTzqrm/X8CGD30Y5h5J4GHU3s0iBImXLDQmmWugqTQxG+9CYC2+lw0ULA1AVj1
         ftJvX67mcm3vU2aSM7nhSWbZW3hQCMoyJs2Lfcj3mmh6vsW/CcaBC3hHAqQn2goO2TXg
         lNFA==
X-Forwarded-Encrypted: i=1; AJvYcCXif8q8wuUFBhtj4uPsXhYZq+nfgtrM9iLPvI+qLgoedT2ovuesmOUKUC2UY92P6Wh0C/UXQdGx3p8a@vger.kernel.org
X-Gm-Message-State: AOJu0YwcR9zLcocgmXtSOLmGuh3ObiolWFpk/gHnjVyLVSWNwsMAqzRM
	7kQC3OukLjoPd2RttJguXBHD9RtetF+ysYCvwA8W/ZWMLL4nYqFsHx2wa1YJUNNScnptuTFcQqx
	L/pEnOtQDcuwJXd5BtPXzbRjtNWuP2sFBPyu2C2L4UawhL8b71jxJgDvv2FY+j/we
X-Gm-Gg: AeBDietgKAON9YibgZlBumMVIy/FuNmxfr2+QpAjEWEWNtCwqnGR2GPOumET1fzUxWt
	R9G6LUZaXLbGDjUFBkG3Q9L/n6tkwFvMyKtYWQ0SGOm9S/V0X20rTG2RkAypZkVOZW11yBApMNb
	RcYFwtD/vXKy9lEd8m/qaYvev49NJOXmSos0brpBzSagdDMOp8SF7GDI3x9e+SB3XwK63dxYgXH
	ibrsjSAvMUDtKeg0w5iJk/T7rNH27o0pxfUKBcfPoa8Rz9kodNZNq4z5Mg8SFYJ/60SivdP1sjX
	3N3Im2KBkxC0MARusbWXFqnXSbgqlFHaG9wH1QEfJSXzz5++TCloPc3yxa6al5ZYQYpBnisUS2s
	3huhplTpzIEUigyhOM0q6ThOXDopjqejcfAjF4bFLeDvP9nvmghJPfrrbfz9Zf/6MVJpycxAUAU
	w1
X-Received: by 2002:a05:7301:6706:b0:2c8:fe46:eeb6 with SMTP id 5a478bee46e88-2d5881a91e7mr369492eec.16.1775768500036;
        Thu, 09 Apr 2026 14:01:40 -0700 (PDT)
X-Received: by 2002:a05:7301:6706:b0:2c8:fe46:eeb6 with SMTP id 5a478bee46e88-2d5881a91e7mr369462eec.16.1775768499349;
        Thu, 09 Apr 2026 14:01:39 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562db6ac8sm1292549eec.26.2026.04.09.14.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:01:38 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH v3 0/2] interconnect: qcom: Add support for upcoming Hawi
 SoC
Date: Thu, 09 Apr 2026 14:01:36 -0700
Message-Id: <20260409-icc-hawi-v3-0-851cac12a81d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALAT2GkC/22MzQ6CMBAGX8X0bEl/aAFPvofxUNtFNhGqrVYN4
 d0txAQPXjaZzTczkggBIZLdZiQBEkb0Qwa53RDbmeEMFF1mIpjQTHJO0VramSdSp53lWrV1IxX
 J82uAFl9L6nDM3GG8+/BeyonP329EsjWSOGW0PKnSNFA5Wdu9j7G4PczF+r4v8iFzK4nVL5n+8
 UX2tW0B6spwJ9Qff5qmD0dt1XnnAAAA
X-Change-ID: 20260311-icc-hawi-d6dc165f8935
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775768498; l=1351;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=vZHVaFbSwQ1qSUva5/AHIir0gLS9fMoZzp5OXBqA5jE=;
 b=gPopFiLQgKOjXkIc12tHBPsFGUlodoo1j83DUElqhPrZCdWNRwZ6xPGUdB21QiZoQjM7MFex/
 6Za6fTxe31yAgN5Ul99VzY9fRHqZZVmbHtuI4dl8p8gWhzrtHM6Ex7c
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-ORIG-GUID: pYZat34rJsOXZIpgY8aHR1y58aRMHRkg
X-Proofpoint-GUID: pYZat34rJsOXZIpgY8aHR1y58aRMHRkg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5NCBTYWx0ZWRfX4tOHyBMVSaVp
 HEEUbgjTDsv7V0TJqA2zWB2GdEmZ4AGDb6FEMEFzR9M2plcObMb6TDjCQBEu30gF5Now3EgnUdq
 xXAOQcekBckL982kEmvk90Qodu0kz+domnfPfuwcqpH7ttrSaNlqPVpcsHRLV2chs1wJIDpTkdK
 XR1ZumcyEADPLPnk416/qc3jNAbLResaOWvf2SGTQbceMtqUQ0HDo7XSwh9A+ve0cDT62WZWO6/
 avX5wM69OeS40k9XJQYpT0x45dfy0nftFQpg8VA4dBDy/dNfIs0KJ5SmryVg1P6uUds0JgZxxwP
 EeynvNiIz7jMGY/Mr3Mkh/WHQiGPZPi5FZlEZZs8KOrPqCvWL+bSmuKQ5yhemN6GWIIGTVh/vDH
 h8+Xy02r/DIp0mHqxDM2Kwm2K+sHGDBFHJBV2ljvcfKsT5W0PTXJ6GRVH50a+DNGLmXKQ51/4gf
 CHE9vq9UqwCy4pPhgjQ==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d813b5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2Q3xDJHZUcaiZJ3d9McA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090194

Add interconnect bindings and RPMh-based interconnect
driver support for the upcoming Qualcomm Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Changes in v3:
- Fix alignment of macros in the binding header.
- Update binding header commit summary and description to mention
  Qualcomm SoC
- Collected missing Reviewed-bys.
- Link to v2: https://lore.kernel.org/r/20260406-icc-hawi-v2-0-6cfee87a1d25@oss.qualcomm.com

Changes in v2:
- Fix warning reported by dt_binding_check.
- Collected Acked-bys
- Link to v1: https://lore.kernel.org/r/20260330-icc-hawi-v1-0-4b54a9e7d38c@oss.qualcomm.com

---
Vivek Aknurwar (2):
      dt-bindings: interconnect: qcom: document the RPMh NoC for Hawi SoC
      interconnect: qcom: add Hawi interconnect provider driver

 .../bindings/interconnect/qcom,hawi-rpmh.yaml      |  131 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/hawi.c                   | 2021 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,hawi-rpmh.h  |  164 ++
 5 files changed, 2327 insertions(+)
---
base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
change-id: 20260311-icc-hawi-d6dc165f8935

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

