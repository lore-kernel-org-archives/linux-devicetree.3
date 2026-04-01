Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D52A156CA
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 02:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775010315; cv=none; b=kCxRuSbp6i0uDRj5K16HXWMPhF65l2ueuMw55hzeQvp3UUmxxZrqfrc2vfY9TwgZR9jyTBMENaZNzy9rM2GNJ/XZcBZci6n+pK5SsdIGKgH49I9e5bkLbFN8YF/iqKtURSicIgdGkI/3eYyUaB1YxaOucb9yDt74+cZ8yPC2cLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775010315; c=relaxed/simple;
	bh=QcCoHBoFogDWn2MHlJF90XrSQzMBlvKZWbZtWZwgvWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nQXWILBlx5jQAOiQZVGnnP1tRD/c+rR6bCGjNUk486YF/stmuuI/F3PFQ/1OE/rUK7QrDXeJg2vLpPZhvXmiYROistSIJ/KBkGwo/aAAiLiwzsGGIk2XbWlu9fZhioQX6f0WEVUWJN0UilBw51/Ew7gIKdGqOe92qjAM4iTtJow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=IFgVqcbb; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="IFgVqcbb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775010312; x=1775269512;
	bh=QcCoHBoFogDWn2MHlJF90XrSQzMBlvKZWbZtWZwgvWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IFgVqcbbQbj8e+tUtaaf5vST1BYRE+LjVOkoN1q8t9BFM/OtVz2TtHAUaRbLDxRaA
	 3ZvoyZCz5fV4KjNNBlN5BuD7ctgRy65DsbL2z2G4eYbUZSwNrXuMr3NgN4G0qYAfdT
	 TCd/jEWG+7AebxRbudOS7VheOx/Gu5JhaCyIkK3BUq1BldoxH9H07FdonHcsDy9rD1
	 6rPKNSQRqx/+oNj/OVXRycWN/IEhkiN/SijKqSDj9GxWp0NwsZVoiF8Tts0DVRHUGo
	 HmgBTHcU3y4PMa6WUBG/+Wm9KsgXY5CjsdX7NxdgN9aUGq2Bbw+MQVQHC/yji/vFDF
	 kl2ksU/QX+5tg==
Date: Wed, 01 Apr 2026 02:25:07 +0000
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 2/2] arm64: dts: qcom: milos: Add qfprom efuse node
Message-ID: <20260331-milos-qfprom-v1-2-36017cc642db@pm.me>
In-Reply-To: <20260331-milos-qfprom-v1-0-36017cc642db@pm.me>
References: <20260331-milos-qfprom-v1-0-36017cc642db@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 460e4765e1f48540bce99727d0ec027a1dc063c1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add the qfprom efuse node and describe where the GPU speedbin fuse is
located on Milos.

Note that for SM7635-AB at least, the value is "221", the max frequency
for this is 1050MHz. There's another speedbin out there for 1150MHz but
we do not know the value for it so just document in this commit.

Once the value is discovered we should add the speedbins to the A810
Adreno entry and update devicetree.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom=
/milos.dtsi
index e1a51d43943f..d1d23dfe7806 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1168,6 +1168,18 @@ tcsr: clock-controller@1fc0000 {
 =09=09=09#reset-cells =3D <1>;
 =09=09};
=20
+=09=09qfprom: efuse@221c8000 {
+=09=09=09compatible =3D "qcom,milos-qfprom", "qcom,qfprom";
+=09=09=09reg =3D <0x0 0x221c8000 0x0 0x1000>;
+=09=09=09#address-cells =3D <1>;
+=09=09=09#size-cells =3D <1>;
+
+=09=09=09gpu_speed_bin: gpu-speed-bin@138 {
+=09=09=09=09reg =3D <0x138 0x2>;
+=09=09=09=09bits =3D <0 9>;
+=09=09=09};
+=09=09};
+
 =09=09remoteproc_adsp: remoteproc@3000000 {
 =09=09=09compatible =3D "qcom,milos-adsp-pas";
 =09=09=09reg =3D <0x0 0x03000000 0x0 0x10000>;

--=20
2.53.0


