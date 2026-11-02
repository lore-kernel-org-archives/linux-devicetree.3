Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604723;
	b=NA1vvTv9aKYPe0wBhmxgRRk7VOMQAWYH5+IcMPI7k1Pwok9j0l0umlylXUvaCrKMgDur
	 07FYuBVfJPB+1sZ6A+z7kQpVN+s9xaCulgjEIT/R5fFYXphPLQFGicSVfR8TYVwydVQxm
	 YyGIzGDbw9lEZyXxGhJOg6WgBlruibVyJoqjZ4Ist+kFQCNV/xxK5iv54HpHVf8lLUWeT
	 bxwGf0Ll/4GHnzsVX53lZ6z//l23R9BPmflXBSjSupaceckMbM+wJd93X2ffLOHx4NX9G
	 53cAG92H5J0fsFux9uz2sIa4SJQxdXeSM2HqVb6Zsh4mV1nIw7ULzfBhZj7Z/VZ2i4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604723;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=;
	b=4xlo6fihbijmscXa7lo09bY6LvAcA7zM9pQAlil8Je5HADZKlSiBOV+S5jBoCLzv9BJJ
	 u5YqSAK9V/ZzPbK8GSk5azP1b1u5G/EEMFwcmCWRLmciXP03jav5fv/DMhFkn37N16ZJH
	 TrGsoO2ERpdG+8zYcC7vR0jSdc368lXa3OFqFJF3bPiwFhFaMQI7pQ8r5w3licCVv8/gI
	 PQ0CrNHrg8WAdQ3gFMu1cGpsydjI4YeEwkGBNDJhceopYOdtk3wyg8Wp4WjwsXRnlUtBk
	 IBoYBskb5BJSI4XJfANioBZdfV2iqjkkJa1GxbBsbOi2fGVj6hG8gxNG17Qd/PxK96Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ECVnDx16;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SgOOy0pj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12ED606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 07:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B12ED606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ECVnDx16;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SgOOy0pj
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A25VrDU3924162
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 07:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=; b=ECVnDx16ojKqciTl
	aFtETWePWgQQSu1XOdEdYR83o+iRIZmzEHKXQ1n+uC/jUvME7ilK8evp4fRBE9+0
	9q5lMBHTTQZtXMQQjL8sKQfQtQ26fEo3ex7k7Kq0ZA54/jU1iuGpxdIp0ftxxOez
	jxbbRdF6ElB+E6l3C3N44PD6kQdjhAtAb+f762LxsbC8+TESabAdi7upVTFDacQS
	OCHhVqAxuaIumMHHKqBXCa07XoX5MDJTkzXJolSm6IVq+vcZYR0ACPPxsWLOtUdH
	UFo1qDE10DhzDxRPwbcC/+A3tiesYn6lc1sYlGXIDIIJHJk3LNfuCuqy2h56l5wi
	Ju0CWg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1rd0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:32:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so2701588a91.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 23:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604721; x=1794209521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=;
        b=SgOOy0pj511GXsWmnspUckjRilBeXvsAi0iWmAy42yX9PHkktwPkWFeuzb8aYdiX5Q
         el/opjQlBrrU6l1a0kMrX9SPHMMUlI78IQSNBBvj0n9f26ReKROQL4NH+6b/HH2asIN8
         6CdBpKCrhbxNEm0z7Z8BZdybyIU1AE7qd8n3995IRQ6MZzwhSfRSekLJ6SWHHHxOmsVE
         ZAUBpV11sTfy2PEXSq612gDwRFf8/+AkBy6QhAY3J+nF+CQ7qmC8W+tlr+f22fobv/li
         PK2x4l5dHnTlIKezgN64++9OhGwOy2PPKSrSxMwoC/1X27RjVoK5kmBRwWTTSCWa7QCC
         sCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604721; x=1794209521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=;
        b=lZ1fAqjBRi/etO+OkZKRLbkMcp43h3qIAUs/qDZb9vm3X800/1WTWULP2Zuj36XzCt
         8iwyeEhLACsKQbwhfOpmuz+qsbvKud8WpsfgJ1uasE88I/G6tBxQFPCqzFku5XvFilC3
         tCbsQSGxy+eBsXH4ZZ1ZwOu49f0hRwuOFNeazrM6Q3bxRonWQQdRDffjjuB+POcu8/ir
         P9MUycM03J6aag/DCgeSW+FUTJvC+YIkF77t+s2fwwPU8EnMOCKjI/APtzYS8kAB1xCo
         JxvAVBeSt0AmFDKYat04K+Jkkgg+zdRl3GFQqpJwSGxrsF0IDKOiRnllJaMQrIzDUTxx
         68fQ==
X-Forwarded-Encrypted: i=1; AKwUvBzI3i0yN9NvenTEE8tbkr+0FdzvE03QpieZT/H1wl+6jWj4J3JpOkP+BG6F651D9bLrO/4MAg6o6MhE@vger.kernel.org
X-Gm-Message-State: APuU4Z8ybso7RoqRIQEYXOgD4Tv0PE/zuoFPlRa7MMc+k6q+QXbuYzjG
	p6V5Ic7DgunlM1y4MKj32CxxxyBETJla2rEU94lDqMw7fXNTKB0OMsfBTVqUR17Rxtqe6+NhXr/
	go5P2BY9ai+wBJ+EZ6NjpF+cThFa51FLgwqQUKY6D2nmgx0/WKN0JIZuLs+f8Gnlp
X-Gm-Gg: AYBFou2TgW3RZGpbZVdBwgH5HV02l6u0q02MFVy/915AxKHErKN/QV/iggXz4cWuEr8
	Qey+bCwIwJWZmnwRnekcP1D2RN5k7bam8btoQKXkwSavVbpTPgazYcxGbKeZv8bkCfYrOb7VrfZ
	N2Lu7t9kaJGKYMQJpGFUAwI4r3L19o1E6Hubm/2m9BYrjL0V+XdTbORM2GTijcCRN1OMURyGQx3
	/rdk5lfFjVrQQgwhV46AZHXXt4dDpsgCbjwkQfHpawuYzmF/Ht1Df5IUJEuMN3vTLgdaITtEy76
	umqpXob0WG+ueNk5Jhw9ka2Iny+qZtcw7/A5JwvNq8xUwSo87olErcYv17WeTVUTPUjDl7avmc4
	hvQksAO56fx/bQD6El+O1SUIDZlgDSj0d/NLN1fyuHsoEuEvW7OeNTzvjec/9i3m78C4TPSWwzY
	KdFyeY
X-Received: by 2002:a17:90b:2d50:b0:3a7:96c1:f6f6 with SMTP id 98e67ed59e1d1-3ae6effc303mr9304072a91.34.1793604721489;
        Sun, 01 Nov 2026 23:32:01 -0800 (PST)
X-Received: by 2002:a17:90b:2d50:b0:3a7:96c1:f6f6 with SMTP id 98e67ed59e1d1-3ae6effc303mr9304044a91.34.1793604720766;
        Sun, 01 Nov 2026 23:32:00 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:32:00 -0800 (PST)
From: anand.tiwari@oss.qualcomm.com
Date: Mon, 02 Nov 2026 13:01:32 +0530
Subject: [PATCH v3 2/6] arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697
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
Message-Id: <20261102-lyra-display-upstream-post-v3-2-7f660c3b622c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=3295;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=SEdAsyTt418trjKLHtxucoXBRSy/JerrxkxW9XWhnj4=;
 b=0qJj4A2u59oReDexzdM9x3eaVTMCYzBR2drMDK5ONPsUDXgsZ9Vbob+7xYOi3xcEqtfis2HWt
 9heqCNRD7a0Cm3/6qk+7mHd4Sd/AdilVE0ywKoK67r+el8NW+Sg85QO
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: PjdPZAVW7tI4T7cjv8wZaZtif0NRZp__
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae83c72 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=mwcz9oGRgcW5ZIR5_CEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfXxNhWhVg4KTv7
 HDHJqA/p0hde7c8zTVxd1B1rwuuB+yUP5SQLUdsLnYOC5LLP+tm0X4jNPmiW2H4vQ2WC1HpTEhH
 o56MBEsyjhKsA+uvw7/5aoabsqe8OuzoIV8IoRMSJq7jJA4Ak+AndEq/r/N37tQ10wXZxVkONWC
 tnc61nqar2dm92H5lMv28ffM1Jb+5xekgktP5qspj9f1CvAaqajXop1QDlag8hv0lZz97/XOpOH
 GzZKry+PORHTiulwTkd5LcUlc3UBiahaKQEnGEfOIRDn1wb6tUtg/ENRFgoHwM+TUnzYH05dYss
 t1GuTLz5O1ivBAuUg7RhtSrIdYUlGYPfnKYTvUHoCeBtIL9JDyd+KfoyFA6Kc1FikUwvIf7ftcE
 FSvnEakV2w7KETNqS0nXJkLi7/6b5gpg243lU+0TatG5Kw0UiT+Lo7z1WnEhTfZi3gVHmIcVO5e
 q6k6lr+r4yclZomHB4w==
X-Proofpoint-GUID: PjdPZAVW7tI4T7cjv8wZaZtif0NRZp__
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX8/6eVLm10C4E
 1b+wgF4oijYkN2PtvbP1VW4cZzSYEfMiRsunhjSJu8yNqXQkpmgNzsiCEyzovJcwu5DaZKOES9V
 SY8gfBbZvA+Im3ybzQy4Jvfx/kg8o/w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay for Qualcomm Talos Lyra EVK, to enable DLC0697 panel
when DLC daughter card connected to DSI0_B2B on carrier card.

Configure DLC0697 reset GPIO, supplies, pinctrl states and GPIO
backlight controlled through TLMM GPIO 2.

Disable the default HDMI bridge and connector in favour of the DSI
panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
 .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      | 77 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 243231692866..709a96ece14e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -476,6 +476,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
 talos-lyra-evk-el2-dtbs	:= talos-lyra-evk.dtb talos-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk-el2.dtb
+
+talos-lyra-evk-dlc0697-dtbs := talos-lyra-evk.dtb talos-lyra-evk-dlc0697.dtbo
+dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtb
+dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso
new file mode 100644
index 000000000000..b79e54459725
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso
@@ -0,0 +1,77 @@
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
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
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
+
+		reset-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
+		backlight = <&backlight>;
+
+		vddi-supply = <&vreg_s4a>;
+		avdd-supply = <&vreg_disp_3p3>;
+		avee-supply = <&vreg_disp_3p3>;
+
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
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio98";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio118";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio118";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.55.0

