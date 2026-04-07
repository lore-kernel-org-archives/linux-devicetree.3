Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C120938C403
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775552725; cv=pass; b=hfYNKhDQ3B971I7Nrt9DJNJVmgNnJhsqC4s+Ww1s0CN2Prlbxlc5j1FEAlTx7xToLzebYWON7dB9aidKCutiLBhWEEu9JVXmDkV6A/9LSuqRVrZ5EM/XKZVlueQ48Kh/fGjBiU5UvB/3uDxsLoRf0OiWSNWv9O2EyKnvFxcHfXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775552725; c=relaxed/simple;
	bh=51jVgx6lcnTYWEWgQHPrvlsGuFNQGtkiYHPeQ/gJNno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpSKy3kJmarVuuSlcfF9JopNETuMJB4rVdTWVmjX9jja13+tSH3CXM76g9XHBAU8fvk7v9p76FYa+dnajgk64a64+MiOSJX8RMjJiz+l09vaXLqd9jwXWIme+W625JwBFlaI8J2vNb5Ty7TSv0zA//G2oENgoG9GG9hRod9XXig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGzPs7Yl; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGzPs7Yl"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4094b31a037so3411411fac.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 02:05:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775552723; cv=none;
        d=google.com; s=arc-20240605;
        b=KtGq6iVBJs1gq2Ze6dGxcDmUDH/18CQ+EQQTwmCzCCjZiuSR3voYhpamuiWBo3h+b7
         Bm+YjiDvR70CrJMLXrxdz5F7IaIxYsDuo3vrRPwIbCxsYO/lIyHuOzdD6gOzN5b9a1hd
         SzGjHMsEEom6/EXfexS0T7KkSGFNFqwh2jyUcR/iip69NfTKd7rWoaF3Kcch0+xrfi7C
         Txt05VZ4vYqM0iWwcyFafjgJrysfPk6DyUUUX0nAcJayUz8mwAVnmWXCvik1URuPQF08
         I4YCFSt64IoYeTtc6CBel5IwlRdgLXiKrYUQbebjWJA1U+F4h0A9cvh6cNcRvVCTFVuC
         oWKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IyeaVeCxfhnKWP2l9xAwx/3zDkoSerhyFLbIvFQP+0Y=;
        fh=fUIU34P9BAGpjeHsG/nE9cwf8WpFXGTgFyZ07fhVWw4=;
        b=jjkQ27DeVbutrEVEUY4J2EANCERkAImtCqD4n0KfPAnxTDe0r/uBPNHqS6RzR1aarp
         IFR4B0jGUf6bvFbmYFNeLgx/+BrwdZ8QE+nyxAGQ4muKjqhdXKU8rpWjd5SOiPdleYkP
         +JNMM71ZZYRxjcWiHNoOFqnc1HB7kv8qtMfRPbtXje8KRovZGM0EBjBnFBZtdCPy/gd1
         88cF1JrVDZSvhmn2pzQCJV1cYJGRNtJ1dsCzJU1UnYw546Lwl5Fc9Y6X12cLuX/v3Lmq
         Cq1gr/HZeCK0GyJnRjA8s3ep7fevCuRPn5kTMiabev0oVTutF9txM30ChL8fK8JUYO+h
         sw2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775552723; x=1776157523; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IyeaVeCxfhnKWP2l9xAwx/3zDkoSerhyFLbIvFQP+0Y=;
        b=gGzPs7YlUlFxdycN+sb8b3ymtYvrvAYOJEy2YkEdiac+hc8hdLsOhSW3nbI+8XvY1f
         oJ7NqUJlY4NHgjlK/hUb/szEZ9cJFG+kudtVyKTF1q3oQLf5uw4cDHo+FO/HbxxJy5sq
         iNsYzz23219yw3ZibB41ixkdB84pOo3KGyyB/kg1xylPsbUOnjXiPt2+UG85qoZ5etg1
         95po3HnFQd1JDwMTV835/sxgsfHnr1jbK4Jcg2+soONxTX76jyw7ALtSxAOJbnF4Henv
         iCW26qEN3kClWe+MwHAXvBg+lOT96ICVXedePEMr+x4tfGkbcwD8A/HE8daQqaTYTjdl
         jI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775552723; x=1776157523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyeaVeCxfhnKWP2l9xAwx/3zDkoSerhyFLbIvFQP+0Y=;
        b=MU6jZAADvgD0tvjqof/SeY/drA2rhBTkeh6clJeKEchiOvzKg3ijagQLXrJP+9e1DO
         x3Z61gjeHMxcYNUw8Nt+nIhCZuE4FBu4x+Q1zRq1Kh9oK059V8uCQuYbuHlVb2FaNTPf
         Ibx9vSGqQMmMiaUANtTWYizp2xFabU5S6CMt/GQQz6LiaVIQXsSID5POaS3/9Q0DrYuh
         B04RMzPCT813FZee12MSslIhzJzIm6fnEwslehbToLFIYxEmoNRy9U9Jvak4VI640AvF
         J0m5p7xRoRce1JgXTr49rXsCCBBozMHiMzRe/iPzcIfXY4BlyZy5zndwrHgYOXdFAM26
         3nsA==
X-Forwarded-Encrypted: i=1; AJvYcCUIOoEgxsKRgm+v9Uz75q/v6Xa/aUYlQWxWpkxDeaDdI0EkhzfdIz9sNXcEonj+xDvpHB8RU+ICdVeX@vger.kernel.org
X-Gm-Message-State: AOJu0YwhqWAn9DyVILfvA4ZHs/RO0eTmrk1p1fozALW7bsaAWNeLZaOP
	88/krClNHFHu7j6UYJDhC0Wy3z3jQ6NTaIgg+ejUxqV/of5IV2w6LD3BQU9jDvqsyBgxoS56FJa
	MBxVjSTjsJjabxTYzEQAaCZTqq5Hn9Tk=
X-Gm-Gg: AeBDiesCU+ydLuRyAuMSEx01kS+rIDlBFw8c1xGBH0ERw0uH6rl4Ck0fWYVAew9mcy8
	tZvmT+7zYR/QHHESQFaMG0vOJlMhOdOz34S/thtIo4ddiafqcV59NIpbHgkuubr+oQwMFchSae1
	N1FvF4UQBkGXVH1ewQ5sXR3aJCMO93xO7ecNUkn4dtQ8myJHXTcNL/TirchWUG72cDiUtrEbrks
	fJy8en+I1I/PaUEWd9r7F3V0otaJc1WbcWEfWTwMzXWTIfC1BEqV/lYyP9aXxrYupIMGN4lraBz
	JN0xKhQy1P3I199F8S4=
X-Received: by 2002:a05:6820:a0c:b0:679:88aa:7531 with SMTP id
 006d021491bc7-68220c43581mr8109352eaf.62.1775552723620; Tue, 07 Apr 2026
 02:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226055521.1655243-1-pkleequanta@gmail.com>
 <20260226055521.1655243-3-pkleequanta@gmail.com> <258747f4-9da5-44da-8eb9-24f8a8cbff3a@lunn.ch>
In-Reply-To: <258747f4-9da5-44da-8eb9-24f8a8cbff3a@lunn.ch>
From: PK Lee <pkleequanta@gmail.com>
Date: Tue, 7 Apr 2026 17:05:12 +0800
X-Gm-Features: AQROBzAu9EPCeu7yAg6nFPgvrkXGV_brWEzr82YVFUVRgLOpe60s_tcEts7ZUn0
Message-ID: <CAK8yEODCyYxkggU+7=xzWFcXP6RMTpNbHyYRHZhahX7=b6reqA@mail.gmail.com>
Subject: Re: [PATCH v12 2/2] arm: dts: aspeed: ventura: add Meta Ventura BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Jason-Hsu@quantatw.com, p.k.lee@quantatw.com
Content-Type: text/plain; charset="UTF-8"

> > +&mac3 {
> > +     status = "okay";
> > +     phy-mode = "rmii";
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_rmii4_default>;
> > +     fixed-link {
> > +             speed = <100>;
> > +             full-duplex;
> > +     };
>
> What is on the other end of this fixed link?

The other end of this fixed link is the CPU port of a Marvell 88E6393X
switch. We are using this switch in unmanaged mode rather than using
the DSA subsystem. Therefore, we use a fixed-link to force the mac3 to
100Mbps full-duplex RMII to match the CPU port configuration.

>
> > +};
> > +
> > +&mdio0 {
> > +     status = "okay";
> > +};
>
> If there are no devices on the bus, why enable it?

We intentionally enable it so user-space tools can access the switch
registers. I have added a comment in v13 to clarify this.

>
>    Andrew

P.K. Lee
