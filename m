Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665412;
	b=sfcLDIwIpt82MOSly/QqQQsfITyAWNSW/6ZpBpQzE3Gioa1dNd6P5BkzBTEWPra2o7ak
	 JTSZKZveMNPbcxLtqbCoUX0m8FGrs2cKhfionbhwdJDyuEBXcuhW9a+JwzUPC0uYN3eY+
	 B5ZKHypuXGPYkMliyi23NAU78/2/S+4L3iJoXfoGs/5rqQtrBaLkEgneP6l3JHxMfiFBG
	 k4jsTamuHKhZGx5Iw0UkItJvDHmgYrcKwayqPRmEMbvg2k9SOZq0V+n5xFO5wlHihDQrJ
	 vwU/z7dNRqYPJ/lMZ8TtMFVebu42ClIWKP0Qz1m2TNuAcI4/ND24ubdPmIIWYF7xShA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665412;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pnrWDLI+bbkoF+uspFaAef/gof/CKGiguNODNOS4GpA=;
	b=VJzEELwlik32Z+2bfnofWbAT0K7NFqBODJASbGjJkPS+dolgMppO0q0AKYiP0dPkI6Ek
	 42lmLoaauMBzoYZSg9drrIKiOJhLvUbjioCWgIZNFk4dMTW3j6UbFkD59MPrlJrstsPoj
	 gtzzTy5+a/sh5k804kd5uQ497DS2V6YX4REgKADjquJ+NRg3diSr+2wfXojhfTzpEywye
	 8pG1+W3UXmO697M/mPEuiC/adt9Bkdm3znxRsPa+66xkK4Av08uTv88sMuc6JDwLCe91w
	 9sBFs+nP9W+AybkqLiI3dFeqSdlThkTThQys39tD6hbatvOsfIj9vy/FiABc0w0p2Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EnFf2oIl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3BC606A32A
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EnFf2oIl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE3701F000EB
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795665411;
	bh=pnrWDLI+bbkoF+uspFaAef/gof/CKGiguNODNOS4GpA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=EnFf2oIl25F5fuGyrN92NOgPL6kqIB+PTByRBEV3aAZf8ZfJ957KgMf5KK6PsD4Cw
	 zflo82yjh57GWQAKBN0zQJ3ijLHDRdSpLs34Ypubezx1+kdfXAnPIjT0MRca7B7nRb
	 +rO8mpQb/bCxW8CFA+2Lx5rEVRmyJz4YfrOrnc0k250Cwzd7xVTkbCMd+ipqAGmsNt
	 HlHRpxSdtd7AvpLEw2SfBrHhhWw9nPCLZOm8brr6044aErj4rTR4DdBOsdGnfIIcmV
	 dO3wocrkyfGT62CpwOxOuAHNl9X/82Ppq3JVVcDI5bXUE7TCNERLHEGOfW+aVa5yvh
	 KoGaWgq/V1/8w==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3adfcafaabbso59980601fa.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:56:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF5N0adY90n5QgBLK8f3FCLZbvVVW4BjBw734URD/MYFTJ9lRsbQHO0XF9QCNmF5bdebBNLqjRUfCmU@vger.kernel.org
X-Gm-Message-State: APuU4Z+rPIl5XcSCMOFbgXdrPJnimqYSsqfNc7e/1Uay570okbSpzq2X
	fqC3OgNFxMDjD5uMDDi9/xG1d9egs8Dsi+IUy8z87BmZe5Up3NLBrIaH5M3I9pDgVk1ykeG9gkS
	wvfWOtkzV4E/5GOBU/Tv4QU0XTpWVcDE=
X-Received: by 2002:a05:651c:a1aa:b0:3ab:3af4:c2d8 with SMTP id
 38308e7fff4ca-3ae7fa71a15mr56174711fa.28.1795665409967; Wed, 25 Nov 2026
 19:56:49 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-a733-clk-v7-7-db7c5451ffa2@pigmoral.tech> <20261125115320.3692954-1-alastair@d-silva.org>
In-Reply-To: <20261125115320.3692954-1-alastair@d-silva.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 26 Nov 2026 12:56:37 +0900
X-Gmail-Original-Message-ID: <CAGb2v644kMOCbLGVNB0HRFmoaQcD3qbhKY9G5FVE46O=2td12g@mail.gmail.com>
X-Gm-Features: Aa3M54rpP-Zn9FFry4pu5XjBTgRTyOiIwDPt_8N8tX1t-bsfN3kUc7IF24g0SfQ
Message-ID: <CAGb2v644kMOCbLGVNB0HRFmoaQcD3qbhKY9G5FVE46O=2td12g@mail.gmail.com>
Subject: Re: [PATCH v7 7/8] clk: sunxi-ng: a733: Add bus clock gates
To: "Alastair D'Silva" <alastair@d-silva.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, Norman Herms <dockseed@proton.me>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 9:02=E2=80=AFPM Alastair D'Silva <alastair@d-silva.=
org> wrote:
>
> Hi Junhui,
>
> On Thu, 12 Nov 2026, Junhui Liu wrote:
> > static SUNXI_CCU_GATE_HWS(ahb_msi_lite0_clk, "ahb-msi-lite0", ahb_hws,
> >                         0x5c0, BIT(16), 0);
> > ...
> > static SUNXI_CCU_GATE_HWS(mbus_msi_lite0_clk, "mbus-msi-lite0", mbus_hw=
s,
> >                         0x5e0, BIT(29), 0);
>
> While bringing up GMAC0 on the OrangePi 4 Pro with this v7 CCU series,
> link-up and DMA broke as soon as clk_disable_unused() ran.
>
> ahb-msi-lite0 (0x5c0, BIT(16)) and mbus-msi-lite0 (0x5e0, BIT(29)) gate
> the shared MSI-Lite0 bus fabric used by GMAC0 and other masters, whereas
> bus-msi-lite0 is only its register configuration clock. Referencing
> ahb-msi-lite0 and mbus-msi-lite0 only in gmac0 does not model the
> shared fabric, and gating them off breaks GMAC0 DMA.
>
> Could you please mark ahb_msi_lite0_clk and mbus_msi_lite0_clk with
> CLK_IS_CRITICAL, matching ahb_store_clk and mbus_store_clk in this
> driver?

The patches have been merged. Please send a fix on top.

If in doubt, you can always check linux-next for patches you are tracking.

> Tested on OrangePi 4 Pro (Allwinner A733).
>
> Thanks,
> Alastair
>
