Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595876;
	b=obzTrvkG35k5m0tD5TXLSw2+5hxsafnQ6wA+q92lTEXllS6trjan2X2TsROtp1XuXlEV
	 XP77YNYFI/dvyYds6fK2j14S2yqyEjuS8QndsBk0EOhpc/1kY8aJQavjypvfiwNtLzRy6
	 Cp5W97dI3yVaIQe2bdtSNlHKmlhGnyMi+MrFugUn3D7B8c/ZU/QHInLLgg6WgGkt5YnK4
	 bBbjoDwIYRinkpProRnz57esdBPC5iuTMdHlTAhYF/ItiIPmwqawrZ1XMUpY3Qcu3mcA1
	 bohtqoMJXH41Sn0fgnNxKZmg34x+oqjzedo6q4jtS4IJhjwYhqROmbVydYMLEeDkZeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M7giEH12KEq5TYG1CwffV+pNP+0+B1pDDeisStQqBfI=;
	b=xC07AYXcZbSo7Rzxm8y2F3mIwaCIm95pwTQRDz2e3nfa0I3zbGkUve60wG6Hb9uz69Ls
	 UHRypMbtm2O4cUxLXGNsB19GkdndGdz684KSOh+T9lAhhh3hOvE013BsQJ0RFjkSGIrTA
	 xljebpIYQT70NdeCP0OkgHwo0aJWIwGzjFkuqX+ehS9QddCWf86/WshLuXHA673JD1qee
	 r316J2n7oFeDyRuDC1up0EvbBJb65yZVeuq2sPcOsRV2DDOUGl22zSv/t/rRLdGZnzmeS
	 URpSkmDSUlaptbhUHrEIQL8dyn8XmDvytQjBF6BsPHIdc7HEQzC8CjPuWSl0AHDzeJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pCFuecFO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcOxtmX6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584E4606A32E
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 584E4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pCFuecFO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcOxtmX6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF5kt823460
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M7giEH12KEq5TYG1CwffV+pNP+0+B1pDDeisStQqBfI=; b=pCFuecFOB6cOvb0l
	vSC7Wk/vuvDYPbCiEMk8Z76nj441539lls1RhJcSc/TpLciS9tD/CoFf1wVks/A/
	UHgQ81Hjmhbe9KZQGWQPhBxZwMhCMC4QIuz8RRCwimalJK/tnSfMD9/BkH4v1cNI
	62zTr53kZLZbo5YkN6aksevEeowdaxnLjDoYV1h76BlE3Q2Q/U+H3HS+w8LiRXza
	VNzAab6oTjLCfj+7GPLtE6wUDV2GCD9I4Med+3MIwZRtbeOadvyDegRJ8AEn1W2w
	Gr8Wczky2jTp6M6Yk/TxMCzDg68ILfP6nQkVXhcOpT2h5dkMsmJu8dvR05OrijbB
	I28Tgw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r3qpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:17:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36637676140so1476635eec.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595873; x=1793200673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7giEH12KEq5TYG1CwffV+pNP+0+B1pDDeisStQqBfI=;
        b=CcOxtmX6tFNAs+ItudzXG0l0k9R12aWdmtXpN41c9XRZ7EHVJXugynr6DU5uQress7
         9xj0+sPOgMsmN8oDChkl6H81olPdEqdL2tQNuQlt0zKQeyWaMOv/aObbSKG34FOAwnc6
         KpZFh1avpyXq8cD5QHEyNwdfVgrjiCfr8zb9e/C5BH2dEus1u7wHINyDP0XPg+h0d1Sn
         m7dTdGZYv+nAANy+ERYSNBP9tgjHM2PIIsGI7xIc/8i3zXeQl/Oj2YIA8CBXxLYp0vX2
         p7CCTAa0aEBGPKGzyb1rjrg6okDEjOr/gBSJ61dQwT847YDcE49TAeJUrQYzz0q4ns+g
         v7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595873; x=1793200673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7giEH12KEq5TYG1CwffV+pNP+0+B1pDDeisStQqBfI=;
        b=sredm+OssO6ZGCaUo1hIipFmnIucEpMCiny/im9rmH2keeIP6Bpmrt/Vw+plm/lt/f
         W7GSdHJbd0gOx0BxGq0N+CPf3mMYwi31HuQsY6KTYrpPhQvlXCd0aJ4taI9tD0+qKhIM
         KBn70VQ7cI104UYbiC/bqo/0metY52dC6EhA3L3AYsXtH91vQnnGR+vWvRtzc8DUTIqZ
         fvWsbb+caJt/VzvobQtNUz2v2+qEZHBFCt6VAjeOfls1WqyWxp34Tqvg8wQm6PZqnJMr
         gSCJfZAmx5H/98mevfmFigxM1tAK1QfCKTaEL80baTt21KZjm3TWCGEMLsKb9e+SKMCi
         JaRw==
X-Forwarded-Encrypted: i=1; AKwUvBzJkJXn/9/GF8FrPI1/t4LZOLOBqiDPKjbHNNCv1JSd/E+L8xo8Kw7FLzhjfWqx7xbvHWuZCi97SuQP@vger.kernel.org
X-Gm-Message-State: AFq9FYLwSe/scOs9F/KwVz/jMOQK4KURkZaKZ/DgYkpaQXr+51lRFlQV
	zzU1lfoY60ApimXKmF8YFcG+fXZd/v+Wsn/vCkq7ecAk/df7TBvV+rV3u/G/O1c2B23DGTtDQSG
	xJxXzhV92hs+ZV3ETcDGS57RIUytV/a1cweDRxF/Nmp/Zcyu5hUpEeIiUF0Vf45K3
X-Gm-Gg: AYBFou3IWWeOqRctS74UwcZvyppWAGZ2OSKk7ARP7PRwE+Jw+f3n2/nDT/A4RLjgtZU
	lFTTb4YYb5KmmNoDP3zZsAAnJbhFerh35GCASN4BYU5GCX/Bc2IAE0fHi/Vu6luP7vVAaSaTo0U
	hiRG/z17GIGM8VwresYWq5MyQs7whSXZIJHILv5zMq+xFJAhj75e/RLK/l3nNaaC4PH9RVz7n2G
	3pA5mf0ut4IwxQE3LSFelbUHItCRslY4UBRFBBhGWUvCY3yH8fR0NSmjxw1PSAENHRhAet3SoBP
	mf7QTc/voVKAN/7DFE57iYTqJnVMq/td6WCFVay2OD429VP/jokg5mMU08d++Tc38um3zzOw9Ko
	2XmXWdBJ60d6xCbc1QWI3jF3QZmjg8n+6
X-Received: by 2002:a05:7301:6196:10b0:353:812a:f43b with SMTP id 5a478bee46e88-3674e164be7mr3408085eec.26.1792595873304;
        Wed, 21 Oct 2026 08:17:53 -0700 (PDT)
X-Received: by 2002:a05:7301:6196:10b0:353:812a:f43b with SMTP id 5a478bee46e88-3674e164be7mr3408050eec.26.1792595872699;
        Wed, 21 Oct 2026 08:17:52 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:17:52 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Wed, 21 Oct 2026 20:47:27 +0530
Subject: [PATCH 3/6] arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI
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
Message-Id: <20261021-lyra-display-upstream-post-v1-3-585caa39cd7c@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
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
        venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=3917;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=gVQnglIBFyedTy+udwBpJ0Mhk/a9EY72RG42+aLXzgE=;
 b=+mKOq/xx1XOGyXNqxB0Bn5SlGA57RW67VnCvMltqD36O4+79V0TXGGskXbv7gPaLjv9K44uWx
 xYBlnHGAHG8BbpWbCS66UWanwVDAFvT+sfW/pAy/M18ikkQ+Iq+kM5i
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8d7a3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ebtc9FoxabyLX6FnRrwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 3OcGEZyXxZJufozd5IxpR5JzmUPAePrt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX69fiUstCfQ8j
 pcAO4+xMiUx0Bp+VqVM5Bzmiwa6NkYLg7u2clSG5YMq+yTeYxbLhjWnE2JBIstdvWYgtLXy9ckB
 9MFEPpMDFQWLABvIHGbcqOs4Af2kqmRvLOAExF+y7QqWOMYk3IlgxGUmucQMRQfRpL/xJFPznTy
 8nqeDUjS1cquSRAsV9K8UFYltErYAVS8hhUDBCB9lyXn+NCcGCHRjhyEdsFuPb7C4MD54oPEe7M
 2BvI9KY1u7s0oGJhSsKagEue+avHyL6KF29Gl2litN6IrNYCSVo5sgojoIHWR/2ORhwokJUpwXw
 scu1czobR0QKWux+fVVUi+NsKiefSLdq1BFnl4N/rq1BnZ0MCShdw7f4hPenHouOr3MFi5fpqpu
 n5t2q11pBIzmkDJ1HKDd5DvwYBsRJ8LOke5LIRWrfIuhFmBde8owRn6/kRfTdxje9RJuli7f5fq
 ieH7J/2gLWRKRK/a87A==
X-Proofpoint-GUID: 3OcGEZyXxZJufozd5IxpR5JzmUPAePrt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX+UxF+8A1At/i
 BAhXyX2fRx9xC7cZEXXlhft7SoQj2x5QbW3bfRkULGRN34lo/iKFZSD+FhIXUEtuDg6I3ANDr0b
 vKUtknT9mZQXwJBniBSn17wkfICQOu0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060

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
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso | 88 ++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5248b6be68f5..a2a2ffbbce3a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -480,6 +480,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
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
index 000000000000..cee602a78322
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
+		compatible = "raspberrypi,dsi-7inch";
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

