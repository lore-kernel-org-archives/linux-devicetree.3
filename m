Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604728;
	b=sOjnTu1ZPcciXeoGomqk8qKsRtuk1qInqOOyQmgY35TwYwF9jILxeVHAv8qU3YL3MY5j
	 Fxy2Pdp4qzs0D5STkO1AErVOAfcyyZ/nd6oQkTYiCKwS23PWvh97IrwpoSz0qZti40WZy
	 wANgZkekPmuBwrEhueIXAzvnGbzwYqnNjSH2AXsvUgo3OeHfrYW1yUvKs/DCC+ft6uqRl
	 WPlT/dTvV3q8Tfyt3oaWCeszjKJ7ACzp28dOX22iPAcFDEZSgsSgRGYx5w+foZWlGEhWe
	 NDt2lEwwBAi4iiEd3UFJ/jAz9Js2us2lKbuS2A1JdhmaYJNJBtNK6xL8+gJyBP9TvcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604728;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
	b=a05AdaG8ENVRTQeIied/rg99GBOT5EQKMPSROqrdnZS4/hj2BjZ+jDNSlQzEdV8SOBEp
	 AzK4LjpaWjrJKiySSBpjQQCFSC4ZzJ/QGhDgYd9sPEAMMwrO1nEnilzu8DZwIKifUfM84
	 /hIjckF4oXlcq+Wy8HbXpJmDrfis8Z07Q9uSrN0hIgymbF6oTs1fyxfExgMLn0AzaAcvZ
	 JTP/B5fhw0ckBCUX3o1G7XvnwsoFjtU6qndPtZ4m73fVK4kawS+4spwoMV42iFJpyAk32
	 zcMOz1FITYuoKC1dHZODaahn1ue0vjcKI5xmsrsEhXc3pc0jNcFgaoVDRyj/Ij4x1bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l53BqFl+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="VuylNs/y";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA06606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 07:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA06606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l53BqFl+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VuylNs/y
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23v81J3768690
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 07:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=; b=l53BqFl+lxJcsyoF
	jER9sTiiLtaCN0XwOhqhX+YSnU1hrgMdnhbgWnIBdjAYr9TvLIQtGe8PrVcdRbJp
	0B+WC9SIIq9jUodFBCfuTeOSiN+iH3m5UhklrCtK8IWvAHlIWzag8aqxgy6nWYWk
	nb3o4WPuvDmmuYePTbFTG0VguZFgI9WgzIkjdv3C0NmnmXr8gj/luc+9iUTfBzzf
	+0epvmRw67QXa8SAjbJ40kyVNaO/KW8YJQCV47vhPTlwOIUkS7IqdYaT2Mhvmcdx
	60wlRE44kc982fB35fCNUyP41q2u3M30cGbIrr9kglYtoP++iRQsYNwzwQe/JUGq
	49F2KQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rwtfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:32:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eaf3f829b3so29109755ad.3
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 23:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604727; x=1794209527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
        b=VuylNs/ycqW8ZwtLrDLEB/XSdVDEXJjf+bsSccXVkSxJR/yl1bBpw0EG3EvQs0BXjV
         DbLwqnNNhw3qRn/3i5ZzivpUNvODtJhhC+3ciHvwlb7dyrCe3lj7VqaW02icvlpPI/L5
         DFmQcQu1/yNLfeP4tfLG5UJ+l1al23/pQooZk2nDQzdHQ/fZIRD0LGQjV+iDkB3o4Xv9
         iVMpX7lwpg19LDI+XmfEB5KYj93S287EfL6xLkizAajTNOfBWAfRmUtWHjw47NMyxJ1b
         FTn2UBS7FTGhI+x8b+mzwtxcJ4WyVMZEetYz9l7btl46rieYguEAmyeFXpjIIohlVDWA
         O6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604727; x=1794209527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
        b=NZiCzpJvTh09Kd4Bx2TIW6iSt4RCUBlcdxlI/RZNwMJzkKdU7f82VKYo+vb7tSLbmJ
         GOSnyIg1qpEh7cGJmXaARqmeCiVDjD9AzkeitJW+QtPN/r1gNiRljKnCXwJK3VPBT5lT
         VDfn+dUFZfV/mxReytIQ6WUu2lWwSbiQrWKRxb52ldwokTvunBZeOzHLUzcOwkXhQVAt
         c9beemfIBquNjIWOvNiYE+GimZzjPpX5yx8Q9/LOFTJwZ/0ScxE1SG3emricYDGhohZR
         tBsHAmWOdiiOS9Alzp4RzUJQcWGxYwMHHOr2XilySWBozx8QdbFsdNcQt2ulvro/3i1O
         R1TQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMsSiz6vPKiztCf9kdD0KS9C+w5wDmVFoIwkLW+04gvvs2VmMPMwE1LS8lI1JcUm+pI5K3cHs2144T@vger.kernel.org
X-Gm-Message-State: APuU4Z+uMbrUJJTOGfqDF+Lu1Jn21kyILqKxWHRR/ZU8A0SYmNXpLLcP
	JtLNaUBTPClbM6a1eZTPlrfCN4LcQ58w+x5zMnPqVH1G8lQX2/kk+SmTqKvmzV7nFMXKqsOSyTU
	uUDzbdGKv6gKESNhpDJBqco0s20A2UGJIV9l2g1edZ5jJ1WORgSBTZk7IRh6sJIlT
X-Gm-Gg: AYBFou1sWqBTgd5aMWnjCXjDyAllJwDvdUX8JygdmboE0McImn9D87JD1sCzBEY0ZyL
	259giG8V6QXcS4xbeO3E8GsJQIg0rjVugfxVxuplfdyyzh1tb1Btt3B6Y6N0k76L3QsLOs9mTRM
	8lTZyJxrFJ51gNqXaeIoVv+VuuDCi4xN6wQ0pZyCencGLK2UxUvdkRufPqGW1wim+AMW0OL6jjB
	qk5wRv1gNA2e++DifjytH0aldV+ChuZnlSTHRqAmHgxVWo+sctnYg2mGDxWL5mdqPx/GSUUg6/S
	BYVfq4WZOohLkg9ZVodpi/RsDOahgx10Yhwghjd8/W8++znYit0NUIU+juKTmfUACKCwNAooWY6
	f0ryKEkdoWvmVKNZl4bT+su/AxQcVFmT4AnO9QzwEjH0brqdnaY/PKMKh73oEDe2BmK1gDLZrwR
	Oolrug
X-Received: by 2002:a17:902:dac2:b0:2e2:c84b:43e9 with SMTP id d9443c01a7336-2eb363965ccmr87850495ad.1.1793604726589;
        Sun, 01 Nov 2026 23:32:06 -0800 (PST)
X-Received: by 2002:a17:902:dac2:b0:2e2:c84b:43e9 with SMTP id d9443c01a7336-2eb363965ccmr87850375ad.1.1793604726101;
        Sun, 01 Nov 2026 23:32:06 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:32:05 -0800 (PST)
From: anand.tiwari@oss.qualcomm.com
Date: Mon, 02 Nov 2026 13:01:33 +0530
Subject: [PATCH v3 3/6] arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch
 DSI panel overlay
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
Message-Id: <20261102-lyra-display-upstream-post-v3-3-7f660c3b622c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=3988;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=khjAi2jQy1zq3snDT67UsqjsppVgIl1f7iUfWMD5fRY=;
 b=z4D5+XRjcELJZGY+Tqzuj93wKZjqBIYMC2aKMBQZ4dkyAeU26xSv+XfULfNgUug7LIVchm0GE
 6UF1aEhqUCvANDiY8kVUmIm5XAwGt1lJnoUvEi5JxJp/9MEECXUk1ni
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: B5Z2XBfY2vtzdvLJESefROTNnfHevuxI
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae83c77 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jdnGpsxoh38fhdhdbFoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfXx0yjGst562mL
 ODp2DkgpN8euEidxp70df0p5y8oZWshqWwhc0eWuUaV5g/smgvdwHPRKsbb+d986aSEFANFSzYJ
 Mnwq1iYL+TW3XW6MNMrhennCI91p83g=
X-Proofpoint-GUID: B5Z2XBfY2vtzdvLJESefROTNnfHevuxI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX8u52ozwMuC51
 /xtc5k8ZDXgKiumWobC949tpp31ZKRndPBsUhRC+orUhFGDSY//Q3fCSgay7OiiER8b8Hz8yDAJ
 5T2ebgbPuF4hrp28dl4woKHwTgU2OlLMZeSN2rFELzUvj/b4IV9CK19lJ47J8AHx0K3ah7wraQh
 wRrK1dirSjwud2lxfI9OByFYzcWo74AdozpdOmWBGbtiZdDpW+aB+eUMclJP2sSv9fzECPHTKZi
 xZuiyEqJnJqI8dmlstxzEz3US2Fm/LoYdTRxbFxVRYEgv8XfH/Sj8nqoAjOdAtqMNjk1Hykn7Iq
 bjtxjSR8mxw1m3D9XBNS6ADVj+Vjb0EDnpqg2F8b7bZp2j8aLaZ5CciAAxz+ijctnuREGMQ8ybi
 afnxrIiSXSahF2f9cO+ishnDlEuFx3ENB3RbxxtuR249hIoVCv0CgICWHJWksTc1Iwb/NOf9VZJ
 ka+TdbWya9zIWGYH+sQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay to enable Raspberry Pi 7-inch DSI panel connected
to DSI 22pin on the carrier card.

DSI0 from SOC is routed through MUX which can be selected by DIP
switch S1016.5 ON for enabling this 22pin connector.

Add the regulator and backlight controller at I2C2 address 0x45,
Goodix GT911 touch controller, panel power and reset control, and
a 2-lane DSI connection.

Disable the default HDMI bridge and connector in favour of the RPi
DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso | 88 ++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 709a96ece14e..298054f47046 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -480,6 +480,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk-el2.dtb
 talos-lyra-evk-dlc0697-dtbs := talos-lyra-evk.dtb talos-lyra-evk-dlc0697.dtbo
 dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtb
 dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtbo
+
+talos-lyra-evk-raspberrypi-dsi-7inch-dtbs := \
+        talos-lyra-evk.dtb talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..6dafdbb87d3d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,88 @@
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
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
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
+
+		reset-gpios = <&mcu 0 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_display>;
+		iovcc-supply = <&vreg_s4a>;
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
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1>;
+};

-- 
2.55.0

