Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795436695;
	b=wQEcHUt6APdE84KN+LGG0aRpilxhz5L0qmMKnLBdrMfsQEAiZD8a+avAdcbU5lw0Y+j6
	 9X8bFNdAFMDXEPK69AXKblrNYQFpSDpsWG1DqGRuUAUwAcVaBd0qaZBqj7ghh6+BlFN3Z
	 SJNo6qaBAaRl9UAofsfycCKM2eJffCOvPeUASvowqIC/BeVsxU7evhkOdL1RffG+WtXiH
	 pRyBJDd/NfLWhpGIStGk/4E/edhKuKnKCiPFfiyyJ3CuCntm03VDeZ5WFLCbJ6FP3uCvT
	 2n8fo8/DWx4L4iTHr6QdjDWu3GYzbeS0mg2kw0jm8fBmkBx5n5ZC8sc3ZR2hF6qxjTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3JGEHCaGHgSI8BrKRQk6rt3qVFIqpC8XEVH84mN8VhI=;
	b=Mj5xpiysbEaCiHdNkn+IRqzJlK1wGNNYU0ikcpnwe6c4tj+bPMPr1BVNBu4nIMo/Uzdf
	 3L+0dUa2BdTZ1lb51iTPKyb+S5u1UBlcCr//o1uP67wa7AEUjQRHmfQDdP7tHd4V3ngjc
	 JBc3OIUVfrQGHZCY4pry4k/hqrdELxbyEWhWqeZkPBdNVqqGL9bFHy9wCrQVWX3ybvxXQ
	 7eOFGUk4mkpiiWLvCTGatWLawl+7pM2iBh6/CD9Yy7URgC4/AE8/oPOEDqWCWSet8drp9
	 9j7aeWEoM51FK9Vj6av0z1jXitqpNu1G6TpLPfMM7/8b3+nO4Gg1Q9pppOWjqo4057Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=SMANlYAy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73AF606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C73AF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=SMANlYAy
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c506a231b88so443580166b.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:24:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795436693; cv=none;
        d=google.com; s=arc-20260327;
        b=Tc/Ghn9AXAVlO+qyVBbqV8XrV1zcZEU4/UqMmxIKMgLPeHZyjfDzYUycmjRmZr22jJ
         ABiHA63BkO476XMhGZbcpYhZTsHb31PiO5NYn2H1Q8HZbae4NJmM9eoTMTpUMGOZ367P
         Cpnd7UUv7wjbGKxenLdwrBFBEFMPgBM5HBhQzgkhdQWDKhT5ukWz5lfDbZYM7FsqAtNK
         edsIAcFuBRBWu5Ec3NWccCJv1SWaMlw/u5UHaFyUhrol13brGE2S83fJJIn8FDUdNQPZ
         bQ6MFYA5Aylnvto49vg63/I+lvIeaFr9uUsdtcckNL63/3BOEAjDlOHwZwUf1NK13Gbf
         YuuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3JGEHCaGHgSI8BrKRQk6rt3qVFIqpC8XEVH84mN8VhI=;
        fh=VmUzOM/GU6OJl9svk2oAa0U4eec4GYfLF1KQTiGUeJQ=;
        b=MTwIpTXn0rUH1ssxkScSdEoBaQZ156uXSKH/8KMAzfdQahEaorhlxncIkeZ5lZCi5J
         BOZWYvi/OhCskfI/kqfrXN7B0FQfAvFFoiIywzX1Aj2CGy+jq2w9kIxCtHaui7p7/rzI
         sMbI9Nl//oUf5faEAiR02J5QOyLurGQFKkaNtYwe2DXFWNaThEU9YcAJxp9lFhq2ng8P
         MvsHMzr/HZORTxaBMaJGg3NB/yhgIqs27nDmhrxG49clkoIzWq4G308B78K5ehcurkpM
         jdUStS115rWa4GQHkj0HGprkUao2gvWOSVxCI6pupyCUNtbUG/dAKpOCj4tOK9RmV67H
         Stag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795436693; x=1796041493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3JGEHCaGHgSI8BrKRQk6rt3qVFIqpC8XEVH84mN8VhI=;
        b=SMANlYAyDeGkrtgBxN1TqmHqif7PndowLtrYXDCvfpS41NPxmuMXJ6jsNNc1zmz0Dh
         VkzUSIlzCAUMjR57cjvMvGDj7JSQ7Is69x/ZRWBbNAbA/cj/RFfYVFVvpPQeICtt3kkP
         T1mLwgtcbLB22yBUoh/AG+y6olc7pVHR86O3aJYjIu1333qq4MMiicORUlMC94lpov7v
         0KqOJwjAUfYh2e52uWhjmdbTHyAhuFc66iuNpk1TntsqbqIWDmWN8KcVWyrAD+MZ7y6p
         PJuvWoLdC9Dc8TdGQmajQg4Pxk20AAkOctDJZF3zZm1dNFNIH+3FhrguLyx5jviyO37e
         8OOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436693; x=1796041493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JGEHCaGHgSI8BrKRQk6rt3qVFIqpC8XEVH84mN8VhI=;
        b=s4rIqbrt33o9rzyRuKEf7JKgkMjR3ng+5VyW46f2y7POuMnGDkNeyBkwZYaGQAOqbE
         oDHdnfbgch6He8ljoUSlgxOKEuHi+VEO7G+v34gKFiCEAEQ6eT5YXuSVn+8GC+vh+Htm
         Y+6VqlXpI2SnA3yXOME4T5D61iRv0rEpUxd2IUcSb6pKT5KJDcYxLYqZB+FEnpBKvdqH
         UH5gA2b8VefSRoIM/twLOo22MOZQV5/7Iury6KUBLW8Rh3gjiABQJhnHXiP4FTg9Uv5Z
         zBO6tpoQ3MmyLSGoaZAHef/ZtY1NBoJJqCsFqYaaRb8Fi/7bI1dzyQWheoq1napKe4AE
         TJVg==
X-Forwarded-Encrypted: i=1; AL+hErE7hybGcE6DTJkpHstjAF8ITmYUyZoNtMI62Ft51rPMc4F1l7AQ1b8guR+RvEAxSZR+y14EFMeSGQ24@vger.kernel.org
X-Gm-Message-State: APuU4Z8nFMt1XVvAwOEw8VSwA9mPepD/3N36I8WUsLlFHmSd/usRPoon
	KpYbLKL2MKELAIO0tmyUSiVy7LgVOnH1IA2U3U0TyjiFtTw+DOvq6HF7PN8dEZfx8T8NV5cP+RI
	chMT4Dgk3sYHQHOh2X4E1cHUtvfXpOKFCMS8RENBFDQ==
X-Gm-Gg: AZFdTZeI+Ad9CXwSj81Ry6msXQYVen4Q/NgAW6vX62dwAyedirDP0We/hHhsehhsZ8C
	FQ28NZdQGBTGD2+UzkivkGSke5ThgZq/QxDThICRB2z3Lh3QE19SZJ3IaIWVtSZXyRKroFTxZRn
	KHvvDLaBf5QjYfgVIhE8GQnwDpetps9okDEdnSF/CMWtWd9NxGuRERWUqI0AiLCjvzBGUjZ6SVI
	wx6MeVyt9d9aiVFKyOIVYEmyxgKdSHKDq2Pyeo2yUxnefkPEQQJX+r04uS3+WbRdm0sgdoQp/bW
	x5hZ+BMKJLdAmAaF2rSs+l/hLCUyfT27lewbajV89RScj9A+CvHvC0ZjqTyZdlE5/q4FyzlF/AD
	/q9YlWQxoYU5h0Nn8m5Tfh9WEbNXCeErRKbLZ1Y5suKa3kl2G3ji//fAgFM+HEOcf2xMW6zV2in
	Xcsi+YMbzufxOx4sQ=
X-Received: by 2002:a17:907:fd15:b0:c40:33d:f06f with SMTP id
 a640c23a62f3a-c513aaad90bmr920564266b.39.1795436692893; Mon, 23 Nov 2026
 04:24:52 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
 <CAKTNdwH9QAgreJ-6+t1j_P1di4VyoMBSsFkf_g=mCi_-M8g9Pw@mail.gmail.com>
 <20260917221857.GA4056431-robh@kernel.org> <CAKTNdwH6E5=9gZHB6tdianC2+1aDv4wnLmvL59kDW-dR3a12bg@mail.gmail.com>
 <AQpdyd6hRl9cLAxBK-fEdzq0dcZsWpHP63dbDpOxcNQWCdaNIc4D3Mfi9Ll86jBVsbEVhr5-9EZzFHbkF6efBDcRUT7nXx9TH5Aeffy5DyU=@protonmail.com>
 <RWg2ZbGh-TJtEJMDWD9DGxBKsszG10BM07351ALdCUa9UL-IImPGxSYztcNF3kiRFVCA0x5cECwign-2lb56nPMGZQ5LVZhckY4-KTb5qpk=@protonmail.com>
In-Reply-To: <RWg2ZbGh-TJtEJMDWD9DGxBKsszG10BM07351ALdCUa9UL-IImPGxSYztcNF3kiRFVCA0x5cECwign-2lb56nPMGZQ5LVZhckY4-KTb5qpk=@protonmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 16:24:40 +0400
X-Gm-Features: Aa3M54pJDInt1dUc3UbuIPmLJ056A7-Am1qM49T-fqpCAj8EFLf-eta10BiPxGY
Message-ID: <CAKTNdwHOoG8j59X7z6j15n8TTf-A-+EQhvC+SqNWOq24p9vNLw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] nvmem: Derive Rockchip MAC addresses from the OTP
 CPU ID
To: Ryan Leung <untilscour@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Michael Walle <michael@walle.cc>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

On Sun, Nov 22, 2026 at 6:08=E2=80=AFAM Ryan Leung <untilscour@protonmail.c=
om> wrote:
>
> Hi Alexey,
>
> On Wednesday, November 18th, 2026 at 10:51 PM, Ryan Leung <untilscour@pro=
tonmail.com> wrote:
>
> > On Friday, September 18th, 2026 at 3:08 PM, Alexey Charkov <alchark@fli=
pper.net> wrote:
> >
> > > Hi Rob,
> > >
> > > On Fri, Sep 18, 2026 at 2:19=E2=80=AFAM Rob Herring <robh@kernel.org>=
 wrote:
> > > >
> > > > On Thu, Sep 10, 2026 at 06:48:33PM +0400, Alexey Charkov wrote:
> > > > > On Wed, Sep 2, 2026 at 5:08=E2=80=AFPM Alexey Charkov <alchark@fl=
ipper.net> wrote:
> > > > > >
> > > > > > Rockchip SoCs are shipped with a unique CPU ID in their interna=
l OTP
> > > > > > memory, and Rockchip bootloaders use it to give boards which ha=
ve no
> > > > > > dedicated storage for a MAC address a stable one anyway: they h=
ash the CPU
> > > > > > ID and patch the resulting addresses into the device tree they =
hand over.
> > > > > >
> > > > > > Kernels started without that fixup, e.g. straight from the SPL =
in Falcon
> > > > > > mode or by any other loader which does not implement Rockchip's=
 derivation,
> > > > > > fall back to random MAC addresses which change on every boot.
> > > > > >
> > > > > > Formalize the derivation in the DT binding and add a Linux kern=
el driver
> > > > > > implementing it, so that a Linux image can use the same stable =
addresses
> > > > > > regardless of the boot flow.
> > > > > >
> > > > > > Only RK3576 is wired up here, that being the SoC I can test on.=
 Other
> > > > > > Rockchip SoCs keep the same CPU ID at a different OTP offset - =
0x7 rather
> > > > > > than 0xa on RK3588, for instance - which makes supporting them =
a two-line
> > > > > > addition to the driver's match table plus the layout node.
> > > > > >
> > > > > > Patch 1 is a prerequisite fix. The OTP hardware has its own int=
ernal state
> > > > > > machine which only works correctly with serial access, but the =
current
> > > > > > driver serializes nothing, which results in timeouts and/or cor=
rupted
> > > > > > reads (e.g. returning splicing a TSADC trim value into the buff=
er of a
> > > > > > caller asking for the CPU ID, or mixing up trim values of diffe=
rent TSADC
> > > > > > callers). Hence the Fixes: tag and Cc: stable.
> > > > > >
> > > > > > Cross-checked on an RK3576 board: the addresses fixed up into t=
he FDT by
> > > > > > U-Boot match the ones derived by the new driver, and the driver=
 correctly
> > > > > > assigns them to the network interfaces when the kernel is boote=
d without
> > > > > > U-Boot proper at all (via Falcon mode).
> > > > > >
> > > > > > Sashiko also rightly pointed out a use-after-free in the nvmem =
core when
> > > > > > a layout driver is unloaded leaving its sysfs nodes and the pos=
tprocessor
> > > > > > function pointer dangling. This is fixed separately in [1].
> > > > > >
> > > > > > [1] https://lore.kernel.org/all/20260902-nvmem-layout-unreg-v1-=
1-2d16bebeb518@flipper.net/
> > > > > >
> > > > > > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > > > > > ---
> > > > > > Changes in v2:
> > > > > > - Switched from a scope-based guard to explicit lock/unlock cal=
ls in the
> > > > > >   OTP driver to avoid mixing styles in a function using goto er=
ror
> > > > > >   handling (Sashiko)
> > > > > > - Link to v1: https://patch.msgid.link/20260901-rk3576-otp-cpui=
d-mac-v1-0-ea9135270fc2@flipper.net
> > > > > >
> > > > > > ---
> > > > > > Alexey Charkov (4):
> > > > > >       nvmem: rockchip-otp: Serialize reads
> > > > >
> > > > > Incidentally, patch 1 of this series also fixes CPU thermal throt=
tling
> > > > > on my RK3576 device: apparently, the mis-read OTP-programmed ther=
mal
> > > > > trim values broke the thermal governor logic, which now works
> > > > > correctly with properly serialized OTP reads. So it would be grea=
t to
> > > > > have these merged.
> > > >
> > > > It would be great to have the sashiko comments analyzed and replied=
 to
> > > > as well if you would like this to be reviewed.
> > >
> > > Of course. One code-related comment Sashiko raised has been addressed
> > > in a separate patch [1] which is still pending review. The
> > > binding-related comments will need to be revisited, as I'd like to
> > > first explore the idea Ryan proposed in the adjacent thread [2], as i=
t
> > > will change the approach somewhat if it works out.
> > >
> > > Best regards,
> > > Alexey
> > >
> > > [1] https://lore.kernel.org/all/20260902-nvmem-layout-unreg-v1-1-2d16=
bebeb518@flipper.net/
> > > [2] https://lore.kernel.org/all/20260916123355.4507-1-untilscour@prot=
onmail.com/
> >
> > Hi Alexey,
> >
> > Have you had a chance to explore this? I have got a working proof of
> > concept [1] for the format I suggested, tested on RK3576 (NanoPi M5) an=
d
> > RK3528 (NanoPi R28S).
> >
> > Best regards,
> > Ryan
> >
> > [1] https://github.com/untilscour/openwrt/commit/a622c1cf292f7a4bb70935=
21e25436be324fc1a4
>
> I've updated [1] the proof of concept slightly. Perhaps you are busy
> with other patches? As it's been more than 2 months, if you don't mind,
> I'd like to send it in as v3 of this series, with you as co-author.

I've had a look at your proof of concept. What worries me is that it
introduces a "virtual" DT node for the MAC address derivation without
a corresponding hardware block underneath it, which sounds against DT
conventions.

I'd like to try a slightly different approach: have the CPUID cell
carry a dedicated compatible string such as "rockchip,cpuid", with a
binding description outlining the added semantics for deriving a MAC
address from it. Then have the NVMEM driver check if the cell is
accessed as "mac-address" and apply postprocessing before returning
the buffer. That's what e.g. drivers/nvmem/imx-ocotp.c does currently.

Let me give it a try, and then let's see what other reviewers say.
I'll add you in Cc.

Best regards,
Alexey
