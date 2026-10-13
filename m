Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636613E7654
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 01:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791854425; cv=pass; b=IutApE7lWRPhwLn3Pf5ZmS2jRPCBLzfsZBcHPOkD1fdeF5xEVUrw1baM0HTz9hxyhT+fLpjtjhmSHZwxNbnDtqdmExgDDsWtcSULDr4TaBKaacsV4i88qL53Cf5GaGf/i63wd12AJv6D1CICFd5QPGBVZULs5uqeiCmQ4I0jNFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791854425; c=relaxed/simple;
	bh=GLdPP9wdTOmg3Lh8rLtRDBnHGBuo68uFmOzknvlhkJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWKniL2zVW1hFwmutQ4X9v9W87+CCudYMMfX4xSFNKOdusyIcTb/e9Cq5keGAPX57xzqRJ8xz17F+IQ3nTlCosVZbJo5fr7pqVN/jq5VWM5qK5KF0LWUMDkQCydT1CkdCD+OQieL3wMsK7Dmz/G0MWk53OZomGqc1GShy0sOcb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDDr7RJc; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDDr7RJc"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2e8c710847so294418666b.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 18:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791854420; cv=none;
        d=google.com; s=arc-20260327;
        b=Adt0sfkmDvMlwOdk5w1U2dlPIOfbAq33AdyvoMjYEyrvChNYF9nLp9hK7AHqMQQeth
         Ktp3n1LgCmeT4ThOeGjQ/SqRMN4XbHui9OxmuW7FRuKwZXcgTLXvqEFX0f7N8T9xH0Up
         Zm++Q8ZzpfpKHXcreBfrj/2QzQmd1PVtQ8/KSTqfSME3c8vPOrkZY08pltJc87CDX6eg
         X4RQuNRu1lkjEhpCWsE6oAXIW5FCHqyQSeoWHe4CW5Sx/GJvkQzvJ8ZafdS+WJ2PB02L
         hFIZPk4uXInbbT9gujZELxcDgvYXDPjPnMdytux0O/S0McGZKJ2acNLIrUvYoNIFkdD2
         laNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eDiCNa90nkNCt2ySXS6KYJDJLT9XVCk1KGiWa9GtHAM=;
        fh=Ezj26YEr4VFGYQB4/tCeME6TmC2P1Zr8RSjVl4M4Feg=;
        b=qJ9fvs+Nj/zI5Qv9g6N4mlCXlhi0cArE7P6Kkm0Bobd6GAKPUWkaKDeBKb7YDclfwQ
         W5qp3QDTALBfNt9/B5w7W1s1wzafX9biNzqjERHpbP1s0ygVoa8gWo1JvFY/zBC+Z1cO
         Jdsh9HYhhQOXJnVYUwyEVOUodHkRq4g4qnMNtiH6kUR9rog05hDqlQCm88a3pGl+ubaJ
         qLacqkLjYi1ZIl9EUbbq2Wv7XX+Nc14bRKBffCqICU5y0KWZXgza5qyv9JkHYM/07e0Q
         g+Fbfa9BshoGoitfg/kwqJ2F7kc+DM7Cm7X0d+lwnXM6jya1+jGToafRIJUr3kkSri9l
         eD/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791854420; x=1792459220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eDiCNa90nkNCt2ySXS6KYJDJLT9XVCk1KGiWa9GtHAM=;
        b=SDDr7RJcD50209XiYVlGtKVzVGK0341G6s7mIi4MXGNJwxjdSqXlxg1HTQcZyFUmZW
         svNrjobcTS9Z+K8eHEdqu3LithUMYDGe26DrcAv2VMgJHbXDl/9TVKHNlsKPYUwOlpUh
         jx/O4Ej9Nlkn0mW1BYIJz4lm9HuotuaZ4cbzZV8oIGck4kuNGSgu0rauz2FQEzzmyrov
         /nRdXsi7kuCXOYrKqpt5JuQaq5I86hUyQn0b8xmUMXcSg2JlkGFrYotlYTJz4tbkoVNC
         cfrSRuSOS8N49t606ivWj/66KLRTSfIHucO1UTPX+qWrD5D/pYcgDA2+Lt+8EZSbi5tC
         FOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791854420; x=1792459220;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDiCNa90nkNCt2ySXS6KYJDJLT9XVCk1KGiWa9GtHAM=;
        b=2XE3m323R59O8voQ40MHyiFX5ZtnlyEl5KQhADC29VkhcU9Qc2f9IrS2eU9c/+Ovkq
         4tKHqYY+5NG3oYIqnZFsNMJqlc0PQBE2YqqbMAP7LNw8IJgUvrKpTrjOaBhdB8Uru+Og
         Ob4RgGMGvkC1EAlxub78jEEFnfHG3iLcS2rpFmScyXKe2xMWHakRkGVheqS8eHGvvCBr
         N+8tNONRI3wDbrgLJcLZKwb1T8TyEkO9nyXk35TczSj+KfBSciFCteFS/9v5vYbIAIw8
         9mwNLR2vV4PPN4VwPd5X442cgFoXIy+Y3SjxAKv0NebQaRGbLeBYp+OuPrEyiNbm3+R9
         51eA==
X-Forwarded-Encrypted: i=1; AKwUvBzUvZg4UWWZW6mamB5zuC3lvirZ/vVPsU7Bqkjr1+Q8q2KOTfBoP70GKZs6TP00oMmUsjYFTMAc91mq@vger.kernel.org
X-Gm-Message-State: AFq9FYL4PGDOOm7heHHtqJjagaZykLJC15HET/iV4kN+Fq9wMga9tjX2
	ukEwP8wNinTJlaUjGgEqW2hxt/GM8YpcJSey6nZFlXzCvpCgYB0Oa25sBZ1BTZWwbrjuMZlStfC
	cuPy7BUlgYyQ85JjYjHc7pRJ5hjiO7J0=
X-Gm-Gg: AYBFou3a0uMf59a81B3fMfF7pLUEhkBaAjf87JtvlpqQLFnL6+HpssAFdVgJskQ2p77
	Tc1UscRj3haKukNdUziUw6+Sgv9EygHMHqpAvIi7itXSFkCIsqLmkHx88pt9JH4TfL6ej60QwhI
	6x9cmf+uwq7A+DzuCIchmvrJSJ31nnC26O9eO5GhK+BxbpAohOce1jRdadbv72z4E5U+rbWPe3F
	TQ2Ct03CNE3w7CFuRE2NoyHnAz+t7XVT5Rdi09nRwzslHZfnOdE6j37iN2/1fegvJ9SDefISbtU
	jSvePwtGtNlnebn+Yk/4xBZ4sU11xF9yelNmIwR+Xdw1om8VH40X/yA=
X-Received: by 2002:a17:907:9816:b0:c2e:378c:8ceb with SMTP id
 a640c23a62f3a-c31a9fa39abmr1029769166b.36.1791854420304; Mon, 12 Oct 2026
 18:20:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791512067.git.zhoubinbin@loongson.cn> <38f8e7cde8e454e7c6b72cb1b9a1c54e67c8a7fa.1791512067.git.zhoubinbin@loongson.cn>
 <66a8df16-01c5-4653-9fb5-7d746f03f782@oss.qualcomm.com>
In-Reply-To: <66a8df16-01c5-4653-9fb5-7d746f03f782@oss.qualcomm.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 13 Oct 2026 09:20:08 +0800
X-Gm-Features: AclHuK83THTSYAs-3kkd9FBwRhF3injKe2tsHVZYn3kSJvncbd8B50m-i70KpDA
Message-ID: <CAMpQs4KiGsC0=xwM+4M0GMWy9XEc60sTpPACK1s97p_JURUr-Q@mail.gmail.com>
Subject: Re: [PATCH v7 1/8] thermal/drivers/loongson2: Fix negative
 temperature conversion in set_trips
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, zhanghongchen <zhanghongchen@loongson.cn>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel:

On Tue, Oct 13, 2026 at 5:57=E2=80=AFAM Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>
> On 10/9/26 04:57, Binbin Zhou wrote:
> > The `MILLI` is defined as an unsigned long constant. When the
> > temperatures passed to loongson2_thermal_set_trips() are negative, the
> > expression `low / MILLI` triggers implicit conversion of the signed
> > operand to unsigned long, and the division is then carried out in
> > unsigned arithmetic.
> >
> > For example, with a low trip of -40000 (milli-degree Celsius):
> >
> >      -40000 / 1000UL =3D 18446744073709511   /* unsigned long */
> >
> > After truncation to the 32-bit register field this becomes
> > 1271310379, instead of the expected 60 (i.e. -40 + HECTO). Writing such
> > bogus value into the trip register leaves most of the upper bits set,
> > which may hit status/trigger bits and cause spurious thermal interrupts=
.
> >
> > Fix this by explicitly casting MILLI to int so that the division is
> > performed in signed arithmetic.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: e7e3a7c35791 ("thermal/drivers/loongson-2: Add thermal managemen=
t support")
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >   drivers/thermal/loongson2_thermal.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loon=
gson2_thermal.c
> > index 4d40fc706a53..f5ff0cac1442 100644
> > --- a/drivers/thermal/loongson2_thermal.c
> > +++ b/drivers/thermal/loongson2_thermal.c
> > @@ -108,7 +108,7 @@ static int loongson2_thermal_set_trips(struct therm=
al_zone_device *tz, int low,
> >   {
> >       struct loongson2_thermal_data *data =3D thermal_zone_device_priv(=
tz);
> >
> > -     return loongson2_thermal_set(data, low/MILLI, high/MILLI, true);
> > +     return loongson2_thermal_set(data, low / (int)MILLI, high / (int)=
MILLI, true);
>
> What about using MILLIDEGREE_PER_DEGREE ?

Yes, that's more suitable. I've been looking for the right macro for a
while now.
>
> >   }
> >
> >   static const struct thermal_zone_device_ops loongson2_2k1000_of_therm=
al_ops =3D {
>

--=20
Thanks.
Binbin
