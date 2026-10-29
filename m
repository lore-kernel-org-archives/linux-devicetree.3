Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313229;
	b=JLySxzje3bFwXRJKYPnIdecdbNjqYaHPvjS08np6NBZ8YFfKzQbStuW+sCVHbAGkQ2kr
	 0FcuB7Z5OQjIC9RXoImu60hJrqGAtoh+xx+19TzHoARgj11/n8LPkwEA7hiMfEnZT5Tqk
	 MtcuN6dZF/JbV/sapIuF2T96VMycNAHGDzsKq1beMcD4DXXQRXNhcbM8yYYN8KFSN0Hzc
	 5IGHg0Ia/rZWn7wdp4d+fIelieBSOaTWM66Notn2OKkdyZCqFarwvYWIqnN0Y/BHeyY7M
	 NJAFQrP9drVZFFEH20qSo4qGipg4twOiG03Ru0BHCF6bhrMj+eLlOA//Nnk3wSLKUIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313229;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=JFikOhBz3uKqVdbJtzfexHTCJHzEWcoNMGVqvTNaMF8=;
	b=muN/BhFvcY4EQJX9AMvEanHT7jF7Eh11j+/RjaAoELiL7UzPiv2s4JbGYSpkSpwoepy5
	 XLUC6X6Z7fvTYZZFFuO1mK9jrgnksuEKhZcKLEKUxsdudo8J2djd2AGCdrJRjMKMZjXh9
	 Ypw8FdCoLkQ02epCEd3BX3iGM6hGjH0Ad9PlX/zSXAeM5kWwMgA5eeZjrjzhAhJNxluyn
	 fhFxqiFk5gsnidyjuaPPHMBjr4DSmOB9W3Rcjpoia2koRagtnxfoDG1O8sGBpldSPWEwe
	 UDF+1wuSfZK78b3YHnJPHZf4Ioh4YfhGCrGJ7edtZ0zd+Q1zQvct8kKIAIhk56bMHCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=Ds8Xsv1y;
	arc=none smtp.remote-ip=109.224.244.16
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBC5606A33E
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 22:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BBC5606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=Ds8Xsv1y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793313227; x=1793572427;
	bh=JFikOhBz3uKqVdbJtzfexHTCJHzEWcoNMGVqvTNaMF8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ds8Xsv1yWuch0ResPq8z2W0MG6Us96Bf6zrICpBrei20YuEixfEwdqPPUPxWAhPPn
	 VFdiDA3bDaqO9/D0kfAa78JD5fpIZuK3SCIGUWfIEV7nBer4IVOGmQ6+T8lIDua1z1
	 61GBKaDgKK4SHEvXAKUthOdmPyd6wzd8QilSaWZetpYQMOTnsjGDZ3nJ5JZtNYos77
	 IWsQAX4zHJDPlG/d5AaXt0xKt5k02x4KE0mC/GaUiW7OPhJznbyqY0g6r2ta0WHwTg
	 cZtYNHsp6yZg45f5BUjh+TdqnzvlzCbLXBNaEMPlnXmFV+K/GaFk2QtBRpNlsTy+r4
	 xwajKm+Pen8xA==
Date: Thu, 29 Oct 2026 22:33:44 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/5] arm64: dts: qcom: milos-nothing-asteroids: Enable UFS
Message-ID: <20261029-asteroids-dts-updates-v1-1-79351337d681@pm.me>
In-Reply-To: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 0affe815fa059bc011bf0efcfe337618406a185a
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

Configure and enable the nodes for UFS, so that we can access the
internal storage.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts | 18 ++++++++++++++++=
++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/ar=
m64/boot/dts/qcom/milos-nothing-asteroids.dts
index 787acef4a4c8..fa0cbf78b69a 100644
--- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
+++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
@@ -905,6 +905,24 @@ &uart5 {
 =09status =3D "okay";
 };
=20
+&ufs_mem_hc {
+=09reset-gpios =3D <&tlmm 167 GPIO_ACTIVE_LOW>;
+
+=09vcc-supply =3D <&vreg_l12b>;
+=09vcc-max-microamp =3D <800000>;
+=09vccq2-supply =3D <&vreg_l4f>;
+=09vccq2-max-microamp =3D <750000>;
+
+=09status =3D "okay";
+};
+
+&ufs_mem_phy {
+=09vdda-phy-supply =3D <&vreg_l2b>;
+=09vdda-pll-supply =3D <&vreg_l4b>;
+
+=09status =3D "okay";
+};
+
 &usb_1 {
 =09/* USB 2.0 only, HW does not support USB 3.x */
 =09qcom,select-utmi-as-pipe-clk;

--=20
2.55.0


