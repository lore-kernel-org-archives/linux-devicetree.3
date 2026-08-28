Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC433B0AD0
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 10:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913878; cv=none; b=OjnLULzd7+XuJlKeDPmNas81+Qt7FWTdRxInfiMVOnFmFiV3yeZ2xifZQlU6vrDdKuKNMFlLOhXDXpimg8kKkVrUbAvEMs8DPvgCnsJuQSzbtk2HlVVoOzry8iKmbyBBGxCZTipoPRKd7xykYy5snYPu2wjQ8rYGrRIMNM2xO38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913878; c=relaxed/simple;
	bh=jqvb6efzVIxhyMNFM6ALflx4Ux3+Kq+gYesK8hycogQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WslKVrrmfcJKQk7lBkm4FR7WD7AoEFZfyixOzhZYawuXCIoTj/sZqzlhmu3AGNLZ/4jqF5L9/Sp79l28sJh8oUl+qm/ICGun6awrbn/QSKjrOEmo367fURvldGJ1wMmEs4/gZyKjcdxoiwpBt81NB+S5Fi1iQk3v5Hx/Q/5P1RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qJjIVK4X; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qJjIVK4X"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BAA1A1A185C;
	Fri, 28 Aug 2026 10:44:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7982C60537;
	Fri, 28 Aug 2026 10:44:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D31B811C7810F;
	Fri, 28 Aug 2026 12:44:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787913867; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UlkoQK9Jj3Zkbr/7ax+qMgzZXpZ194fDPTfYXd3ays0=;
	b=qJjIVK4XQJzgkzfVrXD2wDdcdKmT63+DbuJIfLwMOqzVj+AoQthsKgAkQRQWtW9ccdvmID
	Q/lD7tlchMkbpbGj11vwUPv54JbVzvmBkSbjFLWkKcwuxTdXx6y8Q/nvSlHCvht9bJf1hF
	xIRX21+AOOm33J/oDWEfeJSgbVaMWl/BnCzT5YcxBoSiTrOOxuSHObyDHFNz8kc48c7FSr
	6l8hzlikvW2EChYH9QElgWhbJmRkSPZwtItfPlvLrTa6qMB4JZ2biPdPbMXc/vD6/uUjRN
	NmKQflQueTtTBSstqTW03/XYTmf1NgnBCRoQnY7qoRrcAQEPw5jVYxinmuQNdQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "moderated list:ARM/Marvell Kirkwood and Armada
 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: marvell: add missing SDHCI clock-names
In-Reply-To: <20260823234721.72903-1-rosenp@gmail.com>
References: <20260823234721.72903-1-rosenp@gmail.com>
Date: Fri, 28 Aug 2026 12:44:26 +0200
Message-ID: <87y0dqplrp.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Rosen Penev <rosenp@gmail.com> writes:

> The marvell,armada-380-sdhci binding requires "clock-names", and
> the sdhci-pxav3 driver requests its io clock by name before falling
> back to an unnamed lookup. Both Armada 38x and 39x nodes only carry
> an unnamed clocks reference, so dtbs_check reports "'clock-names'
> is a required property" on every board.
>
> Add clock-names =3D "io" to both nodes. No functional change: the
> driver already obtains the clock through its fallback.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  arch/arm/boot/dts/marvell/armada-38x.dtsi | 1 +
>  arch/arm/boot/dts/marvell/armada-39x.dtsi | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-38x.dtsi b/arch/arm/boot/dt=
s/marvell/armada-38x.dtsi
> index 1155bee20523..598022645dd2 100644
> --- a/arch/arm/boot/dts/marvell/armada-38x.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-38x.dtsi
> @@ -627,6 +627,7 @@ sdhci: mmc@d8000 {
>  					<0x18454 0x4>;
>  				interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&gateclk 17>;
> +				clock-names =3D "io";
>  				mrvl,clk-delay-cycles =3D <0x1F>;
>  				status =3D "disabled";
>  			};
> diff --git a/arch/arm/boot/dts/marvell/armada-39x.dtsi b/arch/arm/boot/dt=
s/marvell/armada-39x.dtsi
> index 218fcf99ae07..81dd4ca5fbc9 100644
> --- a/arch/arm/boot/dts/marvell/armada-39x.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-39x.dtsi
> @@ -381,6 +381,7 @@ mmc@d8000 {
>  					<0x18454 0x4>;
>  				interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&gateclk 17>;
> +				clock-names =3D "io";
>  				mrvl,clk-delay-cycles =3D <0x1F>;
>  				status =3D "disabled";
>  			};
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
