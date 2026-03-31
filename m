Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1343CF02A
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 20:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987595; cv=none; b=Rc11LDG4PuYsobFVPkNPFVgYBA/YhVFotB5HvwR8fBdS7Bu0sb+EYUk2tBrRGzpwaWBCbNpmQEPROZlzar40TskfY6tErfKJQ+eqmgYcToofciHIwaQxy2oWkNwYwXtl0F6uxJ0Y24pn4w7fLdJhlHauRhWD/VU1Y2FNyIzUrqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987595; c=relaxed/simple;
	bh=Jsw2LZX+24ad49I5ppoLXlXypBhq0fgDlxTOnH7YRDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fy9PIj7V6avfwY2NNl+wBhb+pClEikJ6b5lDe/7UDPjY1VufzQe9GD4ovH0llJ4Xq5IsQy+NXaeINfQ/x/WmzbSBCOfSkSmbMZZPRqHWmRF2IyeAF3xyh4XBin/nmUJNILER9/S/cEPN7TR5YASYIJZ5rVgBkGHgpLY72jWNRSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/8XDrzE; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/8XDrzE"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8c70b5594f4so35962985a.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774987591; x=1775592391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvo58vQkpYun2pER1aP/8VK1/EjAtCoPrLClSYN1Vl0=;
        b=H/8XDrzEjnkTZX0j3TkbF4zrSP79umb61uRp3hLK8f52G+O2gqx1/LJ4UTDWL5Rech
         Jgz171iUsGK4cojfYMHtJugESICe5/wAdUNwz7NsV6SOjyOdOjtR4JCxLAo87robJu6D
         7qR2JcUeAVvPCrwM3kvuPWmPwlT9ebMP6EVrmGF04DhMSvJLD5THRc1+7q9tvd07O5b7
         nh8zim3mugahkJEV1nn6eVs3cBw4zQle3LYlZeIbkP5/Ptpc9arHOdGLlWaCN7OKUoEk
         I0xn/8D0ATlr4sZnifHluJdq0/MPJvUQVgKqw680VXxKBgyJogGuUQGqPWkggJGGlLUH
         Vg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774987591; x=1775592391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mvo58vQkpYun2pER1aP/8VK1/EjAtCoPrLClSYN1Vl0=;
        b=DyVsTi5Z3vZRjcKJ3gSus1em8yZaY8tw87tJKv4S2Vnm5fDHGDOSgP8fsMv75+nC9w
         CRXK+0qF/xWgpv2XmLG4ng3oCc9D/6798Fl1Dn76O0uSLKRlxLkPlyZ8ybhcXzlcVwez
         1rr8Q7OuUcO/V8+hfLGwGfBJSwxJmg8a5JENj0ClNopzcJNmJ4seOiV8WObPt7TS+uMa
         pNMqbB3OezaWvDLe+pvxBmavULotLCF37mmeRPEF2PqEYsEwNePCsdURzDNUmbimtOsZ
         TW01mBSW37VLRp8R4KyBHkIGC+txB5jXt2kKmCmWbjo1Fhs8/1ulUNn0jDDUnmwGLtoq
         8lVg==
X-Forwarded-Encrypted: i=1; AJvYcCUeLOWZG0HIPonh2AA6gC8KM9C2aGh74/SQPxzmRZNM6KjFJaJ8S89rWTVsV/2NUpw6hjB2/larnZoH@vger.kernel.org
X-Gm-Message-State: AOJu0YzWFn6j9xK21NdcbKrP4REj7SR3rXJZuusXUCfEr2FcHvHU3tmh
	SH5OHXIz2Ebpb6PO6kfLjehk1V2oWz5iweJ5iS/zNs+yoDV8mligY4OM
X-Gm-Gg: ATEYQzwF7MhlXD90G9QoMPBr3Q8Qsj3xPssFjDjOwcd37avQ7fvwCucJsgwoHF4wJ8+
	669TpLFkDxiMq4C522AJaX5ZnkBbPDjWJuCOHNILKeWORZxKQkeAa7Tx8oWGWsaaYzBSPkBoiIY
	QsXwng/TrndDWmaHBZeSavehBxHSHi6hvz7MHjkzoRcviFx3K/PRXCKM+jqT4i00NU4KQyKh8Nx
	KfS0BhkxlJH3TT/8t43ilnVLctVQ5roXDMJ0W1sxLYqXbWUAilDEfyxZmraYMCmU+waUiQvSf1j
	sxYOa4jHcskl1oY+CV+/77rM3qzcDOSpFZl1XQYRrBVLWwzGqHW6FBEQ8bc4vbYCy0LhSK05vbN
	cmKlC4YUz/pTcrH7W2S4svEvo4S+Hghqo1/L9cDMReH4fJti50xIIbB1ahDcLOKrD5hFEnAgDPm
	sbYUDjfeUF6EKgygsbLa3p9tqpJxgWCUxQNco=
X-Received: by 2002:a05:620a:28ca:b0:8cf:dbf0:502b with SMTP id af79cd13be357-8d1b642e06emr97471985a.31.1774987591205;
        Tue, 31 Mar 2026 13:06:31 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d0280428d1sm961054385a.25.2026.03.31.13.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 13:06:30 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 4/4] arm64: dts: qcom: sdm670: add lpi pinctrl
Date: Tue, 31 Mar 2026 16:06:58 -0400
Message-ID: <20260331200658.1306-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331200658.1306-1-mailingradian@gmail.com>
References: <20260331200658.1306-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Snapdragon 670 has a separate TLMM for audio pins. Add the device
node for it.

Also add reserved GPIOs for the Pixel 3a, which blocks access to the
sensor GPIOs.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/sdm670-google-common.dtsi   |  5 ++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 73 +++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 0f57b915186b..b4854801a5f5 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -522,6 +522,11 @@ rmi4_f12: rmi4-f12@12 {
 	};
 };
 
+&lpi_tlmm {
+	/* sensor gpios are protected */
+	gpio-reserved-ranges = <0 8>, <12 6>;
+};
+
 &mdss {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 5b41f8bac7bc..2d5728c75a93 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -2346,6 +2346,79 @@ lmh_cluster0: lmh@17d78800 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 		};
+
+		lpi_tlmm: pinctrl@62b40000 {
+			compatible = "qcom,sdm670-lpass-lpi-pinctrl";
+			reg = <0 0x62b40000 0 0x20000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpi_tlmm 0 0 32>;
+
+			cdc_pdm_default: cdc-pdm-default-state {
+				clk-pins {
+					pins = "gpio18";
+					function = "slimbus_clk";
+					drive-strength = <4>;
+					output-low;
+				};
+
+				sync-pins {
+					pins = "gpio19";
+					function = "pdm_sync";
+					drive-strength = <4>;
+					output-low;
+				};
+
+				tx-pins {
+					pins = "gpio20";
+					function = "pdm_tx";
+					drive-strength = <8>;
+				};
+
+				rx-pins {
+					pins = "gpio21", "gpio23", "gpio25";
+					function = "pdm_rx";
+					drive-strength = <4>;
+					output-low;
+				};
+			};
+
+			cdc_comp_default: cdc-comp-default-state {
+				pins = "gpio22", "gpio24";
+				function = "comp_rx";
+				drive-strength = <4>;
+			};
+
+			cdc_dmic_default: cdc-dmic-default-state {
+				clk1-pins {
+					pins = "gpio26";
+					function = "dmic1_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				clk2-pins {
+					pins = "gpio28";
+					function = "dmic2_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data1-pins {
+					pins = "gpio27";
+					function = "dmic1_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+
+				data2-pins {
+					pins = "gpio29";
+					function = "dmic2_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+		};
 	};
 
 	thermal-zones {
-- 
2.53.0

