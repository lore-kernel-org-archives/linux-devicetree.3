Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430802C11D9
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 13:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776692919; cv=pass; b=JbNdoXUJDYKSLlYjjjBv35vkegc6+b83BZlh0E8r7wSRQgHrDYgFZJ75o9CSWN+z5Iyr07hdWjhVPqAdD0VcfCKMys0j/Q45x4xKCaDhWQ99x4ib2PFWqQHcDq2w8DmC3psp42PPFYlsfLFrap2TvJ4pquuIPhuUWnxIvOxFlhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776692919; c=relaxed/simple;
	bh=00qy0pA8EbWjDRVQLMqGsEfviFdwGts50HbWo3F1CLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bN08pBpzWpmW+1e5N3s5EcNfrb/MKmWV7ww1Gw1p516s3kmU3v6iRIIjU1zEGEop0MasjFPuqT0pYT4hqdOrFV/qFpDM54kNaJ/92eKoax5vDUIXzridsnfK8dqGAoAUbQKt4Vd764th1Duqvk2SszKtLHEfjPcd/zaEPfRPl0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j88NWleN; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j88NWleN"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d734223e4so2086991f8f.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776692917; cv=none;
        d=google.com; s=arc-20240605;
        b=Wcn+RCVF42xW2/XqBXryj5Wkyp6eul+vaitszm623NViiQ8RZ3Z8INDgcx9jvMxXem
         BLKMW4SqFm0gQSu5+4hge+G4bAqilJDQTLwIXv+oHq2o5hMrndR/H6E1dJGsjcvnc3xq
         KLdLmGH5Bn5W/Uc0wwduTTVlTjzQZV87cTL8Fg2ACbYSMQo6vt/GJcOh/tasw+9l5jwE
         DIZr39QueIy+AuISwPpxG4TlCnhMhJHw1aZTiaeDe1MI7mxpdumv5rHLfbUHon1NvERX
         7lg4VzD40ObWg4HsngvvGMLYr67E1VxORN1HEJNO4kgh0oWLp250ltDZM0h2CsVzZPco
         UYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6fdvlGa138gGkO9+PnXwmk9qwHpQj31ZoGeBcux5NIY=;
        fh=7rL0uYvW/nUEWls6zYBv74ceMbTymq0YqASWHzugLZs=;
        b=I51n/u48BJ14rXAnNSo3i8KkoCluSQIfmK5m7JdHNGBacfKB834hTClv9+pLQJ/bAr
         OX5A0OwSZTZ//yRAh0zb0BnYW8LsO3aUkcjpOt0BgDoyvJgQ0ZAGH3F3BaL9Ib/mMjtH
         89zFgYP8BcyzJBkvqQEadeOSNrVB5OfAas9kKUZ/dRcb+l1Ilkfjw60Juhijm44Q2KLX
         AdeStgrI3xVTs+U3SiZcK1c/VxUwmTtL9I93HzNQKZXzv4uL1cClISjHNe+O+tFyg0Q4
         mZ4uiIG/N29cqfrBT78qYSpke3SXyaNbJoMaMuM23oo4eiqRymxU3vRuUupX2JBAiua5
         OKXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776692917; x=1777297717; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fdvlGa138gGkO9+PnXwmk9qwHpQj31ZoGeBcux5NIY=;
        b=j88NWleNgHVefSkWZq2QvXh+vYq8IVaCnIKW9/Jqsji/lbyvZeWp5XgZN3IYkTRYXL
         zJQASnjfXLBubIGu8DTxT9TvZM8HPOw3Hd4jl9tEv3vCFPfemNZd5+UYeFCC/a3ZAiUJ
         A2Lv6PW42tYkq0xf+tD8kde1/Z4JA9kntfxmmqafIvJQ1hvrB537QWH0VQ7QhdUWASMz
         WLcnrnhnNAGIgq1hOP9Jn040Kk6j53cQ6YJhfKLqmUeRvTUeOfu8NFU+fyniR/lWO4qr
         ZUCVVQPuG67MS4CNcMEhCWCvMwzEhJj9UFu2ncfyii3iR8Eod6TGdRnmK5hgPD97fNiT
         BeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776692917; x=1777297717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6fdvlGa138gGkO9+PnXwmk9qwHpQj31ZoGeBcux5NIY=;
        b=NIFVkW8XCLw01uglOMXj0baiu5cJVtt/ZYPUGmpdGSVtdZSCeYWw9LX6091ED032ZC
         R1Bcs0ux90VdQpHmygs4CFRhyOs3kmu1TtXdUfueC5lqlutvvdU9oZmnDxilLxF8UuJ5
         E4FEGjjW3DEil9KFbqf/KYDDSoDCRZFrm62V15MKB55sQOLV9O0PDLu5dWw7iPoxF3En
         Yf/PflKSGtMKOv3aQi9Ka1r6sD6w2NOgfBymwYDEGTVLIlp18QzCtO7tCrB3LKtgZXt8
         gdq++9pqS3I6CTxy/zTQP/1IPqpcIEjOoOFEQnfhO5pIk80kPDDgYi1HX2W5Gl2DYpx9
         QsoQ==
X-Forwarded-Encrypted: i=1; AFNElJ9oVR7eHdOdYh9TRS/A+Ersur1F5BIaNhHvrg2ZuToAKZ8Hyg1altrIO8WgDJ0vHT4pTYI9mAnx6BlV@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxc+9KTURR7ZfNtitFCb2z5EEdKZE9tZjtRSdTMgRpBG1Jez4P
	J9l0qfGdVN9n9XHH9vMC67O+nNaSkXDJ/UTLMnHCc3I1PUtUIAnMvDpMZj66/bZrOyCSvSsgWAU
	nKINnMJDXiIO7Mu4fr2YGJP3SJcq4V3wFYCJl5mo=
X-Gm-Gg: AeBDiet5EyFVGxo5IbGER9kkniumjJ0s19mQ0Jzfl7ZfZj1U6MvJpIUwu4EV1fTqkkv
	jvHhbuUEilZLyV/I85Ft5lLIWLNGM3HDCKzFUvvMXcoyOCJ6BBJ75lwffENX2X4tCjKStBVA/PA
	d/bAnK/fCfSr3wpTWR53vLTtqtpr3Hyn+ScDOClYGoFbTmdkWPXWaWFktnSS9dkj7kCyUk0813c
	a2BhVFjQ6rXOp2Th9MjhgTIWsDNKKVJVg2lZIj6M77YNGTDHgVatqiBUA7/4n+mBMr5vXNZgYM/
	sUdJMv/2bD07qL6xzjtBe089GkTTL72KIyYslgp1ECduBPCisCEi8rPKr8dEb20wowTL80TnIGN
	hLjdpDs6scqSZ
X-Received: by 2002:a05:6000:471c:b0:43d:c06:bcd7 with SMTP id
 ffacd0b85a97d-43fe4094d83mr16883876f8f.26.1776692916474; Mon, 20 Apr 2026
 06:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420132211.1350656-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX06K5TzAWZv_Ehec2Am-P0Q-3cchc6XiOgAk6Q-W3BYg@mail.gmail.com>
In-Reply-To: <CAMuHMdX06K5TzAWZv_Ehec2Am-P0Q-3cchc6XiOgAk6Q-W3BYg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 20 Apr 2026 14:48:10 +0100
X-Gm-Features: AQROBzCiOVQ_TyjQ6mfvdYKiI575mtQ4yGaivSUuNalL12EzefxadWqsHgOlAdA
Message-ID: <CA+V-a8s8DGd-t8+r1jgBr9j3BqJEx-ZkaZoUVQMzFyVS73KLgA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rz-smarc-du-adv7513: Simplify DU
 port configuration
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Apr 20, 2026 at 2:39=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhkar,
>
> On Mon, 20 Apr 2026 at 15:22, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The SoC dtsi already defines the du node with its ports hierarchy,
> > including the du_out_rgb endpoint node under port@0. There is no need
> > to redefine the entire ports/port@0 structure in the board-level dtsi.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
> > @@ -24,19 +24,10 @@ &du {
> >         pinctrl-names =3D "default";
> >
> >         status =3D "okay";
> > +};
> >
> > -       ports {
> > -               #address-cells =3D <1>;
> > -               #size-cells =3D <0>;
> > -
> > -               port@0 {
> > -                       reg =3D <0>;
> > -
> > -                       du_out_rgb: endpoint {
> > -                               remote-endpoint =3D <&adv7513_in>;
> > -                       };
> > -               };
> > -       };
> > +&du_out_rgb {
> > +       remote-endpoint =3D <&adv7513_in>;
> >  };
> >
> >  &ADV7513_PARENT_I2C {
>
> Doesn't this introduce new DTC W=3D1 warnings?
> Cfr. "[PATCH 0/4] arm64: dts: renesas: Fix missing cells and reg"
> https://lore.kernel.org/20260326042411.215241-1-marek.vasut+renesas@mailb=
ox.org/
>
No it does not introduce new warnings (logs [1]) as the SoC DTSI
already has the missing cells and reg properties [2].

[1] https://gist.github.com/prabhakarlad/69f53e32faee17ead390c9ed68c322d3
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi?h=3Dnext-20260420#n169

Cheers,
Prabhakar
