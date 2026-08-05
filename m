Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F34F40DB57
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925860; cv=none; b=n3eeaRB46slBbq125Xgywt8bqUH4lJyAB1PR+l22y5Jvc9cqUUovU93rSNWenhSSDFK5Y52kXq8ldLV6nZ+ilEsbwRLj1V6xqGxksNE8e4XVZ/eiifbjWf8XJD43t/xAmUxiY5DHknoIIZ4dxpS8p/gooWDmFRe8reH8kDmo14U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925860; c=relaxed/simple;
	bh=SmbDrnogYXe6ydDYTbUTX44lIgrzKMICH7evuvgUQLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F8j5Bbu9JRlXTPw9glMJXjhSu07npNnjVC7iKjGDx+B3Df3qSvPqJDnQUvNzZdbPIgT2pS7gkxLTYyWAWb/poXW8ZcbXJGRPVy6cWhGpyNMdz4F34jzDdfOP6V3sy5AgXXOcL6OS7irFCX8ONlCBcJMSLDUwWqd6s3jIBAtCoKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OAC6OZ4e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIxVbGLk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OAC6OZ4e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIxVbGLk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dfJm2663924
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 10:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OXPOwd2pMeQuRRFaRUDkLK
	gFzneMuS6p1O/drFaJRQk=; b=OAC6OZ4eXONf3MACVU8jXLOGVWWWKh6RkOkjtB
	XWxKZj1AJ6OoPKBV8e1E3SMxzLjJpzDWQRkhqC55/e09/nmWp5XbSNfzomHVo2IK
	rG9cCYrzabWmXPywp6j+euehr2r5YwZ4Ywm/zz9Q4Yrq1zwuBVXZ/r4+G1gQ3XlD
	6zLC7ahXcBK8gyDXf8QbrYdNJsYWdg7WX2q8lc11FNRhzrobUXGC2crrwT4qlc8i
	sPrWdXorzi5jp4bIrdJgIqFyz6bsGW59V6d3K2Wsz8ryte5AMTDCxa0lsIX42+/s
	BWQxkyotsPMDEorgIVh8TX6MHfW9QWFD3LUufKypJlGLF01Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv14w8rap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 10:30:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ea24a2db9so97279185a.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 03:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785925856; x=1786530656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXPOwd2pMeQuRRFaRUDkLKgFzneMuS6p1O/drFaJRQk=;
        b=CIxVbGLkcBV/uudFqVjTmrmIo7Kmit4FuQWiDSI27Ky5bC9MQBVb480bvZhCbUWgZT
         lKDu5bWRKRHUAuvyRYk/HYoka5k2c7bod7uWCko/Bl8uZY7OMD6AnWt+t3GhLC1mz03B
         uOVCnHf+a5qB1noPEl1GvgTMClks0E3tcfVJT8ZlslHo2muJvLEIolA/JlenGKiBFb/O
         Ki6h1R3kfbyyiBoHbDSBDM+5baWXglVuNJMZjYDchiT91syTuXto1tj5wKTawyqyj1tH
         0rhhOPSZ1freFfAnhziRwNCUMjIjF/1sQLIko48JOW2i2CX8Rwv/14qTLpPNEEZ1DmiU
         KaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785925856; x=1786530656;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OXPOwd2pMeQuRRFaRUDkLKgFzneMuS6p1O/drFaJRQk=;
        b=cecSYls8lXwLotEv9xjqAd6NZnQ5HDPYPF1XmUnPLxffOSAWUy08QMgO3rENI0Ymjr
         GHsmJMq7ZPXKku7DuBUkmt27kgOmKfcrvx1nZioHJYKW8asvYD4lm1bdgHmaKXv0xlfo
         Pz+aN5obiLCqLbOu/CUQbO1ijjkVh2bfQEGIHVmrhPRK1+fMtaAj7O8ZgGd5kqonZRpz
         yDkHC2Z+mWXIMnIjATSxKyXIrtNnG/1tlBQH7PqlmjTj2A/Cd1KXusFIWyqkkywVXBg5
         ym8cCJINFwH7f9z7bxiXZ2rO2/pc+2W57XRIYJKEwh8V67DDjOSwoSCQCOPpaPAZDGm8
         eJ3g==
X-Forwarded-Encrypted: i=1; AHgh+Rr+gl/KowBzForLjHqlA0q/SRhXEfnnn2ElJrOfl0yTe65AJo2Tf9POmNU1fRypAZoMKhBYSvUyH6SL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh8kR3wBQsjyK16YO/z49C5QQmVauziGswV9ufuus6QhPpkNke
	Ys9NRkXGOY6et/vhkrSn65SOEBbn/hBg7guPbbl4mTh3k7zehaNfeBfL+Q8m9aGwj9sgEBbW1UX
	0NjDZonQCtUCBqyBiWGjPlOYGAnw6a6aGnEsBodKhtAtdP/6exu8jM9srxwzjx9GEmdnQ/Drn
X-Gm-Gg: AR+sD11ikB7UCe134Eh1QLnCFbbd6aR9FNLEx9qoj+vf52TigaXJtS+jFJCwpQJuu8l
	iQ82JeLt3Sx0EQcU+sJBK0+Y/04BEROYJIpsFZRWkTNWtXF9fUsT5xxJ/pDn0Z8+g1/OHsBd5pe
	2dTDJyyD4yWNjDxEj08f7CHJ7Gi9LXQIKza/6AYBYw/23ddruSXhcclU6+XrYAdwEraXQ1Bl4yD
	VoJkNFVkxWiFJIR5WJof+NKaL52SwY7ON/qT4o8gtE8hrB5PxqUcqqztKTbu0hpQWisdYyFFFk3
	ZetnRVXF/HaiicZg7HnL+p8Gxu/cqgm7W6EJ33+M9uUnPKQJja2b1RlzN99JVjwfGtqIvd6nYxX
	sI4Hwmx4FuG6S6llL2gVRq4wl18IGfdgrhewtTF8hXdue5tKl4miuARv9kdE=
X-Received: by 2002:a05:620a:a501:b0:936:2fa5:387a with SMTP id af79cd13be357-9364918a28cmr385090285a.43.1785925856268;
        Wed, 05 Aug 2026 03:30:56 -0700 (PDT)
X-Received: by 2002:a05:620a:a501:b0:936:2fa5:387a with SMTP id af79cd13be357-9364918a28cmr385086185a.43.1785925855830;
        Wed, 05 Aug 2026 03:30:55 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ff9d814sm22259706d6.10.2026.08.05.03.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:30:55 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, yijie.yang@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Initial support for Advantech SOM-DB5830 board
Date: Wed,  5 Aug 2026 18:29:59 +0800
Message-ID: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260805-hamoa-come-v3-555d3f56cadc
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4MyBTYWx0ZWRfX416pGEczRuAD
 26wLCeH1pMKunMrw14eREtUwelQDUijC+70N24/0cBkB+NcukAAlZYci7esIErj/1/KywsPB8+5
 iWttsbpPJpGSYBBIYfqTVooH8ETVPwU=
X-Proofpoint-ORIG-GUID: Xp5G0TNBkCUPYCqnN_eog7dcT3ZbX2-o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4MyBTYWx0ZWRfX0fv3R8pFLuUM
 mKueQ/MJxpLBIWeozq6eEbH/spzh9NxixnpajVIx0wDuKPKi4LPwPyBOhnu++WOJm03a1VNPgjK
 HBWT5dlbQFGu1htV2B/M8ZFzU237aId5HrwAmVqciFZUdLMc+c6Y2S2ObNfpTKzblrWqX+qbppd
 iE6fIhPG2T4CTRe9iyiRJryPTKKZYAbYIZSmpLs9VYceLhAJ2AEjbck9HTO6P7KMxdNzOQHZF1V
 rrcpeQakDSkJCAWy383wz/3A6f82aIYGxfOo/vAVEscrlWtfso3hS2Qw1IwVRd4Djb6iQ2cryIf
 GxxWIZM30AWwqmKmAVvirsmydvDHszJMdtWU9oNrAObvNfDMy+t9QeGt+KBsmYN6DkteGc7vEQZ
 HrXekMOvIWZomulAK0regPFwUgehPSG9ekoIcFftEDwkrRbiKxEjISgD8/7u0AcKXahwQuGS0oM
 A9gVCrj/0NRjJ2mJkDg==
X-Proofpoint-GUID: Xp5G0TNBkCUPYCqnN_eog7dcT3ZbX2-o
X-Authority-Analysis: v=2.4 cv=Cu+PtH4D c=1 sm=1 tr=0 ts=6a7310e0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=atTkGMxPYI1-1LqGoR4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050083

Board layout:
+--------------------------------------------------+
|               SoM (Advantech SOM-6820)           |
|                                                  |
|   +------------------------------------------+   |
|   |     SiP (IQ X7181 EVK SiP)               |   |
|   |                                          |   |
|   |   +----------------------------------+   |   |
|   |   |   SoC (X1E80100)                 |   |   |
|   |   +----------------------------------+   |   |
|   |                                          |   |
|   +------------------------------------------+   |
|                                                  |
+------------------------+-------------------------+
                         |
                         |  Plugs into
                         v
+--------------------------------------------------+
|         Carrier Board (Advantech SOM-DB5830)     |
+--------------------------------------------------+

Introduce the device tree, DT bindings for Advantech SOM-DB5830 board.
And fix HAMOA/PURWA IOT EVK compatibles.

Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Changes in v3
- add patch to fix HAMOA/PURWA IOT EVK SOM compatibles
- update Advantech SOM-DB5830 binding and dts
- rebase on next-20260804
- Link to v2: https://lore.kernel.org/all/20260727070758.528-1-yuanjie.yang@oss.qualcomm.com/

Changes in v2:
- update commit msg
- fix binding error
- update pcie and usb DT
- Link to v1: https://lore.kernel.org/all/20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com/

---
Yuanjie Yang (4):
      dt-bindings: arm: qcom: fix PURWA/HAMOA IOT SOM compatibles
      arm64: dts: qcom: fix PURWA/HAMOA IOT SOM compatibles
      dt-bindings: arm: qcom: Add Advantech SOM-DB5830
      arm64: dts: qcom: Add Advantech SOM-DB5830

 Documentation/devicetree/bindings/arm/qcom.yaml    |  11 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |   4 +-
 arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi       |  54 ++++++++++
 arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts      | 119 +++++++++++++++++++++
 .../{purwa-iot-som.dtsi => iq-x5121-evk-som.dtsi}  |   0
 .../{hamoa-iot-som.dtsi => iq-x7181-evk-som.dtsi}  |   0
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts         |   4 +-
 8 files changed, 187 insertions(+), 6 deletions(-)
---
base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
change-id: 20260805-hamoa-come-v3-555d3f56cadc

Best regards,
--  
Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
