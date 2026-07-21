Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A69340E8D6
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615426; cv=none; b=rUdG2CBdyl2L0hqo/WC4rIA/l0w98JNgnwt3d0XROD65JZQK96KMsrSM16nT3z5x4TaQxgRX0sG0VEQUrjlpVjt91SGmpOlyEbdtvT/8HI0yI/oVi2HYmFwS6rQ5dB4e5G5go+PMhVGl74WUpdcwbD2+rOeF9C6OR+fcI3MApcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615426; c=relaxed/simple;
	bh=BdOGIxXE1ok1M7rUKEyOuOmZ0r5JcuZo3GwQBeFxMcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ckpve6NYA9SpLfyNUjYtHVU3NJWZrQv4hJDIpyEHNw8xeOkmpDtEwNSmSxxr8Ik8A4aWC14PAnp8j2H/u6QHArBJTA5ZskKycQwzLGG6fe5275sIoKoogaWG3fuMjjsx/jQjVEPB/sw7YcU/xxdi3zHMeysn52lgriBYUJjLRUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KoMdMCyY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZjdC2xLg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KoMdMCyY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZjdC2xLg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6T9HE4151354
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eeo9wzBCTc2KKAgmnmcaGHN5cU9PGYzocvT1y4OmbYk=; b=KoMdMCyYP41MKpaO
	WK8XO2sKNowMi0eXQy20wwDkjKUhY8yiGb1juyHsH0wM4J29uHl+NMCNfielVSp+
	FjHXq+FMK71J9fHCZCIeLHG4v8K0hLXfR+FXr/8pLfVYMJ4M04OR4afHTTcQPkx2
	zppDQyunaf6ScOqmjTMzGT9E0OUzPcPhvOVU5FP+362TPKRZvBvr3GLmuQ0SovX8
	ZhgjO7b/trnRB6zli4cJrDYor90SOw8D0xIuezercdo2vEgO30lqz5LIub3s8bfC
	j4/tb6jhLlsH0CJG6b4kTDDj+L5GFkrGhm1kuTZT4xNV2YZAqcDPoSlhXACDs+ga
	nVVNaw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqff2w0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:30:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccafc5e82cso101296855ad.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 23:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784615423; x=1785220223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eeo9wzBCTc2KKAgmnmcaGHN5cU9PGYzocvT1y4OmbYk=;
        b=ZjdC2xLg84vbToBh71l9JWzceqoOI2CiQccDPLcCMaUObQohHyCRguSR1GZ4tWojRD
         blvt7dGtEaEav0J1bRQqo1Dv22xtNRgBeTsW3MNuML2vWchrMbmq+b3gabesE69U3gbZ
         9o+ZuiqEMr0jhszMTtw1HDxOrrcajHIXNQJ1+SqJQFKh7UdUoUMW9pZZOfsfni9d1Cp4
         TtO0GDrYJAq0zQgoq39m1IzX1Dk2g/6pfxpY4kjucFGEIZvSZvrdoNAY8b92RmGZZXLg
         TAwOanZDYLCu/DaSwAEk/TRt3eA/vRGKLDtfCDrC3+Jwwk3XNkRFFnZWqU+3lckaxMq4
         Sdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784615423; x=1785220223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eeo9wzBCTc2KKAgmnmcaGHN5cU9PGYzocvT1y4OmbYk=;
        b=S35pLiVajhlyEhgxMRgfwg/GKVCja3EDmMKIQU9S215Lg/G85cRP8d8bVB7NdFbihe
         DRAiHa3GsfQVD1HXNT8z879FvSYoHHkmEeodK34iAycgRJEOADaSYSXI7WE380XoQzsV
         iXWEVeaNZzGMaGFsHFUuWK6Wm3iZpE+U+CDTnB52j9AsZteXHXE9AB4++EYYkAG+EZw6
         oBT8e50cEym0FMe6e6f0M+JqkUFT327LcHZ41B02xu6gTAnD5wC9KtQfC6R1twl5f/oK
         gXBHsJZOT1QM5KRQefSZje/ylXmc7D8ko/rJdc30NfCNMwDUqRBhBbE5mczapX6Z0M/C
         o2vw==
X-Forwarded-Encrypted: i=1; AHgh+RqBHuUSlgn8hwc5aZwAMSQEwSystjjqJM9aUmKjVmqO+5BabwMgT3GYvMCIg0o2Zk2cMVbSj/l3GkSs@vger.kernel.org
X-Gm-Message-State: AOJu0YzkvkJpYgODzyeHO40UlbtNQ8EiahI8yMSFe9HRg+EiFy19+i1M
	VJOKD9OSibVk3xF/X2oK7lt0eUJt+koHBF1MyZDT7RPWbaSrvTakuaVyNE169Ek2Kb+zb6hbCYU
	6hE/tgr7a5enC/XBYPSyc7Kd4sQv9USQli3csdikIquM2JpE/qtVGTwPceMp6Uadi
X-Gm-Gg: AR+sD13tmEfLo8Y5/e2dztkh2Dx8U9SmV48jdyNAi2pxrWB4aRlZL+yeYV9NmHrwBq8
	yE+ULdo/SXa+7KdUljx4PQ8BpJ/e88bGrC164aj43t40euzHsOBaV14IIXoNysNBlJmuDA2lVtq
	3k5UIePjXKq+OASMRgLpUkq5s4M2eNqbfzpsBdnzVRrHl+/JYqOjUfKBx9lnsTz+XKtSzNGk6Kq
	1/h7CGKF31Tg7nNzXMQwyjOhtJH3BtnDfPnzp3hlO6X7tJ1N0wHJF2CYEYia5NIqnJc6OeaADDp
	kzpqno67NYHqR+sbgh3FBtMfZMQSAxKncltGIgBzWM66d3/Bi021dmxAPwsvEW4yUIokF/gh8J7
	2tWgkjZHXZxSK17oziNCKN6P3CfOnoA==
X-Received: by 2002:a17:902:f681:b0:2ca:3e3f:4956 with SMTP id d9443c01a7336-2cf34a35445mr184691395ad.44.1784615422950;
        Mon, 20 Jul 2026 23:30:22 -0700 (PDT)
X-Received: by 2002:a17:902:f681:b0:2ca:3e3f:4956 with SMTP id d9443c01a7336-2cf34a35445mr184690785ad.44.1784615422474;
        Mon, 20 Jul 2026 23:30:22 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347a1201sm69376505ad.81.2026.07.20.23.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:30:21 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:59:06 +0530
Subject: [PATCH v5 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-b4-qmi-tmd-v5-9-99620e07f505@oss.qualcomm.com>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
In-Reply-To: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784615351; l=4746;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=M1kNcKjXMHABpQwGFH7f4z1gi75XzuHKDuRCrq5y1KA=;
 b=zWznmChXwH1a+Xy7CXqvwB+2v/B4Jsj/DTEzvL/4/G8fijhQpVOkLGUcQfVbc7hDqK5MGpe24
 xDrl1l1OhnfCtcjZOhoJnblsDq6uaT+dVjZoffokDQX/OX8wuHrGEke
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfX76dcuE5XuRf7
 8NNV8LkB3qQbVbgUc2GlIrDO7kkm70czinKpP3H6du6jAYaPWMbNceDVl6NoP5Ki248T7uRzIJ7
 DOaP6qwSvKT0E78iLBcPny4cU4VG3es=
X-Proofpoint-GUID: fijeM3-LmFMFYbLBWpLlsEB39xHykKQB
X-Authority-Analysis: v=2.4 cv=FJErAeos c=1 sm=1 tr=0 ts=6a5f1200 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ND7YSEQ52W-Uskv0B9cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfX1gW0RdqZuxHE
 ih13grBARtei4HF7Ve3+JVhUHP1ei8nCyzoIA6yvvo29YsyVhnXMy0pCkkLisguNXrEy/ezzge9
 iyrfwkfsqKbCf7Bk9p45IXOVGXH9JU829TPJYY5Sv4cfg66/1U0Cx3IlF+HYxqf7ctcAtVWSY8C
 lVIBxE2YyArO82dD/valsl+BR7NGfnQ/oI34zSSKRfp7lBAn0cbMUhpa2o/YjsCo46sDaZ+if3u
 ofLQvvcYEY+TKhYLdcJxC2G69fV0zFpg9a/e4P+g9ByfozKcqxG8U/OwCgpnKCVcKR0p5X0luyU
 julkIUBwq4Tc/B+Prf/Pw3ylnmnQrk6ZOE8/Jk2tQmNXQBqHDjxEZyv5zNaz3Tc3QY9MqSB0bUZ
 p4mSUB/1pudslEQgUJfmxfIvzCm77BtfkgbzNZKyzL1C5i4KgJ79HJ4QwJuNwYXr9gb472gMnO4
 ckGk5Q+YzkZOkFIxoRA==
X-Proofpoint-ORIG-GUID: fijeM3-LmFMFYbLBWpLlsEB39xHykKQB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210065

From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in hamoa.

Set up CDSP cooling for both instances by throttling the cdsp, when
it reaches 95°C.

Add polling-delay-passive so the governor periodically evaluates
the zone during passive cooling and steps up cooling levels when
temperature stabilizes below the next trip.

Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 32 +++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa.dtsi        | 63 ++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 9fa86bb6438e..a146be1cb5fb 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1684,4 +1684,36 @@ trip-point0 {
 			};
 		};
 	};
+
+	nsp0-thermal {
+		trips {
+			trip-point1 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	nsp1-thermal {
+		trips {
+			trip-point1 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	nsp2-thermal {
+		trips {
+			trip-point1 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	nsp3-thermal {
+		trips {
+			trip-point1 {
+				temperature = <105000>;
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 09527dcf9576..a1f7c46f6c27 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -23,6 +23,7 @@
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <dt-bindings/thermal/qcom,qmi-tmd.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -8971,6 +8972,8 @@ remoteproc_cdsp: remoteproc@32300000 {
 
 			status = "disabled";
 
+			#cooling-cells = <3>;
+
 			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
@@ -9558,6 +9561,7 @@ aoss0-critical {
 		};
 
 		thermal_nsp0: nsp0-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 1>;
 
 			trips {
@@ -9567,15 +9571,30 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp0_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp0-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp0_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_nsp1: nsp1-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 2>;
 
 			trips {
@@ -9585,15 +9604,30 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp1_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp1-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp1_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_nsp2: nsp2-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 3>;
 
 			trips {
@@ -9603,15 +9637,30 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp2_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp2-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp2_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_nsp3: nsp3-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 4>;
 
 			trips {
@@ -9621,12 +9670,26 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp3_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp3-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp3_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_gpuss_0: gpuss-0-thermal {

-- 
2.34.1

