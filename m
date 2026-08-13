Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4227F42FCBA;
	Thu, 13 Aug 2026 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786607982; cv=none; b=iCvDwWD8xxOBwc2KDer135XK3TihruAs3thI8JvNTgqdgg9BcZVA0wWeKCfV2DHQygnRdJSu3PCTivkJsi5Z51ksrEVHR5Zh+3AdGm6lCcaoLHXlUB/d7nENEaxEeHP1cASzarJgqFQ9TBnYJO7RC0zIhjQMsty0QTg2cl4/MIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786607982; c=relaxed/simple;
	bh=7npjrDYLepf+Rrpr2JacPvCr1RH+GeAYuRtrST2+lio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h27kGGbolSGdUp0qciIMp5nYCemSVLRfKkL1RsF3nqAGBg+gZkKgxcsWFFGDl4t/dTbIg27xn3Mc/OldO8Be1h4sHrERlfltHd+hYLpp1C4Ln32kJLSPyQlsI6zxtS4VBckycw8fZu2Z/Ctom3HI2M8LkQqo3Yb7yqrGWKT5RtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsszs2c6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsszs2c6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5DBA1F000E9;
	Thu, 13 Aug 2026 07:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786607980;
	bh=7npjrDYLepf+Rrpr2JacPvCr1RH+GeAYuRtrST2+lio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dsszs2c6XN078uEjKUitatG95g2TWyQRaTHkmSiaXjfhMjzOG3yz/6DtQr/Gf+vIA
	 Zh6RjruRs3vkuz501yMfDZANBnQzRDXH/MKrgrEw/b2xJs3HrwMppmvkiBHhEaU3n6
	 PhrxN8jKfPj4w6oHmAKJQy9Zs+mV2eK/WCYqV5NiceYxbj7xfx8vQHAD8NGuoa317e
	 kFv3cF2sAo5pdgjE1DqQYcsOsFtLY3Pjx+1NRbNm6p5URx+2dWfQljjbemaRyuFCDX
	 ruJ0IwDZn2t5vPxLRizDNzGtHLNXX7hDP3iyZLj6fyYD/GBRowi1nNKUeDnjV5bdZi
	 /ndzfs8/CouDw==
Date: Thu, 13 Aug 2026 09:59:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Guochun Huang <hero.huang@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Riesch <michael.riesch@collabora.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
Message-ID: <20260813-imposing-cunning-raven-fcad40@quoll>
References: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
 <20260810-dcphy-rx-v1-v3-1-a2d25c29adfc@gmail.com>
 <20260812-refreshing-rampant-gecko-b38ef9@quoll>
 <CAPwA33KM-sWkPVrP1h+swLinvrCZHzxPeS7h25KEO87Q_6WZuA@mail.gmail.com>
 <an0FMnDSWbud8hPc@venus>
 <CAPwA33+7k7HMC7ezwH+MGn64iRHT6tVNK55t6gaC0nkkqWoE4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPwA33+7k7HMC7ezwH+MGn64iRHT6tVNK55t6gaC0nkkqWoE4w@mail.gmail.com>

On Thu, Aug 13, 2026 at 12:33:52PM +0800, =E6=A5=8A=E6=99=BA=E6=88=90 wrote:
> Hi Sebastian,
>=20
> Thanks for the review.
>=20
> > Your new binding is lacking too. If you select <&mipidcphy0 PHY_TYPE_CS=
I>
> > you defined the direction of the PHY, but will it operate in C-PHY or in
> > D-PHY mode?
>=20
> You are right, and I am sorry - this is a regression I introduced in v3.
>=20
> v2 already described these as two separate cells: the first selected the
> electrical layer, and the second selected the direction. Michael Riesch
> suggested using the generic PHY_TYPE_DSI/PHY_TYPE_CSI constants for the
> second cell instead of the Rockchip-private RK_DCPHY_DIR_* constants [1],
> and Vinod Koul agreed [2].
>=20
> In v3, while making that change, I also mistakenly collapsed the two cells
> into one. That is what lost the electrical-layer information you pointed
> out.
>=20
> For v4, I will go back to the v2 layout and only rename the second cell.
> This keeps the two dimensions separate, with each cell describing one
> thing:
>=20
> /* MIPI DSI host - the transmitter */
> phys =3D <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_DSI>;
>=20
> /* MIPI CSI-2 host - the receiver */
> phys =3D <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_CSI>;
>=20
> The same applies to C-PHY, so the binding can express all four combinatio=
ns
> without any further changes:
>=20
> phys =3D <&mipidcphy0 PHY_TYPE_CPHY PHY_TYPE_DSI>;
> phys =3D <&mipidcphy0 PHY_TYPE_CPHY PHY_TYPE_CSI>;
>=20
> The driver accepts all four combinations at phy_get() time and returns
> -EOPNOTSUPP from power_on() for the C-PHY combinations, as it did before
> this series. Boards that only wire up the transmitter keep
> '#phy-cells =3D <1>', so the existing in-tree device trees remain unaffec=
ted.
>=20
> Before sending v4, I will go through the code and commit messages again,
> so that the reasoning above is captured in the commits themselves rather
> than only in this thread. I will also re-test the series on the board.

What is with this practice (third posting I see this week) of pasting
as reply prompts/tasks for AI?

All this is just wrong approach and your patches will be ignored if you
act as a proxy and keep playing with us that way.

Best regards,
Krzysztof

