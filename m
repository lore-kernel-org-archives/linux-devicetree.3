Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714132;
	b=hHVUY/BQOcoiHrMywPrHkzsy+GGephSSjDb0RjfAMlSlMTiQSZBIGjWKPU6I2OoweW3E
	 VErStfwTvj12MWrQsEmFarck+Tu9eZPmoNGRaoumPzWFMzawbDr3b2tH1S01PK8/Ng1AH
	 l2AgWsVHJqEPMCLyyqv3memdPSA4EVe6Dyz7GSL9ZkaTvgHBlOPwLVfYXUB87eRE8vfs9
	 K47UFRmqL0el8PNelHfqlR4aLqjm8O9KhpuPyIjSwqidvyfnS6Zj68Cf1ZsxbzOFbYyT4
	 dZPjr+rwEl5zkFxEusretBusKsYl3nkGIZ6SGtESjqIZFyobM6D+pWEDRlJALxwLLRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714132;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W48oLRMSiXkfxhfTWuzGRkhGlQ7vgGpxFZ6rRuLSbuI=;
	b=WMWgqFHyV21qu3i8IzKJeZmma5Z9UJwb4ji6//bdCP69h6ZJQXN2GhYAtUWCx1ZwzNXH
	 6+vONwZvT9WE54Y/LHskETK1V/UsBRzl6DiOEGWj/nQO93GlLTNB8YqWt4Ya+zlxhI69I
	 T868F7llsucOqlwKktf7P6ZZZPJrNzqWtHPd9v+x5ksKLeejWjMUcBkL79CD8cZmKlsa7
	 g+mWukvxcDiqzIJgzh3NnuRohUxZjt/WfarBJoUh86qkgse0gRQQJbJ5jPJK9g2WydCsd
	 3VGXBqmwbnQ+aoSFmBmfdwdQSjUkqwkkmCIQtsdFGjD5wSmz6UFroERJBn2r2fRh9hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=awwFvkUW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5bw7QSg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA713606D819
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 13:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA713606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=awwFvkUW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5bw7QSg
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZDoW3002333
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 13:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=W48oLRMSiXk
	fxhfTWuzGRkhGlQ7vgGpxFZ6rRuLSbuI=; b=awwFvkUWXB5gXi0PDBFZI7xgHg3
	TNARVUq0NgBtbeIS9lDJ5ARjBQyRRoHKYDJizfWR06NusFgBAj655Drux0pvnbra
	yAm1OsXLWHI2A67xKFm0foTuOtaqfWFyIxVYJldRqxE58ITLK0W+171x6Foqezu0
	/TobNU9vI4fzsMR00/4uGqfJN8mytRUhHb2U/7hrYmPsSFb2CLqXWiwyAfTyXVj4
	R39pBnlRxN0zKBhNNWTizrgLhchv9w5mNf2N4P70OPEESbpeYXqaoLhlo46v6gQg
	/A4FR67XgAJCVoPnbCDj6z9YHnCZGay3y6o/uX+aMCMfhFaAjhtSyHQ24OA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq08740sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:55:30 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b20a4b5f2bso2136224c88.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 05:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793714130; x=1794318930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W48oLRMSiXkfxhfTWuzGRkhGlQ7vgGpxFZ6rRuLSbuI=;
        b=I5bw7QSgfiWgI6P14H3osiEgKO/zKMIkLlvJrY/nDeDD2Sm0p95okcD8qp402l/9to
         AvccmrfCl7GfuiBpgRrJR+BpwYoVXUaL+wjwjc8Y2gxEmliQIA3xySjjLG7tbdPhFAm2
         Lm1+p8czE0f2/b2NUEkaNZIqzgkaTykcl+8DMfB2zq9tAyfOtX7r9WPXW8LhVR0hvVg0
         X4oczbwNubDv3O8g00R9WX23GcDPE8aUM1HLKDgrcMwi6bY2Xzc5JOM4ihdbFbSFyJGs
         VWEmf++N19/3SV4+pGVgkNXVGwZvn9bPeX8clntqnu3dMqWa9P3Sbss1Rx81JK1CCpub
         Pt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714130; x=1794318930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W48oLRMSiXkfxhfTWuzGRkhGlQ7vgGpxFZ6rRuLSbuI=;
        b=eeIZQv9PQP38EpQj4I7LEdwTJi5FgvTq37RQKxBEuCghwX6b3ihHuhKALtkyKOue8V
         6QJAJBDOooi/h5buE24btc6bs1Rps4LoAmtvHLTP+t1VHDnolS05qakcURBCyVpeaZCO
         ay/VkuGu8v+RA4Bz/WrUryMSBayROchARlTZcUNmXA+UZfEdL0p/Q57YGFEcVzaHVWxv
         +Zp6pxAVKI/GFVGG4LLdbhDa/y/tOUpY8LyUcWwNb8kd8CLLFCQCOzyrQ9OH7tLGOYh5
         juh/yRAXeTIe8rSDxWB4us+8U4VKXVZp1hnSdzMH2t/7SadlY+jvW9vNJSAT1FkxZWUd
         Vm3w==
X-Forwarded-Encrypted: i=1; AKwUvBwPr0+Fub2XjjWX3YqhlvPldf5/+c7j/1icJtPrffdJ5m3fVUX9LmjcbsS/sOIbXCDA0OenO63/OX/W@vger.kernel.org
X-Gm-Message-State: APuU4Z+NswtqTmgtc1rniGadh4Iam/cdLmpz2RZyGdf1bA10Q6p/QRmN
	/ROW554yMG1rlHQeXaXiBlNi4O08dMHkkAFxdB6UVMT4paJ0ZFVyko8h8Lu16jKPndbUoQAJSZm
	lgunS1WNMEg2VeAwpO0Co8CsNMijGytT6j2uURfDpPpbHFRxqzXu9IxD1rwcFIEYy
X-Gm-Gg: AYBFou0bFnTDGHQ1Ymu5C3WggH7ceOq8lbZjpRvw/zU7fXYASn1AE3csexEvJE370gX
	KrlskZzImO/9aKy3ach3MAg8xMgLeB2M7VUj2mbZ/QrJhkzH/pdvoT6lU9qYn8Nt0+he3Uel2jX
	rHIEEPyNjpuYTl+e6KsTvS7ShqN47XeQtNCKaXOdBMPeHocw4m79TA8skhoUmMLAISEaLtGeCL3
	Yoj26YV8v/5/kfVqGdQ9iN7Cuszjl02+JW5rcPs31pwcXCpUcW5LzrF51b/wsFEHGNn3n/z1UqW
	rCT9BEXdFe/LMlzIqmsfZEJ551snVQnGftPO+iu0/zg1ZAfwvUVMDuwRwkbObrsXnU72iXyMe0/
	Y70iXnMyT9TqTquXGPONNoxRRb5y6a0tI24obVivRiH8nMLC2m9nLe8oIacUNcajR+cl4My0ReR
	U3x0+lfjIpYEoDRVtvo3VaclymoVDdM+m0
X-Received: by 2002:a05:701b:42c7:20b0:1b0:f0f5:e38f with SMTP id a92af1059eb24-1b0f0f5e3b5mr12588863c88.34.1793714129559;
        Tue, 03 Nov 2026 05:55:29 -0800 (PST)
X-Received: by 2002:a05:701b:42c7:20b0:1b0:f0f5:e38f with SMTP id a92af1059eb24-1b0f0f5e3b5mr12588814c88.34.1793714128944;
        Tue, 03 Nov 2026 05:55:28 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a9e2ed3sm41634001c88.19.2026.11.03.05.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:55:28 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 2/2] arm64: dts: qcom: nord-rrd: Add PMIC ADC thermistor channels
Date: Tue,  3 Nov 2026 21:54:45 +0800
Message-ID: <20261103135445.2049110-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103135445.2049110-1-shengchao.guo@oss.qualcomm.com>
References: <20261103135445.2049110-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfXwWt1zjftb+RZ
 z83fuzwEr93L65wpqznZD4uYTA/ekygMvHDEJWb+j4u7i6So7971rQExwDYVekvwdXuv2sNZkFW
 28VJL2PhG5jXk0SH9wjPvCYx0txbY9A=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae9e7d2 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=81vGQKYGPs5K2LOyq8AA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX9TsUnespc8NA
 5p90HnyzHi+hNJ5jMtIdZscuEXh3zURYcapC8o3V972fX6YX1pihjkASLgqIKodd7wD5iQsiQaB
 6tvg0+AISPdK3ByqVEWBv5EgZrnj14aUJ2/uWyPTNN6Phjq3SVM2E4Jh1isg8JDCiZORSRHDOMM
 AVImYOsXUgUGf2vQPfnjwQgCK/QFooGiptI6ChJbQ+iYmCkEVMN8Rzweurr4HIEX4dD7UQxgHai
 cWrNq/IbQ/kkYHgz4r1LWE+maZNUSti+aJwRqKSrxBa9107jHkJM4KRsYsez1/YVpnyICI08aRT
 7HNBm95UfvFHZmj0cT2uS+0knbKFq2RYIFdyP6MOHPRYgcrVb5tKOGnAkzvmNyAF/ukQJeSmrq7
 rG+YsyRnz3tB4ENUZS8/C6KN4SEuiFa2+YDxA1WY6O9fXNcZ+fP4atAxN6uMuKCBha8mdSpVuMs
 R7KgF/NLfg98olr2w+g==
X-Proofpoint-ORIG-GUID: FRhlXpsHHGR6SK9r7oUkM0xxOuml3-Y6
X-Proofpoint-GUID: FRhlXpsHHGR6SK9r7oUkM0xxOuml3-Y6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030055

On Nord RRD, three PMAU0102 (Kai_MV) AMUX pins are wired to
thermistors: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai instance I's
AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). The remaining Kai AMUX pins
monitor voltage rails.

Describe the thermistor channels with qcom,adc-tm and add a thermal
zone for each.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 84 +++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..ddea691f1c6f 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -53,6 +53,62 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	thermal-zones {
+		sdram3_thermal: sdram3-thermal {
+			thermal-sensors = <&pmau0102_e_adc ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sdram1_thermal: sdram1-thermal {
+			thermal-sensors = <&pmau0102_i_adc ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		ufs_thermal: ufs-thermal {
+			thermal-sensors = <&pmau0102_i_adc ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -377,6 +433,34 @@ rtc@32 {
 	};
 };
 
+&pmau0102_e_adc {
+	channel@444 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+		label = "pmau0102_e_sdram3_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+};
+
+&pmau0102_i_adc {
+	channel@844 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+		label = "pmau0102_i_sdram1_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+
+	channel@845 {
+		reg = <ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+		label = "pmau0102_i_ufs_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

