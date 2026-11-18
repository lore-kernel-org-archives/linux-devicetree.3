Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003647;
	b=RAfT/Qkx/+Hp2tdb8wC1gyQIFFiT6lwF6igNeg4nSjyglaGfYmGaJ9m1H4GkaO2/NGlF
	 fSCn8sHX6RJsk00d+By66AxOno/pszmLOurG/uDjSBFHMafjnb482vqANaYjSgw2WXsP4
	 rWE+nVvXcjGJsnuiRG/8rirx1cxDOMQwKap3K2AAEDalghN5fodoYE/cMeGZCOorSkCit
	 ypF0lWW6FnA7tj4eFbGKtrfN2tydCgSewn+X5AHpcH/czqoNu8lHxWXApcjBvPAgqqEa4
	 tc9cA8r6sLiyrD5bhJuEw/YB3h2C13MfNRqSTqNLaYPf3OSW3G5pDDqmRGuF+ZJRtmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wOO7pl4T1V2FI+1ZhOhvGDpiZBHJDeIfIIIzY8CL3HM=;
	b=p4ZtNIKoY5NPr+OhiZctyYTFJVB5k5YI9QAWlnLJdBlP3u5Xf7XYZw3jVyvrsfXNZv8A
	 wwPSoMAfapnoIdM7iKu+xg1FzTwIjEQSGccOU7VTOmyIY6wyZGThuVanDXsZi0lWHqAJN
	 SUCuZtVyVUMi/PQDy3L6RBNlKCxNjTvg8rvSM7pSSPTT/pNbmvnUtVe8V56uUJq2R3KBa
	 DSHcJp5rp1LE9EJ63ER70LbS6YkJ4b9GhJOLfaLbXDWGZaP3C4y34u1ebZVwZhs/bWf9Q
	 miRRp+W/YibtvNR0+nF6XSwA2rYr+Pel1zF39WFICyZxZIZGWCZNVSqKekYBbDko2EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hCM3XXoA;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E9460A2633
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3E9460A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hCM3XXoA
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so6790315e9.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003645; x=1795608445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOO7pl4T1V2FI+1ZhOhvGDpiZBHJDeIfIIIzY8CL3HM=;
        b=hCM3XXoABsifPCJHl+S9eIEkiniH8JknIKrQQ5Q4sOKVkcnlgSaYr4w7x6Lm6d08Ue
         TZ1dOmCDAbwd5+r03qljZcFpePl0kaycFVhaciEsPK8NYWUznZEYvVuDRQTNrJJ/cErB
         CwzXcoHVSixwu/iW9djD6fPOSrCq81FtTuYd9zHM5NR8oFkgkTUq/7+v86Kf6uK60RLw
         xIBruYyEb1eKcyjlwVe3KmMBsmia9hK3JkIWr966eDgD1FvzBi1elzbRLMkznNB2eTCZ
         KIcrOtAdznKdiLxM25GbEO+cUeIFZwIff93pzsBsPYmo8lt/MaygSGgz1sazwbOKgX+C
         g1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003645; x=1795608445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOO7pl4T1V2FI+1ZhOhvGDpiZBHJDeIfIIIzY8CL3HM=;
        b=2CV6YaPY44tv/nZN5lAo0FsUdmniI3TE/KDEJE0tpbPX6elruh3qH+yEU/CEuFhjg6
         81VFMyCzTbkOPrYkb57cmQWmDa1PMr1wfq/Ja3ADxo2IdVX/dD0tA6+cqeVTDVuXfopN
         JfE4KfqVBtW6kn0QckEXYegcl1PRirJIKyug3zzWd5qX6dZZISQgt3nQZLaCKXJ8c8jA
         RFxqjSAH6YDfoJS5f4WqQeEXS+G17mKoBtyQE6xue8hVgPeyTv3xW9riAgW0eIs+E7hf
         pb8J5w689f3SE7QHCGgISqiNVJ9TGNEPX715psI4o8L5Z4kC5C52xqTBSS7ofr6r9TFL
         1P/w==
X-Gm-Message-State: APuU4Z/A228CmjlJGeKUTY7dyfb2Zbw9YzC6r7/SwFGkFWqkIsHtiDvE
	EdFrKlQVUUzKUMhxhJVPdtSFP38wzvdid43dWKB0LW1C1epwRfwtrNKz
X-Gm-Gg: AYBFou2tEehcc+nOoeKFkTamhkZ2ptpzR4S4ctfE6bgtgCsnMOOlkaihpQd7TtuLsiQ
	g8UaTOSVNZ49M4gH0G0w++mmVx9+GaBTjimZTCY61Vdq/GPqzeU+ZdTtHcO4LKv4cmu/aN3mIGb
	meKePoDeqSM3vmG2dF3lK5GZWxr6UKtjjSX8DQn8IyV+X/sXw1bGDDD5czVJZEijEiQd+5tGkiU
	EI9e7Pw/YGTOIagbdpBwXfqSAVOGAq1rCwIBueIvtAHTy7rKMQS+HITZsYuSXlg8Kj7HetY93ui
	o/AmAk81IQEEVP9+RTijpjTwwvolo1ot2EecOamV5q7iy3sP7qtnDb5OvqIKtdxbRze90xLbpGo
	5Z46E+3Dk8Zd+IQr8pKn+jrMoKXJUfEMa6CKsNM5MTF8AIDeqnXBZsP0ZWzH9QiaTX0IJOKEYCM
	bsscORVz7ncoyXfpcPxqO8jaOLnpuoM5jMknAzwaT5LuSdLOrP1xhLsLQtb7w40f0zqqLhTvQ9E
	kIQsDFHxsxW6jAJCDeVvjqNUrqs/uL2PGUTUaN2U7L0w4oqGejvfciu9YUctz2sx1wCU3ySCGhi
	3lePyOlK6ZEGdSZeFCnDNPSwpQeAnjK7FBg0lmgItmRK5WcDs2IcNb+o49mjwdKexfVQiEZfuQY
	=
X-Received: by 2002:a05:600c:4e93:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb7da12f06mr44646025e9.17.1795003645203;
        Wed, 18 Nov 2026 04:07:25 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:24 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v2 08/10] arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
Date: Wed, 18 Nov 2026 13:07:12 +0100
Message-Id: <20261118120714.31505-9-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
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

Describe the SW42902 touchscreen on GENI I2C13 with its interrupt,
reset, regulator supplies, pinctrl, and native 1080x2460 touch area.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index d307a52cd0e62..be5b894b677bb 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -101,6 +101,24 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	reg_ts_vcl: regulator-ts-vcl {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_ts_vcl";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8150_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_ts_vdd: regulator-ts-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_ts_vdd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pm8150_gpios 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &apps_rsc {
@@ -461,6 +479,29 @@ zap-shader {
 	};
 };
 
+&i2c13 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	touchscreen@48 {
+		compatible = "lg,sw42902";
+		reg = <0x48>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <39 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_default>;
+
+		reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+		vcl-supply = <&reg_ts_vcl>;
+		vdd-supply = <&reg_ts_vdd>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2460>;
+	};
+};
+
 &mdss {
 	status = "okay";
 };
@@ -604,6 +645,13 @@ sdc2_card_det_n: sd-card-det-n-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	ts_int_default: ts-int-default-state {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
 };
 
 &uart12 {
-- 
2.39.5

