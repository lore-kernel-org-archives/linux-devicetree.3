Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124095;
	b=FmAHoxaD1yfrAmEGBDvV75HMri77Lv86pIp8zO8w2e50ifD9KgQMUHugsHUEGEBul/tj
	 Dw7LK7SlrpouyS2irq0p6oXvKTrVyJYMfcXdWsIy16AB0gZEHB2Pr9eq5BrRJ/9x4t0GA
	 1HB+EQsmRyXNP0Gj1YbgcNrDQYfrDaXNOWmV5zPO11h6GKX9AAuhP1C8xx+TPaH2seSAZ
	 zxHC7/9F5mBbjwuHexfW+nYaMRiG4Fyk6KDOH2o5E1GrO2TYIhF6/qY3wygD7I5G4ffjY
	 xDBtV8zCBYomU2P7n0aSFPxnYSvJ1W2hdYxw6HNNnvrIAY3Zt96l5MGDY+P/SKmA8Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124095;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CmaFIcWmgtXdEMcSvFzwqtYSPrJWkBbMkvu/8+xigKU=;
	b=DSrQbLFMd42vfJMS/GJSeTOpeO4JvXXSjiimn9zPEqye1NL/IeVq50uu/u6he7ihytkx
	 4v6fzpiEfXoSB+t+qvPQObAufKsHoJjRfCwZMSgtKRhY4dbhQLkFEYhbCj9mH8LVpWI8X
	 4ab2LOuEHgTZFocLEMJ3XcC8ljWEP8Yi5P54RK9ot1ggTZPojVONGG7kHZSDxxP39o3Gx
	 oBD+4BYkuyiUw+YOfeV7+qoyJbmkqJb3vc4x6dSQtn/O99FeiFCDnrMoxvkCH4mFjaOb6
	 EuW4ej3O+8l8kFyLE2X7kTijlJnEAoQ6UMeK/ffVS174ANJF2RP7UGT5vwhe+4X2RMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mn/12WVd";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ABE606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mn/12WVd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47FB71F031E5
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793124089;
	bh=CmaFIcWmgtXdEMcSvFzwqtYSPrJWkBbMkvu/8+xigKU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mn/12WVdLXfCzXnn1StrpfTD9e6P8OKfUnmtWzsJ6PKRUEo5uag1Ff41fWcldOiXv
	 RBpkqH8U9OMYFEoyhMNrdvePPx+4LPnRJa9TeQoyuqXujTRpAbf10A9+XB1b6cN85h
	 wr0tYNxwHdzU5urjAisZgf+hyt/pmYBAEu5An2YnJLGpSpPsgWju2LEn7l089mBEJE
	 rA95g5SRzrLhQIcE1xSSKEMVUkuCyuHixeNwmJN4H7dtJhZ844ku05hPe0a40s0L2c
	 m1FpkT/rhJeH0KVbFbuk9fGaC5clCVVWABA2MjaT9F5alEfblV0R1+o5GOMia+rIhj
	 v2DLKsKj67HyQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso192837e87.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:01:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzSgFNGcUVwTlZY6GjKHokS97wr28oxtEIeNg4WlZyxbR9Ucz6wR1EI0pRRc6HeMmeU3h1HQ+EVoVV7@vger.kernel.org
X-Gm-Message-State: AFq9FYIlAvjZAZ+IObyjkJuXU3TfvrCYXi9xP+iZCjE6CCJd3/MAxlrj
	ZYiKba/kDx9h1Hx3FaiOyDZLxBCl/jEhnKKo/BjTVp3XndbiRSGrMOLr0o3JlooA8lz+BgflOZX
	IKXV9fnIFtc4JD7hmDa8oKu93MAOodV8=
X-Received: by 2002:a05:6512:39c8:b0:5bf:c0ea:5a1c with SMTP id
 2adb3069b0e04-5bfcad1ee03mr72369e87.24.1793124088049; Tue, 27 Oct 2026
 11:01:28 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
 <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org>
 <asz8oEtow_lrUU7K@zed> <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
 <atXol9eFjLKxgTpg@zed>
In-Reply-To: <atXol9eFjLKxgTpg@zed>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 19:01:16 +0100
X-Gmail-Original-Message-ID: <CAD++jLm5iRKbb6=ZY0r1q_bb-zO3DAe3a7MxdDbpBT3ZU6_z_w@mail.gmail.com>
X-Gm-Features: AclHuK8HhU9uKCu44e9RLxqd9VqlIg9aSaojLATRz5xTKDcE3D8BqHGd4v82YT0
Message-ID: <CAD++jLm5iRKbb6=ZY0r1q_bb-zO3DAe3a7MxdDbpBT3ZU6_z_w@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacopo, and Prabhakar,

thanks a lot for your help testing this!

On Mon, Oct 19, 2026 at 12:23=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:

> > +       /*
> > +        * Allow the ISP's 2500-vclk reset recovery time.
> > +        * 200 us cover the RZ/V2H's documented minimum of 20 MHz.
> > +        */
> > +       usleep_range(200, 300);
> > +
> >         /* Use "software only" context management. */
> >         mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
> >                              MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK, 0x0=
1);
> >
> > When we now retrieve the reset and assert it, it matters that
> > we give the hardware time to recover. (If this works I will make
> > a separate patch.)
>
> Unfortunately this doesn't help

Since it is clear that:

1, The clock and/or reset ordering matters.

2. The device tree order does not in any way impiy any sequencing
  or such sematics. (I.e. we can't really change these DTS patches)

3. The bulk APIs for clocks and resets have unpredictable ordering
  (clocks will process from left to right and resets in the reverse order..=
.)

I have concluded we need to request each clock and reset explicitly
in the driver and sequence them in code.

I sent a new patch series with two additional patches to explicitly
order clock and reset enblement.

See if this helps and how it looks... Try dropping the reset patch
because I suspect that ordering to not be as important as the
clock ordering but I could be wrong.

Yours,
Linus Walleij
