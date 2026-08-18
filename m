Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5939B479880
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787060309; cv=none; b=KYyunMey6p+8f6GUPN7R/vcOZ59Nd0GnnCuOK854OiWoPjsuDkM2zjNJ7ZlEhrdQRexOgt4hgn0AJat/AATpqbpk6bKfndReRqiQh7Siqp75xa38fk19BVXohqN2R1sa88VbphPbx1HxzffnxmT5UE/7vXQuDRcFL144E6S0Yvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787060309; c=relaxed/simple;
	bh=GkxaKnq/63E0Z7X8FpzUUbG68EV0WqLS6lypFir7120=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BaNDBlxm1GI1cHW5qxdTSSTvaPX2BIyEfooKaqaFSCu2QR0jWHBVLgFBOsZe38TLeKzVVPqzOwWc6YyzYzrzmW1D1/FSkeS6gxqb0kx0YWDw+xLezdA2WS9A6Qzzm/bxjpLAF6jpIHRFhj9vWld5dZGoCXI1g2kGVno5nsIOmds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B94k3TnO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VlCD5LT3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B94k3TnO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VlCD5LT3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IDQQqD941900
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=W8MX3BkKHzSUT4q98a2dtC
	s2yo7vAig8OUxQGH0S0+4=; b=B94k3TnOtZx8mkBWhnHXTPOa0xO5NuvSIfySg/
	JXhqdfZx1qPRmmZk8rldN5xd9aie6JOLi6/I4HZemE/xQRbdJgPIDtmn2BPgN7W6
	MjU3LYnYF3vbSqKeqYMlQ1Y8Rv/OWfQQpmtcyz61gVPtmlmqZ55liL0nLUu8QVTg
	Y9Du5Fl2f0zYSB9rFHEBtWA/rFQ+4pEgeDFSAwrAvlOfuntQFOX0YhDLhtEyzQoT
	6U1jwrakjXuqedt592mDGdNF0+T7Tb3S/u05gSKr/SSDPlPMFSQbkVUxT/4d60kO
	AncQP0s5VCcltx9STuWfxAkesIWdMOPE/FbvpUuUVcVRPq3A==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4qxj04ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:38:24 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7ee59eeb8c1so2832745a34.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 06:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787060303; x=1787665103; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W8MX3BkKHzSUT4q98a2dtCs2yo7vAig8OUxQGH0S0+4=;
        b=VlCD5LT3SB5O3ad0J213jmJ+1ADl64slbBXc00daIQEyJyiXxTMtA94WDf6+knRoAk
         xjKebJXQX21MszH4oVALDOqn+bH/TCst7lZtkbAVGa2CWlo0V+pfhYPCY1PyUhGBBeRV
         qdsNHzP+MLhk2qhXIv6GYx6n0Z+QttuCzdPb/2xwCsdXxI6OPGCus+l6V/q9pEQwkgCj
         M/XSTJpJPL7WihFoYkQsx6HeZ0ZVJ3785p+35aFscqzPFO69IO5LwLuE183gcxxWtenV
         nHgIc3Y5VIcB43yXAJHK1cg1a+XmWLIJHD3A3bsSW+yReebmq3kFQLm3h+OT0Z3fJVlT
         FNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787060303; x=1787665103;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W8MX3BkKHzSUT4q98a2dtCs2yo7vAig8OUxQGH0S0+4=;
        b=IjwZgoJJptxi/0mVkWfG3pSP7PTAQQCupo6amCiq9rT3bzW6EFa1qrtSnoJNp/wuno
         unwvF/cOsEmfosLBSpLvQ144AG3XyPsqUczOy0X/GovIHeSf/BLelZMgcqz7WO3QaF3t
         Q7BpkbsaCIX+eHWKCup7GToGe1W9v2gR16rjEfyHcO/w4Csded/Xc3iNLrfQaW31tEzk
         /NgzM2x2Gg067daKbkjPX0IO+GxyGj/E2njDnU+CS7ln2sL6sc4vJo1inGMVQkhOOPSU
         uCZJd7VpD/3h28qaRguvt682tJOVv6VAHhT+fZrrvANxm1uguiZEPtLXtw1pJcTWfQ13
         FzJA==
X-Forwarded-Encrypted: i=1; AHgh+RrHQyciV849TwEe7JUFc3O78I3kn/HFZj3sqxuLP13heSBuQo0kSU3jNZzYGgB20tv7C8t2Zt5Qy/Kl@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdxr9AFiq2pc6b398ATc/7CmGYFoQkT7twJII9Ap3HaXRMD/mm
	/Qmb3ByZFjopnvAvUSet/2d6gzRqKfOOtjObtacQx6lM24zY4H26epvaDeQC76D5NX09wNDHT4Q
	K6U8xZB5JM/IrYioLQDeyJIFk8vvQW+9NDJ/PWzrAaqpIv4o6+qvOqP+tgVQGPQso
X-Gm-Gg: AR+sD12YQejssPLV1f5u5qus2ogLaK3DDcVdMrdKi8hbcJw4S1V8A+khxY5lITyGuq1
	rfHRgMTGT90tIk+fwyIzBMG8fGgxcc0gfF5BO9Gj0A1iLA/q+68amVPjwwWbviPUHCPrdZNDHjj
	5Qz80M2TxElbjIMSEnInPTDI9Se6kcPXq183qrDpDYrae8xHjsZScWRhcmm59uUNoW78JCKUnOq
	IRmXGCYMEvaJDuXJVxjNTaWkAhGkqbqEzCavTgV/iXOtBkMCzTdnqlNIHjd3ealtVbTneZnLbnO
	QsjbPoeiWFxZprpWNXbty5TVFY3ipak2tT8SQao/+1V5ARlMZBGL3ypX312/TVds/cFEteOIwC/
	1MH0xc87nFkq7LX72G45lIRJsZ07RiL7Ynw==
X-Received: by 2002:a05:6820:160f:b0:6b0:fc2c:bb27 with SMTP id 006d021491bc7-6b0fc2cc496mr15903914eaf.14.1787060303246;
        Tue, 18 Aug 2026 06:38:23 -0700 (PDT)
X-Received: by 2002:a05:6820:160f:b0:6b0:fc2c:bb27 with SMTP id 006d021491bc7-6b0fc2cc496mr15903875eaf.14.1787060302666;
        Tue, 18 Aug 2026 06:38:22 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45f22aea368sm3232956fac.5.2026.08.18.06.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 06:38:22 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v3 0/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
Date: Tue, 18 Aug 2026 19:08:09 +0530
Message-Id: <20260818-use_gpio_to_notify_master_of_spi_target_activity-v3-0-e1c9e0dabbda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEFghGoC/53OQW7DIBAF0KtErEtkcIxDV71HVCGCB2ei2jgMR
 rUi37042XTRTbMZ6Utf8/6dEUQEYu+7O4uQkTCMJdRvO+YuduyBY1cyk5VUVSs1nwlMP2EwKZg
 xJPSLGSwliCZ4QxOaZGMPyViXMGNaeOOVtBrE4dg2rLydInj8fpCnz2em+XwFlzZna1yQUojLY
 1MWW+/JHyv1fz4LXnFXq9rqc9N5pT8C0f422y8XhmFfDttWZPnLEe0LjiyOPnQCvK9F2/g/nHV
 dfwBs2QOVcQEAAA==
X-Change-ID: 20260729-use_gpio_to_notify_master_of_spi_target_activity-5f62a9e14875
To: konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787060297; l=2028;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=GkxaKnq/63E0Z7X8FpzUUbG68EV0WqLS6lypFir7120=;
 b=CD6P1SGuExyO2hOc1fOipRkKgGLSrCS7wKtKqUd+r6MaJ+DOaER+Z/hIJwROxvjmWsbgXKXH8
 qSUV3IkAfV9AL/IlkFIkbHV6juNx5L46B1Cscb0WHbQMtANPdgX/sku
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDEwMCBTYWx0ZWRfX8XdqbagI/Sdi
 1LAWM1pozkFJJr5kNDRxvXYvreT0wp7O24nn4jRtgww5i+qDYQhn+JrgrS3BD19V04VzlrzchXl
 nsDz1gdZ4IN36BpZljQhfnwPW2vLqgA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDEwMCBTYWx0ZWRfX9WLvfZ8/nay+
 6P0CUYVwK37EwZWLsgI2gVAruCHWe1JAablD0EwaERlMeX555NU4XNfdliKELS555FRzQ+RUMJg
 iRFu5bfaft27PzsISFyb+wu/f7FYKtM9z65cqB6J3MiVWeQTYKVcUKFJ+eluv6eUlmI8SNW3NdL
 Dnkr/wUwz4Mn0qqZ5Xj8eAQoX9pJog9x/ga8FN5Zin3eYmdOd0qfrktks0TpVZGwDBj7cF1tHby
 JRIo+NhzdjCDzXe0fVrPpmhfsgll3kvaaqYXrFlwfEzrZM2FSokXAM0WgXIw0scT1SFP/y3VvO/
 hFDT6Elo8b+Xs4X/4n+eaVog9u6lCgfAcPLJ9FRXcDuSw/6S78ozU24r/5ZhXtT5/xKqiMcJiEM
 jSO/zbOYpBMTLz8lCuSnJUZIqUnYlLJ98QNxZb9sAigtiWcLh4IbLG7n8bwYKH5wm+o/5Dl4+vI
 x+Liagllr5D/JwdukZw==
X-Proofpoint-ORIG-GUID: BnFmlQWVDMnIKNXgJtrFVp0NdYk7DEFD
X-Proofpoint-GUID: BnFmlQWVDMnIKNXgJtrFVp0NdYk7DEFD
X-Authority-Analysis: v=2.4 cv=bvB8wkai c=1 sm=1 tr=0 ts=6a846050 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=DF-2czj9NRJiL_b3NI8A:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180100

When operating in SPI target mode, the GENI controller relies on an
external GPIO to notify the SPI master about the target's active state.

Add support for an optional device GPIO that is asserted when a target
transfer begins and deasserted when the transfer completes, is aborted,
or hits a timeout. This allows the target to explicitly signal its
availability to the master and ensures the GPIO is released in all error
and completion paths, preventing the master from observing a stale or
incorrect target ready indication.

The ready GPIO is intentionally made optional and is requested only
when target mode is enabled. This preserves existing behaviour for
systems that do not require the signal and avoids regressions on
deployed platforms where the GPIO is already controlled from userspace.
Targets without a ready GPIO continue to operate unchanged by using
devm_gpiod_get_index_optional().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v3:
- Rebased on linux-next tip.
- Link to v2: https://patch.msgid.link/20260817-use_gpio_to_notify_master_of_spi_target_activity-v2-0-94d1eff3175f@oss.qualcomm.com

Changes in v2:
- Used ready-gpio instead of target-gpio.
- Updated commit text.
- Link to v1: https://patch.msgid.link/20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com

---
Praveen Talari (2):
      spi: dt-bindings: Document ready-gpios property
      spi: qcom-geni: Use GPIO to notify master of SPI target activity

 .../bindings/spi/qcom,sa8255p-geni-spi.yaml        |  9 ++++++++
 .../bindings/spi/qcom,spi-geni-qcom.yaml           |  9 ++++++++
 drivers/spi/spi-geni-qcom.c                        | 25 ++++++++++++++++++++--
 3 files changed, 41 insertions(+), 2 deletions(-)
---
base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
change-id: 20260729-use_gpio_to_notify_master_of_spi_target_activity-5f62a9e14875

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

