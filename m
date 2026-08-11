Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16FD3AFB06
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 07:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433012; cv=none; b=D9iv+N+u0Q4sb1a3++ehY6gjkd45ZZo4i84o4CKoIwxmOvw0qwW4aPyTS+5XBLx7RTHVs49FFTX7gjQaDNFQvUECPDBIx/khWGehl6zjQXz15sM+oyu7JK+AntRwaoK0wGZj89kyFPRdNobyk8bfHb0Buy/UHaDvj4xIJ3lJMaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433012; c=relaxed/simple;
	bh=lc4HrNegAVn+cVHVfRGJNvIzktb87HMbTgygZ+nGNxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pFNvbT9O5Kc1iM5l7rB0ZuhXuKzNs0Nzpre9edJLi0aoFtml4BWQZV7oX/LrCZNNI4jFOXtn5zadV5rOF5X39zuvvfb4M/lU3ylkpbeQnAk4EG70rfu2VqNbh5AyZ3UlDxkUjb+sRZNzjV0hUUIv8Gbg4meNHaZacdHmtMqiYfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c39cb2115cso465309e0c.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 00:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786433006; x=1787037806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnjcaaPzjsobxbYAFHFZobbcb9vJTJhmtn4W0to+5XQ=;
        b=Rp+LfKE1iiC0BGCaU8Bls7/DVP0dbXBFeUbJ6iBgnUJSyeAJ9qkIOtAewBaWDu7m4/
         smzfPVWEV+Gqy2dd1piI/klBjUugoRlDavvXJNOapKv/hy1sBomRHVSQKaia2HGU7twT
         IeR6XSfG6MsU6n5MXvO3sQSUEPXjfyaNjhcvfU+ZoL6M4ihAuYmI7qszQN42vKBcTRZt
         sN6J3TxFv5QUE+c7n4DiF0G8SWFQJj3CsBPxN/ptb674RubYQNxb3pWjNEZdY7P0YWwY
         HoZy4JhL0V8HPcu42Zmvos8KR8N+X+2K4MHlxTJ20cJ+DM+NQb5WSzH62OkQp1jnHRyE
         ZwWw==
X-Forwarded-Encrypted: i=1; AHgh+Rqkq6HE97FPdmcJrqAywvwVGMrtc4Y11BUCIqfdphQRedGqdEZJ5RJwu92CJ9MTtX1dJNiEkeLA/z84@vger.kernel.org
X-Gm-Message-State: AOJu0Yznu3RoBzaSE1FxPjRfQ+SBiGEPxJU/2TqKMiXyv9qe1MKAksul
	rOugCXvnLDTfYb4wtbSZkPfwZpMn/bbxRejGj9fAXmb1QHPi444TBNWk4aU0coeu
X-Gm-Gg: AR+sD10E8Z19UFcEGY5xDxu+DxPncWylg8zgT7Azp5OTQfbeI9BEk64D8Dty3XABZ7h
	kpS1+0c+GYebOdrgZZH71veKJ21pwpaW/4+h++QNNOigFvm98UTBA3x9PYxEQuMNRMxTIMh2s98
	1qXk0AAh7tnIpVm+y8grlKIyloT/TP8zMJpGRerQmXfMa82zMbsgsVcbmlnPV9fNpR3POzBQfcI
	tOWmSoInFOqRLcSWm99d3iYRuajA/pp/hc2E/N2jbfdjBRI1wLNDReDebQ5xi79q20ZSPfd2lrb
	1yzkTAggJph0ZBpJ7rRcdSOx1NlInNUKaTPaBZsF26WFBnn/tE605HC3WWrKyxY5S1iiVA4r5np
	4fC5b9f/08IdzM9UXoo018HekHiACTrZFmLgKpwtO/7xcAg0zp5oX6AUkOQSD58BL1LvphRi+58
	/vL93FOSiiYkv0PuFBM6qlKibkPR/u51m+GYr3SctTXh1B0bGAJMh72CINCxGtGovqAhKQlXgXd
	yTv/a1UrhEJTKvwA9MhfibKpTurkC4=
X-Received: by 2002:a67:f991:0:b0:745:53b2:d651 with SMTP id ada2fe7eead31-76b74d805dcmr96852137.12.1786433006482;
        Tue, 11 Aug 2026 00:23:26 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97a366fb079sm139354241.10.2026.08.11.00.23.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 00:23:26 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so515860e0c.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 00:23:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpo8NtsUqtsOZ72wA78RFLkRagQXXLNB+0kBLl3J/cNSfrrDTj7tAkw9AmDFA3DWkXx3zvLSfuxpjYU@vger.kernel.org
X-Received: by 2002:a05:6102:6b87:b0:6cb:b3db:c31c with SMTP id
 ada2fe7eead31-76b6fdba80cmr74412137.0.1786433005986; Tue, 11 Aug 2026
 00:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716095935.13329-4-wsa+renesas@sang-engineering.com>
 <20260716095935.13329-6-wsa+renesas@sang-engineering.com> <CAMuHMdWCWvfFqBAQ40E+czhYHSG_ZuCqMobku6B2iEA8ezF5Cg@mail.gmail.com>
 <anqAKtaFCxADeLqM@shikoro>
In-Reply-To: <anqAKtaFCxADeLqM@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 09:23:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXU4MDX3uqJDR+nXp8zuWZxwvNVM1EN6QSNSY8_BJ8hMw@mail.gmail.com>
X-Gm-Features: AUfX_mx_SQQwb9gvkl5UrpTLcwsLbWwtX-NcZ8tSPCGwe-lGYUP1629cOEsPzrA
Message-ID: <CAMuHMdXU4MDX3uqJDR+nXp8zuWZxwvNVM1EN6QSNSY8_BJ8hMw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable
 GPIOs on CN12
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Tue, 11 Aug 2026 at 03:51, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +       pins_gpio2b: pins-gpio2b {
> >
> > pins-cn12?
>
> Okay.
>
> > > +               pinmux =3D <RZN1_PINMUX(164, RZN1_FUNC_GPIO)>,
> > > +                        <RZN1_PINMUX(165, RZN1_FUNC_GPIO)>,
> > > +                        <RZN1_PINMUX(166, RZN1_FUNC_GPIO)>,
> > > +                        <RZN1_PINMUX(167, RZN1_FUNC_GPIO)>,
> > > +                        <RZN1_PINMUX(168, RZN1_FUNC_GPIO)>,
> > > +                        <RZN1_PINMUX(169, RZN1_FUNC_GPIO)>;
> > > +               drive-strength =3D <6>;
> > > +               bias-disable;
> >
> > These pins don't have any external pull-ups, so disabling bias will
> > make them pick-up random EM noise when left unconnected.
>
> Can fix, but is this bad? I'd assume the connected pins will handle it.
> And if not, the DT needs to be adapted to that use case. Otherwise, a
> default pull-up needs to be disabled for another use case.

Currently, nothing is connected to these pins. Unconnected CMOS
inputs must never be left floating, as that can cause oscillations
and increased power consumption.

Default I/O configuration is "2=E2=80=99b01: Pull up (default value)" for b=
ias.

While at it, why did you lower drive strength from the "2=E2=80=99b10: 8 mA
(default value)" 6 mA?

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
