Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559502;
	b=FB29aqkrtMAbycOOmzuUUsjAb+UP6RYRRFXDzGqGv35cXbtaA7RAsfvTt/UnDFOEsSCI
	 4eJppUpNqQnPhx6qo69XDXJr+M5QjVeVWa6PaOG979dASXmOZXBETlCJIpXqnF8ZHgJZ+
	 OzRFFU+399egawbG080xPxqmfO2d9KiZX8dX1Yq5gEu/yjYwm8F2hYF/YZEz5rJtayYGV
	 bfxCOfnx0sLmWsfisZMlhich6BHToioF/N/f+NzBrtz/T+AghRyS193yqjmJgHF6YFUkh
	 Q4mLslbvEkn/vcNXmUUCSOWSq1Flh+FcvrmVtnQ4FWmL/EzlCA8U09jU3Z7nRLiZrCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559502;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4B+k4N/WxVciI3gaNDWzFpGczUzeXz/gtMtUvkPRnj8=;
	b=ATWLlb4ZNDVNJQ2OLTHnOVcwJ5LKusiVFtvKFYZ+16HskyipOuGMROpgwlPBnPHB+MSz
	 jEk9wEdfH37TcfJOSODDIIR1KAMq1OQrfbVmkDpzGt+rqnXtqxL0bNMKJR9iU9FnuZx2/
	 S0LieGrQ3RbYtRQr8iXt4CIxiP9TlR3FhUMIHkRYSyG9g6Cc2hM3gqbMQCOptzDXOOQ4G
	 VzFyvbvI5YJkuPOUcmF+em2CB6aQCasJSKNf2OmQB0K2h4mY2sDEVOQkEYURLcSXFAXIM
	 TN86suZ0SqUm0MQfSZLW0M/sGz91DR/1yuR1tkiJaqigU8iniq3q4G+FwaHEOG70z4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dom3x4pk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b1ysmHWc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1251360A6F45
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1251360A6F45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dom3x4pk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b1ysmHWc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VDU53652963
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4B+k4N/WxVciI3gaNDWzFpGczUzeXz/gtMtUvkPRnj8=; b=dom3x4pkyLZav7kJ
	NBsEngBMtcc0Djs71P6R/T3Bcrjdc72HpbrHPIJB6Ui8AJre8inGfB648giq3Fl3
	UgLySVcffL6nEOYYpiT3og2/pOi8oQ3lphtQwyxelv2H2ThhMuLCsXPktR8HiXCo
	AHjlXJvP+/YYR38zeN2Uir4OFu9LTOMgkkKOBYLQsEN/twfpDcATKq3/G2jiddWC
	1DPPgSDeGUy2y/XDwwPWOTYhIGgAQ9PKJ8Km8f1SHgXXfKlgMC1doKO+B+A1YSDR
	6l7bfa2ikEl17AASKG1z9TNUEvJk7j4Ox0TxnMycnaffvNfESpa8h5Wp8GurIoTZ
	OHYcNQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwa8f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:45:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1155180eec.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559500; x=1795164300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4B+k4N/WxVciI3gaNDWzFpGczUzeXz/gtMtUvkPRnj8=;
        b=b1ysmHWcROO0CzlmtI0KZNIFUTypatg2J0hElZn/VTxurAS7/i9TN/6/L/5F0xnM1o
         djui0CVBJ65/YrpJH1B8ot8QTHoonP3BLt34/PfeqJzeMyBnZHqKnGYBpWMiWZ5WoObo
         9A5GfeLatpRZKFlwYmHT7GhCgiqN6hGMZTznmWoMQ4mk7Ix43CSMieSUW8ldXwMKmvYf
         3vGo33vQ5FtZdXyZuBNXooIXEdozlfbxq3p+WqIxaInKQdw4Iw9ofM1kqMqYTmNviSKn
         TTw9Any6iC/hFipy5yA84M1vmj8bH/Z2mFU71khYZtFwo+CvQfqJR8pYhZYjosk7+GI6
         h5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559500; x=1795164300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4B+k4N/WxVciI3gaNDWzFpGczUzeXz/gtMtUvkPRnj8=;
        b=LOl7MwH+vsTvlGfjnGVaY/ITUtrUa05FPjrIa5J6km4R3Gh2liLykn9SJcI1fnRK6V
         kpOXFnM79/ugIdPjpyRDnx+g4uPhyIozFDNVx6lfZhZv08ioI/DC8rRBGXZTmw9kpfDH
         M8TAsBtbW6MZy2EDbQ11N/8kToIx2C5LOwbazkTPFaPKamUyySQ+w1OGeR51Nt5O/A45
         qkqclUXOY6Ca7hFnfOf7K524wNsENQZz12BYJ5IkHih7eQLl8Emfj39PsW1sVSBO1P9A
         GvrOjfsGfBg29U4Ka2ivLQe4cfq+wr2A6pd9/h1pBgbO1tUTEjL1Q+awwXexvbEn3fC6
         zVyA==
X-Forwarded-Encrypted: i=1; AL+hErGEF74ZQTJ23FeNOTnwQdUEglxnZfp6znofTeH45CgNc6PBI9utbHpsWkh+mO3nlCz0oTKCZKpbirwD@vger.kernel.org
X-Gm-Message-State: APuU4Z9hXaRaU86bP6zG9cy4tALc7KUuup8p7/iwipHTmnXCzLKDuRHH
	SpRthluvitIZKzrKg84KS8YZ2uQHTlz5jKmL5ulGwDklpcRolDOHnDMKxQhUWMS17cQDxgvvp7e
	Or0jitBRGlQ/cPo1X5HUYLvSv0oGBjlIkL9abTfziDD3B63lllANWnKkrrVL4bdD5
X-Gm-Gg: AYBFou20HrSXZP8WoO+v2WGLTX5UT/CP4TWuSNc2stArpF0rosuyLwQE01V+4kBSy1t
	fHN2jVd+RDhG+/418/UkNjWY5PRQUC/bBWoT7eY+iCXh9Po0AA0vQmgmfm3r9eFz0AvTYZRUf1D
	aib4Bd3cj6ayujyrPtatYr0BjhyIZLh/Fxqu+erxgHBffLaD3/YUHa8w3/u4wadndTg8isikN4P
	A+f5WF5OdXgVGUs2UQRupzqKAKa/CavmuRUrm0y3n7tfQp8YQrMgeHcdIA5400tY9V+9ZI6hC/C
	U6o7Xn1Icq1mQ3t7YgZ/M+OmB1xx7iJJNqYGLbugk9Eo/5ZN6dMwdh9Msr5mpyFxVh+p5Cpvp0I
	IYxZGFHSJ2sGmHOvZjCmWtFD2I2F8nLUD4MsvpJIxrUUYuUqqLg7G40WVruM8MSFq15ZkDFil8x
	cR0F4=
X-Received: by 2002:a05:693c:87d2:10b0:36e:53bc:467d with SMTP id 5a478bee46e88-3796047ef7dmr1517270eec.0.1794559500053;
        Fri, 13 Nov 2026 00:45:00 -0800 (PST)
X-Received: by 2002:a05:693c:87d2:10b0:36e:53bc:467d with SMTP id 5a478bee46e88-3796047ef7dmr1517245eec.0.1794559499442;
        Fri, 13 Nov 2026 00:44:59 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm9662357eec.20.2026.11.13.00.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:44:59 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:13:49 +0530
Subject: [PATCH v3 6/6] arm64: dts: qcom: hamoa: add thermal hw-bin support
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
Message-Id: <20261113-thermal_bin-v3-6-878df6eef8bc@oss.qualcomm.com>
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
In-Reply-To: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794559450; l=5534;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=HcVpcdcZzfHLlTRXvDjqWWHGSNDZWIS0xPcIBTiDguc=;
 b=hf+U5PczZx/kTtYo/BjrMS8HHButnfof4VbnSGNlrM131+LQsr9/hXS8vVqi6jXkQnX1L+s4c
 nDHP8vv/ABKDQyzlZCEv/Atdkpm8Ob9kdbJgvp1q81ahGw+aKgxS3xc
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6ce0d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HHdy7Z-N7RtC6Qn240MA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Pq_NeA6SV07FS-gDYl6E7OR678KDeffr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfXxVbsLefiw4nU
 TR2i3v9+lBRl4z9enzlTQp7eKU45B8GmYq4HAWYuV4VjmkEQ4H301di4K/YcvOlmAtlWpDYLcmF
 7K7YTr/PpMA+ssT/PKaCe3JNkS/fub5pkq+oLFPAGOaD67fgS7FLIXLazPw+zkvXuuI4Axe4wOL
 1mQiX1s370cqxvN6G9q3tvuRN6o7oLnJ+OeNWExUZEC1ulJJwAVCP49JU9NlUYOqxd5PlSzsgbI
 a+ZZ3Nwy6/8SDr7zYS+9MT7XPrlYY1R1rrAK0yMxds+KF+iFVRrUvARANDaQW9BvO+Tr8ajR6QG
 YRt6eHvKW4o/PH/PclbaTOPwTFgNqdMTtN5X8exRkitaau0wS2FKSHLke7rCBEvyDk4PbMccVNC
 VbOH9M9HA0zEnC9e+bSXZmHojtiG893qKspSXt1mcye16T4qY79Vz/LKg9CFvKj7UU1Y3DQX/Gp
 H5vkRyzjixZ6wy7aIAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX5h6ymQBEvi6H
 z5dooRjwnKDpoK6fQvSVgllol+yeAW65fYavu/YdXj5aGwg+hBvOG4rJUANk1KbPJnSEIsm4k9g
 k3vfB8dWCqt/q/owp8oWjCym/S//IpU=
X-Proofpoint-GUID: Pq_NeA6SV07FS-gDYl6E7OR678KDeffr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

hamoa-based SoCs expose their manufacturing bin in a single i-temp bit
of a qfprom fuse. Add the i-temp nvmem cell to the qfprom node
and wire the tsens controllers to it so the tsens driver can feed
the bin to the thermal core.

Use that bin for the GPU passive trip points so industrial-temp
parts keep the higher 105C threshold without a board-specific
override.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 66 ------------------------------
 arch/arm64/boot/dts/qcom/hamoa.dtsi        | 42 +++++++++++++++----
 2 files changed, 34 insertions(+), 74 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 484cb9ee18a2..1124da9817f4 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1478,72 +1478,6 @@ &usb_mp_hsphy1 {
 	phys = <&eusb6_repeater>;
 };
 
-&thermal_zones {
-	gpuss-0-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-1-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-2-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-3-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-4-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-5-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-6-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-7-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-};
-
 &nsp0_alert0 {
 	temperature = <105000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 443c1a5c212d..e25729ff23c8 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -2767,6 +2767,9 @@ tsens0: thermal-sensor@c271000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -2782,6 +2785,9 @@ tsens1: thermal-sensor@c272000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -2797,6 +2803,9 @@ tsens2: thermal-sensor@c273000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -2812,6 +2821,9 @@ tsens3: thermal-sensor@c274000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -8829,6 +8841,12 @@ gpu_speed_bin: gpu-speed-bin@119 {
 				reg = <0x119 0x2>;
 				bits = <7 8>;
 			};
+
+			i_temp: i-temp@180 {
+				reg = <0x180 0x4>;
+				/* bits = <offset width>: 1 bit at offset 0 */
+				bits = <0 1>;
+			};
 		};
 
 		pmu@24091000 {
@@ -9751,7 +9769,8 @@ map0 {
 
 			trips {
 				gpuss0_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9778,7 +9797,8 @@ map0 {
 
 			trips {
 				gpuss1_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9805,7 +9825,8 @@ map0 {
 
 			trips {
 				gpuss2_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9832,7 +9853,8 @@ map0 {
 
 			trips {
 				gpuss3_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9859,7 +9881,8 @@ map0 {
 
 			trips {
 				gpuss4_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9886,7 +9909,8 @@ map0 {
 
 			trips {
 				gpuss5_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9913,7 +9937,8 @@ map0 {
 
 			trips {
 				gpuss6_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9940,7 +9965,8 @@ map0 {
 
 			trips {
 				gpuss7_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};

-- 
2.34.1

