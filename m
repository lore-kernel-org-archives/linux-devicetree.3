Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568247;
	b=xuVvz7q31w74/JfnFTqoD6DcqBeq2+FHsplZqJMlkuGAE6jVtA0qDwA48k9iBCFy/ARA
	 RUl92zSgFdd0vKrOYJAoS0OmHI2wSJlyul16ce4Mfucu29at7RhL4ig+hHVD3YesziCn1
	 HXzBkmxlf73gMHEkcub7AmiNf95OLecKBNIcqHE6P+KW6/zP8oqKEb38mTK7KP9Uhx5K+
	 NPt0cfR98IqG+eJfdVdAL+L4atMlODJVzLFJmlCf3H9hMBd87mvYRDk7HJ06x3235QpoQ
	 GZO80X+/wYqkMWv3cM4dcLNh4G21UT0nZVnDaywPS/OjlRmDP+k/qGW16KTD6fHQRZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2rZA7QUCdd2DDc4g73OokmpuG2DSpyK5MXIuYPZCTbI=;
	b=YQp37akeD4fdsaz0TvNDVuTuROnSAQZzU/hvbdeFxJZpSqGlnwnxPsvXBW/LGn8vwPTH
	 lqRREx7YBa/lQIUTFxVEdANoH4KgAVGSUr5CRilxEPhm1AmoisgKLDjVk0yn1fXGXEkvs
	 hX1wYzDViASJvFfEzGaHi969xj83MFNV46WY5kxP6yOXXqla+lAvjKKaw3z9hCfMUslZ4
	 oxiifqU0qzRJgdux5nTMEeS7r+6zHxd3mjAHcjO45nKM+ijJGOIu5OpSBsKI8daVWp28x
	 zdHVLTO0lW1TNMzJNU9DOfOQdFvkoYUp+bTqUu7P2sjpwaZkyhuHqdGOdNwOuecQAKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K7BWpIMm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjLk3dWV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86918606A32C
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86918606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K7BWpIMm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjLk3dWV
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jhc43573923
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2rZA7QUCdd2
	DDc4g73OokmpuG2DSpyK5MXIuYPZCTbI=; b=K7BWpIMmHXR5pAd0TJex7GHHXoy
	PaqfmlQP0141PSgO6ICfoqP3Ah7Lypz0UDqSSVxIJEo4S5FqC4bbbkSDUE5NHkzQ
	hRH5XN0UsESj6ROZafz57wU/8WUNh9t9ZOh6oUNX09qmH0/Kh5sO2sa99S15FN5J
	5DK8p9YMWWbMN2rUsm5ZDfpLc6qy7soNURSYMTYh7qkBEhj6/9LJOuVbclu/BfWO
	IJkM/+HnB9+ITjOQS0gqqoTnVCqggKYl9p8Y69CksE8K3NadII5n8zMXZfySC07x
	EAV2pntu0hvGNdDs8BMH7+tF0bfCyOA3+omjQghQbXiOm5t2q6s/8h9J/xw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9htkqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so806485eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 00:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568244; x=1793173044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rZA7QUCdd2DDc4g73OokmpuG2DSpyK5MXIuYPZCTbI=;
        b=jjLk3dWVAN8w926p2sqyfG7/xUg+D/MnlWTy96CRRmTmKCNSj7QFiX8TrCRkXYkwWs
         Hp4QaBqE/lMCfulcwzrDjWsQt6EBViDOqcEL+uJriUPL5ytEjGgmxUjU65aIoLyO3TKK
         ymAEcVi84L894DF0HEew3JWlCHjy2QphjPITeZnr/Y3qGboWurRrbGe4Ks64U17gVWGR
         6gOQYWPNejhBeazr8HwPw1kavx4ei1AXGlSlvWMGzW+frpMaaIpARcAVME1bK+kUvh5J
         cKTfdsrAlVNFH3Qgv25tj/1lAr2T7gfzBmoxtdpa5Nc5Utook7U2uR1L0LCX7wkPVFX1
         QrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568244; x=1793173044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2rZA7QUCdd2DDc4g73OokmpuG2DSpyK5MXIuYPZCTbI=;
        b=075Y+y5aVf86t5aD8UaAY30Om2mldb/cY9Fy3jSn6wJ8g5+y7ZwrFFdvfMIvkpgOaC
         o7wIqQp3bdFT4k8kZSg++BPyuvQiPWsqx1wm+YO8F+LNNDlN5tU0KcarSKF93MmJgfT8
         iAydIsQI5kUxUiX0eTo4gok0gXQge+esJyk/pQCVm7KatpQLwG39cYrCKIeyeIpAuhOy
         5Sj7x682vKcakv1fyhWPAx2gQBrZ/EE7aoOCcEL97CoPdBP7o2TZb4LmMF17ekFpcKeZ
         7MHcZk9DX7p2A9x9o8bkWprN00CrUtKHKJ3RGhVcoZRaRuKIHKLpPdfGCmGTUyF0WTgO
         MKLw==
X-Forwarded-Encrypted: i=1; AKwUvBzFriQ/coEqBVZGW5D/5dm/BcE7H/oc4EsOHrgvahjJx9sojbspngUNVDSbj09AiD51ebRrrgOX25Ug@vger.kernel.org
X-Gm-Message-State: AFq9FYLKWI+RuBD3UbQewbqMKu0BFsZ0+3GLqE0rkphjOz0HxO1eMaO1
	USVWU3YRKyys/q4AyUR5MMWdxHQGHC8L2c6zAL00OXquplShE1amwPzFhiFk4tlNa7fl/QUqPHG
	JsL27foZqCoClavuuqOwTUJW/ILGONpHjmxeeIIZvP4Nq2wnbtkeo5OeoT+sv6bnB
X-Gm-Gg: AYBFou3atCbUL9PTHaDXQkrruutyZ2r6zoEcI/EWvJ6g5sRY3GboNFhIfn5ipxwqZ2q
	3i0EseDV5rSnsvzFzi0IdwT8xr+Z2NgsOmWlEyOuus8hYfl6Jd97M/zdgdEmnGKVNcxDVgNXwmS
	P6rdgb01GW44ydFuguBXHLR1Cs7QG5uyqBMSnP1TTzeCGcGhEs7DrL0hx29BO8b1ky7s6d6vsaH
	7vH6yW3bRE2CRHaxIzypQpO1k8SMkENcHahLpBXM0XllDjNpC5KKBuzhnRq9pZO2xnZN8BdK3Jl
	QvdbqjyzzStNAvbzsh5sH5xTxnjXjRDd1aMzOyMSS1vlgu7dMR9DVBoa+ai0hHMnwXbJCh5Y02r
	7PdTp4lT04v6z2iTYWZFJZYVcghh69ilEaSu8zcCZ9m2J8F7uazbgTqVzCmE=
X-Received: by 2002:a05:7022:6986:b0:185:869a:8c64 with SMTP id a92af1059eb24-1909fc7bcd7mr2409904c88.1.1792568244227;
        Wed, 21 Oct 2026 00:37:24 -0700 (PDT)
X-Received: by 2002:a05:7022:6986:b0:185:869a:8c64 with SMTP id a92af1059eb24-1909fc7bcd7mr2409844c88.1.1792568243635;
        Wed, 21 Oct 2026 00:37:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm4042471c88.14.2026.10.21.00.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:37:23 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 4/5] arm64: dts: qcom: nord-ride-embedded: Add sound support
Date: Wed, 21 Oct 2026 15:36:32 +0800
Message-ID: <20261021073633.2163128-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad86bb5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=WpxzUcmsBv8F2e-3JPYA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfXw8WRT/6uYVcA
 f4AisnhOKT/189C+K42vKcnHcoJWlNIUL/fQKPiwvk/yElx+VQnGUUikKRIMcEdam8pBEdIZogO
 2gnFaJhJWy2QMhefw2Cx4yd1ZH0RAaI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX1mCXgyK6qKDz
 nZXt8gcx/c6WHLgaWyA32wYo8vB4aG8Q7c5nRS9z4KRRGh7+V/hSD7ud1ZNewRhD8NMCDH3XJmB
 jlmIrd64jjlkEk8ziDXBYQyctHgr3J3avBp0Wy/tbTHABsBK3huiaLVT2cLyBHcr/7mKXNzcjpD
 sEQPgp7/U/QOmrN2rVZEQjWWOiEqS7LnXB7Tx8WlZlMgrAP9UNUzcilSsLLm5eQhaHKTiuDdK6E
 NddjWB7tpmldWXGxm9TQ2vZssaJwS0DbpcZ/RUs+j4Au7jhdsJeLWrkhXPv0wcAYetA8iJZQGIm
 uy9Tu9asd5XWgH1+CPDrzq+BaMPhuQofyawcf0orVzwTYWi3IaanBANKu+uxVFpkKWgIcxsOfSz
 8gqHOGpz2Al9bxqZZ0BnOxyO5vn/DRK6ChNgFYe9SlTcohh+m/GHxdAdpP86D7V2YU3jPBNUhSL
 eHOrzoAxvEZNQVc740w==
X-Proofpoint-GUID: cnfpWpSzav5qIzEIKL2pBinmWMFd4wsL
X-Proofpoint-ORIG-GUID: cnfpWpSzav5qIzEIKL2pBinmWMFd4wsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

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
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  30 ++++
 .../boot/dts/qcom/nord-ride-embedded.dts      | 166 ++++++++++++++++++
 2 files changed, 196 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1ead642254e0..8f07f9f9ac62 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1106,6 +1106,36 @@ nsp_data_noc_3: interconnect@1fe00000 {
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
index 49635695f832..34119b80d395 100644
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
+		vcc-supply =<&vreg_per_3p3>;
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

