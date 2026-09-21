Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ADE42B301
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976059; cv=pass; b=TcE1ToruOEuxAMAYoOb9fHFtxMICSTte++/S8znM6+Ig3M11OuqCziLjckk6D9eQ4F8YUwnk+6+WetRqwy0YhPfFfQ2vgHpbWCtWLKF9nnfRMKga8n0OW4cKVhLLFZlLPpAM1V1r1Jq3d9tOiHg/A7Lz3J4Liv/xVQ9jY7wPJbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976059; c=relaxed/simple;
	bh=57Sok7jJDa/57dP/GDfeHEhYnwuYZlpWnaikd4BSZrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=crniq+feB5WmMHNDANb/c2OA1NuEKdbR/FlV1v4ni+xNe8bWgkwedSTmGmruPKR86QphKorQx0b0D8tStmDP2lU26xxYWr5+qyoVEDrXgAfyCRwvR9L6M2BUViUDyEFf1qBqzM4nLZQwVod6GofcsaSOfsF93zOhexxBggPAeUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRho8oHk; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRho8oHk"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so2322593a91.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 00:34:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789976057; cv=none;
        d=google.com; s=arc-20260327;
        b=lixheSH1akWfwczu+jRIO5VpAp2bXCCiMTNjdh2RRkqfo+zZjJpWxnROwTDfp/8yg5
         a7dUKVveK9AdoHoIk2u6mMOox39T7xXae6mbKJTY2koUYLJdEBiGTbUpLEYuyy9SsWKV
         m67gj6ktFnhTi8k4eptdPtDMLf9BsvvKF+VTGHwotmzMNNHg3J+XZe2B1L8kRoEZaCS8
         5fof+aPVnQLnQkFlJxeHkoR2fNetmjVhNrku2azLvVkRE+8d16QAd6TSQYZ4Dh2kEX5m
         QC8pQ9TSh+7dpZT+OY/tfWcI8/JLOQpspMcx3HQeSo6S3zCnTJVrf5xDtT/IwOH8xht6
         xOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i/KB7XKvlLtdNPe51SuZ6hkHW35ikyi0W/vUmCBDQwM=;
        fh=b36f5qdsCKKypqTpjdowbJ4fuDqDYF2FgvJsGODRa7Q=;
        b=FLKGjmmMRevrChN7WU00P173B4Lj4kQXPT3fU3/cGdETVqmN51gbarXonQH9OL37jl
         ngDQuTy+J337vW80MzIcHiCiIS6FvDkPFcCfgCPCHo0oPfoP0IANawkPHub8yeN6SwFv
         S2Ch4C9VJJH93hJCYCr8uZvHxqcBAn42i1EeBt9vxGkg2GUWdC14s1i2L3wsTFbcxykV
         5W2Exxhqfkpu70HNoVd8STkS2xsYcIvwTg6VILXy9s4Iwy1vg2GkKHwh3VVMkGY3AZ8p
         HpWUo2F0BJ79dEhKIxovVAA2A7AsDLitwZDyZTqgz+KbWVo7KimE/xNOaIOrlRLOGRGl
         oudw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789976057; x=1790580857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i/KB7XKvlLtdNPe51SuZ6hkHW35ikyi0W/vUmCBDQwM=;
        b=bRho8oHkSZ6eNFFlMVFarqQ5ou6tGwP6n0eX0AMCacl0jOnq/EcGvM7lHBlgkmMQP7
         zLLh08JXmiwSrxOeMNy0Tw7uLfdHnUz1OHewAdYTttaeLiZZIRbpdqKAm1exhBXt0SJ2
         uwLkghVLI+wKYXaKcDPzLNu4LmatZLIhyK9LSr7vpCufUr4zYs+7bCeFlZ0tLLW0hSZD
         TgyIWK0sBY2F98z5zFIvPOsTthpcp0n1jNIxNiXIZlkb07px7TcCrRNBMw8uaYpQmBZT
         ni3Oas86iQDAeF7bEgd4d758qslkBQczuds/1ZuAokt+/PN415MLqRAZdPxSP20gQeeM
         UVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976057; x=1790580857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/KB7XKvlLtdNPe51SuZ6hkHW35ikyi0W/vUmCBDQwM=;
        b=NzOOE7QUQlCznE9eOj+ot2yWGeQRj7bw3nKdWOKH0BQbma8fwgfpGbXqWt5a70yh+Y
         q4sdaJ/QTU+X0NzKaJnAwe1kibJ3aBrRhtaBZGGjAAG8m1ePsxrc1mYg73eG/nsYSRI1
         ogqHK4RDey3Zy9Tv4fG9amsATLaaA+KGuW+/cDE/YGU5luNO4uRvYyARqzGrlBEI/owk
         g5tLt1E84uD7he4hC95r81wqZ4yGs9dcS2RiZf3aaDshXQKXZim52cxDsE5ZU6B+TfG6
         pPLxd+oSVZTykPGARW8Tm8p02f8Qo6s3xDNY0ezVEQgaJsj1pDzFNPt9uKqUjlCr1had
         L2/g==
X-Gm-Message-State: AFuF++lEoupnBPr0UFdk3W8ZLSqRaPbhjF4f87c3X5kyKyem0eVV4tPd
	z5uw5yChhtKg7gaQ6GPTdT6ZUcWYXOvTELCZbm0/ACcPeJfXMa0EBgLmlAEKYtC5MxPtzgcsiCh
	8cwHUXIDy7HTF2VhBsxkuQRdIyN6y6Ow=
X-Gm-Gg: AYBFou3n1KnICuziNdR8v/CGN2xA718+zrpt5Z/jlX8rRRA9wLEVvSvmu5eelK1llE0
	nft3Lh028tyXYS4sBiCwZ9kZXv801w5JcicgtW+/Aq7coV8ZTS5FlNmf4V5+JjOH7ue09mlAj0Y
	OT4F1oc/uoge7hMbHxUPOQyimBrOX7R4pBbzsGOO4GN0eY49nBvZjIXGwWdnl8ObN5owco8Lhho
	mpnls62rPvFqoeRUn8HFzsF1STFAWEiziJKGhojXx8Zakxtsj7GbVlknrctLpnYQt8B+dW/Kg/X
	mvNlBvXjAyjN/RY2Zj7kepRheLmD6MeWU/+rhx3ocRjVkWwAOsRWDlRRvommZhJbyCAhy38Bw68
	ZNMOgYRlt6c+v
X-Received: by 2002:a17:90b:4b87:b0:39e:345b:3323 with SMTP id
 98e67ed59e1d1-39e54fb121dmr14066759a91.22.1789976057124; Mon, 21 Sep 2026
 00:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095233.420823-1-clamor95@gmail.com> <20260721095233.420823-5-clamor95@gmail.com>
 <CAPVz0n2rhZk0fjM06u=C5H4LgVOsN6ACriO1o+byx0dyqTwGzQ@mail.gmail.com> <CAPVz0n2mzwp-ffUu7tw5ojXgM=+G-PT3V9pHN--dT=dnYw5hHw@mail.gmail.com>
In-Reply-To: <CAPVz0n2mzwp-ffUu7tw5ojXgM=+G-PT3V9pHN--dT=dnYw5hHw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 21 Sep 2026 10:34:04 +0300
X-Gm-Features: AcwNN1W6gcxmcfy1bLN5jucC74BzWiaaqHA32OWE3YHnq2Or7J12ypc4KJW69uA
Message-ID: <CAPVz0n2ZeYk8WbWfW7L1kLsQN4e0mdQ7nM4Lozy16z9X8kPCWA@mail.gmail.com>
Subject: Re: [PATCH v10 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 6 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 20:22 Svyat=
oslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=81=D1=80, 19 =D1=81=D0=B5=D1=80=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12=
:20 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > =D0=B2=D1=82, 21 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:53 =
Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > >
> > > Add support for multimedia top button row of ASUS Transformer's Mobil=
e
> > > Dock keyboard. Driver is made that function keys (F1-F12) are used by
> > > default which suits average Linux use better and with pressing
> > > ScreenLock + AltGr function keys layout is switched to multimedia key=
s.
> > > Only Dock keyboard input events are tracked for AltGr pressing.
> > >
> > > Co-developed-by: Ion Agorria <ion@agorria.com>
> > > Signed-off-by: Ion Agorria <ion@agorria.com>
> > > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/input/keyboard/Kconfig                |  10 +
> > >  drivers/input/keyboard/Makefile               |   1 +
> > >  .../input/keyboard/asus-transformer-ec-keys.c | 310 ++++++++++++++++=
++
> > >  3 files changed, 321 insertions(+)
> > >  create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
> > >
> >
> > Hello Dmitry!
> >
> > May you please take a look? ATM only ACK on input patches left.
> >
> > Thank you!
>
> Hello Dmitry!
>
> May you please take a look? ATM only ACK on input patches left. I
> would like this patch set to move forward.
>
> Thank you!

Hello Dmitry!

May you please take a look? ATM only ACK on input patches left. I
would like this series to move forward. Thank you!
