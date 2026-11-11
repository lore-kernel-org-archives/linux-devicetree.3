Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382318;
	b=R9eGdkb6+NvdZpbaxE6s1/bWoXhZRWRZi9RFP5DbxUN7JUKs2DX4pRBmrZiovNVjnl64
	 saId8/15VpcmCHsakUjS28QkZvM2/XNlzF+Yl7imOzOpY10pHiPq6g7jfaMDwc5998qSy
	 u3KBDjwOBCciFqwEbExUHxF9+2BE+UZW+b9+SfNucNBdSJoKuKjQxj3SBWqaeoSNCFOHw
	 Lw6SHegBWDG3S9Or7vCaa0vFr3Jjq/v/d4CMabHmsWh0ftFO7z/FfwyYRWzGF/b6TaPRb
	 nWjEqx/X46IVZ8pZNFHvSytgN7/4gU9sQ9Q/bcni2TKmH3g2R5gQ4X2OSeAPogFhCdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382318;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0y9iPA4x5dubX+cAZufMH2d3neDRLs0T+y1ymr7oOcQ=;
	b=cmgTufJrSjjT+VwjJEAgUNf1wTNzrMJfzTtQov/7fbluS/ipuMuvU7hS4usUxW5IUAnp
	 X6ehqtco3RjgUt07wQQTr7cvFMVGPD9dJe5Dab4OmOYqbUKetEyzOG7DciX9YgJ32oPDy
	 rT2nkQeS0WmYxV64Z3oIUdifIaMvJFc1v+dMzsBwd/ZR2+ArP4Zg5xcdrjxPhIawXxnKM
	 15BIM2qO5QGGtlmtDusAxSOE+Mqp0ezDwLJYrAd1y8UWU1Cgooe2QOnQ4qPAypCllKRIJ
	 RBJqEtB65yGRPk6Er237HxCnkq3EIEXDrr/z/Q+1f/AVL7RgdwHSsFr+GPEbU0rQIaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lH5HEtlc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQunFWOn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C3F60A383D
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98C3F60A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lH5HEtlc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQunFWOn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KNKn2017401
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0y9iPA4x5du
	bX+cAZufMH2d3neDRLs0T+y1ymr7oOcQ=; b=lH5HEtlcFuM8qw2ii7LoP0CqCmu
	Wz+Mx+5cNK3+0H0axQgZfKtrKztkxn5HqQwGXYrW75Q4bbgRduWR5a9tx88gP4BZ
	b2cG3T6vPN326shK+bIGCyjWm0TqJlS2nAgC6DMH75b8S4ocVxp9fNbIFPGo33fR
	FyOLO2fvr8cQCb+YYrTapN1XWNqHqNtlBIeTGZgREbbElyJafWCYzDqItlVNHL4s
	Jjb0VI8yZp2Tz03aLPctn7LvgL3STt8y0jY9Ay5qYfBmuLebeytIlnwgDT6wQdKd
	uCV0L9K2mSo5KE/494IwmXPtsqPNVvqcKv6GnU0soSp1g7aI00Ncu1ZoQ+w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cah0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:56 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3ae327c55so435845c88.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794382315; x=1794987115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0y9iPA4x5dubX+cAZufMH2d3neDRLs0T+y1ymr7oOcQ=;
        b=dQunFWOn2Ydo4Jm1SmWWL1jLddhGx5Te/HJsEx/rmCX2r/b6Suvg1kWBwsZq5mIEpL
         a+0VZE1nbuIYlfylf9y9AL1u4f02xkvVuKWsy1V4JQiSprLAOmxa6u4JN9qUnr5buvBi
         tR8oKNQscRhU+i9jygLgAmK9opmAall/EUvbiD+LsB2BQXznQdanZMFy4iMEYhb3r+k4
         k5pTg7anDenz+SLHQqqoRW9BGa7Mu/6yMcR8zbDdsKIWwOqKmU9s87o4Zmi0BclhbQi8
         oiIEUQY/cOvN1hkayifuKo8TXurj1ojP9tMtrQsga1KlrzGfmHDGXUQey4H+/GzvI7bA
         hMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382315; x=1794987115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0y9iPA4x5dubX+cAZufMH2d3neDRLs0T+y1ymr7oOcQ=;
        b=ZVllMBKjgXkuohztXhGxws9M4LC5qm7jeGZVInsMDyZ9I8ZMNXweaCGhbjnVXPCPm0
         hsV7RmhPX9l5EHoUYp/HujsnyvoV012zRUjIgeVm1rY2dpVLFX5/QlcFLRJOSKpSpzc4
         dVZlLXm4tj8CWrilq9OrQn6uYkAOIlQKnJDKZKX99FTkwiY26CrL251wj8imOR2+J9z5
         evIRsWTMySGFqf3mo3E2dzr3nvnDMx7pmAy/uXyc0wHTqhLzf0ldnTOTN7GIiy4z3nWE
         lyaFfUSpKjR0677qhg1UTS/+9J5KWwMhE5HW80PpVag6Yd0JvbFmKF+47HxOoUgrYYCk
         jVHQ==
X-Forwarded-Encrypted: i=1; AL+hErE7GBQ/NmF3GeFRBUGOrQw/DUdE86BJ0jFPdHdO94XOu521r0GpunLsq3VMkbGSt06giO7UfUsYnJoy@vger.kernel.org
X-Gm-Message-State: APuU4Z9uhGjOESdLTC2HeZLkuk2ZVOAgW4x9le9sDXg8opC0XcF7/BbM
	YsVP8oiq53FOwQdtVyBkByANUjLtokJlEI8xnE2mIhKRgWJL+BqBbkS3C2fsId6irWqqqjRwPpa
	/GwYrhyekCupjagk7qahztP8m+4LjISv1DbXxttjO/Lhrz4uvmrEsDF4zIhgb03Zv
X-Gm-Gg: AYBFou20FNRSXgnOO127ydG8OSMXkiI+Umn7V43xQACBoHFXwWj7pKW4k0RrgaL9JRI
	ncy+gVMYkYMvZckF016DNyJ37Av0KX02Dy5H1kVvW6luDlX4wY44/8iidR8MkmQkvoIkg4/KdE8
	7/1Iubs75bBoHME8t/rnLqbt8c/qFrfCbmnt+UQysqoUIB2zt0uT1Cqm+LYFBmX1sAQIcMTo44S
	uurloonnv9o4AfV45eZkLAS55KjjJu/e17uYhuUv4u00OsJgtXw3t/tNBWom1hkJaSGLo7ERhu7
	+zGSkAabhKilfn1NhnkDnk0A0gvyvqH+m+ehA7KlkkrNMa1comS3rqG/v3eNlL80WmzPWlV9yJR
	zrhBtlUnnyXu2Li6ZTrsSiIOPtMDGe0Mrh0csBymFleAifuoggMSAzYyHFpO1j41T2Ptjkf8w7/
	RYYd+nPzCo1zF9JgfNsDMkurN/qDsTzpLy
X-Received: by 2002:a05:701b:2302:b0:145:ac96:3917 with SMTP id a92af1059eb24-1b3bef3979bmr2092214c88.21.1794382315130;
        Tue, 10 Nov 2026 23:31:55 -0800 (PST)
X-Received: by 2002:a05:701b:2302:b0:145:ac96:3917 with SMTP id a92af1059eb24-1b3bef3979bmr2092194c88.21.1794382314403;
        Tue, 10 Nov 2026 23:31:54 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm27220027c88.10.2026.11.10.23.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:54 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 4/5] arm64: dts: qcom: nord-ride-embedded: Add sound support
Date: Wed, 11 Nov 2026 15:31:20 +0800
Message-ID: <20261111073121.3707030-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
References: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfXx7aYYkoIPMpr
 ohnL/ba8PRvS5jiFXx9NmCpluZlUi6+eLeo5eytHMnNKDsVQ20Q8aScNztSK0h2icRzE1ZRhSaY
 vzSyZKH0U6KN6MLRjNLMnVtH0uhwhzGHQfvvQgROoZE4cCjcCDhB1LPcC3o/Th1zfpk1m/0dsBB
 V7cI0oaWRFBaasXxo9HMHy4KOC4G8yJpSamzbWlKQ8g7cEsUjGxcUOIafyA7Ls/dGp3+WxSgvey
 0JO42QZI60ZpMCrTsOH9XAimrvUNP6pekQZHeXWoN3ohYq8dulN8rAARSsB333pbVkJBVTJlxm+
 4fWcRI7XUDrQ+lblT2S6w1DHI9lL+RiNOxFrDw7l5iBtWk+44LrGdeBF6+Z4yBy5oU8xxgZ8eKs
 VsogvOgx/0yScwPTh4NSpBmzTiP6WNkFYyjJBKRQREj/Ebo4Ar5cNKwzI/QqRGEYAtnkvbsDmW2
 dhQoQ2N3XSznQdSMy3Q==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af419ec cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=WpxzUcmsBv8F2e-3JPYA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: BdvRIq24fb6gQ8zJspFfEo266EFdWH0o
X-Proofpoint-ORIG-GUID: BdvRIq24fb6gQ8zJspFfEo266EFdWH0o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX7ZOwxPOSQXPO
 cEat0yZ0vYgXhQrfne5SHXEKyfRYZnaLpWhiTvXVWc/WeSh3YZg8IxAPNoHwG08aBntxVbclVUB
 Y5whhURPnVZBUKurJXLLCpp0cQ1ld5Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110029

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Enable audio on the nord-ride-embedded board. Add a soundcard node using
the qcom,nord-sndcard compatible.

Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
clock supplied via MCLK0. The DAC control lines come off a TCA6408 I/O
expander on the same bus.

Describe DAC_ENABLE as the enable of two regulator-fixed supplies
(3.3V and 5V load switches) feeding the PCM1681, and the three MAX9892
click-and-pop suppressors as one simple-audio-amplifier on
CLICK_POP_MUTE_N, routed after VOUT1..6, so DAPM controls the mute.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  30 ++++
 .../boot/dts/qcom/nord-ride-embedded.dts      | 166 ++++++++++++++++++
 2 files changed, 196 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 003c5ba2771c..18818575b3c8 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1140,6 +1140,36 @@ nsp_data_noc_3: interconnect@1fe00000 {
 };
 
 &tlmm {
+	aud_intfc8_mi2s_active: aud-intfc8-mi2s-active-state {
+		data-pins {
+			pins = "gpio75", "gpio76";
+			function = "aud_intfc8_data";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		sclk-pins {
+			pins = "gpio73";
+			function = "aud_intfc8_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		ws-pins {
+			pins = "gpio74";
+			function = "aud_intfc8_ws";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+
+	aud_mclk0_mira_active: aud-mclk0-mira-active-state {
+		pins = "gpio99";
+		function = "aud_mclk0_mira";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	qup_i2c0_default: qup-i2c0-default-state {
 		pins = "gpio111", "gpio112";
 		function = "qup0_se0";
diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..f092c2a85fbd 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 
 #include "nord-embedded.dtsi"
 #include "pmau0102-nord.dtsi"
@@ -53,6 +54,107 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	/*
+	 * MAX9892 click-and-pop suppressors on the PCM1681 line outputs. All
+	 * three parts are muted by a single CLICK_POP_MUTE_N line, so describe
+	 * them as one amplifier.
+	 */
+	lineout_amp: amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "LineOut";
+		enable-gpios = <&expander0 5 GPIO_ACTIVE_HIGH>;
+		VCC-supply = <&vreg_per_3p3>;
+	};
+
+	sound {
+		compatible = "qcom,nord-sndcard";
+		model = "NORD-RIDE";
+
+		aux-devs = <&lineout_amp>;
+		audio-routing = "LineOut INL", "VOUT1",
+				"LineOut INR", "VOUT2",
+				"LineOut INL", "VOUT3",
+				"LineOut INR", "VOUT4",
+				"LineOut INL", "VOUT5",
+				"LineOut INR", "VOUT6";
+
+		pinctrl-0 = <&aud_intfc8_mi2s_active>;
+		pinctrl-names = "default";
+
+		aud-intfc8-tdm-playback-dai-link {
+			link-name = "PCM1681 Playback";
+
+			codec {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1 1 1 1 1>;
+				sound-dai = <&pcm1681>;
+			};
+
+			cpu {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-tx-mask = <1 1 1 1 1 1>;
+				sound-dai = <&q6apmbedai AIF_TDM_RX_8>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		aud-intfc8-tdm-capture-dai-link {
+			link-name = "ADAU1979 Capture";
+
+			codec {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1 1 1>;
+				sound-dai = <&adau1979>;
+			};
+
+			cpu {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1 1 1>;
+				sound-dai = <&q6apmbedai AIF_TDM_TX_8>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	/*
+	 * DAC_ENABLE gates two load switches feeding the PCM1681, one for the
+	 * analog and one for the digital supply.
+	 */
+	vreg_3p3_dac: regulator-3p3-dac {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_3p3_dac";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander0 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_5p0_dac: regulator-5p0-dac {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_5p0_dac";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&expander0 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_per_3p3: regulator-per-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_per_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
 };
 
 &apps_rsc {
@@ -366,6 +468,70 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&i2c18 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	expander0: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&pmau0102_l_gpios 6 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pmau0102_l_gpios 5 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vreg_per_3p3>;
+	};
+
+	/* ADI ADAU1979 - 4-channel 24-bit ADC */
+	adau1979: adau1979@31 {
+		compatible = "adi,adau1979";
+		reg = <0x31>;
+
+		AVDD-supply = <&vreg_per_3p3>;
+		#sound-dai-cells = <0>;
+	};
+
+	/* PCM1681 DAC */
+	pcm1681: pcm1681@4c {
+		compatible = "ti,pcm1681";
+		reg = <0x4c>;
+
+		pinctrl-0 = <&aud_mclk0_mira_active>;
+		pinctrl-names = "default";
+
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "sck";
+		assigned-clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		assigned-clock-rates = <12288000>;
+
+		VCC1-supply = <&vreg_5p0_dac>;
+		VCC2-supply = <&vreg_5p0_dac>;
+		VDD-supply = <&vreg_3p3_dac>;
+
+		#sound-dai-cells = <0>;
+	};
+};
+
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@195 {
+		reg = <AIF_TDM_RX_8>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF8_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+
+	dai@196 {
+		reg = <AIF_TDM_TX_8>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF8_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

