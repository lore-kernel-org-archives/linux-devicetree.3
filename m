Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3697F325494
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789353638; cv=none; b=fgZk2dLJ3vut5u85RNgrlZwY/WfqVZGFMu2p0D8PCW5yBv2Z6XiIeVNfvD4IzoaPnc0J0rm+14n/07V4nARax1QdQC/Z517ERcB+7alJQNQWBTDhW66SBlG7FhVOPc4ggmZIHGk7mpoCmG18taDZpsT4p29l8YOQUJwE1J/xPSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789353638; c=relaxed/simple;
	bh=1Za2ZLDtYjdoPttoRTOYzxE8e/DL8KGIvc2jmxq6JQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tb35VWVK0Qt1Uc+J/rRaKoF/bW0waaQ08LuHmCckASF082Jb5l1dCiEdEP6UndK+XysXooKCQWbjTtNGEPDDMcor8G1kZyFMpzBwFDr6LFbBgxNnZE274uPk337LLYZrbSKGpZGwPT3DHh1moQ57ZsmU6viMSIbUmLpu53/zfHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+iEY6Lb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJAB+OPK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+iEY6Lb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJAB+OPK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2eZxe4040699
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L99dZw11gHi
	hgqw+w80uaVUA9AVKK+uh1a0nGmD8fLg=; b=N+iEY6Lb4cQW2CEM2kPwdfkazas
	EdhXUYCTKdY5uW1TRQSWoPvZThu0MA+P7//KrFxydkKev+F7tUAJoqFt/3WJtmuQ
	d6xIbb79H6/r9Jp4rsEDUucg8Hswv0DJ7b3VqY+zBMEOj4S7zgaS4Pchsq6jhZD3
	G2gIyxTiBDldaSKm+xaPWIZX5lYgRhrremhNZppY5oammrSD6mJzFJDd+tN66WyS
	XI5nliQHR73rF7/gLWQ8igmwXfZJdCTYy0a34x1R8ZkX0Qo432kdJOVkGIkx6Sc2
	HzaIIcimcDycc+hul3+OkZ84nOiJubAUq9vuldGevvnuJDUg0KyQqY5QnxA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dmqk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:40:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so2739869a12.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 19:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789353632; x=1789958432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L99dZw11gHihgqw+w80uaVUA9AVKK+uh1a0nGmD8fLg=;
        b=JJAB+OPKwMuYMFwVPI+zdjQ+BzrrOgq61SC7EQnpvw7iqcnNohViisRm/kVJQvoW7u
         7QbYXB6pR+MHAAcc9VINumps6c4BqY+wwV7BWMZckpxmM2Kbjl/MagRloOwNyegpoo/b
         CAir7jyd1eoV3TUzeJJ4Rtfm8g2FlmxbrjKyeoaBhKnEDTtw6O7WvU2OINlqCjgKtTdx
         GP3ZYlZD25R6MRnGRZcsqvpQgWk1RXxpPkz5PcjMHEIEVb0z3JKyddb8BJx4FFthXb+9
         KlCBLaAZAXw6SetP7NvT74wDompr57nbOiQ8P4952DnBWD2fOgPolccNUaAQXlysANd9
         G6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789353632; x=1789958432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L99dZw11gHihgqw+w80uaVUA9AVKK+uh1a0nGmD8fLg=;
        b=Ac+mZhVNaEtYmCHHkJIpLzkPmAo/CqBO8HB0qXgl8KLw5AdwtUN8zNfh3pzR1cyD6L
         01rpxy20KxCL1q6YV1B3cnoyf/TPadLS5IFLsOmWtqUW5AA3QO/9s6Vy7iLESgK62Nj0
         z79YHAJrspFvi0mPw8djadTmNEiNOthUl5KOCA7bRsobBEh7oDEJ++pSkTOr4OAB1XQ3
         QTeNR88q9KD4L0etxL89yuSrpN5YN4mY/1qGlCzUn+vdNVJkXNaRoXgl5Fh95xSa3mST
         Af2H+JnDDOl6/i5njKIRE6i0RMj9JMyjLZk4TSsWeaL6fks1abRiUDjOOsZGuYqIdJCH
         IJiA==
X-Forwarded-Encrypted: i=1; AKwUvBw73tSztGvFTSs0VR8AobXoiCNSHi7mgnvu/bCjHvLgUvcavLvBUtgBpdwOcz9GT7Cn1a7kSOVo15dd@vger.kernel.org
X-Gm-Message-State: AFuF++lxadt4hh90NrRbb/ocl3DgmpaOJWAuq4bj7/ojvcKpCjDfz2cM
	C4SGXq3vhZwg3I6K8Vz4e1wRbQ5keL3fHRkVuRY/iaSgt94e7Jf5cQd5/rgiak0XtBPFKSba0TX
	IM90PiuE6y9MudWTT0cEuER3CrJMYCkMvIItRJDK9Ycm4IYtQmTh7l15GB4J3mEEc
X-Gm-Gg: AYBFou3l7aKNio/ftutbjp+nrzzw2sZi/8OsM3iXxnm0LRnKwyDwFr52/CfQ/WxfWs9
	pgdrwFWJrmZMHDNBF2/OIFSevDPBztgWo2WiIoeCi5PT2IcUCzvNnKwZCjwR8sgrd1g+bPEDGl7
	BuFaACPfUbrn2UfAYYmdyk0TDrtnVeiXpiD239Jf18XuU4PX39eCrmOCEbmjZePUv1XM/pEu26Q
	vJ8OjrpZRV5tJ7ayLqh4A2zuoogGM8mIcwc6jrcIaJ5OldeCLkhZrM5OR+rCsSu15GvR1wkw3zH
	bPWZ0ESdKpVLwzXPlOBsV+WDu5wuOgr1MzLhOX8Uvt+gY9JC/3wrLC9CBTehgVzfrKpk9pF5nkp
	soaC/hsE7XkqF7+y4wa1z/5CvLiIt06HRrISc30TqBXPPkJ9i9Bq5bK5R6L/W
X-Received: by 2002:a05:6a21:600f:b0:3d3:adbf:7782 with SMTP id adf61e73a8af0-3db4066de93mr1002252637.23.1789353631821;
        Sun, 13 Sep 2026 19:40:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:600f:b0:3d3:adbf:7782 with SMTP id adf61e73a8af0-3db4066de93mr1002199637.23.1789353631433;
        Sun, 13 Sep 2026 19:40:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm25943953eec.17.2026.09.13.19.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:40:30 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: qcom: nord-ride-embedded: Add sound support
Date: Mon, 14 Sep 2026 10:40:03 +0800
Message-ID: <20260914024003.120931-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
References: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: S9TopG2VxItkahuR5ZbDkqp0gBKE7CJH
X-Proofpoint-ORIG-GUID: S9TopG2VxItkahuR5ZbDkqp0gBKE7CJH
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa75ea2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=-qwnfBIyXnizZKwuUdgA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfX1J1iC7wRmOM1
 j2lwsBcTSC6dCwjgoIr5vKWc8i+s4XXi7YQ6iRpCnTIaNEZL4QoS16ZIJwjqUcrLyX0w9AOhWdK
 wBjo4Z5eNVCs3qN4kpDT51EyqMtyEqw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfX2n5CjJ9vhflK
 zIjRB09uHHnem8JcfPMeEEheOm7hofUSIHMkLJCfCUWOVAKSEmLbxLQzWkUEJmRpFHgwKmqbJwV
 KyKoj/962pJkV3l7Xz+1WaNdoFxN2Jpq6sWh684LmKwy14r9IgYbySl08Xd8DA2W5uNUwzuQh2P
 TE+lan+gSFo26BJ9HSB9i/faqO8/G94SxJuEvCWQk7yVdxtlp7WwB1dYyh4i2+37hVeIvcK/mna
 8KfrjymI0v66Jc6B41U5w6vcdqVPQVtPUHFAXDukILe1ftvhgkfRjark4dMsqwydyO4+nRHM8xN
 hh3v6ciVKuWGqXw5KhcLmAc73wauOzeyQ7fWjrT0a1LkHrqC61cZzUgBcLk4OaSj91cAtgv9XJj
 w5rZDNqujhRLCZklY2t/VuT7onqfgamHqYGuoKZPLosfnrIyzNahW/P+hNEkn8HrzhxNtjLfc1X
 iadJADo5Z3cRlLk6U7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140035

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Enable audio on the nord-ride-sx board. Add a soundcard node using
the qcom,nord-ride-sndcard compatible with two DAI links:

  - PCM1681 playback over Tertiary MI2S RX
  - ADAU1979 capture over Tertiary MI2S TX

Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
clock supplied via MCLK0. The DAC control lines come off a TCA6408 I/O
expander on the same bus, so add that too and hog its dac_enable and
click-pop-mute-n outputs, both of which have to be asserted before the
DAC produces sound.

Assisted-by: LLM
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index f225c6d39b0a..0a201c19bfc0 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 
 #include "nord-embedded.dtsi"
 #include "pmau0102-nord.dtsi"
@@ -72,6 +73,46 @@ regulator-usb2-vbus {
 		enable-active-high;
 		regulator-always-on;
 	};
+
+	sound {
+		compatible = "qcom,nord-ride-sndcard";
+		model = "NORD-RIDE-SX";
+
+		pinctrl-0 = <&aud_intfc8_mi2s_active>, <&aud_mclk0_mira_active>;
+		pinctrl-names = "default";
+
+		aud-intfc8-mi2s-playback-dai-link {
+			link-name = "PCM1681 Playback";
+
+			codec {
+				sound-dai = <&pcm1681>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TERTIARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		aud-intfc8-mi2s-capture-dai-link {
+			link-name = "ADAU1979 Capture";
+
+			codec {
+				sound-dai = <&adau1979>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TERTIARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -490,6 +531,60 @@ usb_1_con_ss: endpoint {
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
+
+		click-pop-mute-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "click-pop-mute-n";
+		};
+
+		dac-enable-hog {
+			gpio-hog;
+			gpios = <6 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "dac_enable";
+		};
+	};
+
+	/* ADI ADAU1979 - 4-channel 24-bit ADC */
+	adau1979: adau1979@31 {
+		compatible = "adi,adau1979";
+		reg = <0x31>;
+
+		AVDD-supply = <&vreg_per_3p3>;
+		DVDD-supply = <&vreg_per_3p3>;
+		#sound-dai-cells = <0>;
+	};
+
+	/* PCM1681 DAC */
+	pcm1681: pcm1681@4c {
+		compatible = "ti,pcm1681";
+		reg = <0x4c>;
+
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "sck";
+		assigned-clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		assigned-clock-rates = <12288000>;
+
+		#sound-dai-cells = <0>;
+	};
+};
+
 &pmau0102_i_gpios {
 	usb_pd_int_default: usb-pd-int-state {
 		pins = "gpio8";
@@ -500,6 +595,23 @@ usb_pd_int_default: usb-pd-int-state {
 	};
 };
 
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@20 {
+		reg = <TERTIARY_MI2S_RX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF8_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+
+	dai@21 {
+		reg = <TERTIARY_MI2S_TX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF8_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

