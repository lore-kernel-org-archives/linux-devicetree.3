Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794436184;
	b=R0XlvalZ6d6Jwz7SFv8kzg5pCzHeud4JDreizavlgrknDpG0KVSBQmgUgdAg7EQ9C4TJ
	 xiY3OEtwdZynIcRBB2QemsddikOId7LyvBHhy/+3K8RKL3PYGbJMbOM/VDyLzen2GL04j
	 dqG9hcSZHtdQvjkr7WUoJgP2p3SKUGExD/wZDRJ4xnD8/R+VJZ2KHsNJwHXMygHyHtXm5
	 abzRukFlzBwff6mJF5PCPlN84uDOqOhr0v88Us5BypwtpQpi/jTLjuwknBwsZrcdY87lE
	 6okEwL8zJ212kw2CeONhETV3cK68Vk1kiXR3MScsZxuvndW7mg3MIPKGjpTntb7qc0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l88aQEthU6YDCYl3Vpu0UwlZOCfC9J5sQ3/7Brd6dlY=;
	b=vs3rRk8MtbXEIlYToQjPYkQ+esFT9F4LEuUAWrmXUwsphReI4z0vCUiUgeusFvCLkqV7
	 XUCFYmlVtbqKOZckQE6AaUiwLtjaM2VUF6KS+ImNUjjl2jqIoZqM9YT0bRBnrXu3HLQON
	 Dj378aUER/LBBrIgyLYqKFww9HgjeUGO+O7bjS68AIV3em5uwuD/AzbeODYoxEOHBMWrv
	 oUth224qi+oy3bo7IKXQqIwp6Ot4CoiVN0w8W0wcZHg9k509Iq1RJyA7r8FRtt5BXSTXR
	 MUT39u49ltnEjWvlMbUucwiz3UXnCRnQfSSpm7mDoihqxcMG2wBNQf1g5BXKbBqM8tQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zh1V8q9k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C22E606E20B
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 22:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C22E606E20B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zh1V8q9k
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso4299641a12.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 14:29:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794436183; cv=none;
        d=google.com; s=arc-20260327;
        b=kaDixeU8zt5d8EJ48ADox8kw02LcwD6VNutFNSrGh85Si+IBNxRcxSE5KtU7qVwQbG
         MBdIq1XjiBEelbYcJ+pm7S5yjB9E404TNQdopvuooszQNkMFTJ372dqAcaKlL4OnNw6Y
         o0C28idvF+AMg4x79ZkODb2pw90J+FuU/VQWDJ0OM9P4x1jk14vaM3XssF2iy3MsgVm9
         rZnoyp/qefvJUtXaOWNeetlDsRAO2rxBBh/fKdfmXDI4W5It0OguraqDDuFzP03buiJc
         9cdimR8/J3XKR2wz2gKB4gMLFnt1A5e6cXNUpfzdUk1voyKF/YVlzuo4JSqTkSqG342W
         NFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l88aQEthU6YDCYl3Vpu0UwlZOCfC9J5sQ3/7Brd6dlY=;
        fh=cIge+nmtZSFohcKB/juNCZCN0HWcsq/YcgL2sBx/vDU=;
        b=WymrjBjFAn33k9Pwz5DFFtTjlrt/E4YY4rkU33vWCvZqzsOlDuooKnY79HR+b5v3Jf
         ji/JgyeWxy/WjmOVRPzMOJOYM0BoCtiU/VRU6ej7637NtnxGsqWfT3Ljq+33gP159yoT
         ci6dDKjUnqElcecFP6KrZoFBtAv7CGPwPzV7aa9m+NG3pcINRlNlJMMFsbBWsB3UvDT4
         oOSmXnkGT6bBfyN1VW369CiEbTiG/L7lIARxgAy7JhgJhaZ1ftNENtamO9yqBdeI7In/
         VjF3NqoNu6CX+clKcOfN9xrIMU1Jpzaracg5mZd1xjgAYpAtPOPHB3LOC6SbnsZvZj9S
         lhuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794436183; x=1795040983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l88aQEthU6YDCYl3Vpu0UwlZOCfC9J5sQ3/7Brd6dlY=;
        b=Zh1V8q9kqkpQMSlTai0vxhcwchFjHaXTHjbGVEyxL8NDHpebeRgslCUDB6EIEZb5Yj
         +5+lUMVMNOoknVJUxNdnoNExBYqpG9G4r2QyRNNBisDZ2ScD1oQnOgXodbJ4ZZtnO7U3
         bEUSrr7q6FwRSllf2g/eZMWAtUd3G6Q1OLiCkHfcjO9s6Mc45u/L+9RMTPynJuwxOr06
         VON8kAMmC7yHGn74m8ySlqoUJADqnPEXj+RFZiJprG2kj70C3hr332mI6XsDNDKCr7sk
         JepbhpqxjeAIQMqASoQBumn68OBEVKAOdwdKXoObid6rZScZvFgoDKc0BQuCTSJKar8D
         lMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794436183; x=1795040983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l88aQEthU6YDCYl3Vpu0UwlZOCfC9J5sQ3/7Brd6dlY=;
        b=IbbQJEtJVQW7g4hCThIIcxtPs2Zx5pW0V1fbEu2Din2oTwtu0QJau+dOmnnnIKD6R2
         s+ad6S90/y7/t7GoV5VIdBt+Y4AfQWHfDRNrvZvNjwlfPwkyY+/hLdGF08mOfFeaVI94
         b7hMKIC5l41A0XTdXea7n09umKthgv6HIFcDEp7WQS4GW+F5SkDaiDXnPlYCeovzE8LP
         REZy5lZbitupVMngEzF1DuOtt3UJW+8FGhjaQ44w0CVwAjQyhWISsc2Y7ObRiPBMg55g
         jGKLPdCqVXuRsvCFvdCKimRITap9YYKvWJFQUtnX8x1sq7nmBnaohVLgDlFpeYXvABEQ
         +eSQ==
X-Forwarded-Encrypted: i=1; AL+hErEfZWWJsamIzMQubH83M52mS9xcnQ36p3P8LHJv4maOsK5zYrJpW2pQuqAktWJ6B5p+L6La52HdBHPu@vger.kernel.org
X-Gm-Message-State: APuU4Z/o7zdc+ieYTHYUjyrZVKEoeTllKD8UuTrCm4Z1KzTgoy8zh5XN
	DK010uUNwrRipnkMCtYcBZ9HaFRjpv+qiEDR5a9DJ6/iEMv1FEZL0EewEExaRQ8Tengrh9FP3ev
	MuFWZ6Y/HA2Q7w5TFzlm8oRWv7JypGpA=
X-Gm-Gg: AYBFou2Vp3a+KdakHAqNHv4ebbId4nhKtFp8yD54k3DePHLX/WF3/qQv5Y5iU6OQoE6
	Ie1ltjq3LVku6HPSAvi/024y81CBiKw2ko6piYwCTumVnZo1w46qpkdENRImWOKfCIRB5bRGfOK
	kfch4MPpHnPTKkctdsPS0KZ7Gh3x0NhfMqWpqYCxZHrcuzpOn+1PL9G3alWvGf4VcQtulsC7oSE
	tijLXxt4fZoQpiZkjA06QTZc6J2lNNRdEizSsl/8Ywi3pc7gfKfTcb6ERb1NALZ60xpOng4XiVT
	qZko4EJQnPnqdYJGRuv9suJTBU3OtSFpeyZ8oqP3+CKoJZLWFRwjr3i76nyHgif9ACwZ2Rf6T5V
	9bfnwgPrhUzP2+apWhNLYs4MiCd0X25OHmc6GA7KWf9gnhJNFL/NMSTchC12TmwEfei5NygwVbn
	62dZ/aRqpL18lxd2oJKKP3giKp79dfWePqfpyk7kqxa9pAtMcD3Ys9HVxVpkTArFKTNqy+RMLOg
	N6ewT6V8FxpgzRQQiHTaD90bgPRoznGNxUBnKas3+AZ9faIyQ==
X-Received: by 2002:a05:6402:c6c1:10b0:6b5:962e:e00f with SMTP id
 4fb4d7f45d1cf-6b77780f404mr2255040a12.28.1794436182455; Wed, 11 Nov 2026
 14:29:42 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111215729.10683-1-rosenp@gmail.com> <20261111215729.10683-7-rosenp@gmail.com>
 <sashiko-outbox-209774@kernel.org>
In-Reply-To: <sashiko-outbox-209774@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 11 Nov 2026 14:29:31 -0800
X-Gm-Features: AclHuK_NMj1qq8-W9ISvxeZgzbGMriIS_aT5l7uzjtRMavpKllDh5UrOmxBfjQA
Message-ID: <CAKxU2N-DMRg=Azrb1QRmLw4zBjij_fui9s8fubK_ystZAKfBfA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] clk: add a driver for the Atheros/Qualcomm ath79
 PLL controller
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 2:14=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] clk: ath79: zeroed hfrac shift in qca956x_pll_rate()
> --
>
> commit 423abf763de32c1b127032d8210181c833b02aa9
> Author: Rosen Penev <rosenp@gmail.com>
>
> clk: add a driver for the Atheros/Qualcomm ath79 PLL controller
>
> This commit adds a common clock driver for the Atheros/Qualcomm ath79 PLL
> controller to replace the arch/mips/ath79/clock.c setup code.
>
> > diff --git a/drivers/clk/clk-ath79.c b/drivers/clk/clk-ath79.c
> > new file mode 100644
> > index 0000000000000..6eab4cd1a91f7
> > --- /dev/null
> > +++ b/drivers/clk/clk-ath79.c
> > @@ -0,0 +1,782 @@
>
> [ ... ]
>
> > +#define QCA956X_PLL_CONFIG1_NFRAC_L                  GENMASK(4, 0)
> > +#define QCA956X_PLL_CONFIG1_NFRAC_H                  GENMASK(17, 5)
> > +#define QCA956X_PLL_CONFIG1_NINT                     GENMASK(26, 18)
>
> [ ... ]
>
> > +static unsigned long qca956x_pll_rate(unsigned long ref, u32 config,
> > +                                   u32 config1, u32 refdiv_mask,
> > +                                   u32 outdiv_mask)
> > +{
> > +     u32 ref_div, out_div, nint, hfrac, lfrac;
> > +     u64 rate;
> > +
> > +     ref_div =3D (config & refdiv_mask) >> __ffs(refdiv_mask);
> > +     out_div =3D (config & outdiv_mask) >> __ffs(outdiv_mask);
> > +     nint =3D FIELD_GET(QCA956X_PLL_CONFIG1_NINT, config1);
> > +     hfrac =3D FIELD_GET(QCA956X_PLL_CONFIG1_NFRAC_H, config1);
> > +     lfrac =3D FIELD_GET(QCA956X_PLL_CONFIG1_NFRAC_L, config1);
> > +
> > +     if (!ref_div)
> > +             return 0;
> > +
> > +     rate =3D div_u64((u64)ref * nint, ref_div);
> > +     rate +=3D div_u64((u64)ref * lfrac, (ref_div * 25) << 13);
> > +     rate +=3D div_u64((u64)ref * (hfrac >> 13), ref_div);
>
> [Severity: Medium]
> Does (hfrac >> 13) always evaluate to 0 here?  QCA956X_PLL_CONFIG1_NFRAC_=
H
> is a 13-bit mask (GENMASK(17, 5)), so hfrac is at most 0x1fff and shiftin=
g
> it right by 13 drops the upper fractional multiplier completely when
> computing the QCA956x CPU, DDR, and AHB clock rates.  Matching the lfrac
> term above, it looks like the divisor should be shifted instead:
> div_u64((u64)ref * hfrac, ref_div << 13).
This was present in the old code. Unfortunately, I don't have the
hardware to test this.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111215729.10=
683-1-rosenp@gmail.com?part=3D6
