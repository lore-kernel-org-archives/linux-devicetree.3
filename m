Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683D937475B
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042309; cv=none; b=aTDO/pBoErQmyFxEmZmnedRGU7i24EmJPCI7pPlYGLgrHvAesLGC3CKE+MeR3fGBCFNyEriKjRh2H+QqiSxCwJAbMRCecxtETehmSfi5GwJ2CusBiq5+eklF34ahe0I9Slpu6pS5eF6qwPZI8Dx4hg3iFJwHpJzmzGtvBFbn810=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042309; c=relaxed/simple;
	bh=+IUGOTMt18Ytjl84nvO2b6EVaLrVHd0MwQO0xj44f7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PAWCilNmcDoRxWPicGFJwAQgH+InOHGfan5qUFd3somq3uOmfW0PGfoQnB75gtTQ8/fjbqnObjNUpivMhY05qoIZKxoudQTms/k8hW+bKNVZNt4+s8INbml27610I6qFITKLIKV2gssnlbaf4WvVuMv319O9M4Mg5jEYJmxubjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRs6Tbe+; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRs6Tbe+"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76bcb1fso38206081cf.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042307; x=1790647107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTKGnGjGTLoIF5pV7l0YX7XUZ3Vt2zTfbQePoXlfjvk=;
        b=ZRs6Tbe+LVxEAcmUHXEDwlulDQDzwxCdBcIarFyKFoOQ4L6mAKXGf6juWlTgWLH4Ff
         0h4g+s+xWHmSiWh6y6nPMZBO6Srj2jCfdEvskFzwRBu+brMvpFlI5kIzIkhCsy/4dppW
         lrU9eK1P+Dbltlrv7hrxkVsN9QbAKnReMP8zTP7TcP2emG8tZBrZv+JOYPagskzaZFNr
         LNaQKvS1GGXgsuzAHNNuPYv971xx4GR9zw1h+vUBdqYBd8X+YPKgIoZK9nGVoboADIZf
         kLcc9TtgDeHZzeS8upGbTav0v+GSoDf5qDPFi4dHa9rbvcffl8Kmfezxyqqw9gz9usAY
         RjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042307; x=1790647107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aTKGnGjGTLoIF5pV7l0YX7XUZ3Vt2zTfbQePoXlfjvk=;
        b=CyD4+Kq4xByJp1xqzNEDiCh5t2pD4kE/dkWv8xpJtMYZh4HcED+LhT/13DobWEgOUS
         yMxMFGvHEG+VbA8t/H+uF+kPMI1eaMXrSVI5gl3JGkRa7jMXubJ9d3GYrdNEfhCKxIgS
         UikPScI7Ai21KHcK9uhCxJTmW5dA8qA3ccA79exev0m3RCubbTkw5JD0pPAKwh42url2
         hli13FTAXLIPuJ3OKc1jSPJpX6VDJxWcxYR9HWt9Ioiw2rsY7rch4qEfZlvqjRhTqs2K
         Yj+WYV8O9+VUGy+b0RWbq6ku52IEzv1vTOAUb2u+LtqpdS1U2XZmQfzSjTvGMWfPLnSg
         wynA==
X-Forwarded-Encrypted: i=1; AKwUvBw+oLFCENk5++nALyMmfATHaf221G+EOrTeFjdbUk/O8LXY1kZFNHFsQ8Z34TqLv09Hv/eHnB+LTITw@vger.kernel.org
X-Gm-Message-State: AFuF++nlvS0n+cvZmJW6DPWLURWF8ZyIoiN3aZRJOvoIJkth7NUlc448
	yqut8hCkn61/Kh23vmcArpGjBVCnmunC8qPqOSHhwK+NBGLfFC/y1/Xs
X-Gm-Gg: AYBFou1hCezR9n8YN7vLmUBoQ7f22CCaOVUbcvNVBAAQp3MYTxedWHebrGeSubkNTPl
	SgqO9R63z+P5qsAhsobuY1IhMJttsnIz9fDDGzZjTTBf4Thd8xGl4q+byrom9BlxZtuRmnujP9M
	9Kl6H14+emN1C8sdgw8gg2UxulEOQI8M0ilEP8eiH49SLlfTK3ad71uklRiAxTX9xeyGq0HNdHz
	1SjoFy4zoAq07W4w5p3NWiE1w2+u8dGbvTWhE7VMLAt3bxhJ2QvmOGMuWxf+TtNvuXuVjK3SS69
	Cx6ZmpKMDJY5iRAWtAROa2Og7OozmYl7dGHY/vivrtOjRNFckeorwcQokb5Lb0pcvd0AolyyE3G
	86VMq30mUGqJPQ8rREHNWXsS8BlNWQsLEH2TIzeRh3vngNNZTYw+YMzqLGhX1CJBqQ8kR3gpWIG
	uTLwrGLUTVVNVKLCjtl6CX6mmDNEBMad/Q5Yg7EsNUlR4wYzs+A4+Z4g/GIo24FmAi3WqYtFj5i
	g==
X-Received: by 2002:ac8:7f13:0:b0:531:131:9339 with SMTP id d75a77b69052e-532d8e34badmr36688781cf.34.1790042307257;
        Mon, 21 Sep 2026 18:58:27 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914024c8020sm3987636d6.23.2026.09.21.18.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:26 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 11/11] arm64: dts: qcom: sdm670-google: configure analog and digital codecs
Date: Mon, 21 Sep 2026 21:58:01 -0400
Message-ID: <20260922015801.32373-12-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922015801.32373-1-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDM660 digital and PM660L analog audio codecs control the headphone
jack on the Pixel 3a. Configure them for sound playback.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 87 ++++++++++++++++++-
 1 file changed, 86 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 3abde2cbf746..48aea5d72092 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -53,6 +53,14 @@ framebuffer: framebuffer@9c000000 {
 		};
 	};
 
+	clocks {
+		int_cdc_bclk: int-cdc-bclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <1536000>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;
@@ -133,7 +141,14 @@ sound {
 		model = "Google Pixel 3a";
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&cdc_pdm_default>;
+		pinctrl-0 = <&cdc_pdm_default>,
+			    <&cdc_dmic_default>;
+
+		audio-routing = "Analog PDM_RX1", "Digital PDM_RX1",
+				"Analog PDM_RX2", "Digital PDM_RX2",
+				"Analog PDM_RX3", "Digital PDM_RX3",
+				"Digital LPASS_PDM_TX", "Analog PDM_TX",
+				"Analog AMIC2", "Analog MIC BIAS External2";
 
 		mm1-dai-link {
 			link-name = "MultiMedia1";
@@ -166,6 +181,40 @@ cpu {
 				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA4>;
 			};
 		};
+
+		lpi-mi2s-rx-dai-link {
+			link-name = "LPI MI2S Playback";
+
+			cpu {
+				sound-dai = <&q6afedai LPI_MI2S_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&pm660l_codec 0>,
+					    <&lpass_codec 0>;
+			};
+		};
+
+		lpi-mi2s-tx-dai-link {
+			link-name = "LPI MI2S Capture";
+
+			cpu {
+				sound-dai = <&q6afedai LPI_MI2S_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&pm660l_codec 1>,
+					    <&lpass_codec 1>;
+			};
+		};
 	};
 
 	/*
@@ -568,6 +617,17 @@ rmi4_f12: rmi4-f12@12 {
 	};
 };
 
+&lpass_codec {
+	clocks = <&int_cdc_bclk>,
+		 <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "ahbix-clk", "mclk";
+
+	assigned-clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	assigned-clock-rates = <9600000>;
+
+	status = "okay";
+};
+
 &lpi_tlmm {
 	/* sensor gpios are protected */
 	gpio-reserved-ranges = <0 8>, <12 6>;
@@ -631,6 +691,19 @@ &pm660_rradc {
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
+	status = "okay";
+};
+
 &pm660l_flash {
 	status = "okay";
 
@@ -673,6 +746,18 @@ &qupv3_id_1 {
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
 &q6asmdai {
 	dai@0 {
 		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
-- 
2.55.0

