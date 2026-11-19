Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795128015;
	b=nwLytg4/xvFowsY96qT83kNkeEoyolxFh3L/7iZwe+ueFELX4aCdPfSZ8t0tkSY23/E2
	 6De4itOA2Vqtr75iyINy1y0cS/+AnQn5SDeZnEmrLrla5txg1N/sW/uLIT4oM896nMp7w
	 ZArBvsOOtbBeQp/pQcgfO5DY1fTV0UUHUw1OaV4X+gMrXE/lM9OjAH5ntEkVPWHVRvFoP
	 cTN8QDsCFpMY+I/TCIYRj1m9t2ccqFPn92KfmS/85xTq98/t9N9nuFtyg7S9JXlzpndao
	 F56aVTdVi3zyEueTRW6IVGU02CbB6iPyp7o1Lrd3vwkqzWmBsmBdYoBn6rf4TR2G3Rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128015;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sOKzD0QwmdT1QNOXJqAT1Vjmc1RnydJRCsekWD4V+G0=;
	b=HvMlVX1w+neBmEtZsQoSZrmb8lEMk1WtzugZn3RTbVeM5iZNYMLCOAddMV8L8yGRM1Mp
	 tL7u5SCro45+hmr17w3bme4447F/VHcp6nzizw0ZErIst9UTar55dCIkbzUymENoX/D6P
	 jKL1v9UwRURhkssyPGVJE/9gAovdJjUbkVomz3fdHOdKFBOI0NLPXqp0SOTz9EVEHzCQt
	 JAgZLNbikcb2k1r2nOkrBu0pK/Pp5uqhsi6XHX4iF1azpPVNnFeILC1C20b9op5nD4Dk6
	 IMLk+lL+gwTqwfv7OXJO7EM/NP7l/rMx8uaqvbGYl7dJ91ailGPJLOqkYDdaaegS0/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a9VJkqTm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00F2606A335;
	Thu, 19 Nov 2026 22:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a9VJkqTm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795128015;
	b=gdyqSC7BUIX0iv/5TIhwqQCDv2672x+gjEWwItZeQP2NXgZphARDnxCSwuKuQhBc6fCO
	 MYqBrcZGHRkwXVTy6OXpQflPW4qQVTpTP80e4Ac87hEnst2cUwgos9q2i4mwAMrw5kcJV
	 TLyQS9on3PbCKfcmktjr9hXXE+GGYW0yfB6vQ3jrRdiXYFlAXelBZBbST5Fz9G2fPvwcx
	 eGedio2pF4L7X3QLA+m2+AExbvbDEfnQLm25+mSpXmqBF9jG69OdP9f9A8jV8TbYxd+em
	 df7XusJQC/IXZ+4k9UHIrBStWhZ3PdnnLauvvZmjFtUwlihwun8kQoI7u4smT1oQuCg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795128015;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sOKzD0QwmdT1QNOXJqAT1Vjmc1RnydJRCsekWD4V+G0=;
	b=wRwT0ktJf4LXQvqvz6vtLZR+PW0cGh7+USOyCy+QMKficNi/wBGnzoYrwJjTUX7Ctiwz
	 mbtFGL9zBVcuMoBQYsThJ4DqMbnjkYtx0wMreMWvgT5QLqTWO/wV+P9IWJRAal1GM7Ag8
	 +N4fhCHNTTjHRI1rmNkng0HP/plgjGVhrUmS1i5Q+lazlvvg16FQKh2lZ3B7Pjm75YiOq
	 QWWcM9LlwzwjjJZFYtzk3zIDUGQ8YOxvOmRMMoQH1d8xlBf8+MgRD7dv2Dc6OMNNSTdR1
	 MRu26aoTthRcCDcMo+J3yDDY+ukcVoJK9BpPIpcjHYoiC+CrXrm37VWuOxS+pkPxTiA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7AA021F000CF;
	Thu, 19 Nov 2026 22:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795128015;
	bh=sOKzD0QwmdT1QNOXJqAT1Vjmc1RnydJRCsekWD4V+G0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=a9VJkqTmlPmCnSSePr6K8eFDJFWJjHmb6Tz2ljpksk0mDyCRLJl4/qLdhaETLb373
	 RkNcTaZdj/EisJtkFMRzoPPM+UxzCspPlS49hOYl3REe6OykUXp27RrgW1CNVGWjbP
	 WjcrS6M36yPC3HgLQkYOXSSKLl0wYAdM62Skk2tE/0+5XDWTzBRhMKCicaxyRjOi1h
	 +evn7VRHBeMiQgml1IhdTZudI8lN/HyzOvd3dPbhgeAdDjmml1RiRKJ1ruThju/2y9
	 2NsyWaFqP1E5XcnX9vrZNOPEo37kxl55jS2fqWF5y/o35GfGg7or5nA8zDn4Uqgp7c
	 QR4IHmug0bolA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0AEE1422D4;
	Thu, 19 Nov 2026 22:40:14 +0000 (UTC)
From: Nizat Mikayilli via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Date: Thu, 19 Nov 2026 23:40:07 +0100
Subject: [PATCH 4/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Add board
 thermistors
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
Message-Id: <20261119-b4-gts9wifi-followups-v1-4-2e2388589a62@dxdmail.cc>
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nizat Mikayilli <nacht@dxdmail.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795128013; l=2808;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=rpPNI7LwXrNRy5b+woHc/0r8JGjvdXVNkvB1nnVjwFk=;
 b=bBIARGKuMgkM99NrhlPLK7MFXesfMmsrHSPepEdgfHa4ZjMWjNiJU1YPQD5Et75oOIBTimGru
 NjMCTbNi6XPAVJqvbAQ+xi0tvRAwmpJ3tQZjuh0007qZYcWlNUpP0Ld
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: Nizat Mikayilli <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc
Content-Transfer-Encoding: 7bit

From: Nizat Mikayilli <nacht@dxdmail.cc>

Describe the XO, battery, charger and AP thermistors on the PMK8550 and
PM8550 AMUX inputs, and add a thermal zone for each. The battery
thermistor is the input that the vendor kernel reads as the battery
temperature, although its device tree labels it wpc_thm.

Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
---
 .../boot/dts/qcom/sm8550-samsung-gts9wifi.dts      | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
index ea69d161e6b6..4dc0b7e29db3 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
@@ -162,6 +162,56 @@ platform {
 		};
 	};
 
+	thermal-zones {
+		ap-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+
+			trips {
+				trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		battery-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+
+			trips {
+				trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		chg-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+
+			trips {
+				trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		xo-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(0)>;
+
+			trips {
+				trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
 	vibrator {
 		compatible = "gpio-vibrator";
 		enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
@@ -710,6 +760,44 @@ pmk8550_sleep_clk: sleep-clk-state {
 	};
 };
 
+&pmk8550_vadc {
+	channel@44 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(0)>;
+		label = "pmk8550_xo_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@144 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+		label = "pm8550_batt_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@145 {
+		reg = <ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+		label = "pm8550_chg_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@148 {
+		reg = <ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		label = "pm8550_ap_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+};
+
 &pon_pwrkey {
 	status = "okay";
 };

-- 
2.56.1


