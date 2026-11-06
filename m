Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002533;
	b=KJTsfQNtdhSoJSe8bnmDfNPm4xVCdznAZoHUv/hdphXluLZoRS51hWmZk72nt+C0XmaC
	 9HVPRgmp8BGMpe6cx0+fXva9UPbjr04ApQysbJaVhN4KEcrhw1qONJzM/6i3vlk7cm3zL
	 wWqM1OE9ffOQHuxmhkujmX/K93xjOVl8TXW3/nrp1BpEmjmZEyc1yr8gtbTvPRO538Yr5
	 MDb1qJBMLjtHyHgZr3ZqOclTTVWPMpX3bHdOLoppvmNyezH4lQmRhZfH2afCRmKuHLY55
	 6g79cLy5VCebMKF4KgeiecIYOvEoQiqiqEJJravnh40G4wRQVMIqOniFdWGp6f6lBlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002533;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=O75GwW5quoXl0BcSIlhNX8tci/2VLQQ/unasvEdGNxA=;
	b=bzUV71kSuUI+FCI8Kw0+cu2ji1hQaKxxpP2oDtijin2Zl8f1aQtZ/RmzrlWoMVUcNAhs
	 JCQBnP7qXqQiMA3xNH3BgJAWR+ZxxJyzy0wp55s2s87/E758XWphFKm4pyBakrwNr9m1v
	 AEj5WTDiwL22pU7FwsiTtcQ6hZ2uMw+uB9xtYYuwEulTM9T5auUKaHtwWlRej+4I3bDBr
	 8nI1fj1aHGwQTCiVcubwvhOkeZ2jJt/N1JG2eO4uRbFlDy7zD2Z2U0snZ6T5k888TQusM
	 thWHdneG0iRzKS4xPS/KlujLJ8AhlCSm290r2lxivrZuM1NwFquRm5duX9ia68fOvNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gRXORdhC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XmkZ4yAM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5797606D822
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 22:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5797606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gRXORdhC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XmkZ4yAM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6JL4Kl1699895
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 22:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O75GwW5quoXl0BcSIlhNX8tci/2VLQQ/unasvEdGNxA=; b=gRXORdhCts2i1YgX
	BQtNGID5Igg5gTtvX0XVrKRZQIRmVeLDKv0M7ra1pfag+ZrhU08+7rXvqeAAfpt+
	jrYjOJZlu+ioAUoMNxZXKFDnapmb4wPq8TuNeIyR87NDEaHdo8Yjbru1BuMM2cQa
	yhsdZX4REdlqlYRemVFVqvgJr5I2x5+YirfaBJ08vW5AN5DB025am4yJvkbvhQh1
	/ENs/w8ZYW/4s7/BpmCw+m2gdamyjpxAW8+9bNGoKJF2wBKOlbV0yaqsVKIS0QTG
	GQEsJpkqmX1R/zZSTFUXMPIHrC/nt+v0G8kp4h1q3vNt/J5TXMVyIsjtXYeDlhtV
	BOVjyQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmypgj89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 22:02:11 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-990835cec5aso99621241.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 14:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794002531; x=1794607331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O75GwW5quoXl0BcSIlhNX8tci/2VLQQ/unasvEdGNxA=;
        b=XmkZ4yAMuc4RDsp69d9LraM83QNs5aWa9q2o9CZvzW3q8zqiIrOA3FtO7AdwtmCwWV
         gwJ3YO6iUb/60TZhQhEWmLCkc7TkAluJao5ML2I87yvwtc5508sdC5CSZ9IK8Nke2XKG
         B/zFceY2sf5LOEWae4YTe84f/cI0LczC/aJo0Nm8piDQPjB/6bz224y8qMZX/X0MC3Sy
         WuheFUOxoB6WXFX/vids6tEF8yC+ZDiE+/1wSRTNEjVzDzwWe//aFzL2pNpjht/tAU4x
         KO64CVcViW5LBm9T3GBQnjyheFUTyki59TG+0dKUpNv+TK0LvCOBTxeJb7b9HK6C/SXA
         xQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002531; x=1794607331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O75GwW5quoXl0BcSIlhNX8tci/2VLQQ/unasvEdGNxA=;
        b=G0ITVnizS4AbvEviHRQKM3ApH27mB+m86Tc8Fw6w7QvFI3FwdW+LdBw5IFXOC/3pfD
         3jxbura4uv/dZs025K1mmKEteZtXOa/AEzLjVtaGcRTVv+ZXJNABw4KC64jOS8ZJhyxC
         2ReWRNyPIXwKzF41QPmLwUxEkSCVoIIy5/+hzFgirwYysLs+Y/VKQf9MKg2gGJBXr6no
         zsAWKnItYB6RIpik8S7U4P+q/McV+/O469Zkxq7z30VYvbacVXkLFR+P9ue1kZCCKM4d
         hzV5vcG/HRDSnOzRuR3QFR199iBnn2aZCEwQFToSYN2dlw7MWYoPYWOcUWo/FmzKvXla
         IlnQ==
X-Gm-Message-State: APuU4Z/4wlEEkEdb7A1YQib2c87oxb++5mYA9nWOwNwQgE5sMGu0CrWg
	SuQJl8TDzqpSqOYH2RXepdxg4dQNQPngH3+4tqD/fR2N5q9zi54WRYII/CZSpISObDnnchjw/ly
	Weh8Y/LL+OK2vMZ46IrpQHdgRaxpGFcgfcjzI5IBlpNmvUkZA0Dm0OdF+FEezu/C0
X-Gm-Gg: AYBFou00MceLrqm7esCn7oHXpYFu25xoCSb+v2IHKb10dUUl6tBJz18YWbjDCcKY5Ux
	y86GqOLIr79ofz7ZJIElZ3yGtqrmiKgNjiNDSntJ8EekIDaWuHv3JzVBYOiGil3Co1qz8lAFdt/
	FAireJtiCcXDGVFOMI7TsoxDMNTkt0x/bc/nrLk6dKugW3YcH2aV/PW7jCXCva+78wHBtMRCGXN
	4Ip1PP8Mo19UCCAxQx1LsTCwF32yFpijAX1FKNw3Yrq/zhM+cbtRY7RbNke5JCn/H5aN7q8QRBy
	LCSA4jTl5nV9M/N1SwUvX0YVARl+YDI63AYUFVqUWUe00AiL6yfrJmH0FRT5VG3P7Gl4URvjojG
	64+7oxXan1k2dU4lv+VL9gh4SOeAAc6z70uVVqgQN0bNug8ke+UyizWWZzQ==
X-Received: by 2002:a67:e710:0:b0:7b4:9eba:69dd with SMTP id ada2fe7eead31-7d2bd9eabb1mr67594137.45.1794002529831;
        Fri, 06 Nov 2026 14:02:09 -0800 (PST)
X-Received: by 2002:a67:e710:0:b0:7b4:9eba:69dd with SMTP id ada2fe7eead31-7d2bd9eabb1mr67580137.45.1794002529113;
        Fri, 06 Nov 2026 14:02:09 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6162sm5812437f8f.47.2026.11.06.14.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:02:07 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 00:01:54 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the Embedded Controller
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
Message-Id: <20261107-t14s-gen7-ec-v1-3-f4a8edaac447@oss.qualcomm.com>
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
In-Reply-To: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZRuR8urqXbfjmra9eBgfstiezyG+KjQ2tGTK5mUoxrM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7k5XbGwrmbI6wXy3YshymRedfydChFZSrqa+O
 P3Of+nDj5uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCau5OVwAKCRAbX0TJAJUV
 VhLaD/9rRE42Aw46TEo2LJbXjS8hQEuDsJvU3vGP0AKO/sLeAUmka11W8I6erRPVEu08NvT5XP9
 jpkulFzIFVDdW+65cOeLZAXuXrUaMt0Ihl4L1f5pQDEdaPx1v39it3OHz3fPjkBPxTQSsDR2HW2
 uw4ATXd1i0ab5jNfhZxWjAjzA57Fkl9H9m738j0mRenQCpPCHwRCOQ2B73dpSzkL2zSa9ftyBN4
 ydN5MP5BznIUX7TeCiYO+vruhy8W905D3TFwNbic2j+8AtBFixT3K+0bmRnn4v5Vm9pYIH8fviE
 vvzlzpJ/fjJknvuT9pLqDKJi2AienX2/GX8fb2QTAfBv0+94Ho3Z5RHftXBn5eM6G4sWgXBFv+g
 xyWLichrTYZEypvOwuXA2OLa4f6FZeyDtabRuK3dQoExFhQjKkAD4Muoyl8zjJJHpZ7PvJ7vNsw
 GoUvi/AdErciNIRqgTJ18FBmpFJmcAO9ma8b+xZjHae/U7azv2pkMdm1G1a7s+mVF6WFrfuiX63
 EfjnVlkz7i7z4YE5cNYsWshyz7cRPHmE32gtJ2r7Vny8D6xJJo2tLaGsTkD6aWfNSqN8O2AdDBV
 WnLn2Ti31CliaO5fr4G717TXzmMfm9fSb/Ht2b7xK3RcqFg5dTFcs/XS3hLZgHgWOtgBfkUwqkT
 j3bjyD9eeA9jDXg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfX5k09AJXMLkzf
 C0gtDax11Izi8KpDsNRrdCHsPZmIrgl5ERCyXF55WKyEeGMS63Rk3ju9XVOLLQj9hLdDGP1998D
 XMDc4qKpYAdO+DhTquA+q4xYqh7ei0zXfKcafnWf39ap5bJQ5HMquCSvm7LRMJccMsF+4McMkHC
 psBEHxNLzKTj5c5A2CRfObg9+dznuVhLawiW+0bzVZoM2xSezdpVrczPSCEMiyboAuQOJyJ2bsu
 VGXEJ3FSXARabI2amvCiS0CnMrj8A5C9dO6TuzZF9wlwxNofnPfGpD5Uk4saz/4c1/bc3iVDEhK
 Ym8XW0v7deFlInBeTFT5AI5waLiFzl3gJyBr9X1MknwARxnDNyhUHh9ZcqXkW0EH18HCWeTG+fb
 HPAombLlJEO0oJ5ACU2Dh1bYRGu5fsG8OD5PUX9OSRU9GiGIQ/ODZuirUbG0w80TuAJHdtQE1pE
 BL62dZ4bpw2T0Id7FJw==
X-Proofpoint-GUID: 4lyOGXChJlcNfYa2FCclrf_lPJMu0RpB
X-Proofpoint-ORIG-GUID: 4lyOGXChJlcNfYa2FCclrf_lPJMu0RpB
X-Authority-Analysis: v=2.4 cv=TZ4DJhQh c=1 sm=1 tr=0 ts=6aee4e63 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-ko0rdnKxUD0urDMsK4A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfX+WGMb2+khxeZ
 D16nECGOAqw+ttPunIpmehIcyZkZA8fQSMWLqIFAUbbf2EE50rUCUp18hHEsge1LCLVGazR2lqE
 ribNpNRUGFfUTm0GvHoCEreu8YaP8ps=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060087

The ThinkPad T14s Gen 7 has its embedded controller at 0x28 on QUP
i2c9 (ACPI \_SB.IC10). It uses a different command protocol than the
Gen 6 one, so describe it with the Gen 7 compatible. Its interrupt is
GPIO 66, as on the Gen 6, but the firmware describes it as edge
triggered, active low. Using a level trigger makes the handler fire
continuously while the EC holds the line low, with no event pending.

This provides the EC hotkeys, LEDs and keyboard backlight.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..05814dc8d905 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -735,6 +735,24 @@ ptn3222_fpr: redriver@4f {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@28 {
+		compatible = "lenovo,thinkpad-t14s-gen7-ec";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
@@ -987,6 +1005,12 @@ &tlmm {
 			       <44 4>,  /* TPM */
 			       <139 1>; /* TZ trigger */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";
 		function = "gpio";

-- 
2.54.0

