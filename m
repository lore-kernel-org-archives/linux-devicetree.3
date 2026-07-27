Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A371C84A0
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785172848; cv=none; b=MLgZo59XPfkRAN4ZG+vGiQg9fcasvydvI1+NDr3qK+ngDzMj+s0jnHpRdvRDBlTKuN7OsuvVT69Yy8iGOS4GXlPULl+WLIJO/fDFIxMg2ip3PnaS+rtoTXApOP/KKi7n6owh34kkQlJ/LPqclrjWW20xQV3e9NdfKbksDS4TRcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785172848; c=relaxed/simple;
	bh=ERejy0I5AeQZRWbox0dVXN7f0oBW27TLOA/0J/FlQPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jgl9Jplbm/fCiKY4aYnm5TtU3NDAUuhuyiimv8mKUrosON9U7JYE0DVgGLYpJ+1juH0JuuCTGeqPQf5KnO/g0kqj15g2WUimRdx2riQTX3O5b9IPuC1ATl7fuR27A3Ml5oE0VjIEOwyJx1DBn3s4h69Xa2m+IcYSvDO/q8eroGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lOchluCH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bLc6p3sS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lOchluCH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bLc6p3sS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlcGZ3414087
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRwbVuu9qXupmkfeu+8n2bHObbP70mrxjDBE9CsoIuQ=; b=lOchluCHNExhhjGi
	uipS8k1bwvflgUZlArP9Jrc0v9sQ1U6GwJSXGrJRw6satnXPtGf31AFtliEdpzV7
	qm6+tqPBuU7BOxF+Si06wRKKFQ7gBOja0if1/Ckxoa3JdETZb1Df8EIFVw7EntEM
	mo33E6BhcsU95jY5elzI2nQVFwUaOWsZTxOzhEbX+JiAYhGZm/+NPyP7AQhjKqPU
	vgE5xt13J9vOy2YfdrHu0hdT+WVzBs6hxqZmxi06DuAfEfg6wvTD62IKCeDyBKqg
	EtwYu3FSIGJYJcVq+j3Q0swVybq8UY7t5dpU0yJlSaly5OEKiY5Sfqa6QX81Kgra
	0EhRnw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v69yg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:20:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb835525b13so3251806a12.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 10:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785172834; x=1785777634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRwbVuu9qXupmkfeu+8n2bHObbP70mrxjDBE9CsoIuQ=;
        b=bLc6p3sSQWAm/X732oXmHBlXTj+5h+Ipt551/JkeWgJsB5K8X43cxk+6Q06eixPHcA
         tAsVW/6AnAXPxE47aJFfGcVkJDd+/QwyiuVvAfrq7Ja0qysPqtZb8Kz2uhA2Rudv1JRf
         4vtlyH7CKet8cazDSD0Laao0yyavZ4hFz8tMym4NoGs/rdEk1zbaDpoJa+x8K3sdb5FF
         qDFkgeRf3kEiz+UONnRSUdODZNXE5YNZxGENb4VEkfrkhyM4AH3jVvh7ZkC9+XRQ1FuP
         JUp0CWt2yLucVzbd+ymDGeZ8Y6i99iNvjRD32xNNCrkKNURENOvy5i0UcdS4rYyuUOKI
         R3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785172834; x=1785777634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRwbVuu9qXupmkfeu+8n2bHObbP70mrxjDBE9CsoIuQ=;
        b=ijcIWHrV1tj2RXi/SZVCbj+nuKnetMBU3zD40O1DbOB0mOb4XXjNS0OLkBT/bWd0YY
         G5h/8QlAfrDi7I3q1H+CRHA5Irhsbdo/W5Ev4pVKqsAr+SR7L0IR5fJxVqJW/KWue4l+
         HKqvPtsV1cp6qvj87/i2IG7dslBCuNoU/OMv8iuYJ1KhQbyFvs4/44nQ/gWpvfdj6Jec
         oiVRC28ZoFlOuFOLUUIpCij0UPpUztn5BYLxkdzLeOhICEBS4rJzL3iCrbm1hVblqR7q
         /pr/Cm4aAAjFXz5zo+o3140g7mzQXU8Ptd/3YweYx9t5z5wv3jnFBS+Suc+/nla2mmRK
         Liww==
X-Forwarded-Encrypted: i=1; AHgh+RoYlptOidG4/kHAcNXeRFSadLl8JPsLEFeKj6vAmAZKYg+wjQmEp2ECqgfJYYxoOtbbHl5YbQfdGxz+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvya/JsKUZ9Lq9hojRKH9QLWTaen9UnnP9bBMJXgWomDUmn9XI
	DKxi6Nv+KbGNeJiIz4/ddrN6uPG2cCSlgg5BFoxHVrg4vjxAzZUOYovs+oNxKU/kWMMnEJT4NAh
	0IO5Gmjn5dlCDnCvZLZji96W4mgesETxA2vATEQ1lCjyMhFnlHTD31k2tweaI6cC0
X-Gm-Gg: AR+sD10FXg/w4GjMAitnBp1Cpp9p4/Q7+Qmu7ZomuNpHLsr62Y8LRwU+iHM+/lzBWdC
	lBHNwsOL4EuA1h4FzPRb1T/leN74wJCPJKcs4Wm+BqGdqo6qbGzXIC9ClgFiXOw1B8a3n7fTsAU
	EzvOZ9IuXcxls/dLIkvtjGKDgn48ag9dwPtQWdUINtuM3qTstKWHiO/GkFllv3lBxHviHummJx8
	PDy5y/F4Xux5HOEXcze17oN99texf9O3GZ3s5rvDuhb6FNn7J0qDKK+sbKZSpFQrOyPRwHaxVEL
	k94FjcqglMjc9rADWMk4F7TqH+sxyge9lek+gpYR+eszfAgjbXSxOXFlBo8GBrXPzUE3LiE5JWx
	/cn+mfZoz86J0d3RVP/w=
X-Received: by 2002:a05:6a21:681:b0:3b4:75c0:3ec0 with SMTP id adf61e73a8af0-3c67daaaf88mr8664626637.30.1785172833978;
        Mon, 27 Jul 2026 10:20:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:681:b0:3b4:75c0:3ec0 with SMTP id adf61e73a8af0-3c67daaaf88mr8664596637.30.1785172833509;
        Mon, 27 Jul 2026 10:20:33 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm55892988eec.13.2026.07.27.10.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:20:33 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 22:49:14 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adc5_gen3_dt-v3-4-bc00223648f3@oss.qualcomm.com>
References: <20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com>
In-Reply-To: <20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785172810; l=7854;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=c0PHHcguxxcjxMobZ3HTDjKWbgs9vr1RzrQYF572YSw=;
 b=DKjpS/BQNZW3dSLj1OMTz0nkdJFAidiiA5VERWbVLhxkwNgo1EqwYQy2zDxR8IKxbCcWZ3lSA
 FoOiprFlEfpCFBcWvgb/wXVglPuzwoXT6KM9sUaHBaKmzsAWtTqGIsX
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE2MCBTYWx0ZWRfXw3/LP2XThKIS
 wgWggZEZm0Nx2lUeEUINzND027mQei5R3Y4nMeh77TMPqmrCZLq1oVaibC7kMwspPUibfj4hmws
 S2fymBws8VSmw9utsp4i5vDnmgdSVbM=
X-Proofpoint-GUID: GaPVQgzZ0r-DVyNNZp42SFWDckkWji57
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a679362 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=p8kwS5nKoigvnQ5N0NIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: GaPVQgzZ0r-DVyNNZp42SFWDckkWji57
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE2MCBTYWx0ZWRfX6taLU5Y1+MWn
 g5HNFzkKzuNJgkagbJxyUKQnfpdTjdrIax0rRyonPcA7FmBaoYqhtGq/sgeZoXui0H4crkOcEWI
 lqgQQZDoIOycDQdmqPTNA2Rg5sPg2HYCwFHGkJWhLDfvLezStB6HEfb4mw/BXPzgVkO5X2G9TNr
 LeaUP2uBV3Y1E5WNrsEBfcJiqTmhD7KJmSsfuEvHbZITlHSOZTLiIv5Z1Rmf+OkZ8Gk5JNubqGW
 TkxkuwvT/UvAb6QWn8yC4nb/Kv7f1yzT1NHmxslvbE4LBg2FniVh1tisPACkUN7bOAAkEYyhFaa
 8VZrqrTB9JKwL9WDc0d/WMhqwqq7CUW8Orvd8lyJdlttd95yHDFkoRf7AC+B8895gMMz0ANOQI6
 tGKHjhrozEbu27VOEOAcQ3pRvqo6uEu3T9JWzL0+E4k0WRVKcO2RnimNDcSaPAKzPSUHH7ebOzQ
 wuz3yExibBJVrmCwPeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270160

From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

Add ADC node and define channels for:
- Die temperature for PMK8550, PM8550VE* and PMC8380* PMICs.
- PM8550: Die temperature, VPH power, and system thermistors.

Add io-channels and io-channel-names properties to the
temp_alarm nodes so that they can get temperature reading
from the ADC die_temp channels.

Remove die_temp channel of PMC8380_6 for Purwa devices as
Purwa does not have this PMIC.

Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi   | 158 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi |   1 +
 2 files changed, 159 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 6a31a0adf8be..17d754d57e18 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -6,7 +6,9 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen3.h"
 
 / {
 	thermal-zones {
@@ -277,6 +279,134 @@ pmk8550_pwm: pwm {
 
 			status = "disabled";
 		};
+
+		pmk8550_vadc: adc@9000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x9000>, <0x9100>;
+			interrupts-extended = <&spmi_bus0 0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
+					      <&spmi_bus0 0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			pinctrl-0 = <&sys_therm_0_gpio3>, <&sys_therm_1_gpio4>;
+			pinctrl-names = "default";
+
+			channel@3 {
+				reg = <ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmk8550_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@103 {
+				reg = <ADC5_GEN3_DIE_TEMP(1)>;
+				label = "pm8550_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@144 {
+				reg = <ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+				label = "pm8550_therm_2";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@145 {
+				reg = <ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+				label = "pm8550_therm_3";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@146 {
+				reg = <ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+				label = "pm8550_therm_4";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@147 {
+				reg = <ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+				label = "pm8550_therm_5";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@148 {
+				reg = <ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+				label = "pm8550_therm_6";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@14a {
+				reg = <ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+				label = "pm8550_gpio_01";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@14b {
+				reg = <ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+				label = "pm8550_gpio_02";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@18e {
+				reg = <ADC5_GEN3_VPH_PWR(1)>;
+				label = "pm8550_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+
+			channel@203 {
+				reg = <ADC5_GEN3_DIE_TEMP(2)>;
+				label = "pm8550ve_2_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@303 {
+				reg = <ADC5_GEN3_DIE_TEMP(3)>;
+				label = "pmc8380_3_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@403 {
+				reg = <ADC5_GEN3_DIE_TEMP(4)>;
+				label = "pmc8380_4_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@503 {
+				reg = <ADC5_GEN3_DIE_TEMP(5)>;
+				label = "pmc8380_5_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			pmc8380_6_die_temp: channel@603 {
+				reg = <ADC5_GEN3_DIE_TEMP(6)>;
+				label = "pmc8380_6_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@803 {
+				reg = <ADC5_GEN3_DIE_TEMP(8)>;
+				label = "pm8550ve_8_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@903 {
+				reg = <ADC5_GEN3_DIE_TEMP(9)>;
+				label = "pm8550ve_9_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
 	};
 
 	/* PMC8380C */
@@ -291,6 +421,8 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(1)>;
+			io-channel-names = "thermal";
 		};
 
 		pm8550_gpios: gpio@8800 {
@@ -301,6 +433,18 @@ pm8550_gpios: gpio@8800 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+
+			sys_therm_0_gpio3: sys-therm-0-gpio3-state {
+				pins = "gpio3";
+				function = PMIC_GPIO_FUNC_NORMAL;
+				bias-high-impedance;
+			};
+
+			sys_therm_1_gpio4: sys-therm-1-gpio4-state {
+				pins = "gpio4";
+				function = PMIC_GPIO_FUNC_NORMAL;
+				bias-high-impedance;
+			};
 		};
 
 		pm8550_flash: led-controller@ee00 {
@@ -329,6 +473,8 @@ pm8550ve_2_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(2)>;
+			io-channel-names = "thermal";
 		};
 
 		pm8550ve_2_gpios: gpio@8800 {
@@ -354,6 +500,8 @@ pmc8380_3_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x3 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(3)>;
+			io-channel-names = "thermal";
 		};
 
 		pmc8380_3_gpios: gpio@8800 {
@@ -378,6 +526,8 @@ pmc8380_4_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(4)>;
+			io-channel-names = "thermal";
 		};
 
 		pmc8380_4_gpios: gpio@8800 {
@@ -402,6 +552,8 @@ pmc8380_5_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x5 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(5)>;
+			io-channel-names = "thermal";
 		};
 
 		pmc8380_5_gpios: gpio@8800 {
@@ -426,6 +578,8 @@ pmc8380_6_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(6)>;
+			io-channel-names = "thermal";
 		};
 
 		pmc8380_6_gpios: gpio@8800 {
@@ -451,6 +605,8 @@ pm8550ve_8_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x8 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(8)>;
+			io-channel-names = "thermal";
 		};
 
 		pm8550ve_8_gpios: gpio@8800 {
@@ -476,6 +632,8 @@ pm8550ve_9_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x9 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(9)>;
+			io-channel-names = "thermal";
 		};
 
 		pm8550ve_9_gpios: gpio@8800 {
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index 394e65518ac5..661dca4fbee3 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -10,6 +10,7 @@
 
 /delete-node/ &pmc8380_6;
 /delete-node/ &pmc8380_6_thermal;
+/delete-node/ &pmc8380_6_die_temp;
 
 / {
 	reserved-memory {

-- 
2.43.0

