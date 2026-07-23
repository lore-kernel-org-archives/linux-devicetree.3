Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9044C3E00B3
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 07:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784793401; cv=pass; b=ts6Wvumh1Gf73hKoSzoabO28km+UC1BkdcPIZZwI0EmiKn5VYStrhurDpOPB4qprck6p6s7Tj6kgA0gj8Nq22OLN4XXOJKjLxPQIK7l2Oz80GmqK1wJfMIG1D/txJloVWGbs58cBKp5pYNp9NbNnnbK/AEzBQLywPxGjhBQ1Oqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784793401; c=relaxed/simple;
	bh=tI6gcYnsFWnFtO2DE803FE2ryQp+BEpaGLQ6sz2phJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vCPDq/TQx3jYH5RJhJB4wotjYXSIx7u0S4wiWpKWPFgAk6MjxX6t0spTdYoh0z+c34uo5mWbaGvPRLiik0bU7Wyrwo2IW8jwS4OHLZJIs2JyZBF+eok8q4/PoXBU7+mFy7BlGTHUMxcEWxwt9bNnyePhvnC4bwnRJ++nScFLiPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=D/pMMFZX; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="D/pMMFZX"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f7854678bso94383f8f.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 00:56:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784793396; cv=none;
        d=google.com; s=arc-20260327;
        b=KDaO3m8Pk0mDIlpAxFLH4NL47xB8Dl0RgePh+t11Vjynynu5sLgE/EBwLwRFaae/Vu
         drCwHKeFcpXl12CrxNibFQVSa1J8FcdFQhXb+XZAwKsgK1nYN5TbG5/Gau6u+HIFHPxI
         QWcH4QlFxhzWPg3TzHra/56p8TEyUGtvh7L3N2K7b/LBDzAY3ILcYfPS3kSrMZy1GUWB
         d6WrzzTkh5RyekaHXwypCEeYUYwZ08RNeAimrcVKmJg4PJjxet7omgXUd4dLhQYL1amS
         cPciWk01cPSzrxBYySkOO58KxdCiZvDHlRpJiPEoQimbLVCyPhnOySKEVGTxovsiQ1B5
         Kvuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b6DqJBZMRrtqgXe1EMHqbmVcaqG/4/r6dtGHJCM8y1k=;
        fh=+HI/Ew+0WNxodM+6w7EUvETtULwLkgVFLmU3JVUnlF8=;
        b=amqdeaAIqaKNrl/i+k3nxIaek3gOFii6gbkhaUZmSFi0AjKzlzuNDlMw8bhXyFHY7Q
         YCdzGcFXb+VreQ9N3+os74t9dDWVyg3G6B4u/8v8/BpksXFPbNjU6Hzr1p1D3qr7r8te
         vD+OtgRj8WF4bv/AGE5ApPNH3MZlGoO6mG3T8NJ31QRFyZITVu6ncdWCuLjUBFbeMeLL
         fvLVVVT6eGGaqp1hv5R60UO0/87Axcz8aomrO6RCQpA6PNQdoMF2F6oPeZjdBzd1BIpH
         gRrKXk/Hak/MHiNOY3IuNsf0lhtqRXEN59dtPL7lNYo5G/fFVgQMxNWKHO0isD+CZKu+
         QXAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784793396; x=1785398196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b6DqJBZMRrtqgXe1EMHqbmVcaqG/4/r6dtGHJCM8y1k=;
        b=D/pMMFZX3XlbQrK9kXSeNALYI3JTAFJwmLmLkQQi6XhVCtqVtb/eBfyKGkpkzME0SR
         Q5HFjooWs7itLgXK9Wm682ac669MBc49el47s9JG5Iokrh9qWYQ9Qe9CU7egfFriYQ6C
         TMt125VO2DaV3Kasi0YeWpihkcaPLtr+sYaRQMdMcWdVACRINnQQfiqZiJm1r+ZIe9AJ
         ZTFpTcoQ3hz7fqssjXrF0ZvX5wdEd5MQAx5105AuuiGQP01jjk4D9u3XuPLpxanqLJoN
         0ApXF4eZWG0QKGladsccCB4FMegIawW+sEIwXocJbj2crPs2hqVKIuiNDSHknXuJ+a6H
         d38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784793396; x=1785398196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6DqJBZMRrtqgXe1EMHqbmVcaqG/4/r6dtGHJCM8y1k=;
        b=R0HCc2AX6QilBqWonaA542nY0YuFeCRIRSbqDg/hTrBx1NOtsD0ID8JtfOLP4Y7BYM
         UDFJFHeBRoxAYZi9W5W9oOV1OUv4a1gL8xTV2/6Un5wMX42jFC7dyXp+m5HqkU+MwTtu
         4H02DIFKa9y5Fm/Chj5H3sOTef3XexXyCc+FZ2wR2UJJvQRXbZmjntvJ4RNBUY7ajZmx
         8O/GOwydFMY/5Nsz49kBqlYyEdRskYRKPwggfG6IOPfLHVoN0Rs7xInlxQHjd1wihSDp
         U4OvYtdFfHTYcODTwLnDXOXsCKqvLiwZJxRBacsFMKVJ9JhIp7gHLaBp6+YOMq0ik52y
         rT0w==
X-Forwarded-Encrypted: i=1; AHgh+Rq8HxB7gB2qG82pYb+95N4reGpvx6k3bsW6rS9Ijf6U6p7qRshxsUPe4jzqjWZ1VkGyZG/DDK86clpe@vger.kernel.org
X-Gm-Message-State: AOJu0YxxLBIyQbKtSKz81e+XbKpRniJaLMCSReLSPp+Ft8BNExAoGHIV
	RvD78kgSG3QgDyN8Fag/ZKPH+71SDOgCC0gUK/w6e2sTpFOeO9OggpDQaI6BvgnhK/+JRN+M9xE
	QW6KUzyLUziGe3Wch7Nb+XF2yNP9yVb6h3rufxUcMAA==
X-Gm-Gg: AR+sD11ergGQLniGXLoC2KfrmwlSKStZ98FdCoWj2yeXjUgI5UnVV09roIGC/Jo7ZNE
	fA2qaOmvOgN3BAHDHxpRPC8VO43dQwUUInFUhZSF8q48oGBFYsIPbb3Qi8NNSDH5cST+a8Bczug
	rr+3Dk8+aj09bIZuk2b8sE08H2xqmqzWnXAa9njNU1/VFctHSUKqgw5HHG6dDb0P9Z3zRpIhSIw
	aYsdH7ZyPWzu7pXQiaC9lOjdKnrXr4dsyFY3n4IrSzKlT1To6IMJ7BIL9ITffRQA9lrJA1SVgkK
	+obkGJas0/bqi0yy34FH8+JnFWrzDGISnIJyZSFxUdKskdA=
X-Received: by 2002:a05:6000:4717:b0:47f:9254:d45c with SMTP id
 ffacd0b85a97d-47f9254d53dmr642099f8f.31.1784793396668; Thu, 23 Jul 2026
 00:56:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1784732161.git.gregoire.layet@9elements.com>
 <0b97a66762efc05c9073c14112cc489624871947.1784732161.git.gregoire.layet@9elements.com>
 <afa321db51d5e6cc8e0c15badc7204faa0925251.camel@codeconstruct.com.au>
In-Reply-To: <afa321db51d5e6cc8e0c15badc7204faa0925251.camel@codeconstruct.com.au>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Thu, 23 Jul 2026 09:56:24 +0200
X-Gm-Features: AUfX_mxaanYxpNJpBfBXDiyLmy6JFC6syJV6bIP4iGx_AuR3yr8T2VahIy9zQKo
Message-ID: <CAFi2wKbNCVqZzApbG_xcDzyrN6yt_Wc01PVVqtPROcjVnp8hRg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed-g6: add pcie-kcs4
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: joel@jms.id.au, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	corey@minyard.net, devicetree@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

> >  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dt=
s/aspeed/aspeed-g6.dtsi
> > index 56bb3b0444f7..a93fa4cf5d8f 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> > @@ -617,6 +617,13 @@ kcs4: kcs@114 {
> >                                       status =3D "disabled";
> >                               };
> >
> > +                             pcie_kcs4: kcs@914 {
>
> Nodes need to be ordered by ascending address:

The existing kcs4 node is already not in ascending order of address.

'kcs4: kcs@114' is before 'lpc_ctrl: lpc-ctrl@80'

pcie_kcs4 has been placed here to have ascending addresses locally on
the kcs nodes and still
having all the kcs nodes next to each other. This matches the kcs4
node ordering.

If ascending address is still preferred, I'll change pcie_kcs4 order of cou=
rse.

Regards,
Gr=C3=A9goire
