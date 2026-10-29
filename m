Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281696;
	b=Pg39hD8XT5Xs2XaAoFBG3l0m3XjffuMYNgJ0gWa0F9I0rqAEKHxG2v2kvwsO4dyqsPyD
	 KV8oNg3kN39zx+3fFZg5g6RCeNz7VHopvgY+5FMfqvJJs5VCFKe//sXuMiCe2+0mS3GL0
	 5l7tsYGNXcd+DEwqmXkedqvw0L57SgqwXiMx4cNPzpKsZ7QrIOJ3D3482iMKjH0VIBNzw
	 /gDoTsiN6L8vPP0K7iNVS2LSEtpn+hMrUks4huEBa2gBvUaZLlCgdeTZ0K6ABb5+gKVG7
	 S3n/2MzGtURy4Hckhf5FKOKDdWoCKm0ShJeBINHWsYIe+gJ/NvbsCUty3Z1OiyTxXEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jXKeKzN/pilCFN2LzzyvMic+Mh8d2JGYFvLNRqQ7vuE=;
	b=M4TILOEOTTVK88+CbsUCEqfHHfWIvTD8TI/JN+jjENx+cZqnO+2TmHcH6SdQdNxnAbnW
	 qHPi7dQ3N3eW4Y+78668i9O1KOEJgxUBSviUFpF6ypWZAf9/iJ6XwfS/EUh4nnuq2nn2k
	 aAs2oKSg6fmMxk3D9It5pXaATJWTJPbdAI16ibzY/nZzi7EeKdSP+jSvPikjuuQpOcZQe
	 87DNDwDxtbYQGcjJXftmdIncbUSwXBpY/1lnDTT/Pk/TH4jM4X4WNsirYcKYjXi5uM3uA
	 /zkOYek3kdcTS5U+NtC6nQKrQ41rthEy50Cxw2O9VJX5hACTf7nM35Jn/DQ4GEoMtHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oycURl5b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Myx1cY+l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1B6606A31D
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C1B6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oycURl5b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Myx1cY+l
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCeU1o611189
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jXKeKzN/pilCFN2LzzyvMi
	c+Mh8d2JGYFvLNRqQ7vuE=; b=oycURl5bhy8vrp0LwYMC0VvX86k1KmXFh7ECNj
	zY/A9vR0b4wO9B7BT7jg0YrTb8FqSI7DMqANV6iWOeb8HUiX2MZ23pUNp+go42OV
	OgDVXlDJwtjpqf8J8urHa0ospM06cKz9V8CIohg/PWAJElSnf1it0D5XByhJSkKV
	HM3PdYTjfwfBu8oqRMsuwZXlmMGbYlWitseX7DLCYKLhgaKY6zOr3ObbazoX5Aph
	bULLaGbW2C2snLD20Vs1KtgElvXBBbi3bJfTnuD3LPIJXJ9i+ijDU2j3whDIZb4w
	dQwSIAszLhkmiZXsjvc1x5NCSTRs70bR9lZxDgrB0q2iwWfA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmpavv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:48:15 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-82322894f5aso1127682a34.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793281694; x=1793886494; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jXKeKzN/pilCFN2LzzyvMic+Mh8d2JGYFvLNRqQ7vuE=;
        b=Myx1cY+ligW5/p6Q133YHsCAvS/XsgC96yZqWnqVAB10E72B8J9xSNB3FCAH2QZeng
         BBK8th4zJFyt3iyn4G3fnEc/YozmmfQG0FMlCZMYaVU47bN4gA/Tpzyd4eR5LHo9KXlj
         HvXeM0q3nfVbbwNTYOFf74yATS7eEDnf9jm+2fmsYZoNAF0Fm4dUZpygxlo6Ck4QpvcA
         ufgG1V4B6cssqj8pL0EPl0CWAmWeoU1GrSR56KKIg/+86A4PQAH4MvrKAcuCsy4x0cx/
         hZ+en2p5O3Rlc99x+m8lCRpuOYozQ5jht4Fucaqt6BnbfO9NbvfyKJN1+5Tzbo9QF5Hq
         mr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281694; x=1793886494;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jXKeKzN/pilCFN2LzzyvMic+Mh8d2JGYFvLNRqQ7vuE=;
        b=sPnCmHKPm/ZpKT21cbdA7oJnFKYhVkWG7fcRgFoI9SxHFXraOhp8DfMzfGVV8C4yu9
         VM5vA4Kq7AiSXfBXlxUm9J9HUZdzlJfNre6A4aheP2tdkEkTgSXPzCA1HKIJ45KawiA/
         iuuKJzqsAPMwbwF2kS8Zm8BeoE1sVzGUJoSVkXUqlrgKcZajyGeewKfv3IOJSX4ZXfyH
         SA9UtDxa4I8Br98x/EYImc8QMUlFA8AFUneDiXx3NyecWxhcTEgKL5JxoJb/lBtnTxQB
         2a0+YyjiFnlNZcsRam5FqazzG8LYyskZWrvqTNiHpYsGaO5f4fOw58pAv7q+/QEw/IqS
         6UOw==
X-Forwarded-Encrypted: i=1; AKwUvByRn62UhVCluQkfDb9cm1bhoIwFvpKc/VhGFmzWMEUsYMwofSg9rxCqVhoO4LrSt3JZRR6kV0jpQ5t/@vger.kernel.org
X-Gm-Message-State: AFq9FYIIYMqt+EEb8d3rDLDVCnyWLROSzveF8knZfCniShaQaAeJo6iL
	fnmMbENi9qFKIJ4nD+rFjMjMzEZ9P7/AAOHmOwBPw015koEpAPyfzObgVuaj49I0FwiR/BaDisD
	nhBa3Al6m1jx69YgsDLnSjRK6QRKuEV1YbuvzdNeLCIMmHuUPAzHod4TqyZ5g9w18
X-Gm-Gg: AYBFou3fjVvlZcerkAodIILirKvi1l2AwHSw2so/f5WFvngsmQcMIfXEyUHNR2eZVxh
	fLoMVsbW2R3+eEtpxcnPpWmTr94EBz+t5RNg23e1FoVbNDzMRTvqb9J+0WiL7fOiqwGidCF1/+4
	VLqUAiQOUOKigyUPy17t1V4iPnMQt6THGNcacZU74eJuutWS+MahjDaTg7GYyNsQhUeBBb6Q7Na
	LsU9xknRstve6iyE6ElqbCQB+JHyiXc8WNz0knd9I0PnIGBxftZkGixk8wU/Qnw0BXt9UJb/xjA
	PNUU/uLebiXlPDiexehj9hRFAc+qlSGENET1yAcAAu8iF5rAKICsI5fya8B+kW7+1T2M+J3rXrT
	JZWSA2mF9VwmPmQCqti2elDymnJydl26IpQ5GY/G9Wbny8dbPUx/nSelCXwkeZkGpR3qkpOz9bA
	==
X-Received: by 2002:a05:6830:6512:b0:85b:895:a015 with SMTP id 46e09a7af769-85c1e2b69d3mr1597840a34.4.1793281694278;
        Thu, 29 Oct 2026 06:48:14 -0700 (PDT)
X-Received: by 2002:a05:6830:6512:b0:85b:895:a015 with SMTP id 46e09a7af769-85c1e2b69d3mr1597804a34.4.1793281693358;
        Thu, 29 Oct 2026 06:48:13 -0700 (PDT)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85bf6e90bddsm2953546a34.0.2026.10.29.06.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:48:12 -0700 (PDT)
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 19:17:59 +0530
Subject: [PATCH v2] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
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
Message-Id: <20261029-pm4125-adc-thermal-v2-1-8f405d9dac96@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI5O42oC/22OQY6DMAwAv4Jy3lTYCQntaf+x6sE4zhKplDahq
 FXF35fCdS+WxpLH81ZFcpKiTtVbZZlTSeN1BfyqFPd0/RWdwsoKa3R1C6hvgwVsNAXWUy95oIu
 2XEcPxhsfSa2HtywxPTfpz3nnLPfH6p72peqoiOZxGNJ0qiIQW8sGuaO2peCawMLBEvqjcxDAy
 tG4BtTH1acyjfm19c6wyfY0tP+lzaBBm855iSjMHX6PpRzuD7p8vh/Woc7LsvwBCkPAKgcBAAA
 =
X-Change-ID: 20260812-pm4125-adc-thermal-4c0f713737fa
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Raj Aryan <raj.aryan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281688; l=3831;
 i=raj.aryan@oss.qualcomm.com; s=20260507; h=from:subject:message-id;
 bh=1C5I55yGmjLN0Nas8rkFH/+6WHwMlufDhf5bwLLh0pw=;
 b=L6oVrRFstuUcc60XefG7J4e+UX5cMDtxnNg2zlVuZxrahrNxjtAs2IKgge4S35WsEMHvNPs4M
 apONQqoDwArA/0ps7H9vKzmy6M1jSK9KyjBY284qKcReZHeyUN0n0Pb
X-Developer-Key: i=raj.aryan@oss.qualcomm.com; a=ed25519;
 pk=NMkZ/eGFLSObYX6FfysQiuEElPoUYghk7+2Jtc4VEBQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfXwiqa+aZs7OZu
 +ZQI4PnhJDF7m009idHrZwA7KqMtOkmifrQYmcawIIcOPpOw7MaLQxHDBtxxh6zfwCcAghHsdeU
 GV11p2FwiHO4i1AkWOqZAqdDySgt7w6xrOgEnIPzBt5dgVnK8H/ixbQs/1nxfDZJZioKyqhfZJh
 kr7yOVFXjkl6c9J52MNuER7sPMihqqUyM6Ym5uPQWg4+siTXAXIelFmaLP+JW+6kkyWcczmIFBH
 lmcHTf4y0J/CSpNWKElmH7cNaEBFzyDiYWvXFe0MgiIM+fSSMTDnR+MdHx+PgVL6L0EsSHrs9dg
 aY6Zfys5twWq/dlDxhcuUq3PKQ9/MIwli9eMcC0pHd71MdEpJOt2ZUJZfWsLmtiW9EUi2Bkm7dI
 pR22qGU6BruTY0BPlpZbSM5OK8ShefhQ2WrcA3D9q1rOmVc1zn8CXj+FS1hf6w/kaANWaUKMelJ
 hD1CTAuy1a/6+WVH6Pg==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae34e9f cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s2S2f7peMjUm9DWXigYA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX97B8/Y0AXXxj
 oL7Aqc1RtEX3+9/KFKY8simugHJDG0f/Wy8k/G74MV/j8uoNZW48OcKRrL8880USSU5H1JooGao
 BTFQ5v2bIPnKicTOz4yHgvJJQ8KDZ5g=
X-Proofpoint-GUID: QzvndrDJc81UHEsqHMUxgrS4aShfvV8E
X-Proofpoint-ORIG-GUID: QzvndrDJc81UHEsqHMUxgrS4aShfvV8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290053

Add ADC channels for msm, quiet and xo thermistors along with
their ADC thermal bridge nodes and thermal zones for PMIC
thermal mitigation.

Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
---
Changes in v2:
- Moved XO channel into pmic DTSI file. 
- Gave meaningful name to thermal zones.
- Updated the prerequisite/dependency.
- Link to v1: https://lore.kernel.org/r/20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi     |  8 +++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 83 ++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 77de9db8c119..bcf777e465b8 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -156,6 +156,14 @@ channel@4b {
 				qcom,pre-scaling = <1 1>;
 			};
 
+			channel@4c {
+				reg = <ADC5_XO_THERM_100K_PU>;
+				label = "xo_therm";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
 			channel@83 {
 				reg = <ADC5_VPH_PWR>;
 				label = "vph_pwr";
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index bf6fb12ad990..17bc2b984c75 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include "agatti.dtsi"
 #include "pm4125.dtsi"
 
@@ -33,6 +34,68 @@ clk40m: can-clk {
 		};
 	};
 
+	msm_therm_bridge: msm-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	quiet_therm_bridge: quiet-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	xo_therm_bridge: xo-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_XO_THERM_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	thermal-zones {
+		msm-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&msm_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		quiet-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&quiet_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		xo-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&xo_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		label = "gpio-keys";
@@ -333,6 +396,26 @@ vreg_l7p: ldo7 {
 	};
 };
 
+&pm4125_adc {
+	status = "okay";
+
+	channel@4e {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		label = "quiet_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4f {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		label = "msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+};
+
 &i2c2_gpio {
 	clock-frequency = <400000>;
 	status = "okay";

---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20260812-pm4125-adc-thermal-4c0f713737fa

Best regards,
-- 
Raj Aryan <raj.aryan@oss.qualcomm.com>

