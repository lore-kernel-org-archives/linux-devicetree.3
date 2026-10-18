Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEDA2EBDE9
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 04:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792296969; cv=pass; b=p87Lv72kYIColq+6WT0iCDMvFBkxR2XwEFRncga+WVX7yUe+xTnjPL2wFTybGTLg1KrQzkpFLsSmTequoUIFDdwfJckFNdgvpbE4ijoYkbUrb+fwy36ZmFj2BY96sguzB88cyc0A7evUj1e2kmn096IA9nJLmoCdOcTqF/OAAZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792296969; c=relaxed/simple;
	bh=YkuqH+MK6KGcxmjE7jw3JHU6j01vKBGL30UVNb1lziY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGsV1hJW+GwYCdazURy6MhfSgQ9uR8IthlG1Rxym+6dQ8UctI2lDm/Qyjd1FCar+M2RxJ0Fjs/aUhi9FlP8C3pkRDVGthn+oMlYDPWGy6KY5odeAylcJYemz2iQGWypRD6KBUECE8wtk1NPgv6Pkr5HrkZcwuii17MvwLzQayro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejdvJUID; arc=pass smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejdvJUID"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4f55a53898cso669540b6e.3
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 21:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792296957; cv=none;
        d=google.com; s=arc-20260327;
        b=mLh9pdMCBxbPFEagJXSeIaS2yMIZDHkrPXCVX9kLthgEA+Ey+PIaszvHBfuQhjbXw2
         QfiHdHrd7Y6sxdJnJzEJu4cUbc6OMHqfvDaRZaNuUmvOvgTpSnQUKBt1a0MtRbLLeXln
         iMe7Qx06p2ngURB2Mrl5RIEIuljpq9kz7LojzLmXQB5Nr7o1KF0xPhgNgzzhWZ2huAhp
         SVfPjERzyDGMMKofirKS5w09MF0Um1JquOTUymX8hZpym5ZAyc9Lms42nQS8Nr2PcIli
         b0S2iwbyJ9NJUuMHjIFUnPNjWdKRX8wNDxipZcw6+gJ4TGJJ5MPlRYVhzQn0a4qgzBmG
         02+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/4NMbhygULn2TA9BcRl0hvex0kI5AbioiY6qVGqZX4c=;
        fh=MsGatyxUK7PYlvDqXSasDek9Q+9pssxo9XZ1lRkCtaI=;
        b=fbYLqbKyqOZ8M5Pcj5Gw5qnECtezM5ZmV51tNAdvfYhi6v0YFgeIwkXtHYC0ceYpmb
         qqlasJivhG/pW6WXvblU79nPkWpn1CuvQy8xj889qC7+K767djn10/vbKV9FXOs4e2eS
         09xoYTMo4DdcDS8ZaILhluaYvFIplqKoNcbtzfjlOKvpUmGWa8ir92ApyAbi7af/hT00
         XkGuWC4UD26ZJZNvg3WEApFjoT7J6B/hmd3jchqMbgg6DlP6V5abTRIVEqtofroMyADH
         IUyA4qhiH6+xe0Y/0FCr14qs0paFPs48wOlvrthEAPD0HnUPyF7mumWC/n9noWGVF70F
         wepQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792296957; x=1792901757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/4NMbhygULn2TA9BcRl0hvex0kI5AbioiY6qVGqZX4c=;
        b=ejdvJUID/zLpbGc5UAZdwmgtEnUo11h6rMRjH//kSZcztNT+jSUEDraxSN2wBUwH3c
         HvwAkdmLRI9p7wVTDipqITlbqnfqxVc5e0WcAS+AWqKtSeQTTEbTiL6z2y4oVv+tdBig
         869ugRfTNkfE08Ekp3IOUq9oIqYsRZiVC1scg3Nr1dNelKnevMR4iQv03qXT1Yn2GVBQ
         FGdq0OhW3eG2IzHY1E2T+2HujI/QbLjErxHkP53P8QmsCkqvBNCbvP8IgWWzFANusKim
         aHLNR15JhBAfHUOX6I0I6wZJF2nKvFMcJM/eeRQ7/02EQBqxB0hbo+XD6u2EpHlX59Th
         D4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792296957; x=1792901757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4NMbhygULn2TA9BcRl0hvex0kI5AbioiY6qVGqZX4c=;
        b=vc6UzcRjDVvblnTL7h47hmvSL4cGbpZlu1slmCwbcnfLiiRn+4UTB507g6NIL9KA35
         cRrUO1v6stJlERmPYH7u/HZ91K0xurP4Zc+XVs/T9YRl8rk+d6Gm/56ulc3SkwSdy+TZ
         hVMVl49e9gwSJaouYQyn86iIcQ0+Y7UeTFBAoAOCZBEWF1uEUl2cVWMCQQLa6ZD2Vova
         LaiGgqJC4f+QH48rVkavpgB3AfYIJGKXPZiiBKRjmT9o/f3lm8tdjhIxd5rKKJDsmNS8
         PrlVgm1GC4gyTSPi2mxtldWailah6epjyvIksW6/t0EgY52ZrE1J4/82GxzRrXPNwPr3
         OcUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUS3H5TiE94Sj/Cy+dlCIh6pQ71bOSzHHsx7sJt+wMLzvVj+LZp3dlA0f4xB5B3NYkWs53RdvlVHwT@vger.kernel.org
X-Gm-Message-State: AFq9FYICdVQZxzrJ3cW2qOmSE7p8HjntJ6uuCcR6vOFVYwognkaaGi6Q
	jub0yLU5xDSd8wvFwYSTq5aZdmkam9EN910cwPoeZbANJMcCfjiEr1nxYhkDNI63XZ9fZwMt9ly
	s69C5qD/NcKTIQKjuJZiwDT/rIydbQZo=
X-Gm-Gg: AYBFou2BaMACYrNp4bIygQq0ahy9byIuZlnvHVJJKQl3BNh32t7FYloQwKnZ6hiBx+p
	3WEoD9/kkVx4T50Q+hSJ1ULXu6fu4/cNm07/0KZmNlLddmDLIvbkCAy5nVlrVE4jTDvQMF25XPq
	bkSNtMZ9PkBGWToGre6ZfimtwKDUp8TNCOXxeDb0SZPYGN2ZnnnDldeGE/Rwz+pkvdoPUNjj6wI
	cZz+T9Zf64jpWkCZZwUhoPXPgxGlZfmnkR7tSqqD5QKQ1cFSrRbPZL/r3lj8p76Dcv0vht9Z4oQ
	vOXDglZdlkbxWf/bjb0FAqUSE3fW756GPlTacyxT8C1skjejWjTo2GuJ74LVVVdF3XHmzT4f9ym
	pcpp/EdhOZNzusnmZSE/JfOB6PK79oCLei1AY+J6JAbJz/w==
X-Received: by 2002:a05:6808:5189:b0:4cb:f21b:6f91 with SMTP id
 5614622812f47-53cd0371300mr3801242b6e.36.1792296957151; Sat, 17 Oct 2026
 21:15:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009214404.722628-1-mmyangfl@gmail.com> <20261009214404.722628-2-mmyangfl@gmail.com>
 <20261012-taupe-grebe-of-nirvana-f32c6e@quoll> <828d3e2e-f204-4bcb-99e8-341a5c799335@sirena.org.uk>
In-Reply-To: <828d3e2e-f204-4bcb-99e8-341a5c799335@sirena.org.uk>
From: David Yang <mmyangfl@gmail.com>
Date: Sun, 18 Oct 2026 12:15:19 +0800
X-Gm-Features: AclHuK_0SlrU2BOKsnPge_cM0N_e9WmCPCRY0emkhYZJ6ilQF5PW33ll3T1jBQo
Message-ID: <CAAXyoMPYuL321B+yWYyCFA_uod+G5F6JCdBkVGFWqBo+37KD=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] regulator: dt-bindings: add hi3798cv200 regulator
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 7:16=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Oct 12, 2026 at 11:11:33AM +0200, Krzysztof Kozlowski wrote:
> > On Sat, Oct 10, 2026 at 05:43:39AM +0800, David Yang wrote:
>
> > > +description: |
> > > +  HiSilicon STB SoCs (Hi3798cv200/mv100/mv200) provide PWM outputs i=
n the PMOC
> > > +  block which drive an external converter.
>
> > SoCs rarely provide supplies for themselves (they are rather called
> > power domains in such case) and above wording suggests this is actually
> > something external. It also speaks about PWM but binding has no PWM.
>
> I think this is talking about something like pwm-regulator.c.
>
> > > +        compatible =3D "hisilicon,hi3798cv200-regulator";
> > > +        reg =3D <0x8a23018 0x4>;
>
> > And one word is rarely a device, which adds to the confusion.
>
> It is possible for a simple analog block...

Hi, I'm planning to spin up with another version. What should I do
with the binding next?
