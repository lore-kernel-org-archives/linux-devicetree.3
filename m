Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592551;
	b=Gs6rN7OCBwxiIHgl0CK1VHuPNHsOFUQznais1vpv52cIydelB8eHd5iJJDQhJat6uJrp
	 r2SaHvhUE96WptC4+djiyIaz3oM57tPcbmeu0musS37UaYB7CZGr5hLxv5dCh3aXq0ypl
	 /m3wSPXAeB0ZE90V4SQ3Z25SGCsdpwVaZT613fJLEF1KkNAjYmd/nYyBxvFSgLd6mwbQ4
	 6oK0FFUMVxPiiph2sWbt+LAWDE4cGGy2U/EuDlHBrojKaHZxiwHolzK3q1FqsJygKPZlN
	 uZC7YY+TxFMD7N0Jyl+SdDWYcdilnEAK4oHYAhchIJKHe3Ow18BZn1doU79zCf99MQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e3dL9uTkc6EWmdkUwWGzaHGP3/aR2VFgtn/iK0yNyYs=;
	b=iMInzCp/LfkfZ1+YwXKT0JUP5OvAkTerSTtIYSU5FbQhGsuHCvoxau7dXujutHY7zGa2
	 HnHJ0Mf8bxDeJYwmrzCUnpOz1Ltq/e9Bcnhf3U0KQAXrqfhsevWJUHNbMvEGOpjZAtiuD
	 XYpJvSTKVRYGEW18buOJMi/k4Gf8JP3pbx+LA87crfCHK4wM96dH+WRfVXQTcZ90pay6n
	 66stGIbXBnUiTaRq+dN7lr8Jnd8CDmAplgAoFtCEozTRrjCOcn6l0QUp/UeRDZwKpoe52
	 DfbCwpMVXtwAZxP5yIhdLDU1ZBQbrgEwWevoO+dwqmZzIdbnJiEz8pSyIbH3vFM3b8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHtg4h9j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PhDuT2ra;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F38606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20F38606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHtg4h9j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PhDuT2ra
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFaeQ660841
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e3dL9uTkc6EWmdkUwWGzaHGP3/aR2VFgtn/iK0yNyYs=; b=aHtg4h9jPUy85u47
	Mz5ILS1BosjBZbw0KYqZ1opBPpkpdYX848GwIxikzS+GZzprJsP1IaqN+TPN230B
	/vKMeeWfLee7k13RtJJtuEoiyzJPYwfiYqvTE8d/CEAZ2giu36ttkB1Dd1uTuOkh
	sRvJbKvTvIwOw0XXAaGiGPlcECRetB1hMBNtnSBtnNpUVDcvM5XQjZL/KUt7SYn1
	NsP1W6a6KyPDl1aWofKXsQ4d+bBkXFMo0mywhOX63DufvgRTN/Jmpd8e6T8SyyzR
	iboBlwFqdEOXS/U5EXJO2rl/cl4dCYKj4lHFEreHNsEeaNcpRvWyr85/bEXYIn8f
	u9ztIQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v4cf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-313c7315becso117074eec.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592548; x=1793197348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e3dL9uTkc6EWmdkUwWGzaHGP3/aR2VFgtn/iK0yNyYs=;
        b=PhDuT2rawxhy5hsqV0W6kZBZfD53KtHGvuX8oxYys+Cgr7Pifuc1lrXTKmew0ls6Q8
         A9VSNKwZ2ac0tmPi7/+LDE/uxW2pKQtipJEbRRryDtxq3eskyulznDR8CeBNDzA1rUay
         qmHFaVoBjIXIu3+o4YlSxZMCIbfbeI+TLHLd8iuTLTbEzAyvGNF82XrnZc6vXUwKWzVC
         XdvonWLfVMUzsOXUgMwOufUTkiTH2vZ8HLzAOf8tkDrNDEpGj5Cr1IcBTZYhmo09mnW0
         CIl+piopdq5LDQOcVY8IGOLK/gQVxN2mgN4L8fSMpnOcaDaOktnA+l/SuWf7o2XM6HYK
         WIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592548; x=1793197348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e3dL9uTkc6EWmdkUwWGzaHGP3/aR2VFgtn/iK0yNyYs=;
        b=sptJl6uUrra85AnmITW8X6zf59l3+QFfSqoHm8q81lB51i1CE83gCskK17lXNMnDIL
         LOMHNmkKsdtJu8Di7zCuuyP12WrSOi48aYVjkcMmoJmgGafw+ZKu13q9ullsHy63xA0o
         Mja43B8KSvFbgHWSetMwxrFKeu5X0R2zTB7Gt1K0IcSme0TgDTW/ypKNEOsXljmx9iM9
         W0Stnz2qydTkrWp8he2ukgX0on/aD4JB9XpT8u3vPMuIiQN7kucsOhi5Pj7eYnPLUeR0
         575byJkrElblMxALZhkkoQVskK8KDXifF+HJXh56YO2cHGBwavFY/gCSwYiKyjeyTbR4
         XciQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKlMU1trXOud/eGb+JsRlZ+zdhWRZI6UsBJypTNloIu0HaatBEfdVVLzfugZ4B1IEXPvoE0xTV9toZ@vger.kernel.org
X-Gm-Message-State: AFq9FYIC3SzVdVJQ/A8tTFSaQQzKeXeVkU2j/Z5E3uCL/yl7vvofuCZU
	tn6/ys/35q3Rhjsp2hjGdQ/kOZwLK/EkEhsjsq/rWiDNs6XFBW1HMpHHu8vqntznmqlgWOX56Pi
	7n92qCmrIiXqKtUaw3fzdneniHaehwmk7C7sPB1UKfiBNN4NBQvS+Z3Lb8N9eMlkp
X-Gm-Gg: AYBFou2ihPAqcTKnbC3QozlVh9q9+Q/M5gvPgB9jyl9en98fZFRRDWO+HTF+QJMYkW5
	iViUmkbz6Jin4UDylaJr4TzHRRc6lJg5T+o7NRvVoP76ltkbG1qMzptFGHl7l+NEZxK7aEJHkoZ
	mOStzcVtFH1+T2GnTaxJdM1YabyW5xQmPb2TyZuUbvaIEyBxt3u3AjytU/awoQ/VLxeui028hk2
	PkWJZ2H1UcpqGnS622SFwlgbhbSiCg9dL1vAVznq3pp0mIQCFHDrcWM7DNODV6kbWPA0OB9Ipj1
	z+8CF9xCBtnIux+0l5TggJeVP87phzHJxq/BwkUTIzB4qxCskwsOFNXRQ83wVN7QnnxgkgKDJN5
	/gtmN3PLSZtz6gbzqYSE//TWPNMs1jhoYgsp4Z+t10s8k1A6d8H/1Cvihpg0A83zwNkVv5TZotd
	7YPaUXd0a52raisw9Tuq2gI+fh6tzp2qbqAjAWILX8OriTui9o+O8=
X-Received: by 2002:a05:701b:4301:b0:190:e602:c769 with SMTP id a92af1059eb24-190e602c831mr3705294c88.1.1792592547845;
        Wed, 21 Oct 2026 07:22:27 -0700 (PDT)
X-Received: by 2002:a05:701b:4301:b0:190:e602:c769 with SMTP id a92af1059eb24-190e602c831mr3703951c88.1.1792592532053;
        Wed, 21 Oct 2026 07:22:12 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:11 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 19:51:45 +0530
Subject: [PATCH 2/7] arm64: dts: qcom: shikra-iqs-evk: Add DLC0697 panel
 overlay
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
Message-Id: <20261021-shikra_display_overlays-v1-2-adaea735999f@oss.qualcomm.com>
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
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=3273;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=1SdHP9LACk0zrDPfvaQwBE6ZycQteOiJa836MOYqgp0=;
 b=I4yujSDJotRgm+XlQ0DTv2AC5PGAmrmvjGab61NjGbGkJKrrIzD8JOlrVeoR1yQNj3qUQtwzd
 0+7enpsLH3VDLkmY1Ald/kXDlrFtl4hpiMJ3r5rFY57KPmt5oNphk7M
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX66KnsyFOt0KR
 dKvWNAEogrYzf5AT46ctGT/2RBpoOO5nCOjBKk016si6NSYx95mF64SNQE2Z0fsDG9nQca7A5o8
 y8HRccqebTEbH/+GhbmFUNPtIHlAyyU=
X-Proofpoint-ORIG-GUID: NC_clJRpcPHY_WWHEcjKk2X6DtIgVzHF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX8DqMnaYpD8yu
 9hIq9Pm2jDAc7bBbXUIOLRCYiAzGZKXaiw8OnruJg8qVLbjsO+5nDKp+a5kUcnKySAUdr1hinv7
 nrJNvwFBXCwcWyKlCjr5u+rQc5z4Jb3tf0Wi7TW/pG+UAQIp6KTNmadX10jmrj2uGosSO+oOzMu
 9GJoSvjsKvxPRKq/gyvZSIE+jl9M//HgBuiixsZi40weNrg4SnjXnoz238F0WRJwsLMo3ZDxK2T
 vXBF9Gy0hH1ChhHAKhjPiicQ48xLlIyJkiyt0G8FjWkKwpfSgrP5XIPXNXpV19AsgxgZtVySolC
 2D2If+0GD7efXJ4Ik5GU+Gz/mE+DULnd1Q7RvQ3qn25cWstynjRtAVbjjOhlLCXJIJw8A3Vnina
 3gvECYBctgwJty6qKqducBPsAdPUJOzTmesg0lsSf1sdCr0Q7FB7bRCUcBNTkSjvt9UersOjdaR
 YNHWtlW0uirFy1yXp3g==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8caa5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=P5YriGW4VMDCbuAXzasA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: NC_clJRpcPHY_WWHEcjKk2X6DtIgVzHF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

Add a DT overlay for IQS, to enable DLC0697 panel when DLC daughter card
connected to PDISP1 DSI0 on carrier card.
Configure DLC0697 reset GPIO, supplies, pinctrl states and GPIO backlight
controlled through PM8150 GPIO 1.

Disable the default HDMI bridge and connector in favour of the DSI
panel.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../boot/dts/qcom/shikra-iqs-evk-dlc-panel.dtso    | 78 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index c8907e77c893..0c5a7b7f694b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -380,9 +380,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 
 shikra-cqm-evk-hdmi-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
+shikra-iqs-evk-dlc-panel-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-dlc-panel.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-dlc-panel.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-dlc-panel.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-dlc-panel.dtso
new file mode 100644
index 000000000000..2542abe59d34
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-dlc-panel.dtso
@@ -0,0 +1,78 @@
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
+	model = "Qualcomm Technologies, Inc. Shikra IQS EVK DLC Panel";
+
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
+		default-on;
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
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+		backlight = <&backlight>;
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		vddi-supply = <&pm8150_l15>;
+		avdd-supply = <&vreg_disp_3p3>;
+		avee-supply = <&vreg_disp_3p3>;
+		pinctrl-0 = <&panel_rst_n &panel_te_pin>;
+		pinctrl-1 = <&panel_rst_n_suspend>;
+		pinctrl-names = "default", "sleep";
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
+	remote-endpoint = <&panel_in>;
+};
+
+&tlmm {
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio86";
+		function = "mdp_vsync_p";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.34.1

