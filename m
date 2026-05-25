Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C1737FF6F
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779712124; cv=none; b=W41YgViksWUDccaE/Dy4F6G8g17X2KYWAdDq6b4yEMctV0w996uv2xBegnjQGYkQw3O5FFkc05gCQfhFBLv3PbH/UruObVppaaVDE9dNm/+0QesbdXSJIG+KhHsW0GknmH5DI5rGe7pTXjZk0oWXULtAVrmQsc36yAmWmJ9ZNO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779712124; c=relaxed/simple;
	bh=hzcTxfJbkhR7g2rrUJ566gI8HKVXMxO7A7dSRQYfBf4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D7eQ8Wz+1D8LUB9+PMMZL5IVve6WzPDBKJVeZCZ/5y66LbliSy4Jz4llIiOcRK0UQ8WcY1QqGX6fjYgy9LPlYSNHEEppbLhF5g+GeEO9M8FmeUBzthdlLhvVrLv4zoGQ5QSGEIkBJIBQVxmTHgKRoyBDQSDIU5bbCWpUodPchuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRqELGxU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRqELGxU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D481F000E9;
	Mon, 25 May 2026 12:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779712123;
	bh=TiEzfv7A8AQisD+gKXvTG5OCnuOoISN38Y2Py47sMAY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XRqELGxUXyBTa0JDjkNm2LOaMIZqF9f16k48Xow5tUhhYig1j9abpw7R+AZBr54tP
	 vE+sw4Pg6GNemXJj9k/KwWUO7z/yZE24GfVvtFN1d9YD+HqHDAwJ5jGB5h4Sy0CGUb
	 q+yfCE0hU93siuvZZHIVzT+r07EK3j3Er8oHeRt5MPq2TPAoOLqzBX6e6r87FXBjyG
	 Vqq3R3qwRaVBm+GuQr2qbHpGkEgIA/NFONB6QBkqC9P4m++3WtI5KTdLvAubVyn6X8
	 dtt/raA98nwLTUVPGSsJdqGvexWZyLjyCz+sShpdKaNQGM9asf3uSsW8siY/pwxirh
	 gbUfm+WRoXCsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/8] arm64: dts: renesas: rzg3e-smarc-som: add audio
 pinmux definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525110603.4018170-8-john.madieu.xa@bp.renesas.com>
References: <20260525110603.4018170-8-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 12:28:42 +0000
Message-Id: <20260525122843.10D481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree node `sound_clk` uses an underscore instead of a hy=
phen, violating naming conventions.
--

commit d0daff3ab55c18eb7640dc053ae11aaa9c14d357
Author: John Madieu <john.madieu.xa@bp.renesas.com>

arm64: dts: renesas: rzg3e-smarc-som: add audio pinmux definitions

This commit adds pinmux definitions for the SSI3 and SSI4 audio interfaces
on the RZ/G3E SMARC SoM. It configures the sound clock pins and the sound
data and control pins.

> diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm6=
4/boot/dts/renesas/rzg3e-smarc-som.dtsi
> index 493f6783d5833..f4532a06cc31d 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
[ ... ]
> @@ -353,6 +353,18 @@ sd2-pwen {
>  		};
>  	};
> =20
> +	sound_clk_pins: sound_clk {

[Severity: Low]
This isn't a bug, but should this node name use a hyphen instead of an
underscore?

According to the Devicetree specification, node names should use hyphens
rather than underscores to separate words. Using an underscore here might
trigger compiler warnings for node_name_chars_strict. Renaming the node to
sound-clk would align with standard DT conventions.

> +		pinmux =3D <RZG3E_PORT_PINMUX(4, 2, 8)>, /* AUDIO_CLKB */
> +			 <RZG3E_PORT_PINMUX(4, 3, 8)>; /* AUDIO_CLKC */
> +	};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525110603.4018=
170-1-john.madieu.xa@bp.renesas.com?part=3D7
