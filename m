Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793595509;
	b=OPuswt97CWRAsCK3FuQ2+Fxv0TJZsIlEURnT0LUryvmY6hv2ppBfeVXNzOb8BEyfF4Uu
	 GWXZXHSCMjn3nMEFT4qNsrU3gEa33nlkeee4rNpR2qK3F0fBSFY/m4jmgUGL8tQH9S8sw
	 vpr69nAU2/1Wx4S4zpKUiwMgmT/u7N3XWlrUnKpvH5UPQmF66cA4cHC+ODP9DHyUFuBra
	 rGRWXzltYFdzq+SZHPOXegYxvE6mwX22VTLSRcJ07VYQvODH4nMD11tFhxD0DqQIcns4+
	 CJldSjhajstnu/EAUlB0/B1TYvQlFUidQ4EpcbMUVo+uZeEOHfQIb5aTm0tCx0DXSvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793595509;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s/p0jvuTaezOW7e3Dk7zhXOySIz2zUW5mJL/UjH77G0=;
	b=c9Zav4N9Xy9xhpbSNIdOi03SFAUB6c11Kcp2p6EQBhY6CETD0qyctteScVAGNWpBUFdj
	 /qcLOecDnWWv60+9nZKbt2BOsajr1Ut+xx1RkWTMhukR32A7yLeBOj5f3qQdgB9AtDjRH
	 judGtJZ0iaiFnNxllDVYUfjtnS+aZCOxFyLW/n3MmeYgVOIOzJpBjplcyfNr93QDzOKKO
	 uG8zdSzWShIUjh4BPTNYw4f7W0zDpJESvGnKkQFLNJUPUOn0FI8wMT5TY4rghhuc/eN8U
	 n0ovv9LwOA1pBEX6GDebyYc4KRIxVuULlN28Pq5hZKeJW4OzGQ6d6yr7lHTA5xJ+Jgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BOo4WRQW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hOGwTjya;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92049606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 04:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92049606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BOo4WRQW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hOGwTjya
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vAhW3768705
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 04:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s/p0jvuTaez
	OW7e3Dk7zhXOySIz2zUW5mJL/UjH77G0=; b=BOo4WRQWfSrs8FYBpl9355bC5LI
	kVFU6oylz32S1Sd4o42A9GNohtWD3tb+1riksiUKA8C03sh+ZTrpxZi3wbvKWm7W
	stNTE2VrKLUT0QUvn1y9KVHJX2u2WThLM5yKQo9/OaGITe6uIA29m7zMgygCh+ZG
	iQYbRztbSPutL7bTQHoRPZKmCcG57Te892+7UjXBCQvgXaiRlQ9hRIkHa4qt4zvR
	8GMvrFfljTszded44b+jn5EWAJ1n3+XZbg59ZmzLLetMnq+ECqc1BiWDV/S834Ux
	Mq6T9r3Up7gXt0xeXajcb8E/kKnKZwlLj095dxeBtU7WgGmRz0ZCM+z970Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rwarb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 04:58:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89ff20e3eabso182616b3a.2
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 20:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793595507; x=1794200307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/p0jvuTaezOW7e3Dk7zhXOySIz2zUW5mJL/UjH77G0=;
        b=hOGwTjya4zhLzgAUOEJpfLl6txQwVmj/P6lyJF6kNVjhV6PZQXADxZ16xvgdFw2msJ
         Uzjszy5JVgwo0vxBxkMn0nONKMLTaccc4z45WTVq+61IkFSHnNgqLVuWSVeTgZrmo8qY
         CTOz+ZFMBYebamFNMaCiBJkdYnb0hxIGa96QeQBPWk9KDByANchyCAANb6VxXmA0DEnP
         1dQl5CHmPsKBtPG16m7T1SZX6bbr7Z4bxnZ60u8zLkIGNiATXjOgu+Prk9mH/ghWHL1C
         R0gGyJehwlscbMzgp731fSTo95x1u2Ib3ootZcyr9REYZ27u0Djlj+FeMSfEwUbFEQvk
         iiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793595507; x=1794200307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s/p0jvuTaezOW7e3Dk7zhXOySIz2zUW5mJL/UjH77G0=;
        b=QbDAKYOddpyu32saZJ+7PjYuijtXywHSTQqJ6aQrfg7UY4QrBQKED7fEqZ1BpXtNqJ
         QZZVDmlJBy0zkUf+PfQ1xWv4QtnXNt2NxarSIa5DJo/mFSKH/kTS1dWQtWSbwFnrHjqm
         Vu4DBhc+ejyKnCCShi+JiAPpic/G1ZO+Lk+wf3cQTOTNcV0f82RKGNARvIqvLqNSRg7I
         uwDuf1unMa7PJS+PSo9l8u85id921DEB/YyWIoOgxM/3JUjDkf+quVOy7vCgyFvcr59N
         wWMfukpiyR7AKb8HCyf0Oz0uKhRjOMUaaZtBtlyLzR3pZbzDUJOe+28p7cIw/mrbhHG6
         e64Q==
X-Forwarded-Encrypted: i=1; AKwUvBwYKRxVVvhswLgBPdiDzCA+OC6ueVgJr8tD4uJn/Fbcu44ZKWLZGP40Or5F6RVxa+0oIg6dEbU8H2fb@vger.kernel.org
X-Gm-Message-State: APuU4Z+UG4igLCZLT58pPvHAWqN0G513Rd0W7EtJ40SSbmall/o6tyMh
	IaCi9bqb39zBjltJF0hgliP2mvTvFu6qyAX7BIYrhdmU9EuXTxgeDlcZ/8Bk+4yaVyQ+Vqm6k5Y
	cxgeLNkB2AKWvHjoaJRGsWTZfDyDJbSeHjxvjugjPYmq5LgmFt8x4sFnvvdooIVN3
X-Gm-Gg: AYBFou1O4MljwCDhoTEx5VxP4yOK9UzZmdxUu+9Upn1Ik+5bmj+6acNvyeetpcAI2Id
	4NogTp09n986rq+WYJOQyvnk4QhoLoaZEYFeUw1MP2IXVps/64oN+IxNIHbcIU6Sf8pmWmBWEua
	1E1yIJ2z+o5d3/Xbgn85lgzNtbdvGkUQOCX8mxAw5ZAtX/SkDwFYB9BYdDHqxmrvndHxE4z/aMn
	LT4R8JwjSO1eABy/XNYzuLRBfuF+b/vBJqQOz1lzHaT407Qeze+S0lnoz6Zqz6FOk9FizV5+QYy
	aeVpIMmWX0wE6n3x8MEA1uH2aLzaMJgkcoJXPInRxZvAYTisJgZW5uqn/Jrlr4s11wep62u8KKV
	3o2ArM1RWTohHZCvzM5cCm5EZVmihnX3Q9jFZB/3D1okz4zbg3Fx9U2OkUab8lm0C4Tn18SiH/G
	hhOQ==
X-Received: by 2002:a05:6a00:6d43:b0:8a0:89f2:3357 with SMTP id d2e1a72fcca58-8a9bcd04e01mr10373323b3a.2.1793595506994;
        Sun, 01 Nov 2026 20:58:26 -0800 (PST)
X-Received: by 2002:a05:6a00:6d43:b0:8a0:89f2:3357 with SMTP id d2e1a72fcca58-8a9bcd04e01mr10373290b3a.2.1793595506214;
        Sun, 01 Nov 2026 20:58:26 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d04805sm1485452b3a.32.2026.11.01.20.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:58:25 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v4] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and Bluetooth overlay
Date: Mon,  2 Nov 2026 12:58:15 +0800
Message-ID: <20261102045815.2938940-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
References: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: l2WozIo3BcxzLMmPZ8YK3I0LvuD48QoP
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae81873 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=K6LXAmJzQkywega_7-cA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxOSBTYWx0ZWRfX6VHKPnFjPz6+
 lc5K0RGOOz/cQxPHPxGrZes7l7I2qehnnvtU66smDTdvLV9nHWh0tfGfryFcByLSaSuVGxCBDHs
 WEka8BYVw9EoW5nUJzClEE3+6o6DgfI=
X-Proofpoint-GUID: l2WozIo3BcxzLMmPZ8YK3I0LvuD48QoP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxOSBTYWx0ZWRfX5Wx6x9xJio1I
 O9utP2wz9JhgCfzxkTem0Pgl/o8FjP5nmHJ2V3AO+P8uaH8XE/HDZg1ahyfouHDNuZtl428kMwP
 Few/Ol5WA4TraLQa/084TIF8btIc4e7X0s3AyzcvBk5smeArBmdac6J6u6inoaE9AB5WYzZl1tJ
 BdLnS+ZieI52hNEJDi5dPZ1CnV0wDUe3stIV6LHhTc5hX5c7CoHABq8X/wvRGUlP0Dyl9S6RGaI
 Azmp/pjQPZF7IQb0VHCRx0ERqbRgtJ0Zv6ybh5nzCS9AjS3y+N/Z7W/ZJnwRkYUd6P9ZOC2X2mK
 ez9y1S8WsH31+Rg/5GHGFsxHCWP8Du1MGjG1aGb3gtWhBUxc8/hYaMs1QOTxr8C392UZRcWTz2c
 59fp7RTkTNT+Ra4vjCbzzJts9xaEo4cxmQuxrAKth3KWRe+9D8jcaryM1UDf1pdZAFqDZlcpSj8
 V/LPxFbQMTzl8jx3jOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020019

Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on the Qualcomm
Shikra IQS EVK.

The Shikra product design supports either the onboard Apache WCN3988 path
or the M.2 HSP Cologne path at a time; the two connectivity paths are not
intended to operate simultaneously. The overlay describes the board after
hardware rework selects the M.2 path. Disable the inherited onboard Wi-Fi
and Bluetooth nodes when this overlay is selected.

Describe the PCIe and UART connections through the M.2 connector, the
3.3 V supply, the W_DISABLE signals and the PCIe reset signal.

The Wi-Fi PCIe path was tested with a QCC2072 module. The overlay was
applied, the link trained at Gen2 x1, the endpoint enumerated, and ath12k
started MHI. The Bluetooth UART and HCI path was also tested and the
QCC2072 controller initialized successfully.

Link: https://lore.kernel.org/r/20261020020925.3915548-1.linghui.wu@oss.qualcomm.com
Co-developed-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
Changes in v2:
- Drop regulator-boot-on and startup-delay-us from the 3.3 V regulator.

Changes in v3:
- Drop the unused reg override from the disabled TC9563 node.

Changes in v4:
- Build a composite DTB to validate that the overlay applies to the base DTB.
- Add a label to the WCN3988 PMU and reference it from the overlay.
- Explain that the product design does not operate the onboard and M.2
  connectivity paths simultaneously.
- Update the validation status after testing Bluetooth UART and HCI.
- Restore the TC9563 reg override after runtime testing showed that the stale
  OF node otherwise matches the directly connected QCC2072 endpoint.

 arch/arm64/boot/dts/qcom/Makefile                 |   3 +
 .../boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso  | 106 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts       |   2 +-
 3 files changed, 110 insertions(+), 1 deletion(-)
diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 71f9822ad942f3854f4ccaba9cad484298c994aa..c61bf4577d0e67a12e17f7537a0b4dc91c8e5150 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -427,11 +427,14 @@ shikra-cqm-evk-hdmi-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-iqs-evk-dlc-panel-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-dlc-panel.dtbo
 shikra-iqs-evk-lvds-auo,g133han01-dtbs  := shikra-iqs-evk.dtb shikra-iqs-evk-lvds-auo,g133han01.dtbo
+shikra-iqs-evk-m2-wifi-bt-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-m2-wifi-bt.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-dlc-panel.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-lvds-auo,g133han01.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-m2-wifi-bt.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-m2-wifi-bt.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..7d65e67bfcc2b05259e01e658d007274cc4f13c4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	m2_keye_3p3: regulator-m2-keye-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_3P3_KEYE";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&qps_gpio_expander 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+
+		vpcie3v3-supply = <&m2_keye_3p3>;
+		w-disable1-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 60 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie_port0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart8_ep>;
+				};
+			};
+		};
+	};
+};
+
+&wcn3988_pmu {
+	status = "disabled";
+};
+
+&i2c3 {
+	qps_gpio_expander: gpio@3c {
+		compatible = "nxp,pca9534";
+		reg = <0x3c>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&pcie {
+	iommu-map = <0x0 &apps_smmu 0x0800 0x0 0x1>,
+		    <0x100 &apps_smmu 0x0801 0x0 0x1>;
+	vddpe-3v3-supply = <&m2_keye_3p3>;
+};
+
+&pcie_port0 {
+	compatible = "pciclass,0604";
+	reset-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcie_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
+};
+
+&tc9563 {
+	reg = <0x1ff00 0x0 0x0 0x0 0x0>;
+	status = "disabled";
+};
+
+&uart8 {
+	bluetooth {
+		status = "disabled";
+	};
+
+	port {
+		uart8_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
+&wifi {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index e4058a58d05f3d7bf2f69ab945ce5eb6d6635320..779247b7f80af61a394d0dbdec23411ce5d5cb04 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -164,7 +164,7 @@ vreg_wcn_3p3: regulator-wcn-3p3 {
 		regulator-always-on;
 	};
 
-	wcn3988-pmu {
+	wcn3988_pmu: wcn3988-pmu {
 		compatible = "qcom,wcn3988-pmu";
 
 		pinctrl-0 = <&sw_ctrl_default>;
-- 
2.43.0
