Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743F438422F
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 19:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786564572; cv=pass; b=QyjfX2zT6hg3Wxn7fU/JZQ1vqSImwSt8GnGogy68dPKlHcKTfH3uByLB4MsIKu1IgVYMDJZqVgvjn5/PVHTOwXjUSgLUDyO/njpTuQ7RNYybEpw83iqkl9+SSq8lr/Ic/G/8giqAQeuL0KTJ19UrbNOmFfPKJI+NuvRqvDBa2YY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786564572; c=relaxed/simple;
	bh=EAQaKo9Jb+ILAqr1BVcf5D/Ei7LFlOvPRuPRAZrExRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TSZVKGOZHfyQOHDEPlr2uoKjfGaIWsTCqq4u0JZDZ8WcVwtxF1dx4erGuPnDBc/Rbfs4LqGp2LXTfq8VD2fqe3TM9uZl1KJaXq9tNYFR1Ozdq/Th2OuHODO2gm/J+nYq/E/iQhuhkuHUG3l3fzxyloIVmJFvTFd6KRX1O02PXQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4bmk++z; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4bmk++z"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a144c8eea2so90478a12.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786564570; cv=none;
        d=google.com; s=arc-20260327;
        b=YIgHdXxrL9dsEeCb28D9otc+X6xa5hXfK2IU7XEBdRTqScb95pDzQsgRHFHZGDkDxC
         qIvhcg4z3wWMjTTvvralmY9s2LC6pY2Mou38EkqtSH1hCZEGxLuhT+s1utp18+J2OwLU
         5RV/iWbnG7VngmF6pXna1DVbBfeEx2n8qCMPu+qqHx7PgKJn1+g/YdjiwIeoBQYazA6h
         J299kdTwp0mFnrOupzGs04qt7fp9tnnXPPGMrUCck/nc7GgsTFyiJ8tZ2kBCowsLOSkZ
         q5zLfsO+twKz8BxidWdBD43edYFHegs7UjPBPQ6A6MS0xl1ksDO45BC8HasEROYUtypP
         6eFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EAQaKo9Jb+ILAqr1BVcf5D/Ei7LFlOvPRuPRAZrExRA=;
        fh=3O205XJzkBvJ/pTRHrorYQFzUnDju0dyaCFOnPQSCSk=;
        b=JnUXLVcbyvaBRI1WHFIWHyXvnZF2tfz8mJz3H6EnJxYcJrLDgDSnM2nY/Nq5I6DqQI
         KARtRPwA2hyS1ej/JYUiGwdU28Tu+LhJK0tymevPoj1gi5YFZ887XsVFdrz5nuz8Zwnr
         9sNGXhzoZ/9oiHVYjcQvh1Nn3KMEW4KWdFmNiZB5u0tzrie6IeCr1ZX1Mas5mFRMFAhe
         tTsCni4/z0gxrwBc5ozqmRAotAZwTXMCPfP6iey46Khz/2JQJEFVXrz20X2BcUO9sbsa
         T6MQGU8ENhgzMeU6tMxe962ULW/P7kjCy9pXhicrz7swJNG4o/NXMPeSXgH68mht6lml
         5jpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786564570; x=1787169370; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAQaKo9Jb+ILAqr1BVcf5D/Ei7LFlOvPRuPRAZrExRA=;
        b=M4bmk++zTPNUDCnMPnoBXqYqkZwtJs09JSwmeAWOvb+sPD6Lrqy0+9CmZp3zKQ3//d
         O56H8zT30Gx7bSnwlrQ+k12u+kRmA2BJwjbcGSYuEL8jUutHX3VPfvfQjCg6I7nL6SPz
         T2TTii/+rBbiup+G2GvIN4m1vjluK1pZBbgcjm8dCt8cq4R2aOPv5e/3b+jBqJZ6Z7VT
         BwGlnx8SAcyEfZmwxSMTOjOeBcYFctrwUUcCEOr1V1K5Pj8DWqHarZ0qIOKI9m1fD7GX
         wjXsjpVgWFj9ohti9FYMFZM28U2MHPKK8a6nohKHl0Xj30WAO3nNC25VAH7k0ZdAqTQK
         kkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786564570; x=1787169370;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EAQaKo9Jb+ILAqr1BVcf5D/Ei7LFlOvPRuPRAZrExRA=;
        b=sxeUAE73XstQ4kfd5KB1BgeFqoz42f/aoqQVUXp0tq0V0TxqgYzNdTRcoycK5jyHb7
         zKU+J+YO+P8VC5RB0d1DySL2KvFKpnkypXiDRf4WgafDfKAjpc67DZn5r8UiuXxT1VY+
         saYBOxsXz6JirZnGv99odXPz8PwLGVtVq5iAQDMWDyXYn3NesRuUnAesPuSubCCyenbJ
         nvrx3OwrWi9kI9nTJ/4OHK7BLpEaWqU1U0MDsMHDlhxEjHBCmCC73alhROxiD7SDX3FD
         ZccQRNAx2vmzhzqrDh/idCwKsXY12jdHJD12fB2YxePBt79Q7ex+evpWp/fYHJ6YtypZ
         p8cw==
X-Forwarded-Encrypted: i=1; AHgh+RrptfdE9Y3+A+DcAk0D6h4YjuQ0nfvCd7KuEQGwVuXYt7JnuH6p4TCX7eAxbEHyJwaLs9Vl2y4Qigza@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdq9UrWAqMKXi5S6Kkr5tGqHivBgcyPzsUcc7EaWaNnuTcKLjS
	xw7z5awB9lXPUmEf+UE7H81NV31uOSkLt1ErneD6QbXRMGphbJ4F2RoL9XVCJVlnZzUD9ZQqLQr
	JofdBxSzjO+f42gEx7R/OdvhWdtyH5PU=
X-Gm-Gg: AR+sD110o7McvhYmIjG0t0oKnURBQ8d2WbE7jj7N/5RlIOyKGi7ddKHAjnQUIuVBP9G
	wylwVtJhjqgX2dDQgqnhVw0CXlHDn5ezlF+yZ2gl0GCGPVDttC9Rer7Eff6mR8W8J/Ix2q5VeaM
	EUmc4ElRPkrvt7yGx5COpchSoLK/7IY/o6lL3qOoY0A24vVPni2Mxq4GVz24QS6lzswrQTzmeAI
	LygS/GwO25ke2GjAwGSu1qzlZOEU56N/Mc2r595LKWIyBt1ZtcFLElAw9+7QvHfQEN3oDJxyvzU
	HXEeTrNzU1OfQLooa74XQj2PUhdQH/OvvYNU2ohSRQIL2Q==
X-Received: by 2002:a17:907:ea8:b0:c20:f622:576e with SMTP id
 a640c23a62f3a-c2108fd8af5mr27935166b.22.1786564569449; Wed, 12 Aug 2026
 12:56:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811113901.3114169-1-o.rempel@pengutronix.de> <20260811113901.3114169-2-o.rempel@pengutronix.de>
In-Reply-To: <20260811113901.3114169-2-o.rempel@pengutronix.de>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 12 Aug 2026 16:55:56 -0300
X-Gm-Features: AUfX_mzmc_Vp1gf5pS3c9lLg2ncAAPiX2u8gP_ck4Dn8vmO3R-RtpUEiFH0GhC4
Message-ID: <CAJq09z4Z80NtBbWp75gYkXHXEvs1COweZGF5Z3CEX0rsVSbQ3Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: dsa: realtek: add
 RTL8365MB power supplies
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Document the RTL8365MB power rails as optional supplies. They are optional
> because the rails are often always-on; some designs break them out for
> granular hwmon monitoring and regulator control.
>
> They are scoped to realtek,rtl8365mb: different Realtek switch families use
> different power-rail naming schemes, so these rails do not apply to other
> families such as realtek,rtl8366rb (VDDA/VDD_CORE/VDDIO/...).
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

It looks good. Thanks.

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
