Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A5547F2C2
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520354; cv=none; b=Ah5Zm4p/WtQjpqyvgOPU7Pj6tYMF8YvL2mmPjtqg+MZJ9ejx/Q5o9Oe08alUcMbDJyYlA7LrPU3QwezCxKOe7/FeEyqGxAV9MB6TvRb+gG+MUgkMfI8MfKJfoOYx9SNjO81dsNTiIPReRGQryD91tMgjM3dTxp1UcgG4PH5uwkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520354; c=relaxed/simple;
	bh=+NBAVrPIo7sHJ7MgnZXaHhnNEpFD2cpSnzyBi8ZsiQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iToYkwuXlL5X4/4xRLEED8yjHjNDGAYvJzOoDjVJgFXtYZ9vtJzFTFk7kpxP3iBSqBnQaPxJbucMUdR3qU3gLIunFZZQAsw7viXCDbaMQU+UrwIOc6diJ7nrMy5U8jsY4EozCFyjC/kHFdkO/1k1+Y8hLA+VI0NG37iNraROq+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jiAx/El8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JkTqNqD3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jiAx/El8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JkTqNqD3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3WPW2727516
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 14:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=; b=jiAx/El8MFkuvlra
	XpDo8Ubre+ptbaxkbdfzFWMgAkQmo1ao1VB8UIry8FI4J6x4stk5MK98WKpw1Wqi
	QXgDLMN4vuCaXjEV5Ju90sU/n56n0DUKkasrrvkQUut6x+x8XUzLEeESEdO467mS
	wneYWDsPKhg08NVfWK1C0/0AjTylTfm8TltjJYKVhTnWK/suX9a1Exxo99YkhkGa
	x5PtUnKrWc2cuq+OueuukwPDLUqMRMHChQU0B0IPyn1gIyvtpRXC/fTaK7NbWAk+
	iEoSoMzb+UiDGPQK2b6IdeD1GIcq4XxGRZHf8mYNpHTdu3hQ4XQU7GfeFahDPiKT
	6/Kuog==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6aayq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 14:19:12 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9692595fe97so217223241.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783520351; x=1784125151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=;
        b=JkTqNqD3YThRN8+dkjYD3vV51EdObLS494579V1vqwYvnTRsAFyYVrtILLX2N1mKtM
         pBUEUi+2042jEBqSCOptGsgOmL+I2W+2UtSBFbSa2Pon7VNrbm7Gnh5kDX3i6F6XCbCT
         a6v6eeqgDI56awYNQyY5Ehht8Hg2VOw3Zd2RWPYE9iAJUUNjg0g2dJQ1vKJH7FaBjGLq
         mMKXKe38IXPskuo9FqIU5mAusrSlYFxoH8eDP3O6RKN78UE0/OaKN/BAS0zzVPRca8lO
         OfAWnkiIlOcfwyPSp41t9AVSJr0zKo914nFrjOcAPIPaW2vx/RtMWDB4IMRpVTfoENC7
         ILEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520351; x=1784125151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=;
        b=TML6vM/zmmP6eldMN4N5i484ADVad+4HliQJGYoWeaeKOy65YhZ20LOyerIFZYKfth
         Uw7B+zzvNaTLuxbw25NHRBm95xlzTUEjuM9hEXEqOR4RRNvOi6inXQ6APB3mQFPX/CxC
         +jrhzwbq2PjdMt9wqKibKvX4YgC2uoLqeGKLvuD50QPYrtLhA+PngSx+8ZK4Xs8h8XS9
         Odbxx9/dGiWQKH+y9m4wKpIpcddx57Hf2T+AMPAMI8PtbGG0QPt2Vp79rpmMZHQKJgki
         oLBoHU+TSe94EIEMwMJU/9u7/M3nV9m5O9OOyupT8rvIS8nPWBXd7DDFjf1BYLaLBpgf
         Ucaw==
X-Forwarded-Encrypted: i=1; AHgh+RrZh5uKQEv81EnRJNsDKCM+Etml88KgcquDQzp08qwRM/ARKVUQYesB/Zl+lMJQVkeLpuu1AAZp6kSd@vger.kernel.org
X-Gm-Message-State: AOJu0YxPlh+ReZOo/bel4tA2VJlVN99WyvDE0lEN6+Z5hLeUOLFjaIok
	xUi4O7G/ObaVW68+A5VSIEJB/HAeapmf8g+EKw8685+9p9SphIXSyrHp9dyh1hKOGo22HclgLXF
	v1SzSUCFeySksiGXnwJ6svDxX6q0TCL9XCotOWMJmb+9ByXae8vE6nTBmzrj08Nmd
X-Gm-Gg: AfdE7cly/CIRqQ/xPMrm5kYCweBUJzKCVqotffrWTvzSSWgG711K+TZwM1FDYl6cyIw
	20mEolpg562NCMr4RrxplupvYBuNXxAyHjbgfbkOGsEdUKfkC9KsM7pzDvy1M9lVDrYYuVTXkHe
	W0FMcri86y4B0ih1oQoQpvjv8WFJzbFltdpg3qnEahp+otXhkhOUNpp3uVA9Kf0r7HOQ9VXXsmY
	7GN1E46zCgft36/3JuyCOK3wYpjJ+SUBZwlLYbXNmf4xTCsXGPFROWuyo6Y0WYcyFRD21Bn8bFn
	lotDfG0hTSBPVFGeyzoA6Eg5ftdEr9FKs0f+uJnP+uBg2EQTcw+dEIJ0n0l7es0kQhIny6Tcccz
	VgtdDmT02wRYpeyrD0kpTZzNi1Zwml56KBCkIZwrdjKKBplAzcrqUxJrj2S9ZQ/i0PyBPCo7LNq
	g7fbfrB6+NzV6DG/v0iPHSZfhS3oBNRST6cPPOPVc3K3nc4lLkip8H7cF7u87fdwOYi+8w0pjwz
	6gyD6ihfdYqyc5eQ0gY
X-Received: by 2002:a05:6102:5e8c:b0:633:f2bf:7de4 with SMTP id ada2fe7eead31-744dffb3680mr1400952137.10.1783520351304;
        Wed, 08 Jul 2026 07:19:11 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8c:b0:633:f2bf:7de4 with SMTP id ada2fe7eead31-744dffb3680mr1400884137.10.1783520350378;
        Wed, 08 Jul 2026 07:19:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a9c4a4027sm3080829a12.29.2026.07.08.07.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:08 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 16:19:03 +0200
Subject: [PATCH v4 4/4] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-monza-leds-v4-4-a7acfc524c0b@oss.qualcomm.com>
References: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
In-Reply-To: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfXy5opYUU2Or/t
 AJiQjorA1ZmtR2xvFqc/88DtQ+PUORGYeM1MgTs5J6UGyp8L/d4RzhE68KejCe9xzX0qBckxyNB
 1p8bgYb0bM1qVfO65gN2toTj77wpDpSF+5t+6ovf4wUu8gV+0quzl3qrgOVq/OR0mSQKBAGtymT
 fY7S/lHexNGwPLJUlKiXYgZhzdKuUMgVFDABEbyCCm9Aa3Q8n78gWsy7WEtxEpywEpKp2XHlOX8
 aWGi8Z5t5YRbYRpf1J/i79BjIhPAlohb4g2bIKD9tOaXO2wrfAEvT2NqNKzAwFsWCXijS1C8hon
 X9PJhpT7xRnldSuzBAxHQV2o8lPXxammuCixCSRK5i0XsJQzzTAy1qKZk6YxqQJFlypxv3g1M3U
 4CIufzcWkTF7Lca3zkybE0COiNzcRFRWf4ul15pG2vM2tdC0EYEEO7I1yHJHK05hz9TBZVjmuPk
 /7NSFyyC8VoTGpk3olw==
X-Proofpoint-ORIG-GUID: FIdDe_0Up6WoHOmw-QD9uvtydEKd78aL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX43aRJXI38nf6
 HAUYVxAdpoioRgh3r2YlY1/lM1/u2+MTriNsDoXriXSFveVLEc6gbK1OMjZRzShDOyM+eZ4vVXU
 bQ+zQeXWXNLTVoElzLC+CkCZV1Bpplg=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4e5c60 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: FIdDe_0Up6WoHOmw-QD9uvtydEKd78aL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080140

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

