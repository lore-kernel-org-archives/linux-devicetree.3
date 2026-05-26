Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D2E405C23
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815579; cv=none; b=LYxnJLd0ETsfYwDXCNsHxxsGoyciL90Wl27BUBEczKwEUf4wOk/Q/0a/SkjcmGLOrOGPgKcxzPZsZP9X0qWaqqawutKCWw3ZpeqMZ5M8dAhVe8AENvKCdI2g7PiJySRM8YQiBnFLCZYKhzscYHkAxK3N4Gje68Z07wpymGHwRCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815579; c=relaxed/simple;
	bh=z16XuHj1A7vELH7YEt8PGS9A3NivYQGTOASzze0I4ig=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AOYARIiTM8upZlq3NkG2J/f/ctVdPOaZ1DbrWp/4B7e46FBkxuA27OmCEAhkYc4qL0+V6w2m4f3fWvVzt+QYvAFu0ePblnik/WqITtkOGyFINjXKTGvB7eAI/ERO2HlF5vOdLSVchM/u04JxQcjQu4XVRS/hhXy0nlQHrS2sWw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFZ5hjAF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S9wodx6G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFZ5hjAF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S9wodx6G"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1AZE2164309
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Pow14EwOIn0od75ybgcQR4
	L1r35iLvKxModRsY1OKyI=; b=TFZ5hjAFp43/hPTprCZQ0Gv8xR/rKTIXOujJnz
	DMVhYAHCyC6omlIDU5q2X7jxeX5ccmj91xfrs/JMGgHOczzgT4n3QEZIyyBCbFjF
	xZ29ME/hIXH5si0epr/l4zJ8V0e9P2/7+xKyA+ooJAqy9OuYDXjneshXs9S7wS1O
	Mm1B4HE1Y6BUW4mNkVbpQt20RyLp5xuvEie9kxaUbODIoV2Rv6xVzom7NYNUaUx4
	3s9xGTKGWpQOAHelvzQgUFrJsQH8oms9YQFSQ0qLbn6wa15vImnJSeeIxnqs5zjm
	JSHGASxB4caap1TkUIydwonG6KgmwUUvoaLv+RTDJNM5rwbw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwwcbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:12:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83544d05c5aso5426813b3a.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815576; x=1780420376; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pow14EwOIn0od75ybgcQR4L1r35iLvKxModRsY1OKyI=;
        b=S9wodx6GVc7fC09RBtY9FsvTeOjR5+PPPSY94nzW5xiiayhHtTmQnsCY5syAtUfZo5
         Bslq7MlMVTPat0mnl8ZmYjVXiz9SBht4+o9DIM4Jplnl4sRusLRm36MuEoxW21JNKB68
         rltxfvrqLGZVwn6I/W4OTevk1dIztAVqVjBW4TajbM1bz8q/wQkgFLNal/jnSuGgaBP2
         U+f2w8awmY/sBO7VanejddxwzoeRRaYRi9dhb1QVDLldJXfHCYaaJOFBBTCNzeMQQro/
         CO8QFNSM6i9i0ACMocw0vjQtGAI5zPuJ3KO+QBrzQAkaOVS9lZsRBD8mrwfNyJwhr3jR
         BoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815576; x=1780420376;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pow14EwOIn0od75ybgcQR4L1r35iLvKxModRsY1OKyI=;
        b=OJJL1fkkNBEA4TNlshrP4nJAJVjbng7B8e2pL2LIhUtqrRwrHlhCxohY/zaEOPy0fQ
         zC+mgrbieSZ1k2fYFwCraN2WC5Pl/rkAa6xg6FlP3mlzx7zsDyEOKqglmFJeSdcegtXI
         lfsniJLNfrCbiXaGTPLuzz2dq9VmmZD3PAnV76LSRTcuDD5041u24ss8zA6+vkAn5Zg+
         1yXmhKsLyY/HtpzHSj4ORiH9M/Ul6M3+GefmHlOU36xjnsdKEFAodwXc0aVIF85tbKBP
         f/1IkXFjFNYbHkWaqYQDzoaxUQcCfurgRqEsExNXP7wvEDIcNxNU6aI3aLfbsRzKpnRt
         gdbA==
X-Forwarded-Encrypted: i=1; AFNElJ/t6+O0kTY55jEicoFMYj3TH3Q/x+azZgJfxawamGptkebihWzRUIqJ199VQovo0iLMxW4GYyibeoBW@vger.kernel.org
X-Gm-Message-State: AOJu0YySngca4HjCGlKD0DhAbL4KG+G4Rd10+6L6lwNrB+SulhKhgohX
	xeIV3gDplXHejWjBr20GUnMJ0aBkL7OWJZ0xX+dX9J5nNFLhhA8Np+FRNZv+bn3uOQLT0bdEvz8
	BUJ4ncGTTh1Sd9fG6QpZjxyz6+HrNjTQ2zauaKiBmlBBe2wpEkOSB8WGprpaYqqsH
X-Gm-Gg: Acq92OFLZUgUQyPxH0b4fcFwutLwxxkvJAvMzIGgD9qCNp66lk15bP4HnAiUAWdxzTO
	v+XhrlfcGESItNcVJ+xIlX2jMpdD1bg59H7I5bLN5MVE1Y6EOaG2yv8iFKLqLzZsBy2wgBvndH9
	RunTYqQIW7FWwO8cPmQ/o3oNYgmeWrrU/a3w+HkHC0SJW2y9xqFpnaQtY2H56yxWPGMh0YE8xBY
	iDvLKkF1ypU1NrivVfVeec5mmrdGN4Y198tjXyGquxDBch6Oe4hDOuMdgWRziWBliyDyfuGxB+6
	/wkJCatuV+Yo5OZ/2sLNFvYeCHR6rmdL3+svBxstnWyPMm940g71RFGjlQkYBsDbxNCO1rasCqs
	RvpLbwvC32oKIZcUFQuRoPkVTo6qOEHCzurzyvm8lK+bD+t0WMB4u
X-Received: by 2002:a05:6a00:124d:b0:835:cc47:6ff8 with SMTP id d2e1a72fcca58-8415f3a54bemr18300651b3a.45.1779815576100;
        Tue, 26 May 2026 10:12:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:124d:b0:835:cc47:6ff8 with SMTP id d2e1a72fcca58-8415f3a54bemr18300594b3a.45.1779815575564;
        Tue, 26 May 2026 10:12:55 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:12:54 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH 0/8] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Tue, 26 May 2026 22:42:44 +0530
Message-Id: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIzUFWoC/02OWwqDMBQFtyL3uwHzuj62UvyIyU0NRW0Tawvi3
 ptWCv2cA2eYDRLFQAnaYoNIa0hhnjLwUwF2MNOFWHCZQZQCSy2QpSFco2HWjCmxz4OezHr0iMZ
 qxB7y8xbJh9fXeu4OjnR/ZPlyjNCbRMzO4xiWtmiM6RXJkmztfZYIgdjImhuhdNVw56Un8lTBf
 1RbHEmc/5LcwlylXVMprVBhu0ro9v0NFga5fuIAAAA=
X-Change-ID: 20260526-shikra-camss-review-cf6f66ac566b
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: fCVEoxN1ckWoaChCmvxYrIZYBZL34n5A
X-Proofpoint-GUID: fCVEoxN1ckWoaChCmvxYrIZYBZL34n5A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX25RvY/7EWPpb
 TllOJbt4XTB/Pvo+VhhYLP5rch2/HYdFWyl4hbZX3u6aG1+e6dbXDmZSlI+nyVUz0OfCiQIBgPI
 G4xrevAfbgwz5l29zLIsBzA7c4LspQGn9kRQs/KDp/a1+7UTu/SnbzC+dTeNrwYxM5tzgpHwseA
 2fjxZgLzxR7WlOcL1Fe/099A85GrdRf0+g+Q2YNvfmp4nMbtqJNguwsuWxkydOfrGae7DeisjR7
 yR16BQeZN0C3av2h2nBv8w5DY8iUwRrEQFwxhmy91t+akoYsmpucYvn9Jo85ql09xMW2yKHXsj1
 fNHNNhkh7I2aWvkTvSuLWkDSxmokdHbBWNBt/y2ojQibzyrTOg2NhUf8Md7OxePEZsVpPMcQcwg
 dR+9pLMaSJ7do0bKMjbjuo1oeWIwgFJna2ma7mMsevXSv5cdB+UmjL4efHLISv8wNnGcbwXuwCH
 78wMhOOJIIv/puHIiDQ==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a15d499 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0ARVRLQPdUDne_cnrioA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260149

Shikra EVK is based on the Qualcomm Shikra SoC.
It lacks a camera sensor in its default configuration.
This series adds CAMSS driver support, CCI definitions and enables
the 22-pin IMX577 sensor via CSIPHY0 through a device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,qcm2290-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=1 W=1 qcom/shikra-cqm-evk-imx577-camera.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-iqs-evk-imx577-camera.dtb
- make CHECK_DTBS=y W=1 dtbs

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Nihal Kumar Gupta (7):
      dt-bindings: media: qcom: Add Shikra CAMSS compatible
      dt-bindings: i2c: qcom-cci: Document Shikra compatible
      arm64: dts: qcom: shikra: Add CAMSS node
      arm64: dts: qcom: shikra: Add CCI definitions
      arm64: dts: qcom: shikra: Add pin configuration for mclks
      arm64: dts: qcom: shikra-cqm-evk-imx577-camera: Add DT overlay
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay

Prashant Shrotriya (1):
      media: qcom: camss: add support for QCM2390 camss

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../bindings/media/qcom,qcm2290-camss.yaml         |   6 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 .../dts/qcom/shikra-cqm-evk-imx577-camera.dtso     |  63 +++++++
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  63 +++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 197 +++++++++++++++++++++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   1 +
 drivers/media/platform/qcom/camss/camss.c          |  13 ++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 10 files changed, 355 insertions(+), 1 deletion(-)
---
base-commit: 9aab4e30ec8ffc5622669381a245791df3feefe7
change-id: 20260526-shikra-camss-review-cf6f66ac566b
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v3
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 391f9dffceaac9f44df7c2daffafb66fa379ca35
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 7e351b93b3a238145ca642143bd0824bb90e98ce

Best regards,
-- 
Nihal Kumar Gupta <nihalkum@qti.qualcomm.com>

