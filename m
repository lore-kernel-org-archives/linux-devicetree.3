Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F219F377EDC
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886710; cv=none; b=uGEQMGuk/dDT+uqPgSAGgpMlvlnBx8e9U+QOmz/gAZ8bKoGIQNg50yw3AwKU65VYtZqVWnFkxSHvktvBsYZ0jt6DUH33fEqvL/WZ3eAOEip5vCUOkL0aLjdqAZ4bKpn4j7NzuM4BVUxAHuFgwDrmuomTAAHJkBaOaQWbuQqgrNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886710; c=relaxed/simple;
	bh=lhMXoZX5EKaIKEyMd6/+4ptCK/lC4Z3mYLu5uWl9Ca8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=njKMeeAPr1W1CeYY9XJxanhFAlhp7xHAgBFpFFmV3A+q/CONa1mvJEoJHrmTzSN5+kAs9208f1rMezp5wu+bF52H+acr70aULxGm655L1eDXaVxQvDoXR29SRgJwsXuBTC6o9LzI7aVbq1JaBoPRJZWXQ8iCRsm6hbg/mOSYJbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5673804da95so1272033e0c.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 02:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886708; x=1778491508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XiyjHCJDl/rogPwAqEoOmuI7BlhASDQQxZixIp7ihY8=;
        b=iH9AHcQWtpK5hWuNAJIxv/lgE80UGV2aiAT+ftALj/1NRwfUrtLK5fHlbGSRGv8yhu
         ItxYeHsFUOxr7pjn3JVYPH0DwLaG4CZdfNa9KzWwXF1H8pkA2S+IJnifdDrYgPPRRyX+
         n1J9lOoEUFLnWFZVxTgi+bjuJBIEFBN3mjJs+iEQUpgFpNnpsUWS1JKFcGPRU6LtRi39
         X8IOfaLLuVRbmXLVGZSfOC6lo1jdU0wjOXficuz/0M+k+Eq57NS/TntnqsijMBoh3Nxb
         ypSS/rOOhLlyFnK8x8L9liikp2Hr5dW87Lf/Eqt08yce8y03671tuewo+D9fIGyUBF2i
         Y5Vg==
X-Forwarded-Encrypted: i=1; AFNElJ/K0LF16aw4ARNhUbp3IUUWl+eHcB98a/f5b3McCeyucIIARneeJdc2wHalCudonOy1s5crH8RYxgCs@vger.kernel.org
X-Gm-Message-State: AOJu0YzvlAUUd5mtRdoonmWycKCv9Hlp5lf68vM51nfiIApzbXZeHds6
	lB/OvkEJ6Nn6/kRKKOPfv9T3Pe7rMosQtohUaBOmkLTz9MmerJVBYvI3QG/kg3ML
X-Gm-Gg: AeBDievx70XbT4bfu8rIcmBsQ5wuHe4uGqDVJ285h/N0wZm0rM5L2krLeReKacNLVzb
	e2z1CiQxi7r54DLSEma/WNoHynZgv9LQjI5ty/8EAwHY5U5m0XIYkxL0yofASwnnFvSaLMYlcYA
	WvAFn4EkvITsvQbfQ7YhucsFS7LGPZ6fwsXDUPUeC/Kj9WjJ+Wi8Zmkk2oIRu8+vPagl2Ni052c
	vObg/+WAJAYHYW9mfzYphyg/SfgQOAa4jMNHOojikmB/n5uHukY8efG9j7p2TLH7lcNHk5GJEzC
	R9gjGnGPtNuLTesv9CsByim20po8pNrXkAI0bVrBMIo3qXvg49omDs7nH4I4PbTUQ8es4n/QuDZ
	jJez2n72GHOd5+dMTK7Jj5Zl11ZjZkWh+8/JYTeRACg8Yup/oA3tlgrOMgj7q4T9c5NpXkdCvY3
	/ldenofg5U4jgmMmVZNLEOLhD3L/i2uGCGFaHO0nKJksaDMrTvy5NrldGCgXUlK0A9v28O5cHMU
	lQ=
X-Received: by 2002:a05:6122:62a3:b0:56d:7b2e:89a1 with SMTP id 71dfb90a1353d-5750c828d14mr3173628e0c.4.1777886707783;
        Mon, 04 May 2026 02:25:07 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6ef4012sm5922472e0c.18.2026.05.04.02.25.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:25:06 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5752b279662so176359e0c.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 02:25:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/eQi8gmqxzMiNvYiWssqDVOPnoMKbJ74Cn/R161VkQej8VxAf7BTTdI00SwAs1g/dMh3AdSsk4/a1k@vger.kernel.org
X-Received: by 2002:a05:6122:2884:b0:56d:b639:5c0d with SMTP id
 71dfb90a1353d-5750ca1f022mr3391522e0c.13.1777886706296; Mon, 04 May 2026
 02:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-8-marek.vasut+renesas@mailbox.org> <CAMuHMdX17D3n_5vxsvmaSmionjOqrEdPygjPdYuu6a0DR7b83w@mail.gmail.com>
 <0875e4a1-f112-4619-a229-2f6f9197f21c@mailbox.org>
In-Reply-To: <0875e4a1-f112-4619-a229-2f6f9197f21c@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 11:24:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com>
X-Gm-Features: AVHnY4LakVD8SFWNnLvI5N41V0dwMs_sPKYjvoWQU3neqkGpISJJCy9fOpu_jcA
Message-ID: <CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: renesas: r8a779md: Add support for R-Car
 M3Le R8A779MD Geist
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Sun, 3 May 2026 at 04:50, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 4/29/26 3:59 PM, Geert Uytterhoeven wrote:
> >> +&avb {
> >> +       pinctrl-0 =3D <&avb_pins>;
> >> +       pinctrl-names =3D "default";
> >> +       phy-handle =3D <&phy0>;
> >> +       tx-internal-delay-ps =3D <2000>;
> >> +       status =3D "okay";
> >> +
> >> +       phy0: ethernet-phy@0 {
> >
> > compatible =3D "ethernet-phy-id0022.1622";
> >
> >> +               rxc-skew-ps =3D <1500>;
> >> +               reg =3D <0>;
> >> +               interrupt-parent =3D <&gpio2>;
> >> +               interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
> >
> > interrupts-extended =3D <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
> >
> >> +               reset-gpios =3D <&gpio2 10 GPIO_ACTIVE_LOW>;
> >> +               reset-assert-us =3D <100>;
> >> +               reset-deassert-us =3D <100>;
> >
> > Do we need these two? We don't have them in e.g.
> > arch/arm64/boot/dts/renesas/salvator-common.dtsi
>
> I believe we should add them, the KSZ9031 PHY does require 100us delay
> after reset is deasserted and before MDIO access is possible:
>
> https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDoc=
uments/DataSheets/KSZ9031RNX-Data-Sheet-DS00002117.pdf
>
> FIGURE 7-5: POWER-UP/POWER-DOWN/RESET TIMING
>
> "
> Note 2: After the de-assertion of reset, wait a minimum of 100 =C2=B5s be=
fore
> starting programming on the MIIM (MDC/MDIO)
> interface
> "

OK. So please add it to the other boards, too.

> [...]
>
> >> +       pwm2_pins: pwm2 {
> >> +               groups =3D "pwm2_a";
> >> +               function =3D "pwm2";
> >> +       };
> >
> > What is pwm2 used for?
>
> The signal is accessible on the EXIO connector D (LBSC) .
> It is up to user to use the pin for their purposes.

Usually we do not enable support for random user wirings on EXIO connectors=
.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
