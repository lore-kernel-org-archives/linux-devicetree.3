Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC5C3F54A7
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784739444; cv=none; b=e6hS/3NqTwvuDIOMmdWXiO/H94jWvfMyHfT6XFfp2uQgXhub3HgvAnuZ6CM2k9q4A08zeBUo2gAheMbhBsL+Ac+vd4BGSx92b0SBT4DUjzYHI1+w2aslmn1ZYpCsBvkDPFAwW+YYTEHFPNLc7I37qSB5Nn/OgDyGD+WhUDWqzqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784739444; c=relaxed/simple;
	bh=wEYFAq4AuY+FzksAFP6rIn759EzN+icZzsnHDMDm53o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5vu6C0S+ogSYwyMcMyzsnoGTVmzd3a0HhuSgCiJtHizb+VIiUGE3jpCV0A0CL84v4JATH84cft9wR6VKtqvGpcEPF+DHDzA7YJRcVjiv9ohUYPLwNzJvy6GXbegiNby56hlq4LVE8PS+pPZk8/COK/qz7xkZMwD60baVh/t5IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N6EOdxmm; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N6EOdxmm"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bf959b820cso5787283e0c.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784739441; x=1785344241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wEYFAq4AuY+FzksAFP6rIn759EzN+icZzsnHDMDm53o=;
        b=N6EOdxmmaJ+Lh3DZE/M+OEybgXwcIa5Tz3JgSHWJxKyS5xuEmmstP+RPCjUe8hX6Qz
         WFo2IUSMSKWlL1efrnhsiLP+hU+jCrOULU7eWWUKSCxT9BrRBI4qT76UT/EIOj+vrs2s
         Xs63qjc9H9cq2f8Y7eAKs1jXsu6B2tgdriKkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784739441; x=1785344241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wEYFAq4AuY+FzksAFP6rIn759EzN+icZzsnHDMDm53o=;
        b=VKM2L5PykosQKmBkol75riIj0yrNwxfkmaChCGwWszwwzyG55sK2Kmv+0O/hMVDQ+M
         jP4Y1Bn1r1LuYCAr702unVOGh3AwPaLBHSrbfevxxRKHfYm+XY+N7Y3LgEbod/rrVKD7
         VUBlbyyRe0aAiLUcvSaai5GyDkpq7ViyxZtc98Zvztcmy6H6hpYzB0GwKvfbL5khp4Uz
         o7QDwdokPmNEj4rFjTuvbC/gfGwNDbtV42z2dyoYiLLgZIGQm48Yv9T8x+0uU/LlhZc+
         tYugZlqbYz78qnMQ9mSQvGoIdm0+Lnz0aWhvk/LJ5hivURp7lVyvNLXv5BxG+K1YdJjS
         gBhQ==
X-Forwarded-Encrypted: i=1; AHgh+RpopUEoFoBGgXNkhSE4h49PzqW2pk6tA1DFBoClZ6aYREK+Z02oPBDazBvW1PQ9WaRrEiU0kxn3TIMP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb1XJtM5nfOLhveTP8K05xHmOryANL8dH4n6f0tNX/lXjBsPRn
	h9eZ7V1eEcEHeMj2iO9vSZ/pLaSe1DN9aoIhWNeuFqRcEUZlZEVla7fc1nK312c6SSGaggBqOkK
	KK6k=
X-Gm-Gg: AR+sD1372A5ZJcmLjeq+64otUmvms4v/0IVsblLWYjX6Q9aXw8LyPQJWuYCDaHNtuke
	GU5JnCKd36nbmB/Dy6no/wZPVjhVFRi95mKh0CzkfJ2Wsk+/N58s5Dg+hqtogI/H/8Sm4Iwyzkz
	BBwliBMy+bFspfFkxbQpkjB7I4z96X6YrFr+luS/kFcxyCgGMIgHagYo2bf/E+3ZyagMXN9F4JY
	UnMKJMpRTcnSbtUToaUD73xjYHMi/Fai4dBPrORjCwtTkmCjXBkmqXtW5ba4FLmg0i6vfHkYm9c
	/9oFEJIb4IhZwR5rG53lWjYfhWsCRtnkHyrc1BFyFDIWjGFQrmjVPTTvKq99SxAxwqDtrfCYeIq
	/XQQnIjHe7EDp2QETzpFytmT/S4/N+6H1b6IWzQsINdXNnDST+bkF7QkDx/BRuLfaOEe6jnppTB
	TI/txtPydok496lKlyX5eRcH17zS9Pbn66mcRhWoC5
X-Received: by 2002:a05:6122:4694:b0:5bd:a810:b090 with SMTP id 71dfb90a1353d-5c1b665d565mr8350053e0c.5.1784739440880;
        Wed, 22 Jul 2026 09:57:20 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c2c6276fbfsm3680317e0c.4.2026.07.22.09.57.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 09:57:19 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9725084c547so4118774241.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:57:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RowKnSLJUR5XNmolkQPXj5xWPNRBxe7mtTEih9TVi+M5I9fEGysu0RW2N6t/57eoeylUSLU2qAKlMRB@vger.kernel.org
X-Received: by 2002:a05:6102:1612:b0:6e7:5c89:3fc0 with SMTP id
 ada2fe7eead31-7475374957emr9783635137.25.1784739438261; Wed, 22 Jul 2026
 09:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
 <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org> <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
 <20260722141004.GB548057-robh@kernel.org>
In-Reply-To: <20260722141004.GB548057-robh@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 22 Jul 2026 09:57:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V=ZdgC4fY4PadBFxomeqVD0E0CdeD3=PrcCFB1brXgWw@mail.gmail.com>
X-Gm-Features: AUfX_mwQnLQAqN0MjW9caLrzNlzhz2FE4RbdPofEVajHvqOI-LXTbiHSC_fioOY
Message-ID: <CAD=FV=V=ZdgC4fY4PadBFxomeqVD0E0CdeD3=PrcCFB1brXgWw@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 22, 2026 at 7:10=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> > Sure, it means that if someone unexpectedly makes a new Google
> > mailbox-array that's totally incompatible then the
> > "google,mailbox-array" sounds too generic, but that doesn't feel like
> > the end of the world. You could call the new mailbox array designed in
> > the year 2037 the "google,2037-mailbox-array" and things would overall
> > be less confusing than using the "google,lga-mailbox-array" as the
> > generic.
>
> What exactly do we need to do to stop having this conversation? We've
> done this scheme and version numbers and it never ends well.
>
> The reality is the h/w folks can't help themselves from changing things,
> so nothing remains unchanged for very many generations.

Stop having the conversation with me, or with everyone?

With me, I'll stop pushing since I think I understand pretty well
where you and Krzysztof stand on the matter now. Even here, I wasn't
pushing hard on the matter but I was trying to understand exactly
where the boundary was. As I understood it, things with enough
"identification" to disambiguate themselves could use something more
generic, especially if no preexisting binding existed. I clearly
misunderstood. Mea culpa for the noise on this one.

I'm not sure how to avoid repeating the conversation with the rest of
the world. I think this will always be a confusing topic.

-Doug
