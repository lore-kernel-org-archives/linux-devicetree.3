Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B093CD8C2
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840434; cv=pass; b=PHI49BNFScJwPmpgTLswalUXqy41XBep/a6LKIPHIS5JROYHpGa6IH536cIZQBTa9BWjiwOfO0P3AvwRm+MMi36lGS4YsRVxIqeT2bVpUgX1AVF5W1eTcymjXJKsm/jLt/tEwgDaqctwhJh3fH5eJxi2y4vWBgunb7g8mqRdZCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840434; c=relaxed/simple;
	bh=GzrjWv00pV8g6pjr5FIMQp5/COnJUdT5thugdZxFpFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YRwfyN3+3Q1HpZawNmZL7JTDp+vADTbTpOohEOayg5rBirqbO9r5veVpWsF31bRJ/VaxmSmgy5SX3OR8N5q/XGsJzaxxhtfC1XkikdcdeEne1oLzVpJPh+/xhddtvXu3zMi/5RiVtzdic8NpUPRqOU39OwMIHpcqMBhWJFtvZMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSZ9Vt1n; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSZ9Vt1n"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-367d88b9940so4973544a91.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778840433; cv=none;
        d=google.com; s=arc-20240605;
        b=S+7w2EgRGmKn994RsnJGvK0XEqU3mPimZLzh58gKx6rFbfPHHmxfHH01zMQjVmpfPb
         YjCZvUVXYaRLiX85r5lgkdSWaSuA9En94FDeBGmTvqLXlR7oLHJ8pPFQLj5mT7HWJVza
         xpp81nR5gAaGxW2A+bLNUOdQXkaCbVbXLwtH8FpfRzIf6AW9aN6NdVkxOp8hcWezOrpc
         s8tcVVSfNL4vqqF94yh4uCgyykyjLs3D/IP9tkcGa6gTry4s2tQTdghRulydBtaCvaXo
         jyLuGmdojqdXe1yq0EnlrRMQPJ04vvRZ2ptr1r2WbuDZLmKyPEoN3B3oxzZnv3uZGauw
         LD1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qw/k/s3Ldfl3EGSjsI6RZyS2GOUqWyHf5cmK/4bjNdE=;
        fh=cLR/EHyE2xR8vpf9oyXbB/0f/vwy7AP6gLQh0uVBj7Y=;
        b=XPaV2OeBwOMIWmq8AiPMoVc8XYglK6lLTOc2tDl3f2NJA0WU/RugGBQZzfYsCB0mHs
         kID9OXz3rjl/yAIwOJixUsM2P0R+HNRAnyseyW7f6FeQ9nv1KMC1+QjTX8mN+RnYmbK9
         SpS6UGfBFlDJUNa3WECymXrgYdPV6sWiS6bu7+dtlVWNdkwwU/20hqeZPji0iu0387ZH
         jMzBhDSI+X3NxCVYHj4dd7zJ9/YVUk9fFRVWF1tmeX5T7m9ocOPexsquZRrwVq8UQvJZ
         egubb+fg13hVLx1CilqCHJlHb3ktj0DnEHif/kVzCTXThRZCzlavEEx/LaqVcStBotKk
         vBQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778840433; x=1779445233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qw/k/s3Ldfl3EGSjsI6RZyS2GOUqWyHf5cmK/4bjNdE=;
        b=jSZ9Vt1nguhgjqU41EKiXWmik5wjP5Ua9CGnLSMQPmRYyWHABatzlnrdGzbMcyWZ3K
         wGcAZjZLBkcJHPvJKAQq0zsGFfM3A38mZq112WfkOmNM+zc2zmIJ7wdPICVI/Go701nP
         tuyqY2g7W2UWRRAv6DQq/DQeLJd4eOTQ0I2RKkx8QcYfabeC4p/elDg9BJjlFEim9Q+S
         +jLwzrXgCn8ykQJywAl+sRg3gSHxrZmBmZtKAah1DAyJbzvBFNNhk0lCgBpg3m3Wmlf1
         X0AnEULfdcYs6uydjezJMDbicGJPBF7pcgd1ttbWCQUkJMstOSHmWt5f2bdXTxgBFrEu
         ZEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840433; x=1779445233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qw/k/s3Ldfl3EGSjsI6RZyS2GOUqWyHf5cmK/4bjNdE=;
        b=jWb78NmxtGJp4VrfRROEoA9DGEA9LuX/FzUJR7C+DqflshJydtIaILEammc89gftN1
         l/5SjurjkyWTuYdTMQmWJdbyKStGlQtXm2rNRpksir/zpRcvUfeSRKH8yLx2yij9+cvW
         Q56tEOBy5TDrEoya8qzDfwE525+FbaZ1oBYep0Lm2j9QrKCjNv3gsFkQstf3EPZfHNZW
         jyvwGnt4Dtv+lB4NzaoszA2AceO//tWXcUo6g9qdeTy9LueMh/Gd9YStLat+0ICA+ieh
         5I0AxYb3bWVHe1vwJr4CgoDleVonuGSekTYoo8KwOnMrLLMG0kU8lcNgSOFE43QzcSYZ
         PYog==
X-Forwarded-Encrypted: i=1; AFNElJ+ss4oo2BJKxoHt8/XpOlF5ae/DKsvzE7M/+GK28hlYNea9l/2Ej3Q0To6faeiZEC7Fjt9X9Ol3ScJQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw72Sbfyeg7fA6w0WKo6Bq0D1uoWxDvUDyxhz2LCg1JVNlGvss4
	zbCuPuMsZkr0lcMFVeAkxJkRPaqiPM82CHImL5owgrxQOu8MULMSG5SuV8vZd1iozEiRUHVyPBK
	zhHYDxl7cH/aw8LdOvMXpPZKeFt4irZA=
X-Gm-Gg: Acq92OF7suWg6EmQd8tIdU6ZwY0UsYR8m5DcAgAD1sKNBFqm0UbUV7jM5eNr9e16uXX
	Rrrd9FYfsMt8VdlwMxf5b/HKzfetNhDZYUcocDlDHKlBr/+8UaX9ApAri95DnqMFnMJCVlANQZv
	SUktMfCS5FgWTUhOVFQ35+0jiLgNc4C+df1CRJEh2JFI6cYXOKF3E2ViVjIW0tS3QHjL6WbnpgC
	rcdArYVYfcFmWXXYDQsL7t1NhFqdUaQNn8oGiqjz6jcvobumTAhM+x28J/y26cT4d7MBpey3aMn
	lcHAZZtamYjkJUUZindESSTH17F5BordzR5WFQ==
X-Received: by 2002:a17:90b:4e86:b0:366:527:3c9a with SMTP id
 98e67ed59e1d1-36951b70055mr3660995a91.15.1778840432444; Fri, 15 May 2026
 03:20:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-2-phucduc.bui@gmail.com> <20260515-transparent-calculating-ocelot-bdec04@quoll>
In-Reply-To: <20260515-transparent-calculating-ocelot-bdec04@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 15 May 2026 17:20:20 +0700
X-Gm-Features: AVHnY4Lh5KBPxyvblSfmA-i77za6m-1v7JQnCckex2TWg9DTYm8lzeb1pEDNacw
Message-ID: <CAABR9nG2YFq2kNsXbCe-7XUNJT94rUMBz6hruC97aE6JFSP9CA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, 
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	magnus.damm@gmail.com, perex@perex.cz, robh@kernel.org, tiwai@suse.com, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Fri, May 15, 2026 at 1:46=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> > The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled befo=
re
> > accessing its registers. Without this clock, any register access leads =
to
>
> But why are you adding all these clocks to sh73a0 as well?
>

The FSI IP and its clock management seem to be architecturally identical be=
tween
these two SoCs. For instance, both sh73a0 and r8a7740 use the exact same
register address 0xe6150084 for the SPU DIV6 clock control. Therefore,
it's highly
likely they share the same bus dependency for register access.

If there are further doubts regarding the sh73a0 internal bus topology, per=
haps
@Geert Uytterhoeven could kindly double-check if this SPU bridge clock
dependency also applies to sh73a0 as it does for r8a7740?



> >   - CPG DIV6 clocks (icka/b) as functional clock parents.
>
> You do not need to add parents of clocks.
>

I see your point. I will update the description to list icka/b simply as
'functional clocks' instead of 'parents', as their hierarchy is already
handled by the clock provider.



> >   - FSI internal dividers (diva/b) for audio clock generation.
>
> Internal dividers do not have representation. They are internal.

I see your point. What I intended to describe was the internal divider
configuration for Port A/B within the FSIDIV block, not separate clock
representations in CCF.
I will rephrase this as:
DIVA/DIVB divider settings used for audio clock generation.

In v1, I brought up this FSIDIV topic with Morimoto and Geert.

>> By the way, I=E2=80=99d like to discuss the fsidiv clock handling.
>> In the legacy implementation, it was handled here:
>> https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/sh/clk/cpg.c.
>> Currently, this has not been ported to the Common Clock Framework (CCF) =
for
>>R8A7740, and it resides in a different register range from the core CPG.
>>For v2, would you prefer that I implement a small clock provider for
>> fsidiv within
>>the FSI driver, or should it be added under drivers/clk/renesas/?

> I think it should be under drivers/clk/renesas, but Geert ?

However, I haven't heard back from Geert yet.

> This cannot be flexible.
>
> > +        - fck  # Main FSI module clock
> > +        - spu  # optional SPU bus/bridge clock
> > +        - icka # optional CPG DIV6 functional clocks for FSI port A
> > +        - ickb # optional CPG DIV6 functional clocks for FSI port B
> > +        - diva # optional Internal FSI dividers for port A used for au=
dio clock generation
> > +        - divb # optional Internal FSI dividers for port B used for au=
dio clock generation
> > +        - xcka # optional External clock inputs for FSI port A provide=
d by the board
> > +        - xckb # optional External clock inputs for FSI port B provide=
d by the board

There is also an ongoing discussion about how strict/flexible
the DT clock constraints should be for FSI in this thread:
https://lore.kernel.org/all/CAABR9nEhOTz1-0NmCMTbz=3D-+782Pto0yovSQhBXrXqhL=
wMg80Q@mail.gmail.com/

Geert and Rob have already shared some opinions there,
so it may be useful to continue the discussion in that thread as well.

Best Regard,
Phuc
