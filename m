Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604734;
	b=QnATycB9bwq6jezGhSuuUQoFPKRQOev3eQRkreYTGqjsqkiym7jOYtIkbeUHrUma0GcP
	 QEvUKBbhJQ4GW+2f8TRePEHR5hmh4TlMst8Xh7DfqeEsczebZMIcOCuGnrtK3PRXvmRJq
	 iOoikuTlz3S6hkC33xuRzg7VASI1wG9cobJ25VoWA12yFEo4Osf2MzKTaosYYzaI0imlQ
	 Tosx8ahDdQvefK/RUxqbFIOY1rhuue8CFq2/wh0b9RSLbwn+Y/6eb+zJu3/z6sjWc534s
	 UUsJO5XQvpm3204+Gy5f7Z6zfpdyTAfJkjtFmqlwpxL9/ILNFOvsm5JVxG8ePEdJffQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604734;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
	b=l7Fy57opSk+q5rY3Xyvm/UOLWWEJl7lbxnfsoH/ZVjgWmPf3+FBipiWLDNIHjeWmRVpx
	 vp3Q6gI1hvuBfhZRhSy1Ki0B3RESDl6QoycPq4s0sGMNR2bBreWpnbzWxy+pDswKBSL9R
	 lEPISbG5yso/51c3ccr9zXNRZzo3wtR7gbsrHvgyIs1aBTPn/88c5Tcx8i9o21VmCcDEd
	 fZ6gsO2MROYbmmmVRLdAphWKmqkNh+PA6cYg6WqrLTIIsO8VD4Zr0gueFpGiROpmzaR1u
	 EwDWcOLWf0ixxkeEJh3GSGl8dt6xRlssXabPUANQna28LTTNIGgr3liZfbDprQgdo/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JlZcZHBn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nn4kyz2D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C68606A32D
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 07:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C68606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JlZcZHBn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nn4kyz2D
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A26pgB43120968
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 07:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=; b=JlZcZHBnYVF9GeA2
	8p1OtVdC9+8fuWyNSfFzTA3ncvHWrtZ0zIFm6DuhxWD1w6mfws+bVF7hp4Ufc4Dc
	rTypKhBbdBadyXrLdrU1/q8MJ3EuTT1qTdudmHnQAsA6YcMO1yy/HI+uLj9IEMDN
	QAZurUkLd1OrqR3NfdWEExNGY13FBQ6MWUl7+DJi8Ba5Th6Ct80N6OR6z8XOlSFj
	qCm5SG/GGDMJew8AQ12QAyRmOB4X5VPIGun/KkXGDCfsMVawr3CEvNrxUoVnBxGc
	7712yvVHFeZ5bUL3d3zXx0HspBMtDlGlF/Cxy/oibzNX0eeTZ8YxUbOd7LHUGRD7
	gSgC7g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmer4rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:32:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e818ca61bfso29398945ad.2
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 23:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604732; x=1794209532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
        b=Nn4kyz2DCWuXB/c582IydAPYwMBnmrDmmYf0Ceg9wtJ94pdv7Wbxqi6ZzlyZmMHBBc
         9MF9eMIEuuBr7gBe8/G+bX7A2L3F9FuADOCCJdiLytcqnEdu381ekKlSyScufEn9VmFd
         0OH8+vV3UhHS+SqskkdfXv2Wba30Ou2+u5inpMoqkuqC91/432U6d4w0XXjbUkfsj3Ob
         RpopuCBPxrBsv5fDpLd2YzXtKVDBpV2zsFVQ64F3Dwg+O0oPolrBSkVclEGCQufinLIp
         B6EcUPbLnWbOTDlfnLdQRclDM7SIrkw0D2TTrOUy1P3qligfheTQcQrwtX2EC7vKY361
         f7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604732; x=1794209532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
        b=03wnlvgZZWf7Y7lbgSr+hRK1eRHHGSgJHGYtcB+tDNC3BvbBq31Loi27oJi8yT1hy+
         v6WR5YncpEjX5B2juyWTYUk4kidIu/L3z7zNPkGSN1nbM+yhjcDop4E687bUlA58BCcv
         0ouBplPhz47Cs/GrOsDJpwahuqzTfoS2qo8lAs5Tz6JjJxL9owtmutogtXrajSavvkF3
         RdkYH4A/UZEB3+e1br7ZLoaYk9CuTNUJAove4Ug001S5hBXVjYiH4LJNkmET6jwdwRuG
         bDjbq7BnNL9w4KaHmME7SejBuxCj61W02/SLNP+14Kn549PJfw+lcl6OjoJBIHmDwwqN
         2xAw==
X-Forwarded-Encrypted: i=1; AKwUvBzHyIWPbO5rBJ4WNaLt/rMpgP5M3/L8xJCLDera1MMV9PvRMMXLheusl7cQ9NPH4V+Ax7T8eDwRPEQ8@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sqh++Ny7TORlzAytiwkQPVL5Gknu+Tl9GoCS4GUkpQTkEmCR4
	q1QwPc2V1A4kPqe485/XC0P3/ChjW8uOJZgT9rfTfF+I0UkKQT8W4SzfzUQEy4LrnAIGZHcUXwV
	JDWmqidPu7ugO40ny0XyO4MQYkLqT1/xQJ2aWhJLU0A/bybTIk/XjogzvLvit7GU5
X-Gm-Gg: AYBFou3Tz8BqlQWakQyB+pBQ2cRNbyhm4LLtA0mB04pEQvmzbTg5mdHRFl8MCyCM9OA
	qqBQ5gpsbuMPZKc4tMr5CvqyxFngnac8icUc4WiZAubGqG/Jj5usonoLuV06KpCj1gRjBS0NRqJ
	7R2SJC/cRaxukGNYq64ZCjbbNpN9jmtj1s18+Lrn4kfd4USTaSUEX7PXPjXiEUq+ggfB/JLrWk4
	J4SmaPvBLjIjcSJsgRmmHTWKq3zjCOARpQuviwOMiIIp1P5Yia3myhlQobrFKhvhqnjpagm1LES
	3G2ZgR2cwonb96QuVgQMQL66vsSG3dNKcRzaCUfjzT2AWwcQSDjRpJwzCqDGO8qIPgWVEmQNC6m
	DKqPp9v9oBXzdALsCVpJTGbesyrrwEqxS0JWHdDnwN6JUwfNvZilH734tBsj3/v1EQVeejtpAmN
	PP0bqU
X-Received: by 2002:a17:902:d50a:b0:2e5:cf96:9340 with SMTP id d9443c01a7336-2eb3648bb2amr87351965ad.18.1793604732226;
        Sun, 01 Nov 2026 23:32:12 -0800 (PST)
X-Received: by 2002:a17:902:d50a:b0:2e5:cf96:9340 with SMTP id d9443c01a7336-2eb3648bb2amr87351735ad.18.1793604731764;
        Sun, 01 Nov 2026 23:32:11 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:32:11 -0800 (PST)
From: anand.tiwari@oss.qualcomm.com
Date: Mon, 02 Nov 2026 13:01:34 +0530
Subject: [PATCH v3 4/6] arm64: dts: qcom: talos-lyra-evk: Add Waveshare
 8-inch DSI panel overlay
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
Message-Id: <20261102-lyra-display-upstream-post-v3-4-7f660c3b622c@oss.qualcomm.com>
References: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
In-Reply-To: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
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
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=3607;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ep0DWydVmKj6o+MB54eb4vl9AakC4YjRhLn758mEY0w=;
 b=VLid4p+cOMuzaN+XR84jqTFFsdpcmhmMe/PF5bm2EuqoYZ3OZao77ehvpHeGJotoRMaycLjTo
 DyfAp+WLPCqA73b8lRyA3GjCp0X33v2irTJrya/+e9XPvLcuHFzOS7D
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae83c7d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CsxVdn2IL-oTZ3OAgFMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfXwkLUBxagm63i
 zAcNiVO2WyYNgIlbhDU4pqWmw2LPWvnDvANuq0YB+0v55YqjkpaJ+KGw6Hmhv52hvT8+BdCpjDT
 yPKAFLskjU6fr90M8zvPE+naeJTaPQTiPVGG3ZUdMQBA5mz2XV0lyY3w/jfy08nWnmZyxhPbndq
 /deqKnkhE9+MJQYuKI4cNYUCCKs6WWG7bW0zxpiHr5DmRn6YdrgT03qsP3ElUy3LbsZH/ZNbA7f
 gTZpO181ky39bpq4AcAkUm13xlisneBA6dr1PqGqKGPsBAZU5Cys/7vMkqrYcmGdx5Fht2zc7WV
 xeXVnhJaosP45bmrMnUx5V40et7znUPSLxTtgqWcX+lKQJW1UeK9nmHqKFtIy0V6t2ccOh0A7N8
 0ieDjOXzg++lcWbxQMDAhLXqWD3x0KP8ZMEiSLjXRpSjDSNgfgQdJfPNw5AT3z79zme0xqjpwva
 sSbcRCd3ihb8sgUrwFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX4lRPsQluK5/k
 rPqA6wv8ANJDbUGvHL21J7Qp5EyI8G2kqlgqIxbLmU8OdP24IU6HOClBp/D5imLXPyG1ZoWw6e/
 5080YFyg1NzV/2LONYCTCEwpRmD2hTk=
X-Proofpoint-ORIG-GUID: A9e0uEEYF4kQD9w4myIGSxpD632yCoOn
X-Proofpoint-GUID: A9e0uEEYF4kQD9w4myIGSxpD632yCoOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020029

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay to enable Waveshare 8-inch DSI panel connected to
DSI 22pin on the carrier card.

DSI0 from SOC is routed through MUX which can be selected by DIP
switch S1016.5 ON, for enabling this 22pin connector.

Add the JD9365DA-H3 panel, GPIO expander at I2C2 address 0x45 for
panel power, reset and backlight, and the Goodix GT9271 touch
controller.

Disable the default HDMI bridge and connector in favour of the
Waveshare DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   | 75 ++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 298054f47046..b6a61339914d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -485,6 +485,11 @@ talos-lyra-evk-raspberrypi-dsi-7inch-dtbs := \
         talos-lyra-evk.dtb talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
+
+talos-lyra-evk-waveshare-dsi-8inch-dtbs := \
+        talos-lyra-evk.dtb talos-lyra-evk-waveshare-dsi-8inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-waveshare-dsi-8inch.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-waveshare-dsi-8inch.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso
new file mode 100644
index 000000000000..e9a8fdf0c179
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	panel_avdd: regulator-panel-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-avdd";
+		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_iovcc: regulator-panel-iovcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-iovcc";
+		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
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
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wsgpio: gpio@45 {
+		compatible = "waveshare,dsi-touch-gpio";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		reset-gpios = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reg = <0>;
+
+		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&panel_iovcc>;
+		vdd-supply = <&panel_avdd>;
+		backlight = <&wsgpio>;
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

-- 
2.55.0

