Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0A7302140
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 01:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780622739; cv=pass; b=Titrq3Sdr3SGalnsjpuI1FDMX/VkClE1usGdECo47hDjNq0/FLFmR2Wx8NO3y4psDQG885RWLJjS079vvtlSU519jKlYR2hcMMgs7BerGbazu8iOBeIDrB+1ZMc5fnMPuZied5/Yjd3Tfln3V5FhNOn4rOHn9uGiaaWtxhK0eko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780622739; c=relaxed/simple;
	bh=yR9iPHQ7X1yMgWZrkr31stdQCeajq3KhlcULNx8kfWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7RmabVQL6TxxHLukngepa/MxnIpl9LTep7c/tIPK3Cs3CH6Ea4bHDGt/8EU0ZBvani+NuX3e70KpwHyx/J1yEGckrkv/rIc6NMiTIx/ERMRTRDDtkL2sZ8gfKWmBcZnKt4SCOWfUYpZCVCbnuSSkil67exEbHOq7CU/Cl9YPfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTcP9kYO; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTcP9kYO"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bdb3fd39045so170607566b.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 18:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780622730; cv=none;
        d=google.com; s=arc-20240605;
        b=kr5FbPUkiZsVanJfyOoMA/sNyMLGoOm2FdGHw89OkatA+V1PZrtykuI9HZ+K9bqWxN
         dbFDtwpx/Fy/JdaLiL8haJIylER0Valu7PVyftSwaH2jb3aVdJCkHS8CgSFLMRp+2ijg
         rW4IzsMAG89eidl658nlpYsr1thJxdZCtw+V7vhp336r8AA5wVJKVYmUp1pqZKP2FxdE
         5/oCdAXwgjSVEseeetAVzEiRJKUR+zqzAUC5TSKxX/+L/vjyD6RIfo2kvEvga/fdQVVH
         z1Ul648cwwo3uPnkj6OJhLkUluiKA4jNaPw/MEkn/7jQv3Gk+xJ1rCJVHFyJC8uwcx0m
         ehLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uokzk4V1WQNqzax8rM0zN70J5L37rNbhenhyeHDxJfg=;
        fh=/k3le+rzCmDlqvGIOikQmNkYlAWLgFySJmthbc841vU=;
        b=FB4P8QikxVUfSKiV4E9nMpwj7q86j/dBZnFp3qwaX8qy8S4iNB6GfFfhZQn1IY2HjX
         F+3JrXmSvzQCsVLlo9/EQMoobHMJ0+Y9i4yx+quT5XXNgmdfIfY52EW89r1Ucyt5s5OG
         pq3qVeBjc2umfdNfqGCXYH8mZLwjibyQfR2JcLghffL4pNKHpwbjutLFUWaMxUOhVXw9
         0lzHfnSopu36GC6CLqXOTCFHwiGspkRXTSlR6AHtljkaVy9B1hpiZ2fo38TR3soEmRes
         xmcGjstU+htvONnCBm7tPDeMbmcLeZTSoFajazEAg6Ym2Jmru8j4DAugreIP4fyVOfMp
         oXlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780622730; x=1781227530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uokzk4V1WQNqzax8rM0zN70J5L37rNbhenhyeHDxJfg=;
        b=sTcP9kYOPITvC2aSMeL/A9u1ZAavHkIf2RkdQAOBE2XIxeBSy12dd/GkbiBLReZt1J
         3q+hpfwTv2bNGD+xekHUE6w65STeu5r/ZeCVhAjFB2BLzGUWZnIIeWmWnJo02LK9XX3Z
         Q47gjpO/Dz/u4r2xjf8iWuSEHWPrXoWOFe1smUD8rABQbXCKrNrZR5rbyDDjlry+/iwp
         Dzb6cOx6qGTtswmpJlxPX03sbt7opfuVS1BCjWsUL/bv8PAGm3YVAZd4hP5sLas6FVEP
         QzY9FatsIgCSChyombaaXZOabcviM7bsC/vdaXzc39BRqrWRZUykXy6aD/fBfUVxoKKG
         PniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780622730; x=1781227530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uokzk4V1WQNqzax8rM0zN70J5L37rNbhenhyeHDxJfg=;
        b=TbdULnUtsBw/tu7AUTlQadBgkl3qqDQJOlzddZ/O5clYIkWDK/8/CYDrVbLFuiW3pk
         8/79AUOC/UHgaZiDnrM95mF5SMx5xoB3ZFQ9UxjFeodRxuzcuvmtwPzaomUM9K2Besl2
         pny7p6FrG0xnV6k3EZkmwgpZQ0T9gb0wdoulsufHlEJSUTb9td/lvVHR3GX46yn3O8WP
         d1c89f7PWinqMUXm/uu9YpQMynwfna5hLqbJPFtvTqI8lfNcNZF28EvyMic79ZKUih7M
         2ywH+uIn4vxNPmg8q9vSe0knq3tZGxeRXoVlBk6Xsi6Kl8Nmqs0G0mwV3QYo6NpOvZjP
         O3lQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xwH6Va2atKlwPZXCns789Cd9BfeionPP/9GRSdFoaT8e13wPQd+EEXbrz9Mn3Rb0OtFxmB+CcPOmU@vger.kernel.org
X-Gm-Message-State: AOJu0YyuU9r3wiWjQdHodQX3UO3IhIH6VHjq0ikoRAF5bS5k0o6FtAC8
	4ftwarcg9b82JBgZRNI85UhfM0NEAPxVWAsuDh1hHcAm+T5pU3FuZSTCSz9iPpsvXeTcr4Su19O
	5342gUpKRxNvUmS+8tLq9YQ6/fYgYc9M=
X-Gm-Gg: Acq92OG2Qu67JlsGQIAM1Nzxk8YPlTVsIlpSkRX7Z3lIXba2ET+HS9OBNups9YP6PD6
	/3BopkSbhFsfUW2CBQTZJ1HvcaWkQ00KH9K40SLNUH9WfJILO1U1AtnTeaRbp4kefVjcojyfDrs
	1QUOvyhlga8E+mTqmUf5kuXPdEig3t8iHpFZtwbh2kcel3f4OBwvR1vhQvEsP4ClwjGLj+wqx0u
	BNtZfrHYq05Ut5VNHg10SUZLVshhNX2x4CwH+m3ymdqspCcIC0f+MghxkCSne2EUTcZ2+wG8kYI
	VOZRxK/eO32J3+KLdx//
X-Received: by 2002:a17:907:dac:b0:baa:6847:af9 with SMTP id
 a640c23a62f3a-bf37234c8c5mr52264866b.28.1780622729733; Thu, 04 Jun 2026
 18:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780538113.git.zhoubinbin@loongson.cn> <2736a44ee11bcc0bbf282c69e99cb05b12469207.1780538113.git.zhoubinbin@loongson.cn>
 <bae028cd-c77b-4238-8b62-330a1c3c46ed@sirena.org.uk>
In-Reply-To: <bae028cd-c77b-4238-8b62-330a1c3c46ed@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 5 Jun 2026 09:25:17 +0800
X-Gm-Features: AVVi8CfdW5IUTOMPP78y2fnXmkP4Q2-oxn8x6qdRtekrt5cj2B0jDWhtd_sOa5w
Message-ID: <CAMpQs4LCQmp1-Rw6W0jf=h9Rub1iK8BYCYi_jhB7updSKMfCSA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] ASoC: loongson: Add headphone jack detection and
 DAPM routing
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

Thanks for your reply.

On Thu, Jun 4, 2026 at 10:56=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Jun 04, 2026 at 10:11:47AM +0800, Binbin Zhou wrote:
>
> > +     ret =3D snd_soc_of_parse_audio_routing(card, "audio-routing");
> > +     if (ret)
> > +             dev_warn(dev, "Unable to parse routing\n");
>
> The routing is optional in the schema but the helper will return an
> error if it's missing AFAICT (the of_property_count_strings() won't find
> the property).  I'm wondering if it makes more sense to have the check
> for a missing property here or in the helper...

Yes, I noticed that too.

In the next version, I'll add an `add_dapm_routes` field to `struct
loongson_card_config` to indicate whether `dapm_routes` needs to be
parsed, in order to avoid unnecessary warning output.

Also, since the newly added parsing items only apply to FDT, I=E2=80=99ll m=
ove
them to `loongson_card_parse_of()` as well, which should make the code
clearer.

--=20
Thanks.
Binbin
