Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592571;
	b=YWs/9zI8fcnXL5Sk+B/7RHXiiLogodFCxRmcM/QMxkHW1hLvJSzMGcFx94RBAxEPIMyr
	 +mDzH2AjAIFjc/uQTaKXtqTytjqLZkbbivyIFdcZ+5Q6+pemtuny9oSmYGAGu7IKM4KvL
	 Wyhes78wA44KeGvKz96rqJ9/Zk/ASpwJ2KHfUK12qldn/nQnhx2KRYBY6HkRm7DAsXr08
	 3NNnTcaqn84esCDQRe08/lPs3QlPD+b1zBwjvOiEqvB7mWBJ3nPhQRIVg/cijjHWK+5H4
	 N8wORVrdxAuTJyRxeBuLDY7naeP3u+pRVc7E0ybZF7Ms/tpfQLqQcJ4vm6tgrPsyvBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592571;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HyMSVKtr9EdhNtGJmdy/pJkUsP+zzVnpGR0dFTR6NX0=;
	b=RZs2vyliEtiuzM70oUX+A/rUdSjqQ2sYPwPiuNS6bYazmruNg6bN7OfNtc/sofdtfmhM
	 Eg8szcytkFYJOJjuZAZpNadMN0baYKDnckHYbjKxhc6+bG3ne932GRtrJXX4SPpQ+hfp5
	 imtICIrvMKUqagZOsltx8yMGRqRx6BsutqHj9QwzpGbgzHDH/F/s/M+NPgcSUm+93hbyQ
	 WH6+DWMZ7xivvbHpZ35UBoKR3pZ3v8NdPMOTVpT9/0ODJ0V47HWUImN02YJ5UTYu3DQKY
	 A652KfNQsoDCnzAFhSGACU5zJUkox/0pGXiidxi9A7Mi1uI3oFwxzvB7JWAaPO1sXmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UcxVNumr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WAwM/NVl";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BA6606A333
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0BA6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UcxVNumr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WAwM/NVl
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEGiYo3997240
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HyMSVKtr9EdhNtGJmdy/pJkUsP+zzVnpGR0dFTR6NX0=; b=UcxVNumrX63VcLiC
	v4I6Gdy54rqPExcF/+P2rr40vXKgHoHwH+xmr1n/2jHcXwfTSCi+Um7TxqgEo0Yl
	qtV3RP00iXn8xvph2GkaeDh3jvmbwfbl4p0ntJZZumQi5modkAwWAFEFF0sNjoT6
	zxyUvVCisUMCRAlW4ReFtKPI6Ked/vwDIFS2oesQFO0VCBHJgZ9ctjsKHceKixkJ
	k7bwAWgV9bmyoMmJrI39Rn1SNY+jOYUckRiH47vn5ns2g7UWWJTEwxB3lWB4tPhd
	HZq88JpxhBhJmnfeELD1NmfYbkjU+E9Zfrs03VWvT0684WB5Ozy+MDyxjlKhHkNJ
	Yziudg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q88ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34edae32c04so130547eec.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592568; x=1793197368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HyMSVKtr9EdhNtGJmdy/pJkUsP+zzVnpGR0dFTR6NX0=;
        b=WAwM/NVlGmKTi6WNdMLAl+GV3IqeoGl7JtFD41RP2T4fBSuWk89kmnM3fIic0TUNam
         Qfv/iFp9/kPBXn+EON9altFzZDMxwFMrSxDVR4HbiENTRrLbLejG/G8UcyNkjocuL73D
         yN+OIS7xR2odcZyHNUZdUUACgxagRCOaB90xiQzXqOK7Y4IYvFicxddy/blvwaZW+v6s
         kl7TR9KAmNHYupdzxRdB1060y07TAnWoQrIZRa6VK+S0IMvVPKWifN6UeP6MGPLrPUso
         4FYS+Adu56MrmgFBvbbS5cilJD61dRgj49hDe8H0FGlIMDshP3SWYIybnIeCffn/fNyo
         nLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592568; x=1793197368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HyMSVKtr9EdhNtGJmdy/pJkUsP+zzVnpGR0dFTR6NX0=;
        b=kqkMqJ6MZeZWj/eAF9hEzb7N/eMAC5wcYAb37T/RAiG6djcKYyjPKudhw6MgfqX1lX
         5kcqQYQfmcOJL1mRLqmQp82H0TO2mei5p79QsHt/2QoakQi6Wb5qoJoS1Sd/bykhhyTV
         TZgTuyEYWqU3OOU/jCARc51kQaZrMznIlw6ZnRXNEK2Vi/OzLGRMINH4VIgoluMUjZqD
         gDxxLw0pH/AyvVEPPbenZVfPcs3EZ+lDpKeukLUin3fZh6WAqP9VrdFHFGYCcRBsiDQC
         PBfC99+Q5f4UhA8dFmQM+LUqKN4pAbDOcbPxJ+Z2CndUWQHZX3H4XQexw2sa+G7wVfkN
         EuFw==
X-Forwarded-Encrypted: i=1; AKwUvBzFJkQcv3NhxSthabGs4T0tbpK3oVgpJdU3x7igraiEtJV0t7ntkKSr+55iu13vMeYheLO1KUfCYMys@vger.kernel.org
X-Gm-Message-State: AFq9FYLq3rco6B04xjDLo6jc1OmlXcMQqYPmcXhY2CW1DXWLNWN8djX/
	71mhgav5cEtS089R7PEuLbKW7F1rsoR7+kSpMkisPdOJA9J+mmhB2HlEm2lc9uP9cMHxFz3t4ay
	Kt+y9+W3F2Ej2AOi8sZ7+gwIwHRyX61FWDzOE0sGqAnm815YJ4fvLFvxMVshuhSOE
X-Gm-Gg: AYBFou3SGKFLtcRlN58Vg5K7KW3Jd8aw9b+ymfWnE/r1+Q3Qta5uQq7eE5BHG25iAoV
	6lOh3YiH+PT81prKoHAow/D8npa5/4d62CnC56Zo02WJg0CT3pVY1leyaqynvSnYnSE5qYN/RiQ
	uBGNqFmac1/lqTswBS3SzK1Ktnq7eroLG/e1wFSvUmSHko69UMfLOCcYp4hwqpCHib6+N+dwWme
	RsQgp/xQbdFniKwTWzev8yK0phSZwhrk9x8dWd4k2ftC/cOfgG3qe3QuuGRRHy/BRVynvNPuY3/
	mUKtLAm4vH3Q49EHA42HRRtywrZAnXy2e3MYja/xloQMJif5Gm+vIZRafRmB341nTuSt74VjHpO
	ipgehGEysKIlzFasjZ1sQ36zC/01s5YAQk6YBDrpufi56tIAP1g8CeAG2H7KA5xHlV8PCKpyggf
	M1xVmR0QmwGDAj4S5ElYub4JJzgmcfc8vmHtdXAmHzXoJGpQlvyLQ=
X-Received: by 2002:a05:7022:f519:b0:14b:edb2:c3bc with SMTP id a92af1059eb24-1909acc857bmr3804217c88.0.1792592567601;
        Wed, 21 Oct 2026 07:22:47 -0700 (PDT)
X-Received: by 2002:a05:7022:f519:b0:14b:edb2:c3bc with SMTP id a92af1059eb24-1909acc857bmr3804095c88.0.1792592566027;
        Wed, 21 Oct 2026 07:22:46 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:45 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Wed, 21 Oct 2026 19:51:48 +0530
Subject: [PATCH 5/7] arm64: dts: qcom: shikra-iqs-evk: Add RPi 7-inch DSI
 panel overlay
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
Message-Id: <20261021-shikra_display_overlays-v1-5-adaea735999f@oss.qualcomm.com>
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
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=4163;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=TpPaO2PqcD2nRBXi9HeZ1MgR6queUrnw4CleGf0Oa4U=;
 b=JCHF6IH0fOz/TzfRiTH479RpPk3hAQvJpaGk73C28IV6VwzvYMD4F0iGzghoRuJXrKX5SzHw1
 jCCG6ER6/eGA+iCgoLOSeE2JMpWHXtx/gDR8leyCFeMSnru8v8KLzbJ
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX2a2yQa+oD5Hk
 Gcys66M+ZGZmzVAPzQKEyU6voIR9ImxTr2w7hLN4UoC8IkLb3jPRRO28Wv63F6KqToEGVNi5jiw
 L9H0SFqYi5kkOA9cBeTuKr2TIowCXII=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8cab9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5MclNqnbmWmJdBvsS10A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: CjHak6bemq6BSLEbY9YpsulsD8eKzP5T
X-Proofpoint-ORIG-GUID: CjHak6bemq6BSLEbY9YpsulsD8eKzP5T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX0xEeSx7SaH2H
 JMXrvcakVWBag0gjgj0HsEphO82zRMsdyfc/pgiErZxTHof49fDKh7yiIwdkYGKxGefU0NXDUDc
 whiSQeRe+ywxdxvw9suB/YYQ8dJvOHf7P4+ZBNwcG/XlYipRe9czM7Y3RJP8Agx2XV7BqA0Y5SR
 PNqxQF/Qb8Sw3nN+Y7JYowuh0YJca+JvrIB0zU4ogARCxqkh7ZKLRoqE3SpkdkhKYTwt+YdeKyw
 tlD5NlxkWkuCBl0G5V/+/BkB13SwnNaRlJkxPMzX8a5HaGc3KI7iugRfvLrWno0UjQy2/7hX9bz
 NK9+3tDP87T7zZcqX3m8bTigaFb/X0u6mMMZhzbjvlma9dTRhHeu3pIYCk8ffv6a5diD94FKKvG
 St5qKOZNYZBhRYECi7ULWYodeoi/G+B+ch7yZQ5Om0kroeLMtAnWc8Wo5itjfXZxDNMvtpHYHqO
 H5YxaC+nah8YgxC/u/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210057

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay to enable Raspberry Pi 7-inch DSI panel connected to DSI
22pin on the carrier card.
DSI0 from SOC is routed through MUX which can be selected by DIP switch
S1016.5 ON for enabling this 22-pin JDISP1 DSI0 connector.

Add the regulator and backlight controller at I2C4 address 0x45,
Goodix GT911 touch controller, panel power and reset control, and a
2-lane DSI connection.

Disable the default HDMI bridge and connector in favour of the RPi
DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso | 91 ++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 610fe640471b..6d64e7ce197e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -382,11 +382,13 @@ shikra-cqm-evk-hdmi-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-iqs-evk-dlc-panel-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-dlc-panel.dtbo
 shikra-iqs-evk-lvds-auo,g133han01-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-lvds-auo,g133han01.dtbo
+shikra-iqs-evk-raspberrypi-dsi-7inch-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-raspberrypi-dsi-7inch.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-dlc-panel.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-lvds-auo,g133han01.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-raspberrypi-dsi-7inch.dtb
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..383dc5aadcfd
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	model = "Qualcomm Technologies, Inc. Shikra IQS EVK Raspberry Pi 7inch DSI Panel";
+
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_display>;
+		pwms = <&mcu 0 255 0>;
+	};
+
+	reg_display: regulator-display {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-display";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_dsi_touch: regulator-dsi-touch {
+		compatible = "regulator-fixed";
+		gpio = <&mcu 1 GPIO_ACTIVE_HIGH>;
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <50000>;
+		enable-active-high;
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
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	mcu: gpio@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		AVDD28-supply = <&reg_dsi_touch>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+		reg = <0>;
+		reset-gpios = <&mcu 0 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_display>;
+		iovcc-supply = <&pm8150_s4>;
+		backlight = <&display_bl>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&panel_in>;
+};

-- 
2.34.1

