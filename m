Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795622339;
	b=JP4FFx6HNqZqc2+OR1lN+f0zZyDFFVPSa3iq48G3gm1lma+p8OA94g9ZI1zR7AzkaGuc
	 JfNXFIV5FJ2hkmvPb9RWdsDwjIR8J2LR7STFo6O9hxuWarCluP7OeWDP6QG9CgXy3Ij0Q
	 ElSSB7uQPq84tc73NOft/DQ+GcLv9M9K3mMwpxieM9cUMd6AoCNCqN3zp7Pxv53ugJhjX
	 LLiKON2TKqFny9zSczzoFeS9hgWqU8/Vm59i5Lfawfvig7iala5clhEsBJQIXtoLCnoEO
	 2YP4JDu5iMOSFkpn/qPCUO8ccGRTHKm+z4LXbR0QGkyxwFBFqia0jlsfgju9YuaRnbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6hnBZan8g8LHddmledKC79LHYdm87y2KXTgu+jeeovk=;
	b=CsYl6AGCaOAsf8nqw75ULaayFPBD2Eq5sIVVRyXfkyh2Sr09QoOzY9rtRAqul7fZilB9
	 Zt+jz+b75UXmQwZdT/tfJMRCVHF20VJarT2kxQMtR+RU1b+4ZzJ80YaTDybUIgRPCX4ff
	 Zl2ZxJWoXqlZPLjie7bSA2OKz9ewgHkmq4SOuI5F3tCbWe+txSMSk37BViJJGhPo1Vi+H
	 vhXMznZ9e43RGGW83dR0USjRZU4JYYdGQcy6KLZAzapvvB4HO6yXi5twTNGyFD2zeksn9
	 1xvJWqi77bkHoFuiGRCWkw9Mzs66PJZDB4Oq5v129KlmS6NM/nDQXvlagKjfvtgi+Bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=JXLAQZKs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFB6606A32D
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FFB6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=JXLAQZKs
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso883229066b.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:58:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795622337; cv=none;
        d=google.com; s=arc-20260327;
        b=Bgm+h7UONoa/dpaegZXn6ZUHP0fs8E+ZFuzLiAZFeoZTwQtR6BM/UH6XB3aN1ZZynm
         XOQT+isrHXvgWpLQ3veFElLdWKJC8BjgMdq072RhxPFlogRGBgVmwOpg4nm/SsEAS8TY
         V/yGjAXJsic0JlrR8ZHktY0vPYxb0vIxgbcmGtOF1hUC2RoF51dLkCTRh0EKN8NAk0r8
         iN08+Yudk2wtApKKLmbZZO/ncQ1kixqZNkfZ2vVMh2hbkq0D5dZklljbBUrbDRIOxHnx
         Fu/wRTFgy9I1wJFJK0zd5tr4YgTmCRMteEWnEhksxekXdMFwOpBYQNDGcy+zxxwwjGpQ
         LuLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6hnBZan8g8LHddmledKC79LHYdm87y2KXTgu+jeeovk=;
        fh=cQKmT+MDOY/hQIWjM/8vuceALnTfMNoONQqdBDpomC4=;
        b=Cp9uVHoT735+FjpPd9Tr0/7M0pHN+ic3e7tcLW61B3FoenRjH8ZP/AGTY6/z5xag2E
         GSl9vCwF5RHfWBL2D7Gp2ifAvSjzOPMpKFTdXKLU8j8cwS1pxtb3FT4J884VccpmIFFS
         qFPI2WjjhSmRj5v0bvPz+zwYtMhd5BuNR3JZLlLVJemq3vAYdyXZoCiAydLRWvvUWWYU
         h0p5D79AOGH6G4hbg/S7MXW8NzzPf9BMiVPhYsUmg84PP0pCZXHUDY+irwbxkfyIwMRB
         LreuiV/aw0MS9DIdi7MbVkxOeOLwpq0PyIEjQCN1bNgyCAXZDIiBsjmf+0JtDQvVOVl4
         cOxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795622337; x=1796227137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6hnBZan8g8LHddmledKC79LHYdm87y2KXTgu+jeeovk=;
        b=JXLAQZKs1ZDSjHSAx8TIgEBbtDLNlVrzKhWV108iyq08/vJa1ZilyaW+VZP+C9p89w
         zL8opP8hxcFgBDsMLoaZdGv/ycXTCd9D3u5FVd31cobfbVoM+0NN860gnzpF1aHPqP0Z
         1T904onxOeVaulXCOUmlEUz2LZ6eUPQRX/I7KRCCBw4WxiS7VP61fBs5ayTosbbEMFJi
         RuOl6O/P7bshxQMQVs5WfjjkpMaHMF6K2g+KWoM+m7SVLOzUu2wMg9WPlnECrTX4gFmQ
         xnUjMP6E0k55etqDk9vtDqWlgcGYiCU79Jsh4pEptim8BwEAjAzmuiDK4eGQjGqr4Mug
         CwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622337; x=1796227137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hnBZan8g8LHddmledKC79LHYdm87y2KXTgu+jeeovk=;
        b=BDVfnc53D27cJTjDdwiJQhxGYFv/05YU6yHHY9QcMHQN7G8Et1mcj37M8wDsb420uB
         Cy1hdLjgcCQmDQ13rUdVktAccux53LLD9qsdCqf7LUnrQoTD0l4h6bYWd8NIwgb+3YAj
         j0gimqevw7jDUkgHsZyvo4kPI97Y9ysCMLnvbnCEdIJITmnwSbT1VjhbmhIcIULuEnWP
         wB2zPlbhxjmVBM1+Fka4rPxPxUMKIvuP57Tn73/ATWFg9Q+TT57EURWwZICz44rG1Zdj
         fddmcfA0HMfsq4c62GDygtqLgc3EeXLX/nEbMRZN89YSC9B8SfYOjRNxPUyXmPCJAVi5
         8x0w==
X-Forwarded-Encrypted: i=1; AL+hErHeCsIm6Rck1bvwrKIsrUwE6tyx6No0JayKGXMjIz2vK9xspImrLRT6IL+hxwG61wqc92iSQxbI75Ts@vger.kernel.org
X-Gm-Message-State: APuU4Z/6BXmBtIEW2lGyazgMY6sz498upByxQhG+0iFGY1a5NRKS1k8f
	RTe47zbOrKdKW9OCU35oo0eZgUbmyCmgwQdD9HNuvnbUlV8RPkacaMtMTvvPzw1Y2wyJKPiDzcn
	IfhQ2FdEqu2gzCPoAZ+k96ubG1iNweoeKr8bDsf/zWg==
X-Gm-Gg: AZFdTZdxBBLFxRbPBlibfYvq4xUYcd9yPEjt4aVn5gEFzmm+uW4ytkKJ6akKLvcD1xM
	oo7f/SgutK22X2cbDgkTd8NeJoXstPet/8Q9y+yIgqx/lJRLi1eZLL1r8SQKtBvK+bdNE3cYvsC
	gITuR7oWCIRg4dhESBIgOLYV/hEltlbezPNnFEG/EKOtSAbhrN/5wt+WqLyNigJq06tJ68LioE2
	vxJJbSvuhCQkATG8zz9/15EU3k8SObh7Mvh+kwxcLBpQNEbFCQ7kcxmW6O8/s3BK1YwFWqBULzA
	wW3OV9EguZ8JaPpK0dpauS3Zz79q4zsqSFV5jjyHKdm/PosMsSduzCRydZAtJUKjYq/syN/ys3h
	QReR38oeWwUG8gfpZabYmzcF5n+DaLZ433teTO2e6JVRtYQ1lgtDRbbDbLh/05HUz33G0
X-Received: by 2002:a17:906:81da:b0:c51:1d9a:323c with SMTP id
 a640c23a62f3a-c513a88b0d1mr1175280566b.15.1795622337011; Wed, 25 Nov 2026
 07:58:57 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
 <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
 <2f8da604-36af-4944-8168-02b046e97699@lunn.ch> <CAKTNdwG1sSBVKcKpHBj24nFCdc6WVKabV5=K4sJFucWpTLqRQQ@mail.gmail.com>
 <1defc5c8-ba61-40d2-99f3-6654f1743af1@lunn.ch>
In-Reply-To: <1defc5c8-ba61-40d2-99f3-6654f1743af1@lunn.ch>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 19:58:42 +0400
X-Gm-Features: Aa3M54rEPfqgE6y_yyyGlUyi0QUCYRvYug-ToPvauBq7tha0wq3SQqIuKn74zqk
Message-ID: <CAKTNdwFktkMtdLW2GzqzLH+LO4kF0uY0jWpnvO5vbWmd-e4iWw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from the
 CPU ID
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ryan Leung <untilscour@protonmail.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 7:23=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Nov 25, 2026 at 06:41:42PM +0400, Alexey Charkov wrote:
> > On Wed, Nov 25, 2026 at 6:21=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > > +static int rockchip_otp_cpuid_pp(void *priv, const char *id, int=
 index,
> > > > > +                            unsigned int offset, void *buf, size=
_t bytes)
> > > > > +{
> > > > > +   char cpuid[ROCKCHIP_CPUID_LEN * 2];
> > > > > +   u8 digest[SHA256_DIGEST_SIZE];
> > > > > +   u8 *mac =3D buf;
> > > > > +
> > > > > +   if (!id || strcmp(id, "mac-address"))
> > > > > +           return 0;
> > >
> > > I don't know OTP drivers. But to me, a function called
> > > rockchip_otp_cpuid_pp() which does not actually return the CPU ID is
> > > architecturally wrong.
> >
> > There is precedent for this at least in IMX [1], [2]. To me the
> > interpretation is "Rockchip CPU ID used as a MAC address base with
> > offset X", which is exactly what the derivation does. IMO, this is
> > less clunky than the alternatives (e.g., a custom NVMEM layout which I
> > used in v1-v2; a "virtual" NVMEM driver referencing the real cell and
> > returning the processed one, which Ryan proposed in v2 discussion, or
> > caller-side processing).
> >
> > [1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-=
ocotp.c#L224-L238
>
> I would say this one is different. The cell specifically contains the
> MAC address. But its endianness is wrong. Nothing about CPU ID here.
>
> > [2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-=
ocotp-ele.c#L115-L129
>
> And this seems to be the same.
>
> As i said, i don't like the concept that a function called
> rockchip_otp_cpuid_pp() returns something which is not a CPU ID. The
> two examples you give ask for a MAC address, and they get a MAC
> address.
>
> Does nvmem support aliases? Can you put two different names on the
> same cell? If you access the cell via the name cpu-id, it calls a
> function _cpu_id_, it gives you the CPU ID. If you access the cell via
> the name mac-address, it calls a function called _mac_address_, and it
> gives you a MAC address.

The cells themselves can't be aliased, but what you're describing is
pretty much what the current code does. The id field is exactly what
the consumer used as the cell name when referencing it, and the
postprocessor callback checks whether it was "mac-address".

Shall I perhaps just drop "cpuid" from the callback name to avoid
confusion? The special treatment is only applied to cells with the
compatible string "rockchip,cpuid" anyway, because only Rockchip SoCs
use this particular algorithm for deriving addresses from cell
contents.

> That way of_get_mac_address_nvmem() just works, so the MAC driver just
> needs to call of_get_mac_address() or of_get_ethdev_address().

They still need to relax the size check as done by patch 2/5 in this
series, because the CPUID cell is 16 bytes long. Srinivas rejected a
prior version of this series that attempted to return cell contents of
different sizes depending on the use case. Currently any cell size !=3D
ETH_ALEN gets rejected by the net core, not just < ETH_ALEN.

Best regards,
Alexey
