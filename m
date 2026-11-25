Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590789;
	b=AU22qxXc+Z/ZW9yhMkxEPkxB81PV+kR+Lci2KLFcz0EEw44MPpkTRecw6xDvCc4tjOaN
	 5VtJ3y7qRJ+r8k23GgL/6CaLgcAMd1Ucu/gT7hqmNl9hDNKJ7WOPdMu1fcXQGgZIURJeu
	 SzniS4yoK+d549d/lU50uOF1COr4sKUFB/iHuAdCcWDRingGgX8mFctGspnnG8mUn7KX4
	 iftxTCaEqqtEmSGYwzF4P95JNqnE/7TlzNwZG8SbT862KbeQwe17NO3ltYdTcurJb7jfT
	 araOksMkdeRVoVtgTZuwTneNpIH6ChvcIpKA/j1/AAIqflG2JQtdSnRysB+deEVUQSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590789;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=z187NNFVs++duTwL2d9zlzyyvZbXrRdA0stePHS1Wb4=;
	b=aI7R2nSxK6ECX2y3asYxwRbdCABCRa1PtPOz3BfZtAZMdgxjBUJoThnjmh1urBVOrxaH
	 kMru8iPP8fIp5qMK5zJ1o0pwsc8K+gu05FLaJH3z7Q8f24CtNNBS+0jPgBz2SKV7PWx4F
	 KIgcLfYvFqUAZr/kwC/p/opGFTu4EsbeXbweTw5RSKP1VqzD40We7BCk6rW7a3+6M5SJ9
	 rb5ZflXzluNAhFaAIi925eAd5/w2P7ubxNy4CLGZ2Z9ko4G274XbZfopmGH2/mO7mSOHM
	 RWP8abaKe0XOG3tuE6KrIQ4x18ofNX+9qSnx2uss74kci58TKeqdqx/yTDdTthSAuxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PztFO77K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zh4LbYWp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3FC606A6B8
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B3FC606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PztFO77K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zh4LbYWp
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP691RY1617603
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z187NNFVs++duTwL2d9zlzyyvZbXrRdA0stePHS1Wb4=; b=PztFO77K9tDUsde0
	rwlFKkoHdvhYL8Mad+G5RB0JDvuLva6fYqOcgnUOOnCuJAwCh52LHFtVHRziD4mw
	cpCqWOAc+AsWakXkcL0crMaClkCiGEwTe8eS1xHCmDsrPetfBIdpaNdQ6Bd6LgYy
	KQrPzy41iSO4fbUp2mgvI79BTv23hyXR5P75tfq3w2E7mhjjtEfXk8SZNjOehuZs
	6Galr/xximmPfQ0c8Hd/6ZD1+5RreNMZ900oXBBkzIw4txs9S8AWf6qErjGVgA9p
	8NeGQEucbR+qa+GAsPU/2GvyPbe2u/Ym0Bu+wZ0tpLauAeLt88xtKHO0hOKDEbNN
	R+M1sg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5efftyxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:13:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so4217738a91.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 23:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795590783; x=1796195583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z187NNFVs++duTwL2d9zlzyyvZbXrRdA0stePHS1Wb4=;
        b=Zh4LbYWp/1I7F3YgNHsJVLiWjLGpMolb1MMyozibwpVnac0RMy/kUwMGuPzSMDsxHn
         AsF0jWngBqsCqh8XglhC/fdTqYVSFQVb6V4R2h408y2heYBDLSmUEPRMyFMeHsQD91bD
         d6k/NzCWq1ftrGbpbzYLPiQu2TfPeWu0ulfhHwQNtXEoJ+otH15HZ8egbDWVGJUI3VC8
         0/z17tGdOPtgZjdeZvDfXMrzwGB1JjhEOJDATJWTOayZ7uxNiPUwAnSsFSYSL/7tL4ZU
         CoiuCrOcgXuQBjsoHNjxS9APte743mTSqbEzWqaTfgsfF+Lb2fYYgWlJUXNnQQI4kjNc
         E6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590783; x=1796195583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z187NNFVs++duTwL2d9zlzyyvZbXrRdA0stePHS1Wb4=;
        b=gz0TGz7IeIqrGlOAl2+ZUHW8Jj58k1SlVGJfJhntKwJU+JAAy82OVXzkj2PYp5YwHo
         Kr5xn1H6BbEehI21Ng76zNrOCt4UiH0jbLnr/gCEVqa92M5lf+k5Ay2/i++iv3xtXLkh
         x3hbFkGdUIzhoS6WGBJ5C1Pnm2MQlWphIXe0a+Btt6uPrhAogt1YsrJqvL1lE3PRKMLf
         XE/BBtkbIv4E3CK4XfoVEJDrpPhdd5C1GVce5/dyn/SF1hgnw9t1VreAtdQ/YbE8eqe2
         656NP2GdTMGc3MusKkLFsaPQ2fsWg5EnQ3mmfmonPTYPF3EHphc6s85ZH43E2SQDS32W
         CyXg==
X-Forwarded-Encrypted: i=1; AL+hErH9Mqfr83nTSqF74WDALAXOABirYEKtGXP7/iTJtamMWbEWetorsS67cQhLFAru0G+NUWsaHG3aAhEk@vger.kernel.org
X-Gm-Message-State: APuU4Z9QRKnZ/CALAhbm2C6waua12Rh0xkyyqyCgtCyWyMOn0rd7imcr
	zsUdApVhEA4Y6pQOgFKCoL1JQuIng4kWNpu7TxjsFhcuGjJVP3gVnzXiVR6SNtY6/OmmUjGvM4/
	goMyj9eOcgvyp5AEJ9Q0GkdIJjSvxcTb2jo6SFGHSQgOW3pKe+fSpUZXIIJZgzKDI
X-Gm-Gg: AZFdTZdTBoP1mchYmD7CAHtJrU24XkuaatNojOTmDzKn74VbBPtYBAxESqCu/ernjJs
	RD1eHTmzrFNK6gI3L9qMqlcwqSm0/+iD6GOQDderLcvXunAYtigJVZ9et1HkDMJE+Kd3MRWJ5NA
	GDTD9tDmOVcvvaZXLat3kBltXTwusKQsbqdndgDUwl4foqEqDIm63i6x6/vEg2cQ1uRb/BV+CyL
	aQ6VnFA8sLLVPcLuaTffE19KGvDVluhpjA363Ns6RRVeY7DbtmuVMFgq8HFV7mP+HvbgeiECT9q
	qePumTxfDxP8KoVJAlGwxL2OhDsCTxKfj0HrRaHVAjBLhtt0YtjI9/yBSBypTm9NPEANdOutk80
	nC19U5hxfJ9JI7zNGL2fYOnaH4JJEA3By5MDxmeVtec2nLo+L/FBA8q/6wum5TkGjXxPRMIQ=
X-Received: by 2002:a17:90b:4a48:b0:3b4:1884:984c with SMTP id 98e67ed59e1d1-3b41c7b573amr15976523a91.6.1795590783356;
        Tue, 24 Nov 2026 23:13:03 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b4:1884:984c with SMTP id 98e67ed59e1d1-3b41c7b573amr15976488a91.6.1795590782804;
        Tue, 24 Nov 2026 23:13:02 -0800 (PST)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0575d9sm8224496a12.25.2026.11.24.23.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:13:02 -0800 (PST)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:42:43 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: talos: Add Talos Lyra EVK board
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
Message-Id: <20261125-talos-lyra-evk-v2-v4-3-73d768714a5a@oss.qualcomm.com>
References: <20261125-talos-lyra-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com>
In-Reply-To: <20261125-talos-lyra-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b068a80 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=X4tYYTE4NjiRS8MdoAwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyOCBTYWx0ZWRfX0FnJ/w30us84
 UKoetqVMtfRXECEIeRrUu3uNMme5N3sPblMT/XpWoK2CHtZrkRm6TTsSRDy9gPOBgiFWHL8Eecd
 T/306SLG8nBi5UU3e/i454l8zMcp8oULSJaejgx8aLWpnrMGI7D7PO4mz6a8a1aTvdd4jC7deyJ
 bNmC4k9grcxzbMOmC4gMJ0RdEhisGZzulDypuB+uu4bxW6PWdFqBwE50yoBCfcrhQJJ/u6lIauV
 yJYH1bjY1+XzN9ookvVJ6ezB6+ExJEr1myAhZBYwG2HcdbupW5aBUpacKqwHGgZOI496ZrNAjYn
 ybyCJKTHy3cyP1ieLHvP8ZoNi2niAQb6Tvh2rgGR+nas9U/+xJbjlpv76h0PKbR/vgF1fC/or81
 q15gFhvgbAyp3noSOynk7J6B/6/9Pp5ZTAdSEg1HkOrCjIx+14HB6E4Ob4gpahC4d73q6RCYHxZ
 GLvjxPQTtqYhgzxTUeQ==
X-Proofpoint-GUID: 2RT1A4vfwmVUfwRXJqsCMyOKXptwoOXz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyOCBTYWx0ZWRfX7PfRENOkdnuh
 gUqvpU5E/CeyrQfyFoV55JNq/5geds7lZm3fWH61r92w0RnllSBDTGG8ghnCKKciI7AKh1lY5eN
 SEp0J/2F0MFTvI+7MJ5u2hEoauGPg6Q=
X-Proofpoint-ORIG-GUID: 2RT1A4vfwmVUfwRXJqsCMyOKXptwoOXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250028

From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Add the device tree for the Talos Lyra EVK platform which combines
the Talos Lyra EVK SoM and Lyra carrier board.

This device tree adds board-specific peripheral configuration on top
of the SoM, including:

- Native DisplayPort output
- GPIO expanders on i2c5
- SPI-attached TPM (ST33)
- USB host and peripheral controllers
- Power and reset keys

Also adds a talos-lyra-evk-el2 composite DTB combining
talos-lyra-evk.dtb with the talos-el2 overlay for hypervisor-enabled
configurations.

Co-developed-by: Akash Kumar <akakum@qti.qualcomm.com>
Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Co-developed-by: Vishnu Saini <vishsain@qti.qualcomm.com>
Signed-off-by: Vishnu Saini <vishsain@qti.qualcomm.com>
Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |   5 ++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 111 ++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..243231692866 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -471,6 +471,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 talos-evk-rpi-display-2-5in-dtbs	:= \
 	talos-evk.dtb talos-evk-rpi-display-2-5in.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
+
+talos-lyra-evk-el2-dtbs	:= talos-lyra-evk.dtb talos-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk-el2.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
new file mode 100644
index 000000000000..bd9980b9259b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+
+#include "talos-lyra-evk-som.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. QCS615 Talos Lyra EVK";
+	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
+	chassis-type = "embedded";
+
+	dp0-connector {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "full-size";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss_dp0_out>;
+			};
+		};
+	};
+};
+
+&i2c5 {
+	expander0: gpio@20 {
+		compatible = "kinetic,kts1622", "ti,tcal6416";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@21 {
+		compatible = "kinetic,kts1622", "ti,tcal6416";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@3c {
+		compatible = "ti,tca9538";
+		reg = <0x3c>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	pinctrl-0 = <&dp_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&spi6 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&tlmm {
+	dp_hot_plug_det: dp-hot-plug-det-state {
+		pins = "gpio104";
+		function = "dp_hot";
+		bias-disable;
+	};
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "host";
+
+	status = "okay";
+};

-- 
2.43.0

