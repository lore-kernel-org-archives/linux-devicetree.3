Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313238;
	b=JgTdmVXicVDUQnlt56GmbYb6MKUAve+wAWjWQsjUmbLGMSHGa5FH6K2lrCr8IrZ/Kec1
	 zwOxJYOQ4zQNAxTNvO5hdUdW+3r02h1tSJdP3ebCzvG8GvHUUZLWm+Q7+BQjy6hDQqYPZ
	 UmEulaqSintUl+QMl0S2zqwm21vkB/iGpiTNkvy6LwX0XTx2KckmmMZ4Q/9Be/o90/f4y
	 PLWBinZaXNmREsuCnqxM8IZt4zEcLcWFRleDFPXLtTurn6/2KPLfLUFOaysBH8TZle2PR
	 7BLYSg8tT7S/3LogHfGo+pE5C+QSNRALCw8riKSisoXNfR3N9SPGliu1sZ/eRS38bPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313238;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=mCGNYE9C8B7yg1JTGKzCrzUru817Ifb9QankBvn3rdA=;
	b=DXaHI3JP5HkTDzhEyWnMX1e+Z3EWBNF3wX6PI9QZh+yLfA37tq4A6ryGm6wdAbop1+dw
	 oAuw5S4yTNE4IPzu1wx+chnDsmy2LsfLT76JROb0ByRZnuRoUpUqCJxtkR1yHivM23R/E
	 RvYAGjuFoaEHvjhFfB1lBiT5h8dcIEIpxNzhGbSQvgZ76pXOm1iivWbgiSdJyFHw65n+7
	 rU6dZisbeHwLsVE5UwqoCXMY+oDBFCh86h94SGfZkORGqi5UPloM1bf0vTvAzCS/PS2ny
	 3WjHJu09yM/0kLjKWH1ETFQYPNHJJJ2cpQYGO3z5mzhNKjG834hqsCghOjU4QWK0Qdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=lEblwn4Q;
	arc=none smtp.remote-ip=109.224.244.116
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC4A60A260B;
	Thu, 29 Oct 2026 22:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBC4A60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=lEblwn4Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793313235; x=1793572435;
	bh=mCGNYE9C8B7yg1JTGKzCrzUru817Ifb9QankBvn3rdA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lEblwn4QlJMAuOdxeUmM1g7obMgLmqe1dSkXqBmWMvJA/cCHUfWfYvpEWkf+FBpN1
	 rQf6R/lg0XxaOoo7lVhZVwHae8sxE8HNfoprDhaZaQlPAj/al8FfCPXcWhklHn4GjC
	 nUdk7nxvPVLgU4uVGaTFkmqCLs/Z1Q3ki6NPJCqkZ+83kj7iEqhhTJlxdRO0VOVpm+
	 R0/uLcmfz7JQweWB55RrlKtqs+Hpgsw+7g4Fk4XxxFXDjeR32QloyMk50ImAgnMn5h
	 s5NwUPiYuMkbd4ulUDC9DNxdOb1ayV+A8jY3v4Hl85fEw0TRjEupcgjkwoKQU55VSu
	 HlKOMqrq9Zu6w==
Date: Thu, 29 Oct 2026 22:33:52 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 3/5] arm64: dts: qcom: milos-nothing-asteroids: Enable WiFi
Message-ID: <20261029-asteroids-dts-updates-v1-3-79351337d681@pm.me>
In-Reply-To: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 5611ee0d96a6ca47d8a9792473b77b6c5b4ac6b8
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Configure and enable the WiFi node, and add the required pinctrl to
provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts | 19 ++++++++++++++++=
++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/ar=
m64/boot/dts/qcom/milos-nothing-asteroids.dts
index 68b500bd4c3f..7d8afe8e95d5 100644
--- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
+++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
@@ -141,7 +141,7 @@ wcn6750-pmu {
=20
 =09=09clocks =3D <&rpmhcc RPMH_RF_CLK1>;
=20
-=09=09pinctrl-0 =3D <&bluetooth_enable_default>;
+=09=09pinctrl-0 =3D <&bluetooth_enable_default>, <&pmk8550_sleep_clk_defau=
lt>;
 =09=09pinctrl-names =3D "default";
=20
 =09=09regulators {
@@ -916,6 +916,17 @@ &pmiv0104_eusb2_repeater {
 =09qcom,tune-usb2-preem =3D /bits/ 8 <0x6>;
 };
=20
+&pmk8550_gpios {
+=09pmk8550_sleep_clk_default: sleep-clk-default-state {
+=09=09pins =3D "gpio5";
+=09=09function =3D PMIC_GPIO_FUNC_FUNC1;
+=09=09input-disable;
+=09=09output-enable;
+=09=09bias-disable;
+=09=09power-source =3D <0>;
+=09};
+};
+
 &pmr735b_gpios {
 =09s1j_enable_default: s1j-enable-default-state {
 =09=09pins =3D "gpio1";
@@ -1142,3 +1153,9 @@ &usb_1_hsphy {
=20
 =09status =3D "okay";
 };
+
+&wifi {
+=09qcom,calibration-variant =3D "Nothing_Phone_3a";
+
+=09status =3D "okay";
+};

--=20
2.55.0


