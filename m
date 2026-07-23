Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4351FBEA6
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 17:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828550; cv=none; b=muBTuZSvdGlLMyuqEVkr+uBPOQkkMd2I7/7uC4cqnVfuroFX+h/NsWJis4IQ+OXD6hJ/ZWBbCOVaeOcnk+lD/kP4cb5VLesTfWcy9buzzVjZU1ViHsl6Ay1b8tDbklq7lYh0055xc2F7AgDrgC7HUHu8wRhdmKU4CU+Q/EWWikQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828550; c=relaxed/simple;
	bh=x3GgjJezyxDhwMo0E0jc/GbjGqpZc1ErOHoiB9f78jU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pzh4KY+3yl9J7vDV5bKoRvHuvlg8TO/C7Nj3re1VbuzsEkMd9VHBL6UdO4+iXvGz0HC4EowtPpXVqPT+uBtzFd4E5rplSr3H+ChYaAeulFpx0cp1exUsH1JIf142pYNdhzWNR1qf29Xz1M8ocd/bVTCkXJcewSs88oLfMZoKDGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3061F000E9
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 17:42:29 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-497d3e4460aso716609b6e.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:42:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpY/1TVxsvgDctUwdCgyvueyJ0LUu1exYYQk3gMBnfjaqjVUi+ov367oadbPPhrMo4RxMhTrppOS1+u@vger.kernel.org
X-Gm-Message-State: AOJu0YxCFnK3erf9b/L/9ZC2P2FRxFJ3Ost76tGy0TlZdmzrTSA9amNk
	EMsvvikJFrSgIzOdYYqLudTtwysyeHx5nPtEdTtHShsiSapET+fB8kxE2HUqpBT//yYUQluyv3P
	RvRAYRC6fhoutg7oZ9j/q1+HOclM0zkk=
X-Received: by 2002:a05:6808:3190:b0:495:ca1b:7865 with SMTP id
 5614622812f47-4ab3842194fmr1564489b6e.11.1784828539225; Thu, 23 Jul 2026
 10:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722233604.3001063-1-utilityemal77@gmail.com> <20260722233604.3001063-5-utilityemal77@gmail.com>
In-Reply-To: <20260722233604.3001063-5-utilityemal77@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 24 Jul 2026 01:42:03 +0800
X-Gmail-Original-Message-ID: <CAGb2v65zjkXyyrK5U62QsWEWSgG+9zuEKAi-Ekxd5OehBVXTWg@mail.gmail.com>
X-Gm-Features: AUfX_my2HTBZkhl39VV1Ephb61n1qX3oao7Ket2MbKBRA-ze570sxZ63vDegmvs
Message-ID: <CAGb2v65zjkXyyrK5U62QsWEWSgG+9zuEKAi-Ekxd5OehBVXTWg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: allwinner: a523: enable IR on the
 Avaota A1
To: Justin Suess <utilityemal77@gmail.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 7:36=E2=80=AFAM Justin Suess <utilityemal77@gmail.c=
om> wrote:
>
> From: Andre Przywara <andre.przywara@arm.com>
>
> The Avaota A1 board has an IR receiver chip on the PCB (next to the
> Ethernet jacks), wired to the PI8 pin on the SoC.
>
> Add the pin description to the PIO DT node, and enable the CIR receiver
> in the main power domain.
>
> Tested on the board with evtest and some random TV remote control.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

You need to add your own Signed-off-by, since you are resending other
people's work.

ChenYu


> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi          | 7 +++++++
>  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 6 ++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index c2de662140ce..219fd76a4710 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -155,6 +155,13 @@ i2s2_pi_pins: i2s2-pi-pins {
>                                 bias-disable;
>                         };
>
> +                       /omit-if-no-ref/
> +                       ir_rx_pin: ir-rx-pin {
> +                               pins =3D "PI8";
> +                               allwinner,pinmux =3D <3>;
> +                               function =3D "cir_rx";
> +                       };
> +

This hunk should be in the .dtsi patch. And there are two pin mux
possibilities for ir-rx. Please name it accordingly, like "ir-rx-pi-pin".

ChenYu

>                         /omit-if-no-ref/
>                         ledc_ph_pin: ledc-ph-pin {
>                                 pins =3D "PH19";
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> index 474354fbfcec..994f1e4f0ce7 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> @@ -100,6 +100,12 @@ &gpu {
>         status =3D "okay";
>  };
>
> +&ir {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&ir_rx_pin>;
> +       status =3D "okay";
> +};
> +
>  &ledc {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&ledc_ph_pin>;
> --
> 2.54.0
>
