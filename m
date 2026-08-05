Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8973E0243
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 07:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916117; cv=none; b=hZYnIXtBmxuuOJC38dl6LMCnrvDwyCATLX4XU2uD4K8m2/eUlpIj0BbskKG2piPZQv7CX1bJFcsXf2XpXYhcaas3x6o2HSxfUw2vUZBy+9PUSS9HrzaLqApAg8J6I2OpKwV+/A6cWCsHNfPTGr264nC6b1DD4qwJdNX1HMrzkKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916117; c=relaxed/simple;
	bh=qbZbC6iN2xScnUMl9ShTs1ZTJEW5e4muOO3gnwdSZt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F/EImQJ5fElLrgrj/toogYZXBnZN6pZRXxk7RFrI85h8vlpRx9sjouQjtg5XAKoc+QPz+q1filVGYiKoNTHVGD4PGRg1U8b6Hxl0aXJUESbR4PzirKBSdgpk5pRmiw5aW7vhtXmZ6V2y3yC70p8N2NXycOAmWXc4j07hkN8ms/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w5kgLszT; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w5kgLszT"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so304996f8f.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 00:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785916114; x=1786520914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LGS+rdt+zk7IC0Xa+OYHuqAWlqaAUvS4QDXqrSUqFcE=;
        b=w5kgLszTo3F1L80bGSZ8YbwDjO1V/I2eTJWKy5gnvNUe9HLzB16skgFapG8C8esSSy
         3RjeU93VFQnIOudoCVHLVjsXmrBvyGTlBwkpkK2dGDQvkOfnT/rFrjbdmPqk188hWY74
         ZDspTdzUgsupbkKHXKJ26t/f+lRfg5PmCpG+KJXacUv+TpphQ9mNWWs+G83KPr4BpSbM
         4lBR3MXK+Ytn+ex6EalNec1jAt+9xsLdjXTs5JuamYzHjUXFX8IU7DjFcPUn5gORYU1T
         rkSE9518vDpgI21btbKJK5I0xOHdr1QGAUCJUwIrEzm7+a4wVUlWPjErQkKT0kNM//DL
         eO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785916114; x=1786520914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LGS+rdt+zk7IC0Xa+OYHuqAWlqaAUvS4QDXqrSUqFcE=;
        b=U0cbZQIkEl/UOirJP7flIs6vI4gX2yxU5o+So3BoZ5G3S80Lrx9veeCQ+b0uNOF51g
         aYVLx9ysoru7Pf6enqQXf8cTi2q2aXidfS9+3znGjT9Da2OmtcvLmo2dPttsO46tMcUe
         IbcygtSND3b5So237Gcs2RZGGfNMaqXlOetuBGOuuuCyxc9VWzVRm2GQxORzExc+0ZEx
         PBcvph0mn+agmh19UREG1Et7ClNDVHynAmzhGKJhMZPtFafH6qgyXyg53G4jzSt/PIM4
         p6nCXXj1+OsN0LJnRnTg/xdrR5JumTFXDiFUnEC5tij3MV+9yQQYZoRLaC5tfPAoqjV7
         Bkdw==
X-Forwarded-Encrypted: i=1; AHgh+RpJzIw9Kg4WL6lebdKv0gEuokMFms+e4Eyk+wtzzQnZfs50LlQQDaQxtlUTP1Ng3V6dwVrQ7FFcjuN3@vger.kernel.org
X-Gm-Message-State: AOJu0YyQF6ShOTjq5buDMXJ1VGqPS2tf5s+DTG23eLL491JHYtmOeeKA
	dohtYXVbRk/uMYZtsBHcfIyCNS7Kfejc0qSDs4yLNeeNN2i+sWDzmuGXc+7Brdu1ZJg=
X-Gm-Gg: AR+sD10xg1aVEM341UxXpSPeuTXtflMnuqu2EPzqv0g6mh5JAnGKHOdqtFskC9j5eMh
	NqVLKSr/1FuvhAeexN+mBqLuVOCWq5k4WGuAvYF3jMhOBfK/8+wmYXbA9zHd3OJ9Dk+aTTIp0Mf
	caSYPHymmtAwZLLlNPpKjac3BzFWHgPFZO2lbCVLsGcNPiy0LI51OTq8nr4dlt3FKqtF3A0wu/n
	gEUfumu8trltlXtHgYNJzFaG8EaUFewKEQsLo9Q9piGBazdztpsJnLbe9N5hJJXCQ6ZI/i9AfBF
	+Ezsu5g/MgHBqxvFJ5RA6NGv28EtttDjcKRmxCrhKEIwJHPChDrY30TqTMEz5C1sM0VFB/W+TZj
	TCsqS8p6AVpOteanBIgNv/OO9Dg5dwJ1/gEXRkEEXmKXBjLtAw7axH7aVXRT774SDIRbaOqzo0A
	OyPfXSowXxiGJT3XlJhGqgtwpfujFjzMn+O+J0PkFYQZoeFYkMX3hF1rvTtwzKCfJgZvH0Dnzt9
	TMteF3Edg==
X-Received: by 2002:a5d:5f45:0:b0:47f:97bf:d891 with SMTP id ffacd0b85a97d-47fec50970cmr7302425f8f.1.1785916113952;
        Wed, 05 Aug 2026 00:48:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febf7e5bdsm6470840f8f.0.2026.08.05.00.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 00:48:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Aug 2026 09:48:29 +0200
Subject: [PATCH v3 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-topic-sm8x50-next-hdk-i2s-v3-1-07a6483c430f@linaro.org>
References: <20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org>
In-Reply-To: <20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3043;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qbZbC6iN2xScnUMl9ShTs1ZTJEW5e4muOO3gnwdSZt8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqcurPYKZ5Jx4RKsSm3xpx3bXT2aXObC4v0qUGfChs
 c6z8dcaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCanLqzwAKCRB33NvayMhJ0SowD/
 4wg4sndK7FTlv+u2lQq14QR9dWQfjXO0AE6h/uhSH5KFNU7QdzK8Qmu2qPQZiAn2mJTi7KZYzuG9js
 pCYPIdFmGNGxA83TY4aDbOyv+BzZxF5r4QOB6MSPrLyTMVrDqiaEEiuRlf2FzCrVYCfw3hoO6i2oL+
 UHFyNa0Pwn+4pUeMjoeJrKgx73WCK/j2n75Beh1tfdrzZ7ePz6jvrRkoQLp657lCAwVrEfwrF3UwJM
 IUdzqmfr3amE9VGFFua5DejwUnArVkNtyM2eBAG992kfcI6Af1hGdyrjITGMrKdmxNcubiAu6XXvGx
 F3hAOOmlT2gZC130/r08lJUJRiIEWFFTfbjiNLL8/DMQhTytAt3fblE3lIYl3cKHpLuIxZLV0INeOL
 62Y++ivHxP1SEXfrxf+pWxtUlO3Rs/rjemqUJqcvH+YfNeRXXT9qFmg2/3Gp8mPGXYRABKIxuwKAwi
 I9reDS9b+0aKCl0c9fnAGTi33OspcF+e0Ea9oXqqSkFAYCOyAoWXOEZAfEjMwwdXocXw39s5l3fwID
 urBqmZvOpN6FfotHl+UsbEr+KZALlVDhQRgtHz2g4NXQpqFsO8lIXD+CVDSYM5HaTPG17nqq0zkQox
 W/AaoV//2BST4ZIML/zjsDxOnNX6ndughbqulpHQO+fL1Qx5AnAZ49oVsnIA==
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
index b37998cd9a2c..6bc2e8630dc3 100644
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
index 56cb6e959e4e..879019d48063 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4313,6 +4313,46 @@ qup_uart20_default: qup-uart20-default-state {
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

