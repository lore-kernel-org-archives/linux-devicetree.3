Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793452279;
	b=fUaWJuzOD8t3FYFaW42RXEGR+4NZGZoA1GyJLKLtMbocHnvW+kS6oNdHGL3xqTdYSiHK
	 PJaJZn9jQ89SK62Diub8/eFAl7gcbMYp+G5S4HIy/WNjIVFmnl4WEDnpMvjl9JO4sbrMS
	 8ZrgoWvAh1HqWx4Y3p4MwuLqA0OYlPWtiCH6tRtMGjDMBZyT0daivn+g1bOTbZI3YZd33
	 JQNmacpBIOSftLAg2g5zqCrUrvXry2EXCx/iiGr1BbWiIZH3FmoTCptEjYkPgFZZn/oSZ
	 m5PjFwsWhXW/+4Zfs6WW5HdyriKmCc84ZRg53Bk4jfBXUeEUX5P4brCLUH2ULmQ4H8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793452279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WWgW/g4YO7586v7SAbI7xaWfELdoMfth43jpoeeiAQQ=;
	b=Vcs9wkTGIEgszGBtHYWuSwvR0SJVntVjmXISLB5O5uEveFYawvHpe33H60Ns7364FtHA
	 oBJsmxvTH5wiQoDOtmZlZAo7wMR9nj+kvbRCOg1wAcW2Ww6LQ2wTrVw+ewwcK010YQ7hP
	 cLUnL+XwPzQtnOxvcNskwmCC2a/9uVMTDI7wlA+dHXSIoCyf8EBYW90vnqOm7rvsA4Yho
	 jT8uK77iMCt9MZNwAifb+jX2Lv18+Jx+oyIbCQtvRVym2g89ocdbabrp4//JEnq5vqiBR
	 ojOm/BtI7C26X0c+GLDcHc/KvzsngCzWiV4uxoBfLcRuJVe15cz/ZrovloV9NViy7Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UJycIeZZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VOqQ6Z1j;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926D460A2603
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 926D460A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UJycIeZZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VOqQ6Z1j
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD04bq3208646
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WWgW/g4YO75
	86v7SAbI7xaWfELdoMfth43jpoeeiAQQ=; b=UJycIeZZOVEJM23TomL5BqvlIvl
	CRAa9LGX+7B01T6CzVsSaicjM1IPbumDR52UvIbWpTzbzOgplUzJ1vEyYw4mXOE4
	6aG0W3IuQxsk8xbiu/f3EWd2NB+DwLbJt0JRmm9niFhpdJ1BAps1sFCK19Rkvvcs
	Q9RdYDjE0AVQWCP2AaicJmXny65KzDroEZLbq2/gjhrrT2OusZ8PjJRs6lZXv26/
	qqS81/+hhYgazlQnqjsDPN/9d8Z9FdzuBmVvnOprZglotOd241VHuUBisBVaDyN1
	8ENfKDAvxCzaam2AJZIjkV4FaXa2u8ILq+LoAVMZMfnGfylk21Q1i8vNPAQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rsa0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:11:17 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1663fb7e005so1863056c88.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 06:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793452277; x=1794057077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWgW/g4YO7586v7SAbI7xaWfELdoMfth43jpoeeiAQQ=;
        b=VOqQ6Z1j/geTkmPgSXEfIOVxI+KszftaQ6ti6vJZYloop+wDMN1rXAAHx3TB9PQCso
         iFy6ZMMKLR0cJ8UJtEReHxYnBypRjyc7PMdOsuVi4Rd1tm6oS/mWwyLwuWdsZpQZe+4T
         dzkGyAcqYWN80ToAHcmsnkdn/uZsSzdGwVOu/t/tjdbyvGjFqQP9MGty/hOaLLjyHBLE
         1WrhxODSIWx9c2pOiGTPDsFclENt2SZqSfovOG/F8zhXUk68a4cBe4noONqDhdyzKrej
         2MhEL1O9Q5RHRnfBw05OM76gB6VHvJYWommAmKvhAZet1Uw4SNY+7xHD08906xAuxVjE
         St/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793452277; x=1794057077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WWgW/g4YO7586v7SAbI7xaWfELdoMfth43jpoeeiAQQ=;
        b=pefOxt2gjKOYHC370CEiAJppn7h2KyUSTTyA9Hw++4bFytMKN4cuj8TTlHvyrL7Lfm
         T+hjzuuqfvmNiGZbM31hm7+FvRoWKKobh52vmunXPM/ctZlE+Ob6Mzo08+MFzKTtcwR9
         BQ1c1VVx2TcIRZN6ONZTQeGQr+3gBUA/Y+V/7ELVPeE+CTGceCwxXv84b640T2cd/qX6
         BQifRloW4a8W70q8rpxILws//tckfAnExW8EVZNME1a8MdkaBPeQAFVQ/X10aHT92Qsd
         +qx8AohSxvC6XDxIgCRKpP+dQSXuCOyaoaJXOHRdtM2YxnVcwyfsTBaIx3hkaB9xa3wV
         3pIQ==
X-Forwarded-Encrypted: i=1; AKwUvByPLX+3iIU88qIMr1ZcdwQOwdKtrMiLQKWKzErEjCO/xHPPEhfFHlKUFfo1iKcBxb3B0YmB0obeHde4@vger.kernel.org
X-Gm-Message-State: AFq9FYLy6R43zyB+2wOPwk88FqeZ3y5+xBXoMiNK8xPUfQoeQyXyi297
	4rz68oSW6PosMBKNN9e22E4Kn6xSTO9kYx3MklQJ3gVZFTn0J9vFK8V1uMPe+nEUeIMA/q8wlLF
	/AxnpndBmp9wiJsf3k+oO1cBUVknoZFA06sL/aoNjy217D+kJplAXwsPfUEuvZwNR
X-Gm-Gg: AYBFou0U8aM8RqovmpIHta3jqr7PW/ihiKAm2bWAGG1jNEvmKYXuK5B6tS7RUvErjPT
	VooGR7uhIt2eHRvxzNfDG2iA4SIsWnmcvA7DncjqZafaXHQTAIT5ZnZHF52ytd0dFf+HrQ9UZKT
	/DdSaGW/kMAOzTyJZ/ESE6NSNvznlqqj+id0zYOYiazmTSVRVced1R/gP6mAJlD9i+fo8zN82Sw
	v+uXPIm9Ht39oMvrDjmYg2mwkQxPZOyBFTAEvqo3+3CQcANfSbLl7vSnzQMOoysWgZXMJTiMcaZ
	vocDXHCtYLE1pvmae7OopUz1LR53psKEOLxbsNCC/O+eonA1SH2XYvbMlbE0XJ2WxOk/lbpIu0k
	dIcG/75ugi/UpyYiTC+0f/Gx/DZ1k3asmcidHrLEwU+q0AQAUT/VWOwBByTTZQSKuyKqU8WI1t3
	HwhONYsNhj1bNmOIGE9lWFAf9yalKM9qQk
X-Received: by 2002:a05:701b:458c:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1ac56c9fe8amr6039016c88.2.1793452276845;
        Sat, 31 Oct 2026 06:11:16 -0700 (PDT)
X-Received: by 2002:a05:701b:458c:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1ac56c9fe8amr6038983c88.2.1793452276036;
        Sat, 31 Oct 2026 06:11:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm15717872c88.5.2026.10.31.06.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:11:15 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 6/6] arm64: dts: qcom: lemans: Enable lemans-sa8255p-ride board support
Date: Sat, 31 Oct 2026 21:10:42 +0800
Message-ID: <20261031131042.1200862-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: f-5cWcqg8TESk5-6Oir6VxxKsE6HC0Xw
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae5e8f5 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=MNDMu2h6GyehcEZcpm4A:9 a=Kq8ClHjjuc5pcCNDwlU0:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX+tN+Mamx1JsW
 i3fQpnjg1S3AHVk44ww+mQL+D7kZyoyElXeWMTbQW/ab+CNZSuTa927q6p9O5wg7nAJl9yI5A5/
 6o0oivNYkV5xE9SWnyzQFb8g10vCFes=
X-Proofpoint-GUID: f-5cWcqg8TESk5-6Oir6VxxKsE6HC0Xw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX4e/ZG2adbYHW
 j2xhh/rgmMSu9b4RAqDNPJ5M4po/uacH0aGZDFvnHYovyA4lu7gfR2gVZYx8Rjo7/JG8Nha2jCJ
 PsGmNmDjcvxZC7FDiTIgtrGg2/nMHZ1Crs/186taGhx810f4CBFvT+R3BhqNdFJgIMrjAQM2B1I
 30NXbHIm3Z3aeY918jX/8NlI+GPGcnrM2tzCCq2SV5SnL+fuk8QInwPlDBo+uBJauDFZvrZ/A3E
 qUnX35Lb4j75ZpFsguGDMNAxHV8H/onrG7q7RowG2zu3kXzNQCbtA+WXinChSNdCAYAGlR1Ph3B
 qhhU+4140xBCcO3GKYR5eRyPd74olJJAL+63NQASdHxwCEUnSAMiJjFj+xuW2ZFMNf/+4TW6IxX
 ppK11oz0ZHDnGUb6nskdlFPxomzQ0E9FejyOZKLwYHgQL+owUDVaRvAe6+KiJjfTQzxCfS0QdG5
 hpMcQX53eg07pMI5ulw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310052

From: Nikunj Kela <quic_nkela@quicinc.com>

Add initial device tree support for the Lemans SA8255P Ride board. Enable
UFS storage, UART10 as the serial console, PCIe EP interfaces, thermal
zones for PMM8654AU sensors, and SCMI protocol nodes.

Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/lemans-sa8255p-ride.dts     | 222 ++++++++++++++++++
 2 files changed, 223 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..c2d2dc1019c8 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -63,6 +63,7 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-sa8255p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-lenovo-thinkpad-t14s-gen7-lcd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
new file mode 100644
index 000000000000..6f19064997a4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
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
+#include "lemans-gearvm.dtsi"
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
+&uart4 {
+	status = "okay";
+};
+
+&uart10 {
+	status = "okay";
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

