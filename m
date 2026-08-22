Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A562DCF4C
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 19:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787428096; cv=none; b=JUaVD876ZL+Ypa53iGO1F95xyJPRUG8EmO+u3nx1XN7VnWyGp/IytIugeTNCLkyI5BOpSLZ3vNibe//MSV/zE0JeFibPLk/8dlYh6hsD27Zgs6X78o0cpLyT7lv3/yAXCu9VGjzl+wyyxjyPMZKTtRaF8DTDYawRWz/8Mgd+tqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787428096; c=relaxed/simple;
	bh=ovOcgKcQpBu8LbKZdZ9w/hhD9cVKqOHmROrt0618EWc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KMhTJOZZvovkCAOOsVbUqBjEMljEYyijSfDRu6Khl9YFFQHsHBF7COgJodAWT8/ABV1oE8u5nflHsrEgA7z6BXnl31OY46/MWSyywY/sI7HTyRzMQeeNqShmASYbEY/4KIb0QEQAgFiSy87UeNdXCEXtitI6cFyqGqkJuZlfsNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=AuUjeS4Q; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="AuUjeS4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1787428084; x=1787687284;
	bh=+UOlbWmhlZGcXSZas1atuG02Rkmo7MvD1GEC9/IVszM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=AuUjeS4Qg8skiBG8zgzWsFH8mgr62jLVrdjl+P4UNmaN8E0hnsOICdXWz6yUA5QM8
	 1kjPq9/ydCZct3aqkuT5/ixqPZoHXQv+jeqbpKNBax16FGVHMf/5QIbW6swx56vj6Y
	 6FZi16MBpqBZ9TNGIXJwV+TIpG/9oPTLfUjGLEBXBIYqVUlzJwz/CnlKsxf8ynLxUr
	 FIcBy4NGKFFzXr6u4hobl8AgP90u3ACKn7l74ofcxNR4Nr4Huy+KhZenHgLAGor6rV
	 VFYOXNsDJSuqxc32zyKthfYrR0pzKNOobFLiR5GJnGlbJLWBKwkpRZ7phE4ijOmTdK
	 oAhyq4E5Tdc2A==
Date: Sat, 22 Aug 2026 19:47:58 +0000
To: Heiko Stuebner <heiko@sntech.de>
From: Richard DeFrese <richard.defrese@proton.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Richard DeFrese <richard.defrese@proton.me>
Subject: [PATCH] arm64: dts: rockchip: route ES8388 MCLK to the IO pin on Orange Pi 5/5B
Message-ID: <20260822194730.526392-1-richard.defrese@proton.me>
Feedback-ID: 216883557:user:proton
X-Pm-Message-ID: c644c4c6ff2315eb917bb9194d3fe04645365cd6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The on-board ES8388 codec on the Orange Pi 5 and 5B has no analog output:
the codec's master clock (MCLK) never reaches its pin.

RK3588 gates the I2S MCLK-to-IO routing in SYS_GRF SOC_CON6 (bit 1 for
I2S1), exposed as I2S1_8CH_MCLKOUT_TO_IO. The codec references the internal
mux (I2S1_8CH_MCLKOUT) instead, so nothing enables the IO gate: the
12.288 MHz MCLK is generated inside the SoC but never driven out to the
codec. With the ES8388 as I2S bit/frame master, the SoC I2S controller then
never receives a valid clock and aborts:

  rockchip-i2s-tdm fe480000.i2s: clear failed, reset txrx

Point the codec's "clocks" at I2S1_8CH_MCLKOUT_TO_IO so the ES8388 driver
enables the gate in clk_prepare_enable() at probe; "assigned-clocks" stays
on I2S1_8CH_MCLKOUT to keep the 12.288 MHz rate.

Signed-off-by: Richard DeFrese <richard.defrese@proton.me>
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi b/arch=
/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
index 6e081bc06..5ac3e0d9d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
@@ -87,7 +87,7 @@ &i2c6 {
 =09es8388: audio-codec@10 {
 =09=09compatible =3D "everest,es8388", "everest,es8328";
 =09=09reg =3D <0x10>;
-=09=09clocks =3D <&cru I2S1_8CH_MCLKOUT>;
+=09=09clocks =3D <&cru I2S1_8CH_MCLKOUT_TO_IO>;
 =09=09AVDD-supply =3D <&vcca_3v3_s0>;
 =09=09DVDD-supply =3D <&vcca_1v8_s0>;
 =09=09HPVDD-supply =3D <&vcca_3v3_s0>;
--=20
2.53.0


