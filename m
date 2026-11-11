Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794369657;
	b=zoTgUtubvIriIhXP+BF1c1DvJW64ybVvsSszbYfALh0gYgnTmBVegjrW1k+y2tkQxYjk
	 WAbCS9eTJzn7EmT5pBVZ1iNu3NpqXIfpBetlPDd8ynFhPSutFPXQNYabBKiLwnMS79iYM
	 1BnnvrrtrYwb/5yAQUy9jc+STS23Njn8opnGxOd/YSiCKImlEFszOYGgzsyU1Ec1/wY3l
	 FOqCA5XtQdlzhvjNsxuyw7zJwoTydFNp8z/92EKDcgvEe5tEHN5rwiS+5RzqYec2y5Z1n
	 paXS+Y7+KCASld7moUWPjWvQ1j9hMPtaNIYt/dp5484pmZmobk2uXnBRuP9f08AhfmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369657;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pkGH9AI6RyGCV6c+Ft5HngJRDB2raFejWpfQYwc4rKM=;
	b=rblZ0d8V5pguZN2WJZJxMDS8nEB+kEKANqVtFO079aRY3Yt2HgyI0ZIzIOA+x6jYfsvO
	 e69gGwMafwvDDcXf0qPxvaYGCPcMCuicewMRCYZvkw5dJeikwFMKGnfY2oBHIzYyJqLL6
	 DSqQa++KzCWyhF5Ycwaiy0LGKcjUkjPlm/YojYCYTuel+eO7PAhXXTwgw6rsVCHWe0RK1
	 KCFo6XBr7gw3+H+AXzuSUNo6OGXj57+KNhdJpNuqnXyPHi1v+LAA25DC6ecp/RZuU1BA8
	 rAzOtmgipZCAqLzmXRUyzX3bzDAtT9cp+k9H+GyvB60rxAxfDKbBkfvQtdDr7a1M/Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S92wpA6l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KojOAPVc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59208606A331
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59208606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S92wpA6l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KojOAPVc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1tQqM4050259
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pkGH9AI6RyG
	CV6c+Ft5HngJRDB2raFejWpfQYwc4rKM=; b=S92wpA6lJb//VFKzgHhoQ8muAAY
	okgrOXFt6VZMzK61bnNL1MBmogzJ0CtYnGXJbS3kfTPSSMUIRShGPrnGVVbdprsk
	smO+zQhEdnpKMOkEdy6xm/LFyNxrvkq1d8tcVE5cImCRywtLa7XW9RC23hTS4HZJ
	DXNCRoqR0bvPXb+5HA668FyGxiWRSYGm1AAwlZy2LNgMB5GcusSI1x21GTOq6CoG
	w7RO9zL69mvkE/hJJuSx+1ZZeZZSYEjfca3E6tjOwikM4e7KUNaonIkcHq9MROH0
	loEiv2KRDsdVF4LW5wSmii1WtHxMdXWZElCyGcayPAxQFpNacvj+OG8GmYg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5jbp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:00:56 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-547ae874949so3550273b6e.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 20:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794369655; x=1794974455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkGH9AI6RyGCV6c+Ft5HngJRDB2raFejWpfQYwc4rKM=;
        b=KojOAPVcu/x5aYHgT41UroPAOQ8QczVP6Y55t89c2IIZHIG7X7FyDWPQfC7vi4vOh9
         nqV4tf/HUbPyQDm7nmA8lL3yywI4d3C0nmJ67PF2pJmmnHtVh+fGz17Nrcarl1zv5YRf
         SROX29n6XSe41Su9gY4T0Lg+y02nwuar4/gGnriHz+1RBIj8BUYqD6m1g+5yP2YXuqut
         9fSSgY4rpQHQDEyNGrzZqO8j/z1G5klfBPdx0rEJqNFb/36y1+Q51T+lIbk+iDMh3/wc
         zQBO9k4fzPoI1hgGFWw4/oJOnJwVgtxErxeCdT7v+BMHRLkbTfNpxf4rjCHHirw8V+Vl
         CrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794369655; x=1794974455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pkGH9AI6RyGCV6c+Ft5HngJRDB2raFejWpfQYwc4rKM=;
        b=PKMar11S2uS690ByYAauivYHJNBXk/5ik3kiozE9dUKhnV20kFcrfszyBoOtl83HzQ
         P8KeJsE6HvbIqBDAN1pIMthjX4bktykUqmR4vxRF0pE1vmIKAMB0CZgwm/fCdyjPHab+
         k/ST8PNJgzRpOPuQ1+nkiRKkNl2xxjNDwuIvPOadyBdq2hxoH2RoE5pcMpTDusHJcciD
         OJ90oYGN9dzlBd1P4fXDYSkSkm+fPH0rudUTIi1zOKQ2Fhas+7TS2NI9U+lsa/LoFvcg
         g0FSy9jQ7sYzQaH9OBV3AGxk7Uhwa5bgOBOIMwBoFR8MOkIGBUl1dYD+P5+BRkdcRqLG
         Al4g==
X-Forwarded-Encrypted: i=1; AL+hErEn8lUtCQi2H58ef3b/IYzsv5u4QfXSLrIvMqQnsrKxSe62imrHwJjlRA12jJHVbnSxZ9CjfeeiipSi@vger.kernel.org
X-Gm-Message-State: APuU4Z9/NpWGO/m8ZAjiO2BUApBPK9uYTUvUljm5v9tNk8r6+cy0l8E9
	+QK58sBAkOyJueJXWDzVgu7sePjXi+mmyA31h3b74WJWbAEv02AMYj8E8VlqHlaxo44QHASUHCi
	PxnmGHLs/psDZQpnBgGtJ+VdrTftkLl+xlB2zvWAObQtjTyvCwJpDIxBVJ/LFTq8g
X-Gm-Gg: AYBFou3e1dyw0Q3aoZ4c7LDUi1zMtYjrpNwa93gqa2Nq9WsrsPaXW0shQYJmzFwvr0P
	UANlVPd058zl4j9xefFvDlcdIqINklPdramG8CWOu3StcxDO1JFKPyVNsmsQhZkhOgap+FwXO17
	om1vajJhS+zU3nFavpT6V3edzUaGlSIFv8m47jtY2NceS52hyVOmphAIfR9D9sulILd2ShBq/hp
	qhEJyGiK76jpM/yWKS7CblK5Sb3BgfujX2ox7EkLNqhM9dlO1AnyU1b5se53dyyGbKROkhMYW1l
	xwPWyti5QNInXHm4SRUfJnxFo0sMagbRLaa2cJamOhESYomzGpB9MC91A3RQKtaUvZuTYQ+uFcT
	h1q0gmjEJR23rivmTRn8wMJRpg4Mjr9MIll2YlZ6qsHX8i/2aPg9USo1UyqGNV4wmfT1/P/0EAD
	E1YR0WbXafWiX45oEYTaL9fADEJQVrfySR
X-Received: by 2002:a05:6808:c1a6:b0:4eb:80c0:f4bc with SMTP id 5614622812f47-56b95163966mr956144b6e.10.1794369655378;
        Tue, 10 Nov 2026 20:00:55 -0800 (PST)
X-Received: by 2002:a05:6808:c1a6:b0:4eb:80c0:f4bc with SMTP id 5614622812f47-56b95163966mr956130b6e.10.1794369654945;
        Tue, 10 Nov 2026 20:00:54 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-568f083d000sm4089276b6e.0.2026.11.10.20.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:00:53 -0800 (PST)
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
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 2/2] arm64: dts: qcom: nord-rrd: Add PMIC ADC thermistor channels
Date: Wed, 11 Nov 2026 12:00:20 +0800
Message-ID: <20261111040021.3636059-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111040021.3636059-1-shengchao.guo@oss.qualcomm.com>
References: <20261111040021.3636059-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNSBTYWx0ZWRfX2expYoduQOQp
 V2Z2fuuKsad3KLaaLYjlKzVBWJ5mdbCy0nvsR6r5dLxyktuPb52cjzyXu6nM7ndq6Mm34dDEqoz
 A4VXPTnZYJXX28y5LwnV0S59d4jLCqd0pxlD7Z4eRB4JCK+rLgNpc30HIXumF6JU2HHVg0YmCE8
 Q+BAW5XWnrP+UUt+WUAynFOsYOCGtSqYWWH8XT6mz3fcukNHFPfvGNKVa0JPfL3F6A6Tj+vJRi0
 /atlB5mfFcqtjtZRwUMKQ5taJgkEMjCXFwOPcl5DOoq0pn94wGfwD61Q97O6avBkKJo8Iqa8SYB
 x/5ZerNrMMfvtvkWPDA3FK0rVGg73Ipw3y+70kjPVe50UxkPUN1HOsqTmevNiBIiAv0Sib+LCeq
 YRyNfqMjy51xlGkXbmVMfGAfl3T9Xqz1KrqxUqt5I8PTnYg4mm+wJOmD4jO0zx2/UDFabyehkNJ
 A3iMSJsEnKlAiFxwwCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNSBTYWx0ZWRfXy446LrJSqpFS
 +B457YZ1PIu5QGkIgI51vmJBUVZ3SJHTtnd5Dz3ADV/2lb6a6PJfnBb7IyZ6N2OotTk84eIiMBM
 lk4S3sNmSotZqwnhNNlm8+c4RPsVwvE=
X-Proofpoint-ORIG-GUID: EcDMWe1RZwqL2AntYRZLxyWN84Qud3FI
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af3e878 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=81vGQKYGPs5K2LOyq8AA:9 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: EcDMWe1RZwqL2AntYRZLxyWN84Qud3FI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110015

On Nord RRD, three PMAU0102 (Kai_MV) AMUX pins are wired to
thermistors: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai instance I's
AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). The remaining Kai AMUX pins
monitor voltage rails.

Describe the thermistor channels with qcom,adc-tm and add a thermal
zone for each.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

