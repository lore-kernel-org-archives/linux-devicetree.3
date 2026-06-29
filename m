Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9EF1B86C7
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707753; cv=pass; b=nsopPOY+QADAM0SwCZMgGRzh0yBxoTyGrV0RH/bNcwlv9LzFefwEJuq4DnkJVzVcgARbZH/73+4w0BzxDrZOwS7cKeGwywWNxe/36DQUkcMDhKlh5Qm3qZ8i6fZRN4X7P9qfS7pjESE5Eb9v4nYWorY07GLPWjcEMpXY7hZj764=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707753; c=relaxed/simple;
	bh=2muzAUWj5D/JqlkRo9dFGKRFyLdNfyC5bWBard2rmAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3w0gjPTOcsfmhfUuN37y6wo+nzVixsR+Slh+Mzg5r8Mq3KoGviBLXtGuD3NArI12BFaSNrXkcHZxMDfGX5ui3B5v0PaSfGc9lt4NQLSMFeKKaAZDbNbocl3ZKrHsCOWDKkuZc0uzBh6/dCJJ0xb/5c7AInLJiX4ItC+ZEnQ/vQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cke7R4uC; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cke7R4uC"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-697e96dd8d2so4511130a12.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 21:35:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782707749; cv=none;
        d=google.com; s=arc-20260327;
        b=DHp/hDCYfMYZ+3SSIFH/zbpCBhb4EY2+8Z7rdfwOpNtlTMxmMOLMCg1krdWi8VTLTO
         jwGyv5N9+LZFNUb2v1vmzoQVHty9tu/6N6LX99WbCwSEdtQDEo61gwZEvLxZe3INq2JQ
         wGAm1TkXv/Wc0zk2Xkk0Sv5+yigFelRMamsM0mlETl+KnrFlVpN73jyRZf0VEKIkW7N2
         R3ww4xbfbBUS00kRb5qI/5O6KtjCxcG9Fdh/H1033aCqDNAkGd2fT+pRXjo9KH5kd91O
         AaDxuWopu//27n4C24jXp1NkVXo3g439l/t4msDeQQfoBTpgctq2gYBAvElPNo9iWGGG
         AqoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R9/v7FkvKXdZj0GFin7tsYJbb7xrv9WwRRAkYYJomJc=;
        fh=tFd9jbQQvSVrnBd2NxmP2mZrg4XoLvovGf+RpX/U/CA=;
        b=RUN/MSCQjpQQ+/T3b16LnSH+Q9QastoaggYK87Yw6y2vvRa8+kYr93e5jApSIyojYK
         5vPXk9DCJgZhky/Djtwy6JN5+6EZWn6GcD4RzA9xLh9J/JIVyuB8UWxcRpfZm4TSxjSc
         mlFbDxw3MXz7j8912euroBFHam9p6wFhHMbEUOZK+g3x6v4kibBp5SPJRo4PQAx7aY1a
         x6YSNvvRriWbgz/52tspi8RZGLu2iwKIIBZyLAsHxkJyosL/YBk2GfLlRvvsUsQSn1DP
         5x5Tk8X8sE9NuOW4RmlKFq5ZCxwaotOhZS1/TYrgS2OOvpOBX+GHlb6qei8KaFXbLBY7
         x6fQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782707749; x=1783312549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9/v7FkvKXdZj0GFin7tsYJbb7xrv9WwRRAkYYJomJc=;
        b=Cke7R4uCG1vhbqBjXCjc/v4EXI4YMpkpKD0y0w4636tspXObYBtpGlC4aBEe2m1PSR
         0z9gMrmgV1B/4hDQiOKyWVEanoxXOGL/TvSU43KeTXaQeHR34s+aJU+kFZkm1CJ6S1Mr
         KN32YdmtjNVD5lMlvE/xhK2kERmVNDFwLLXzRp3M5XXaTU84yysbLbCDb+bzJrGDAQ3q
         5+RpC4loJzXCXg7Qqk91hkC53ozjXgk6a+XEG4zufxSx7Mmqc3VpAVGsttV7DqEJlRpz
         gFEF36PlCXP6LH7S6kwwuh+NhlC+JqDv6cS4ZH3zU3v31Y2s/I43NeJq/0b5KfnIemzf
         KbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782707749; x=1783312549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R9/v7FkvKXdZj0GFin7tsYJbb7xrv9WwRRAkYYJomJc=;
        b=OKWGq6zQy+bhEkQxmMlTt1UUpGahkxHK/+XjUGr+yyXKKSOqPmjl8e3PCI2CouNNWt
         MGRNZLAqLO8rLIozMiMmHfGJO0p13v6c5MdHZT/I+sVXxDkfhO2mWLsInb0QhXCDze4k
         jcaMQQsZvBQFoW3r4snZ9YZxqrLt7MzYaAscm56OZGxY1Z4qgHKWpvPisc/+m+lZFt6v
         w4CPBV/x5B6VUrso54hVpHFJC2mlNflJ8HHR5Z7iQLkKzgVhP0uHpiDrqhaIU6huC75s
         sO3L+zmMgsyUnM927RQ/Br2Rn3HkVVgQfH2tjnZZRlk5wF1bAqM1fHyHqg/OLcM0G+zc
         jSDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrvUbbC22ITT+PrPKEV9BxQRWywntyn9EM8Qd6VfRtmD/qZ6UCobmpHs49eagiRrr7w7fUVsvvESduU@vger.kernel.org
X-Gm-Message-State: AOJu0YzV1XES4kav+zf5TPggufxEcIldaEwU2ctnjgsmglb/NsMh0uxG
	vNqIPR+kH3aSVGh20k2c267i8JT0Vt3cyC5VhFbj2OXJ11RFwAfw7cqsQN4KPtWj5t/848t5HE5
	FAegojlYBR642JQYyeUeL2dHJnR79QG8=
X-Gm-Gg: AfdE7cnH88q/vYgqoMEVc87C1cQNGeobruK594rheCyHLoVoiKnNBs8mFwt2a3M5Cig
	fZt95c9ZDS6E6nnBb1bJjHk2swtkHhCeLpF1d4qDjVXMQeprUbazGeWNuArt4qfs3ABDym7zj65
	apuYEQ1vnkwSMQcwArQ3v2qryLQo26EpW8jxogcYLMTdZ4xVcfShibakXzsqLn5vyB8zQJzHdxx
	E4zV9pBkcdE/9XS8nyjJsOA4nOvI0LfHGEiMmLh50BTs6Lm6gSIOWtV5HXovDsONEXyrpx1Uuqy
	B/7FcxN/aQ==
X-Received: by 2002:a17:906:9c86:b0:c12:3bce:c3c4 with SMTP id
 a640c23a62f3a-c123bcecceemr304395966b.3.1782707748954; Sun, 28 Jun 2026
 21:35:48 -0700 (PDT)
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
Date: Mon, 29 Jun 2026 12:35:37 +0800
X-Gm-Features: AVVi8Cc7WMGsN5EZIx98cF3b5b5_LIlSupnHTYu_LzUQSZvj-OZPI5GWvv7BNrU
Message-ID: <CAMpQs4LJkaLOPyiATEdEqFNNooUue7j6uJfCA68f0TF1=Qp2fQ@mail.gmail.com>
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

Sorry, the `allOf:if:then` block in the previous email was incomplete.
It has been corrected as follows:

@@ -55,6 +68,24 @@ required:

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
+else:
+  properties:
+    spkr-en-gpios: false
+    hp-ctl-gpios: false
+    hp-det-gpios: false
+
 examples:
   - |
     sound {

>
> If these stay, because I have doubts. spkr-en-gpios sounds like
> enable-gpios of each speaker, so not suitable here but should go to
> individual speaker codec nodes.

About this, please refer to the previous email.
>
> Best regards,
> Krzysztof
>

--
Thanks.
Binbin
