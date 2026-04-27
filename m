Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6552C11E7;
	Mon, 27 Apr 2026 11:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290096; cv=none; b=WbwtWnhaWoHNhbZlRxdxDVRBIye3WzuDztJ9jx5NC8j2Z7eiqbCmmIr7qQ6Nbno4LxqxqOaIWeBUHtwrYTb5hO4M3gSNLSDB3cG9TCTk0VNYNrL6Q4nhE9jwaBEdIYRAZdafyAUYeQzqflQ+zyd/fiTpAL6m1k+OEAusyHfL2OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290096; c=relaxed/simple;
	bh=KMB876ik0w6xgl7pJ5idP+hGjhYfwwCmNCvxpvKgAh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pm9lyNJOO0fj7Ackrv7YKpB+81Mzq4dGVgfv83b/tXqNPXYC76OibR/PiEA4ST2sJ+oYIM6y6om4bbjYEJykgf3Kait1bqn2GwGi8XhwBH0aqfQTSUqQd4ITcZuGYiLhwtwVLLV5uHbJ7sHkEpd8+Cbk74yop63XzleiCkNnhBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=DG3hGznG; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="DG3hGznG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=eeePnVv+YslUA1tdZWBh3CRQb3jVb+oSpxOE0TqYCFo=; b=DG3hGznGy33YluhslljvE9HRgx
	6LCBBDX1MCOA+cThYGvqf7VHFGm24WvhEBb0GIEauW74rHzWqbgQa0KyfrY3GIHcfB/jdZQfuASkY
	9noS6ydajlQOjwuOpewAm+GYATxNCl2vw8DHUDyaOOWWkCQ1swnKdlxmEbozDVA4n+dJjvY+KRWC5
	XfVDimk6F4g3U9KNCo5yJUL2kHovw7mrIejEGgCD4FkMwC9r4EjOnL61p/eN2JAR0rXEuBTQfMfXW
	7iSAszUY55zOofrwoyhCYbLaC6ywLRT2bd8VQR2k6NyKualnHTkXYouQjqQLpFQKDabRrvG4W6Rhc
	W0CqMA7Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: guoweix <2298701336@qq.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 f.kardame@manjaro.org, pgwipeout@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, guoweix <2298701336@qq.com>
Subject:
 Re: [PATCH] arm64: dts: rockchip: fix rk809 interrupt pin on rk3566-roc-pc
Date: Mon, 27 Apr 2026 13:41:24 +0200
Message-ID: <26138973.6Emhk5qWAg@phil>
In-Reply-To: <tencent_CF3170E7191769F8FB22C55A0F952E82E105@qq.com>
References: <tencent_CF3170E7191769F8FB22C55A0F952E82E105@qq.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Mittwoch, 8. April 2026, 17:09:44 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb guoweix:
> The RK809 PMIC interrupt pin on the Firefly ROC-RK3566-PC (Station M2)
> is physically connected to GPIO0_A3 (RK_PA3) according to the board's
> schematic.
>=20
> Currently, the PMIC node incorrectly specifies RK_PA7 for the interrupt,
> which prevents the PMIC from correctly signaling interrupts. (Note that
> the pinctrl node 'pmic_int' correctly configures RK_PA3).
>=20
> Fix this by updating the interrupts property to use RK_PA3.
>=20
> Fixes: 30ac9b4e25d8 ("arm64: dts: rockchip: add dts for Firefly Station M=
2 rk3566")
>=20
> Signed-off-by: guoweix <2298701336@qq.com>

Could you use the more standard naming of "given name + surname" please?
=46or example with:
	git commit --amend --author=3D"givenname surname <2298701336@qq.com>"

Or setting user.name in your .gitconfig.

Patch otherwise looks good.


Thanks a lot
Heiko


> ---
>  arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts b/arch/arm64/=
boot/dts/rockchip/rk3566-roc-pc.dts
> index 7e499064e035..985770e3a5e2 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts
> @@ -245,7 +245,7 @@ rk809: pmic@20 {
>  		compatible =3D "rockchip,rk809";
>  		reg =3D <0x20>;
>  		interrupt-parent =3D <&gpio0>;
> -		interrupts =3D <RK_PA7 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts =3D <RK_PA3 IRQ_TYPE_LEVEL_LOW>;
>  		clock-output-names =3D "rk808-clkout1", "rk808-clkout2";
>  		assigned-clocks =3D <&cru I2S1_MCLKOUT_TX>;
>  		assigned-clock-parents =3D <&cru CLK_I2S1_8CH_TX>;
>=20




