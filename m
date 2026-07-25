Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC333769F0
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 17:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785002131; cv=pass; b=HpmdnO9gqZbBb0GbP8MGlG14W6hEhpOJuNlrPAd5AND0HRTsHovOgrXNfiNx6nzZU1Yjzkg1qbbFXnXbmiPWy5Hd2iMwQ8U+5cPFyXhgq/1VCuqwZt0Cf5rT9F/aHhuUk6npW+UoqNShwd+MU5e+DVehW7ykBXypBt38VVOzK8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785002131; c=relaxed/simple;
	bh=b9kifEXDkgdbLZHjZehLYSHr/pku1ziKm51x7inSn10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MO4DT+e9a90vgs1ykTtyx/VcMKto/pJQ9pqO85Ro/04zwwBgND/hNVGoPxVc8mn3y9w9/xsARnYy6vttAkzIvWnXcT4NjKdLH0WPm7lwLEH4ENNguZgfDAiQeJC0CMf63NHIyw7lm5+vr/gwj9+cPd5VGt4IjeXNRbDs5mj3W20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eex3JwtR; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eex3JwtR"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeafa51b5cso185961e87.1
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 10:55:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785002128; cv=none;
        d=google.com; s=arc-20260327;
        b=m8CIfFQHcbAex1x1DWAzJEW+Qi4vBvJuu865hCmp5zJuugumReKgA5RZmrBGjFuew4
         y+bWDqDm12RhTX+5BYsITp5rkFS6SSxlV8OSsyhDg1LrhjDf6TSx+QMZvTUCLYInjiBp
         Ch6zwqsIZfBUtJjlAZzR9duHtZbQAECbyZ6sMt1bbOIdg+ja253AvG+Q9w1BIpdBeGEx
         MsY6FDsw2Gx52RjXNHZfuwkedbUuG+g+/YiTzAvtbsn6QlMMZpaNLAHuCpv7soK8iSJB
         X/ilL0Sm4nBzrndspN0nKDYFUOpFayMlxo8eByHJx4FJhKCjhO61As4rJcOOYTUsETBu
         4q1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yteFUPwKHiROMdXXI9GsH3+4d/0le9UOI6hRzkgiAG0=;
        fh=A0UhV/BS7aaHaAL1SGBdy4YEcJywm0auNmW5TK9izos=;
        b=FdHdpo/EZ1KeY3xcTVJD0/CMUpD8zEjGYyEg6jQGxA6SiWkQpNDOxhIGxDX8CTsI+j
         e/luLWA7rgmQUkQ1Yt3/KaNH8FSXuD8rAsZAKBeuk9TNOLp4aAXU9OABUQmdspVma7T+
         4dve+7+0Z1gHVAy9FIlDiQf11G+FmCtrhTJl5Dnx1QiXFjuwRYW0BHsPwEfxswZeOi/g
         O1tY6T62h/GnlttfiZkXyedx696IreqrFuR8UUANiNCNRp80t7GAcrqd4cf5kEc3oU8N
         oGGRXS8fXgegDGabOLNVibqpzuXv8tOl4LO22RojauIMIa2+vM+419PVaAu6Vgo1A7wv
         CsGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785002128; x=1785606928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yteFUPwKHiROMdXXI9GsH3+4d/0le9UOI6hRzkgiAG0=;
        b=eex3JwtR31YYut6FYzyZmfsXu2MM89tjTMw0boMjmq8TfH3XCpV63alHoBUnk1fe8w
         ZAt1JAEGwjA9cnkofssWT8nanC27IAYw9TGAmHo/gGOphsNW23zd68wRofg6ng7685Oa
         bxz1q/BTHP6R9oLmB6rIRi9gGG8aYh++web6k28Hv7yIJLTycwuN3W0cOpvYRSvnXye8
         6OZdPxqwEy7D0kVPJjDd/nXbK8Lv+uvf4+14jTjSf4tUjkv7s2N8AWZCBEjrbYymVgbY
         08Ag4J9OADmLW5v4HRXduBKyolt3rYmhSiKVqgVF30gU4w6Ckt8uNV3I1rZW6ilFVWx6
         5Rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785002128; x=1785606928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yteFUPwKHiROMdXXI9GsH3+4d/0le9UOI6hRzkgiAG0=;
        b=r8+LVQVuRsjqteOzZivqhGqNNJg6k+2/H96KHNCeNIpCzTb1Ni4DEP3Z8XMHmOYuWE
         57lOGtjeWOgqIOzlnKPX1WM+fXD9ZM2MBFo0sLreOmCajw3p0kkEUOtBd5MTKFGEpyaV
         H5x/lAeBWyljPt6v1fFEBHV0/N3cJbGigEB4/H33/UIrnlOAAeNOoOIAMX9BVk5dBQOk
         z6A9R0MG0kRYsCJZN/9/o/e4TtLXAbdwL2F+Dxj622DVJ4kB/rVusdnttSuaQolkFiWr
         jRbvMRwci1UWBwRUcK0bX9eSFa+nReV+GIEwDBFqICSsJlOBQdRMTiTYd+uZ2Vs7szBF
         9uww==
X-Forwarded-Encrypted: i=1; AHgh+RrHr+7H6msowQ8Y/fzP3b1PI9oq47tSJAWwXVR/VTICq3/9RGZyoca+wNhs1LOzzG+IO3BD6UaJBQSI@vger.kernel.org
X-Gm-Message-State: AOJu0Yww8XecKrBqiThHl3pLbvp0sxQMhrK48WJZR9EesCRJi2UACcRT
	59Qiedj6jy1kEFECAL2mKrFZfLf3BzGG8gRuxlrAfbnu+9r3FwxbhW1mkzpowtsdw5jlJxs4uGb
	+5lk0///yZfxcATYn645Ro6NjIpuVpRYKsH4m
X-Gm-Gg: AR+sD13Meh4R9OCvkumnZRojP0HSNcJ5yfosSZo8mXQ22haRyXKrVvqCahuznzq5I/w
	sPXwzbsQ5GwhIBv1zZEwYIAggXq6CcEgANXTz8k7dIQqh5mr1krko5RNEIzrEsVdyRQtiVfXAo+
	wR1PiF5xE2fBdbyexiZXSm7W4gFEbYU3QrrPbZSh8LfSV5HL+UiPoDpVmz789caQDbatUjW1hTJ
	uyuxTrcHL1gPu4Mmh0rHWOm+q58p1smkb3CUapFKqlIzzJfELBtMdZ0/ULfV8/yYC8xx73oUhb9
	YGJ62wpDpheeB6bhU7mkahIzPmnOpBKueT6D6gihZ5Leo0cc8b0e/1zkNIeWe/U0GM7E5iEJx8F
	faUPdNbRqc/w=
X-Received: by 2002:a05:6512:2520:b0:5b0:6aea:cdb5 with SMTP id
 2adb3069b0e04-5b2c1af7abemr344844e87.1.1785002127934; Sat, 25 Jul 2026
 10:55:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721233452.112204-1-chenyou910331@gmail.com>
 <20260721233452.112204-4-chenyou910331@gmail.com> <20260721234526.4300B1F000E9@smtp.kernel.org>
In-Reply-To: <20260721234526.4300B1F000E9@smtp.kernel.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sun, 26 Jul 2026 01:55:15 +0800
X-Gm-Features: AUfX_mwO0exdk6xo--FQSz6O3-k6E9IELUmukLCixnAOZrpUBTapZU86C2pRIFs
Message-ID: <CAKspUhJnvEb-W+a8UEFxUKN=T=dyTpBSA5su7NrC1nszBuGsGg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Confirmed, this was a real bug. The address was carried over from the
64M Duo. The 256M board's firmware reserves the top 2MB instead --
the vendor device tree declares memory as <0x80000000 0x0fe00000> --
so the region is 0x8fe00000/0x200000, matching cv1812h-huashan-pi.
Fixed in v5.

Chen-Yu

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=8822=E6=97=A5=E9=80=
=B1=E4=B8=89 =E4=B8=8A=E5=8D=887:45=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Potentially incorrect coprocessor RTOS memory region address c=
ausing memory fragmentation and risking memory corruption.
> --
>
> --- Patch [3]: [PATCH v4 3/3] riscv: dts: sophgo: Add Milk-V Duo 256M boa=
rd support ---
> commit 0fb7e443f556963d48319d1228e77903653e11bc
> Author: Chen-Yu Yeh <chenyou910331@gmail.com>
>
> riscv: dts: sophgo: Add Milk-V Duo 256M board support
>
> This commit adds basic device tree support for the Milk-V Duo 256M board
> based on the Sophgo SG2002 SoC. It includes configurations for UART, SD/M=
MC,
> USB host, and the onboard status LED.
>
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch=
/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > new file mode 100644
> > index 0000000000000..21ef6ed9f0d21
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
>
> [ ... ]
>
> > +     reserved-memory {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <1>;
> > +             ranges;
> > +
> > +             coprocessor_rtos: region@83f40000 {
> > +                     reg =3D <0x83f40000 0xc0000>;
> > +                     no-map;
> > +             };
>
> [Severity: Medium]
> Is this reserved memory address correct for the 256M board?
>
> This address (0x83f40000) is at the top of the 64MB boundary, which match=
es
> the 64MB Milk-V Duo. Since the Milk-V Duo 256M has 256MB of RAM, would th=
e
> RTOS usually be placed near the top of the 256MB space instead?
>
> If the bootloader places the RTOS at the top of memory but the device tre=
e
> reserves this lower address, could Linux inadvertently overwrite the actu=
al
> RTOS memory during allocation? This might also artificially fragment the
> contiguous Linux memory pool around the 64MB mark.
>
> > +     };
> > +};
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721233452.11=
2204-1-chenyou910331@gmail.com?part=3D3
