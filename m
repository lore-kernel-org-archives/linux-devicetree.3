Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160052;
	b=lNMZveGHaIOxzqnXltctjgGFql4NP2V6Q1kZYSZZVUfrB5OTZJNPGClKxJxKg1QUhC5G
	 QH9MvX6G5J7hNVts4yj1XsF4OTaYARN1ng7/HIUFEuq2kmyD6lBuhQxEU1kRW31ItJwz+
	 XDYN9/JRyTIj3kB8bldsa5+goAspHpS99XwmRVrILk6RU8ZN5pOSZFMnSRN7nokNB36tp
	 j0UpSOs+yQYtDmQRbx0b00LYVuqkVhreMqEJ/y2UXt7YdDkD6Yro3VTiURdPH3XlnpAhQ
	 WOGfmpXIQ9gb6FSgV0NmCjvawU/MpuhWdH6QqsVkcPbzZae34nnIOidoIUsQVVvw1/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kRnaLXMIjjDmMSY6mFAZa1ZXluewGJuLAGDDGmmf4rQ=;
	b=bFJ39VaJVRgMdYQV7Zt70RxZAT3mExFlq9N8ZoxpAzyiVuqAzFgw3T0u3hqI7z0zPdye
	 41A5eQxhZBX9unrIXQPrP3hx7p4NxFMCdEdRNt//yP4+PCVXMXPOP+Pp9H6FoQnuusCUZ
	 63MPDmxoyZiiutX5nOuRz4Pf+kV4JFnOnpQUT30vqfPpZca/s3BPOIfFdTL/bs0QdNkqy
	 m+MZUEOFLTifEzlzvPqYVzQRl6VDMHfuvA5jt3aAD1VOeqovMnZyFQR2Ctpjzf1dSfglC
	 Rb3r64UQbPzghl76LoDz5fvSbXe7eRezwY9BuKBAWCjckQqNuOKkPSM4nSTsxmGyHJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKPNdU8p;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51B860A2613
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C51B860A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKPNdU8p
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb606491faso2555215e9.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 23:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160050; x=1795764850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRnaLXMIjjDmMSY6mFAZa1ZXluewGJuLAGDDGmmf4rQ=;
        b=HKPNdU8p6BYIA0PhbhaC1eJory9J9d32I7tNCfsWv3fuI/ikf80iOswt2MD/UneDAR
         pZfsOIkqqGcjGwnK+QtkPXz76nrHkKEKIwP45S6dvMaiaSmTWRYOYMj9bs8Kvr9CqIhy
         UlpiewL52fQp4co1XHQk4F373mEW+dWSbBgzggPwt42FJHWZ7PAAtv//hGT/1c5aa2xJ
         /zbRclE/JIs2XkUT1vW3xRAdh6aefo8FO+wSmudGTq3AiCh0FSnZyAGRaqLKNoh5deiz
         cM5lGO7zQLxFPFWg9KsIf1xmHAtyWTRD7J4o+skfJ5KIHrZLemE6Y9/SB3dgKLtZsULk
         xLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160050; x=1795764850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRnaLXMIjjDmMSY6mFAZa1ZXluewGJuLAGDDGmmf4rQ=;
        b=Hh7WW43BW3xrOiFz5PoRmGqvU3u+f8Ts6saSBf5Q3p1j8uKNCoFix4SDfO6wnx8Zng
         vnUZjGm6Wc//cXAc+DrNzrz9akA3meEzXSiZfucmJDHdQzhxq/q3TW8v78+AMTwfgFV9
         31v6HkSzeLlN3HlzUrU2n/PPSILORR8YBhRrzkkXDTJDJBS0s4SpZPi/dQ54XCPl8679
         OmB5oI3KW1k8OfAqjdgsFjt/Rzamxi2Z93oWAV8lgJQNEArqR6tSzvhHPi7Rxh74HrD4
         cO43jZDOGwVwI2fOVUQRqta0tf8lRZ4xzcgCWsLveU3+QPrE8yH5/gZp3os1D01+B4rZ
         RIUA==
X-Gm-Message-State: APuU4Z9kSHOE5YYQuWr6sCJnA8S2UUfRGtHnDEdyAiatQOPk25/1K9dK
	hpX+lhHQMtnZs4YxxGH2Bf0JKUZS4D9uLqHmbyrKVZLmfYpzmXBncBbt
X-Gm-Gg: AYBFou1c86BW1R0MHF5iaBa41PxKAqeAlpHJKPDm5dFPo1SMFY35//l2SU9YeexCrAO
	cpMQvuC+2rbaDLiJkP0RmTGIWMWzZCQYOBn3hOboibM+tINTnini4NrtatHGDKrhp7/iYOMhZFk
	4860nJC9575SZMNdNZfzH/ouua8+rzW6vns4nXNllXLF9ykOzD3oDUcPomSGOp1gn4LuJIAYMxs
	xMlfQeKzRuQTQYDsSmrwChV8kgLAKXJMB4+EBjkQ2wBM+F358acW/JuAvk7y+ztXozhnAmotpQq
	pCms1uIY5q//v0LbyPTEx1ITjcrVbdqt/5Lt/ILPaHhtWotFiJl1TBcoJX/DmkX7Fj3FujniULx
	Nz589ZDYaC1TqMhv566E4ecZP0YaGj3P8QYKhE5hjsGVmynH3eLZY/vS4XDnxf8FrpSm+KYOv1t
	uGpGe4bPODYB8TX5KIP9Uqh05rtFmlmHh01Mo4qdbM/E59oBEUidzS29/QIyb6fD6stZz9LjSQL
	PJO7r14dvTfoEKdIGgLTb97oicsZ9r4efj90j4ZkGI2q87zcpSps/0tp5ez8Mc7/aJ8sZMpib/j
	+0FxaP9L2lHem//jQ7kMIucb2SrTM/gkw9RmxjJaJ7oXXAaa0hVTPp6du2FUNqa4WE3I+jcqSMM
	=
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb8881c5bdmr46585025e9.20.1795160050056;
        Thu, 19 Nov 2026 23:34:10 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:09 -0800 (PST)
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
Subject: [PATCH v4 09/10] arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
Date: Fri, 20 Nov 2026 08:33:57 +0100
Message-Id: <20261120073358.10267-10-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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
index 16014df9c087a..2d8b06c05ecc3 100644
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

