Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B1B3BF67A
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 06:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783317893; cv=none; b=bzngkIkbBgB7W2SsL0sUzpDA+TO/zBr0ZjUzIG4RqEVMHSvejhHJ2L3EJdA77ONfsWkPrcso9SE6hYQuXarGXBTJWjWUUkls+0AZr0/5VtwMG/HcvpKoZBkp3ASarBbjPipggcNG0/bmzKw/TjKQV4+oj7qHoCVTlN1S6bvoDis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783317893; c=relaxed/simple;
	bh=gGSQU4jSiiX4CxuX084+dPf9muR4QVsmsPL3s+XDlL4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DMg9KyswvGtdMPrG8ktsVfHU0M/v2C7Q0+iEeU/gzAvVEIyqvmvGljentBA1KfPQyPhBDoGI6j4BvLQdqR2gskBB6bTHoW/RgtJeeh4TESPqit0bpxaaZynhh1xRg7h9LYjZnVbJ/9IODKrktSa+C+dmzxQnaB0lEpYv8mCoq4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORhYOTG4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=crSG9yUc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORhYOTG4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="crSG9yUc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641nEv3614699
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 06:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XXZc4kMI0w9drHzHaT4ieS
	dTFNSAt7PNw/13BBp0mII=; b=ORhYOTG4dKntTjiM+4crhjKkOYiOe+AmhUs8rC
	t8X6ckH88avFKq4MhCfWdTDLg1AQPDar4b8FcrOgwDjyJsyqas8cTXI8DQo8rra8
	aYd4Gk+FLNCDsVGUDDZXxFbvCt3RICdICJorqM1pACM/defX/JMudQtTneC4mipe
	tLlsvB+1siAalg526Uc9lCi1S/CeaUlxhXr6zqBKCk+76EidyuiGWT0Yk8ZiOuTz
	78N+Pl8WgrS5TJbuz0h/39jPMYpq7zAq3ZNq9Gls1Z7JPRdYBUP1Ybg3ehB36la+
	uRwXqPqc9z4ea6v3P4xDxpHce+DH5idEU1rOHryfMaEn5eng==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvmp1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:04:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84622d6102dso3527674b3a.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 23:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783317890; x=1783922690; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XXZc4kMI0w9drHzHaT4ieSdTFNSAt7PNw/13BBp0mII=;
        b=crSG9yUc8qJxvXn85R3OpT9pYmP0zw3IyfeKZuMDRzyAOw0Gtqw2QDD9/6fMw5ABxC
         XJv0YIVzs7ODYQLjZRVHhkyFX05Dmz0k0WWSjFXhEtNE/FgQqmmAOHTbwHtyHNPnfsFN
         WLfSr+hrp3eor7OkkQLcmkXHVk3ajH7OqtUTUTFzWpqI6yvmvpOSCMjU5GvYQ5qIwTvi
         ulG0SO0FBUM/pRiYcrraoh8Q2k8vk9WrjapcgoxMvLANL7crgyq5waR8/RyFlPbN/62/
         cSxeQCGVLeCxhyjjfxlt5l8xvPFiFYKTx9r5od5Hquu47Lcu5pZY4mrDN+JdwfIRxVvk
         Tn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783317890; x=1783922690;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XXZc4kMI0w9drHzHaT4ieSdTFNSAt7PNw/13BBp0mII=;
        b=FjoXxim+LmOKhJ+FkxyARmuIIIjI6iz3PDpZdLTuXN9vimp3Sdx3SmYn1/GewqjFTY
         ue3Al9CCyxSzmYe/OfM30GY8AeZznmjGEKTjUETMygArKqCWgPHeD/ZHSwOHXcouNo4z
         DS/76mm/PwNQeTczCzp0bHeDQzBs6H/n79GEradPFynj4SBimr/CTahmYwdxAiU6nj9F
         PFKsmWLy/LmRTUoXuYRz2dp63ZuJ8+wWvqzwnAMInP1gkvvOkP1CftyUrcXQaTy/wuw4
         D131TNloxSA1d/gYUEBAls7RCrUNsyjYIWqtW83434Dkgo25y9ZvKTGjlmsmLvtnihig
         ohnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPSiVE1DXiXasbeWrgmrK+mh71tMtt4cc5UMBVrgWOpAqhe0y207+cDw1hApvnSGepxfILe/YlPBhd@vger.kernel.org
X-Gm-Message-State: AOJu0YzxKnHuiQJ/Vx24Q51YoIHKzVeLF5SvprJwpJTKOTnFAZsglcLk
	SMBzrfo6yKligp1ZvgsoHicfUpCLhf1Z9mu7AgIDXigAB1yxjtAyiUBFkEl6eOs9FVNrwFKTxW5
	vOTfZ2nVMQ0Q9gY2gbn516i9wgdFd6cR3rLJ/kVGtLZZPWP0KeCdGEgEclaiLLjuD
X-Gm-Gg: AfdE7clVjj93/6ZKez+8JDwk6gPOLi699cHQLF1rv1W7WYZLKeZ1JaQBaz7p6urp2+9
	jVyTqGsR78oVcgZ8kK/gxJk1VlzlNO6n7OZ82Z8hBkOHfrGH+ajwd6X1xFeX4ozSO3OioexlZ0b
	N5oiYD5twWfYIQ+lleW430/Ll1+sUiISUWf+YJbgWsMExWf6EaC6h11iHDyJc3KYvVui73iaGaN
	J2alHVo+PBF8OTRKrJL1jMX0jzFCXJwXbdogSR20HW6mdmmrHABAGvuTvLx9lP3IpBgVYJ/HJW0
	A9Tt5xDsH4dOY5QmZc+8CjkoG6HT64s8HAhg9Kqnp9U2fDpyx25l4WydQyWF+Im0aVVKe9qo9je
	7ZL2p80JJ1NvO9nNl4rkr3eTibvfG0s+U6XwNzw==
X-Received: by 2002:a05:6a00:3403:b0:847:9315:fb8b with SMTP id d2e1a72fcca58-847f6d593d5mr7880244b3a.6.1783317889799;
        Sun, 05 Jul 2026 23:04:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:3403:b0:847:9315:fb8b with SMTP id d2e1a72fcca58-847f6d593d5mr7880222b3a.6.1783317889299;
        Sun, 05 Jul 2026 23:04:49 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498dcsm3113266b3a.30.2026.07.05.23.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:04:48 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v2 0/4] arm64: qcom: dts: Add display support for Qualcomm
 Shikra
Date: Mon, 06 Jul 2026 11:34:40 +0530
Message-Id: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHlFS2oC/22NzQ6CMAyAX4X0bMk2+RFPvofhMFiVqTBdgWgI7
 +6AePPS5Eu/fp2AyVtiOEYTeBotW9cFULsI6kZ3V0JrAoMSKhOZypAbe/caTY/bnvFgpMorKlJ
 pUgh3T08X+16b53JjHqob1f0SWozGcu/8Z306ysX79fM//VGiwCQpdBKcfG/EyTHHr0E/ate2c
 RhQzvP8Bdo/OW3LAAAA
X-Change-ID: 20260626-shikra-dt-changes-8d127be951d5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783317885; l=2973;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=gGSQU4jSiiX4CxuX084+dPf9muR4QVsmsPL3s+XDlL4=;
 b=PIyj83IU2iaFSgxUheV/fdsiZQuLyg4fcG3g1hgl8cHVg604Za96wkZ1H140BA0i2ZzvAIXVf
 N8qrPRaN3LLAcqc6NUVwUU/CoWv3LaM+eOlWVCKNiwncfzCwd/08PfD
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b4582 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=VwQbUJbxAAAA:8
 a=EzW1FMLw5TrtRJQtR8UA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: eIWCIwY6RTdcVm10Un5b-McGJSQDFpny
X-Proofpoint-GUID: eIWCIwY6RTdcVm10Un5b-McGJSQDFpny
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA1OCBTYWx0ZWRfXyPYufG2viCY0
 Riwa5KJfRtkAI6gDpCzskclM33KsJpI+k86+K/ha6X3qXejk4JcEvNnYZ3hmBk/dFtn0xK3p7mx
 LLX8ca771Qc1Md5VZrlxr+2e5MoC/x1ZQacWt6WdXSf6Lw65DzBzUwGHIXJaDZyfleDZeeVFOsX
 IALPzxLa87Q5A0u8HR8EjDvNOHvcyAPxuY+OGnkonOFU0aRiJeank90YKPMfjJyqkAadLyYHm+H
 H9h1wMDRIwt3lYOUStS9QzjssZL5Ewda8XHgx0tZa+3UKc+tv6ZvT0DrQEsDkeImJQDcp1yFAIz
 OrBjFweyDT7k90RHdZDozlTyfq/clPNPOyF6pSXJzvEvXQHy+B30K4aNrfjN8YfwGv5eZi3gdnw
 bKkZmMrN1E3pZXD3O3sAlByTefjRWYG8gxuJ/m4XCY6e5UfOLzZ3KK4qGp//N4KBzOv/KgDeYid
 iWlHSpkYsb7KBmebgBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA1OCBTYWx0ZWRfX4ZYogimCH+Tq
 g69uIlKyhXKfx+EOETkweEU6trwITV2G/IGQgj4FOJRkKlvJyMX8M5JNY4y6qRRHpBjZNjzEU2c
 +apRrgeBuw1Ba8qOhvLLzujKhWZXprU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060058

This series adds display support for the Qualcomm Shikra platform.

It introduces the Qualcomm Shikra MDSS display subsystem support
at the SoC level, and enables display on the Qualcomm Shikra CQS
EVK and CQM EVK boards with the required DSI panel nodes.

---
Changes in v2:
- Replace QCM2290-specific RPM power domain identifiers with generic
  RPMPD_VDDCX/VDDMX macros in Shikra display and DSI nodes.
- Add missing blank line before status = "okay" in &mdss_dsi0 node(Dmitry).
- Split avdd-supply and avee-supply into separate regulators vreg_disp_p
  and vreg_disp_n instead of sharing the same lcd_bias regulator(Dmitry).
- Sort tlmm pin state entries by pin number: gpio3, gpio86, gpio91,
  gpio151 (Dmitry).
- Add vph_pwr as an always-on fixed regulator representing the main
  board power supply, used as vin-supply for lcd_bias.
- Droped the 5th patch "Shikra LT9611UXD support". NAK by Dmitry. Once
  the hdmi-dsi driver is fixed then we will post DT changes.
- Link to v1: https://patch.msgid.link/20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com

prerequisite-message-id: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
prerequisite-message-id: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
prerequisite-message-id: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
prerequisite-message-id: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
prerequisite-message-id: <20260618-ili7807s-v2-0-b3f0c109b102@oss.qualcomm.com>
prerequisite-message-id: <20260508134009.4582-1-syyang@lontium.com>
prerequisite-message-id: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: arpit.saini@oss.qualcomm.com

---
Arpit Saini (3):
      arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
      arm64: defconfig: Enable ILI7807S DSI panel driver
      arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel

Nabige Aala (1):
      arm64: dts: qcom: shikra: Add MDSS display subsystem

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 126 +++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 126 +++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 203 +++++++++++++++++++++++++++-
 arch/arm64/configs/defconfig                |   1 +
 4 files changed, 454 insertions(+), 2 deletions(-)
---
base-commit: f28fb4ff0d25819c58341fec6e3953f1ebb1fc2e
change-id: 20260626-shikra-dt-changes-8d127be951d5

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

