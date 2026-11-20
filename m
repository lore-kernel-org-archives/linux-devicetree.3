Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190103;
	b=JsGPmiWpt8zvo6zgU4zGAdVa8AbbjcZocHgWftmEVdeIdb2QMFCW/Ft40kRPibXrnSnt
	 NCv2uHNvBXsRVwV2qM5Ib6kIEVzNPKnkrw9SL5VCgFo48vW5HN6yiAUMQuN1uV/OaID64
	 7hcL3YbrAbhlrab2h4M4WBrPlEaxWVgh4nPP6yztJmWoadFiLKPJKsH2c4ATOKtruLJ8u
	 R4q6rctpHfX6qR7dxFlzxLVFM+0A+kZbECYDkIlbyJJg1iuc66x99zlPryfd6l6jdBV5u
	 7r/+D/kf7V+4HPYlgiMUuu5aG9op6HyuF2+Msy/9vy/nKab7swSuXEodkiZcFPMSGSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=grKFuqlZy/vF+EZ9KT+ynP4RyPsh8Pe65v03F3LVnyg=;
	b=wduQlc0HE85gvnUwk/seIEQ6hvlbOD8XnYujLsJgb6lvaa+Z5owa5XMVY+NrCpa+0ovJ
	 cxDPqEnd+BeFZNX+atJuUxjeP6Q3OJTpTprZnIWKiL5N+13as2B2UhELvyBAaul318N1I
	 0t/6gEIHrr+5pO4CyKqlKreIXRmMeba5X+kmlhxtYeHBT8bgFVNy9LS4Nv1R0EraKGDkh
	 ZtKt+Fx5uuvzKvgxwOq285MKNhfo2103TjTUv7kBxn1nBMs+Ez8bsvilYA6z1eg2cqs20
	 OqDZysvkRh1dTg8BSuABrKgR9DoHWkQIO4/nEe7GWAfe//o0tboEvj+zQ7uUzIfBcFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2kOcKCi;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2D960A5BFE
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB2D960A5BFE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2kOcKCi
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e47347279so609129f8f.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190101; x=1795794901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grKFuqlZy/vF+EZ9KT+ynP4RyPsh8Pe65v03F3LVnyg=;
        b=s2kOcKCiOdhayP7XlDN2K+jTO88jXK32Xj8Z2koNKcodABBvPJzDEE4lrX+uH+BskK
         0j3ep3cMpa603H22Sp9sjtiY5cc1X+dlyc2t1VLetPq93hcTtVn7qjJY2XO0nzH2u3+J
         jISqCrmykUqbgdHqNpBZMZn42xrQi+HUo94jrL0T5wA+C1RQjryX/goit+z12GCpIuyX
         rTN6a/b6TrCLyY4Tnt1HRXy5HelUHYJQ+iX8L9yCnRYQB+5LEeJumKhULoWd8pZfTJsp
         jAgjEBkCFcppCTLmOUI4cipO1YR5A9A8vrYTly24tBfFcIjv4eHRHrgGaKouh/fAOe77
         Egfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190101; x=1795794901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=grKFuqlZy/vF+EZ9KT+ynP4RyPsh8Pe65v03F3LVnyg=;
        b=vM9FAJO8WiuS3687qi/RKVJagFdRrRgkxj+RAHVmEgDR0ZTFbNENg01OIy0sP4u9f7
         KAQ9nBJYyZGXmUEA3MJXT6kEwsoJjdgBAriO35nlGCpRUXS/8c/C3Vj8TlGQL5opRMnl
         bv+bcNh/KxrOcIZlPCfpVLCEqJEL/CqBFm4bcbYooizylWZQ2uDFzk9pXs6GRGzldak+
         hp6SRTBfFHkKwP6wrlzz0J4w0nxGhlFk0QRR++hxhjFUlXXjYIaKEk2Vx1sNq4kw/GV/
         QvDV8qPTngrTvczUnqqpIFrqrBTQi1pmbnRkbsU5lWatUnPNpa8BZlJY91o2KmzTp/L4
         maug==
X-Gm-Message-State: APuU4Z9JTxUPmFu0ZJ0gOuim0ENWpb/wqtNQP2J1TGeTWax9Gmgenoxg
	xVeZq2LZLwXC6MRxoUP80rcHpbn5J2i3BlHv2Hmx9cuncTqd2YHp6tz5
X-Gm-Gg: AYBFou35Lp8QvuU/fToCmy9uqFbsHY4ycU6eW/FOtbLmkGvKqkokf52Nagix2L+7wrw
	RHQSqQJVguVEI8iLId0+HXPdWz7lOqPIPxZFKNd/dkmjCKd93b0Hnm7ERxTBC9m9qCGSGzgtq96
	liB0qXf9r5M2/4CJTMSxuVHRqzAQkSgqqGf81IOHv0c0rZ/eUgk0JjawUFf2p1Prv6rdbjaa2N0
	z/s35GGj//FD/5UflXqGVd4Z/nQhG7n8c0GSXoANuRujtvBtCQ4lzgO0ySFILcLpvgTpbQUYmZm
	u2eu49WPfaHOPp3cwuNWpNE3VmvcoW8yjpgw3GgOFtBRWU8yxs4kc1Vm/mY3Ase4YD1wYSBjdWj
	2fnOmCjo4d2lS3CW9oj5CEzSC9rCB6vNqiE4jPPaqeJQGw5PnToD/GKpio+Dw6xd8NhiN+jzlwe
	liK4iwRoBLJpTADzQF6OEWxa2+Ucpk7uMDIB4r4GCMPbSdYVtrNbkKaH8qkGUgln5EsIkDbOLXz
	VLfYpBTHvSWYS9/n+ZCiImJI7KtcZoS2p5kIAyshgumwPsq5R5D3nh6QCXgtm4f2xs9ehzzm2kL
	GEcin6pw3JhAn9+n3lBqHW1fnR0hvcJamPAOKtwVoXfgi25fuKRBuSEQwKYUbDhIYcnQnbLUpac
	=
X-Received: by 2002:a05:600c:3e0e:b0:4bb:6a5a:783d with SMTP id 5b1f17b1804b1-4bb88929c63mr74999345e9.18.1795190101297;
        Fri, 20 Nov 2026 07:55:01 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:55:00 -0800 (PST)
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
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v5 09/10] arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
Date: Fri, 20 Nov 2026 16:54:48 +0100
Message-Id: <20261120155450.7719-10-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
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
index 6f00495d42467..16ed6b3871374 100644
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
@@ -555,6 +556,44 @@ volume_down_state: volume-down-state {
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
@@ -659,6 +698,10 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
@@ -673,3 +716,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l18a_0p9>;
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux>;
+};
-- 
2.39.5

