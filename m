Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879853F8ED8
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 06:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762856; cv=none; b=JkicC8+yzhYRTag//ecPhB7GP7mwyzY6BOqF5zUBF34GK7Mdx84vh5neLCZ2LGeMTG01lOuLY26GudanglIzgpzY7CGRmPBBXdIYflb45cG60+meHvXOHnNROrDUFaX5lr1iWI8vt48vgPq3kTn5L7ZA6qzHd8yMU4AKadfaXAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762856; c=relaxed/simple;
	bh=8N7TY4Wx00YA/qc/Yzv+tudh7jh85F9onYb97CA49Wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sShUfiA7KDx+vLbxtZcFo03Kq4tIpJbOOGSq9T86n8LD0LTjx2dPFnPRyhQXG4NsDfcdr1JdORvCKtWo6rQSRRXxGJ4dQqd58UUaoafrCwCnjoWTqg3QHiUIHkKh32w7rECpeeLm4SuvpawPBnncysBAOJEGQBfo43AhkoxquvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0M99GLf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wy6ufg8K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0M99GLf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wy6ufg8K"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873kud92276306
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 06:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WASUx8wqkzAjaBL+GRpEgQ7y32IiKrNjX6OK4Rklm50=; b=T0M99GLf/XfQe6LT
	GBWp39Ka4yPQ8snHcuE8oVAitfCAaCzVhuxtcT3dylkbl0eaf8VQ1BOGohLVI3oq
	XJH4i26uxQPfN2zZ8ekMc0jrQ1yAfmbir9gasHQnXWJ+M29xNQ5MmptMVnIwjgfx
	GjWLMKDYzzswvmyKSHM3ccoNmN3+U7jbvncrxvhNq7I2RuNwOytclKPY8hqjiNeK
	e5IrSgkdy+C8L2MpOZvpq+1BfouCQZKVIrudYKtM9WW1wGUJ5Gz58AfrqI+HFhrt
	frUzbc+DGFcCvriREK1R0RfunUO8gq5euBxq3eXQL4DguWvyL73gAsdkGtpM8aZU
	Iq6lRA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxks5mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:34:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so7704092a91.0
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 23:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788762852; x=1789367652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WASUx8wqkzAjaBL+GRpEgQ7y32IiKrNjX6OK4Rklm50=;
        b=Wy6ufg8K3LSUhgneB73+JvtznEI651QmZW+s5JeOClC130Ebi00MpAXwjCHEjnGTIS
         r5l6fDVXqpIenAm3b/61hvw9jqRWQ7naLOx2BnTrzNa87+I5rrfBXjyw8tfxl6R4nzk9
         BrY4dr/k7liaHbOqQKOXCHcVBgKs2HiYwfzcFwo8D2F0r2K5cATFBH4j5dT50X8vTOs8
         bRmCY4771+bPoSLdckQgWBc/5MM2fFo9Sql85N4F7kj+WUg+Cex4BH2Vw0ZcpPxao0MJ
         9AtMOaKwMPGFXC0662RyhWXHNAGT3AFtJQrOG5hSQnaY+JmYcajCsWhlYCkXPGPGpPSI
         x3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762852; x=1789367652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WASUx8wqkzAjaBL+GRpEgQ7y32IiKrNjX6OK4Rklm50=;
        b=eTRvzBVGzpgXboIt2pWzFt7IOJobCG2drRr7KEWnY5TtyXamuCgzVFMepbo0DcbnAo
         SyOn5ZSBY8xD7SlaAh1pERvVyXy3tWmkWBLmP+XEB/OOp2DrkBJm9RumI1piX5emYoVa
         tXHTXsrugehZ2UHdoNBV98o2Ef/x+KHTgfDHHyk5KJbg8+U8XgkKg2zlV9fyrMtVZy2P
         0bBTvJeQkpgHoM6OvQCX2fKOQo9vGVoi2xUo/Xz1x107kT8ws9nXZeHGMRTdDiRa8Sa5
         haRocT0Rp6c0dwlvwGDLJViYUfLVNKnCCydO2MFHzkY+O7mNUsHtyUizlMXGJedymITi
         PteQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSuXLVckw7wmpVRGMD2VlE6Psxk42+Lq0DChq/Y7Aq3LL1z5JDtFBGyq4VDZd9nGuG0m8e5aMmG+1B@vger.kernel.org
X-Gm-Message-State: AFuF++lBFUvN1petoEqJBPX4tZ6ZavovHuQDXefPJLMPM26EkMsf5yVb
	teBIAed8GvqBoZmwMN+LqWeYKqwjStS4HQxEmS6S80sv69UYplBKFOpWLw0Siow4kgCAdsy9iUU
	cacdEJ4Ilj8l6khzMHgvQJXujMgYuGXFd4lD+B2E4TqvJwGMiUw+gcczEOBAJfjTpP13J8Ayb
X-Gm-Gg: AYBFou0RjdxuS0GU7pKPWZPNsbhjY2TDMhCBazfWp136idZ0CpVIpikP6k8Y9fx0R+V
	IrcNrpqtf3fjPTGKE3ZyVW7S0+k84drOIaaBAZbSJpftBdpRvaOSqKjsVN1o7P3wfqNAu+LwvLc
	0ODA510ql8tc235iAZQwLRAa9KzxKkfxYcB2ZoW/+Rk61FvZuTaSgYQEms8lHtxEdxoDRro2k58
	zHuqaffZ++kz52O82kKk9wKWAEprBqxmKcaRhnM15/ZlRdmqutlpIefLxLmFihFPFdmnAFDMeR/
	7CxPmlUyhJhNz12sedNk27FoRVxTBft26F7lHjLfd5HZ0v6GTATxnh8FKhBlJgCrDhRz3+4v/2e
	rXspbSIoIPI34vUxD4referOfv6hlijmNtRqB
X-Received: by 2002:a17:90a:dfcd:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-39b84cce5a8mr368795a91.14.1788762851496;
        Sun, 06 Sep 2026 23:34:11 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcd:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-39b84cce5a8mr368708a91.14.1788762851034;
        Sun, 06 Sep 2026 23:34:11 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm2440549eec.14.2026.09.06.23.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:34:10 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:03:53 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788762840; l=3148;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=8N7TY4Wx00YA/qc/Yzv+tudh7jh85F9onYb97CA49Wg=;
 b=G7W8n/gqGUYM6VYeoFH5gl8G9XCPhuP8IzLkJj543T04lV4BW2rrUIVQdyBAfSkG8Q7WLGnY0
 Bi4dMbeXCxEBr1zkZg2WLV65vntK2SOczXvRxl84nbjQ5O8ptlpo6l5
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfXxotRw1oTM4J5
 4YrHZzxYUbzY4/oZof0s0FtPTejUcFHVL1wbSeUU9To/yp34BZZY8HXsrx3VKmc0KfiLCpPeYxs
 HNnZC1pOWj3juLoBE1Jt/IafXjBHsdMh628z30iYsmaZQWAaDKi+puW2U/zGFqkBYkK8xOdq2V/
 SCp0nWLR1LYr2j944rR63e4AYRMfu32VA7WqdfuzsjBEOKD6WSdM+H9EerKO+SMGThjdB3G7AL+
 VysntMZzkwr20yPvu9Irc6mHeo7WGbX2BRAmW7jZA6pd6vuVF+ylfeDUs4VF+lUsJWjHNVwQvbN
 JybmFRsq3HsQLRkCEQTlsbIHNE0fQmxS63A1ij48F9fPkwiuCYfMhk63cKPcOmQLYJQcB2WgYKr
 X1MOuHkP93dJaCkGlLYJMQyRPOh7B78CcuupV8x9rR8V2QAB0x2KXhp1i51d2zwEQ69+P4yzbnX
 pnp0PV1OuSx5fNT43Lw==
X-Proofpoint-GUID: mxdhcXYYOyCpnpk4x5dqPZw63cM1IoXG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfX1clJGe+/y2zw
 nksLFxyYnGbOhfRTu63QpZdWmKxPOxD+nLxEg6VMMgdNlzYMlL+F8TJy7AZDQaXwLwBc/bETGJ/
 F4jO7/BDqk2WQEScNcfwhZeKugm96c8=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e5ae4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eOe13yjVLI-PHPVp4M4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: mxdhcXYYOyCpnpk4x5dqPZw63cM1IoXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070068

Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
I2C8.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 ++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..38554195fc98 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -71,6 +71,8 @@ monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
+monaco-evk-raspberrypi-dsi-7inch-dtbs	:= monaco-evk.dtb monaco-evk-raspberrypi-dsi-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..f27b5a4a6093
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,82 @@
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
+		power-supply = <&reg_dsi_touch>;
+		pwms = <&reg_backlight 0 50000 0>;
+	};
+
+	reg_dsi_touch: regulator-touch {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		gpio = <&expander3 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&i2c8 {
+	qcom,load-firmware;
+	qcom,xfer-mode = <1>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	reg_backlight: reg_backlight@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+
+		vcc-supply = <&reg_dsi_touch>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l1c>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch";
+		reg = <0>;
+
+		reset-gpios = <&reg_backlight 0 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_dsi_touch>;
+		iovcc-supply = <&reg_dsi_touch>;
+		backlight = <&display_bl>;
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};

-- 
2.34.1

