Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197641;
	b=eWC7sl0kUpGlfKPeFcAmIYQqpFBj55WfC3/rFdLavd0KZKNRwLRekPdXtiY1FyhhEsxQ
	 d6ciE8qYR9AxbbibLMCMkO3XB+si+21mWGFLO7CQKV2EVTySuD6ggDy/dJRGyOy+pnynF
	 Tsojm47TvL4WAxV5QACpR5CfpKBzWiE9lDgeYAJt4VzMEoYMmKkrAe3uQKmKJzG0ZvpI+
	 Za3EDXRGttVBfnWf52OGhjlGfb3P+0oUJT61f4SEy8OkeNn596JLf4Z5G6KStUu85VzY7
	 xlizH/X1ncELmvuQKSy/g+Bf73sNgy/nB4GNT3YCd/i9PrBX36iUADi9m3vZqML57VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197641;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aWDQDm7LuQie9jvzV6uB014UdAyJXJaIz6fRdlyOS1c=;
	b=u+4Qpg7TftWSo7ZTqPoN3+ZlEG64xAottx6OV18vl8WlERZMHNbdC3rvXCidvtuVWNxy
	 vsbdJw8XAlLrcYUxrRVLENcXsvojw4xYatSJCqMAKoTQM1UEJi6xZKNGd4JUn2jjqm/L7
	 v/symcnDwnzBIBwcE69HEgl/QZcbSU8HCJIieaOWAbGFSlWyXhXRjSHgzwLsID9Pok8yo
	 afBgJqLSt/6CTOq3hkfaaWozV1VCTNjjKrIGqyqe4nVll4lXzjAGbU2tztbPzEEq4xJjg
	 hMAp2oQ4B+AYo2iysR+5LllkXXwMxN56EFeWk2r/3gE9SbJq2vjyMmY7vr0ZbOz6ILQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P5mkqwGq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5FB60A2600;
	Fri, 20 Nov 2026 18:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P5mkqwGq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2F61F000E6;
	Fri, 20 Nov 2026 18:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795197640;
	bh=aWDQDm7LuQie9jvzV6uB014UdAyJXJaIz6fRdlyOS1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P5mkqwGqab+KQfWEfEH4mmcGEw6tOW3qm6uvmVNmNnR+GzzxXVkIdUySNuc32vLc0
	 q31FmpssPWpu0Q0701/2KM+kgiJvkQeROnbFBI/6oZ0XIWMdH/TRqoJRA56olYaWYW
	 6sckacjB2oiIkTR6cFalvpY3OG8+9vBEABBa8mPfnBQDyQFQb9GpyeuXO6/H4Hsxc7
	 r057Siz8DIpUlqoO1uqHmWLR0dPkKtgaXHxx+DiDE/T/jrcn+qbpB4oejbh4rAIM+X
	 nfVNM38HAe0awFXGnv2Hk87AJ60ZrMYfMBsoNpwPtGgOEBEkecr7rs5EqAM+rI876q
	 Z24xn6pr9lUSQ==
Date: Fri, 20 Nov 2026 18:00:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Dominique Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Yakir Yang <kuankuan.y@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	William Qiu <william.qiu@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Maud Spierings <maud_spierings@murena.io>,
	Graham Markall <hello@big-grey.co.uk>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Byron Stanoszek <gandalf@winds.org>, OOHehir <oo.hehir@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 00/19] drm: starfive: jh7110: Enable display subsystem
Message-ID: <20261120-lagged-aorta-a5799cab633a@spud>
References: <CGME20261106135849eucas1p242718d72fa1f38e31477210fd9ee30bc@eucas1p2.samsung.com>
 <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
 <d21992c9-9e60-4613-b7cd-8e324d214a48@samsung.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9Y3BF9tXWb3jCBuR"
Content-Disposition: inline
In-Reply-To: <d21992c9-9e60-4613-b7cd-8e324d214a48@samsung.com>

--9Y3BF9tXWb3jCBuR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 03:02:35PM +0100, Michal Wilczynski wrote:
> On 11/6/26 14:58, Michal Wilczynski wrote:
> > This series enables the display subsystem on the StarFive JH7110.
> >=20
> > Merging: the series splits by subsystem, there is no build dependency
> > between the blocks, and each block lands in the tree that already owns
> > those files:
> >=20
> >   drm-misc                     1-3, 6, 8-14, 17
> >     drivers/gpu/drm/bridge/, include/drm/bridge/ and the display
> >     bindings. Patches 1 and 2 are inno-hdmi fixes with Fixes: tags;
> >     they apply to Rockchip as much as to StarFive and are independent
> >     of the rest, so they can go on their own.
> >=20

> >   Conor's tree                 4, 5, 7, 15-16, 18
> >     drivers/soc/starfive/, together with
> >     the bindings for its two drivers (patches 4 and 7, under
> >     bindings/display/starfive/) and the vout-syscon compatible in
> >     bindings/soc/starfive/ (STARFIVE SOC DRIVERS), and
> >     arch/riscv/boot/dts/starfive/ (STARFIVE DEVICETREES).

Other than for the dts patch,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

I don't want to take the display binding because I won't have the child
nodes, and I won't take the driver without the binding for it. At then
at that point, the remaining trivial binding and driver may as well go
with the rest of the code.

Please resubmit the dts patch to me individually when the rest of this
has been applied.

>=20
> Gentle ping on this series. It depends on the Innosilicon HDMI PHY
> series [1], but only for dt_binding_check/dtbs_check (the PHY binding
> is referenced from the jh7110-hdmi-subsystem binding) and at runtime.
> Everything else builds and can be reviewed independently.
>=20
> Any comments on the DRM bridge / inno-hdmi parts would be much
> appreciated.

--9Y3BF9tXWb3jCBuR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCawCKvQAKCRB4tDGHoIJi
0qj8AP0ZaeGM0TZcGSFuopE9ZeecanF/1QUS00H2PGlontmwXQEA3BQeYKyiBSs4
lx/sKFxuXkEXlgn/ah1AzWlf0uWxDQg=
=XGjQ
-----END PGP SIGNATURE-----

--9Y3BF9tXWb3jCBuR--
