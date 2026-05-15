Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDD03CFF5C
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778818948; cv=pass; b=SpyNXS6wPl9QpLQKEURNT68qBQzcjzXLVawmv5OTSdiXMiBoVAKx7TAmmCrbVEty2fPPYngJo7Qr8uZ+uePylfaJdf2ieQ9YLBSbGf6EzGAFkZcAnY10gj1mZO6h5QGCHgkJo0rlThTuoXMrUlPEYRPk8AFnfLgfdiKA8Eiv1AI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778818948; c=relaxed/simple;
	bh=QCAkoND4ENm8fAKTSZpNTY4aLP2Hmp3gLwgJAGWD/Ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JgZrNnyZRGB6/0bm79l27VtVzkKtx3WcNHTA7G+SzlqsOFay7vccy/Gi6s+3KAym2xD7zDmK+9gEk1n8Ud+e3CB0H84elVdMne/U4nWxT4hzE0pdYJ/nWzLkmNQYRtF8guEiPl2Dl8svrO/MxcJ8a8nADAUq+AxUgMwMMsOOleU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OvU4yZL7; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OvU4yZL7"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a858881ad2so10135950e87.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 21:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778818945; cv=none;
        d=google.com; s=arc-20240605;
        b=LyCJlcS2QHAYDm1qbW8XIecOJdZMeB6jyd0Xfrlx6p3kFmxgSNv553ar/1M+HN/dFo
         ritVMs6/dcvVUyj6NqFL2vE0RtmBs24RbRWE9bcYGG6kzCS+tDVLqkGBiAtP21te1whM
         wocBq6gsyehjnAjc8i/XqBYmqKnaX+++duQupUHRZlrUFPwTwqWsxY3n4seyRSKmpKna
         EucMe0RsTSHiZX0olcD236ATHYKqf5evZLcUItOQeF4d9buVlB6iVdbahgygTm5AoXE5
         6og0T5v5xK6MA1ZofyWWZk0yrDa/N4I43g1gNXeTjOM07wMOHZmHCQ/W+/MxDmeYNuv4
         ZY6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I0cZ21uB8dtPdz735Z7AvPhcMUm74vkL87VB125DpqM=;
        fh=efP/DXfsN7sQ0OfatMj3ozh1XuC6oSbgEMFpUuL9DWo=;
        b=bcLMzKAo0WpJiw8WA4dlhUioOT1eH5pf/XzD7i6P0N7bh/ouM8ZV5ZMsFz8TyiezHy
         uiIJ5odx2cBvc7dsn2r39rKDv7CXDRIgjwEyakdI/luRlcbUTgZPL99I8OTrqc7FUKfa
         nNVYGz6EYHxXzOO/XBJOUR8G+rLVSGKLwXj/az96+Ar5fScxwZk2nmEEl12RHLjaFWCv
         +nxNTuSXGnOxQ6xCnWo9LWZVcYM6OkfQ1FOhnnDlPF/yvSW3G/tMbfnq0VmdHm7WltHB
         AV1o/KED6DWG6rJGTf1JRlIDiKlJYizfCdttRjrZ5+7uC88FNaSiMutlv9PcbRWw51hp
         KFUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778818945; x=1779423745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0cZ21uB8dtPdz735Z7AvPhcMUm74vkL87VB125DpqM=;
        b=OvU4yZL7NTow6ibgI/T9G+6CbAPExdgj1fCa+Ql8RF0RZNBLVSXvEtP040sHSv7Jmi
         lk/Fjze3gM2TCqeOiAQgyNQhCmQRpC8bFN3N/7JpzY9r+1FPI8SxaylHZSkhRi4KZJXk
         fiIuP58I1EHQM3iMCxHp703Khsu3oUmTAlyek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778818945; x=1779423745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I0cZ21uB8dtPdz735Z7AvPhcMUm74vkL87VB125DpqM=;
        b=iWFj2MLlDFkqMRw460h4IuuwmOUg/tb0wMc3/QIMud96zMfKhdyZ/RYYtggd/rqX2h
         +oRF3OO8mtx8MczGtcPIPBSTmca2Fi2OtDsDgYAAbjQxvQbINTtBOzlIJrjxrfKgb2tx
         Q/MaU/m8n0Sc0rFmgc+aphiCHaO3eJx4yEUuDLvGAutr1TP528J5KewtaxsIhtBg6Qw2
         JdIBvg2hqFDXRnsWKQTzQTWa54IORVCYo7oXyoLPusjE1NxBwncKqqz1hV++tchLGC41
         PH0U3qje6S9i2Hs1kfnz6vIfb8gHBzVhiW6msN7953KdMlczwky71cObL3PoXm1IbsPB
         EjQw==
X-Forwarded-Encrypted: i=1; AFNElJ/Ob3UHNyV72IFS56UpjciwLc+UUuPpXVz5p/4dGekik2GBK2T+XmZ8JRMCKfBf7fqiC/EOwnQB24M0@vger.kernel.org
X-Gm-Message-State: AOJu0YyB6jRe6PwqKicbLlMfZiCQCfXhGBaKYw1Q24LfeFyq4/BSKclI
	EOG1Ip46dwBs08yylbSXaFU1k1AdCBk7YVG4iFIJwrESGEP88miumFHrviY/Plaecrs2ZXGy8xh
	tDhRTU1sxRQGx1GQNf6V4G8kFZV7oySW3w5OrpjcC
X-Gm-Gg: Acq92OEbvuwRQU9MUrSgIHW0VZNZmZ8aB66EA/bwaMgMSq+xnQCQMZ8mYrI62bK5/eb
	Y99vBxz88QqcR3FtB9/MLp6fSb2K6yPGwL0t2MA5QVOLVBoX1U8wv44PzKfu3p7Zj1G3wPXe209
	E+LEmpRLqWTFnMWsHj9OxRXg3pI4U40r1/hXujI6IuGdkO32HiawqwDr97l+7iU9c5AcdjoL+cP
	bPXpZXIRZ0vIzWvadXth9wR1bwp81Wn6yu+uK9okMpbm/5zPe68/ZEY3WbKi0FuPuhbfP59/Nqu
	wt6ROT4tEn6nQiXzePojvrOouOqnJxz00u+vPQ==
X-Received: by 2002:a05:6512:15a2:b0:5aa:b6a:9257 with SMTP id
 2adb3069b0e04-5aa0e7408bemr545551e87.44.1778818945188; Thu, 14 May 2026
 21:22:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514091520.2718987-6-wenst@chromium.org> <20260514183429.5F56DC2BCB3@smtp.kernel.org>
In-Reply-To: <20260514183429.5F56DC2BCB3@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 May 2026 12:22:13 +0800
X-Gm-Features: AVHnY4K5aDAGTsz3NDQUWoQBl-6lRkS_VKST26gc1SWQeCwxQAXo_TleLCjgO5I
Message-ID: <CAGXv+5G1MDRZp-9mPZMcSebn=_1UjLNne0sop-Zpk0XfinCZ8A@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] regulator: mt6359: Add regulator supply names
To: sashiko-reviews@lists.linux.dev, Mark Brown <broonie@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 2:34=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The supply name for 'vbbck' in 'mt6359p_regulators' was incorrect=
ly set to 'LDO_VIO18' instead of 'VIO18'.
> --
>
> commit c863063b2f41de345a843312e3b866262b280224
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> regulator: mt6359: Add regulator supply names
>
> The MT6359 regulator DT binding defines the supply names for the PMIC.
> This commit adds support for them by introducing .supply_name field
> settings for each regulator. The LDOs share supplies, while buck
> regulators have their own supplies related to their names.
>
> > diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/m=
t6359-regulator.c
> > index bcf9a476a34e1..46cafe93b24e4 100644
> > --- a/drivers/regulator/mt6359-regulator.c
> > +++ b/drivers/regulator/mt6359-regulator.c
> [ ... ]
> > @@ -871,11 +879,11 @@ static const struct mt6359_regulator_info mt6359p=
_regulators[] =3D {
> >                  MT6359P_RG_LDO_VM18_EN_ADDR, MT6359P_RG_LDO_VM18_EN_SH=
IFT,
> >                  MT6359P_DA_VM18_B_EN_ADDR, MT6359P_RG_VM18_VOSEL_ADDR,
> >                  MT6359_RG_VM18_VOSEL_MASK << MT6359_RG_VM18_VOSEL_SHIF=
T,
> >                  1920),
> > -     MT6359_LDO("ldo_vbbck", VBBCK, vbbck_voltages,
> > +     MT6359_LDO("ldo_vbbck", VBBCK, "LDO_VIO18", vbbck_voltages,
>
> In mt6359p_regulators, the supply name for vbbck was introduced as "LDO_V=
IO18",
> whereas in mt6359_regulators it is set to "VIO18".
>
> Because the descriptor name for vio18 is "VIO18", the condition
> strcmp(desc->supply_name, vio18_name) !=3D 0 in mt6359_regulator_probe() =
will
> evaluate to true for the MT6359P variant on every boot.
>
> This discrepancy triggers the fallback execution path inside the probe lo=
op,
> performing an unnecessary devm_kzalloc() to allocate a new regulator_desc=
 and
> correct the supply name dynamically.
>
> Should this also be "VIO18" to prevent the permanent, unintended memory
> allocation on MT6359P platforms?

Sigh. I keep forgeting this driver supports two variants. I'll respin
a new version later today or next week. Still have to address the other
review comment regarding no ops leading to failures.


Sorry for the noise

ChenYu

> >                  MT6359P_RG_LDO_VBBCK_EN_ADDR, MT6359P_RG_LDO_VBBCK_EN_=
SHIFT,
> >                  MT6359P_DA_VBBCK_B_EN_ADDR, MT6359P_RG_VBBCK_VOSEL_ADD=
R,
> >                  MT6359P_RG_VBBCK_VOSEL_MASK << MT6359P_RG_VBBCK_VOSEL_=
SHIFT,
> >                  480),
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514091520.27=
18987-1-wenst@chromium.org?part=3D5
