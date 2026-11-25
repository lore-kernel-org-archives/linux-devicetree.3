Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607653;
	b=mhnjeW4Hls5ZSrMu+4eaWINilNSRNfwBku8v2Mmckk8nB1STXFwmj0cXPAW0q3MGKzYr
	 W/mjumYug6vZKfpCc7BqFzh/sbH/PaUxVC4T34Ee4QcON3LxIahO2918HkBo3iWwnelw7
	 6ozxNTyttYGNiGpo8ERmFGMBXT+lEa+YnNaShfNfmLG1NwE+1TSE+Ush00M8/9GRHNx36
	 kOrc4p58jjyCAF7nqZa7mKRGO9f8xV56nwcaqCbwf5BEFOpCSHGnsclgB9uwG6JhetgO0
	 T+NbRPoS8d2jWnD8ZPrWZ21FNsJ1AdG53w+evlJoNN2vyir3c0Py57nG1HOUDDqoUpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bAP8MPVU72zIQ48DLEkAqxoVMqgbahC0A7QFbOq8d8k=;
	b=iL54XAM/CpUMXi7P8sGHfKbfhFCQQSwfjgphwcxi9g9Zyc1ozPXmpPzA4PB9xLn8yOVQ
	 KhFqx9MiwLeeuPAXrMRo9hOJim61XplKY9gPtLWvF4EzGXyDtdXo+7GAQ4tdqxvvCp6SC
	 e52zugUYL/ravQZeKgwZHpy8XdvmUNY57+H1a3x7SQ8iz53kU3kq7q5J+6jBoIBsb5/tp
	 BPVA/pO9MsRmXNFYf05RogdQUSNE8FEPvVQmbMb1uofV+cfjB2Tt05omuvvhhDWWBlySJ
	 jdWjY3Sm+Y87zEIfBFNUZZjwBoI2GLDB+jtJxwLdZkqlyb223xlrk1NHloEX9tJFRwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=peHRXwBe;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C033606A32C
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C033606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=peHRXwBe
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so45179065e9.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795607651; x=1796212451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAP8MPVU72zIQ48DLEkAqxoVMqgbahC0A7QFbOq8d8k=;
        b=peHRXwBeGjh7DWMUU1k3slf8xMA8eMgICQutDeItlG0n/KtclFKMds8renUcUtQ9H4
         vlKYdsyf1IW0iA7PDST5kmM+zkM4AcUXOaJewR3vEigblO75OJw8Gu+aN5YUJU+6SCjW
         yy47FCRs9FXgoMZcsh4sjiKDa8sbJ4bIIxncbsIjJjhYyPEJsmNAq6jLFX4rBfoU+MEa
         e1zdsaVAnnpKG8M08BbsDME5v7sbieAYfYeDGBbduvX0xnb9PCIAn3Ty1Dk5ke6jc5/F
         FOyB0+iWpR7DorxVGVPDg3J++lH/ODKAW6T9CujibtOQ3dboUkXmOhYh0uXyvl3TLCTN
         oWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607651; x=1796212451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bAP8MPVU72zIQ48DLEkAqxoVMqgbahC0A7QFbOq8d8k=;
        b=HEpPlo/jevWxJJXR1Gdda74eRluZuU8iNyaBbk1VL8H/NJQuj0a+QVTjZdjhOQoZRy
         IW6Wm+TiZVB38vvOIeEL8X1x2u2bsndH4QQDVP2whbfFENL8NZ2CQKdIf7jN7LLk9NiK
         UJrX5r21VNuy2yC0OWossAkTfhQO44poi3SlV1qWOJcW26SXyIMZ/gnmjT80UfALIa88
         pgIeBZt7WqiWSVLyQOiHrqigqaikFRgBXiVmAZE7IJg18LwcnWLuGtQx7fLT+K8sJ0rv
         397jrdNu6GJPq0oiEiIS5y8wborBgJpu1ynEPAJt4c7+8WyukzPZJeGc/j3a+nEFis2U
         2E4A==
X-Forwarded-Encrypted: i=1; AL+hErF9unjczT3Zv5EGMF4E3kCN/wj7Z19D2lFCTJwjcgpqKValGYgfq78dGNbt31/NEQHmLKAsnjXLeVGs@vger.kernel.org
X-Gm-Message-State: APuU4Z96iXl96/rbf7o4OC38UFZ6FBal7wLdok+6O11Kt/EgWx7dN31W
	2FPpf2E0HlGze/ku3NNB46rnfCosU2ZOy9wDpAR3TJrk89XNTGGWWeBQPOVYpxKU0Yo=
X-Gm-Gg: AZFdTZc+anrZjtRUfocczTGnhLSTElrmf1ATxiWGRBLcL2Do/K3BmZYr7R71h7B+JjF
	YVNY5p45o5lH6xEZV4AkTYOqm8r4sOgsuVZJ3jolXVbP7LG1vKqOp85NDI/AtVoV9HtrHZUnHx4
	1wuyuHQs54+N+sQYtw2m9cGIR2aRjI9u/rng43YUx0WXjARgCPD6INwXsUsH4/9UwL2cxvVVHBi
	91qVgU6nGrcnI0W+hPGDS734nydUhZ9Z2vX7nKDTTxCinelnpWa4LGck9maOnt+9dCnEwRJG/Nw
	WMDbGgoRlDEYNbdBIzaany4eXRyhDQdu/514UubKBPQGrSVjIYNnuCmgWtuNnc1rwwqATsrNDNh
	WFbxn6SnB8w8EWj4iyJu8CUJR7e0HL7PINID49iO9ZOBcwj3yAoPBVgNYNc10nuLyyGz9QRTrXF
	fb6IcIExFf9t7AdtsAzK8YV2PrHa5G4V6KT7Ru46dI+eopVKG74L/3P1VSgvNT1HBYOxqxcRksZ
	UFLd6Mz3vhDLyCRGvVxYC97shd8dNplA5ZWbwGS0UZtcgKVCQNv3sy2al5Ne9iPtAhzym4El+ni
	knlCH4eWHClkJYQ8Ox0Oi5+9gtqoZODv+ftKiY45zxMI3n5YyQVbOp4vn3b7VzUxDWssij4=
X-Received: by 2002:a05:600c:4e8e:b0:4ba:59fa:510e with SMTP id 5b1f17b1804b1-4bb8893014dmr361789275e9.23.1795607651454;
        Wed, 25 Nov 2026 03:54:11 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f643adsm234073615e9.1.2026.11.25.03.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:54:11 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 12:54:08 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sm8650-valve-deckard: add Type-C
 connector
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-topic-sm8650-deckard-tcpm-v1-3-4af33e89ea9e@linaro.org>
References: <20261125-topic-sm8650-deckard-tcpm-v1-0-4af33e89ea9e@linaro.org>
In-Reply-To: <20261125-topic-sm8650-deckard-tcpm-v1-0-4af33e89ea9e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2223;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DGBMbg5rM7lq2dyPtHP6LsElM3jk6iwWqUc1wZ9h3LY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBsxgiEbzIA8KRafCHDHNsipoFh7GiDNJ+Tty+Mnc
 tL8ZfhSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbMYAAKCRB33NvayMhJ0TdgD/
 9xttoKME+78ra6+biaLxkSB+QzyMSiF1tayl8Na4Zj6GBm8AN+AC3mxyWGzPjyMjF7tDQmNsSqO+IF
 YnxASpHCxjq8BX1Ceo19IHxG6da7ni6zkloPx/l/RFt6RJkrVnGETdWy0O5QULpobTl+Z12mGs8i/C
 mXudVAMeVUC0+aUOOI+5McdEqk+yNT9BWY8JgdMP67/XD7USXs7uD2lTMoqcUkmv3okvxDLd9xYNqu
 dhMD4FdyqVmFlCjytSahLBeS0lC+gTgmyzFBs0nClaVdybyTqB1Uk3U/IaWHtLjhGP0YfT5YhcPuVl
 OsobrGfLANA6Ny8ZQ/UK1k/sYBZSxXQyan8M+OucaujfYkDheL2ZS8vz+fvAW/WY1BQ8FXpB43iVB0
 sDK3LkUYybDvbgUIQRhnVs38LbyPjCDnEeHp7xK4RaPODIwMYHv9uINJFUx/Wl9XiNRF1zBA7Y2jBj
 mj/ACFB3in/I4pAaEebcnjQnOP6th0olp0lNf3VzF6TtjHeBqaHv/QToH1Ea41C02q3O53yXXlMyPo
 8/Uhlfsqpc9ODMzLUdz8UmOWvH+2/SOMqDYGUSvBek4+7fvEjLULXzbzVUEpk5fUZG4KDLoXDpYPPh
 tpUzZV8PupxQnUtSryHaC3ZoxHMThRIiSJGznPVTBUROI7TG3rer6wGVBpvw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Enable the Type-C controller and PHY on the PM8550b and add a
connector tied to the USB3 controller to support dual data-role
and power-mode.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 48 ++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
index 74bc0728ae7d..0e68c5a6414c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
@@ -8,6 +8,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8650.dtsi"
 #include "pm8010.dtsi"
 #include "pm8550.dtsi"
@@ -1122,6 +1123,46 @@ &pm8550b_temp_alarm {
 	io-channel-names = "thermal";
 };
 
+&pm8550b_typec {
+	vdd-pdphy-supply = <&vreg_l5b_3p1>;
+
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		try-power-role = "sink";
+		self-powered;
+
+		vbus-supply = <&pm8550b_vbus>;
+
+		source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
+					 PDO_FIXED_DATA_SWAP | PDO_FIXED_USB_COMM)>;
+		sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
+				       PDO_FIXED_DATA_SWAP | PDO_FIXED_USB_COMM)>;
+		op-sink-microwatt = <15000000>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				pmic_typec_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs>;
+				};
+			};
+		};
+	};
+};
+
+&pm8550b_vbus {
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };
@@ -1472,7 +1513,8 @@ &ufs_mem_phy {
 };
 
 &usb_1 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
 
 	/* USB 2.0 only */
 	qcom,select-utmi-as-pipe-clk;
@@ -1485,6 +1527,10 @@ &usb_1 {
 	status = "okay";
 };
 
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_typec_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&vreg_l1i_0p88>;
 	vdda12-supply = <&vreg_l3i_1p2>;

-- 
2.34.1

