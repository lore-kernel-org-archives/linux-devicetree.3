Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437AC390CA3
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 17:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260711; cv=none; b=DquhMr8yyGlUuPHMJMr/gqwdMiaTOSEpM32AvZ7t2AWoC/PdnKFMXb9Bqa9TvVWXxJQcZukDAxq1wjWNQBSSPD+Y8QKpYbSO6SrFl6oBlKfHiDsyTkJFDMII+eObn6xee2CM1CGS7NFzM1Y2VwYVUasZuYV9i+2qink+ZHVfH3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260711; c=relaxed/simple;
	bh=YYu+02XUxmIkYZHnHU3pXQ1N83B3DGyGDxJ4k5VauOQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KhoszZS7MILd4oReeTrEyQWuc0EFLLI10Iy2F0PM1lzG30obTPyAUK9QSuevEWQalxkUKERAz8RfF0YGnzrD1xNn/HUb+5yenhcTtvPB53lDi2tIEbg7JaqMsVC/pXWlGT3bZFfFg67EaSLHpMQWjJ4WCcBUgPEvT1V1wzZk8B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DHh0gsoz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LpePB9Qo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DHh0gsoz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LpePB9Qo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEcW4k029614
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 17:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BJQD2/7JQgGlMnG4nTcU0Y
	IrWVQGkH/hoz8MewlllFI=; b=DHh0gsozwy5Z8DuvfNNK1chFIZmtrAOEPPhFkJ
	sOnufb8ueM7y/zeG5oABsqKjwBuzUhEvGQkJD63Q/RKD2kWgzYQx7KsrO7ypRgCP
	KOhnjVwXj+wmOGvIb7u79VL4JALoXeYVFix8KDQv2E06+bfC+k7uSJjsa1UQ0eVJ
	wNlIQM4ZvzIicIfyRPo8Kgr0+/o2vS8HsMrqSC8vP+KOr3WLCHdZ3sOCONJgXnX1
	WWKTDu/457JpyDY71gA2zqDhD6+0s3rcWUqKVcW/2+y9L09QkB0lx7nWBjpMosBV
	Mbo5rtPIPYgVWo7qop74cI3vhAhHQDMp8VsZcYI8WsQ0QLQg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvxxhmt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 17:45:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c856470fe9fso2890a12.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785260709; x=1785865509; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BJQD2/7JQgGlMnG4nTcU0YIrWVQGkH/hoz8MewlllFI=;
        b=LpePB9QoDS70+LHNHr0//++AkIzgoGkpZzkqKEYG1LwvPH3/E+dPSeXu7tDV/f6k9l
         ZIpTskoNbRtxAwM0Q0hx0fZKVVfAZTtFbQydEfbPF6Y8fySRtZZBZPmFn6WjYX1dV/WJ
         1nUtZM6JlUaR9xIPLLf1lTO7vFm1hCaMlP+okDcDHz6yt4xCZVUNQFnXsWNpFOSIVzF1
         TpdOo8RFgGXSGHgnUbWhtQU7fQ/X12hmHKaGyHzCk7gKeMxx2RL2BXfU++NjxyP13I3o
         RtU57xZ6MydeI2my4pswSVsEuc4mIk9z/RnkDffK03SH8lOA2btG/XroXn+TWQWiSVm/
         HY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260709; x=1785865509;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BJQD2/7JQgGlMnG4nTcU0YIrWVQGkH/hoz8MewlllFI=;
        b=KZS3hRfBhgHeAglgs9g0lfeYYicXwHG8QvtIWxUDWl4wKo7b7+KPeJ3fUaXv9q1j3q
         uCY5ffhG0iUpNKF6T7ehBIgCIPS5R7QKTGbY0VSKnCSG1ud2NJxa999SOlRqspN+/pYv
         qHrb/dT5ICcXrr5JqUO7hbR5zMm3BQ1LiKu0lDLP+51jBag/HArnIipsn27fCCD6DBHl
         77vx5fw5qhbMOnZdbShyotA739YIuV84czrdrtbJ2Rlpqy4/eNbQJUkVNNUqJ9HnsfeW
         fnyt3HZjsQs9tIRstLr96TWZpKacxd+X7NP09BenpLvwaPKDKM05Y496c6OnPJD0u1t6
         rsVA==
X-Forwarded-Encrypted: i=1; AHgh+RrxBRAXI+98uOTsJrX70z2JSVnkWK3zJ/z5znYCftnBbcLoru9owNB8HlfOlDuRNgYFiSFj2mOgQ7Oq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyx3lvYiMvEPzKzEGAsvnWTT79Vwtecq7snk5/aSKBuRgylV06
	46nKV6+BSb953jM4Cd61lkXqA0FPNDQ47vFwYrE6rzuGQ2PZfdeH6Y6jeMby2mC9IIQEYh4aHsd
	gig+ViS1AfjA+BEzU4pKx5uPN2HoQuvfvsl/9GiZtdZimecM+alpdH0jjgITgMbNe
X-Gm-Gg: AR+sD13W883rp2GBuZSmQRguIt58VzjSQzpJ8LMkGJitKfxfA02tSNqaSXiP3yoLbUx
	Q4yOfsCOctRau5GZGUmcD9ilnUTiIYZheRcErGYnv8rIpp+jl7IDDOiMoBfprKoD+dI+qkqBeq3
	I5wBFVuCSosKQCsJvRkFN8N/4of/9q/DZH9yqPt2w7F20omA5GyBETdcKlYvhFO1GxCNFFyJSJm
	t870QjDv0TYplSIeshoh8aMP0s00U5n4YPciZs7SeUsJ5V0V0xrRbLdBvYg1C0J03ERXADgDrMj
	UnipYBFu6AgtYAI1KZopnjxDsDdKnbWn0BZI27xyMukiCGJw2LrsVsbMEVvFHmVf6CLxjmrFd0G
	Bff+rXeAD6rDCbTJRyFFpbvB9y7IOtoaaIQoSvgCerlHEFayn+12VuRdePXg4IwnHIdwTNtiBku
	ikmyY6LhrpXRye
X-Received: by 2002:a05:6a20:cd96:b0:3c3:990b:2292 with SMTP id adf61e73a8af0-3c8ba617e44mr4082632637.57.1785260708600;
        Tue, 28 Jul 2026 10:45:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:cd96:b0:3c3:990b:2292 with SMTP id adf61e73a8af0-3c8ba617e44mr4082589637.57.1785260708003;
        Tue, 28 Jul 2026 10:45:08 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7273cd9esm749553c88.13.2026.07.28.10.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:45:05 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH 0/8] Extend Qualcomm reference device EC driver with fan
 LUT, profile and SoC Tj support
Date: Tue, 28 Jul 2026 23:14:28 +0530
Message-Id: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH3qaGoC/yWO4QqCMBSFX0X2u8l0baZE9B4R47bdapTOdtUC6
 d2b9ufAd+B8986MMHok1mQzizh58qFLUGwyZu/Q3ZB7l5iVotRCiYqjNeCcaUNEY0PbQueI16B
 VIaWWslIsTfuIV/9ZtafznyO+xmQf/iVrkQhWe5PtV3kl5CKnse9DHMw1RNOP8Q0GpwefSi64V
 TWAVVanPAai/DXCc/khT3FY7l6AkC+NH5psh7XeKSfttrDs/P3+AN7vI7DsAAAA
X-Change-ID: 20260507-ec_add_more_commands-9a6513363375
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785260700; l=2492;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=YYu+02XUxmIkYZHnHU3pXQ1N83B3DGyGDxJ4k5VauOQ=;
 b=b6FK90TXWC71UQ50jiq4eXW7V5TfRrOiIS41tMsLWGHzzyiyUhGIRkPulC5s6VmzadICscZ6z
 4v8flGx0K0SBo32b99faAa5sK4Tq7ZOmYLVwSC1MexJUgDyak6j6qSl
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfXxOBybp+ZyCSE
 yImOg0f2ftO1gV6FHqTpA/lqDCbF0ez9sfIqN4Wpocuowk2s8IOk5NduVpO7YDDSSejHYhPEHgN
 x6ApwqlBVPZ+ClRCgWB4/bTbWYzkacdWqyHo4zzEgV+QrcKCpUTsVA5W4fKFbfuMFjx4oe9mV8h
 4maiOrjSSpLZiF8JTSi/O90BEZnaydZ7jNQEg0CTqztQeD3zZAcNHWDwrvBOIh+7agy5AYFLShN
 rJBL3LZsr/pTAKAdm80CaRRO2TrVVVgNhTbExxvGAbX4NqLdzC2iarfdhNiZiasIUT5NzN0O7UK
 VFxIH2lynZwn7AyNwZAmaUh6FxGZTCXANjxRfVWJ7v8/TRxfUWVGFemjKS7OzaK2+otw6ynW61q
 wx0MCrBo8ffTuHoLhgKQVuJsM4KVFVjOhhYr+2c8K2QVwifKHsDOV6sLMb3elvy7Gs5WsMJw86L
 beSqFqyX926zEqB2LEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX9foxHES9fDvp
 L7HgM/8QVKb4DXTMjqajCoXyxXBcO3MMjNm77ip/MWIHIixSp/70eBOoucALv+fN8aDCnzODNtZ
 L716DjsmgJqnZQJM3wtrP3hjDQNYSEY=
X-Proofpoint-GUID: oU-idrW4ITdLGEi91fCpfDxuPCL7OBJZ
X-Proofpoint-ORIG-GUID: oU-idrW4ITdLGEi91fCpfDxuPCL7OBJZ
X-Authority-Analysis: v=2.4 cv=PeDPQChd c=1 sm=1 tr=0 ts=6a68eaa5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RE8P6aYtBQjt_bj6LrEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280156

This series extends the EC driver for Qualcomm reference devices
introduced in the earlier series to support auto-scaling of fan speed
based on the average SoC junction temperature. The commands added in
this series exist to facilitate that: querying fan RPM and programming
the fan speed LUT, switching between fan profiles, and periodically
reporting the SoC junction temperature to the EC.

Fan profile switching is driven by a power supply notifier that
selects best performance on AC and better battery on battery. The
fan LUT is programmed on probe and on each profile switch using
board-specific configurations for hamoa (16 entries) and glymur
(8 entries).

SoC Tj temperature reporting averages readings across the
thermal-sensors listed for the EC node and sends the result to the
EC every 125ms, paused during suspend. Glymur does not send this
temperature to the EC, since the EC on glymur is capable of obtaining
it itself.

EC command reads and writes are retried a bounded number of times
on NACK, since the EC NACKs the bus instead of clock-stretching
while busy.

---
Anvesh Jain P (8):
      dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add qcom,tsens
      platform: arm64: qcom-hamoa-ec: Add SoC junction temperature reporting
      platform: arm64: qcom-hamoa-ec: Switch fan profile based on power supply state
      platform: arm64: qcom-hamoa-ec: Add fan RPM query and LUT calibration
      platform: arm64: qcom-hamoa-ec: Verify required I2C adapter functionality
      platform: arm64: qcom-hamoa-ec: Retry I2C transfers on NACK
      arm64: dts: qcom: x1p42100-crd: Add qcom,tsens for EC fan thermal management
      arm64: dts: qcom: x1e80100-crd: Add qcom,tsens for EC fan thermal management

 .../embedded-controller/qcom,hamoa-crd-ec.yaml     |   31 +
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |    6 +
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |    6 +
 drivers/platform/arm64/qcom-hamoa-ec.c             | 1014 +++++++++++++++++++-
 4 files changed, 1020 insertions(+), 37 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260507-ec_add_more_commands-9a6513363375
prerequisite-message-id: <20260703-ec_support_for_purwa_evk-v2-0-c59aac5c6aac@oss.qualcomm.com>
prerequisite-patch-id: f5031e367e940109367f5fff1a679ea5ee453a8b
prerequisite-patch-id: 890ce0b8b86b3027b3bca383c85e9861398e6dc5

Best regards,
-- 
Anvesh Jain P <anvesh.p@oss.qualcomm.com>

