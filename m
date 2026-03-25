Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E2534A77A;
	Wed, 25 Mar 2026 23:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774482117; cv=none; b=t+yesqncTGkqeeDnASZZRFRBrmTYTW+hdsW9etzhR5vLaxhQIlJSqfryh/nkAL0np88DQi6VpKIpK1u0o1Hh4R8KT13hFjJcnukbfnkzzvkeQwk5Q+wJ6bazIVPjlrdDIezWujhhd6iB+Fqn1RKiUw8QkJ0UK5zIcCgtxdvrn8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774482117; c=relaxed/simple;
	bh=iElE4ejjUYaT352NBfHfX6XrchcDNcC85+ONG3JrBm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QztlE+v3hYpiBukcUityKEVW62SXARA1IqHTko4v9DAJ+IKqvbY7cGEyGOoEahxNMaAjkXz8eYtCiQ9CiTbQ7xMBIZHzw6OdJwqVypuO7fB5zyJw7ISm2pBnE4vrjpFZb6Zo4PrV+YqXH0yMHN862V9XmIY5vMzERjLT3hv5kzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=M5lZcw4f; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="M5lZcw4f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=b6yzGlttx+NXjSJf4aCL4qCZ2swewO2eS0YxkN2Iuaw=; b=M5lZcw4fBkUFqRe1eIpe6LvRwA
	2ouXek52MBk/ibhN25yL4S394q/dCCjdw5Hs0EC13tfh7Irkc3ywd9nE4TCjFB9MYCYcEeOSDZ+qa
	5eGiZ0Z+J3a3PSFRg24Tt98Nq7rpBx77Nu9SstJPtbAs+RDp4rsQ+Yl8qffT1Y7+CBZ9mCK0o21MR
	4a8867X60jSEyOU5VUrxccGzTkxTQHi3StFomFYvQOVocQePOqtsCF60R2ZULlGPJSbJpkeO/6mMr
	/5YQ4+LSO8TGOWyV+EMc9IqN2rFfN9vEbxSprZjKqyyfdeWSQlHW8O7hAyTkpbyfL1jJXrfAOMiee
	qJVZgqlQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Pedro Alves <pta2002@pta2002.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH RESEND v2] arm64: dts: rockchip: configure hdmirx in Rock 5 ITX
Date: Thu, 26 Mar 2026 00:41:49 +0100
Message-ID: <23047464.EfDdHjke4D@phil>
In-Reply-To: <1331010f-1446-4892-9d81-2f18b60f6977@pta2002.com>
References:
 <20260323-radxa-r5-itx-hdmirx-v2-1-c52501909577@pta2002.com>
 <3407927.44csPzL39Z@phil> <1331010f-1446-4892-9d81-2f18b60f6977@pta2002.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Pedro,

Am Mittwoch, 25. M=C3=A4rz 2026, 15:24:45 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Pedro Alves:
> Hi,
>=20
> On 24/03/2026 14:18, Heiko Stuebner wrote:
> > Am Montag, 23. M=C3=A4rz 2026, 10:25:33 Mitteleurop=C3=A4ische Normalze=
it schrieb Pedro Alves:
> >> +&hdmi_receiver {
> >> +	pinctrl-0 =3D <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim=
1_rx_sda &hdmirx_det>;
> >> +	pinctrl-names =3D "default";
> >> +	hpd-gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
> >=20
> > as said before, please also add a pinctrl setting for this pin.
> >=20
> > gpio1_c6 is not part of the main hdmirx set of pins, hence needs an
> > additional pinctrl entry to configure it as gpio and possibly set any
> > additional pull settings.
> >=20
> > And yes the pinctrl-driver does "implcitly" set the gpio-mode when
> > a gpio is requested, but our more modern approach is to always have
> > a real pinctrl entry even for gpios.
>=20
> I am probably getting confused by what you are asking here, but I don't
> understand what exactly I should add. There was already a pinctrl for
> hdmirx_det (which is what the gpio1_c6 pin is) present in the file,
> hence why I did not add it in this patch:
>=20
> &pinctrl {
> 	/* ... */
> 	hdmirx {
> 		hdmirx_det: hdmirx-det {
> 			rockchip,pins =3D <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
> 		};
> 	};
> 	/* ... */
> };
>=20
> Looking at the other boards, they do the same thing, but they call it
> hdmirx-5v-detection instead, but as discussed in v1 of this patch I
> ended up keeping the det naming to match the schematics.
>=20
> Sorry if I am missing something, I don't have much experience with this,
> so I would really appreciate some extra information.

You didn't miss anything - I did :-) .

Not finding an addition to the pinctrl definitions in the patch
I misread the &hdmirx-det reference as the one defined in the core
rk3588-base-pinctrl, not realizing that the rock5-itx one was
already existing in the rock5-itx dts already.


Sorry about confusing you
Heiko


