Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3C43976A0
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 17:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085909; cv=pass; b=DZfpvuGMZTHr93E8iAKFJikv1vdqFYhMIGraiHIQvCqgHoIVqb6nMvv55ebTaUzzT6kICmwxf6RJVENK0PNh8sh99WUcdP3LwuJoVYMNq0ynS6WhSdTZ6122cBSCzRKvJ55GnsukiEv/RiEMTakSVSRsqrp+kFsBiXB7xHXemZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085909; c=relaxed/simple;
	bh=bkxFv5PX8ujIxdonqIilaYDobdJDnLk8tXzGrWmcSt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6XSJgSg4WxuJPLjTGRhhQOApNKCQXHoc/un98kefds8YQ5qPGGHvmNPAF1d/n+27oGqu1fdpHUtplr7Yv6AjruV4nFu7vJJZGkcsvu3XsfgRTIO5RZXUwrR9edPgTtBirZo7FHSyUVkVV+waDqI+tmEA9jbWYMulCnnUP5Ejdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdY0tTI6; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdY0tTI6"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6798eb0d13fso1487204d50.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792085897; cv=none;
        d=google.com; s=arc-20260327;
        b=h6rvCr1K03EtnnJ8kPBF8cEu/J+sp41nhnwFFtBbUAxOlOXNFu+puoso6KYdQqGJ4C
         90dBqatBHcjRcB/8uei2r2TLYtz470N01LBZ2qXOeeghAvE7Fj8Edx9NYVQDlgFXtjpn
         WsF7iuAW/ujBIZUQNMz0Oh5dUVmc7//ees/6sF5pWSNnqlKsUgTqdnhR3iKbMoKXEPDG
         q2xZ6qdvGqrIkRrLyw3dsyBiqGxBQVo3T4xg2NaxTUczRSoa03mEnBKjnnt6/3/oVNt0
         j7grY9rLztEvHKrbXixtG8WVrkabgOjzbzi3Geg0tlYlYStw/rwF1VuFhePFia5qPNJj
         tZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RNR7hf8UYLE+m8+IlSqf9D9Kn/JvEzNZNospuZY38uA=;
        fh=JzkTaNaty/GvM6ANvBempbV2I1NyMoMVPDZg38WRzIw=;
        b=TCV4xOZ7vJBW6r63Fmu3/GzEJwTnPYLT20V75D5DI9U6ut0lI/4El60u0ej3mwLA0K
         RiXu5PvW70Q1y3y0gyyWbJeVWZat9YAQKcI6ndv24B18e3JYriNCjjCqO2aVUS/Y4P1r
         byJz9MtI4GBYibSwgcIApWzMPnrYt20to2sGu6ZqeKsncR3W1+B2qntsV/+0Zd3dB571
         Ei710ttNlrwakmCSl4RdArxNi0b0BcNwBxm6tc5BqNjFswfNJNxaX3megX+cZMOy9aZA
         X8iOkQ/KK3Pl/Za0cGpTro0e6kDUOdbwOIa5GXKBQeTVnGRLsgIy/Thz/HHosAnFe4CG
         e9Fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792085897; x=1792690697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RNR7hf8UYLE+m8+IlSqf9D9Kn/JvEzNZNospuZY38uA=;
        b=FdY0tTI65LLFbSDM/PkmptpQRO/LkHkyKCAY9mHUMFpQa/S6Ox3Yk0ohOXs6nYBv7a
         LSgYooxuKothhty/g1dDYggLu2Iwfl4MufA0UGt+NuH52fQdUvPhJviJnAKKXCVlE6FK
         MXueZ5y8g6dGvYt+I1JZLjj4anjvLk9Y+v2jV6gHpQyvX+pVyu/UGw5m4vSBhwwXqpDu
         7+6Y+OAd4F1e3qja7s14n57vtS3/yjc6Fn7Y5Nl63xNcVLEDjC/ulSeHQXea0Y4wBzPn
         xC7EeuMmbwSbY1P8cq6KORdYHXYDpN/iil6Mj8ehEULWWhpE+ehGB0H35YSm1NC8cyKD
         48ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085897; x=1792690697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RNR7hf8UYLE+m8+IlSqf9D9Kn/JvEzNZNospuZY38uA=;
        b=jUzDNx4dvaFDOWnF50Nh9+cKbHp0TxVKS6gS5cgLKuAvic4V4oRHfuCKqHzPnT0UMv
         tjRwyabqv4AGJDKPCexdp66VVxErDIT8HzG5kah2b0pWOgMb0fgdEBsMakE1GQ0iFww8
         8J7n2Z/VGnrnHQkU87HNh4pc8qGHQIYFGqYQl6cK81sV9CH2evxMWy/CUK7aX/dWtC5h
         uHXFsvmJ3XqFpN960QAcynChQ2FeAgeGs5coZ3WM9bGx+eztq5oht9FzI2REtRW8RpM5
         MBN+f9Qh8q1XAettAwuZtr9Z0EZ4jj3FBGB6FJtsDea0P2wAitoLXIe5W7wV/NsUkeIs
         p5NQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhIp9AwqCYm1lfDcXI0uTnDadvum9bzEfr2U1TXaq6tUiv6SnwMbp1H45fcnmb4TcuiY/H5IPOVZdR@vger.kernel.org
X-Gm-Message-State: AFq9FYIGoCb0pARnJ05gLJXZXiyDIEBPduP6T1b+Kh8b5tZbQdPoye2p
	Ft07ci17XGYXcz6kmbnvv3kfAIQnZTZd/zln+5+IXsnpACgTQvlx0820ZdCi0JhsSEr31wKDdOM
	BD7PhrIrivTvbmGJchajz/dAdvwf2qKE=
X-Gm-Gg: AYBFou2DFX5IawDdLVvFsQhGRCVoW2+5UClOJX1K/3Fgt5WYNroosfKP8uFk3YjFtYM
	jy4lm3qLkA9HYM/Hx29jZ0uRALxDeiTMlEhv7O1v/zBePjbXVnP3ul7rxR4wN+y1pbA77W9ScFy
	poi2wMcn+YsEvLWV1KDQcjTqGkC1Tp5hPZV43ZZDk2nsRYNtNYDvUpLC+9xzbMKCHROtcb1IaNR
	JwWxb8BH3MDrmoKROhwyoZXwY905CZucfR2ie0Mc4Vvn3pMWjeL4eslyUqzUrFkhK4MkUr1Aeg4
	BmYI8mCRjUjelVtLH1X8J2UFRZQDUn1kIwInY7yuIIdX+vFZmwMLKwqmfm8st3nm1P4=
X-Received: by 2002:a05:690e:1c07:b0:679:aa90:d272 with SMTP id
 956f58d0204a3-679aa90dd58mr432536d50.108.1792085897078; Thu, 15 Oct 2026
 10:38:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org> <20261008-04-k3-pm-support-v2-2-6f778a53dd2d@kernel.org>
In-Reply-To: <20261008-04-k3-pm-support-v2-2-6f778a53dd2d@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 19:38:00 +0200
X-Gm-Features: AclHuK-mkmvLNzpAloyGNWEU1xEwlRugYfUHBOpsjJVuzj_o9PRbUr7KYWotes8
Message-ID: <CABdCQ=PAHxwH1+1OkLiW2ad+PTxNY6OmmPwOwAR3EoDe6Mt7Zg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pmdomain: spacemit: Add power domain driver
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El jue, 8 oct 2026 a las 5:45, Yixun Lan (<dlan@kernel.org>) escribi=C3=B3:
>
>   SpacemiT's PMU (Power Management Unit) consist of several power domains
> which can be managed independently, depending on different application
> scenario, each domain can be powered on/off for saving power.

Tested on an OrangePi RV2 with the PowerVR GPU power domain. A few
comments below.

> +struct spacemit_pm_domain_param {
> +       int reg_pwr_ctrl;
> +       int bit_hw_mode;
> +       int bit_sleep2;
> +       int bit_sleep1;
> +       int bit_isolation;
> +       int bit_auto_pwr_on;
> +       int bit_hw_pwr_stat;
> +       int bit_pwr_stat;
> +       int use_hw;

bit_* fields hold values 0-15, u8 would be more precise than an int.
Similarly, reg_pwr_ctrl fits in u16 and use_hw could be bool.

> +static int spacemit_pd_power_on(struct generic_pm_domain *domain)
> ...
> +               dev_err(&domain->dev, "power-on domain: %d, error\n", spd=
->pm_index);

You could include the domain name failing, that would help identify
what's causing the problem. You are already including the name in the
"power-off" error message.

> +static int spacemit_pm_domain_probe(struct auxiliary_device *adev,
> +                                   const struct auxiliary_device_id *id)
> ...
> +       pmu->genpd_data.domains     =3D (struct generic_pm_domain **)pmu-=
>domains;

This cast relies on genpd being the first member of struct
spacemit_pm_domain. Reordering the struct silently breaks it. Consider
allocating a separate struct generic_pm_domain ** array and storing
&pd->genpd explicitly

Tested-by: Iker Pedrosa <ikerpedrosam@gmail.com>
