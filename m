Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792668522;
	b=xt3nhepTrwOm8Dchdnifged5EJi+B3mTBndo7r5wgyc7EFAwX23wtJlF9ctNxHFssIRv
	 8WHqjyBtvT1jq6ovWobbrEaoBhio6TQJ8o4oQO7nwnDjSp/cR4d881F691NdPSN0erOAK
	 raPNMpgtX8E9zENWQY8nS4H9yKcgfNAHICMBTBEbCD2I87XPXjFviRHzKjd8807/p4CfA
	 hx4pQMD3LIYznwvjV/N4vO1mxLjxsRlK0SFycnLJLFU5Pi9gZBPzLUzjltTvRH6ZDwjHV
	 870e1qmhxURK+cL+wHPvUZcWo8PQSnWCenjCFMw/q+YXh5Mn1Uq96lHQREALdVSLd4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c3AFBFGhYU38KeWEvthADpOmG5PB5zwanCEFzPAZY48=;
	b=MkHVtLQoOU4uX3ANkqXQ9lWs6S3dvEvPsIvcHpmxBJR+pcE8hIU57GAhMOpEwGW1tY3Z
	 pPdun2lSmN5bX8BKhj7Li/gW3k37p3kqI2LvGRiZcqatxEVWvuRTg6kB5TFNaa7cJeIdt
	 11VwJhBTUDhAaiK++5PTxv8Jz19d5U/cM4We2RrjqegMahXELY+6ZIx1/IIogEb0dC5aK
	 NiLdwnUQ2vYFnrWQcPCGzmxW1q/NEbsQHEeQeAaSud6FryE8CGvliTZ8Hzd2qr+QPBMFJ
	 fe1hTMi1Urv6oH7B9TQ2teIAQSi/H/X/LFvGeFSoAK4LaehO65Z/3vPr9JeKSm6d+ZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mIEisywb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23FB606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F23FB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mIEisywb
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1185207f8f.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 04:28:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792668520; cv=none;
        d=google.com; s=arc-20260327;
        b=XUizPGfs565Rt1vgXZB1dfS0J5/81qjPM7jYejkjhuPKvKpORwk4/sGMfhuxZ07Cko
         1uojDeeRJknWKWM/EC+FsjBJH9d1Y2ieFzwFz/Q67lJlXoaB46tMOKyVDGL9CUipr3ga
         FKuMe2y2BMUGfRYG/1O5cQvW4ZrchVI44chCEGZu17rEmmXfA+dMfzuW5hhCZZqe9zFA
         Y297XFrGA5/odDrmXbiSw0SjIaKq/nMmR5BYD4Nq/4plQF8GOmo7wDoeQXzNW8v8kVHz
         LsCWCT0b5HQlWzJhSFDZ4AcwQoUseFAWrC4dsoOYX1IjFQHITs8DDfHlfTz80UlxE9e6
         tw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c3AFBFGhYU38KeWEvthADpOmG5PB5zwanCEFzPAZY48=;
        fh=hkmwKyMByftbiBELhahWJyToJebaKRQqA8KCvu/Zb5Q=;
        b=POltqvPAtV8DQm7ugCH1LirlGIx4CKR440/VUpzCmw2Kn7bW3TFlfbEsyOA0DBYiWC
         JNvYJvGyDHZ5GKVpVUfoHLZRKU2RJvIKYguPPOBBXovjFiGZobQGcIkhiIX6ByT4KZod
         g852hwIzCWKvBkgrCb0kWvvPuKroMJ0Rr1O5uDig3TPV1Sbgs7sEscLX7ZRezIL0M97l
         zUOiibNerZTPjxVghdVtHp+GcHh7jVWwDX//VZrDZAwgNP62CWJ32hp6B5oERCYfr7er
         vYGkG7q/6QyRWCDwUGrBz+w4Y4/T33oVEP18sskl++HL8YLCljvprF6YH+bajlpEgd/k
         mksQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792668520; x=1793273320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c3AFBFGhYU38KeWEvthADpOmG5PB5zwanCEFzPAZY48=;
        b=mIEisywbw7pP3bKrwyU6M6MibXLo/vR2s/sJ6n/HBkW7OofdwjjtgHarz6xhmmD74g
         Jnd3YMFGTK1nBDW9WQH7OAF1ELqiKSp1msH8/QcuQ/6lI8zKEzHBxlPx9PuW3sS7zrIG
         4BMKead2gxIFKH72AC4ttBmZyyhGju8Be6MK4/LEApino2w1m0MoIvGT/biZPh60M329
         DZpl8IHwO1mrLeoeReksPoJztG7aycSZpuRjB9A6Zffpb2lpdvK+hkuUg0bxBc5yxRna
         Ew3yWoi5dKXrWVOf1OMQKvcfqEru3oOZbbNIPgKAQymRBLSXyXP4prXhGSB9n8Y0jXp1
         +VOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668520; x=1793273320;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c3AFBFGhYU38KeWEvthADpOmG5PB5zwanCEFzPAZY48=;
        b=s/nTJbIKuL/luA29w/tMCgcQaroVq/q8prxhd7GqRoSxXHwU3I1wkbBZfy3M5shd5R
         uC9e1mPGbEJmvFApYpzhCQECPRrVQ1ziezSGg9Ny2bMw2mAzCDSjEJk+OWW/ezTcL53A
         fW2f1NaTNNzkkkTGNW75skhCdFM3UlmxhOaLbhzX2Co8YX/igTNbhv62JmlqwMri6MoJ
         HEzCIlrKJcpurqNBKGJxZ2Om9j4k7Ll9QZ/wiUh2LHbNXoX0YzhCqTjuCYSCuk+drK90
         5xIS+gcoDP5JKE+7sP6PwGEm/pKzCA/Rajo96Aqiv7/iZYfoql/HnPEWiC9PL5rvd8GU
         /Xsg==
X-Forwarded-Encrypted: i=1; AKwUvBy08iRvfLQh1GN7vyNCOwDkg4tc7VO39R4h44k80smARQ1wWtqCWekTYmW1mi1yejWhmmvrtgxqDC7p@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4mEbQJlicAUM17YcYvENMyCdEKtTMk1xgRNDvVyH9Xv9Jj6El
	4z4cDXZ5VIiMZ4jhDmUEh4f9pLENffRdDwyXuE5OjXFoAQqwXYD43l9M1J8bRzjHmHS8jiJOPML
	Mf4pQRGiODBzwxFTIO6U9DWBxHtHvBiE=
X-Gm-Gg: AYBFou0C773YVXEdi5GbYUBKlXOvFh/HOGK3XWa5NvSZEsk/9X22xmc5v3/jBl6Gtm9
	WQkYedv9gFgRJUP6dktCMbchVxZUiIkooplXuL88KWq4QeA4U0+qmUT6P7QoE+tom1pCSZvQvWZ
	RUaT6zsDAd/RimlIOC75ziEvP1w2VlYu5rZ6szSGtsAT+0h9Yu0MdGJolftjKvgsyC/dDtypxqB
	SEPP2th+lWhpkilRoEnpKeuQHkqPMIQUY/VN9xKGQWmOxV5GewRWlKo9P/o0BtqmX6tSWLUTN4u
	/6CxCwBoItOl+cn+EllEAKS/55yGScJgbxwSiSghIdg+YxbPBp6Avy+60D1ay55d4RmQ1KxnoB7
	pgLIyZNGFzisV5i+I9+hpBZyEKX6qYeEn7ycjOCZ8McnZo+xjh5GDgKC+JuQUm5BFU1uZghBmuR
	k1Rqw5M9vgnLtxfm1L/Hk=
X-Received: by 2002:a5d:4a4f:0:b0:48e:2b3:5269 with SMTP id
 ffacd0b85a97d-48e265031afmr7463130f8f.45.1792668520009; Thu, 22 Oct 2026
 04:28:40 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
 <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org>
 <asz8oEtow_lrUU7K@zed> <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
In-Reply-To: <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 22 Oct 2026 12:28:12 +0100
X-Gm-Features: AclHuK-ZlW7j5Veia4UpY76b7Lsra_QP7Fr0yExrDdHnznigNvCvFRFzyg9ZkZI
Message-ID: <CA+V-a8sQmtqoH1y5sk2S5e6O-nnAB=xUnmnjgJ8SC3npVEn2Rw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Linus Walleij <linusw@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Oct 15, 2026 at 1:43=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Hi Jacopo,
>
> On Mon, Oct 12, 2026 at 5:39=E2=80=AFPM Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
>
> > How was this patch tested ?
>
> I was using the TPG only so far, a camera module is in the mail.
>
> I do have the RPi camera module 3 but didn't get it to work, this
> may explain why...
>
> > > +             ivc: isp-input@16040000 {
> > > +                     compatible =3D "renesas,r9a09g057-ivc";
> > > +                     reg =3D <0 0x16040000 0 0x10000>;
> > > +                     clocks =3D <&cpg CPG_MOD 0xe3>, <&cpg CPG_MOD 0=
xe4>,
> > > +                              <&cpg CPG_MOD 0xe5>;
> >
> > Compared to Dan's original patch I was carrying my tree the first and
> > third ids of clock and reset properties in the ivc and isp nodes respec=
tivelty
> > are swapped
>
> OK
>
> > -                       resets =3D <&cpg 0xd3>, <&cpg 0xd1>, <&cpg 0xd2=
>;
> > +                       resets =3D <&cpg 0xd2>, <&cpg 0xd1>, <&cpg 0xd3=
>;
> >                         reset-names =3D "vresetn", "aresetn", "hresetn"=
;
> >                         status =3D "disabled";
> >
> > Fixes the issue for me
>
> OK
>
> > Why is this an issue it's not 100% clear to me.
>
> Can you try this?
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -703,6 +703,12 @@
>                 return ret;
>         }
>
> +       /*
> +        * Allow the ISP's 2500-vclk reset recovery time.
> +        * 200 us cover the RZ/V2H's documented minimum of 20 MHz.
> +        */
> +       usleep_range(200, 300);
> +
I tried this too and saw the same issue as Jacopo (Even increasing the
delay didn't help usleep_range(2000, 3000);).

If I add a dummy read of `readl(mali_c55->base +
MALI_C55_REG_PRODUCT);` after the deassert operation all seems OK (cam
application works).

Without any code change what i see when I start cam application is
readl of MALI_C55_REG_MCU_CONFIG doesnt return back and the CPU
stalls. Any idea what is special about MALI_C55_REG_MCU_CONFIG
register?
__mali_c55_power_on()
           mali_c55_update_bits()
                         mali_c55_read()  for MALI_C55_REG_MCU_CONFIG
-> readl never retunrs!


Cheers,
Prabhakar
