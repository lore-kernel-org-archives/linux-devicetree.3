Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188289;
	b=IHkdkdzp02g66HPObYNeHAdnBkoCIO6obS9zP6CES/s/uL7OiKeuCsG+iPYIl3luty6O
	 K3oKESf6zdKAG0Fl6tPIj5QWG1I5w+FTobUNj2z2qXuuD7SsbnFiFrYQH9KAX0qWtQnqJ
	 CygPrkc6cPn6EdfGfF6odqLaicvQw1t8MSFY7igpmO30rFXxnEUokaOi5pVlWnHFbW4Lr
	 RgBjrXLgbvtRgp6CWDnkLb/JMit1ejjAERlp1fVXChyOkeFiCglshrgYp1+8jpqRKJYHC
	 iaGB+YK2cbJLXka9N/WTPuOF+HQl6ctUbng5YLtHgVKOxCc1t5goTdXdrkaARruuIVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188289;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bYr+QUNJgI2MuvA03QXGQr4rvGgFxUgp/NNJvE4vbEU=;
	b=hl1hT1uvCnJKFibhb4jVa8neEZnTrbd/UAtVlYUEVBYOpPp/J4o9WxIfZcSSvehNu+1I
	 jBd62liDWGUSDAEF+GlpnpkYieecr2N2Npa1fpqME+yqzANUkLUjMlK7VTBboknh+WQ+w
	 93lKnjAvmG2G6jNoU53efhkoauf6z6d6j1OAouSHVXsRIZ4b8hmfPDeiHqVXYX4ROwZxH
	 Iwvyh0uNu2mDDjh2Chq1YJw4vQQpGCeGU8KGQP35JN5SjzuHZYa7kLEg5f1Q4emZxrOX0
	 CC5fgJHXm03tFzWqTSubNptFFaHG13eJOJer5b8wGZL5jAvdICP93+G9rueTjPCY8Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UqVIs/i7";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21DA606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UqVIs/i7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470431F000EB
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188288;
	bh=bYr+QUNJgI2MuvA03QXGQr4rvGgFxUgp/NNJvE4vbEU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=UqVIs/i7TnKEi5Pn1UgmNFghzO3lvNU1K01wLHBT4Ls42aNMRJ/BMDWXFhTKXzKU3
	 64TCk0ihAu0+w4807jkxbltQl8o7EcMobp0AP3bLAPYy6fDU1lkeNxVuVKR6R15tlC
	 7jZlok2aFFGvuclmnaivHCP+80GGhGDy3Umwt3O81jIrxzKMTfpo39vSKmy6dBQVgM
	 rb+/4OIF2Rc1qHGD9nlkbYcfsHWvuSCQ2SGn0SvNMcr2tSx+PUDuvJlUHz2wgyfu//
	 9+Qc9j/I566PDhRqVVG1kxEeOMFNCRQjUBMc8DYJCSkUI9rcO5sXfC8FasSqTv+2/L
	 1tdeuLJpCxN9Q==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ae7d1ce1bfso9658361fa.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:24:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFIzEn7cjbNDutCq7OXux68kHvU/R09VNAeGsN3SzdwquGpDsT2cYfK+RSRqKxaBlcDZfufyLA1aDCx@vger.kernel.org
X-Gm-Message-State: APuU4Z+QH9v5gQZmHb8NXo8NSvV/rG0zKumCJNht9OmLSdjEbQ6jX6Ri
	8c/aPUcLt1P8jE0mXd2vBFL2zXZPQBXEGaxH1zJy79okCLsHykOjHFfcQOOmisCfvE3mDw5ZJ8B
	SQtekWmhlXIX/ZqjrrahTr9/VtRLhqk0=
X-Received: by 2002:a2e:bc93:0:b0:3ab:4014:884b with SMTP id
 38308e7fff4ca-3ae7f8daa51mr11747861fa.1.1795188286689; Fri, 20 Nov 2026
 07:24:46 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
 <20261120-orangepi-zero-plus2-fixes-v1-1-ecd792189f27@gmail.com> <CAGb2v66=Wy1TEy5KrQt+TmYPowryx19tUN14QTREn9z0dOaJgw@mail.gmail.com>
In-Reply-To: <CAGb2v66=Wy1TEy5KrQt+TmYPowryx19tUN14QTREn9z0dOaJgw@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Nov 2026 23:24:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v66CrTWmrFFtZbHgU4eQ6TxubunbR8sCAgStmL7iLYRK3Q@mail.gmail.com>
X-Gm-Features: Aa3M54o-5sW9SWZsS-y6GLqPkComGdru7jKRb2CUEXihGp57lc4ysEFr0p-QWPk
Message-ID: <CAGb2v66CrTWmrFFtZbHgU4eQ6TxubunbR8sCAgStmL7iLYRK3Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add
 LPO clock for AP6212
To: ipfarher@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 11:23=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Fri, Nov 20, 2026 at 7:40=E2=80=AFPM Ivan Pfarher via B4 Relay
> <devnull+ipfarher.gmail.com@kernel.org> wrote:
> >
> > From: Ivan Pfarher <ipfarher@gmail.com>
> >
> > The AP6212 WiFi/BT module needs a 32.768 kHz low power oscillator (LPO)
> > clock, which on this board comes from the RTC clock output (osc32k-out)=
.
> > Nothing in the device tree references that clock, so it is disabled as
> > unused during late boot.
> >
> > WiFi keeps working without it, but the Bluetooth core does not: with th=
e
> > LPO gated, the BCM43430A1 ROM answers HCI_Reset and nothing else (no
> > Read Local Version, no firmware download), so the controller can never
> > be brought up. Turning the clock output on by hand (RTC LOSC_OUT_GATING=
)
> > makes the controller answer normally.
> >
> > Reference the clock from the WiFi power sequence, as other boards using
> > the same module do (e.g. sun8i-h2-plus-bananapi-m2-zero.dts).
> >
> > Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
> > change applied: osc32k-out stays enabled and the Bluetooth controller
> > answers HCI commands. Build-tested only against current mainline.
>
> It stays enabled only if the mmc stuff is working. So besides the changes
> in this patch (which technically only covers the WiFi side), you should
> add a proper bluetooth node under uart1 with all the resource references.

And that's the next patch. Sorry for the noise.

> > This problem was investigated, and the patch drafted, in an interactive
> > session with an AI coding assistant (Claude by Anthropic). The submitte=
r
> > reviewed the change and ran the tests described above.
> >
> > Fixes: cf8e19e1ec15 ("arm64: dts: orange-pi-zero-plus2: enable AP6212a =
WiFi/BT combo")
> > Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 3 ++=
+
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus=
2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> > index 3eb986c35..34d6c1468 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> > @@ -5,6 +5,7 @@
> >
> >  #include "sun50i-h5.dtsi"
> >
> > +#include <dt-bindings/clock/sun6i-rtc.h>
> >  #include <dt-bindings/gpio/gpio.h>
> >
> >  / {
> > @@ -54,6 +55,8 @@
> >
> >         wifi_pwrseq: pwrseq {
> >                 compatible =3D "mmc-pwrseq-simple";
> > +               clocks =3D <&rtc CLK_OSC32K_FANOUT>;
> > +               clock-names =3D "ext_clock";
> >                 reset-gpios =3D <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
> >                 post-power-on-delay-ms =3D <200>;
> >         };
> >
> > --
> > 2.43.0
> >
> >
