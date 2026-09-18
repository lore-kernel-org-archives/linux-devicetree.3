Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962D93C1082
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715297; cv=pass; b=SE8rZ4zfJYdMLVbnFys8OSuWIBAF3w1aKJ/Tz8owVmEHufGiI49Rsuv2xnbyyj1Z68ntUx6Ut6o4zR4HkTubwedwNBHtACsJu8vmzsax6Pj1eHZy8aoAGCSmOUoY6KesmrAVgpV02+gbaaDDTNVwWLeTzm9dXmAFoewFmadyH/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715297; c=relaxed/simple;
	bh=bS1OBGEbI/rm6/QMdPtmnFgaRhDjFdxnhujgDAx/RlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rCDkkSYvm+Xhxx64R6uxxZlcLY7THZ4fpEiELUsf55MCyUcELEZIiKccBbG+qVLKYGzupasQcA3Ly8JRbdK8JAbTDQXp9PZr5zBbkTyjaYuIy2i4h03MluIqxYcnKs/MNH3vzPAxzQnmhOSYOW6+ufPHyDb0Fx6vwJfb2ZdSKjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=42LHbtGN; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="42LHbtGN"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f70553dso51636366b.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 00:08:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789715294; cv=none;
        d=google.com; s=arc-20260327;
        b=RZ7cC3np/t5NnEae1lSZl+azvv9jSEfESqWA2+vM++2ODMCUKX3e43r33tK6HKF0iR
         emjx77JVrwevIr1ClAIe8cQkMHztfAeGCcow5WS3HLCDQHn9ci1vQHr/dig9U/WiJmgZ
         wq1KPAepLJlaWBswCUXdiBVls9iXmMzor6xK5s9TDHyArgMkhvd40ZFKy6PsP/2tp+qm
         yVPKliKgxee1t7NRxDhZYxa9hqUG+2+ExtD98t7KDpUYQc0/r2fcvcgoGBo6vjJFc5M1
         CbVHUjj4fZ1hfv5fdVepB2Ta/pnjKlRf/G7Is05rVtSQScGvQM2N4jl5s4DzYDfryipY
         uLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=We4O+cegvJtoaqFGeYIsxacYH6oBV4cwy/gzDLBfJso=;
        fh=p7dbUOURZWZPewLc9GFAcJcaI1pxh5K/z3Yc98yuDVs=;
        b=V0rhEABYPyBS5XY4Xz7xD6Aw7l+WWANA6Spo8MmlNVBqIcYA1lfvgjIbq4go28T9kH
         aspD8p6h3OuUL8lIQAnO0PB7g0HZ1P2oKwPPLgMWIQmipKDasmikRkNq3lZhLP6QkpEi
         CUs82o1l/W7xohTiAEIGHLE1wt53URkwlzXxqfPIaDrn0C5Kpo4XhBHoP6iEsX7jJCse
         LwYVzc7qWJP3RA79eorI4bAxTxJ4BkoxMqNzboOraJdxqEyOKbjcGHnut178thTJQvd/
         KB1xWutLsMhZjSmJPxAbqwhsj4UjqEssqThqp79RgNgwjH1jpF23X4H2cONzk4Slyrdj
         c7Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1789715294; x=1790320094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=We4O+cegvJtoaqFGeYIsxacYH6oBV4cwy/gzDLBfJso=;
        b=42LHbtGNx4Y3KTaBwJhWR1fC/SRqir9xXlxi218hupWA5WwG/o5ffosEgGBVU56tgL
         WhL8jPvG5PR/Oh0LUTQIqcX8rubo7MA46fYhnTKPe0+jciljTW+UjdGlMoaWnOGgxDX9
         g38w2S+CvZSMNQvvLTYjJzbX2fKOYdxCCtYWnUz3kh0nJ+Da3FVIc5To2otqPbYlRNRj
         B/z2YCAb0WM1yqD1xsz6/oLpcYd3kIQlH9CPvfsTI5lu49cl6TOP44Wb0DugmVVR4oca
         Uuf/2u5yBCsGaO32R3QlYrBCxyFea2d2TfKk6ZbU7bWTRSMiYq3BLjWK1uoRl6KBwkyf
         t6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789715294; x=1790320094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=We4O+cegvJtoaqFGeYIsxacYH6oBV4cwy/gzDLBfJso=;
        b=Vtu/ze5HLj+LorZpaNiHQ7hjiB/8KNd730vl89uCp+5hJHSgmQJjB2RhZMbk4ASMGD
         Czdp2yEWUCREc70iR4+o46Svvfu1Vag/f3s5mfAWxEF86sRcP5mezPKdA5nANzvs0F83
         gFKMA6ux9oH3TiiPBcUIMEl9o1FInlK2lR2ERkHoxpC/+NHGtM7t3OqNGCyl1JzJ5e4k
         hao5muk+Rx9crgsv7OvYSaQp5XQ37f/MQviGyUlRnlUY5SM8xYVNby6PsazgR/jEKipr
         vbE7q59BccaQ6Zgfmz9k4hpNDP6cWw66S2R51JYgv4TIxmuzQFQkhqOFcfHm7HE2Ltr7
         fR4A==
X-Forwarded-Encrypted: i=1; AKwUvBwkZP64wY9vlF1/V0XwaiWVD1tFcvb4Anv3nFUquT/Abn1oXylfW8dfHobUpHIf8b4vUMeeZ/PzCm9+@vger.kernel.org
X-Gm-Message-State: AFuF++mlRwGIKgucqz/jlGSezdp7yPbJzNuBSbNSdqD9kdw1yaZtVQN3
	Ij+yAtN6E5xQeDMB+pmfvTK0VpCzZIPmovb/Nek0G7cQfD8zR/pbHbJeaFtdtq1GWt+nJMERqeI
	XKKdkVbgolwktR0Rw3Ftv1qRzP5xj9P4r6jsEVsRXJQ==
X-Gm-Gg: AYBFou1d+8nwDkqp8+6yIFfPNTjpxSBXmCTQ4GseViJhKUIUNV7HAWqXej4MsNFZmzl
	4Mok83Vm+DUsJeVvlVeC00qXOnuM+OOox07LkkaaWCWdzMn42BfzIkrS4OTL+Ki5xp8V1ZrgCKR
	caOcSl7BdeSRyKbdEb7F6k3gkEy8r0FlGcMFanQxSTiBLoLUQgVwu09S3YLrs4YPbN9q8oqSARQ
	8Sp4Eaxe914I9K0NGBCaqCX2fkO8DzS1Rode2hlr08I8VvXbx5PlX1MUAQal4x69ycUmyPAUer1
	wrJ3dnwhBatPrk6lBCHN42SlPkdelRxGmA9jSC4dP2Rv0SGMuN5TmrSj02fiZ8BL4xRI2tXCdax
	yfN1179ug+KOQ
X-Received: by 2002:a17:907:9481:b0:c26:1648:a069 with SMTP id
 a640c23a62f3a-c2a15e529e2mr150203666b.36.1789715293450; Fri, 18 Sep 2026
 00:08:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
 <CAKTNdwH9QAgreJ-6+t1j_P1di4VyoMBSsFkf_g=mCi_-M8g9Pw@mail.gmail.com> <20260917221857.GA4056431-robh@kernel.org>
In-Reply-To: <20260917221857.GA4056431-robh@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 18 Sep 2026 11:08:04 +0400
X-Gm-Features: AcwNN1V38kIzvvjNiCjrlXv4QyepNlxjuEonBAUHUeInRScoNnYe7tr3v4fBPpk
Message-ID: <CAKTNdwH6E5=9gZHB6tdianC2+1aDv4wnLmvL59kDW-dR3a12bg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] nvmem: Derive Rockchip MAC addresses from the OTP
 CPU ID
To: Rob Herring <robh@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Michael Walle <michael@walle.cc>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, Sep 18, 2026 at 2:19=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Sep 10, 2026 at 06:48:33PM +0400, Alexey Charkov wrote:
> > On Wed, Sep 2, 2026 at 5:08=E2=80=AFPM Alexey Charkov <alchark@flipper.=
net> wrote:
> > >
> > > Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
> > > memory, and Rockchip bootloaders use it to give boards which have no
> > > dedicated storage for a MAC address a stable one anyway: they hash th=
e CPU
> > > ID and patch the resulting addresses into the device tree they hand o=
ver.
> > >
> > > Kernels started without that fixup, e.g. straight from the SPL in Fal=
con
> > > mode or by any other loader which does not implement Rockchip's deriv=
ation,
> > > fall back to random MAC addresses which change on every boot.
> > >
> > > Formalize the derivation in the DT binding and add a Linux kernel dri=
ver
> > > implementing it, so that a Linux image can use the same stable addres=
ses
> > > regardless of the boot flow.
> > >
> > > Only RK3576 is wired up here, that being the SoC I can test on. Other
> > > Rockchip SoCs keep the same CPU ID at a different OTP offset - 0x7 ra=
ther
> > > than 0xa on RK3588, for instance - which makes supporting them a two-=
line
> > > addition to the driver's match table plus the layout node.
> > >
> > > Patch 1 is a prerequisite fix. The OTP hardware has its own internal =
state
> > > machine which only works correctly with serial access, but the curren=
t
> > > driver serializes nothing, which results in timeouts and/or corrupted
> > > reads (e.g. returning splicing a TSADC trim value into the buffer of =
a
> > > caller asking for the CPU ID, or mixing up trim values of different T=
SADC
> > > callers). Hence the Fixes: tag and Cc: stable.
> > >
> > > Cross-checked on an RK3576 board: the addresses fixed up into the FDT=
 by
> > > U-Boot match the ones derived by the new driver, and the driver corre=
ctly
> > > assigns them to the network interfaces when the kernel is booted with=
out
> > > U-Boot proper at all (via Falcon mode).
> > >
> > > Sashiko also rightly pointed out a use-after-free in the nvmem core w=
hen
> > > a layout driver is unloaded leaving its sysfs nodes and the postproce=
ssor
> > > function pointer dangling. This is fixed separately in [1].
> > >
> > > [1] https://lore.kernel.org/all/20260902-nvmem-layout-unreg-v1-1-2d16=
bebeb518@flipper.net/
> > >
> > > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > > ---
> > > Changes in v2:
> > > - Switched from a scope-based guard to explicit lock/unlock calls in =
the
> > >   OTP driver to avoid mixing styles in a function using goto error
> > >   handling (Sashiko)
> > > - Link to v1: https://patch.msgid.link/20260901-rk3576-otp-cpuid-mac-=
v1-0-ea9135270fc2@flipper.net
> > >
> > > ---
> > > Alexey Charkov (4):
> > >       nvmem: rockchip-otp: Serialize reads
> >
> > Incidentally, patch 1 of this series also fixes CPU thermal throttling
> > on my RK3576 device: apparently, the mis-read OTP-programmed thermal
> > trim values broke the thermal governor logic, which now works
> > correctly with properly serialized OTP reads. So it would be great to
> > have these merged.
>
> It would be great to have the sashiko comments analyzed and replied to
> as well if you would like this to be reviewed.

Of course. One code-related comment Sashiko raised has been addressed
in a separate patch [1] which is still pending review. The
binding-related comments will need to be revisited, as I'd like to
first explore the idea Ryan proposed in the adjacent thread [2], as it
will change the approach somewhat if it works out.

Best regards,
Alexey

[1] https://lore.kernel.org/all/20260902-nvmem-layout-unreg-v1-1-2d16bebeb5=
18@flipper.net/
[2] https://lore.kernel.org/all/20260916123355.4507-1-untilscour@protonmail=
.com/
