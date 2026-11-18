Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003648;
	b=dTQxTb7ebmO3JWa9tB0K0OHjdexhEdeN1ql91W5qDwWQGpxdS47f96JN9DexbVifdSVV
	 I5zYrkwfq+M6NfLDGNW82WnM1hIjtZ9nM4nlFM+mNPZXJ8YgIj37ElACbLRwDyXyA3HgI
	 KVdbIFJ7pd3zWPGmbcXuhMhTVx0k1ngYPHbLL+PTWxQCDtlcyP/bNjhnQl2yP28AufSCE
	 8jDJZZ0+eiiUSmC6zdzenv7xPEljEZsQdQYKJbuIAj9VBrE6ZrumSlwoPkIQLoBWd3Kc4
	 hZVkI5j3e/QDhTAD8orauQWA2jXGBHyWVAw1iqB9ZcNuEIDWBaSiE1dT6WHsZQ9zk0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=167OHAGXM6J7PJAqZ3MLk9kxvb+fEinCgbUkehm0fFo=;
	b=dTeK3nLtjq8vWAgdhF2RInLB/MB20cKPS1OTX/JEPLv0NY122Tx+v+cHbmo1sLKgd8kG
	 XRpO3HxM1jCI7+eOGWWmw1s8TqMIisbdUcvAKX9hQ4RgCV8fLATH7ouYUgQY5uWbeBaO9
	 dhindxerBVSPxAjgk2hY6FOI3CV3pTAcp0P2uUFTY6x53lQdBoExZ0EQnBgfiKNYpHJuC
	 yJn/IKRQMqcf+7jTxOFT4dTF0ehlj7VVFbOwd8MHcyuc5tK6JLR6rAU93lU80QqjDMVka
	 2XItqA18Cv5gOjOfT0cOm1U34mP0Ot7E+GDTeoBzsdbKhVgWJdmwBOfR1TSRIxQXG+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpCybyBE;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58A160A261E
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E58A160A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpCybyBE
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so557296f8f.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003646; x=1795608446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=167OHAGXM6J7PJAqZ3MLk9kxvb+fEinCgbUkehm0fFo=;
        b=UpCybyBEXExg7fNyUzYHBW3rjcRsRXehyFFmfjaYvHLSQ90D5OFnveZgTMARiksJNJ
         uEo1gYGyFBz5M/L1biwqZDQpqSuBmv3z9cXIRbLCZCWB2YGoBTB5aNbXgwYOJxRmwMQy
         L5sJ5TsbCibNGc4ossOWkSSNPuTaSHaHEdNCf7qpeEonP8siaY2D3g6Nfvhwl8uvq7MK
         VQuZEzjtfY2J+R265c6K2fB5CRwrOFUpXNvB2V8Cj45FFnLMsxqOYMqoVfrw9Bt0UQDT
         DY5/T/+uKCoxo3cf2CGgoKDFlnirJjwoffAbXmcXRBC6bwGN9V/b7E0jYizr9J/2YsJs
         WGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003646; x=1795608446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=167OHAGXM6J7PJAqZ3MLk9kxvb+fEinCgbUkehm0fFo=;
        b=c8keJcxtP17UJLE5m/c6E88f2tiXu+mwOfYLS9ucanPJHDWXUgfNOkVK9sg4aZX01+
         JMdO7ztP+VL24nFGSlnwSVaiR1W5z/+qRecUxT6rwNYkqcQphrOB1o5z5/1wqLF7rZK/
         ZdbGPaQuEdrBFw6EDeI5sfsWYgkKIF3WIREFqFvH+8cV4FXgZCvoCPWF4hAsTHloPKDs
         SJ2r3LrPpZxpLueQk42an+qXBohID866cxG8IWD7cXN6VKPHNewkJj8aR6nFMFgSgpcf
         bVC6ZlJ2zyf5eUbuQ+PZFinuLfoPcfRwoXO4teIDMmrY6S1yxJ3aBA7JQeav/iwDKSPI
         WItg==
X-Gm-Message-State: APuU4Z/rtQcRnOEqJ+dmNdEuKSw7urMyAqUNDgaxSkrR5lWiVMpDpzxt
	eOLLtnjj8d8EZeNaQkySAiSK/1+dz1LT/Nk4p67oG5wP/dVpC5IIp5FI
X-Gm-Gg: AZFdTZcweFhxzupgz6sJXPUUoAYTVaI/WR74YwJfgB2gUgIK1Drpv/Op+544BON9Ljj
	0Bp1Ev/ui8vRlitsLWTjuYNvw2s2OfKWavinthVvVJOYRbITtAUW/5GMG1HXjBR067MOjJ/oFGF
	b9XkdLGUkBb6THrJI2g3cSoxtRpsVVvdsuONJljOXNvcbv5FseIv1ZhTPHMD70C2f7MTZKR24+u
	AYW7Wqwa2lNIr3P/rX9xAJCfaENT/dI7taZBC8usdtIx11sBX33UMcXXr1IDsTLdS1TQkMfgwrL
	PaSbWJz5ubzeW54GD2JpvNKT5mQsuee1R2ueu/TcTQVHoJoit5WIYOwBIsEAsCtS/gZt5x07IuP
	B7QnDCzfZbOEaOFpt1gfjNU2rQv259C4FmFWZtvo8Twllj3EwcSx4uxB94xJuhvvztrVeKVk9VT
	EBd+ri8axlzzflmdWqh6fQl/BtQ1fDHYW6VcPvcPDdqWYk+rgDSwQPIwexBEGPK1BwxkeIcX/2U
	tV6BSrNnjCj2ZxAsWlrGmv5f07a7SA/qF+Gul3qJhZSR0sFuuYd/byxOxIygt1RuoN+GjMHft1Y
	4NQ6zUp8q7GhM5ekir8fYvt985sOXhivncsHBrgPaz1I+IwlU/LRg7XZKx5Jkb8KmRoR5U4xmb9
	gQrb0/GyNOLkcwTLTW0k/
X-Received: by 2002:a05:6000:1606:b0:48e:6f84:2e8e with SMTP id ffacd0b85a97d-4a63e6f1a49mr3049066f8f.39.1795003646222;
        Wed, 18 Nov 2026 04:07:26 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:25 -0800 (PST)
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
Subject: [PATCH v2 09/10] arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
Date: Wed, 18 Nov 2026 13:07:13 +0100
Message-Id: <20261118120714.31505-10-rofikcoga@gmail.com>
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

Enable the PM8150B Type-C controller in sink mode with PDO_VAR up to
9V/3A, and connect the OF graph endpoints for USB DWC3 and SuperSpeed
QMP PHY orientation switching.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index be5b894b677bb..12ca5ea921fff 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -556,6 +557,45 @@ volume_down_state: volume-down-state {
 	};
 };
 
+&pm8150b_typec {
+	status = "okay";
+
+	vdd-pdphy-supply = <&vreg_l2a_3p1>;
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "sink";
+		data-role = "device";
+		self-powered;
+
+		op-sink-microwatt = <15000000>;
+		sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+			     PDO_VAR(5000, 9000, 3000)>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				pm8150b_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				pm8150b_typec_mux: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
+
 &pon {
 	status = "okay";
 };
@@ -684,6 +724,10 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
@@ -698,3 +742,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l18a_0p9>;
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux>;
+};
-- 
2.39.5

