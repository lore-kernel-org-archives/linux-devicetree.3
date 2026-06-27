Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C607A394497
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782555977; cv=pass; b=LYWyqV3FFm1aZnRHvwqmf0At24aJQqyUN0BX3jigmubjzIjtcqPD9BafMH67pDYNIJYikdG0YyWFKp8Ki8OeFPcmqafAyisqOuXtVscXTgmDznjiqkkx8pnte3ehbDzsuJVQ9PJkkmOrHwxLGfV2wQl2zQBR+Xb4ZbYGdPsdMmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782555977; c=relaxed/simple;
	bh=Tyzwc5vQV/Bc9l6Q1lrrqMverf6XUl6aFPZAG6N55h4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VY0Wm+vANjn7kBfQlpZ5p0tk/wMQxpZwiKGL+jZfUz4miss0ilBYOM4DOOC7gGYcwS7gY7tjWjC5O+fqq1IrVm1jOfhiZ6w/XFsZmlnkq0L1jWDKr0db1rqCgcfgShrGUzAvCdtbaqE1Q3t9sdQw3K/5ibnkI6/3YO/kb6KCjTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIDeEt6L; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIDeEt6L"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1226a096a2so184420166b.2
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 03:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782555974; cv=none;
        d=google.com; s=arc-20260327;
        b=nHstLoSSkeRZjRypmOUq0cyDV1fx5wu3YUjQI/WQITPt3TgCYyn2f8W1ugKVMuQgXI
         fG4oUqD6OQwpEy+9dRPDrWhihsYHPtICXA1DlUDermU+L7WUbfyebBTTQH+3EeRwSnEB
         4cocRsisivADHKYYWOzUHJsj1iecUXjoAzLF5KehSYeQkagmuDuCaMLLH4SQ4CGzhWYK
         VNNpN12jO59DbV6vWNEfR6boh4JuPI+zg4ZEnrlqqdpxeYt5xdTuTMrY0rVUD6v5pvWC
         XV8GtFx+D42QLjgEJr+ADpCSNtxynwyKahNAuKEqlaHoUOlCXfxIVvhrNFdeGtrUc7/w
         MrLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dRhdXkzmky4M+xi9zzW6VsYPcQ71AzXk59h10EkBcIU=;
        fh=pTmR2fHCPAtruE79EEAkcCUfKzNbBeYJ7gnnPhnpMTs=;
        b=ZHL7puEvcBqeIX3t5aGMQ6fGcNgFPQcsMNWMWmg8sJQO8rXr/r74giVov2rcIEFz9d
         5cpyAkLHSHbYhClRXdmFl8qxq2newgQDWquLWtUKv2hsBXyqBYh114KzgVTLVB9IUgrR
         uayHm7M8sjWjtvJS38g82+m+aALtyV2bp5hs4xsVxfQGomfagiS4ngsH5XOHKoyMZJJN
         ZPqtSQHajl7L0kdLZypyjOn/7ir6yhza04isyzdCmCN4B0T1gvXOZ1DiOcoYupz79jQj
         qdZjqRX3Oljzw8eNqC3R3/9D5OPOn7JyksjKV3vdzi/Gm9SPjZk0ozuAb1fWoryVwsa9
         Cd3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782555974; x=1783160774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRhdXkzmky4M+xi9zzW6VsYPcQ71AzXk59h10EkBcIU=;
        b=lIDeEt6L6zmwCTms5XMYXhD/cHQZEZUtSaVgKv63MB+5NJYOf9zGHsGy6J/Y7bfDDo
         EO0VN7yuesEuqe9LeO6AiZinepi1Xyqq2d3codOnxPj3cMSGVGFndgZ5a6Ima1Nwh0Wi
         XXYk+mzo+v/Gg1eVGT1C1tlmRDPzGtUyw1HNZDzIF0ZkgCqC6Ds5Mjt992Zi2N2OFFte
         ECG3hgg9VYPRtdai0WG+Q0SCErxtTPZb+qKT4hS55DqSds87JYYn77/yigaA5g8N4nyj
         3nfIbSJCcybXozl/gAjM0bT8StYVVf7EacFvZkFUJaKeE+09W4QySajm5skoFCMXzBrb
         8EgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782555974; x=1783160774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dRhdXkzmky4M+xi9zzW6VsYPcQ71AzXk59h10EkBcIU=;
        b=GTQBpBaJd8KzlObe6/Wt5nMe6XdAZsutZwMB+y+JFk3HkOg7nccpzRznhOK1qEvzyB
         m7ymrn3PCgr5zpRQBxmTLyeCztlFFzsv0zd5zICVBG1g6LYKpmz2FS0J7ZiSZF5BXQgR
         EPwmBXPM6+CNulWL/vMOA/4/c9XFoqRcLusJ2u2M2iPcd4J9hxzMTJzUKUwL9hKsbKhK
         bgbWh7bopRj4Lg3sqbr/ohRF0S1J/071tgxi7h7M+v1NEEgqbaP5u67HuJsdiKx8jPmJ
         6mX6YWYYJn71KABzeCcPj2rYgb9d5rbMb91oTUq4Hx3Px6m3VbwN4QOao3PMOrJKqStg
         m5AQ==
X-Forwarded-Encrypted: i=1; AHgh+RqiO/dPpO4bNKaWFb/AejExnqEvAVGvQawglLD3IhN5HU0PGcoLSyaL7GIORQV/KiQw5Mg8K+tgY3nE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc3k88UubfWCLNcVPiEvCQpqfpxz7Jtj6jVvM4gzGZsTV4MA9s
	cnibx34NoJ+NJiPoUZHhZiG2dt5LnmbJGND550h5q0beEcZe0NPe7x17xa75ryrfoJ3n0G1WRRd
	lwIeuTRNRPbsgBGnLP1s4MRFJJzCvIYo=
X-Gm-Gg: AfdE7cmZU8SUDa2CebJhEmguHpWsqgMdpt8yuhgQlay3TjHJvhyE/YQ1/5pHKXMumoS
	LxGPDZSFnBLuR8a+bWntz1UpHqZQAdTn47HjPAHeONwTdmM0iDJxgTSaLr2pkO05e8JV0xA0+Y4
	5g/Za4VsOUSgy1HN2cBeOtenHqbQ+UxQJ+rTEWilextZKK8MJphczSxsuIumF9rSbQAOhQjQfhR
	H8KOIlP4IkxJPpx3/AKimepqpWx6yPo4uiIBg6zKxHyiqNLv15UhI6qR5FI3koGyMJwEGyS
X-Received: by 2002:a17:907:944b:b0:c12:34cd:8f55 with SMTP id
 a640c23a62f3a-c1234cd90a8mr180840966b.63.1782555973984; Sat, 27 Jun 2026
 03:26:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782439646.git.zhoubinbin@loongson.cn> <71430fcee5951fb7a7d52e2091a87707db85e06c.1782439646.git.zhoubinbin@loongson.cn>
 <20260626-devout-vulture-of-reading-4fbfad@quoll>
In-Reply-To: <20260626-devout-vulture-of-reading-4fbfad@quoll>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 27 Jun 2026 18:26:00 +0800
X-Gm-Features: AVVi8Cch4DTatr5qzfiiR0Q6wMEZ2Lh4BN6_B1AcmWk900bypd0wcNlkm8ktYOk
Message-ID: <CAMpQs4J=0i_kJHE_impCbKJHE8hVqDjNUm-cgkaUF_BsZ3QpUA@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] ASoC: dt-bindings: loongson,ls-audio-card: Add
 ATK-DL2K0300B compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:

Thanks for your review.

On Fri, Jun 26, 2026 at 6:01=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Jun 26, 2026 at 10:27:28AM +0800, Binbin Zhou wrote:
> > Add new compatible for the ATK-DL2K0300B development board based on
> > Loongson-2K0300.
> >
> > Unlike others, this board features GPIO-controlled headphone detection,
> > headphone control, and speaker enable.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../sound/loongson,ls-audio-card.yaml         | 38 +++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-=
card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.=
yaml
> > index 8c214e5d04b1..dc7f4afbb777 100644
> > --- a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.ya=
ml
> > +++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.ya=
ml
> > @@ -23,6 +23,7 @@ properties:
> >      enum:
> >        - loongson,ls-audio-card  # Loongson-2K1000/Loongson-2K2000/LS7A
> >        - loongson,ls2k0300-forever-pi-audio-card # CTCISZ Forever Pi
> > +      - loongson,ls2k0300-dl2k0300b-audio-card # ATK-DL2K0300B
> >
> >    mclk-fs:
> >      $ref: simple-card.yaml#/definitions/mclk-fs
> > @@ -47,6 +48,18 @@ properties:
> >      required:
> >        - sound-dai
> >
> > +  spkr-en-gpios:
> > +    maxItems: 1
> > +    description: The GPIO that enables the speakers
> > +
> > +  hp-ctl-gpios:
> > +    maxItems: 1
> > +    description: The GPIO that control the headphones
> > +
> > +  hp-det-gpios:
> > +    maxItems: 1
> > +    description: The GPIO that detect headphones are plugged in
> > +
>
> Add allOf:if:then: block after "required:" block and disallow these
> ("...: false") for other variants.

OK, I will add if:then block as follow:

@@ -68,6 +68,18 @@ required:

 unevaluatedProperties: false

+if:
+  properties:
+    compatible:
+      contains:
+        const: loongson,ls2k0300-dl2k0300b-audio-card
+
+then:
+  required:
+    - spkr-en-gpios
+    - hp-ctl-gpios
+    - hp-det-gpios
+
 examples:
   - |
     sound

>
> If these stay, because I have doubts. spkr-en-gpios sounds like
> enable-gpios of each speaker, so not suitable here but should go to
> individual speaker codec nodes.

Speaker codec? Sorry, I=E2=80=99m not quite sure what you mean. `speaker` a=
nd
`headphone` are routing options for the same codec (es8328), and they
are mutually exclusive. Of course, based on the current design, there
aren=E2=80=99t multiple `speakers`.

Also, these three GPIOs are on the CPU side. Is it reasonable to place
them in the `machine` node?

>
> Best regards,
> Krzysztof
>

--=20
Thanks.
Binbin
