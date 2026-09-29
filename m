Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0A252BE45
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687470; cv=none; b=YASEod7zXVxZS0NdMZyDej2PI07LLcIVcZMxNsFSRbk/QI9bl8BkCkEiAdOaJDyQbEUlz5umfsCmTCoZSCWd543OXZ4z4QzBcj6wv1huAXgndnMOmFXHru3cNS+dMBPxDi5Ya7UW811lfF2Mbo8uFyquLARa0RXhGQB4wvzqYuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687470; c=relaxed/simple;
	bh=J4s4pOTQjWXUwVz43SBEvG4NYaHslCDIsjRbJbh+Ee4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VrJBU4z62latxdDT1CWYg9fd2b2Iz0+MdHd2Soyu0iaNgFwjvixcFZMVd9CF/R1FgfVFD7NsHsdMuyvbdIJW1wHLa8g+3a6t8xdIdr1d3fI2VHcXBAydd5CxfWHMOIV8Bm2yx15Jt+nVh6yrPkeB8+NTFcDIyXj/+EP7AJyS4WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhjpGHvH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWVEfbBF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhjpGHvH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWVEfbBF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqsWa613936
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EmygDUXPSGIpxFLAEuYPtaVT/4A31FpzDpTcdw0ekrs=; b=UhjpGHvHufpMHFq5
	ftjDy/iEPRKD/LqaDlqNggm807xKA0JKnSyGMg8OiXCxMCapx8qxxTBs2lLA2bfT
	/tijdpjzABLT//fcENZQ5/l5u80uqM9SFkFS+jSN9dnc5f8GoO7shVNGKqUJolb5
	IjoGWDjBU22Q0/Y6Uxp0XSHqYnQyf0O8jzUI7YFAe0qmkI4boaXTHLLGFe/TDifi
	/g3L6jRfOjrfvzh1x3UI5INltYbFUYuoBgHr3C5wrvX6xUD/Y1Gyp/W7N24zBaWH
	ev5UUwzV7R0e5MF1O+rO7ued+W8f2Gxu13NWfOcMWJRDqQdiTSzUITWi0+rGWwcD
	1AXH9Q==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew2kr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:11:07 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8aa5a673363so39601187b3.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687467; x=1791292267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EmygDUXPSGIpxFLAEuYPtaVT/4A31FpzDpTcdw0ekrs=;
        b=aWVEfbBFccwocTMNNOfDIeXTBBeRQbK4Gb3A84dIzuXZ5WPIIJvUbAnf/22ITF75xQ
         ouLXCmlD6Ge6YRDwe42nyY4girVh7BsIyS4qeQF9XJvmVQicADrKUrAZN6gLf4cuGLeW
         bfOBecMjVcb0S3o/UlqZdmUurYHpsgqNnP6OgQvrlDjavh8GdaHfUW7HjcnbmwtF6wPC
         GUL3o//i0NLNeNaJoZiNQUW995+7l5h9aTl/6oLUUlFuh0mkedJBfb5VsknJYmE4ESoZ
         9PJDio9r1SvDwHG/BpE34WY4D1guAALLXAMeLvPi+QBf+xEbb90giWKSlKO04LSsJwvK
         S/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687467; x=1791292267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EmygDUXPSGIpxFLAEuYPtaVT/4A31FpzDpTcdw0ekrs=;
        b=uKvvBLgiImF5zvue2xcMc6zdOWEcRUVCM2XmT3N46Km0IlFlCb4vwJ3wzHzPZouKYy
         fyVu2ezHU2K0cNG3awHGvS7KbixIUMqh3C46bUjtlh30QIoqOwecIviS3oQN+gadFPdq
         bgZHeZoVuRkrrrgGlnvSXmvGXnSS+XoVMAZ5JRh9QKuzg7U+4ix0Zq8dW7TN7pBzeXjl
         Cu4JZFH3NSt0Iaj+ng/dS4Yf36CQE/L39iPJivO5xuXFk3314Vk1Owisg+crdzrLPyRa
         Fr+KHMIn13RRl6C2PydzG7BC8vGrDOlM9egcv5xMsSxjB/Il5m7HVNuZy62OgD3/rcCE
         dkew==
X-Forwarded-Encrypted: i=1; AKwUvBzuU27rY0RBXmMGcB+1MTGqn3ND2+B6O8vaiE+//l1dzRxNvAejT4kSb9Dk9DqB0PhC92jVXhgxeyEE@vger.kernel.org
X-Gm-Message-State: AFq9FYJV4KnkJWS8WmmIidh2eP7sfSTn6X7ixKGjWXpHeIsv6pw1ZYpl
	rEE2ZB8kxgkhM56bu8sSaJsN82DfxooUVSIBbTsM4xPPVV3iXzfREF873pAZ9JWcu5gop7bp4mN
	oorVfwwlO48wuh27R1Yf5ClCoM/0i/ANRLusMNYcE3+yZCVY4NtVybyHv/LvGwSln
X-Gm-Gg: AYBFou2iBgSqZ1q9zAOpXV5i0pk19+qV/9GZq4jNA4yaEB2OeQpKrLcki4wBPFcMr4a
	Z2uqEGrHghq1SjyQWGF1kMVhdxX10eYyhssf4/3EQoWKH4qG1sMl8+3ylUYCW7iQvqC8mSOIdVH
	ns+TgCQ1cDqkD8+ZG2k9cOWlqDU7BTiWshr5lRU9q9qx2jvcBeJAYBOBQZNBQCilkKF5sL9Eq9B
	+KjzmyzDTG+V2P3GcBWoweSBm0ZXyUc1LoCJiQFqX6G0kQeLUPiqyH7tOo2kpVBz1EcA/Ylw5W4
	NJlYpkKv4DDUGIC3LafqaIo4DTxT3Dq3bkoVy4BjUFIc3M476KCExJ6nWNJRZ+ufIXclX6wVD7l
	DOHE0g8bYfPVfxRjh3If/2cP4plrJMG9OiVg=
X-Received: by 2002:a05:690c:6e83:b0:8ab:447c:b143 with SMTP id 00721157ae682-8ab447cd6a0mr4905177b3.3.1790687466528;
        Tue, 29 Sep 2026 06:11:06 -0700 (PDT)
X-Received: by 2002:a05:690c:6e83:b0:8ab:447c:b143 with SMTP id 00721157ae682-8ab447cd6a0mr4904807b3.3.1790687465845;
        Tue, 29 Sep 2026 06:11:05 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:11:05 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:43 +0530
Subject: [PATCH v3 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-11-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1156;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=J4s4pOTQjWXUwVz43SBEvG4NYaHslCDIsjRbJbh+Ee4=;
 b=N9asyPEV5SAQjN6BZDkKDJAlJsk1cdLTDMCRKqhxEfOX3INA/f2qijBseQsvyuNTsHUs2s82X
 pzlf5i+gxKLBbLsyH5g4Fo+v6SkPB2N6y2MQgFj59r9k/9z0iOwJheh
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXy8Hma0HjKuNu
 8z2JztrW5hrithXb2aTkML6u/v4Aa2TS2QpjuAZIHLPnUdIwhyg0jQBTbtr6L4pNnn3DOTmQhQJ
 o8ZYXCYx/wx3z2hwblkvVGyEZQ7Ht1k=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abbb8eb cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX5KqaxJz0h7j8
 hNnNm0VIzrDXP+SZ6ECTLX6Ea5qNo9Ws8qmtz9WJtXNt+KeKwzDWTyH7JviAViiirB5P2VKwdIu
 VdOQ4bvtvN0L3LH16kyXCI+71ymw40ssf8tXp1raVzApI6ta9eRoPoBXdYHvJ23IXHKsr09nMnj
 Jz0sIoDu8b/CGfWkaEAdIkpokSyaHQ/4mohoVI44N2SpKSqibLJHqNptplhKDnAwaxL7yTaZ+b5
 hXPbp2A3aZ0391x0B1tL7lO8vpQsR40KqbfL+1SItDwIWtE+Qgf1FZxGRX3LUZhxHVoQnDMQ08z
 aWT/tvJYJP0zD0WWc+a8Pukj/WbJ1FjwLijOjkTzMc7erUI7X/eHv9AJ5doIKwEXCTMmsZNUGnk
 8agpp1VdBfgLot1AQv+BvAj1/bZ0HBAaHDVRS3EzAc+CrSa/IAjGJlguCsVKoCqYSOCcDz47W0p
 Gys1J6ci5TVodbzq+xA==
X-Proofpoint-GUID: AwOb9mvfbR3dqRUL1DXxur0Qd7ewi7Ig
X-Proofpoint-ORIG-GUID: AwOb9mvfbR3dqRUL1DXxur0Qd7ewi7Ig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
index 1c875995d881..e8af3e5d583c 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
@@ -49,6 +49,17 @@ pmih0108_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

