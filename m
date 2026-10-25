Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.216.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792937929;
	b=cGHBoPjJx+u2k9Iv4AjtxiX10GKXBtM2HqZuIbi1i5d/b9zby4WUkXwPbtv9ssNFCFgQ
	 339rr5zAezyNXGZvi73G+tzp//vpL243yIvs1cLR7QiAGNGmGJfkh1WM8Tq2CakSlXoSe
	 0r520UtMa7X77aCEjNz8uFvzHnG6a981261oRuZ7oK3KnvNdkP+BOE09oPRnudjz1RWXa
	 Q7F62qVEEEvJVFhpsj8DI8vMuEyeJMjbY3vnSE42JpdZFDfDH3LNkX/5xG/qs4Xtf7J4j
	 33U8mzIdUhk1u0q66UFoJykc/67/lUt8dcbHTth/3jKNUhkz1CnQBMhBoZ0VdV9dBTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=4VVJME7/gCLHk3YxwzcNW5mMjUauSr4kMD1EHj5gtSA=;
	b=NWZ/RFYyvXojJoXz3OKeTIKKcCMiNExC06Fnz08t8yiLFPz8UdqYQ+/BDC/zDV7eYDh2
	 g2pTrRGlSeuVHJ8drTDxfMc3sF2hy/qTJ3+yjYBpo3SxqfdCMHLAPB1NjBeduVtU702eP
	 pMohKaWgNC1BVyTYAHUZC6MeFETQ/wfXrlWFxHHlutf1LFvRxRUHPnmT+DbS1JHjuqm3E
	 4vqQSe8pr2lMBGw6DDS5AD5iMaoaOIyQ2oNQ8CvZQmNu9ZkEJlw9apV8DTOQJnbDQ4PtL
	 DkUcGMV0RhyHEiEGJj+IEiziMrLE6wIqzjXp+pMPA3EBkSRWqbcPAlYkbduk23bzZIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="e/ebeTX1";
	arc=fail smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B06606A31B
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 14:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B06606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e/ebeTX1
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1155194a91.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 07:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792937928; cv=none;
        d=google.com; s=arc-20260327;
        b=mweqGX3CPU4A0OCUsZDnK0oegmHpCdJldClZp35/wiRrK4/aFikqrDOcPVNz28oUuk
         4p88Q26VMQdl9rWR7i4GiQzfumEF5RkJYQd3Q+4avGtfg/3f5bz9mURmdrZ1xxZ17zhm
         Ey6LPghnfdCJn003SfhnWCVlMku3PNHU0HcgYMPicbcW0HXkqiLpC/sQ/w7BElJDXbGZ
         a4FNh+g9+2B/Vypu/G93VbMCaS0DH60Sia/4I5VUKsw9bzICy6MfPcc4+ockWv8a82lG
         LesLap0ld4d1DQ+voC7NO9+kmbJSEE+/L5C72elCRCSVQAPdezyp+8K9qEJamudl7ho+
         vt/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4VVJME7/gCLHk3YxwzcNW5mMjUauSr4kMD1EHj5gtSA=;
        fh=61pEyRGQWXdvwLxGcvwPuxSBCWmwHbm7ldu48yIiSE0=;
        b=HYPPZbc4vghdpYOvUgmO2NhaaSGNgMVf8+wRnqHAGeaGWQWhCQu0Qj+i+ategEHJ4W
         QoY9vpky/q1WABIwHDRjkYbNAu9zaZfy9FSIKi0J6mBxRRu06tXAp0yNF3P9D6RP1YJq
         M+DUPgRfy31NhZyuUV3QT0gQb7d8Yz78tQiTHT8ByU8Ej+9/FdgSghvjvS91TaYvKpjr
         1CREwdmIvcGhDQJKhc2/z7oYlrW6Q1VxvsmvwCN4hw0vPFBhJrJaz/tw8P64fP4eZRab
         /ytr8J+LJliy96e/o6gwjzxl8PXq0S+tR5bVUc03QCcGqOjd0Xlb1OX7KaYgOrLiYAgW
         VCzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792937928; x=1793542728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4VVJME7/gCLHk3YxwzcNW5mMjUauSr4kMD1EHj5gtSA=;
        b=e/ebeTX1Tx6oN1hlfvqTGXGU6CLEgkH1aq19mH254JZI/K4XF8MAXtcQ9J93XmVbpU
         N0PVK0Xv7QUh4iha0pmq3cbs0ODSkHdbBf8ONDLa86UAi/hTdStrWcQsZ61nS31u5Qrw
         u5z39L4Pm4fAvkl0borMKCtLN/FFGm4MFTHmwBsRaVey3/qp1zK3vlJ055FgWiMLcROV
         kqsFjaN8rzVZwm9pzsiWLlgh9oiEC9t35mRBAKyY82unRbv59Q4cf71UVImlamdDP+Bz
         Z/Y46Xi33sUlqtgkyIBzs4Zf+KDoa2bgZEoScs24jMzfvDtgu0C7MP6LluQEz6eszRui
         nXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792937928; x=1793542728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VVJME7/gCLHk3YxwzcNW5mMjUauSr4kMD1EHj5gtSA=;
        b=EqzNfS0ghuHnUAUX2dki/xrgUSWjiWe/uKY/z2X8tAGQMau85LM9t+sTYjqw1C92BE
         hUM4lJ9a/LUncFNdAm8lEn3xTATgMHlAbF4o1Zoy8hjkKw7OQSiMMOopVzAf6lhN/tPy
         jpg++VklTy5m/oRnjqz59OUi9r/HialQVYWZkTiw4QO3Aky2HsarJ3wxnYIzm3732sOc
         CNJ+kxdfyNr5RUd5tDH3oELngUKvpv+d9grIc6DY/lRnBnA1tDrPPFn01tzEVuhN/lWr
         0QyLDjcJFrPWuHzRjz5JSLRUO/4dZoZ2ZyiVBqf4c8s0pH/z1Br1ILcg2wCRGwArcEwc
         YWkQ==
X-Gm-Message-State: AFq9FYKs2kXrOsPUAzficgt8d7nGhpT2K5G6T6GuXkPOcsbITQ6DQOHG
	YbMdhsVC08Y7XPIatJtjmDJGEWkorlvnbBHP18l4yKY7OwrgSfO1G3kkNu8rMYzBvkcBstd+0O1
	ZlyW/VF5T/PK8M/nEPKpJGvq6zfJcYm0=
X-Gm-Gg: AYBFou3UpOFbw1Ba0wMFh+/bwfqbe98MVCjsI4tiCCZroqXoD6k5JCg0dexm0xedMl8
	9GjE1FPGqzBZ4oZE3GCtAc1qm1VGpMPDXt4oKgR7nTMiDYjIbov7UIiaLeLggwj93qb2T/blqOJ
	qlA0bNAXUhi34BopLQTY/a5G7m+JAwcQcJRoxjUHGijsB/BTF3YOXhTkLRLBXINh11W6SJpQ+/9
	mxUMRNSVvaHlnNfnCHcyLQ/h44MyoFHLZpMyCXd5IwyK6QEa9YpjrslbM4NpOwjosTzFi2GNq4k
	u7Ls5yMgzhjJ/0wyUp7ZnBFbNl9SG1e2PnL60gNbSBdpnwp28u8PVls2sv/SAP38kR05mykbO89
	JqPndkwRW2VW74YoGIWwE9FZ+eELt47+pLc2+vMef6SBc/T4zxxkR
X-Received: by 2002:a17:90b:58ef:b0:3ad:93b4:718f with SMTP id
 98e67ed59e1d1-3adeafcf07dmr3732331a91.65.1792937928015; Sun, 25 Oct 2026
 07:18:48 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025135745.102970-1-pmazzini@gmail.com> <20261025135745.102970-4-pmazzini@gmail.com>
 <sashiko-outbox-184238@kernel.org>
In-Reply-To: <sashiko-outbox-184238@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Sun, 25 Oct 2026 14:18:37 +0000
X-Gm-Features: AclHuK8AxVUbPpSRccmmoUo8xuovbvn143lgZz14iNyQWbJc3TwwX5_2Erfpfy0
Message-ID: <CAAxh=juk_TCTSTcC=REn6M7aJAoL0APmEtzG+ZsSVbMZnHYy+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: a523: drop the PA GPIO interrupt
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll fix it in v3.

On Sun, Oct 25, 2026 at 2:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] pinctrl: sunxi: sunxi_irq_base_reg() ignores irq_bank_map on A73=
3
> --
>
> commit 1d99efa95c547fd409284e1974176bcf35345f69
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
>
> This commit updates prepare_function_table() in the sunxi DT pinctrl
> driver to number logical IRQ banks starting from 0 at the first bank that
> supports interrupts, rather than starting from PA. It also updates
> a523_irq_bank_map and adds a733_irq_bank_map to map logical IRQ banks
> 0..9 back to hardware banks 1..10 (PB..PK).
>
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinc=
trl/sunxi/pinctrl-sun60i-a733.c
> > index ca82f08a3a65b..3ebe926a1bc6b 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> > @@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MA=
X_BANKS] =3D
> >  /*     PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
> >       {  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
> >
> > +static const unsigned int a733_irq_bank_map[] =3D { 1, 2, 3, 4, 5, 6, =
7, 8, 9, 10 };
> > +
> >  static struct sunxi_pinctrl_desc a733_pinctrl_data =3D {
> > -     .irq_banks =3D 10,
> > +     .irq_banks =3D ARRAY_SIZE(a733_irq_bank_map),
> > +     .irq_bank_map =3D a733_irq_bank_map,
> >       .irq_read_needs_mux =3D true,
> >       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> >  };
>
> [Severity: High]
> Does sunxi_irq_base_reg() in drivers/pinctrl/sunxi/pinctrl-sunxi.h ignore
> a733_irq_bank_map when SUNXI_PINCTRL_NCAT3_REG_LAYOUT is set?
>
> In drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c, a733_pinctrl_probe() pass=
es
> SUNXI_PINCTRL_NCAT3_REG_LAYOUT to sunxi_pinctrl_dt_table_init(). However,
> when accessing IRQ registers via sunxi_irq_cfg_reg(), sunxi_irq_ctrl_reg(=
),
> sunxi_irq_status_reg(), or sunxi_irq_debounce_reg(), sunxi_irq_base_reg()
> only calls sunxi_irq_hw_bank_num() on the non-NCAT3 path:
>
> drivers/pinctrl/sunxi/pinctrl-sunxi.h:sunxi_irq_base_reg() {
>         if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
>                 return pctl->bank_offset + bank * pctl->bank_mem_size +
>                        A733_IRQ_REGS_OFFSET;
>
>         return IRQ_REGS_OFFSET +
>                sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
> }
>
> With prepare_function_table() in drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> now numbering PB..PK as logical IRQ banks 0..9 instead of 1..10, and
> pctl->bank_offset set to A733_BANK_OFFSET (0x80, the base of PA),
> passing the unmapped bank index in the SUNXI_PINCTRL_NCAT3_REG_LAYOUT
> branch shifts every GPIO IRQ register access on the A733 down by one bank
> (0x80 bytes), so PB..PK access offsets 0x0c0..0x540 (PA..PJ) instead of
> 0x140..0x5c0.
>
> Should the SUNXI_PINCTRL_NCAT3_REG_LAYOUT branch in sunxi_irq_base_reg()
> also translate bank through sunxi_irq_hw_bank_num(pctl->desc, bank)?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025135745.10=
2970-1-pmazzini@gmail.com?part=3D3
