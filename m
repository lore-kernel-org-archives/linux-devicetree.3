Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DE42E1746
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 16:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060221; cv=pass; b=bFiNIa1KIhN8AAUZvF1nyIxto2h9UYrJCq5cL+N+h3KThAaUL5uQ7BmorvPFCHx/crv2yZ/9RR2SUucv8tfvn/b5K0PuFD9byJaSNjSylKLEBjcEcTtd30gMS5XYLRLryfu8jkC+VXcONRgbjIATEoXTxjd74wW2eGjlUFzLbh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060221; c=relaxed/simple;
	bh=a/No3osBtbawF2T+IZ92AuftGjU7MOdhwCol+iFX+ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ckRmEVRzQ7gkOhvohMJQ4AFpLmZ7t4Ve2o4toY1+wxV1t3HWqA2J7pA2bmb4czMuCuUCrgDOYxq6Qi3bVrU8lmnxURD0rjvzzdb0bl3S1DMqkmlfCgWH56r7IYqOeyOfS5EU3AEm+Bf5KUeux+xi0ppUwyYSLIRRwCMcuq6VhgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IjpvaFkm; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IjpvaFkm"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64937edbc9eso8992679d50.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:16:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775060218; cv=none;
        d=google.com; s=arc-20240605;
        b=VG+WHrUZf2iifUibzFRRH5zuz+pN/0ubCmjOfS/VhSvDC5kb88c4N4LtsUirE7GyzS
         MimOCgqWq1AA6PJZnoj2/X28E6gt8KBS39rgGf17I/d1nOvA+OZEaAAEjEWK8z6GAxk2
         B7ywM/jWvgUyZC4pQjxBVCAyuWsztbQEQoTMiEb63gArQKUfD4CDcTW0rDEuY/zkZIue
         AR5GO+Jb6Yt9uFf88WjqBxYnh/v7oYjoizFJN2+oSkfFhFJ9Q/8DjVS/zrfth/1hWBPi
         A4Z0cO2Mc749kQhEi4/dvzaHu/VpUv24+wHvcCKFEe/cKz8doAlgjiKE5tl/8SJPtsdw
         ZOAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0avH1+SOLHp/H4tdAtDn9dqoZRCCz/pmxrxGL/52XWY=;
        fh=SO92DSd/JbKBx6bZBzA6Mjx45n3PS9tYjc8ubDfZm0o=;
        b=OIB40H5JBk08ooO/zy2o5y9xJWVFuWJJaQB37e4r+p4z+WxrrNwOaxmU8iTec6uE8f
         p0choqNLTEbU9wOVX7cyKlORBZSgLYy/Za3YDF/+t0N9dV0Z+satl618rm6cEMzAa557
         nNt9GqWQEB+GiwqBtJmolUij3nFPDiAUy7+AYLf34lFSkbL5dGNczXrzI+MYyTWIGmRZ
         6ji1KOzeIPXzws3KPgqTlz4eAb4G7JpWJR9X+cnGqR4kUqUwSoBgbYBT35Psw8OG48bW
         bLUTSqOnkDOqaJqUgSIdg99wYwgExxbu2rYU1I9nk9k5oXDtJRU0hzbodBedJBb60NkQ
         4Ypg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775060218; x=1775665018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0avH1+SOLHp/H4tdAtDn9dqoZRCCz/pmxrxGL/52XWY=;
        b=IjpvaFkmeMl/HsUTgxMHafFnnYEnoKxrnwhKd4HaHm+pUXM8mmbg/aJJWYfbaJN8M0
         jIDzT2c6/OKxFb0jVfwxF9S4kMxo2fw5mJ2W2sR3MtL9nvF1nJaWZutdDavCnmceACBu
         VVpFCnrKh5NgI93QGFegvKsgMCUgaNKjy16+9jwJiyA9UMQi+NXYNguVRPGfXcu9Uafn
         VENWmmvwkhoBMHbKBgQ1hhj2x9RNdppgTQQzyk1CgD74LGR/kszWC5qVb5nVGYAmIkRV
         spXbIf2izDbaQaxRV0cvrOiFP7s9rr3w04oOQTOGb6dSYtBb05S0HY0lnBPxukjS8+w7
         CYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060218; x=1775665018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0avH1+SOLHp/H4tdAtDn9dqoZRCCz/pmxrxGL/52XWY=;
        b=tGbOSOCY6hCC3jQQUpuDWUrznAVNY2AruBqP/gutb04qv6U1zxD1PGdDbLgen2fQQX
         QqJtbMifcABNroH+QQfpEay0CR3ttEp2seKYmrMv1Fmmwt7MDOG9cvbeza57F7eN36X/
         Z7TWQAdIJd4I3fL1qq0C0D/Jka/AaK5QkT4U9/nAXNlYJFesdPTT0JBvqCOtxIcEIUUt
         PEcuaZTtkrwJCOjJaVFw4BBf5fNBpAM5va3Tgm2Y5WDPbBcySdYHD3W5rCwph1eorbhk
         biETNxG7PybHgJvB06ycFCFtOuH9OJr9bABGNd9LCnWuj7mhRU0yjQ+7CzjeVY8T+efS
         q3dw==
X-Forwarded-Encrypted: i=1; AJvYcCXPQPeaFR8RmwZojLVe/hVrm8MskqxanFm0eK6TNIk6BHAlRvPAxiFwwS+BinOZk9sOOt97agSgQwmB@vger.kernel.org
X-Gm-Message-State: AOJu0YxrnMfaJo6M70F6+qhDVC1MQetM+e3UNsRo3OsdLzDsK6mLQtyO
	7mZDFJ2eSVp7pIRK8A43fTe8OEcsIBaBWGbQNfYOMsrdLhHm/rEyRT0iP2G7azxQfXnL2ISJlQ9
	l4VS7f9YUwY7U8BBaITvkSZVs/HOoOSg4ADFwMREmSQ==
X-Gm-Gg: ATEYQzzjmm3uvXyoJlAlcPR9dKHJS5sIitj5rlFQo9M/kMLmLKDojWbBCg2eHoNrInc
	I6mfhgTp09X5nCXnR9k9E35m6dnHuuaXmMn4zo6/WI1rJDbmJv/MqVq5Bp2jjIykOXxYJDczkS+
	WcdUbRLXZuWGwBJB2+jUsFAQ3e1xXDMpnqsxikNy9JTUcjVfiPopH1eWOsGHwcyCA1I8BkVrJJd
	LpC81EoHXh/Hfv5AVkfFuFA0m/8qGqTs4h1V/8GgL0GMiqYt0F1CubtuqI6TPMPkRDpLG5fXAEL
	t2IUs5FcPaNBi9E2oU7ajzKAx3nE/UQix1/c5pADlQ==
X-Received: by 2002:a53:c608:0:b0:650:1247:fe35 with SMTP id
 956f58d0204a3-6502fe7c6famr3104408d50.58.1775060218141; Wed, 01 Apr 2026
 09:16:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-6-c5a760a3e259@linaro.org> <f73173b4-f44a-4d01-abec-3366b6561332@kernel.org>
In-Reply-To: <f73173b4-f44a-4d01-abec-3366b6561332@kernel.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 1 Apr 2026 11:16:40 -0500
X-Gm-Features: AQROBzDBnBQJcHuyu8ZHm384f9vOKocl3AGoLecw69PFxAPUA79-AuH9D6PxvHg
Message-ID: <CAPLW+4=H_UkjwY2RJFPD9ekJh05MyuhKrymeuUYC4dX1WzF0wg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] MAINTAINERS: add exynos850-pmu.c to Exynos850 entry
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Wed, Apr 1, 2026 at 9:28=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 01/04/2026 06:51, Alexey Klimov wrote:
> > Update Exynos850 entry to include new file
> > drivers/soc/samsung/exynos850-pmu.c. Add myself as M
> > there.
> >
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > ---
> >  MAINTAINERS | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e14e6f874e05..4b28e92b4d9b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -23601,6 +23601,7 @@ F:    include/dt-bindings/clock/samsung,exynos2=
200-cmu.h
> >
> >  SAMSUNG EXYNOS850 SoC SUPPORT
> >  M:   Sam Protsenko <semen.protsenko@linaro.org>
> > +M:   Alexey Klimov <alexey.klimov@linaro.org>
>
> I am surprised to see this because I did not find many reviews from your
> side before.
>

It was me who advised Alexey to add himself on the list, as he's doing
a lot of Exynos850 related work nowadays, and we expect him to
continue doing that. If you think it's too early, let's get back to
this once there are more patches submitted under his name.

Thanks!

> Please first engage in reviewing of this platform, before assigning
> yourself as a maintainer.
>
> Best regards,
> Krzysztof
