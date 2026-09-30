Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E2A1FBC8E
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 03:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790737236; cv=none; b=E4HBIcyQeiZbWbgB4tbBGg33uwKdx67CPqzHqT1G1fDE9xpsN7jg/2paUx2wZTsViMgx+lmU7EG6NxuFe3X186yM829p0H3gEyFtOFtLzKUzZsnnAokSh+uPiYK2NTeYyL/6pwIHFH7yvQm/LF9GygwsPxyG57ZY8h5Xios3dus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790737236; c=relaxed/simple;
	bh=ZhU89cgJfeKti0V8HFvk60TTY6ATKGU9AQUZPdDMwKk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MHGaMYE2aLamxsPTxmEaGrugv0OdDs/tgumL/lbVH+HLlnDz6/48qBVm9tTEJ6NTPZptcBtqHB7KfvzczpLrX9vj3avj8IDjNnh4fv2dmUv9P4RoO8yRL5UDrmlcn1+OjfP/QjDrH8WOrAx+BqrJZm8iipIloVgNP0DryM9yCRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9nALu+n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9nALu+n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3099C1F000FF;
	Wed, 30 Sep 2026 03:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790737234;
	bh=MXqeJcTsVbr4Hvqqu4O7M7zfU8HhftW9glzsthSLtJ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E9nALu+nYVcoruMP5TOgW0VItDsN6O5VLrJDFxDWywQnlOygone/7jWv1ag6PNs21
	 p+2HCetWYUOqKMe7xZzTOB9gmCMkn0uYpKUs6Zv+PH0nXhG08De5Zmn3VvNLrtSiOQ
	 7q35bRp0nEON5N9GrWkTJZZ/Lly8wCD2/eIbT5/XxCKw5Ga2hPaUItYIb3nLtWdMEG
	 sdS1WXBrn4d5iaItT6ssAd0B2SHlKs3QMSRU8yUJKVz4oPSFjnVq5GKkwcNsQcWkdW
	 u4FFsFKIk+9jUAPUod3eTWJ0L9HN7fEjvvxx+E3Ut2h6EJPyAK+8u3OxW2bCQjME7D
	 42CNP/VZINTKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add buttons to Kobol Helios64
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Velkov" <iav@iav.lv>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260930-helios64-buttons-v1-1-d76249064003@iav.lv>
References: <20260930-helios64-buttons-v1-1-d76249064003@iav.lv>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 03:00:33 +0000
Message-Id: <20260930030034.3099C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: rockchip: floating User1 button causes interrupt storms
--

commit a839eb665d8bc992ebe29b10a50a8b7e57d5f4f5
Author: Igor Velkov <iav@iav.lv>

arm64: dts: rockchip: Add buttons to Kobol Helios64

The commit adds gpio-keys and adc-keys for the Power, User1, and Recovery
buttons on the Kobol Helios64 board. It also adds the vcc1v8_s3 regulator
reference for the SARADC.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arc=
h/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> index b2de018a7d363..d146e5075b4f8 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
[ ... ]
> @@ -68,6 +83,27 @@ fan2 {
>  		cooling-levels =3D <0 80 170 255>;
>  	};
> =20
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pwr_btn &user1_btn>;
> +
> +		button-power {
> +			debounce-interval =3D <100>;
> +			gpios =3D <&gpio0 RK_PA5 GPIO_ACTIVE_LOW>;
> +			label =3D "Power";
> +			linux,code =3D <KEY_POWER>;
> +			wakeup-source;
> +		};
> +
> +		button-user1 {
> +			debounce-interval =3D <100>;
> +			gpios =3D <&gpio0 RK_PA3 GPIO_ACTIVE_LOW>;
> +			label =3D "User Button 1";
> +			linux,code =3D <BTN_0>;
> +		};
> +	};
[ ... ]
> @@ -434,6 +483,16 @@ &pcie0 {
>  };
> =20
>  &pinctrl {
> +	buttons {
> +		pwr_btn: pwr-btn {
> +			rockchip,pins =3D <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +
> +		user1_btn: user1-btn {
> +			rockchip,pins =3D <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};

[Severity: High]
Since the user1 button GPIO (RK_PA3) is registered in gpio-keys as
GPIO_ACTIVE_LOW to generate edge interrupts, does disabling the internal pu=
ll-up
with &pcfg_pull_none leave the pin floating?

The commit message notes "User1 has no button on the enclosure and is
untested", meaning the pin is unconnected. Without an internal or external
pull-up, a floating pin will pick up ambient electromagnetic noise and cros=
s the
logic threshold randomly, continuously generating spurious BTN_0 events.

Can this cause interrupt storms that degrade system performance or lead to
unresponsiveness?

Should the pinctrl configuration use &pcfg_pull_up here to prevent the pin =
from
floating, or should the node remain disabled by default?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-helios64-b=
uttons-v1-1-d76249064003@iav.lv?part=3D1
