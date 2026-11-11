Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391271;
	b=cWbdSMlh50t5m/9BHb3zAqOio06eQhtu9lB2lWxP0bhwPrjEw1qn67Y25ptd22lrbov0
	 3GKSVM8hHw8Ayzx24ajQayT4unlJpNLvgL5pdfxbSXaD3riPQji6LawEk7qt46SXx9zoH
	 BIjzJ6TqBWl9u4RL0TNuuWyWtPHsqDxBdpux9udGo9HPisiGwDCywEijW5XO2A/dP9IUz
	 INXhRCVDz4q0/b9wrV0Kb6rk+cSleIBR2U4N1cxY/8dHXLlQv5PqVeDFf1y+o5oXWfmvr
	 ahI/Utp+AWieknC8KGgyTMalgJC+IJrQnBEaGXFLGrN7A1YBz8l3s0aSaE350p0iavA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391271;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mUmhg+XzSgOizBM/HTfpUu2nybv+pdSuGATpu3ukT5k=;
	b=x8dYXz551aOWZq7ypTo7PXO7CS9MLCAy37po2XSLXF9kSi74l26JI2Xlin12iTQNCg1U
	 Sue9EYUAa84mPjoyy1B4/4o1dyoN46RE4Jmdbo/wSEvX+4hIg74yu9YxdjKaWXMCUjKoP
	 x9b8YgJc8WqSstG8l5iMsTbJWZS/w6Ui0uXdudzlmhjUPANqp8jpmVXqsy8RbVrqldMXb
	 b21n8Rg4bvwX+loh6mTYufUGcgXojmkQ95lT9nQo34CS+mECxo/8xxJ0TlBExroS4MpwG
	 AqFCtxNVRIQN5qCPjidISS9FIWaCP7yJQP4FsJ84OWytam7ehWOysCA/3xrxDu1glYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fykzx5cC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21D860A6F7D
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fykzx5cC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFA41F00AD2
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391271;
	bh=mUmhg+XzSgOizBM/HTfpUu2nybv+pdSuGATpu3ukT5k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fykzx5cC3L9jM8/I6Rfitp1+muWVGMx62FgpMlSvqHw2GSFdoPfuIJu+N/ZvQiXqN
	 13oYocRR2C/gD0bXPlhifDPN77+ETJKd7NRjZSHMcHrlUC4r267dV9XIXRh0vPrfTm
	 RbskapgDNObCfzbG64FXCS2xVy36+Csu+vUjuiCR5B616m+p3B049AD1EKPmO7CLQh
	 xJ2xs0zQ0tgL6ZJ9gfae6nCTpXUo8euAdOc9/LqaJfSd94T1oMUYuupRitH7xdaJ2t
	 23cqsfeTWiYrnlu4b5CvipqjimjtgXoDybiN8Lpjzl4Fvtj1M1AZGcs/Il4HScKt3S
	 s/lgUgRPxbY9A==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-716ea2598eeso1733756eaf.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 02:01:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGNaHQGV7wYDB0rCvuYmnaxEsUCAeQL4XMI1d8XPkCe+dT9yVFa3FuRwrBIUpI1LjOuthW1OCyzQ8hZ@vger.kernel.org
X-Gm-Message-State: APuU4Z9PIkFrUwOAKr9utV1oOcYUbQa5xNFsNV2HcuFSnv0bDRkD3/gh
	qdDj8i+ICZXiMH2Hop8fRAMbYWIof7hwN3Grj2qN9ZmIpThWe1KeBx/94hSRwodNszrFH8kOHWk
	ujZY7wjMhoOZH8izn5fipZeTv2hlWjDE=
X-Received: by 2002:a05:6820:c453:10b0:716:c485:eba4 with SMTP id
 006d021491bc7-719179c7cdamr758103eaf.85.1794391270535; Wed, 11 Nov 2026
 02:01:10 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-xg6846b-bcmbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org>
 <20261106-xg6846b-bcmbca-xrdp-reset-v3-5-d6adeb71afc9@kernel.org> <22be96ba4139cad12e46b5e64ae95b0033bde60a.camel@pengutronix.de>
In-Reply-To: <22be96ba4139cad12e46b5e64ae95b0033bde60a.camel@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Nov 2026 11:00:55 +0100
X-Gmail-Original-Message-ID: <CAD++jL=-VYB23V-vD91Pfsae7QJjoQmv7M7Yu+FobDY90s+NVA@mail.gmail.com>
X-Gm-Features: AclHuK-czsJQZI3zTXq1LXffjfdefI2Xg2qfnJzhUIoxyF6N0VNLuNo5D59OV-k
Message-ID: <CAD++jL=-VYB23V-vD91Pfsae7QJjoQmv7M7Yu+FobDY90s+NVA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] reset: Add BCMBCA block resets through the PMB
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Ulf Hansson <ulfh@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 12:59=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
> On Fr, 2026-11-06 at 09:26 +0100, Linus Walleij wrote:

> > Implement the BCM6846 XRDP reset group through the shared PMB regmap.
> > Assert all blocks before releasing any of them, preserving the vendor
> > reset masks and ordering. Provide the independent PVTMON acquisition
> > reset as well. Serialize complete sequences and hold blocks in reset
> > on failure.
> >
> > Power domain consumers must enable their domains before requesting a
> > reset.
>
> Before requesting or before (de)asserting?

Before (de)asserting, I'll clarify or just drop the comments because
it's kinda obvious.

> > Zone transitions belong to the PMB power domain subdriver.
>
> Why mention it here?

Thinking aloud while working on the whole patch series.

> > +static struct platform_driver bcmbca_pmb_reset_driver =3D {
> > +     .probe =3D bcmbca_pmb_reset_probe,
> > +     .driver =3D {
> > +             .name =3D "brcm-pmb-reset",
> > +             .of_match_table =3D bcmbca_pmb_reset_of_match,
> > +             .suppress_bind_attrs =3D true,
>
> This is new. Why?

Other patches in the series got review comments (I think from Sashiko)
that as usual it is possible to build a system where you can wreac
havoc in sysfs by interectively unbinding and binding the drivers
if you wanna, and it's seen as a bad thing.

So I made the same change everywhere.

I'll look into the rest of the comments and (hjopefully) fix them.

Yours,
Linus Walleij
