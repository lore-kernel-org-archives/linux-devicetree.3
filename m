Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BCE3E5577
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 07:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916120; cv=none; b=d0RxHjD1Bq35z0RUllYNarW6iIZnSq45+vdzAo/9cl+AvXz2XozW21l1pMrUZuTzwa0W5TJhDvjNk83XjwpuQCGXSumhgbhObzmnujSnIBwdtWw+ggjcZACtgHeoiys4UPfC9S44nWckbqpDdtvt0eyqneSVmbA/00eXBU3Su9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916120; c=relaxed/simple;
	bh=B0oj7IPoAVGBz94ymMG4pfIBjforEv3Dw7BYzs6RVjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nAAUhRQ8T6MjxhU08Dn1r6jPaDD7aPWQgl1QcQSwmvPzKTB746W77hGxs7uaHNuvMmCkj2Mna+45VZr3Gl4PiDYlAl+B8KJTTO18MKr/zmu7onH2mL0Ms5hRK1tUdP+rBbvOV96bYdY/wSR9HkS1X3o0zarTHRt6C9KdfEF8coI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P6gt6iXx; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P6gt6iXx"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-472326ca506so422912f8f.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 00:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785916116; x=1786520916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aM2OHbywSp8bjqWqp3v7VngVX1T/uRrxOCcio59Wb74=;
        b=P6gt6iXxB5lujd9DB6tEfRblrtQWG5gG/j/XAnDaIqxikF7YUGUmoVos2CQtxPSJhk
         FVFsPzw1RQx8QVSB/19QNpPCOzq74roxHhHiX7G6SDloPXrNb/IKyrddHIJ3tuZJjeB9
         BRPEzmkNEjSvuiX/FApAWQw/chpnbuRNC9fF3Tk4Nd4y0Cw1/IaVfbrWd6qP+H3HHRE5
         +MOqB3V0lhz5f1mQz/HyJVwY+Qp5kiFsujy0iyhXlep6/97+Jm+EvroAITBkR/tLDNOJ
         +H+nFZhDmfkg19Z9KSsPBFy9Ca50873oHnmdK0y+BnkQ8lajDHQObjIoK1LtUr4ezWTs
         aXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785916116; x=1786520916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aM2OHbywSp8bjqWqp3v7VngVX1T/uRrxOCcio59Wb74=;
        b=O8Dyiq70/hTHh9y7Fbtr1AU6WMUAHhfAukmfatoy5AqHtS5qSR84VF0yAJri5p0Y0Q
         aU6U/e7QXIj7camRJHGOhQzgUAal4xdPZNYn2i5LW5dTHV6MY0HutxqdbAgpCp48eUMk
         3t1pje/ovioMA+nst4baTjOa79bwXG7UQaCF94OaxJv+yRx1RqGVyIu8KA++X493UdG3
         A54vbT6RDCe0zjY3c2XGrhwq16AXnfmSXpWd1IR4JBc1vscNjHGgC44I12N07vNUhf5P
         Ct4ZtxbM3wEkveprLvlEru7mhAFyMr1r2Zd2LqE2fhIeAOKQftmqi7lxIM1sb1SooJw0
         qrBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1FldcV6Uip38M0LQO1kRXr7bG4MxB9wloaYVd3qPe9ivZyUuWAgPkK7rFlzGYyGxBdj+vevzR1Ar6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0IIKKwVekjcWU7DZb8KqpKw08uxakR1ZmOAa73jb7E1IN8gh9
	PrDhZaZ4kO2uvaGZzNz4z1YdUwJNis7SjYcupxjSgAWTezf9xit+2rbeAj2gtSHOo/U=
X-Gm-Gg: AR+sD13RfiEhZI4DB3+RlZxOU0vXckKHkq4GpIjK+xpoa1UpVuAg/a+aaeeIpR/crMe
	4LqL3nbCNrmH2l4FddgyeNRI/oJvS1raymsb9IGqAM8jJ/+rOdbaR+ZB85MkNqvRzdjJuxojRjh
	xCvoLX4SrRFk1lxFzquFbPDuKdoeFIzg4ap9tmby2RU52Qk17WOrXR+R2pwzwbjR+eRlt2FfJyl
	nLiV6NabRcEEnIzBztJx2jA6we1XEZLuifWzqfk3h09XPHsioe2JZ5sYjzsnXhoI15WWhoqb7mn
	TfSXE6aK3IgbEz9K0Ug2WyhRJyqjcsgHXY0IkPT9hVP8xxZT70eJqDeKLY/QsZaxfb6Dur/QAoc
	VBGGvBeaFZZ9IH9+6VXMAEZn5kgzQRx50KZTMyuuhDdEVWZvwwFK0WzZOKYsBaVngDERK28yPfr
	6Fv/AAawyOWtHqdBNtO91e5OB5wb31uERXEJSLkDFd47oaDzCZVBoazDWVd6bGWYU90a0c0bwjL
	b2qMqdYLg==
X-Received: by 2002:a5d:624a:0:b0:47f:9750:26cc with SMTP id ffacd0b85a97d-47fec630b5cmr5845000f8f.23.1785916115597;
        Wed, 05 Aug 2026 00:48:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febf7e5bdsm6470840f8f.0.2026.08.05.00.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 00:48:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Aug 2026 09:48:31 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-topic-sm8x50-next-hdk-i2s-v3-3-07a6483c430f@linaro.org>
References: <20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org>
In-Reply-To: <20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3243;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=B0oj7IPoAVGBz94ymMG4pfIBjforEv3Dw7BYzs6RVjc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqcurQuGZA6V8HJ+8Ju19GIwi4Njtlkpy5R/yHK7Jq
 cnsyoOuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCanLq0AAKCRB33NvayMhJ0a84D/
 98IUCjGoGenLnrN1gRQEjkasPc/4Ju1xg5WmjwCWDvjvLbBW/94aKAtmmTTIE8eGoig1eEmj/pbc3O
 6hmjpw/JSnkY0RyuJpYqFEQh13lUQSArJtEFTgjGxQUT8rUTkAjuhTrx5vYZhD5mQ3slQe8XLZ56G8
 sPNmi/1RJDV/od9szLOVTW5v0TZY5ehuE8tfqXIVjPOkXxKaeAsAebXF+OW51Ua2ibCvq4cWQMbeKi
 fqms7PHQOjqtRUJmgGBzoJL8u40DlJ2PWRjY07tWp3k4E0XeHA8QzNe8WcD6T5CkqmC19mLXCxjyPy
 3gzZUKP5/kzwTFrbd74BwgmFZjI59fYNRpLDX2vxsAZ1BbRBqMP+GnR5SxkYlps0BqKN+jQMpvU6fn
 lhwuA5wyF+ye8k0XUCVLnK9K2LUg0374DFkjZtyiUU8qC6pJBZiRmHriRQpNP+xM8Pdlw3058iHk9g
 LTex+4lTP01wlqnK3Cx0kTxUOlp239WMKEklZTkJK5ZLSgdKxEypBUA9IQA/jVvj+e8ytK9Y9ApdTM
 XlRi+t5Y7XMVf534R0xj96NpN0B2aRqgld3BcbDm3xgdtu0WyemnqOUpS6o1vc87EBMVsIOb0gShyc
 svDjO9wbU4QqRJYl40EVEwB4gckqo+z59Ld5wpAbyPbJjo9y+ZhhYIPSQM4Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 35 ++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index eabc828c05b4..5930eb242a61 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -218,6 +218,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		pri-mi2s-dai-link {
+			link-name = "HDMI Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			codec {
+				sound-dai = <&lt9611_codec 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	vph_pwr: regulator-vph-pwr {
@@ -853,6 +869,7 @@ &i2c6 {
 	lt9611_codec: hdmi-bridge@2b {
 		compatible = "lontium,lt9611uxc";
 		reg = <0x2b>;
+		#sound-dai-cells = <1>;
 
 		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
 
@@ -861,7 +878,10 @@ lt9611_codec: hdmi-bridge@2b {
 		vdd-supply = <&lt9611_1v2>;
 		vcc-supply = <&lt9611_3v3>;
 
-		pinctrl-0 = <&lt9611_irq_pin>, <&lt9611_rst_pin>;
+		pinctrl-0 = <&lt9611_irq_pin>,
+			    <&lt9611_rst_pin>,
+			    <&i2s0_default_state>,
+			    <&audio_mclk0_default_state>;
 		pinctrl-names = "default";
 
 		ports {
@@ -1072,6 +1092,19 @@ &pon_resin {
 	status = "okay";
 };
 
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@10 {
+		reg = <PRIMARY_MI2S_RX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk",
+			      "mclk";
+	};
+};
+
 &qup_i2c3_data_clk {
 	/* Use internal I2C pull-up */
 	bias-pull-up = <2200>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 160ead25ecf7..c1beda2442c9 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -6540,6 +6540,46 @@ wake-pins {
 				};
 			};
 
+			audio_mclk0_default_state: audio-mclk0-default-state {
+				pins = "gpio125";
+				function = "audio_ext_mclk0";
+				drive-strength = <8>;
+				bias-disable;
+				output-high;
+			};
+
+			i2s0_default_state: i2s0-default-state {
+				sck-pins {
+					pins = "gpio126";
+					function = "i2s0_sck";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data0-pins {
+					pins = "gpio127";
+					function = "i2s0_data0";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data1-pins {
+					pins = "gpio128";
+					function = "i2s0_data1";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio129";
+					function = "i2s0_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
 			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1

