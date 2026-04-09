Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4244A3E
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 05:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775712794; cv=pass; b=PhvcBKvjj5eo2dfX1Cm8mNTGjC5i0PUNrEvdBAX+A8Ud9BF00/xndeoe+bVC/oSt8A+a/Rkupfp9Wi0wKVzwBpV0jzKDpPXXRfBPymim26SIcMIFk2ICOZzXzHdDhcmVH8EiWiBch9UewMNPaL2mZrr/S/ABXZC1CKv9Azd1XVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775712794; c=relaxed/simple;
	bh=JqdRc8aRuzGRf7CMRvG0CLHVUKtds065JL1445Ym9c4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GvXVeuP02tbWbdXoOP2P3ak/f7GkJFj65ARFhbFim3L8XZECeJ4eEn96xqzxPSR/ulPtFpdHXCzGg2bPk3Gl1Crtg5Kebbu9lazkaYPVXRR+NFhRXbOMOeNeHG0xqQDeOHLp+RYZPDckRcgDdMqcK3v6vfXYwhD0d4NSWssr6Lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=U0Cul7a7; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="U0Cul7a7"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79be0de8610so4696697b3.2
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 22:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775712792; cv=none;
        d=google.com; s=arc-20240605;
        b=EK+lTzSML1RNmEO+jMMZXUKyVH3orLQwsp+/TYm8LZJl/RLHjm1L292xxTJpaQkRiL
         TmB5JgXNQbd8aF4XJwEzXwHy/X7EOJ83zdgib0wWWHygolGs/lu+YCzEkmS86OAlbY3f
         wm7LiVVI/3SU5RXnqyPtBaYKLz3I9+60+Y3toTZ8tahufjd82MclpAhqwZLlsVlhi/JL
         el8Le9yY7mLjWf7IqNdfECwcaXJlA1yiIRih4n4cG9IS9fEwaIPb/JMFdLJcAucvzeO+
         yfXvLgNt/Jhoog/J3TvfBl5YrXpexA8e/NDcQlcjvZu/qdvBxCZVHL+Im8zepcpIyZCS
         GmcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CsOuNOqEy4A3ZNWhfjRgi4pkwO96VTtC4EheVUOLxaQ=;
        fh=lbyLhQNQbnR8aSwJrQkxTcnE3ZDyjotHfph7+s+bQk4=;
        b=avFkf9A+0jGABFmvGSdVFDKYxBaKbP9K+4MElqkMGKocpqqcNDaRC0zAX+2sgFKv22
         LQSu6UG13xaDA74+IOGExeShjOXNALlzsIDJIUWc8keXRbH0FeP2Ch+O7BGkND+fjgaZ
         eAQspQaW9YJXy1NCGt9qB/e+XI2M315idBJgGp/fRuH3FAErGB0h3mW1H2ihFX2VbStW
         Ycz8wX9d80ptPI4Z/PyjSIbgbHgr/36nasY4rlWATDlXKz/w6w6QJQSxFRIc8y6jclM3
         vg96j1fOikzFuaFnUmKPOWuSEDljHC0RjzDh0hBpx2jZoKAwESqqvWJUXx7Aj4Df3gVh
         SiAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1775712792; x=1776317592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsOuNOqEy4A3ZNWhfjRgi4pkwO96VTtC4EheVUOLxaQ=;
        b=U0Cul7a74F7IKA04SsJA24jIR0BiIcOdHo4wfSGqYv6QWJ3oYidcfoL18swz1otUsz
         5yhMf3egNdc9ZREBL+MtLbnQO2Ixf9pwpXz6XajHq+7V/oTaidkgu5QY+9xXAKAW9Ul4
         jny15x8Ysk/ygzOI5VBXyrjxJYR0z3emBsA0pdQZMY+lol7F+HpB5cMDfNqoFu+DVLJJ
         JkdMHOaayjhsUPU7Bvw5Sa1ckw1xHMpzLBNrBfGwzcN1AZ5c7esQX7iV1a/BR3hzt/LI
         i2uqqr8mdItn0V0aO+s/KjFWqkv8A/8+Kaq4+BVmrAgUtG4hEfDu4IRwsAT2nkxrDGo9
         KvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775712792; x=1776317592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CsOuNOqEy4A3ZNWhfjRgi4pkwO96VTtC4EheVUOLxaQ=;
        b=ld0Alx8zzE270ZeXU+hZH8BTca+cHhRwdPqXLOZiGwSEkWkzCwuoS4YfYHMUSvL7Ut
         lqnIwPx72oaxQKBaSKR+otCYAg4YIna9larMume5mv/qrPG6/FpmJO+BCWZwPNSUY+/G
         LlJT50uOSWlfPYqNywvnLkGK08kw1MG0bD9Vo38ZdcUypDnuRNwh4L1kUFbdooqUrJ9t
         HscHZ1Jlp3XJxjPOH1wcFJtDk0exUPjU90yiSbjNx9mvM9VQo8dqHPjPKpjGphyUPagj
         7Rdd2Rs1ZPRjcyhVhld0YcVrxZSOdrlzxxGaCdiLAgYpdUzVof+gl5sqbkD6PBEOgFdx
         zhhg==
X-Forwarded-Encrypted: i=1; AJvYcCVIr/vVwjyLXBIqLWS/OjniKOAujk3xEdqAZcSSh1JRSPPqjfycyNP5H+AwTvChcVvW4rW645kbdU+y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgg5ABcs/IlCYsnzqdi8JEtID4DePZ1nkuaJ8wAlrUm1oCHoyD
	fAEd5RuP2WBz39MESO7QVSllnGwmmsM2A/jiK8rjn3lymjgug4OKSievDDY+ppIFgNDHdULw8h7
	A8k3RoItQ6DSiatveFFGNOEz1igZ7Rxsp550mQrl+rA==
X-Gm-Gg: AeBDiesIBWfFp9Z5vkUb1dKG5TCJh+QLunVOhbySAzEINJKHbYrEMSdByCzc6XFTONY
	+vkBaBVLFGmEmhtMkNnwWxJchOxGPGhsJs2Xp7F6LV1toWOE1eyE78cOktR/l1jicawGnWKUi8F
	nlVna/VoHzL1tPbOEP504arBe4YDi740IVVwGoO9Gp/z8N8L/V1tBZLi/esx54uwH3YJFKGPV7I
	46HjZVh7qtVzWOYCyuoo9ccHxk48uog31ag6rAvSvroKkmXPzO5uweXI7yhUeH4CiuZ9HHm8BDf
	VHyb1AOZsA==
X-Received: by 2002:a05:690c:c183:b0:79a:b118:4386 with SMTP id
 00721157ae682-7a4d60557fdmr208562697b3.48.1775712791680; Wed, 08 Apr 2026
 22:33:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321083507.25298-1-nick.hu@sifive.com> <acWdSsAtmyTTFVHb@bby-cbu-swbuild03.eng.microchip.com>
 <20260330-relative-hardened-5ce35fe1ef57@spud>
In-Reply-To: <20260330-relative-hardened-5ce35fe1ef57@spud>
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 9 Apr 2026 13:33:00 +0800
X-Gm-Features: AQROBzDUsS6Jq_VzFUqmv48COhKUyUT4VRbQNB_kwF_IYNHt-LtcdXosH2Kg9E8
Message-ID: <CAKddAkCk-WGmYqTSoYJq0HVhOdC0J2gYUWXuYWoErr2-riTEjQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: timer: Add SiFive CLINT2
To: Conor Dooley <conor@kernel.org>
Cc: Charles Perry <charles.perry@microchip.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 12:16=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Thu, Mar 26, 2026 at 01:55:38PM -0700, Charles Perry wrote:
> > On Fri, Mar 21, 2025 at 04:35:06PM +0800, Nick Hu wrote:
> > > Add compatible string and property for the SiFive CLINT v2. The SiFiv=
e
> > > CLINT v2 is incompatible with the SiFive CLINT v0 due to differences
> > > in their control methods.
> >
> > Hello Nick,
> >
> > Can you help me understand what is this different control method? I've
> > found that both OpenSBI [1] and U-Boot [2] use the same match data in t=
heir
> > clint driver which would indicate that they are compatible.
>
> Hmm, good point. I didn't see that the drivers were not doing anything
> different. I guess really the clintv2 should fall back to the clintv0,
> and the difference in hardware should be elaborated on.
>
> I think I also dropped the ball on sifive,fine-ctr-bits, and that should
> be removed and the counter width determined from the compatible.
> There's no users for that yet I think, and there's no valid users of the
> clintv2 compatible /at all/ so maybe it can just get culled.
>
Thanks for pointing that out, I'll send a patch to remove the
sifive,fine-ctr-bits property.


> >
> > Also, do you know if there's an easy way to tell if a sifive clint is a=
 v0
> > or v2?
> >
> > Thanks,
> > Charles
> >
> > [1]: https://elixir.bootlin.com/opensbi/v1.8.1/source/lib/utils/timer/f=
dt_timer_mtimer.c#L163
> > [2]: https://elixir.bootlin.com/u-boot/v2026.01/source/drivers/timer/ri=
scv_aclint_timer.c#L86
> >
> > >
> > > Signed-off-by: Nick Hu <nick.hu@sifive.com>
> > > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > > ---
> > > - v3 changes:
> > >   - Add the reason for the incompatibility between sifive,clint2 and
> > >     sifive,clint0.
> > > - v2 changes:
> > >   - Don't allow sifive,clint2 by itself. Add '-{}' to the first entry
> > >   - Mark the sifive,fine-ctr-bits as the required property when
> > >     the compatible includes the sifive,clint2
> > >
> > >  .../bindings/timer/sifive,clint.yaml          | 22 +++++++++++++++++=
++
> > >  1 file changed, 22 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yam=
l b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > > index 76d83aea4e2b..34684cda8b15 100644
> > > --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > > +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > > @@ -36,6 +36,12 @@ properties:
> > >                - starfive,jh7110-clint   # StarFive JH7110
> > >                - starfive,jh8100-clint   # StarFive JH8100
> > >            - const: sifive,clint0        # SiFive CLINT v0 IP block
> > > +      - items:
> > > +          - {}
> > > +          - const: sifive,clint2        # SiFive CLINT v2 IP block
> > > +        description:
> > > +          SiFive CLINT v2 is the HRT that supports the Zicntr. The c=
ontrol of sifive,clint2
> > > +          differs from that of sifive,clint0, making them incompatib=
le.
> > >        - items:
> > >            - enum:
> > >                - allwinner,sun20i-d1-clint
> > > @@ -62,6 +68,22 @@ properties:
> > >      minItems: 1
> > >      maxItems: 4095
> > >
> > > +  sifive,fine-ctr-bits:
> > > +    maximum: 15
> > > +    description: The width in bits of the fine counter.
> > > +
> > > +if:
> > > +  properties:
> > > +    compatible:
> > > +      contains:
> > > +        const: sifive,clint2
> > > +then:
> > > +  required:
> > > +    - sifive,fine-ctr-bits
> > > +else:
> > > +  properties:
> > > +    sifive,fine-ctr-bits: false
> > > +
> > >  additionalProperties: false
> > >
> > >  required:
> > > --
> > > 2.17.1
> > >
> > >
