Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107275;
	b=nkEM1v4sLJSrNCGnRmFq68tIRJndK2cZn213Z2BBv3Xdd6CdsYnZd4eo5juesKZOB+HI
	 L2eymq7+3UJBlv0hjUNbLqNKha4XPa56l2R8d9I+tFCAzPrCNVLFfsAFASZul25j8bAn0
	 x4kPrMUeqcVCvyNw/fkCQEoAoxPZVCXMyfk1FO9aWcCNP58jiybtjV0AesiTKVVno9RZ8
	 mNSMm8HB6idv7eZNY2phxFJeY+y5oQggjp8jdrDj8C1QwtPsmurt1U9cWmN21xdyAcFuW
	 smMyVe3DrQ57iwpfGi+ByXQ10/Qk9sNuM3vr2fBUO13ShxCgHscbRCpmsYZv1AERfcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8HAdjmJFS/vSTReOhqoIJm4R7O9SEUoXAZM3wxNxKGg=;
	b=QY9DK7MP0rG+cVveUO7ygMHwC4qDIYXqaSU9323kRXCuNq1FryOzJ8Lk6Ybc9uEhbkXG
	 OU3kEk4L599P9BFZBKmm1oPi+zOAdLWOvBU7lL8Cail8QRd3e6FOBiU0FPdqahNveuIho
	 k6TVi/hVBB5cJjqadzeGjA6i0As+gRfivzNx9s/gDSlkLMOD+dJEcA2AVVY4FAmly9GHu
	 Sbr54vd+KBhICWkafqVeeWnC188C4bFVddNKBJg5l+FcS4URK3xFcrM/GVQFh1S+RNGr/
	 sUCzrQrJqflnc9LFyVJSZnQ2xs7B1kZBWQQOmnOfSw8WCUKXoitGa7WIJhdOuSFh0rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWxDVM+f;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7058F60A6F5B
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7058F60A6F5B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWxDVM+f
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so12605405e9.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107273; x=1795712073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8HAdjmJFS/vSTReOhqoIJm4R7O9SEUoXAZM3wxNxKGg=;
        b=tWxDVM+fAapdNLO5oAWMSWtAihRfVvePxg2vTZOMR1EAAz1T6LOrtjMhCbIyJukujb
         CK8xrym1k13GJeg8eVnp9YpO7I8Dml4JbqzQPDDNTW260lmsIw1Dy+21wMRdeblnV8GR
         rHisEaxrRdyV7+Iatn88T/yvi4WJXXkqtg4Teig9r/bD8OS9HsoYZmSR6+eLHfTP+TaK
         n8Q+MisHDTFGPTSqSsmHX1qPdRCEoAmYQNGhRWvVjUQVo5FFWYJO8fp22aEacncxuyIU
         NufuF4F5ndIjeqeCEhW7rSePkv+nfoUuAC5W8V9Omo7ibEFqK78trnrigzgQ+6gXRKnz
         5NjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107273; x=1795712073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8HAdjmJFS/vSTReOhqoIJm4R7O9SEUoXAZM3wxNxKGg=;
        b=FPIpRlM4SUJfXHjePQDbwS4cpt91e3aRlVHxtsHERocy2LFKKtKOzg/eF/JCBsi/XG
         ORFx07Kh0mmk7aWO4M2Ij4S1NmKa244id+Dem0C2pDTSlRHeGOytRH3jBMIRKLaAtsVj
         m/8OGlRY+oJwT0p3AnDqZGnu4cgKIFiLMsi+xhj8taTZ50DNDaOcesXJDgPBOPbEKMUG
         myeYUQYb5D0bLVv7/tQSY8Pbn3ljH3XAcX4qqWFpZklVpLRF6bWOKflkGinqw/nuu11M
         w8TA78Tw01crW0Es5jKpSN+sLakR5tFQaVuPhLxGHy6R3zqJtoowk2leGIs2GGP6n6xa
         dR9w==
X-Gm-Message-State: APuU4Z+J97XplWnUGv0LYu9tg/5ozYIbnLBdV8VPkvpcYDpwOYYODti2
	Pma/s3+vLsGM/8I12tUarRSPNF14Dwe+L7zKFeaHKc/7J2yqIQArJv2wPR4jFfTKr9E=
X-Gm-Gg: AYBFou0RtbFwtXMjh264agFplHwiI1Zpcx7ukc5RPQGU4AhORc9ZLiJEnDlZsUR48g3
	RZHUHoEalapBKeadEdInptmxV2NJIVXlN3OkhOEn2kaQ+F3W8x9vCG7qnIU3JMbXlrBoIhF2Xmn
	GP2uX+KSPNe8NtgDjuqNvKW9G9tOK6BY5bV/Rdm0lI7ctcQCjcZ74bu6hW/S7bik1tds/GyswJD
	emYHEQrASohmGhr0YQ+QQ2oD1/n1DoCCOuHeEQNmsdChasIhmvbnXSqnqjxc92mgJUYbd3DBZRG
	0i6x+u20JWRZ15fpvbuYO5BTf3rERcPXGS00JLuPfQMpynKu9pkW8cZUSnuV9qxkLZEI7kYnhLJ
	Zqc9FoknKIf+Jz12+/AoHhOvWPudlTFmsoPBFwLoBr2+EesUyJ5/jnARaMWvDdpwe2guWMB+gt2
	n1PiF7FmHSnsL9N8Chh/RB3TGZXhBvXQYalb+KiAiQUw/FeD5uRQeE7lfG3Re76zjAcQ8lHh4Sm
	GKEciYz+kL9PjyeB2eCZIrF1ifWNv0qf5Bkc/5ItlOwi02elpRihDd04SQfRMUAy9hNfFWVbLpL
	i17UqJc2fSm//ZmBrTY39BmgPWiWLaX2AWj2EyBC6NDvpfUiT2WgkxCaslZbkiBpGJhsyxRi8lN
	P
X-Received: by 2002:a05:600c:8b11:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb8881c630mr1984605e9.27.1795107272825;
        Thu, 19 Nov 2026 08:54:32 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:32 -0800 (PST)
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
Subject: [PATCH v3 09/10] arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
Date: Thu, 19 Nov 2026 17:54:19 +0100
Message-Id: <20261119165420.24466-10-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 160b6f4c98b17..3ce8161574a95 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -556,6 +557,44 @@ volume_down_state: volume-down-state {
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
 &pon_pwrkey {
 	status = "okay";
 };
@@ -660,6 +699,10 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
@@ -674,3 +717,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l18a_0p9>;
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux>;
+};
-- 
2.39.5

