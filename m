Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497A83EF654
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 11:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154833; cv=none; b=eJLPRSnmpp2HcGE+Q8/6SD+ZCZpyk+v913Oc0nrv3PI+G+k19WoHIfZi89Ca7F3sjQA0lgahrGVMNjMDYMmFZwZe3CZP7Qm+dOXaUOCw9ueJllj8BomHZ/92ClKDypm5lrH3Bk3Zbx12kFkQ420IbrH5Y9msPeB/eJ7lf/QpukM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154833; c=relaxed/simple;
	bh=sfl81u2ifZ0/GKHLGpn31j3VpS1n60GRSgz4W7+kkeo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ED+EiIMwCtkBHA6YA6RKS54vm/ssz2Y9HGaLvn04mU00tnI3XDkbz72mSqD+Ixv9oNi5hY/1zwt5DDac3RbiD5C4iDqJVihENd5MOs6mlqmqZ0CWr5542xSwBtIYncK/jcmzP/E4Q4CDTwIJSVVDix984+juc418Tfmr41l2XGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YR4uC2ax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HEPyvh3p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YR4uC2ax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HEPyvh3p"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64795pHK3463973
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 11:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=89zFx3dLXtbpfnKkvfW0+OhfkwJkSy5cdCw
	bfPbXPYw=; b=YR4uC2axPJ3/ATxJXnvfx0wwFSR7ErX3jvrpJHV1fUkumnCt3Ra
	Q44Y3h3s6uAz7u2pFfr+n5AIU9QZ3o50ZZXFDnR992WckABk+gJ5Ml88JaZKog1X
	+0YsWSR2ieVbmAtQD0nULmubU3MzVUH1iZmOmaxepe2Bh3zSc586ja28qkyANLi4
	03U4vJSt6hhl/frrc4Tco19U/OZxPLgbO64zFvFQES2iHBcTIytsS9boZ9FbvBVD
	m2cEL6DKhEIXaLGBHxACsO6yKvYCTYXph/ErPmTH0Q6GaaFYfceSlTkVPcSy/0th
	hFAE7NRSTrbXq+BG4GwIAxZb29+ROiz6qGQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn1xee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 11:53:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f74f0e3c6so487869b3a.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 04:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778154831; x=1778759631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=89zFx3dLXtbpfnKkvfW0+OhfkwJkSy5cdCwbfPbXPYw=;
        b=HEPyvh3pu78yDoCsc2U8WT4y94HUkpMRw1DfQC16qxiPM2gc4R77ShiCP1zs8fBuuz
         WYijDaN7I0fwXzWWSZiMhztNCA5KIRwq6blwtKHM6cLweAa9xeESvEHQ2ftx7O2MI7oK
         2HoC/NOtd9HXApLBr148vyRHKWjwqLsLW40iIDOuWDrIQ4He1l0sVrbKv3XLbuCjetKb
         Cd4TfPfhZ9WicIvcLSCHv+5gQ36kB3eodZ01CqJ+IT70mXQTbuslcG+I628y03NnENML
         5bVL2nivyekp6yqY+F96Q7KvcmbpVfdFDq0XbcfghouSQcTeioVFmxSbT6UfONqRo7/e
         o4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778154831; x=1778759631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89zFx3dLXtbpfnKkvfW0+OhfkwJkSy5cdCwbfPbXPYw=;
        b=ewveBniqQfhpyE6axCLFxiBcp4Kyi5wqJehunzonPG8lqO4e/mxTmmCOunsytd2ctq
         /cie2/6k5W+bfjvxnin4OmLA6Q+opy3djaLHw0I/RqC0ax1iyEIbaVDJZ1/dg2vwe7n/
         koIqade2kjYYOZIZF0DWHsMZ7Roq/WEshhPtE7nJXoG424mmLoNoNdMaKOyIrzMiJUbp
         oqe5JuH5f/jk+6CaiVFMV8GCF8LwVAvrdYFpKNwZtaOmOdenq3bN3nxqwjQoySogmpPA
         IEWmyDtKZG3uSkZ+RZarRewBsH/56gRo12U+5NYEEoNNMVtJjYhjNjhpCmHOGPHu/sW2
         BGvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UqSEEQ3GyQWHn5zbXHSH9ZN3N4vImGrxPYNy51LB7O3ZevlH50imWBpEq/HnkyoXtIctIVp6qhTNA@vger.kernel.org
X-Gm-Message-State: AOJu0YzCokDie4vXtQe/4U8qyMWxZT4BviZ+hwiunlZCv0hSHDF+FgP1
	kO/ds4AAm5j5IJmDVWqOCULDTNRhOA4l/5jH4OABspoj6VO2jpnv6JdjISJvRX9xylLr3VSSsYh
	VTOoOEUP3p5NwwLQKqUgs75DUOeD6R0Cm0JfXELO2Oy6vtXlGum14en+JbZ/3G1As
X-Gm-Gg: AeBDievsjnzCvNvL12D9SRoZYabAr0k7Hu57QXskBhNmu3lu07Wy1r/zs2ZOLIPhHMy
	vuZcxpbioZM99n4TUr9UP/+7/KBnrOOGVR/Sl1HUGi7N5HDklouDIH8KZXDhdPkVTsnFA5mg8U5
	9LpssMPUOWAV+tOlTV0+T2Be6slJ5UM8wcIVpRxnyUhxTgAzIxSoqT+FEHQNfN+lcpLIa7m6+w6
	g91vdRWZBuKzP8/R9ztk3FrlIWgMynn8r06WVlanKPs3h6SoZC9lAAjpA6hO7Ew/dX0kknWSWDq
	44hGfMD1WTRvJXnX3rJIqyH9hXRivtQ4Rmidt4kvFJBfMjzbfxuCzT0DgmfGJBHfDeQk9ek6IoJ
	io8xa60qqyRY9L+KBwweTEqhpVVJUSecM5vhhX6KgBLbrpctni4euYJt188Y/x6Bbxw==
X-Received: by 2002:a05:6a00:348a:b0:835:6bdf:c87d with SMTP id d2e1a72fcca58-83a5b0dc365mr6912953b3a.10.1778154830720;
        Thu, 07 May 2026 04:53:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:348a:b0:835:6bdf:c87d with SMTP id d2e1a72fcca58-83a5b0dc365mr6912928b3a.10.1778154830213;
        Thu, 07 May 2026 04:53:50 -0700 (PDT)
Received: from hu-anupkulk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965646254sm8976072b3a.10.2026.05.07.04.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:53:49 -0700 (PDT)
From: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mukesh.savaliya@oss.qualcomm.com,
        viken.dadhaniya@oss.qualcomm.com,
        Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: Enable CAN RX via GPIO expander
Date: Thu,  7 May 2026 17:23:24 +0530
Message-Id: <20260507115324.1814329-1-anup.kulkarni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDExOCBTYWx0ZWRfX5yrlwPtXX6+o
 Jy/v4/e0wYGd6cc6Nt7mKwW7JbTGhfJE0wurD+vM9/FXhO4bRHz6AH+Zbj5Z7aSlB/LBZSSoM3n
 WyD0TLyWKfYxy/8KK8LiPzgHV6C+3Y6Rwh8u5MnUZNszymSU6740M7rKg4kWKR2I4oLfqk/rynC
 fYriJQEMfJL84u6K7dfMeW7txlKPjfYboAGolE9go8YI2gwNfAkLR83/vV4L0k559CiZ926oArL
 bbkuRXGkhFSk7TCbAWc1IXi2UQ7gLLETIaLbeahZYHGUsdFvYvqtxzITe5EuXDz1ww3OTnwTsJs
 7PBwzp+XM+wqe6fkY0mnNFqqun3ncQizBN92CZhpsFP7UOEQdW53T9qvflfMJ9hkegMP1A/QLeM
 Wbqc1OTjYD/kDCriuQKkwojVLDqHkurALiEI68a/weZWAX0VZ2Gs0OPWyTJG8DCcAdp5A7FXZdA
 KPT3jx1MyLdJ97o99gw==
X-Proofpoint-ORIG-GUID: 7KnUXFuIOKZIWPlTDPvHl2VlWvkAib4S
X-Proofpoint-GUID: 7KnUXFuIOKZIWPlTDPvHl2VlWvkAib4S
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc7d4f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=HURNEOczjUzzROzEHuAA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070118

Few CAN controllers, part of RTSS sub-system on LeMans, route
their RX signal through a I2C GPIO expander at address 0x3b.
RTSS subsystem is an MCU like sub-system on LeMans with independent
booting capability through OSPI interface and supports peripherals
like RGMII, CAN-FD, UART, I2C, SPI etc.

Describe LeMans EVK hardware  wiring by configuring the
expander GPIO 4 pin as hog with output-high, asserting the selected
line during boot.

Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
---
v1->v2
- Fixed commit text to include platform name.
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c665db6a4595..34dfc8d22b6a 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -616,6 +616,13 @@ expander3: gpio@3b {
 		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&expander3_int>;
 		pinctrl-names = "default";
+
+		rtss-can-sel-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "rtss-can-sel";
+		};
 	};
 
 	eeprom@50 {
-- 
2.34.1

