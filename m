Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAED43C043
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312130; cv=pass; b=V9qZRps95q41pi934tf4Sht43q+R9douFHjY4fwIYxS3NrJTD8xBaWk6yuU7XZfFeLa9QDAgpLF+ZC6v6FjJgDXI+INOogNiCzedM6Lo4tmthyayQVcBWsSDiwr8Ho/A9ZXkYFZ+mi9T9VPAVZXaekmUFB8E0tEMRJq7hqwJZWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312130; c=relaxed/simple;
	bh=tQIx/beIhZjfhEwMkT/O4vuIekscTTh9vo5S2QcC4B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=huTGEuianR8DH17KOBLRnnKgPdbwNGaONdkFmlhfmG6BFnq4BNkXS+ncUGsmwG+PmjV21rdDkKV6jYr+n0TfBciP4xcVKK09LQyJ76Rovt47LzakaCWDfFO8K+6b4W38QRUmCIG4KeOTwn8e6RPPdEg4p54baiq0zRt8XNVr+Gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGYNjW9k; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGYNjW9k"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6688acd1a51so812695d50.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:02:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785312127; cv=none;
        d=google.com; s=arc-20260327;
        b=PseykZKXXjmRfYkmCoTllSkJPx966h+sgOUud/kgDF4sdFu4NAtwzszp14QzxR0Oq0
         aEfJFanO2CmZY0A1WmOgUgQzAt7VY+96NpqunHSZqfuTCGNrMjZ+h5yqX7oMQ/c+u7iN
         YY5t586xyC6mElxcGeXX8AHRIRP39khHQPwzY75524pJbq3ai/e1WgAYjb8XmLKpOsSk
         AwhB1COsLZ7ACLAYlRNOJEP1w/3R8vyDxRyiQN9T8kIHQQFXtr9yCu2g7TfK/v6Pzqmt
         iLaAlFC6EfO7vuPMmQJ/Lg/v2dq2QS5E6AM1Id0twtVBJl4qTimrOf+jvmyLI0Wvweoq
         Zvug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nWTQqQwG3YVHAteC50PeEEuDDKjaYcAXX2qekTmA0yI=;
        fh=rmOM4PbP2emc4azeBWjGKhTcvvCsw7Zxy/TLwMCpo+I=;
        b=e2iBDb2fG0FhyLcBB2MXaF8kYjYHE1QPnjPKiWYYxvxGJi6SK7T256yV1GD73jCmeu
         QZ8NfX9g/N8pyhIxPWLncpWSGy1HPKWQHfIk9NFB2yu6T6jhmRl0/sNanZBgdcchj8YE
         j5XD8Q3X2ItPgJ5W2ZBnkhXR5rUU2IMYQ1g4TB5+U93z2YDZNTEPg+nKhP7l+TWz/4KV
         v9yMvgDAUpaV6rj3EF9bfPCitdwt8gwcyaa7wteO1MqG5ffjJC8yK5CaNdAmM2//JCGY
         lI7xI5K/6YbFpqTUtNZk7qbUBu5xX/3c9cJAiCSEY5ecUUyLnZ3riGQKD23hTx27iTbu
         OV3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785312127; x=1785916927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nWTQqQwG3YVHAteC50PeEEuDDKjaYcAXX2qekTmA0yI=;
        b=EGYNjW9k5+Hk04XxsCNaajg0AJEQgXgoPfTfNlcKRRc+zomYHbG3PFLeD92v0w++wZ
         /fJhJk3eUWd76IVb/jVDWf2DTrCjfGBZy5fReSrBl4DOUO5A5rvP/cZ0BRXJUWZisUCH
         zUnCUB6oFWwWNUHHo62KbKgTtsLNhQ+lFHF/GRE7h7SFAnDGMPQr3KB3MCaXMjapa5qT
         BqlYPdkh2Sssh+DWzYPjSnPRQH8e5fhN8UOFonPbAuSoxzflIx8DhgjP9HUfUMYlpizM
         zUdt2gnyCggOORwjxQVlVXhwed/Uy1JTbUvHn9+crzyLHEm9FAZCdLV1hjJmIaX+2QS+
         U+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312127; x=1785916927;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWTQqQwG3YVHAteC50PeEEuDDKjaYcAXX2qekTmA0yI=;
        b=YfohZHjS/lT8h6aeRbdwa4+gQLnZc4++BD3VYk38sUutRC6u1JrBqnTHcxacOV/Kxa
         Nf9o5b1uwlxZ41z0+UCZUjgrxwFHkpA8Q/6IdIX6o+astxC+2FEsKy5Ge67kMdlFSndz
         bMhzkRVoZnaQ2O6Frw1dd6JdNyZNIcaJ/Rb8nDX7pY+RdDGvlHUCacdPgM7rEU51MF95
         ys73m1OVkTPuEoa/QLhuW8YY3zqeWoo6GZNDypa5g3NoszRgOoldaY0bzrWWMlIVAMl4
         W1kcMtg7jdgwUdSMQgUuDj6/2WXjAVWoF4oCys75/fQiqabkbQlpmh5edhMSexksgQv/
         ZKPg==
X-Forwarded-Encrypted: i=1; AHgh+RoGgLck1WQWq7hRCn/OGIjeybC9jc8Xtz5FX4sAC2SpF5FDdz0muq8ruLy5x+wHbLWrbL1OVWPQx6je@vger.kernel.org
X-Gm-Message-State: AOJu0YwbYVFo+q/eQoVKhMWa2PbsXQlk5sutCKSfb5K4E6VFkka5gncf
	fRt6vw35YOe5vSBv3OocRQIokCVyAoh/vDfLBzRvThhgQvERn4gSWVWQJqO0KNVyihjXW9lmlDm
	zololfvhZP2xUXFzuV06qmbysN8IN989HgVdJQOR1YA==
X-Gm-Gg: AR+sD13Lsx1okyHVX9szbiawyT9T42RVrkQUNkQt6cMhrDyHm5eMIGZBM5fobuXR2/q
	T1A5xGLMwVOyCEZsX8S2vdLTWHbBXIOpAT2g6etmzuBfGYGKp+9WIGRgYNlI232w6UpmQ98pAfg
	0kz4rRKjbSkr3n/18zqKs4GiFWJVFoR1q0E9IYLAzaoWZ9uyyf+EFd1kBzUs5bdwX77Aqc8OYz6
	3itBcz6D7P6taLjNsw4sqZGx2ny8jepv29EV7oijHtoOUswjJapaeNLxt9YuKYCqwq7K1B2xSUu
	cmVqRSgPCIzx3MZNSqgcwAw7JxW0zGUIvvkcUfKhJrAueaRD
X-Received: by 2002:a05:690e:4507:10b0:668:9a53:c392 with SMTP id
 956f58d0204a3-66905822945mr1566093d50.75.1785312126656; Wed, 29 Jul 2026
 01:02:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-1-c042266b9eeb@linaro.org> <20260727-stirring-miraculous-nautilus-e22bda@quoll>
In-Reply-To: <20260727-stirring-miraculous-nautilus-e22bda@quoll>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 29 Jul 2026 16:01:55 +0800
X-Gm-Features: AUfX_mwa3Ibvs_xhtU9_glYoRrnOJI9mbG-XhW0xN7OZQOuaCyqfso8Gz7qCh3g
Message-ID: <CABymUCNm8_KNgh+6wKH_PO0Y=N6kxfMxOrWsq=wZZQY9vX2kkA@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: display: panel: Modify reset gpio
 number constrain
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B47=E6=9C=8828=E6=
=97=A5=E5=91=A8=E4=BA=8C 04:23=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jul 27, 2026 at 04:08:40PM +0800, Jun Nie wrote:
> > Some panel support 2 reset gpio, such as Synaptics R63455. So modify th=
e
>
> There is no such binding for R63455.
>
> > number constrain of gpio to 1 to avoid check failure.
>
> What check failure? Please paste actual warnings (but not fake ones).
>
It is a review warning from sashiko.
- [Low] The `reset-gpios` property's `maxItems: 2` constraint
conflicts with the strictly enforced `maxItems: 1` inherited from
`panel-common.yaml`.

> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/display/panel/panel-common.yaml | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-comm=
on.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > index 087415753d606..7c450d2799808 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > @@ -119,7 +119,7 @@ properties:
> >        confused with a backlight enable signal.
> >
> >    reset-gpios:
> > -    maxItems: 1
> > +    minItems: 1
>
> I do not get why all bindings now get completely flexible number of
> resets. I am pretty sure not all of them constrain that. It's rather
> your task to check it and explain in commit msg.
>
> For example the second random I took to check (ILI7807S) does not
> restrict, so you just made that binding accepting 1000 reset lines. Why?

I just want to extend the maxItems from 1 to 2 for my case. Do you have
any suggestion? Thanks!

Regards,
Jun

>
> Best regards,
> Krzysztof
>
