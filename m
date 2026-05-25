Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7AD3976A0
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702837; cv=pass; b=GKmKgZGZ5vzoc0kKjkJt56yQoL227h1cEpzcVxd0CoNiujWjAKuEDB+AOBWf0ToWtEuMiWTaNOSyftuRECMSg8m/C9bTT3W7dmRoza9PSCFo/c6wjnWDU0j7B2rZ0HOojVkx6PrWll9mYREG4otkEN7Z/xD4xprahFxtQoPAvY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702837; c=relaxed/simple;
	bh=9TUVUM631fkXgOeQauKTVy1Pir25s4xdaUauD1SJh94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GvYACSCJmNGR/LQNNFZfEY5Wsgw7nUhHE1aZiihKvrW7m76LUtOCZcsY2Xcbp05odzqxRVZn/GNVtj93RKnGL1kK802Jr4aFvldvIdbGJn+HwZISdpoYy7PIRfDRmgqG+HlRJPc9TMPp+YiBYFEhfAPm0EJShKjRNgmQEUTce1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=bfCnfjIj; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="bfCnfjIj"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-687e7edaafeso4169118a12.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 02:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779702834; cv=none;
        d=google.com; s=arc-20240605;
        b=MQ8g9YJNzuoCu9unsF1KEbX0qfCXao8MCTPMUF4uXcPNHIOVz4dDQE4TlvNEjTwHVH
         WynpeCQGh0O7XKTvSSJIeUswkgysI68OVqeodgvlnHIs6tnohm6upLoeZary6JmD/DI2
         6mlrJR/8GAMHGReaqudfSg2ktsEbcBg9epN7QeiFyZ+L/0gmgvUcCKzpIWBmw46MxZw5
         AWWU0IsuonHXGJ4x2UpdCoZV5wNUHvFMqa4KsK3isfhYxj/os8su5sU+XNfxw8i8LLFI
         SMeCLbSfkOt1AKdD/oVQyFWbiJHT+BCfEnmTOD6KV5gxS6cKQtvJ6wSiEZtSEZn/BmBp
         O7tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e0mRTzemrrXVivpXOaPKIL2ignRf6ovf+dcZAtCU0OY=;
        fh=8GXO0bOmOD14A2IG3Q8kWyYzZjVVu3Rk1EcTho8RqkM=;
        b=Fz/4o1fAG0uYj6fFKMFhQ4+bxjGr77887uRU1YMo6+Wej0oacUjmyTcrdIMYDLMFzV
         L++2Epd4PP1aHDI1jkG0ruyH4MQFuHpDI4otabFQ4gQRXLcvcZ70eSLcgE90IOuf8kBQ
         pNFNGS2XWiTs1LBBT0KeeOlHMbgZrA0hwMjwdVsXqe0KKsPQY2EDSrdU/2+H0M3oZYfQ
         IpLEmlwEWrzG99F022nu1LrkByHCknXKqOK47syboSrq/HU/LpqgLQPVB1l6RhUAyPgg
         kyrvbn41s/SQz34jB0XBweIQLFKzvaJI0psnVGWeD7r124WFMYMe45o4W6yiDHQDEdym
         ec1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1779702834; x=1780307634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0mRTzemrrXVivpXOaPKIL2ignRf6ovf+dcZAtCU0OY=;
        b=bfCnfjIjwI+o3XhEOjFMswnR2tN0HDd/VvvlBuRjtB6ZhR0sxMGbVOzarjS84pvroV
         mEQ8Z4XJn46X4MXuqAH4npk771V0lWL+Hc1yTbQVeLl84i6+v0j5juTBnnkJMl39dqtQ
         GBndlCwk3rwDNybUg7xnPyCprDvLJagIrFOUrhIyGxYNB2HZiAJjECShHCRGImzN72/p
         NxEFyrMLxU2p/EyeQdo0klnGKUrKfT9irum2WJ0H/XKzA+j4t94roWQNu9iKQcx8yHeX
         nzGxDUlDhDAOb3VSZS8iDkUVTcLDUNQ65QnnUpNdJ1NQfpIyVErAfUvgvQlXm+TUpVFT
         nIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702834; x=1780307634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e0mRTzemrrXVivpXOaPKIL2ignRf6ovf+dcZAtCU0OY=;
        b=UCwhXtB5A/UzgdXT6hOvCVNvyJjPwOHUX0Ph+VPNme2Zni1YkQ7cMYxPPwuklBo+Uq
         eTXERYDdyljq8ww/qOciTfD4L4I1ZV3/UKT4ypVTSv0+H5ouy19PlujLNy3GyGpyM0h0
         HIL14L9qOoWUDnUL06yslyESLPV2Mcm4+x1chlaqXcUcGAr3PYDm5mop9S2cpXdhdL0K
         tQy8dfz8itwoUlx1merb71ZQqMnJHuGvPdYLHGCm0s9LN7cdZ7vADbancWFRRdVbZ9Eo
         +tsYCorBHfiV9O2wJ7w41LvnIZBRfdMygKVKPpeoUsK4YoWnOxXse/RZLdK9jaJDtjCC
         91Fw==
X-Forwarded-Encrypted: i=1; AFNElJ86/Hs/69oSP4WWRB3QsBb45hTz6mGrZK0YTilScITqz+URHjYkflAhmy3YpQmnd3/uOvcUc+t7sNzo@vger.kernel.org
X-Gm-Message-State: AOJu0YxBCIoTcCpEUsKocmPdiNR4uUZhR5y4Qqy+qG3XvMwII4ltL7fG
	O4hV8OoVlL4EARKkY7P+1jrVR1QiFGlsVD9200wrTFxPQgaTe+Kzf4ke5kUxK2dBScZwvgpxpTe
	twiMCsxBd2MsrsuzNLg3WwQFqZJ9EBE5FgfI5LqefxvGJs5MzILWlOOnwHe6I
X-Gm-Gg: Acq92OGEVhwqY9CD8B6ZwghCmkKZYQ6VQcIlmMMaxpqi8FFd1OMB1ZsX5DETru51ZAS
	4zaNbuSh7bnK3F6LExkH3esa27wqPEcXgPG8JVoh05fapeI/58VBiv6uKeecL0dGPi13kT+6vB9
	4tPyLLxTEOax+X6Tq2vl5kwTLN471p5UjuVzuroTXuYci6IfTHzfk9+7cJDdiEOPSzQ+qWkDnvm
	MjXit9y7iZUjSRpkz1SzJ79n2HiwkOfx+U1BQHbaTvRv071NYPiPKkNoyTG8o6dApcDv93mjL72
	KBx8JC5eAiOhnmrulAt0rsjM0cGRtCnVSaJmGL4r4k29YF7YF+g=
X-Received: by 2002:a17:907:7703:b0:be2:11d7:8b05 with SMTP id
 a640c23a62f3a-be211d79063mr44830266b.24.1779702834376; Mon, 25 May 2026
 02:53:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525-nau8822-reg-v2-1-7d37ae393e46@flipper.net> <20260525092932.711941F000E9@smtp.kernel.org>
In-Reply-To: <20260525092932.711941F000E9@smtp.kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 25 May 2026 13:53:48 +0400
X-Gm-Features: AVHnY4Li0Dn-doAlVFWhwDaAildAQH7ofwuLtWPuB8AVZZnwi6l94z_pEObcXw8
Message-ID: <CAKTNdwFhkwxzqqzMqT8cXqtOCZBdYZKa7A=ajowxZx5gW4gCfg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: nau8822: Add supply regulators
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 1:29=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Typo in the description for `vddspk-supply`.
> --
>
> commit 2a0698dd10cf90a92b31e252ae2cfd2a236cf2d9
> Author: Alexey Charkov <alchark@flipper.net>
> ASoC: dt-bindings: nau8822: Add supply regulators
>
> This commit adds optional power supply pins (VDDA, VDDB, VDDC, and VDDSPK=
)
> to the NAU8822 device tree binding. This allows device tree users to ensu=
re
> correct power sequencing before communicating with the device.
>
> > diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.ya=
ml b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
> > index cb8182bbc491f..cf4c130382411 100644
> > --- a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
> > +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
>
> [ ... ]
>
> > @@ -30,6 +30,20 @@ properties:
> >    clock-names:
> >      const: mclk
> >
> > +  vdda-supply:
> > +    description: Analog power supply
> > +
> > +  vddb-supply:
> > +    description: Digital buffer (input/output) supply
> > +
> > +  vddc-supply:
> > +    description: Digital core supply
> > +
> > +  vddspk-supply:
> > +    description:
> > +      Speaker supply (power supply pin for RSPKOUT, LSPKOUT, AUXOUT2 a=
nd
> > +      AUXTOUT1 output drivers)
>
> [Severity: Low]
> This isn't a bug, but there appears to be a typo here. Should this be
> AUXOUT1 instead of AUXTOUT1 to match the actual pin and driver definition=
?

Indeed, it's a typo in the datasheet text which I copied and hadn't
noticed (NAU8822 Datasheet Rev 3.3 page 3).

Best regards,
Alexey
