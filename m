Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D92B396590
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067711; cv=pass; b=k0Y/rmkOEsit3SkNZs7xPdVlbfgifJnCXzC0tefVFJIWLkIZiz0f+YqhCUshaeZG/B/xMNIHo+xLrLdRLpz2pQ6UyHVUbi4Nq/rY163wvlkeNzmFYAhGOefxHMskHC9TxCHXfNskog4OMCLOtt0SmhkC0+FkN/1lEG/M0eX9WUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067711; c=relaxed/simple;
	bh=8VnhIoj02WULflqqgWqAu3E/FZcCIYMP+zvbnxKj2aI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nILNYAfN+uVwnCkN+it7dCLIXUG5yZVeyGnoJwqecX26HYsYJuhHitoS8I8vU3V3GylUcPKnl3SGp+zpjeMAgs+MKwBhnmsWpsXI3xM9ZGXM2x9ygvyPHpQ4ge0cgvmPz+myYb9O2YJpPWCFhTg1KaNLqwm1ltX+rJ57+bYFVAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0Njt2Xl; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0Njt2Xl"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9382e59c0eso734902566b.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776067709; cv=none;
        d=google.com; s=arc-20240605;
        b=F6loE5V6BV8ZhSyUONPUpX1J2eoFQtUTKuKIsczXqkD5HZ6gsn9qoFtdex8yranfeL
         /qeOEWnNT9QXb9HiPqF7FjB18c9bhKB1LzO4LyM37ni0Dr7rWB8tywzwxp3MG2rWFQhE
         N45TogkaMDJT0fv0R+fy+f7Q9cEGPH5tNCZf+kuw82JYk5qpfDo66L1yswGtJqb1Muqq
         45CtMxzxsOYAi4ZLytUDfo81YdWdT8pJFVtjEGrTlZOS7xAeOAXxrgy3pKIxRS7BYeau
         VKfPdMLd803DDw8hQoHjuBnuSPj77HNyxVsLMCUAUvJOLkHH5oLm5qa8ezWXA9qFinPJ
         tlSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fvkP8KzDKek7CehUY4JTh8N+6Hv3yrPu4Ys2u/4PdPc=;
        fh=HZStbarWiTfWqDKaEZO1G02uQSgZXp5BJ++hGOMhxWU=;
        b=aH+C3ZAqhxXDl1Zo+f4Ml/M19k4DT8gKvpdiVRHr8ZX9lUxpVaddmcVANgRxglDilX
         ZtolVKTciyMvFPP87D4JGv3oY0WvLgDUzmCZRliT5YrHHvVwrwnDQXp170SHCV3fS7e5
         cj+7AkTirjsXnfJ3GmARJin5ePTWbX/mi0M2nx3t7AvUKneO7WAD05zvsa793q1Helev
         AYOKPfgo8s5/mBERare2C2hW+7096Y0ztHuHFYVsapxAklnUEwX8L9gUh/Nx7uVWr2TH
         3lJyhG7VJYL/ta4aZPvCnA4YnOKRhsBf/0KJ6ZBZJwwY5Iv2FSNgRzRptD3LsmPAHAm1
         1KKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067709; x=1776672509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvkP8KzDKek7CehUY4JTh8N+6Hv3yrPu4Ys2u/4PdPc=;
        b=X0Njt2XlAwuLFmJovw7MJjUw1XZtfOsK6iGvcWNxJ7lT7iwhY9YlL+OdNYQ6uUxEF4
         NWkL2dpFX4fFTLn90cxlDiwxXTT677VI/13OmK/DMpvwx91o2HTIi775SeIVYnSFRHru
         w0BRXh74UNOeBU4RygvrQlmeimqCmshHxZFCiCdlBZRlkicggs6nozqyJMCUYAacsbdi
         Ad1WW8hxidXXmSsf23u5h+pHYr52HoQfqZ3cAcUfwZQaXyKYCYaHack6H5oPFRDX7/AE
         WRgZqJ9AnStLROG90icXKBjUeM7ova6tjpdD3twImtcO3whKu2oXBCkVW+rZ/SeoyHAw
         sqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067709; x=1776672509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fvkP8KzDKek7CehUY4JTh8N+6Hv3yrPu4Ys2u/4PdPc=;
        b=BaLJr6NSxlknTR9xsDsNFZxhaKhhIwremRo6pd1hz4cHIMLAQPN52ykazUuBCH+j+W
         vcRlQY+X+VLKb9WWd/FZl6aMJV8btgS5PKYOsKeZjJck9HmwNvCclAh3nNu9gQXfbTYH
         /AtqUKxvLMkV3TotYW6fBh5BT6Jlq8PxrlJe5R6tDGZY3D/iOQnw8NBRwt9ClUeE5N8D
         sOVbqrEPZohMwjJqzRra0ICla/QyMHZ5wIKhtT8Fgvc8hDvn5zl2CBSZcZ4AGXLKR9+b
         zoFrHpaXsm09E+UF9BlGpJdlsLCjGP89yROx/YEYjBfk/46Nqw4XvQK26drxxlQc7aIc
         uEgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUucdvUGJ4Nf6qCJIv5wcYB/nwruyNsozIe+5FqMbFWzCi1PElkSNsEPX7fqup7ApDsbbVe46F/8r4S@vger.kernel.org
X-Gm-Message-State: AOJu0YxJGkweT7Y8F/cGjsk+3u/tt6PFTWK2iNpQWx91qy6CfjPUfCR9
	CwYb2KHVMFlWkDNGWVdiUUjxShjTo3yeRKt7HqpwBhNAJJpYVicB4F1H3GTlTEhs+KrZfP/dH9D
	AgFAUxiO1jyOMWFRtYeRobQKV5+yJsZ0=
X-Gm-Gg: AeBDievdI+8+vyk1OrVz7fo63s5oMztSBCHAnL7teoxnuVCG0PDtMN0wDpjD0I7ss5E
	G+N9pWbKm5fFM9DMBPMX1WTj0ldNBfn/0pKtmgDXeOJ8xGIy6aaJcX0QO6diTlCaKBjgnxVHzpJ
	gHwZngntU9cLJ+PdpTICiccOoLpLnqfT/jvcvyarVyDIm7Mf+B1mgJdEjGMMFPJR+wK6c5Ef+Nq
	De3ZAa/DTNWe4aheEgAb1NhPSdDkoL0x7tlf9QZJqMYg7Oza/VifkcZiXllT9MhpkdqlxZckUYs
	yFGpPNKeLnYkWLqQrMk=
X-Received: by 2002:a17:907:7281:b0:b9c:eede:adba with SMTP id
 a640c23a62f3a-b9d7248aa85mr708424466b.13.1776067708140; Mon, 13 Apr 2026
 01:08:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775900045.git.zhoubinbin@loongson.cn> <CAHp75Ve59GPAFvKM6yOkPmr=kmHBjVL-Vz78X0WDikiWd+2arQ@mail.gmail.com>
In-Reply-To: <CAHp75Ve59GPAFvKM6yOkPmr=kmHBjVL-Vz78X0WDikiWd+2arQ@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 13 Apr 2026 16:08:14 +0800
X-Gm-Features: AQROBzBp1_1f83xVVf78iSav36n4yOfOrZ9Vhqu0U5oqBm33LFFYkL6t-qaEFjA
Message-ID: <CAMpQs4+QmyAObvCcJOFnfTuufG8=M0q5m+XMkaP6-SOp-8wq9w@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] i2c: Add Loongson-2K0300 I2C controller support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-i2c@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy:

On Mon, Apr 13, 2026 at 3:52=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Apr 11, 2026 at 12:58=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson=
.cn> wrote:
>
> > This patch set describes the I2C controller integrated the
> > Loongson-2K0300 chip.
> >
> > It has a significantly different design from the previous I2C
> > controller(i2c-ls2x), such as support for master-slave transfer mode,
> > and  DMA transfers (implementation in progress), etc. Therefore, we try
> > to name it i2c-ls2x-v2.
>
> ...
>
> >  - parent_rate_MHz -> parent_rate_mhz to avoid CamelCase.
>
> Was it a special requirement from maintainers?

I=E2=80=99m actually a bit confused, because when I submitted the v6 patchs=
et,
checkpatch didn=E2=80=99t issue this warning.
But now, it produces the following output:

scripts/checkpatch.pl --strict i2c-ls2k0300-v6/v6-0002*
CHECK: Avoid CamelCase: <parent_rate_MHz>
#512: FILE: drivers/i2c/busses/i2c-ls2x-v2.c:437:
+       priv->parent_rate_MHz =3D clk_get_rate(priv->clk);

total: 0 errors, 0 warnings, 1 checks, 574 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplac=
e

>
> Note, the physical units are special. The m and M have quite a
> different multiplier value. So, even if asked by somebody I think it's
> still arguably should be kept as MHz.
>
> --
> With Best Regards,
> Andy Shevchenko

--=20
Thanks.
Binbin
