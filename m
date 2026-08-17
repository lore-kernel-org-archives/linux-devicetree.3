Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF343F54DD
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 18:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786989981; cv=pass; b=EigTyvL9+cdAMuQCnWMOtOasz3103Hv7ulZ00CZ/rbvt8p69GYeZ3Y0LQh1o/IkxEjrdI4KTOFJEy9ReDVchv2BVvGnJqyUjYxLgvKprqUtUKYPPBNelSZEZl3wLEJIkD0PI+fBoIjmpJYmxVSmqj78GvShJKQrVUyw38Re7kQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786989981; c=relaxed/simple;
	bh=hY2SxOvT9o/Xp4zyoVoyVI3wZEfRvmTSP3mGP0ibUFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uzWit/xmQhUMyLUuNSFuHkjZXMjebnQuKKtUB1IjCY8H9aQpa5mPBajYnS2R/u8h9MiuP0SXfH5W4t3SfYZIfoGNS+ExdwxanUIMYSXKaWQgRI+GFLootFW1+hwa2e4nSn2doYtS78/zTR0afislQfiAtiwPYnlW+YB49OliOXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJD5nkwb; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJD5nkwb"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b45f1cd80eso2684405e87.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 11:06:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786989978; cv=none;
        d=google.com; s=arc-20260327;
        b=lJIeMhJMbm2Q+lcj9PU4iSwtgTtkZU4RpWGmU0wMmTwSQ+xcu579xv5MnhjBPPt3mU
         OUXtku3q1ilh3xmN4q2PjuHOoSAhonhIei5znukVHHKJQILugRfJjOH0VHVcgVc8jz30
         gRQA+Esa4nUaZZaK+Hpjbt+D0yHaCKhuBYHsmovznNG75qcBovHZc4obquyXCiudUttI
         fj93Qep6kdlwvFA0xNbW53wwWCuHGdhUrEO1YEpkTEJIAWM1JPhYEx6IEqinMwzY7xCj
         ouAsQEpm0+tpEHUReeU6ae/iV6O3zakNK9EK/slalVgV3mcdr//7aJ/Ic6uN6y6eacCA
         PPjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c7o8fQxkzDHp1SWA8zZhLGLxaxvN0qtBR/ePXDA3zRk=;
        fh=/V9W9D3HT4Rt9MSJYYnWDQIxerluvyufjAvilBISykI=;
        b=ajxtF7H7fjnTyEHjkcWyAhaWG/VjBkMZ4Pdk1SQ0+pWeZKvkaYwbppJKM0ufaZ1XGd
         k3ZmiaZ86nfO+uV9+qV/faFRT94lhUvCSv7I1hflC2XoQy1Gwjsy+gmQaT4BJnXMMAtk
         t+CdwNmRWpYC+zmMgVohiaZvoHGpaYjsQjzxSV0HaZAH3XnU2CH7q9yvfWDZFfBurIPL
         e7tePR8TMkZC1nkJHN4dmg2egHW5gHGjWxFrXGLpk0ckcJkeik0ugAA/rEYivAyXx2jg
         v2SMdx83IOIrVlPt8ZnajPohfbXRnpsELr9kR5rqzHcI6h+FvMrT0gANHqNgndYxfnIW
         fUjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786989978; x=1787594778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c7o8fQxkzDHp1SWA8zZhLGLxaxvN0qtBR/ePXDA3zRk=;
        b=cJD5nkwb+thIWOIDJwA4hC6GwnESECMsljaAWKJ2CbhJD4sbmTHoofqb8pm7mhrxJZ
         S4is27pBmQe2JdRlYSmz6rYSmmHKqVJGI8fI57Lz4txacKEyeA39PbGSH9wk/1mvQ1HH
         EF9MG9+QljHr9wZzArfi+kOhjsp/dd/ndLwKnByxb47/0ns4tyBgpyb8DQMS4+CGdwK2
         qM3UgoRUhpTczsTyXyTqlBsZSNewt1qgcpMQ4Ge/CNtZqAxGpnA4Y1sno0+lSoG7/dSF
         x1nvy7vskwUR8Bp6f63VROsFInB/ps8V3ttNK1BFXrWGY5pxyzlPF4a0OpNZE0zoHK9/
         XsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786989978; x=1787594778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c7o8fQxkzDHp1SWA8zZhLGLxaxvN0qtBR/ePXDA3zRk=;
        b=YOSi9a23rsvuH6vzyHhHzbuS5YRfQTmdz4eavYGXfY7n4DTg5Sr3ilmBv1lSOeSm7F
         Tlbns255z7g8BXAMdkVC4vrDdkbnCW7i+dKQMBzI2B5GLHNm3ZT0ecfrDRKcROhpOYp7
         Bpr5kEd7uTPUAVaXY2Z8fWNAR7ORbjKYOLr67WYh+HXH1tpsdm6dKoKCR6TbauRKENKz
         inJOYTOK/tBmAyad9hldjrcj3EcyBx3bnMfPygtor001pb6iEX0tKRgxcwM3ijNmelJj
         YTU5PzFMcdFtRzRozooimSi5hBQbLNtcFSgMoYKxfbDKggYREKbny+pptJnD+pFgGu0K
         9w6g==
X-Forwarded-Encrypted: i=1; AHgh+RoWGNl+KIhdcjN8zuSZKkeHH70jG+JDTuxt6VD5we72ekU0xaC2OeZHb0rYTHufrgl+3BIhQVjEYvEd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4R1Y2/rx91wuQWcpcQSD5TbTtlB0478vQTW3mb4+yrDl//7TY
	oMoR1ubujsTtYnbvK1OnBCylQTkLXKBAwlter7wTLl4xu6rWZaNnF6uRk1CIW+Zi/cuQvjxl3zt
	yZgpm25r3BMMGd+ppWZmGzRXPSUMGWQ0=
X-Gm-Gg: AR+sD12ZaKGiHGdqm7ZEBMGebvGGzvkszOk1KvlUlM3Bd09wfU3bM+vd92PC3p8TgOB
	H6nnpSeUDvpMhVKwI2amLYHQ8bZvwzoSyx/wiMGuxIiJEIeYUcfqKchKjYDEaRhc8x5D6MiVsIj
	tj7BMumwNi7vsokLoxfrFkcUuNsYofAQtZ8mBo9ay0XPiJNaQ+Z+FOAKckPtzI85KYeGuMHLfSS
	WWL7kPJm7did0pRxxjRKCADlaE+hSLJTiL/zIbWYzpm7f6r9sKDgt3xyzmmnLsokiaImgaxLdGL
	xxTrGvOQNA5lODevv3iHlF91ukh/Fj4ddKPGceWp4OSisS3Opd4bS7iYudaMyZn73lLVHrorr2n
	HoqsuCT996KOtnuW8drNWJrBXbg==
X-Received: by 2002:a05:6512:39d2:b0:5b2:e890:e6b4 with SMTP id
 2adb3069b0e04-5b4591418c8mr4225069e87.36.1786989977421; Mon, 17 Aug 2026
 11:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786746757.git.ahmadexp@gmail.com> <d5df0bb5c312478279f0d2fd5ec6305e41add5ae.1786747084.git.ahmadexp@gmail.com>
 <20260817-invaluable-hog-of-current-b0d0bd@quoll>
In-Reply-To: <20260817-invaluable-hog-of-current-b0d0bd@quoll>
From: Ahmad Byagowi <ahmadexp@gmail.com>
Date: Mon, 17 Aug 2026 11:06:05 -0700
X-Gm-Features: AcwNN1UfcBdidSzggHJjTL7Ud4WaUs0LCKzrRYabM4qhMdfH15u5P0J5gt3C7sw
Message-ID: <CAOQiBWNKJc8BPgmQg3nRBgzXRaQUphfRXJ6JXT5e=z-y15TupQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 1/7] dt-bindings: leds: Add IS32FL3207 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: netdev@vger.kernel.org, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Nam Tran <trannamatk@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Resending as plain text because the mailing lists rejected the
previous HTML copy.

You are right, I should have explained this explicitly. I dropped your
Reviewed-by because v5 materially changed the binding: it adds the
dash-suffixed multicolor-group form, makes reg optional for that form
so groups can begin at outputs 16 or 17, and documents the
RISET/current-limit relationship.

I did not intend to ask you to repeat the review without explaining
why. I will record this explicitly in the next revision and will not
carry the tag unless you renew it. Sorry for the omission.


On Sun, Aug 16, 2026 at 11:42=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Fri, Aug 14, 2026 at 04:10:49PM -0700, Ahmad Byagowi wrote:
> > The IS32FL3207 is an 18-channel constant-current LED controller with
> > per-output PWM and current scaling.
> >
> > Describe I2C addressing, power and shutdown controls, RISET, and
> > individual or multicolor output groupings. Require board current limits
> > for each output and document their relationship to the RISET-derived fu=
ll
> > scale.
> >
> > Allow dash-suffixed multicolor group names when a group begins at chann=
el
> > 16 or 17, which cannot be represented by the common schema unit-address
> > form.
> >
> > Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
> > ---
> >  .../bindings/leds/issi,is32fl3207.yaml        | 281 ++++++++++++++++++
>
> I do not see any explanation why you dropped review.
>
> We have enough of other patches to review, so if you ask us to do the
> same work twice, it's only fair if we just skip your patches.
>
> <form letter>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
>
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/s=
ubmitting-patches.rst#L577
>
> If a tag was not added on purpose, please state in the patch changelog
> or cover letter why and what changed.
> </form letter>
>
> Best regards,
> Krzysztof
>


--=20
73
With best wishes / Mit herzlichsten Gr=C3=BC=C3=9Fen
Ahmad Byagowi, Ph.D., Dr. Techn., P.Eng.
Phone: +1 (650) 924 6653

 Please consider the environment before printing this e-mail.
