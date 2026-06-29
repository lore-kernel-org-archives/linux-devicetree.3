Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DC031E82A
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 19:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762745; cv=none; b=Re7hy7R4UAztVWOyc/7nu+KYxC0Jc7FSAQ/tTIECzUvfPEQZkdNVsT7tMK/dsdpUZgXMIoHCSyVT2IglKDEl3lhgAEP/IfriR2swAaNlojfIy18ArxnO144tpgQZCP4I3q2B9wRzjT2su6zHbExqlRC1XSILBJYXc9XC9pJRwSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762745; c=relaxed/simple;
	bh=xzD9r7m1mdIsz8vG8N/LmGO1tj0nBeLuziDr8pQ4fYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sY+fRTpSClZVMfLajppw3R6a9Fk6aRr9hCdU96RvDAuF+ljH1ZrCfetIi5UaPIe49nxgdf3pGz3+rPh9xd3JTrQSvvM8N6RlK1D35Ipq2MGL8KYwpiHammuZcgB/eJ+1W6/9HRnXFKG5YH6ilZaOT9hqfubEtBQFVIRbhsQizZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pnl8g2+G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tb6eZlu7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pnl8g2+G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tb6eZlu7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGJuch3448305
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 19:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9bp34Ti6ivWdInuxYzOVcR1zKZg/fDN2ENN/Gc9YdM=; b=Pnl8g2+Gc00JSQte
	zEfbMUAg+El0+G8hjxrGuPrHtz9f7nHwTEqEmBefloF+tlPw54SQYH1oIMVGGIXB
	F2KgxvlLrkGa1OlSSsYEVLwkb7SelKzvJfVHLVWGKTug2g6zg/lpyhLxPVHisl4V
	0SSMBT/gzbIBt8m8XVD0MO0a++p9a4ezbltBQ8sh7lag4HyTxx4ujUPMvQJ88ygT
	yChmPTqzjpD6rmEE+9alY9wYfruvb+m4gdtOrdKEwPV/vOj6l3xgmATeww3x02RZ
	PCQFg3flAfR+E3Hd1ulBOO3U/vMt+QYEbFlmlnZj6kZatDCThJ6LQkVSj5iTDlZZ
	1cr+9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qhaa9j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 19:52:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ae405b5eeso489715085a.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782762742; x=1783367542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9bp34Ti6ivWdInuxYzOVcR1zKZg/fDN2ENN/Gc9YdM=;
        b=Tb6eZlu7VvjevwAjR27EzfrqlaImWrmokl3x1mCHCDIDpPns7sJ98PMxT9opC0Vs7B
         m8pHKnh/AaVDVRbNDIrZ6Qyhc7XqgljrNlTX8pjq8LcDKhOh5LhcDVH3woJN/6BMCtNC
         YcPwANSjRRsvwkk1FVI9V+s+7ubAoekTrtOhJA8JNyOo6flbsVEHuvIApBFdgShUmw9o
         J+CjHBQt85+mlsoWZPhf3wpAtQBoW0Uf8RZ9EgaGjZsfcBNx2dvXo4jPtyIu1vwPbl9u
         EBgegeUqEfYRulFkbseNW3vqwStzjydAKe+YZw/s3ohlSrMevtQ+pZadcV+C/ZgpQBXL
         4yAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782762742; x=1783367542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p9bp34Ti6ivWdInuxYzOVcR1zKZg/fDN2ENN/Gc9YdM=;
        b=lKsQITj/LbDUEzo7GzmGeYmi7ANM/9ta8PDXaQXj4E7cFsuMD77hsPMIXkWNOH6MRJ
         EMUSJi+m7/V5FTZmZ/FudFes44B8kZXuph8DTOmZQrZC1+UoPN9s6fiPaOnKPWvZGvOi
         URdV4GPAGp9KcbjkwkDeB37q3bCsbnu484iOVPq0i2kpk+UK3eyXbrEDOrstLWH52rNO
         Y759movbV45vOYrl3tk90B7anB5OEflxrHrTRSzFxVpPuyHGj4q9j67vdeVMNAC+K87x
         6SugT7zUUc9g1w/WxE7IsEkrRBs2gLbpUed2HnJWlhJCvlHPbFRIzHT0dYg4H7FsjSPO
         gbMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Z1A0ZJJGChGPl6nAtUKInLlYAlJX/UGnQ3WO+Obl7xI+PhyPH5puTf3nJD7Bgj32qI+63OU4nCy1s@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf/D5erjkg1zGswn4UHGLq48u2kHS+L6zTX/Fu8La2x9CE/uhY
	g7X3VPSuoN+CBJY8c0C1E8xkC5IYsTXPgVMjT4PhJJmXpmWALh36Np+o4R1xdNK5p8+FF/Mbgx0
	dGJs4gQ6UH0XT957Y1Y7TeGHFHtLUaofW8cYTEzt0KCNXpIVBmc8OXufXeVD5EZ/yWPMjI0c4B+
	Q=
X-Gm-Gg: AfdE7ckn94esi2wJpo7yrmOSsl0YOk4ByZ3I+YVWhVcmu7OlZvO/MCyGRvUl0vbFl0q
	jDiCnRLwOyHzok4FCUDz9mcoAptTYibzci7xKWQKu3zKRAJ//H98fA9ey+lzXZxy9gPQs2egHl9
	JlYSzo/Fo2TNzEleEbmmY0i29edYvw6kYjme57sMU4J5qnXBTIpq9wFsdBlrg3ICmRtFQmavbXW
	UArcGMg+r85k+bNSHFMu9YF7lC45Op2YAj4taD00OI0kgTNpCj2uqhUDYk0ZMHdDhcyQwGqmRbX
	KP4hPyk4d4RGQwD3qVyADngTibp/tGDi+nngIn0oyvx26w0smna0k0/IOO5HOZETnovMJwXBiSC
	u0IhFO6jZuvbGzn4kq6DmkeHitMUrS8t3ZPAIIwzCVTfz2oQ8rNA+b8/pJCW8mjorUBfy+RVvkR
	2jSA3haHARnkD/CH1XhLk0ZQ/nDWcZBE68U2Kui+V+xDZ86qVJB6LWyB2/nPEx+JvNIgE+DzOV3
	UqAxLBhXQPri1MitoF0
X-Received: by 2002:a05:620a:4690:b0:92b:6805:9193 with SMTP id af79cd13be357-92e627e2931mr164293085a.59.1782762740781;
        Mon, 29 Jun 2026 12:52:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4690:b0:92b:6805:9193 with SMTP id af79cd13be357-92e627e2931mr164253385a.59.1782762736442;
        Mon, 29 Jun 2026 12:52:16 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8d99565sm6360005e9.0.2026.06.29.12.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:52:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:52:09 +0200
Subject: [PATCH 3/3] arm64: dts: monaco-arduino-monza: microcontroller LEDs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-monza-leds-v1-3-0cf7c0a7dc14@oss.qualcomm.com>
References: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
In-Reply-To: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: N8-ZwQYibVU4vKtZT2KgB02JIAd6skMo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE2NiBTYWx0ZWRfX2tbQj78dbN5X
 1imEiJDa0ZYt3SYlFmg31oK3Nal05rSA3RfNTYyA8rJ4kpl4q6YGVnikfe4NQIBpLT1l+pmhg27
 fGf7NgJ0XZorr3RLtAtqlSDlJRNXVXswhE51iPfVgOkjT/f0TKNd3vjJzJW7BdygbgTTSLDODFT
 c51zqvJv+2UzVV9f8ev7MyKOVgx4TDBkepFy0Bn1oL3zGbtE8GxuC0oxCP3LXSyBDqKf5YcC33b
 FkXzESuCGlx8Rbh0BlDJes+43sh0ZI+y9HWJpsTK9tRizAOt7NNxsvv5n1RzeKPE5cfTvDh0kGA
 CMaD6z70GXXxoLOcw7dh2fY3FlhMW7c1D3x1uvW+LkCmMS967g7AD9aCIV6aMirlJkOwAmKrc9K
 QONGWR6RuNai+bRt9C5Op10St1rwNlcVYB/vZ0RTKfOlxWiLp5N/kGjicvLVliAiYUkgJPDgBo/
 rCWkFOeRB2Suhu5fs3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE2NiBTYWx0ZWRfX1PXrLEq5izPA
 bUIzcZ9v0CWP/X1kIhJW44fHCoe+VeYIey2y5SLDHnP2G0YZgj6ElR4m2pj4rongkgApyrXRRC1
 UYLkEt7G3qhmdYaq/4/cqPt3A4qVvgA=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a42ccf7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KhZQscbOQyvxDa-8kVMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: N8-ZwQYibVU4vKtZT2KgB02JIAd6skMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290166

Onboard MCU/STM32 implements a led controller compatible with PCA9635.
There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f4c8f6b7712c5d340b20be1b9217c..71685e54a3781c9b03fc41cacecfea77650a7182 100644
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
+	leds_controller: leds-controller@22 {
+		compatible = "nxp,pca9635";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x22>;
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
+			led@10 {
+				reg = <10>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@11 {
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

