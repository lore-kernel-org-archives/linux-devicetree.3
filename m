Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592557;
	b=YCZHCBaY6j23lwX0bZ/G6/aQ9QA9TOd5natf5beu6zKyc/2YfsqigrMV3Zaj0cVHq6AJ
	 ERV1KwxpgnBVzQ+aKTXXYacZ4eW3BJIPT3bYdVNiRzzsJslisYDPWidk6fxKO09T/ipsb
	 w5tckY3yv7PmbSDzQks115AfAk1uye7Xnn27G5RdGZcDqqjTxVXNhEXEOoo9+zn4bUviz
	 a+3vLYJZQCEuuEJdhU1MtPOqO1MlfiZ4NvqtWLizhkCgXHoAEd3SNTlrSDwtLB0JBMidg
	 LqKbI2jCBPvVj3+jOV1vnuSgFk5TsLS+5cD2k3Azy/Ndr/Cy+3CPbAEu1439X947alg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592557;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tz3RdhSVH1Ni4eMu8/LNoemJF3J53nH7aepJzhWYinc=;
	b=1S6PByngE/I0x6wD5dEkCabbm0iPOY+UZub8Ok1veO2t6miLb5ZsPHVD+/2nEUe38ih/
	 kEFqr15NyOMsNOw1V5221Hql9RbBURZ3YcP/wkbBJHNSNQOhBYTn8IO4Zn3V33jaKpFVo
	 8DFzNEtRW512NxzEzTixVLnaepx0+wzNBOZqX9FUslB0vgtiZ4BJuf50hn+3RGGrK0MvA
	 n+bNW2PepGuEhMSe6kLbM5BQ2nopAE8NGoTVxP70m+ur1yxDcHjnIswfgZGEWQqlDFYXC
	 zdo+zQ8xOsRq+J42mJMSnjSsTq0BsiCTuucjiARHlEO8tPJShwQIhuUmU0c1Bo5AduA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lSUC5IQ2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TAT0eLZG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51580606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51580606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lSUC5IQ2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TAT0eLZG
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFIas3993065
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tz3RdhSVH1Ni4eMu8/LNoemJF3J53nH7aepJzhWYinc=; b=lSUC5IQ2YWyvtHIT
	YVR47W/kO13pl5c7HMug+QaPEmjZPBsqjoO7eEl7mq+QBdURRHpGljlE6ShDKSGE
	HPqnjJ/4qSZwFO8f+JR9eSYG2bPPjSMfrUXLVEWlw8nWfgu1nzFZ2i5H3bsFXFzd
	AlA4MEKQg/dUuR3dQEOS/GfKtyG4hTFpMK5588sJtPgHa1Hb7D+h1SVgmcE+e58F
	RU7xQ9AEtSEcL/0ityWBSOR6v2m7nJhqFnd4zgZpw3U2U5efOjaXp7R7wSRUsLk2
	BphhloqLznPNTx0DvdsUv7H5Fk81J9r4oUBusNPEXnWMCxuk2R5NSmcWrgDYgE2+
	9fhXXw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q88mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35fb6be0fcfso127031eec.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592554; x=1793197354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tz3RdhSVH1Ni4eMu8/LNoemJF3J53nH7aepJzhWYinc=;
        b=TAT0eLZGkQ2RwPGkJQ+1l9kZumshirhykHQ3CWhHZ9jSYYpAuRR8KzfLvHeInq/uqI
         AQWKclLNbQAd174f6HorjCBZIBznhD+iQXzk1kvgNwDuVw/R3tPmG26nZsV537oWvYgR
         TJl+WnBl+iuZlNXc6Qb3OlIZGOk9JxFCx4ZPAfgn6NQCEPICqHDlDJYWcrbc8QfYIbdz
         Zdw/K3qLbVv5PSEn1ON8KtDiblvBIi23iOd8SDmRXiO1jawY86kZTZ9o3C8rCnAu3V6B
         S9bZjlJBdrUpVeuuYlpYSXskhiZs4GKyTH+5lBXbI3tIGzUYbZJeZojh0hEnNV0AVGhg
         1QTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592554; x=1793197354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tz3RdhSVH1Ni4eMu8/LNoemJF3J53nH7aepJzhWYinc=;
        b=QedQKLub+P5mS8MbcsVgMqBlOJd4XySk5YxBKEpuSLxV/tKAgq9S034brs9UatVrQc
         RzqR3CjObtJKRfPTy784kMEA2al1UdE70CoYAyMLJ9rOrLnCCeHxMTHlTylr+diSSzp0
         n3X27ZzMW2m8oNww/zDMjid2cSEXAxerh7BUQjni9YfaevzLvQopCVgoC2qo08QL3FQ1
         grJ/V0fKIXYLywO3vfkYvFLrmv/Hqxw+OOz31aI2uLkZ7ITpRs+JMaf1p6jXGjbuGqC/
         FHDwCUBK2s+7Dsr4Pi33wU5YOZbaosOwYVT0UMBIPzz/V4I7/moJm7Ycpzns/njC505h
         PuhA==
X-Forwarded-Encrypted: i=1; AKwUvByODB3Up1wmMSNZ9G65dG1TO3NQKtBUdzvPo4ejizimxEVxxU8JPFRXmjjYbSvdL+bth8TZC9ZAOWhi@vger.kernel.org
X-Gm-Message-State: AFq9FYK61ihM9/mWLyPK6nXTyvg4s31f+KNsXIe+Nys63Yth6CAEt5UT
	ISiUxGmEXZIQjvWy/chyXjHw8OjeuhPgdzKzh7FOmJ3aJE20dQnsiuMIM0m6vbZDPpySWzZylMM
	5y+ksTfBW9iKEQNQW7L99I42Jy48y67+QbQ7KIQeC5tpJnS2xM+SxbStqHOlpKQH9
X-Gm-Gg: AYBFou26G5j55RR99DKDQk8VaNkho1xzur6XnalKChFi+QnR3H9nwvApzhRdtX3MCiI
	Ry7them+kf08vz9bOz1auEpUMQOMeEGHiIIM7xnq7dKuR6booH0cKprGLK2D7rdXyjMfG6X2aJS
	CFi84uJtKWHJ/lh6FDmgCFRapFpoFRODGCX7CZywsJVQLZ5qpbaroF+yk29u7uxTaeTGkU/tUUR
	N4B72YJj2kcId8H/6/AWh/XZ9E1V5o0JRLkECR/sTgb1B8sUVdDsEnr+xtIfYMEJkQER6O+akvy
	PnyPj4xr4jesbtpdd+wMS3YwvwkK70ZOn6hW+Ix3gayEo6GSUWnrP97svtiUmQkqq3IofmfnA5H
	YgIHXPMZKg0ltVE6KnDBHvxBIUdZfrRf/8AOXXqzQxcdcGTyAUdpQOPLudkAAuDpQnk1lrjvHds
	c5YcUA1bhRMMQO4rjkWcASiZlwVd5da/eJGMpJT8PiKVQMh6dNfQo=
X-Received: by 2002:a05:7301:6192:20b0:33e:6714:3945 with SMTP id 5a478bee46e88-3674c43a7dfmr5185395eec.2.1792592554364;
        Wed, 21 Oct 2026 07:22:34 -0700 (PDT)
X-Received: by 2002:a05:7301:6192:20b0:33e:6714:3945 with SMTP id 5a478bee46e88-3674c43a7dfmr5185334eec.2.1792592553669;
        Wed, 21 Oct 2026 07:22:33 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:32 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Wed, 21 Oct 2026 19:51:46 +0530
Subject: [PATCH 3/7] arm64: dts: qcom: shikra-iqs-evk: Add AUO G133HAN01
 LVDS panel overlay
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
Message-Id: <20261021-shikra_display_overlays-v1-3-adaea735999f@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=4686;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=3QYmG8M/g7dpE66TWx0XSm8iu75RDCnzid41xacPU4s=;
 b=H3V/NOZ0N8Lj6BAB5JnGYIlkC5Wu4KDFgF744Z5TfTNoS0XYZi1tgn35KnMw8WlLb/uzo8h+8
 t331C5SfVmTC6r6LFlKRWf11kUNa2U6heea1agf6eDC40U7nacEqGz3
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX/fhYxKxn9vsv
 m7LKQNNzEQ1RMYr/Z1cTbIpEO/ZbrpGysOh2ujGya68F0PBer2JbVrGDwbGfolpNLaA58OWUBzD
 uIksjr6F/Spxglbj9S0fRhrMInv6sZA=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8caac cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZKKiMLYMdhZ7-3cI3QcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 4Vd0c_kuonPdR3Hm8RAo-_tBdCznKr3n
X-Proofpoint-ORIG-GUID: 4Vd0c_kuonPdR3Hm8RAo-_tBdCznKr3n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXwz3YFnHv49aL
 FNBIvss7HAZLQNR8nQg9uFGCRFBV35tYx8A3NuYd2oSrbsIMPurF4+JvaS2v1N/8vBBiYEUboR8
 hhPVOzSZ0dWCsAK87eaG+VbCRXFhfAHfdS7yMylFiZRaN9LaBcssZN6WoYliHoQAsoLfhEWZX7l
 MZFAszfymgyyRAKdht1E/3hz0CrNvshiwah8AHAeM4wkvr2kGGKOJvll2r3ze5pbddPTdYOg0b7
 mGpUwAV+hS7YlYhoTMS6L563SvCaQmX4qoK3msHYGWRvdPEbMz7wa6vdpFF3cwA/9ibb3Emxg4I
 LIC6hCH9aC/mSZHEHD+bLEvV98u2atyp5mdJnTU2IJtoP644xSAdef5U9YuSXcvwYbNimXeGnpc
 vWQQliSPXnK1uXS3mw8lV4XmwcgPxh/QccKLhDHkCN4emXJTZ/s5F3gFU7c+NItIYamyLBpTMie
 4YtG9yrMDY3EhDcvy4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210057

From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>

Add a DT overlay for IQS, to enable LVDS interface when LVDS daughter card
is connected to PDISP1 DSI0 on carrier card.
There is SN65DSI84 DSI-to-LVDS bridge on the daughter card which is
connected through I2C3 with reset and interrupt connected to tlmm GPIO76
and GPIO85.
Backlight is connected to gpio87 with pdm_pwm functionality. Currently this
is not supported in linux-next yet, so pull the gpio high.
Enable support for AUO G133HAN01 LVDS panel connected to this daughter card
and disable the default HDMI bridge and connector in favour of the LVDS
panel.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso    | 127 +++++++++++++++++++++
 2 files changed, 129 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0c5a7b7f694b..610fe640471b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -381,10 +381,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 shikra-cqm-evk-hdmi-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-iqs-evk-dlc-panel-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-dlc-panel.dtbo
+shikra-iqs-evk-lvds-auo,g133han01-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-lvds-auo,g133han01.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-dlc-panel.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-lvds-auo,g133han01.dtb
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso
new file mode 100644
index 000000000000..80b9dcc92061
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight {
+		compatible = "gpio-backlight";
+		gpios = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
+		default-on;
+		pinctrl-0 = <&backlight_pwm>;
+		pinctrl-names = "default";
+	};
+
+	panel-lvds {
+		compatible = "auo,g133han01";
+		power-supply = <&vreg_lvds_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				lvds_panel_out_a: endpoint {
+					remote-endpoint = <&sn65dsi84_out_a>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				lvds_panel_out_b: endpoint {
+					remote-endpoint = <&sn65dsi84_out_b>;
+				};
+			};
+		};
+	};
+
+	vreg_bridge_1p8: regulator-bridge-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_bridge_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vreg_lvds_3p3: regulator-lvds-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_lvds_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&tlmm 76 GPIO_ACTIVE_HIGH>;
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&vreg_bridge_1p8>;
+		pinctrl-0 = <&bridge_irq_pin &bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sn65dsi84_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				sn65dsi84_out_a: endpoint {
+					remote-endpoint = <&lvds_panel_out_a>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				sn65dsi84_out_b: endpoint {
+					remote-endpoint = <&lvds_panel_out_b>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+};
+
+&tlmm {
+	backlight_pwm: backlight-pwm-state {
+		pins = "gpio87";
+		function = "gpio";
+		bias-pull-up;
+	};
+};

-- 
2.34.1

