Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485442;
	b=TlWOO7u9Rq5s8ZDHmN6ThALeD++YZJM19Bgv01EM2TMPuqoWhJubuWoA3J3Dmz8vYn9U
	 WaDdSNxsGsBPdc1J+HfZvqmzhOKR1VzSmP22k+3mIX7rXqKgD5kHOLX8GDZEW5eXCxhN4
	 rbEqyuKX9EIM5nj0FHr9a0UDZlm36LasaR6gOhtCIhyhyhIm8WQRNJZQ+ak0sPp/2cS3I
	 3A/xFNvTNrJ/o4+Ze0+zOjtPwDaTwAZODh2p8YGaeWa0B6ryaLDb+QIBrFs8MzHOHNVEQ
	 X7R7We6tLwVs/vxcOv2+HvWzqdPHC2SUUtYd/pYokdeznccSke+bhA4TryeRUaVJnjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2tHqukXkgmKVS7Cb+5H41Ptle1JnEwhRrnl1VEjcEgQ=;
	b=PrMYkGHlJllPTkHM8cpZEce3qjIz9gSirc74VYhJCg+YPhzWAbCZgp9XxHV/LyZKcwUw
	 IAz82ij68eqCsBBRcp0qsWQOrzdkn9FFru+zhGhH6TAfSJlKKuA+lAnD0RGxipg0G+9M7
	 kLLvp0JlF6UGVMGhUryY7ak0oRY307xaqnXL6XWoJ9ajeD2qjxzmut/SSADyXyqxhchwr
	 2UOTuRZMuzw361Yk2XtI4P0mFCaXgW1lJIxJJF/cKbALylOQaS8oNjhiIJNzx38XlVSQs
	 8KtTSi56n9RBLLIcz4QPeq2kj1wR+762D1xKLzli9udl3rKe1jRbkJRDRuV6G55k9tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pI0HP7LA;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FCA606A334
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59FCA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pI0HP7LA
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5366ae57896so41541421cf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485441; x=1796090241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tHqukXkgmKVS7Cb+5H41Ptle1JnEwhRrnl1VEjcEgQ=;
        b=pI0HP7LAUqSmIRHM1dqj9ex013KBAbfdOBRaJmYsB1gCAzOdQnUAtctNuhRTkQBGym
         1PYFqPtXVtWorcNn36WYS5OheMk2gemtrL3Pwd77GGrWYNAanwvByi9V9BR2wKcNykjx
         Hnek4vS1VvykppQQ6gAbi8wnQGhAmHHWrsDxo50c8Y9TQs20sQzxqMSbax5TxlenwoLD
         IhBxvQWus/thOm4FNJG9HD8WtHm4d7x2vU/QQUhOTeNCHbvRYTnV9HoXLaiKkUuFbN0K
         sqFnZmeQYmSisfVupAARY075Bpef9Hxi8VjPjtqM/iRds62TcJQJbYGdndUgtk4DwxwJ
         ILjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485441; x=1796090241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2tHqukXkgmKVS7Cb+5H41Ptle1JnEwhRrnl1VEjcEgQ=;
        b=tQ2HBeuBSf9s9e+02Pg3QIdXcxgr2n1JYL/Pje+Rzf+C/FsDgO4J2QBWjW+n8dMcIc
         lc4UhXwCJahyxnSd9k2kFZJI3eG+MJxCAPtYKTWrB+YrJCPR1tWzvSdbbYR/SUycMHTC
         8YCEQjtrKhabGcu55ur0bj2Q6qsg2h1OOgKvd2mp/tP4kWCDeM33m1d5EwGyiramyR/W
         p0s57Lvt2SWeq8Q42/Yo5t+ThykgS84y1aCSxKlU0qfKq3D/UC+truXTwhMYfGVIC8f3
         P1PMdt97it7Cb4nETUr8p6umr0oFppzwZRAQMfwadzWoj25iQmQpCVS8CvGuWdIO/8oF
         d8Pw==
X-Forwarded-Encrypted: i=1; AL+hErHbqQElJK+1WKB0kNi4ckeLP1W1kEOyEVoYmejxnUj/UIQxXsagFJdLMdvjFDEDhinr45WuRFJIWGkY@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nq1fsJ7VauJfcvSVBEdo0pNlaYdpFXSozWs0KSIXKRVO+Nhdv
	hcHsnAACTIXwJ4mQtidoa2gT56E5GYjM5RRj383p40deWMiCvr5GdK62
X-Gm-Gg: AZFdTZet9CK9lunclakKxN1393DTxMlxVxvhFszOHbWkyepS0nHxHSUNFtDMc56WyZu
	1iIamOo31utb5Pu+PCuEbM/t1w/wsJimHM5pykSARyZ1xVgXCO8gsWjQP5pHXQLa8v0411ux0Yw
	s4FSsGEkOR1qLEEzEyaOOT1Fjf2h1df41KcBsneSHBX3161YTzWECO4FPLdrD9g6jUi+tzvEmU4
	jy1eDUph6qLgcK1wKyLjzrCfDGY868T8EAmxW0X31bLA/N29U1mEYr8xRHDk1qmT/4YF7Elq28x
	Hte0KLTZ2h8CPYJOcUVFKC+WNFzNUioyKZAzhsE08Nmx7kur1ePD6nDzP3NIEqm7YC41+HUwy22
	EuHJOMvZe+jc3W5Xv9MdfRTor9pcXI62BOopKf7XXwiPjzdjsee360MXcvK56miG1wlgUpffq3m
	M87PMNQIOJ1VviTDtI5yqfNLzjGOI9hHy09d5bAsHzBSJNGqV5l19mDgKDG6FgUrJDvqgpscd7l
	lSkm3xmGosM1WxdEEojoe7XeWydqCfU34SletmrXVDpsrEsYslAiEQ//XZGKgzzLQa+6eVW9RBz
	oGB6fUnHhkU/+U+jWXL1wFa4ZuiC
X-Received: by 2002:a05:622a:178f:b0:531:172f:79e7 with SMTP id d75a77b69052e-55d76a6595bmr246641221cf.39.1795485441396;
        Mon, 23 Nov 2026 17:57:21 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b253csm122810176d6.15.2026.11.23.17.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:57:20 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google: add sound card
Date: Mon, 23 Nov 2026 20:56:11 -0500
Message-ID: <20261124015611.187024-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124015611.187024-1-mailingradian@gmail.com>
References: <20261124015611.187024-1-mailingradian@gmail.com>
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

The Pixel 3a has a sound card for built-in audio (RT5514 and CS35L36
codecs) and for the headphone jack (WCD codec). Add the sound card,
q6asm frontends, and WCD codec for headset audio.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 2044593c22f3..9c89fb79ce74 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include "sdm670.dtsi"
 #include "pm660.dtsi"
 #include "pm660l.dtsi"
@@ -130,6 +131,84 @@ debug_info_mem: debug-info@a1800000 {
 		};
 	};
 
+	sound {
+		compatible = "qcom,sdm660-sndcard";
+		model = "Google Pixel 3a";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cdc_pdm_default>,
+			    <&cdc_dmic_default>;
+
+		audio-routing = "LPASS_PDM_TX", "PDM_TX",
+				"AMIC2", "MIC BIAS External2";
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
+		mm4-dai-link {
+			link-name = "MultiMedia4";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA4>;
+			};
+		};
+
+		lpi-mi2s-rx-dai-link {
+			link-name = "LPI MI2S Playback";
+
+			codec {
+				sound-dai = <&pm660l_codec 0>,
+					    <&lpass_codec 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai LPI_MI2S_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		lpi-mi2s-tx-dai-link {
+			link-name = "LPI MI2S Capture";
+
+			codec {
+				sound-dai = <&pm660l_codec 1>,
+					    <&lpass_codec 1>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai LPI_MI2S_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+	};
+
 	/*
 	 * The touchscreen regulator seems to be controlled somehow by a gpio.
 	 * Model it as a fixed regulator and keep it on. Without schematics we
@@ -550,6 +629,13 @@ rmi4_f12: rmi4-f12@12 {
 	};
 };
 
+&lpass_codec {
+	assigned-clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	assigned-clock-rates = <9600000>;
+
+	status = "okay";
+};
+
 &lpi_tlmm {
 	/* sensor gpios are protected */
 	gpio-reserved-ranges = <0 8>, <12 6>;
@@ -613,6 +699,23 @@ &pm660_rradc {
 	status = "okay";
 };
 
+&pm660l_codec {
+	vdd-cdc-io-supply = <&vreg_l10a_1p8>;
+	vdd-cdc-tx-rx-cx-supply = <&vreg_l1b_0p925>;
+	vdd-micbias-supply = <&vreg_l7b_3p125>;
+
+	qcom,mbhc-vthreshold-low = <75 150 237 437 437>;
+	qcom,mbhc-vthreshold-high = <75 150 237 437 437>;
+
+	qcom,micbias-lvl = <2500>;
+
+	qcom,hphl-jack-type-normally-open;
+	qcom,gnd-jack-type-normally-open;
+	qcom,micbias2-ext-cap;
+
+	status = "okay";
+};
+
 &pm660l_flash {
 	status = "okay";
 
@@ -655,6 +758,36 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&q6afedai {
+	dai@89 {
+		reg = <LPI_MI2S_RX_0>;
+		qcom,sd-lines = <0 1>;
+	};
+
+	dai@90 {
+		reg = <LPI_MI2S_TX_3>;
+		qcom,sd-lines = <0 1>;
+	};
+};
+
+&q6asmdai {
+	dai@0 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+	};
+
+	dai@1 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
+	};
+
+	dai@2 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
+	};
+
+	dai@3 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
+	};
+};
+
 &sdhc_1 {
 	supports-cqe;
 	mmc-hs200-1_8v;
-- 
2.56.1

