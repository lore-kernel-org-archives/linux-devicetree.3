Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707104;
	b=soRhM2P1snWdIN+N4mVxYFGZ+K3SFfqwRzEwH2UfTrXD6sk+KaFdB5PshzlSMhXw5BjG
	 pLAf5X5swvpOICqAR27TZmI/Nje74wGytjyS+VLaG1k17wxq0DKcbWCQQ4e0pFCnVL6Bz
	 L5y+SnhMAJ5WPI45IJ4nMOIFWBX0YMCoB/bKBZFM5RTrLpqvUjvCPY6fzTA8ro0C+x+a8
	 GOCN8VYDlTSpoDF85UGTYGoIbJ32OSjFkf/2BuVXSOXQ/LEQO4J2S8+VI9f+MMTVLxNlR
	 6z8n8MM9x7MxtmJpCPj5vz0+X1x4Maz/tiVOOpkDkMnh9GTJCWeFo92r59/rNjz0jWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707104;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VTt6jbaht2zGBYKNI2lpBkMP4t0i6MoEcGFYwP5l2hs=;
	b=xbSBQMRhVtfePdyZIsLIBZyFMycPfDQG1P1EO0vEKPXASYzCaSADb8ATnN4TEtNJ4Z9I
	 tivkwY1nkuRfJLAGOgDinW/sfPUlndvk5pWHNe3B1gpDtnv8E7qGo0+eJk93sxEGTfMeQ
	 Uud+7n5p54WqgFv4w1C9SOXZX4VBqXO68sRBNfJLPD3isJ9ftoOKKpSAzoWlsq1hhRyj+
	 O0+61C9bMargJ1nfpnWV3CbSGx/MuFh00Z/+HQkLJrBuuUvuZQfS1RYRDoX3DcdRSZf8P
	 INwlWW7CwF4bL+CN3KT6/jhQ2t1doWhU9kKG7BwcMZJARsfkDOKLouoK4m3BhQ4KTLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB0F606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEB0F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93f3c616c84so553183285a.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795707103; x=1796311903;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VTt6jbaht2zGBYKNI2lpBkMP4t0i6MoEcGFYwP5l2hs=;
        b=HzclWMt1id5+pAS3ikViOO7+ykwF26Ye0F9NkHS3FDGtPHwpDJBCnOt3Hj0raU3AkM
         k6f7Q1ztAvkdVD+okptq2sasRFAooADZ7TN5zXnP/OVec6HJyHQYTqe86C6BCu5aYJDr
         N4N5RVKk1zXRKfUqWFwJpLvVcrUmpFYMWHBJc29evUhk60/8k8ru0Xblsy+S2u8F8yIL
         OJoKCK5qJSizijKQtpUBi2S4fz9Iwh7csO2X6t9qFTehmuW0wLE9ah5Fk4dq06O/0dGm
         dpcOFiZxEj9YCKqT5qzg2Q469vQuv3gCBvH0RUESOAU9jSGnlc7/bYHYPkn1nJwpadlm
         6XFA==
X-Forwarded-Encrypted: i=1; AL+hErHxTO6HSwvy7Se3NmBScjY/GNqu5SRrnnOVXwVv1H+UMUCgpxXvi/JGDT686CNhmZiOtL7G1ORYVpGs@vger.kernel.org
X-Gm-Message-State: APuU4Z8vl0FJoOB4yNeaXpuLkS8C2S045HcJmkDidklNdJeIVEFJa3Pb
	yDK26drvp8msBQu+9QEUVUVACCX05lZ22dKYc959VYC1Ifvkcps5g+J/T7WbMGrf
X-Gm-Gg: AZFdTZdbBHvi4gNizSYmEgdSZ1Rw+V+eO9JZzWkGyfZE/GrzqOsSmtltq/BlzxYUVI6
	aI02E7klgU0sUgy66l/+4eaFCiVwUzRYUpJB/QG701oHA7UlxBa0ZB0piGqcPy9TSdAEl+SPkoN
	m8BeXqsGNaOnbjsc7hmmDkf9QTDn019VOS+nsFehHUer0OiZtwKmjnjnyaLe3Bthjzi21Hb5SUD
	GRP3Oz3ApLh514zjQvjoW27lstr4ud936U1B6vq+iYikfq4/YnptAqfSNeK/t12t06S7mhzyMLt
	5dCB0m/hCgHeEu1bh8/5E1/b+ui+r01DO3IcmeeeLbRR+C9nz2WPg8wpEv05AWlFjAHNOaWgpvY
	ToMfOTOBtT7cragCvQmKkLez07TxpvRSY/Gme8fHcUnYjUxPe5HIdK80k8vIZGuv+S04WPvZge7
	GLiukkj6Y35ZO8cG1WIurx5HxZj7E5JVkotZBjEk5cz+Um3y785ATJmkeEFCwRhEa0+tmCFhBLY
	94wBmxasa3wNv5TXwje6YrQ7eCuRW3DeAc0pFSscSSp2UWs5f4zz3tDA4NcdtiD3w8OtWxyX17C
	UKRhAY7yG5o2NOea8WEn+7gsJlYWfpSMlUI21sWexAs8SKZWqSTdJpwqb6mPvR2cI2kxzcPzb0p
	Ju4am7m2tPZm/
X-Received: by 2002:a05:620a:4608:b0:949:710e:2cdb with SMTP id af79cd13be357-949bab27025mr3929163885a.69.1795707102574;
        Thu, 26 Nov 2026 07:31:42 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38c903sm1591738385a.19.2026.11.26.07.31.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:31:42 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-99e1408dc59so3097147241.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:31:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH2jPK+wDqvkJF6y7J8JQ/UEpDYdgOsdDaVDTZ7lHz4xr1opFwG43zlyQDUdZBCtOglsY4MYNXVAJZ+@vger.kernel.org
X-Received: by 2002:a05:6122:1352:b0:5ea:d247:adb0 with SMTP id
 71dfb90a1353d-5ee8aec0273mr12525476e0c.4.1795707102063; Thu, 26 Nov 2026
 07:31:42 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110080727.2377040-1-niklas.soderlund+renesas@ragnatech.se>
 <20261110080727.2377040-4-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWpZfsaJOcTEBCugyDgKDXNRje68n59OrGFx-0hJXG+4Q@mail.gmail.com> <20261126151633.GO3898744@ragnatech.se>
In-Reply-To: <20261126151633.GO3898744@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 16:31:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWS=HmLkWJayNjWiuaWaCEsq=TZe3Z2d955FiqiT3R0LA@mail.gmail.com>
X-Gm-Features: Aa3M54pKeTC5hUFcgZHzefDJuLY0GDmu_UJnMCzuy7g_xoL8fTHhTprfIbzhyhc
Message-ID: <CAMuHMdWS=HmLkWJayNjWiuaWaCEsq=TZe3Z2d955FiqiT3R0LA@mail.gmail.com>
Subject: Re: [PATCH net-next v8 3/3] arm64: dts: renesas: r8a779g0: Add gPTP node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "DavidS. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Sergey Shtylyov <sergei.shtylyov@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, 26 Nov 2026 at 16:17, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2026-11-26 14:33:17 +0100, Geert Uytterhoeven wrote:
> > On Tue, 10 Nov 2026 at 09:10, Niklas S=C3=B6derlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > The gPTP module is shared between the RAVB and RTSN Ethernet devices =
on
> > > the SoC.
> > >
> > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > > @@ -606,6 +606,15 @@ mfis: system-controller@e6260000 {
> > >                         status =3D "disabled";
> > >                 };
> > >
> > > +               gptp: ptp@e6449000 {
> > > +                       compatible =3D "renesas,r8a779g0-gptp", "rene=
sas,rcar-gen4-gptp";
> > > +                       reg =3D <0 0xe6449000 0 0x500>;
> >
> > Can you please remind me again where I can find this base address in
> > the documentation?
>
> It's very well hidden. The gPTP device itself is only described in the
> attached files to the datasheet, but it does not describe how it is
> wired into the V4H.
>
> For the longest time I assumed each RAVB (and RTSN/RSWITCH) had its own
> gPTP device as it where on Gen3. I got feedback from Renesas this is not
> the case and there is only a single device on Gen4 which is shared
> between all users. That is RTSN and RAVB on V4H and RWSITCH and RAVB on
> S4. To make it even more fun the gPTP device uses the same clock and
> reset as RTSN on V4H and RSWITCH on S4.
>
> I got final confirmation of the address itself from the address map in
> 002_R-CarV4H_Address_Map_D_r1p30.xlsx.

Thanks, found it!

> > The size looks too small to me, though, as there are registers at offse=
ts
> > 0x500 - 0x788.
>
> You are correct, it should be 0x1000. I will send a new version in a few
> days in case you have feedback from the question above.

I can fix that while applying, no need to resend.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

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
