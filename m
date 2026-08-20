Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7293DB63F
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 20:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787259406; cv=none; b=AghvJe9GsVlx7riDTbHBZ0MFAHYIK4zUFupDmlZbMaCA342NXKqHwYHSCwjKDCxBw4hPkPXv7fKK179fsslmp3EOxXhPkSqXuCMwZh6ELiMHvTnaxT4ABdxZMXJxvBGROXcEm9GfaaPSG9jTtRSN80dJgxbKrNGtkCMUcLCUwV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787259406; c=relaxed/simple;
	bh=34ATMc5SO5wEemub2fOeue1jnn3V16FMxOOozfaDcik=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=namiIH/cd6nPcDHTanSKhQPR0A/nrBk2d6YbMJVmaVqgks2zSLgh242NdRsWROTL3BG5xOSabH57qb7lLVlIgFh3x+Xt0zKwb+hPkGio3tCozft8BVu/SI8bavhOWU9rSrDW5ENkI2J9ntFBQ6Drij7S5e6p2axFOJzuqmgQTn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=DUrEJ5cc; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="DUrEJ5cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=agiaicdxbbgeflewealzt7h3iq.protonmail; t=1787259376; x=1787518576;
	bh=34ATMc5SO5wEemub2fOeue1jnn3V16FMxOOozfaDcik=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DUrEJ5ccMgB3YtMB8uBjrYCvuFHKbBQ0zeJdWql7vR5s8PZv7aHrri1UkOy711hes
	 2ChTsNNb0LE2IdAkPYArI+gJhSkeFhxkIkziTwgTlFK2lEdy76WcOK65VzmPtVmmo5
	 DyCposYVaeQWSp0uXEIqVtFb5TUerQQwe1AAEPPNbfpGlDf9Zc3pBAvnQg7epzb5BU
	 cQwL0Y8T24svRcBFpiRNS6LcYt3E9WGmb7J6Wgur1NgOXEAHfwPICa/DndtzwIwl/P
	 yQjvykFITdxFDw1XfnAQ1ORWoFH+A2GE/2nl3600i6GDqQH42T4iiWN3IDyJsuEPW+
	 AgPnUo3bSKmQg==
Date: Thu, 20 Aug 2026 20:56:13 +0000
From: Kristian Brox <isyourbrainfoss@proton.me>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Kristian Brox <isyourbrainfoss@proton.me>
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add ST21NFCD NFC
Message-ID: <20260820-fp5-st21nfcd-v3-v3-3-5ee0a7f44d04@proton.me>
In-Reply-To: <20260820-fp5-st21nfcd-v3-v3-0-5ee0a7f44d04@proton.me>
References: <20260820-fp5-st21nfcd-v3-v3-0-5ee0a7f44d04@proton.me>
Feedback-ID: 203906395:user:proton
X-Pm-Message-ID: fb78e9548ad2b497de4729976250c9c27cfb8536
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
active-high. Compatible is st,st21nfcd (raw NCI).

SYS_CLK is LN_BB_CLK2. VPS_IO is L18B (vreg_l18b). ese-present and
uicc-present follow the public schematic (NFC_SWP1/SWP2: SWP_SE to
SIM1, SWP_UICC to SIM2). Reader path is tested; SE/HCE is not.

Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 34 ++++++++++++++++++=
+++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm6=
4/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 04cb9230d..ef66079a0 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -908,7 +908,23 @@ redriver_ss_in: endpoint {
 &i2c9 {
 =09status =3D "okay";
=20
-=09/* ST21NFC NFC @ 28 */
+=09nfc@8 {
+=09=09compatible =3D "st,st21nfcd";
+=09=09reg =3D <0x08>;
+
+=09=09interrupts-extended =3D <&tlmm 41 IRQ_TYPE_LEVEL_HIGH>;
+=09=09reset-gpios =3D <&tlmm 38 GPIO_ACTIVE_HIGH>;
+
+=09=09pinctrl-0 =3D <&nfc_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09clocks =3D <&rpmhcc RPMH_LN_BB_CLK2>;
+=09=09vdd-io-supply =3D <&vreg_l18b>;
+
+=09=09ese-present;
+=09=09uicc-present;
+=09};
+
 =09/* VL53L3 ToF @ 29 */
 };
=20
@@ -1410,6 +1426,22 @@ hall_sensor_default: hall-sensor-default-state {
 =09=09drive-strength =3D <2>;
 =09=09bias-pull-up;
 =09};
+
+=09nfc_default: nfc-default-state {
+=09=09reset-pins {
+=09=09=09pins =3D "gpio38";
+=09=09=09function =3D "gpio";
+=09=09=09drive-strength =3D <2>;
+=09=09=09bias-disable;
+=09=09};
+
+=09=09int-pins {
+=09=09=09pins =3D "gpio41";
+=09=09=09function =3D "gpio";
+=09=09=09drive-strength =3D <2>;
+=09=09=09bias-disable;
+=09=09};
+=09};
 };
=20
 &uart5 {

--=20
2.55.0


