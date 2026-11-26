Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679461;
	b=D1YZJmA6Z9O/2+bbrAKxImZg8sYfp6z9HqrnkbxUtkOEU/JJF8Yv9l3zl4Vi4LJArvgk
	 6Ilyha2DEoMaSezueCYNpLjY6e5P1S7PDHBH8oq4Dq/q2Lr7popZmFxsWhZ7CI6ahKXMP
	 5RSUiFut6lbkaj5mi98D2jtrjbfyTOmNb0HQVriKsqHGJiUsmI8YJvlpQaZmLTZhWBmOz
	 cpAl5tKTjHtICZ+BD0MVg/9arl93Nl2VfyTouoAhJkVehJ10yzxNCQT61vNgPeW9Ibwj+
	 QD8dtTtpzZalRgbNoc3RQtZyBhYgcWuJUEN3i+AZaIANX8pkvEPfWjArgO5WdS+h2GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679461;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NGgWXEGTwjIgzm24Rh2KPILvMJuJIo9kKnLaP6KeDb0=;
	b=S5bfzqfM6cKaVbOzjShfTYhQJEEADms6WAk/JdiQGJyGPcPQcXMuqqMyNEYb6eWBwsmu
	 OvCKEElZ9uu54vg7dZ6eJOoHHDp3O24c4/Mbg5+O486Smp0HC83FlSzU8vES9IyuXcMa7
	 LKLrqtlApIfHWcRZyipEg3GxcSLNybPi2of2y4VE5i6uFdvU73hjXxnmOdK9gKa97llGV
	 fvylIktQr/vEeU/hwwITCjkaiqhSGDNqu4dknTMlApjb2xwHkdYR6a0LNjVwSKjd3hNW6
	 oipI4uGPuiNt1eNaKQn6UVZJi4GroUwlkQfj/iD3Qi1IEcw1EcI/37qRnQtJQzouAvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DnNHhkmw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451B6606A688;
	Thu, 26 Nov 2026 07:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 451B6606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DnNHhkmw
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7ArVg2885415;
	Thu, 26 Nov 2026 07:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NGgWXEGTwjIgzm24Rh2KPI
	LvMJuJIo9kKnLaP6KeDb0=; b=DnNHhkmwNe1l6yH6sHv2DkLk9esh/0iQV4+xyd
	9gDu9/MJc14amoysdKf08VJrnCU77nx1MNrVP8oLwv3I5EPRBTthPnLrJLEZWQWS
	e83K9i3/PW/WytihcHHdkT8qHINVPE/P0UyGFJuZZ0dRv8J5HH2jG0Gh+2Tcmxyk
	gf8ngEcZ+sLQqZOC6tlM1JWMz11zC4lDrKXXZA6qh2Q+33lbcU9s2vuilbO9wbbe
	0qU8R3TyEBDplGI3LQZw2K4AVSRIjUxvGIEHXqaQUzYLqXjlQgB9d0bJUQ0uC4IZ
	QQwK0qs+Br5klzwxAFjDt7tiS1TrY7oFPL8KSazkVS6nu9jQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rgbjh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 07:50:45 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7ohD53793278;
	Thu, 26 Nov 2026 07:50:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AQ7ogCh3793262
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 07:50:43 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id CDB19A6F; Thu, 26 Nov 2026 13:20:41 +0530 (+0530)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: [PATCH v2 0/7] arm64: dts: qcom: lemans-draco-evk: Add display
 panel overlays
Date: Thu, 26 Nov 2026 13:20:33 +0530
Message-Id: <20261126-draco-evk-display-v2-0-95395c5ee387@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMrkB2sC/22QSW7DMAxFr2JoXQaWPMlGUfQeRRaSTCdqPEW0h
 QaB71552CUbAp8g/yP/kxE6i8Sq6Mkcekt26IMQHxEzV9VfEGwdNBOxyDnnMdROmQHQ36C2NLb
 qAYmqheZ5npoUWdgbHTb2b/P8Oe+aZv2LZlqNjgmH9znApn2MdUikNlgVfe4skUCLnerpQDa2V
 y3sRxFoZ/vLPIJPIdykG8MzU8dSJt8D0ek+q9YMXXcK5WslvvrHgkM7lQFkwBfguQxGaVlIXaa
 yzBv+3kgrQlg7dqqiOsVCFFlS8Eyz9dWrpWlwjy1Nz7fPjuCSN8F5HpBCKl6aXKGSxQuSnZdl+
 Qcd9QgepAEAAA==
X-Change-ID: 20261110-draco-evk-display-3ad2b1664c4e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795679441; l=4332;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=/3tcgf+9W97iu2aWIxUNoZAaLYlnMlJN1Ebl7rDWol4=;
 b=FsdUml5+1kiH95FhGqHKgpAwmlVIMtymPXWa8/Zn2KP2osMW76R/TnXZIKmJOwlKh7uxUnbMV
 Dp32ixaR9fLBAX53Moq7iGtbpFAZ0RQoQDhdaMAPC0SMPh48LmADEOo
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMCBTYWx0ZWRfX/OfaGU7sP3E+
 eeZjG7LiO+busK/cRa98XEwRfvy9fViULhLH+8NfaNOwGWvW7BrP9xXYmi3xbyJgMvUjN4ooFh1
 XDEhzzZWB1lLS7vsSNBMRJG1RpOpsRflvt5+qjmF5XAUw+q0bjBaEph8FNgpVY78khlrygdxc3i
 Y8iXStfsODf9NAm82znu1fyo6h4iYEfhlPuF+3zd3HZ1T/nxTiNlZPMSxcwVoMwFq1CjmIHcjvD
 oL923aTbLarJlenGD929SXP90gcpkiUjo5UGOHDsd7JZnBhtS3Wu/g3kt6R3VkQbJ+oKg4HsEDX
 R01ssoimeRTVYtF1FxOUerw1Wgoro/9N8Ll0/kDRYML0fvf6k/RmqNbkdcjFkG3e39SnllFpdx6
 QB4gKjNgZzpg64dBZ6/Kf4Zf6U5+cjsG1Qs0hCdpMklaZjOgJDTJTwfOf33tV8ckg5qLOENHsCd
 b0+hrY/WwIzHzxumkMg==
X-Proofpoint-GUID: 9mTEuhoMQvMsCqVO6rX8UeCUGwdOdOJ8
X-Proofpoint-ORIG-GUID: 9mTEuhoMQvMsCqVO6rX8UeCUGwdOdOJ8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMCBTYWx0ZWRfX/YOCEkZY+XpK
 tboNXAb8PPrVZB3PjttlZ4tYlnfjzj0G2fCjp8w11wrB/CHZ72DTAFf17O9ZZZLQTxUIanVQS8I
 G7KUMSmC2yw1N+jBnORDVa7bUO3U6Kc=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b07e4d5 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XtEAIIO-7vcKqsFKLG8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260030

The Qualcomm SA8775P/QCS9100 (LeMans) SoC card is mounted on the
Draco EVK carrier card. The DSI0 interface from the SoC card is
routed to either the 22-pin DSI connector on the carrier card named
JDISP1 DSI0 or to the DSI0_B2B connector, through a MUX which can
be selected by a hardware DIP switch. There are multiple daughter
cards designed that can be connected to this B2B connector.

The below B2B display interface is enabled by default in the base DTB:
  - DSI-to-HDMI using the LT9611UXD daughter card

The following overlay DTs are added for additional display
configurations:
  - lemans-draco-evk-dlc0697-dsi: DLC DLC0697 DSI panel with DLC
    daughter card
  - lemans-draco-evk-raspberrypi-dsi-7inch: Raspberry Pi 7-inch DSI
    panel with touch via the 22-pin DSI connector
  - lemans-draco-evk-waveshare-dsi-8inch: Waveshare 8-inch DSI panel
    with touch via the 22-pin DSI connector
  - lemans-draco-evk-lvds-auo,g133han01: AUO G133HAN01 LVDS panel
    with LVDS daughter card

These overlays are applied on top of the lemans-draco-evk base DTB.

Changes in v2:
- Add #address-cells = <1>; #size-cells = <0>; to &i2c4 fragment
  in the AUO G133HAN01 LVDS overlay to fix reg_format dtb-check
  failure (Krzysztof Kozlowski)
- Use full board name "Qualcomm Technologies, Inc. Lemans Draco EVK"
  and reference overlay by filename in defconfig commit message
   (Krzysztof Kozlowski)
- Expand DLC0697 commit message to describe power supplies
  (avdd/avee from vreg_bridge_3p3, vddi from vreg_s4a), GPIO
  backlight (expander2 GPIO2), reset GPIO (pmm8654au_1_gpios GPIO4),
  and TE pin (gpio84)
- Link to v1: https://lore.kernel.org/all/20261113-draco-evk-display-v1-0-28a19c6aea87@oss.qualcomm.com/

Anand Tiwari (1):
      arm64: dts: qcom: lemans-draco-evk: Add AUO G133HAN01 LVDS panel overlay

Mohit Dsor (3):
      arm64: dts: qcom: lemans-draco-evk: Add LT9611UXD HDMI bridge support
      arm64: dts: qcom: lemans-draco-evk: Add hdmi-dual-dsi overlay
      arm64: defconfig: Enable PCA9685 PWM controller

Vishnu Saini (3):
      arm64: dts: qcom: lemans-draco-evk: Add DLC DLC0697 DSI panel overlay
      arm64: dts: qcom: lemans-draco-evk: Add RPi 7-inch DSI panel overlay
      arm64: dts: qcom: lemans-draco-evk: Add Waveshare 8-inch DSI panel overlay

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
Anand Tiwari (1):
      arm64: dts: qcom: lemans-draco-evk: Add AUO G133HAN01 LVDS panel overlay

Mohit Dsor (3):
      arm64: dts: qcom: lemans-draco-evk: Add LT9611UXD HDMI bridge support
      arm64: dts: qcom: lemans-draco-evk: Add hdmi-dual-dsi overlay
      arm64: defconfig: Enable PCA9685 PWM controller

Vishnu Saini (3):
      arm64: dts: qcom: lemans-draco-evk: Add DLC DLC0697 DSI panel overlay
      arm64: dts: qcom: lemans-draco-evk: Add RPi 7-inch DSI panel overlay
      arm64: dts: qcom: lemans-draco-evk: Add Waveshare 8-inch DSI panel overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  20 ++++
 .../dts/qcom/lemans-draco-evk-dlc0697-dsi.dtso     |  81 +++++++++++++
 .../dts/qcom/lemans-draco-evk-hdmi-dual-dsi.dtso   |  38 ++++++
 .../qcom/lemans-draco-evk-lvds-auo,g133han01.dtso  | 133 +++++++++++++++++++++
 .../lemans-draco-evk-raspberrypi-dsi-7inch.dtso    |  98 +++++++++++++++
 .../qcom/lemans-draco-evk-waveshare-dsi-8inch.dtso |  94 +++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts      | 119 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi     |   5 +
 arch/arm64/configs/defconfig                       |   1 +
 9 files changed, 589 insertions(+)
---
base-commit: d4e72753715bc741a78c4f7e8cf4f182f14f96c0
change-id: 20261110-draco-evk-display-3ad2b1664c4e
prerequisite-message-id: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
prerequisite-patch-id: 9abb39ca0584a3ce35b860674c31456fd509ac2d
prerequisite-patch-id: ad7e63dd9462d71212a2a5c0e0b7a05253a21084
prerequisite-patch-id: 33617f32c25ccc12796dee76077808715eb6f3a0
prerequisite-message-id: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
prerequisite-patch-id: 21cfbbfd71515961501a768edad476740336c13c

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>

