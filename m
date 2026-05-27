Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC5435E1DA
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779872107; cv=pass; b=q2vjjdKl3rrs+tSdpcQzlVkqK5RwXKUmhzcGdDDUMXihhqLGYsZlyoEL6ngr9mYyc3dyxK3V/X/blF7UxPnV9h38ZAc5Y5gWNr45XyvG9iKb2fcR6tvYNkPFMTVsd3ExurbX0eGNj4EsVfF2zy4lTC1n/XmEMrVP2MN6EDQs+7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779872107; c=relaxed/simple;
	bh=k/rf0sprghjpMIgMuOwadzixiyngqMOQ9ESziPobPSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G4h6dLD9Xbslg++VXBIwyyo0r1jQeDRHh1CVae+rrpPUAFGKFFxXEQFvkX6tvT7R4vxOJTymeZqx7SJhZw7E0hH6gmMxSNAGwcLiZ66f6BkKvrOfubAqbCRxbP9n7WHaeZihij/edeiwk7+WBx245zeNokQdBg1scP9xwX/rHyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abSVkwtP; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abSVkwtP"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f30a4601bbso11719225eec.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 01:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779872102; cv=none;
        d=google.com; s=arc-20240605;
        b=V5yrYRsr9i7CXRkp9yBSTnz0sjICE5HkOuJAbsgwVD6vuMae3T3+ZRq+Ga5etMsiuA
         iEBsWDOfgIYCeGx9dtHGeezxuWdyoR11J74oxb8+Ys40QNDGeWOKijiO6o5BNjy/ArmP
         snnYLJVVBkDDGbXRCzfcOWwCBPGeZxP04oHpdR/MKtJkW+6rx56RjnDahaMZjHx3LL5c
         6UrAv5cQz17SD0br9NLhrzxlzWCOd+6g6nPk6awpogs8Xf7V/Xj0wLjBjgo17wVzg00e
         y7GeIs+wlNCfTsm2Y4JB+9wAcASf8aMrmO+/2omvw5AIjSkAgfI8Ffq1NfEgp6w/PfcU
         iO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6QWsDCHfCMtM5YM23243b0CJRuPJzWBKJSsV9LUzw/c=;
        fh=6t9Ww1uB2X+GApSP9YV8l78dp/BMWa5sbquj9kip+Qg=;
        b=f3851GtnAoePIvdr/hrSD0ezy/vIUPGlAoVeBxQ6Accgf+C/x+l2OskIZVV2oqapdN
         ALxjz9lX5QA6A43PvwXj1PA6qwpCXnba71HG5M2cfps7XBEXL5E5uHLgIH1rRRzNvWKt
         LS37hQnjgZEl1WcDU0cIpDKofQIApiVuAVAU+MPsXf1Onijuo/4RJmwHb67lHfD8h2OP
         4ZpflzFibgcIBk2JyKCYF1EArqg2bzTl2OGIa3dWr+w+8YfIyfoyTmUADQfT16VqbGDY
         nM7CFR9o+YjJ/22ttLaFoJUdoh51cvz5vSWkFuRClnMGcq+0uwfbGj8sWus41FUhZEMv
         PcwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779872102; x=1780476902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QWsDCHfCMtM5YM23243b0CJRuPJzWBKJSsV9LUzw/c=;
        b=abSVkwtP9wfSyoCEFQTaTLLXaJuBuxo0YqIZ8bg78Xkb/MSaQ3RvlSj/uG4OmLNnBp
         1qtrzlAhk7T6vrl5F4KBnooy3QUt5VzMaTPn7wEKWcxgyIw2kinnlSxSek7cmZhCHa5d
         M5Ut2V121RytsTy/joiG6E2tyE732AwsyMaR8C/l/M9OukLXesPNd//ANFOCZxjOsybf
         VMyi0pVgtiMPaPjoAITpYYcQbWOYVShdWAs0Fzm0/rbErKpPDQrw6udpgBBTqOD345RR
         H0zZ9Og3dKHUZJji49HqMo4xPF3+G/r0ONojOvpaNWqtDTmpjipGrDGskJdx9swiDoUq
         y9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779872102; x=1780476902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6QWsDCHfCMtM5YM23243b0CJRuPJzWBKJSsV9LUzw/c=;
        b=JCpX3pMbgRroJl93FmJn40PX0eqHHISEEAMsC81pHs6e5fvG964bJGZ2oQsZtw61gS
         bt606728f938kaoY2WoY8pGRQIn5HczA4XZjGj689w+Rdq00zhZyFla0jULUwN5C5m9y
         sAdKiG1Z7YLFlxDVg7gwk31ZKIIA7umk4Knp/C5/Ev/fBKuEjHOuNSYY4RI9rehm/Kjk
         HA4+hOSGSFtFctLnH5GIjLG5w8NTf4OaL72bPUTuJrHWM9asnlF0JfOMaBVrGBknxg5g
         haHlvU+viPnjDQRkxijX7t3DYOmnQyd3uUv2ANE0QMBHfo6apxYacP2iI1pMzw3csXkB
         9hvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6JmQNB69n4HtV2wTKYIJIeKLmLRIcbhpPUjxnEzaxg80e/rnMkxBp/BmPQSHhHTp1PgM71vdDhmo/@vger.kernel.org
X-Gm-Message-State: AOJu0YyDimq1oh2M3tXKj6yrPvuhouVvoW9y0oSrVetpQxxM4zcRySXA
	w2cwJSuZQyocuvMkt76ZdCqkWYeekv73+vRm+EDwmmfA0s6/gDakFF7+NvHpcxt/ss4F9PfeoUY
	PL1LWGAk1s4O+YPugj008Vzi0zeL5Dus=
X-Gm-Gg: Acq92OHcDqHtfN9Fc+Bwdhph6ouwy+11mGB0IzCwZLsCQ52qz1mhR0F1eK1cQ/S2hXr
	0YGhob8vZhxTaWw7XA7EHd3bXxfWZI06fY21YEg6eJ4UyQVV6TcHLaj8WUTlKLmCKb4QOE3bRVM
	Uhsd6YRnsnbe/w4xFYj8w8gCfeqIsVETNIrFDgAle/grXCi5GJ8hhuIL/CZSvnisZiKcJp6ecwC
	rJJkD/u5QOermJ7yePHGszpmEZ7IU+kDUJKWsmXHoMfKGndgv6rxD9VNae4XH5DUvxpkGV6Sjwn
	mFErY7tqb3BaNECKuU4=
X-Received: by 2002:a05:7301:d0f:b0:2ea:ed70:3ea8 with SMTP id
 5a478bee46e88-304490f574fmr9265322eec.29.1779872102437; Wed, 27 May 2026
 01:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523084408.50346-1-clamor95@gmail.com> <20260523084408.50346-2-clamor95@gmail.com>
 <d28799ba-a4af-49b8-a437-3e7b54ed06b8@kernel.org>
In-Reply-To: <d28799ba-a4af-49b8-a437-3e7b54ed06b8@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 27 May 2026 11:54:51 +0300
X-Gm-Features: AVHnY4JaYaiHwPLUWc19UBdX6yuMZEQ5-2cdxAvjMlSZR4fbv5UKlVc_P1AsxYk
Message-ID: <CAPVz0n0wzSkMjbkgy3nveYobruuDnV_Dm1A4gRQ6XOm6dTOrNg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: net: Document Infineon/Intel XMM6260 modem
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 27 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:2=
3 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 23/05/2026 10:44, Svyatoslav Ryhel wrote:
> > Describe the Infineon/Intel XMM6260, a 3G-focused, slim modem platform
> > designed for smartphones, data cards, and Machine-to-Machine (M2M)
> > applications.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  .../bindings/net/infineon,xmm6260.yaml        | 74 +++++++++++++++++++
> >  1 file changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/infineon,xmm6=
260.yaml
>
> Considering that you just sent "power sequencing" device completely
> independent of this, I think my review tag should be dropped because
> this is incomplete. Basically you will be changing this and maybe even
> in backwards incompatible way, thus this should not be accepted in
> current form.
>
> Best regards,
> Krzysztof

Noted
