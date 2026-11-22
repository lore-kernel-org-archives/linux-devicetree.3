Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373602;
	b=NlAXhb2XxAyeKDrPeyTNcp233pOUOrCfV2dOckmWogiRv7sAa7jlLMFsRQalHKMWPvzI
	 0sTYJLpRX+DDv3gNDDLfhXyuaunX9Yv2EDeHcfUU3iuCXoVGBR4zWjDOd0yTrFBkMrTJT
	 A9trXdJySou1LP+NWno6sg5kdWU8qJZIDX/LhduAM6ak2P1CMu5HQxNwzfaItuHa8p4OT
	 jdbQrOHhXgDwk2/lFaRTBsKSGBQUMVO8whHKesrNp2RqbBlPT5XbrdtSU3OPDbGjbDCpm
	 gGW37AYK2qrKBORdxz8JiCuSGdUbIcSBwJaG2ZkjQtMcOXijvQnG0/xUCmJBlwLtPpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373602;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TT0T9dKrYRMDydvovQB4ZgNJtF1rM9gQPNiW4SzRh64=;
	b=Zw9uYP/Tw6qStEWVp8SDiRTcPwcg9/YyShCAGssR0lneHvfCe+/4OnYcbtDTizumJglK
	 t1SAkCA1+L4jYkh29Kar3z83B2nSjvM2q/T9NXog4cCjlzPyH7udJJYXevDmg8ws/8S76
	 oGS+/r6EOVBEGAGfjEsS/Wuh/3qETSFx9KkLK4uorzqZtPUTW3MQuBEzuWkX+3xhgoHGX
	 UApAQm1wo2YyVlzqagfsPXyVZM7OD31kU2alUJfarazCwuXBxLtXTyE5H6d4iWk9Of1j0
	 JEYYTPGLajtwP8qZB1c//LPk3hJhHJguU4Xse2OLcPHK/heQPH4zc0Z7aGyCFsLC2fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a9FJT5RS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB22606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a9FJT5RS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B4A1F000C0;
	Sun, 22 Nov 2026 18:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795373601;
	bh=TT0T9dKrYRMDydvovQB4ZgNJtF1rM9gQPNiW4SzRh64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a9FJT5RS+uzk6Spt9xQDPGi28S8Ii4c3fbLHsqK1iXa+7/s/IAgO5PTS6pCWB93HX
	 rZko8KBr5ftlBOLYpgcinrN+WUGcaq4fz/dn73maUhJ6ueTJfOWd73lNu9phO9OWhT
	 H9lMhX/LbAJNYaXmM9txat5si7DSUo9h7HF13P6nCzBsAXEptkiTT6gukt2o36Rydz
	 RgEC8umCorG0kMqzog1KZz0DuvRmHS3ockgyPF9qWd7UTZxbtitMUZIZaPQYyJAzxx
	 nne7Ug9uaX0pcHAe1n+9lSDQZCnaHLWVuowtQDMXgGKbmD8ao4TMbsw/wM80zD+BcS
	 /QA7CkOsjkHhw==
Message-ID: <sashiko-outbox-228202@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: Add ArmSoM Forge1 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122184532.1300004-3-jonas@kwiboo.se>
References: <20261122184532.1300004-1-jonas@kwiboo.se>
 <20261122184532.1300004-3-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 18:53:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ARM: dts: rockchip: unused rtc_int pinctrl node in
  rk3506j-armsom-forge1.dts
--

commit c8399c3a39f722c5341014879ceea3f38f7b0a7e
Author: Jonas Karlman <jonas@kwiboo.se>

ARM: dts: rockchip: Add ArmSoM Forge1 board

This commit adds initial device tree support for the RK3506J-based ArmSoM
Forge1 board.

Link: https://docs.armsom.org/armsom-forge1

> diff --git a/arch/arm/boot/dts/rockchip/rk3506j-armsom-forge1.dts b/arch/=
arm/boot/dts/rockchip/rk3506j-armsom-forge1.dts
> new file mode 100644
> index 0000000000000..6520fa700f647
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rk3506j-armsom-forge1.dts
> @@ -0,0 +1,229 @@

[ ... ]

> +&pinctrl {

[ ... ]

> +	rtc {
> +		rtc_int: rtc-int {
> +			rockchip,pins =3D <0 RK_PB5 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};

[Severity: Low]
Is rtc_int intentionally defined here without an RTC device node
referencing it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122184532.1300=
004-1-jonas@kwiboo.se?part=3D2
