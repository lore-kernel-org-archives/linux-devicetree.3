Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358DC3D34AD
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956417; cv=pass; b=s6z3TflbAaftzn7goSH+FEokf9QWnX3gnl/xlOcgPPfAx0rq9PY40LOZRe4I2rOBR+ewW57Vs9AjpghNLPd0Gb714UGWEoMvOuR3I4qnK9UeUp4wR076o1JMkMpq6EOAD/GzrvINm5A5fnQt1GBjUWTtlyItbahGP4ILR3EZXuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956417; c=relaxed/simple;
	bh=PFCBmuwuKEKtQ0bPc/Rwi452Am7mRq4n8aDYWPjSjzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oviIUJE1brrH6pJkmGrqLRnS7vob8SamG9DFMRmJNYFQmvHHfojm+bevulSsoaoDFdfyBZyOqmq8LEZtkBRE/Hav8rzJQTOB8SmEh0XnA8zJNbcmrjiU5AjQko9P86iUP2kagjkP/ywMTaEgpWhv1cv/8KIOaaADNIx/ieRQw8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=icmuuahh; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="icmuuahh"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a159c1e65aso5224723e87.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 04:26:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774956414; cv=none;
        d=google.com; s=arc-20240605;
        b=iNR2pQdGrIJqmKV4kFb+zwThz3JYTpPDiWpVFYIEAJ+DH1cHlsK7kkJw+XV+IWwkIY
         3tZxcNzDtL9/z2h37uKRY24p2oIeIRPjnpD93H4k9xWtorlJAHOuglUpRJCrLzmLnxBN
         rm+2hFl/h/tYYj4Gq8nIBwSXLVcoIoBCZwRzxQaspbQXChMHnMd1Fu4i80OviEmxzOI+
         btJD2e795oaLluEk2MGkYGndKDo4UPeTf9roBBpa6/bptO+/MvSs9lhFBEd1W5M9vuP7
         yksssV4tDG+i2V4hP1SrRQBKPXgXvNeyY0rEjpy1IiQELLLYpm57QxdWmaiBNziydnz1
         yVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iP+XvAcB0McyuH4v01BHzzfnUMiwboyQfOJw5woEYVA=;
        fh=QPb8/SuiqXL2qr6cXPFzIxC8GT9IVeyxYOvUY6UEkFw=;
        b=iIGHh9BDKF7uSav76ZVaLPDcvNbqOX7murq8Jalbri6b2km3tVsTQ5vN7upakXs2i6
         d16lGWp2/MzT2x5g/YNvr1OFvY+GCiQqSkvdVOkbiDd9ztqWisyzgvgElN6/G7tiWZcj
         v8o/fMfzYKSdBrmyYDbYHTPS9YwxUXvXq7bCCWLszl+kx/zzyqt52VIwdQ78sCw7l+JL
         Bjsfi03Yahox4Y41xKFsFqUO3HQdJidXplM4rsbTSjrQcHD2dBeif4j3Nw5jnQhsuSW+
         O3vcntoHUKAvbpxCFp/LY9IdHKTNcUzLaLfvIaBCQCP50KliXUD27uysjxMhbzf+WIzP
         BUPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774956414; x=1775561214; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iP+XvAcB0McyuH4v01BHzzfnUMiwboyQfOJw5woEYVA=;
        b=icmuuahh5X89FeUvS2Jy0gDfrLgQagi88vflKfJmW0n18nTSBqxM072rqDbNAa12wR
         1QxzMk84i54x/boxh2Z/8q1nNltCVDTZAqP3DL8d6WjtG70fbXIAHvtlBLV5q/REOTD7
         bVpxMmJcDyENct7xoj6H6xlwoNqwkf092LH0MO7fQkckDl9tzRhXv3/TkGOKIIVrpP5g
         UNKfeDVTRsoa/JrtTSfA8ymba/VMznbQIbMnow0Qn3bpqM/p28HvqCQ4xT8oNwf58yhK
         oCS05fQdB1DPSSFh+pnO3aD45ssX5hCcgFfnBDxZciGbHFAmKkrjRKRaHTbAOKuBJX/8
         u+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774956414; x=1775561214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iP+XvAcB0McyuH4v01BHzzfnUMiwboyQfOJw5woEYVA=;
        b=nu7eRk8wx+Slkz735e+SjjkmIbPYfJMCob1b/DypcKCREQ/cMwY+10XCFarbYXa3cg
         Hj+b0uBeDaBhcj+2LsAl3Fa7fCiHLgJUpK7her5JB+BR9ByZHu9jMu+zjUHzy/f0ia5t
         +GaWON1TF67rkhZb7L5mVlNX0IC9QWQbRPnr7TW5vaFfFWAheA3ecwHlM+cWoZg2vP1A
         aUWqnxE6h3c+x8ZkJAecxScfSTzQgT852XRk1LOFxDBonEBQEWpoAZ/wizagprI3v3VP
         s2qUpn7My7rl0O/v3NmCVpKklDC5SGxXxdNjqepvCC88UsEqYhe3BjoM8g0xQgXUGupo
         lphg==
X-Forwarded-Encrypted: i=1; AJvYcCWufdpZm1MohP3cuGvRDNuPgus69LzcK1uwk2acdZvYKeeIB+j3p+EcgVs0+dBE7jcJ9c/lUM0bn0vK@vger.kernel.org
X-Gm-Message-State: AOJu0YxicHGFsbe9chvwCDaICzuBDGpN7KhgulmIHgFqLvc2Yca0JQeY
	gIsDy//TvHv9OcWq2fGqZ7zdzPY7N0wHNYksxbhNH8TiUSyRqSNPX+ncPLiSxpuV5wZ8ny545Ll
	FHxR4EB9Sm0bFjQ8VtbXwEJQ0CtYCaj45RC7guHQObw==
X-Gm-Gg: ATEYQzyGgrCJMtWMmhzEsNmnR4G8UuWaanWBAsn0Wl3c/b4iuuVGfbmH9nY+u5UeHoY
	PtUInWOBnTARlDOFXUiLf8xAl84b6+OjipqfWwTYHKAUbqX/tixC+3SY6GrqHuFB++PjBUg4AHJ
	bngzyHrRKA2hKWhhq+PKya96wxeDCoPVbl1gpb8k7AEBgAn+s9XbLTGtJUI0FgCwtr17UyDDz2n
	RfGwnA9YDORBkKj1VTAN8X0gBkmMhOpyhzI6VvITGno7PN8s/fsm+xDNCGAFYTIa1KOlPq429pL
	q9Ptvwum
X-Received: by 2002:a05:6512:691:b0:5a2:beb2:d440 with SMTP id
 2adb3069b0e04-5a2beb2d489mr790442e87.22.1774956414346; Tue, 31 Mar 2026
 04:26:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
 <20260330-orangepi-sd-card-uhs-v5-1-bd853604322d@gmail.com>
 <20260331-eager-kind-civet-62f60a@quoll> <CAPDyKFrafqhNbetL5kOzAFO526yUrJWa6mS_FPX-cw9bj2Mg4Q@mail.gmail.com>
 <1c1b12f2-b305-4341-8269-788fb9e11cdc@kernel.org>
In-Reply-To: <1c1b12f2-b305-4341-8269-788fb9e11cdc@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 31 Mar 2026 13:26:18 +0200
X-Gm-Features: AQROBzCzMHq52lgKp4Q316ICmztzPT5EZmpknBt6jAeduwaEYdNsbbTouxZZ4hE
Message-ID: <CAPDyKFpXq7_UX52zH7MvvYJVdRML=zeWw0p3izG7_EHRA8Te2w@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Mar 2026 at 13:11, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 31/03/2026 12:58, Ulf Hansson wrote:
> >>> +        - default
> >>> +        - state_uhs
> >>
> >> Instead: uhs
> >
> > While I agree that "uhs" would be better, we have tried to stick with
> > "state_uhs" for legacy and consistency reasons with other mmc
> > controllers.
> >
> > No strong opinion though, what do you think?
> >
>
> I missed that it is already present in other places. Is the name coming
> from any other referenced schema like mmc-controller? Does the existing
> common driver code expect state_uhs?

No common schema or binding states that it must be "state_uhs".

It's all described on a per-controller basis, but I was thinking we
should perhaps make it common at some point.

>
> If yes, then go with state_uhs, if not then let's switch to new name.
> Old conventions in the bindings can be changed, we already do many
> things differently than 10 years ago (e.g. no underscores in node and
> property names).

Okay, let's go with solely "uhs" then.

At some point we should make this part of the common mmc-controller
bindings too.

>
> But followup question - the binding is called sdhci, so maybe sdhci
> common schema should be referenced?

Yes, that seems reasonable.

Kind regards
Uffe
