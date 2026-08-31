Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAE13D171B
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167609; cv=none; b=jFeVCifN8dem/1+gWACXvPD7KrJfEujLEtz1pXVCeFsS4Hk60AaJtoQcB2DKtbU5GA8LDdu2EN65zJliyV0ZV29I2i5ltmJ4QxvU0MVzbbFG/AVpBm/4axtjM2XOyig90iGghMBBsaJ3sliLFzW3suq3wBg+7XomHOR3YKdTqO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167609; c=relaxed/simple;
	bh=3VtEgllYTwb9AoggrDrv0Lf/izwoIk49AtVszqcRoj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pTyL48lRiNM2CNGE7owOlWxRsRh0zomX0h+VmxKL0v+NpuQQ4DogbgkcJ4zZYvBMPaqrvsK5Buf5obk6qfnyIGyarZ0TupdDY203iOKqTOoQ2v1TTP1hPrfRFfdYierxYwtzZ/zsW3BQ2UvQ5wn0lDawYChqAjmMpklO9ZPh43g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lB0JQOzY; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lB0JQOzY"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48433f36a21so1091087f8f.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 02:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788167606; x=1788772406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RxyTrocUHcniU2MAXabytwb4iSzDNOnn1iZ50nJ9bdA=;
        b=lB0JQOzYPT+gW+PT1YwkZpMKE3CQkJT6hGk29L4RleX+LgxBD7q2fap902teCr+fWP
         aPpVzBWWwKEDSUniRNq2yxxtg0VO44+oOmy5rCrtlOxGQWXiT6E1wewGksTMyF+eq29M
         QGM1FeA/AzbLaiQhbznNohY/QqAiIQVmMQxKBiNO5GAMfYChueG76O9GwaCH39EJDaKH
         YcqILJhG/r68MOKqFix/zCQ5aYuuEh3mWbpuHwFf95ntzeK19Cw1F3TpNYWOx1wjeidN
         IW+r/NU3fs1bR5QbteBNQpmlfXLKePMeFZPvegNFHThAfdImixOlJVZadUYPCZwO5bm3
         bRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167606; x=1788772406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RxyTrocUHcniU2MAXabytwb4iSzDNOnn1iZ50nJ9bdA=;
        b=MvLZZz0OfbplIKZ1vZKtvXBzIMptq6u5s6ANiPC6G3ha5nZEb0AkDjV1rhGbRG2rRb
         bVyAL2mbDdLdJk1hnVeHQ/ZHpwW0c+EP2A2L+++3VMU6YEqaQLZBPhEAdENFqgMgUnvW
         de+v6frOrAvQmBCmW/3rLCrhsq8QKla+OzEX4Mwdpfhi5DRfRhJKGBtNMbVGjNndFBMY
         LRVB0fAsEtKEVbS8SnVfUlkxW9aEFoCFvyLIsVMyWosDk77kZsU4sROYAY/eEvqkgdxt
         LBqokvM8+9yonqOw1QAHy821vSO9+PCEOi+Ujw8HdmKBoM/BoZHw6qVzqbUaK4VuSuuy
         Ov5g==
X-Forwarded-Encrypted: i=1; AHgh+RpaBmdXHfi1XQsYyfpXss4BpSQi5vyBkpylAlEuvIYIliVCHVbN0KRUE6MARuUw6APK45fcl4KRR9M8@vger.kernel.org
X-Gm-Message-State: AFuF++nFrjw7y5KPmF0cD1HFApBw7wOXcFvqVVueL+5EWd7s5SYzypu6
	i4lYY+BXU7fdaKTcN9DUBuvu3WHvUeX6FOyZYAF6979wI4DVVlfM8hCjsQbJrkz/MvQ=
X-Gm-Gg: AR+sD1141uobniSwHrCYjrU/hFA17jZWfrTC/RYZJqWQ/2WO6Zf7EDQaS4xPTwtun/o
	bgARJ6HYoogpCRDbqZbkoLv/oUA97pwrcTS7Btq+a9vuKcu5eQMX1TpEmGOAbbIxZ89uwGJcaw+
	rOwvTsK0eCgcKt629uFR7DeYP9MpuFkEhpwzwZ+qM4GdyfLtHn+P3nirXXrUi/44R05Y2pdAUuC
	hTlMcgftkVl5vVlk0IjMw5+J9sON3zdeLuLhOsfAntcCfLUs2PsREYx6Mc3iTu9SLlCnMTEgIol
	EBsabHighPH+yFQB1/IrDIqeII2vnnrTWi/+5IZlRxdAlDPSfZNwBiKHWoVdHW2xicG3/CbapHZ
	5kzxmH1KrE9gSgwU6KAKdzbvHrYrjtDzdVNETOibHuVl30DepilzzJIb57VMZ4VqJYOv0qLtD3m
	DrUAlavCyzROVf1NCwuhoHKWWv3N/GhEJsHJlH41S4haRDzMrTvteIxHeMww+NmnhOma6QO1Qgc
	WdJNKmHiA==
X-Received: by 2002:a05:600c:8b63:b0:49c:ced9:ab7f with SMTP id 5b1f17b1804b1-49cd53c438bmr107757695e9.8.1788167605939;
        Mon, 31 Aug 2026 02:13:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1007:7be3:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4dfdf00csm320935205e9.14.2026.08.31.02.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:13:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 31 Aug 2026 11:13:19 +0200
Subject: [PATCH v4 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-topic-sm8x50-next-hdk-i2s-v4-1-a224aa073f9d@linaro.org>
References: <20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org>
In-Reply-To: <20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3043;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=3VtEgllYTwb9AoggrDrv0Lf/izwoIk49AtVszqcRoj8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqlUWxjG/ZjZ0MaAs7I+R0pZjX7XOs9M7nGf3DqTsv
 It1lt/yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCapVFsQAKCRB33NvayMhJ0QK7D/
 9Pw8iHrd7g5JZVhX5YJLgbZNJTaHVhp3QrDrgVobEFQ0s/8cuAHKy1483slg5r66BIrzXmBwP+QigR
 PSbP33c6iI8ST58KaHixi1zzsxpCVm92E4Ny0GHAb3JA4x+SV4HVcAh0Y62Kg83+vcjuCoNAUIHcMb
 ujwnDpwGAS6toEsuOPKBYySYTxri+JYM3A2TCQKM2KXWufGEo/9hgs1kNzBmjXFo/6zOpQV5x+YFHY
 elJDLDrEC6NdMsaNuNoGvMTE8LoMMqpT7NFGtFYQcom0HbOPf5pvlTgS8Ttc2uq1XfqfFkfcLeME8/
 Ae+TIFTTK0YCYcwY0VNk/OJf6/tHRXfmd6I1KRIqQEHzIymcjk4ztdp76TZ6PhpCVUSJlkpFoXWXtn
 10d3VB8oulYCeNqPFfwaQ4Qzu1vq3MDjFwpisuY6xAI2GVrLyKJFYphjfzqcKhwNQ8ThLKsGMom71k
 44h1vuy3w0EJZnBd4YEHiYxJd1jzRdMnPPq70bqVtvZS/57OKm1p4j0GsoJ9iC9voEE4a0zyOABcSJ
 fTlEHxb0byuyxvJOYsXWY/XtoC2mezYZxtU3Qp9beIa1YetcOuLxZLgrCYOXl+v7eFeoFFoiWPSwG+
 c54BviMUaT4XISFhDoLiOwWP7CX0/3o0+y50HkrHgFhj8/Cki9m7HVMqFA5A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 ++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 4ade28f40cae..9b55d17869b4 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -665,7 +665,12 @@ lt9611_codec: hdmi-bridge@2b {
 		vcc-supply = <&lt9611_3v3>;
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
+		pinctrl-0 = <&lt9611_irq_pin>,
+			    <&lt9611_rst_pin>,
+			    <&i2s0_default_state>,
+			    <&audio_mclk0_default_state>;
+
+		#sound-dai-cells = <1>;
 
 		ports {
 			#address-cells = <1>;
@@ -947,6 +952,19 @@ channel@44b {
 	};
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
 &remoteproc_adsp {
 	status = "okay";
 	firmware-name = "qcom/sm8450/adsp.mbn";
@@ -1079,6 +1097,22 @@ platform {
 			sound-dai = <&q6apm>;
 		};
 	};
+
+	prim-mi2s-dai-link {
+		link-name = "HDMI Playback";
+
+		cpu {
+			sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+		};
+
+		codec {
+			sound-dai = <&lt9611_codec 0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
 };
 
 &swr0 {
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b8793482b181..a5d5eefa4e9e 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4300,6 +4300,46 @@ qup_uart20_default: qup-uart20-default-state {
 				pins = "gpio76", "gpio77", "gpio78", "gpio79";
 				function = "qup20";
 			};
+
+			audio_mclk0_default_state: audio-mclk0-default-state {
+				pins = "gpio125";
+				function = "pri_mi2s";
+				drive-strength = <8>;
+				bias-disable;
+				output-high;
+			};
+
+			i2s0_default_state: i2s0-default-state {
+				sck-pins {
+					pins = "gpio126";
+					function = "mi2s0_sck";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data0-pins {
+					pins = "gpio127";
+					function = "mi2s0_data0";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data1-pins {
+					pins = "gpio128";
+					function = "mi2s0_data1";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio129";
+					function = "mi2s0_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
 		};
 
 		lpass_tlmm: pinctrl@3440000 {

-- 
2.34.1

