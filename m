Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED59B3A16BD
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776072386; cv=pass; b=P5B1pNd6x2gPME7RSMlyri4O1z2T6vwH18e77Vss7ENM8UH0XgrTYWY/Zmq01TYp/tQPDC7PKLIl2x4vE51vX8+aYK0Y6GEG9k4KsN2vPuPChzpfwfrLsgOLwOCYD/wqNovy50KxPcJHPzXNqf7VIR3GIXoM2SwhRg92hCWvwwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776072386; c=relaxed/simple;
	bh=AIj8v0Hi8sQvxNr/C2OEW3Yh01lDZBaIZhuDD3/FUIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+SE/czMh8FgjbYhl7CyVMXMffpDCECXL897UPyrMiWY2pNSOrpXQzrZ2m3AA/FiCpPXKWS9UDdQLlXhtJKqXQPBJuxELtTD0jqDpuYnnSNPX/SIwx2iwlEYqjJzoCfpfd9siMjjkR+3SSAAFI+KCk22RfC5kyBz4intZE/leBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpKGXT4e; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpKGXT4e"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6718f336888so1067438a12.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 02:26:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776072383; cv=none;
        d=google.com; s=arc-20240605;
        b=hwfbz22ZKHuYBGkxTNLrW0L37Z+yq8JqBUlBLUFpwVEQdLt/RqWW4G4+Q8TCz5JGpC
         ohm1QOMnhP8ANlPX+SslXUVj+FrOTOKzapo1yWW2BN42UlT2eMdxcV6he+Sf334UqSVK
         xKH3XVBZ7lUD+IkCOftYcHZVq9bLpPjA/RLP+1XKwBeytNEsXAxE8gab+tIWTYkWWlUu
         8Lyzz/bFwA3/soGQiHZPDzJ0bRAsMPv9EI5glADIEpLXHkrKgcwKSXHIL5UGeQfuXl46
         xCs2A8A+vYDYMT6tN9CLw9y2Ek2Fwt/X2fHggznySpwNesOTxPKVuHIVgMuYqGo4nLDJ
         c7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n3iu2/uJJ+f3nvEEkeX9hHnOtEpFD7REsnR2pQwo48Y=;
        fh=eFOIVyRL/QegtyvPFYbUEjnQGLvHftx/OK7eFRKqfs8=;
        b=Kje8SexgeQc1GOGyM9A/p94rnYIZ61kTYpHaSVqL/4Ub1LcoL58UBgvk/sOV9upGRZ
         hMXnCYWGgMm6CfkwtQAsmcTo0hAkC4KltUtJ3EGB8/mA3dzMOdTfLx3qopydjYWNIuv7
         cmos5nMkdg4+1Trn2O9ijWC7SxWnjDA2Wukw8YpSGlrv3p0OEld0XZegC2szGA7Mqs5u
         Ak1rOxgEZyDBqZx652dXVLp8ua1xPIE6Qjy0WoIx6Dho6czPE4iS91XpQOurR2BMeETt
         QbFE0pY3IzDkdoAiHi5vT3m2RqIRRAboUf+nSO7pug4/cqPSXeGBpQgTMy/q7zLkVVFd
         TO9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776072383; x=1776677183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3iu2/uJJ+f3nvEEkeX9hHnOtEpFD7REsnR2pQwo48Y=;
        b=DpKGXT4eKUOPmGoqmf5ucGXl2aK6FSd7vE5q9FLxtd/gtoZQl8vXRescoBW4u7CW6e
         rwbJG01mF55h1YyBUopzO0OIv/FvFg5BVDevT4gn7HDa3ad+zdAdddA14tuU3MbO4m8a
         jP1I9EYkHf7dkH6OkhUIEo/0kgr+YCZ67jZa8Pjkn744BTPlfbKi9jpOI4mqHnT+Dhs9
         66P7IF5ONRFZGFRSLR63xd+HS1ezpWNyUebmXHdyfBNT8f12INddZ0yu8s/W/MPCbgks
         +lAbGYwWSooNqCb0ezT7ZtFN9KFyKtZ56R9t/ylNODOU9/6BeWPyjs0W8dty84ThlKW7
         Y90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776072383; x=1776677183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n3iu2/uJJ+f3nvEEkeX9hHnOtEpFD7REsnR2pQwo48Y=;
        b=avRPLnxRLs2KH/Q2tCm+j6iGkNa/xyqm5XIMEPvE0nzFdtfq9ZOg9++du1BK6vlzVe
         cmU87D07uvCc54wLEwtlv+sr+/UjfshiyM9M0XFua4AFvlyXgs6xvaVDusk69dRliHan
         H80QybhfX6HXvVvMhYqBRnRm1JgzqaOr6dEwJg+WtMZBXqfR7ox9WteR4swkj4rXtBYQ
         wcl6zYCfu6OkICX67Zf0sh7DVbTxnojceTu7AYm0tCEAbW4U6xhvNiroAtq9I+mqZCSL
         wMHCXkIVPWCgbOs6TrLCwkJSqKZfRn5m2YmVoFnk7qzWlAJmSLPUgXvF7WDs3iEWl6BE
         +kXA==
X-Forwarded-Encrypted: i=1; AFNElJ9is3a+Ec2bDebum+o9AqpXft/5d0fgf1koY4C+eBqYi0h6FlhpxusYwmNUQjNMBk1OhIv+e/GGIDsP@vger.kernel.org
X-Gm-Message-State: AOJu0YzxYyfoXvMS9i3yAztV4PdFm/JyaeouSQ0WDlCIIC5zAPl22Sj4
	JP12IgNakSYSc2s6eM9X71qOIBJkGe+etQMsdQL+niCL+KUT/qc5orQcWDf6q92rNhi4vEzUiom
	ecyMjbjt3QRb4JT0KkXqSgmHD+yGqv3s=
X-Gm-Gg: AeBDiesZwXZXBWQFt3wQEo0ZltdFp0LSS8CVfpuoSLpHDzMGqHonQfUDTJZu6pf4nsY
	0+5YwWfXsHEDmMZiiPvrqMiYE1cAJLC9ZV6D2bkgVVnF225/QXZVRvRzNNnqj3z6YiT2+0gthXo
	zWA7LG1vUJckwJmN/Ov7kwJpN4Z6e/qjupA9vHkSbc/9gJNeXMq6RbuhQnGSqxCLElqZm0we68q
	RQaOGpMpW2CTZgoIOK2vngQ53LG01vFyrTcSYEt0XwY179K7iMmRmRZIM5zxId/nMk2MZhwyccH
	XCzWPFnF/nC28760IlU=
X-Received: by 2002:a05:6402:34cc:b0:670:8d21:dcb with SMTP id
 4fb4d7f45d1cf-6708d2110cbmr6408870a12.19.1776072382964; Mon, 13 Apr 2026
 02:26:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775900045.git.zhoubinbin@loongson.cn> <CAHp75Ve59GPAFvKM6yOkPmr=kmHBjVL-Vz78X0WDikiWd+2arQ@mail.gmail.com>
 <CAMpQs4+QmyAObvCcJOFnfTuufG8=M0q5m+XMkaP6-SOp-8wq9w@mail.gmail.com> <CAHp75Veymi3z2atMuSeDyrhyx-HLHgCMzJF5EgpJZzTGgpcD3Q@mail.gmail.com>
In-Reply-To: <CAHp75Veymi3z2atMuSeDyrhyx-HLHgCMzJF5EgpJZzTGgpcD3Q@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 13 Apr 2026 17:26:09 +0800
X-Gm-Features: AQROBzBh6eBs7REn1Qv9IV594bWuIgt_mTQzWy_FshpZ6l48Ew5CqcVKTNMWbYw
Message-ID: <CAMpQs4LaQ27ZQhyv-s1OVcBF=4DR=_SiDTrpoB7F4qPRHEWB1w@mail.gmail.com>
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

On Mon, Apr 13, 2026 at 4:18=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Apr 13, 2026 at 11:08=E2=80=AFAM Binbin Zhou <zhoubb.aaron@gmail.=
com> wrote:
> > On Mon, Apr 13, 2026 at 3:52=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Sat, Apr 11, 2026 at 12:58=E2=80=AFPM Binbin Zhou <zhoubinbin@loon=
gson.cn> wrote:
>
> ...
>
> > > >  - parent_rate_MHz -> parent_rate_mhz to avoid CamelCase.
> > >
> > > Was it a special requirement from maintainers?
> >
> > I=E2=80=99m actually a bit confused, because when I submitted the v6 pa=
tchset,
> > checkpatch didn=E2=80=99t issue this warning.
> > But now, it produces the following output:
> >
> > scripts/checkpatch.pl --strict i2c-ls2k0300-v6/v6-0002*
> > CHECK: Avoid CamelCase: <parent_rate_MHz>
>
> It's a false positive of the checkpatch.

OK, I will revert this change.
>
> > #512: FILE: drivers/i2c/busses/i2c-ls2x-v2.c:437:
> > +       priv->parent_rate_MHz =3D clk_get_rate(priv->clk);
> >
> > total: 0 errors, 0 warnings, 1 checks, 574 lines checked
> >
> > NOTE: For some of the reported defects, checkpatch may be able to
> >       mechanically convert to the typical style using --fix or --fix-in=
place
> >
> > > Note, the physical units are special. The m and M have quite a
> > > different multiplier value. So, even if asked by somebody I think it'=
s
> > > still arguably should be kept as MHz.
>
> See above why.

I see, thanks.
>
> --
> With Best Regards,
> Andy Shevchenko

--=20
Thanks.
Binbin
