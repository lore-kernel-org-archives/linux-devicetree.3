Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B8542CAF1
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353009; cv=none; b=FRfcO24gGUBzuAEYHa+Wix+yJq3MdLO3UA8hx/gHi6mOxvae594lO0cfvVxLv0kiDI1HVdB/L8CHz097mMSk8aD9gju/WiUJTWoAPRV6lNtot5gXjwyF2gS9fDh7dVZHeNXUWkny7KUboHheDhi0gOBdrMNgP0RoBnOgJO8R8FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353009; c=relaxed/simple;
	bh=+NBAVrPIo7sHJ7MgnZXaHhnNEpFD2cpSnzyBi8ZsiQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qgqwvbfinBe0WsSndwzXJ9hG+SnQDZ26AQlCLyCIkids0yeyimqpfhzPyqAtj3XL6WT+d7q+pOepKLdX1Nmr04wI9PQCTRnlrl7rddNVBc2e8aROSeGNLzy7CV003tLKf+MHr5XdzqBykhf9GUve07JAI7ARVTSEKF2tA+ONXic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQl3TLLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIsN75r6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQl3TLLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gIsN75r6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF221956766
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 15:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=; b=WQl3TLLcwxuy4/TY
	EDnKyXj6tBvmvhmoZZpI4kOM0ifRlKfe4KC8xZqHwJVHax9r/Hzi4QXqC+KdqCTh
	Au0vyBRTXTdJrwIg2F817lOkUxHUqKrno7txf7SS2TmoULgKLKBhTLIcALc4niZY
	ifRaMMUe99PzmoYgrLh5u/yuY1DnFZPfm6GYWEsjaEaZzNN1oBXwj0fWDiVeLb3e
	sqXV0LvWyDBOT5SCvYk+7kvJk2WgXe+fOjoad2KiLDETn3eZpV1r8/MQfpfLT2J7
	nEeR8gkH5RnOJufKW4vDpjs9/NmkI56fkb+DH+QvMxbq8bYKoMPBOVAmZoTsWgII
	ZZSLiA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891usw9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:50:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915f6ff639aso576300585a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353006; x=1783957806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=;
        b=gIsN75r6IPmBXcFfVaSNv/FhynJ/Ya5zRC5/azKjo8iD5wSCIQv1RarfIHM1ISLU6R
         hL0W03XKwO9XS0Fj1wroDMJ/gu6xRr1z5MnD/olpIUfYl6k3x4TJFWDs30x9GMvuu0Mh
         CtaTB/Gd3SNv+NqIDE6cPfWqzKjFDl5KbD3m1p/nXamlWRAtV/yZ690oHM2wpQPxZpQI
         8mN03HvCmKAsyWUoPjp2vN4oeWodk5KHbsdTmscs7wULbvNl8QyNJ9TGgeCp2cDeMWVr
         DrX1weTQkVzLy6eCgjiS++kCsTV9kL5dwQL7WldunJUVTNT2ez5cRFf0eHF6RPzanwwB
         m29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353006; x=1783957806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=;
        b=AAam1cI+hKuTAa1llMLBnekoStG7QltgJ0W8XRMLwO/UyAQ2JLgvcemm27SeW3Rvsu
         XmBIcnoftKZwQ6SrhwkuOgNIPGAU5Jc5VHCIrlUPooNS3B2XLmw8EvZOEM9ZnoK9vBZq
         Q1Peih4Q48CeiB4QRmhcO3uZvHnEdjuxXga4Vz8xdvCaI808R3v2GRDzm0Q8OjFx9oWc
         AgprDSdjq+CCBuze2NO33BZ9o5Z44qjlnDDE9aI93zwK6Sbomfa7wZMI0X2wO7FN69gg
         wmHjQXqzlhd1EB+y17j8ZLGymvTkWi84YXUhvjMvP30KvLqBl4c/Z+7m78guHVuYjb9u
         fT7Q==
X-Forwarded-Encrypted: i=1; AHgh+RrkDNQjTmJ8MZ3I/ICcUQbFTuchCaPdn3awNijDHFqaUVImr3A9iIrbkA6gY2LiHJHHrYw6B4UXnvfG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf5XC1fOm4HmeQzCbYjPEeFGzpSoEniPaZnahSSbJToPdnxVEg
	WfAYgo48XLxrye+qRoD0nVGNln6VtRlW9nTjG3ScRuwjgT77UZ6Q90SSsjSV9TzRA1FjmAIQAN+
	RtwxyoZdpw/IH7d4PAPDKuzfy5fb5lyFLkDHlebU5/Zfz/B3vSyHXt2vmZYI0JCH2
X-Gm-Gg: AfdE7cnJZvw+zl1RVFRewM7DmP61XWGZLug297DAlmQ6IsQLx4D5BnZKt3sz7aRi8/5
	obf8lxRCdW1E4KfoJsBUo2gfO4AoGqnWSdtLjcSexpJE+HNLQiFYigXVJXKYZsgl+GsUPmAsl1a
	Nv7OeC497NcNytN+6GNQwtAJuE7QpZhtepyaNFFGDcPrc6/9knvZC3GZtM7uYvOmJ7L2VLRojax
	vBj/vhbhdXErfHTlvptrtfEV+0YardkmI3XZW8Fv1YZaHIXE3Y9MGPgDsE55N7l7XgTswBOkjyG
	8yWQQ6mJO8HBW5uuesoPEeWedVGzjBomhUC7IPYTr+uIn9h2a0uCixrUeABRlq4D8iDuZ5sz8rR
	+LyGrwfJXEeMbqHk/oSZjvVy9wpzADQ30nHyWeJuHg3MLcvk4kuyR9C7FNMCi/sAbEXCrKlv6rr
	HHx4wHqMTe9PqBTbzmpCF6+5xGBjjWKJz96dzmm4QO4Ukjp1NeJNeODnPJlInXlwg=
X-Received: by 2002:a05:620a:17a5:b0:92e:7e4f:eaf8 with SMTP id af79cd13be357-92ebb4d8ad6mr154269885a.23.1783353005988;
        Mon, 06 Jul 2026 08:50:05 -0700 (PDT)
X-Received: by 2002:a05:620a:17a5:b0:92e:7e4f:eaf8 with SMTP id af79cd13be357-92ebb4d8ad6mr154263085a.23.1783353005532;
        Mon, 06 Jul 2026 08:50:05 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628c16fsm801997066b.37.2026.07.06.08.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:50:04 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:49:58 +0200
Subject: [PATCH v3 4/4] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-monza-leds-v3-4-37ea8c988363@oss.qualcomm.com>
References: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
In-Reply-To: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: _jDBj3b0tS3CAneib_Iu4lgfLUctWKlA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfXyEIjs1tEzqAo
 JJYHa5MCH7z1FvOVAU95rqRvwyLVT0hMCB2ztABN9iA8R4L/QFmeWoObG+35JGHz4PUXeM97w6x
 WhPzP5vrpsNBcrOH7r1t8kk8mD6ulj0=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4bceaf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX9nF5KFbpf1fF
 cCIflWYkriredsgzqD+8vVLJcCrH38TDluADreCaeqQIBg+FD2uCN2DXG5vDkUGl8tDKa+mdc5H
 KXFszxQgizcmgpsJOk4hUM0YwM9dSoF+LyenUEVwhky71mcoxJq/xFWDsQC5Zi30cAs5Q1w9CO9
 qigCtuaylzpgAmNPVGBxW+2s+vKE78caG6sRW4n8Ng6DgP1lWqsD/I4uKKUsVe43nWTbFBKjhJm
 6WO7VfGxa/0XlnqnXn5xjFWTF1V0/Upm/SIRdOVP5BjAqaftuO9rOmyhwASvewqUPjUBqmXjuVx
 gADSPjBY8kSTU0NHwDmtVzsN89hk2vEb1KDR6yqKU2UkYmkQaDf5IxGtkzavbt44YhtNROpY9BA
 TYPu87nf7ADtE5cPQtJk7v2kpjzbVBeF5ofuAc5rSDNXraoxOqFazySD5TkrU6INDOxuN/LVcCS
 Ll9ob/vyIX4K4KeCB2g==
X-Proofpoint-ORIG-GUID: _jDBj3b0tS3CAneib_Iu4lgfLUctWKlA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060161

Onboard MCU/STM32 implements a led controller compatible with PCA9635.
There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f4c8f6b7712c5d340b20be1b9217c..83ccc4eec342328c78be37d4642b772d74a8ed37 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 #include "monaco.dtsi"
@@ -156,6 +157,115 @@ vreg_nvme: regulator-3p3-m2 {
 	};
 };
 
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	led-controller@22 {
+		compatible = "nxp,pca9635";
+		reg = <0x22>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		multi-led@0 {
+			reg = <0>;
+			label = "stm-led-1";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@1 {
+			reg = <1>;
+			label = "stm-led-2";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@3 {
+				reg = <3>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@4 {
+				reg = <4>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@5 {
+				reg = <5>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@2 {
+			reg = <2>;
+			label = "stm-led-3";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@6 {
+				reg = <6>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@7 {
+				reg = <7>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@8 {
+				reg = <8>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@3 {
+			reg = <3>;
+			label = "stm-led-4";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@9 {
+				reg = <9>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@a {
+				reg = <10>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@b {
+				reg = <11>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+	};
+};
+
 &ethernet0 {
 	phy-mode = "2500base-x";
 	phy-handle = <&hsgmii_phy0>;

-- 
2.34.1

