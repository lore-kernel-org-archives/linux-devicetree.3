Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE093AA4FC
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 09:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725945; cv=none; b=p9FDYVW9ZyWtGzTqUuD/nes9Jb6Rgldil4pVHlkGQxCDTt7p9392RCbit9UUzf94xMv4cQmbIx5X97J5lfbdfDxFYmgismAaNCWzChJkX2v069xQEeLYfSef523LeRxYyBD8rv68AAEhqf7ChHbUc/HGn43/01v/kQhYXDle9hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725945; c=relaxed/simple;
	bh=q9/fYu8BYIGHoPGtxljJvApKq9NqD3RL6mPsxNxAA7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKaddlMgJjyVV4WRuT/T/oquNrqjE8ITTF1s4icsU68HS8p5rY2Oa8CFBs293yq9QpXrdCqR21pMAOpn+2Gl0AvF90By7El0wXLYw86u6q3bYcqHFTqS6joUxDoRPOD5cnSdQy7KReac/9iWH6/vmEnZY6a2mtL6HwGfw93p4es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GUoNeo26; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RrVg+MuC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GUoNeo26";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RrVg+MuC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395kgeR1614268
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 09:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EVlCs/0BPHJ
	8JYcUe83wCYzdryGllNEPIB8XsVnkkd8=; b=GUoNeo26g9aLpOcgqIul8XSRG53
	z4z6o5OV56EEmjBQlpONHj3QrhKbG9NmUfMdClNWy8xS9jh8GirfDQfiSsVh2D3h
	7YZA0RghqY22WZom4zoo8lVfKLxS+bGHyaL9VOKTGXI2WF8+cpdZxqFXJEtuhugJ
	OkzEYhMNAtwGbGlxQpIu9YenzCnR/3SGOtOZgHKtMnsf020imy+VtfBQo1KYrXxD
	RDWcM1a53sdi5yDWeTtaAsvVH2naIK8Gok355Gqk+Wx4AMg00pNM/5AzoKXG2mVS
	DFr/IlymYKNpOrZxz35YMUzQJYHM1dCTPr/Z4W1PwCRbgI8CT7eBF2ueWag==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4de68v8qbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 09:12:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so2192414eec.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 02:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775725936; x=1776330736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVlCs/0BPHJ8JYcUe83wCYzdryGllNEPIB8XsVnkkd8=;
        b=RrVg+MuCqDGopk0St/kp6YkOSg1GA4xjRjMJcufbJDSsNafl4QAJcNICs+8FbfPxKS
         LdLxS7C7Z1sxYfqXQNUJZtnufz7PCv9DmD1WPq7c8e48IIw2ey6uEgw4BfwCxnXd/Wg4
         BjYHGYpIyMzOeJtmr+VfWx57k7vSkNFB+jNM7fnnOrAGD1STBD8FRsEcFXKOjimmMO88
         pKCXORQkO8EXbdSOnrzESRUk/OU3A0WBMe7iBzTmH63RchpBDHbQ+ZId6hLhCQk1yPRn
         nRTOL3WFq/gq/BWIlQGiBqZ3rKbUH1Vn4vI0L3YFmYCMQ97in6LH5A1XjvRBeJbF0CYu
         6GjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725936; x=1776330736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EVlCs/0BPHJ8JYcUe83wCYzdryGllNEPIB8XsVnkkd8=;
        b=KHh3n5kZfmmMbj6omITh6o8spHtsa6ySGQMx8X5qtTxEkKnrUgdkMrbn+nZ95Gyme2
         Gyb1q2lwT/9rBTAnBHsuptbYFSHD8jWoPArDR0Us6m3Wd1lEUvdcKz36PVH0IhWhVnF3
         lbCzN4K7uwX0UlJ0diJH+QJkmNui5/cFitOZ7wABgrEmpHX910eTpobHs+dLaQV/t/mI
         x6U4zBEdFTR8e6sps4df+Mup3gosH0JKpyviNSAodT+YW3jtskjxjeQ5iqKF+dkS+HzJ
         9QMvzTCEebEAGyzFWbAPjdvao6pDrlh0KFYwWbwiKU8l/anSHjXn6kkUtcqlzEyMDmHr
         9giQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwNFXIN1IPxDQ6VK7VsN1whRRf/FGoJhKxGkS6ywgjysQWEOLDQFGaZhdi8mUhfVeTkj/Ct5huwA8e@vger.kernel.org
X-Gm-Message-State: AOJu0YyU75Q3eTEnL/U1ZDzZzNUOSCn2IEv7LqrG4sh0sE6/Rw8ERbE0
	k/VjESNII0MmGEVb6a2V5dpqaKHKKDMeY/+/enZI9JmAmNdciaNaRym2YXRhK3MT40cAEQWCoOQ
	F6ZyoP0SFWJLhgblYxKIx9AxfZ3hhm8iDKrBy142ad/afCYMesywo1j84PBmi2NSa
X-Gm-Gg: AeBDietGWulNBSago6Jl2OLeN4W3bo2yztLTF5jL+WXjOtOKLqNFCQ5MshUyYDSxliD
	kD2bOSIhFo6cFc5rkjm8xhX+4h1EUSPl2a9RCXFE58bfJSPQVV6y1+/2QxYbsbPIoBlb0NVX/8/
	C/LgI5c96Rl3eR1DyuZM+D6Zkfhi87cgZsn0OF8QJb7OfvVeXj98Z6hMD6Uwi0YGoT6PVrDVPTB
	VWtVqzu3rDGMOVcR0muOY/JXw+VZPGJ/iuPCO9ubQeqUmlFFmxXor0D2Chykp3xwie1oQl0/4B5
	cAniIo4ViSLyM9YuRT7WL9Jgiik0/vZ47VPvty0//WrGkQb4zC/O4iHubZ0JDj87j2ht9yLdnRp
	dbZugWmQKqal05rZzkarzkCFOadhuspaIxrFFHdTVuChn572tKMCfQ8mP9yvAEeXq7cVmR7LFzq
	bRSE9JzQ==
X-Received: by 2002:a05:693c:2b02:b0:2c5:50fe:c795 with SMTP id 5a478bee46e88-2cbfc764f10mr14797992eec.29.1775725936093;
        Thu, 09 Apr 2026 02:12:16 -0700 (PDT)
X-Received: by 2002:a05:693c:2b02:b0:2c5:50fe:c795 with SMTP id 5a478bee46e88-2cbfc764f10mr14797957eec.29.1775725935464;
        Thu, 09 Apr 2026 02:12:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm31265060eec.2.2026.04.09.02.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:12:15 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 8/8] arm64: dts: qcom: sa8255p: Enable sa8255p-ride board support
Date: Thu,  9 Apr 2026 17:11:00 +0800
Message-ID: <20260409091100.474358-9-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
References: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UqTHF4ErWk1PnaqPBC6yCfhPnUXkdHlY
X-Authority-Analysis: v=2.4 cv=b7OCJNGx c=1 sm=1 tr=0 ts=69d76d70 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=MNDMu2h6GyehcEZcpm4A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UqTHF4ErWk1PnaqPBC6yCfhPnUXkdHlY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MSBTYWx0ZWRfXzerSQdzEa4gJ
 q8L7yw33YObtG2bYkBLESG0ZYXY34NIiiOY2GqCson+7ui3uBIe8Gpn6BNrx+Lukk9ev1u0C7zh
 iSDyQhOwC06MLym2IEhMBXAoR1AuFLD2M+H1sI392JsFFSH/LtpA4Q/xNosKcpXNTCFz7y4HwEF
 sYMGYdHFr/wwqgB1Njyw7Doi1gVPiJ5MWmzQ3mIY7rWy8qVBc0yXTDAhWUiUndX3HDVHh0bFkrl
 Vd2Dr3ySFzkIAVtRw/fNmfyLIXcciZqMLbNQpQ2qmeFLfIkg8/C9M0tSVDGF0rEUnqdAYZZ3DBD
 nDy2vpKb6x6aJB1uEei7tkjQWwDKRxHPtK0bVcpruvqDS0qmCZmCP8IvlnONrOeoSUyYkfRoV63
 kRBv2SEwgi3dILSZjU4AHZqGKOp3IDNclghv/Mp3lT7aaUjbMDHWQLh4gk7QOubiu8Lh20Rc8Jf
 YzQ3IWt0tay9rAU9pcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090081

From: Nikunj Kela <quic_nkela@quicinc.com>

Add initial device tree support for the SA8255P Ride board. Enable UFS
storage, UART10 as the serial console, PCIe EP interfaces, thermal zones
for PMM8654AU sensors, and SCMI protocol nodes.

Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile         |   1 +
 arch/arm64/boot/dts/qcom/sa8255p-ride.dts | 222 ++++++++++++++++++++++
 2 files changed, 223 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d69e5f3132c4..722532f4e82f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -201,6 +201,7 @@ qrb5165-rb5-vision-mezzanine-dtbs	:= qrb5165-rb5.dtb qrb5165-rb5-vision-mezzanin
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sa8255p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
diff --git a/arch/arm64/boot/dts/qcom/sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
new file mode 100644
index 000000000000..9b83ccf32664
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "lemans-sa8255p.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SA8255P Ride";
+	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
+
+	aliases {
+		serial0 = &uart10;
+		serial1 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	thermal-zones {
+		pmm8654au_0_thermal: pm8255-0-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 0>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_1_thermal: pm8255-1-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 1>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_2_thermal: pm8255-2-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 2>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_3_thermal: pm8255-3-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 3>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&gpll0_board_clk {
+	clock-frequency = <300000000>;
+};
+
+&pcie0_ep {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_ep_clkreq_default &pcie0_ep_perst_default
+		    &pcie0_ep_wake_default>;
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+};
+
+&pcie1_ep {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_ep_clkreq_default &pcie1_ep_perst_default
+		    &pcie1_ep_wake_default>;
+	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&scmi3 {
+	status = "okay";
+};
+
+&scmi4 {
+	status = "okay";
+};
+
+&scmi5 {
+	status = "okay";
+};
+
+&scmi6 {
+	status = "okay";
+};
+
+&scmi11 {
+	status = "okay";
+};
+
+&scmi15 {
+	status = "okay";
+};
+
+&scmi23 {
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart10 {
+	status = "okay";
+};
+
+&tlmm {
+	pcie0_ep_clkreq_default: pcie0-ep-clkreq-default-state {
+		pins = "gpio1";
+		function = "pcie0_clkreq";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie0_ep_perst_default: pcie0-ep-perst-default-state {
+		pins = "gpio2";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-down;
+	};
+
+	pcie0_ep_wake_default: pcie0-ep-wake-default-state {
+		pins = "gpio0";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie1_ep_clkreq_default: pcie1-ep-clkreq-default-state {
+		pins = "gpio3";
+		function = "pcie1_clkreq";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie1_ep_perst_default: pcie1-ep-perst-default-state {
+		pins = "gpio4";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	pcie1_ep_wake_default: pcie1-ep-wake-default-state {
+		pins = "gpio5";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&ufs_mem_hc {
+	status = "okay";
+};
+
+&xo_board_clk {
+	clock-frequency = <38400000>;
+};
-- 
2.43.0

