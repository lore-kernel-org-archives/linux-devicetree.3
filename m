Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEC63F104C
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 05:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791525157; cv=none; b=B0tK0/4vmCx5BpFIOXB52WMDfJCDBYdccami8EVkdHmfVpQ9NUx1SMww7Z9i6spJB3zPJOavkQ+TZoDN7dX+DRkfK8RbR1Md28KxWOCCAq5VWN1G40vuLh4NVLTPmOZf61rbjTitIeHim8ePNPq6PJn4AlVazTD4eFuVM3+dA/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791525157; c=relaxed/simple;
	bh=vANEtx02YGciCZihBKUYNtj/eBy+BpTaZ8ueDZBr8AU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WOPsoUSO3DZ6uLABoABnjT2M1t1rvpymAw0vG29a6yOt/mrdVGsf3pbVti8XOj7iLyh2fnyy1TeSOWuig1vi5RNf/tu8unmJfA+Hc/LLyDyGbO1HQNnq6lBXUpctr/XJWwASdHIy0Z3QY8fxR6ktePdtIzrM6LD5xp/4ANK4BEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6768ced47aeso4291858d50.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 22:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791525155; x=1792129955;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHcCOJlfDk2kf/nYjNk1wm3um6Oe/oxI7EYgEHDQ21E=;
        b=GONYT4NLP2QpI4webij4R+W0XG7vXCcewbBAUo8A64AOu4nbFr1ScPFU6gAcPdg/HM
         uYrjDxZSkVEvA2Xq6Nxz2Uf9Mswe21ai7kaFuNdu4lH0BudxbpJkvMZIoaSY1U4uRdI8
         q5MTuYMATZliDnb86X6NJ8xzJF6tjBQm3fQfGK6rePk0xqbZSHy66VndHQFmBDFdW8Hy
         4KL+Eu36VqvYum2vvIw3EHQlD6yBb+kZCI+TkyIOMoqpJU8eqFTKSfzlgGHjRPPEOhSU
         V8tV7+t7FQJnHFKIA4Ai7hG3nHg2C58IrGfpXdaYZvEiZJxdLou2EY/7QrOlU/ZLStdm
         3gTA==
X-Forwarded-Encrypted: i=1; AKwUvByct0gm++eDzl2yBvWGzwGhb9wnNUgR9+LSENdI/cXqzZ4qQ9p+WkRvqAKqkyE514E/cCxgeM1Qu3Co@vger.kernel.org
X-Gm-Message-State: AFq9FYIm8NF6ktpNTifn3dAb4Mm62gkP9QRWXJGvoPqVIDnKY/ALBPuK
	uO9Er+kEbbg3xkR6y2GwgclMCjS49JpAa2z+RspB7qK71HlOjdejc4dF/7WykQ==
X-Gm-Gg: AYBFou1wGoXPhGsS4HBeFwuR1HHHvWCTpuMEsyjfY4Sv9I8zQcb1C+j/5116TIaBNKU
	Dz7dnQ+QdiCwkoQH0c5iGG9IFUWPkdXNR/bz6vKXm8Cuts4hx+L1W6r6ghzRy5nCWDNTBuaIws3
	iPAZ7AXq1SyxdjEJbIjSCyi0MR/g3U4fxHD2eCujoJaG8gLGDAwWeIexxBcOrkmgN6J1fdF0EsI
	KumuCP15TbYh3Yi3tojmQAX7dr9Br72TCqrtgP0rgVW3nxT6PwXGCpL1/kFBcHSHO1uTDV+dnY5
	6BS8Q7ScjYKJCc+xzUrJfIpwt7wBH2PRgxeKZ0S5Jb0kUk/G9wIeEsFe8tUMKUiavprQNSgVZJx
	Tg0UH1x2Os5Myz5buOoYFrepwN3v1bVjoBX5t0JWe88mhgvTchlmQYGGI905rUjtGK+i5MURd4w
	VYX7VGPqAa7DyhaN63VZ/egLE/1iQ6el53KWXoudwHwvWesOU8GEKr4+rJWoguZLbuVahYSQx7J
	MWJWwqB3hgxiIlR+554lAqpSjENqehGDiM=
X-Received: by 2002:a05:690e:4091:b0:677:cb45:a45e with SMTP id 956f58d0204a3-67935edb58dmr377659d50.6.1791525154802;
        Thu, 08 Oct 2026 22:52:34 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679356feec5sm418741d50.22.2026.10.08.22.52.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 22:52:34 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-885cf67963eso40787237b3.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 22:52:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwWTRxKaWb/Z48KZDOxdRMoCB4HjCtGBInlqm7bml+zO3dYvSAlgJWwssjeMj/WQnaYAOy7JnnZGf/+@vger.kernel.org
X-Received: by 2002:a05:690c:e:b0:88f:62ba:512b with SMTP id
 00721157ae682-8b07ee3297amr3678357b3.42.1791525154408; Thu, 08 Oct 2026
 22:52:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007082627.63807-1-tanure@linux.com> <20261007082627.63807-7-tanure@linux.com>
 <c1764303-9f18-4487-ba93-06173cd8a53f@lunn.ch>
In-Reply-To: <c1764303-9f18-4487-ba93-06173cd8a53f@lunn.ch>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 9 Oct 2026 06:52:22 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+1BZky6KUtqZKm7q8bDfWKV47xSZtK31qdYBWx_e3uwdQ@mail.gmail.com>
X-Gm-Features: AclHuK9uJycl8wPMvbL9js8yfzmf_wvwEi-NV4Dy7HnHzbbgfaJpxaRVEvgynGU
Message-ID: <CAJX_Q+1BZky6KUtqZKm7q8bDfWKV47xSZtK31qdYBWx_e3uwdQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/7] arm64: dts: amlogic: t7: add the ethernet controller
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 2:12=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Oct 07, 2026 at 09:26:26AM +0100, Lucas Tanure wrote:
> > The SoC has a Synopsys gigabit MAC, a block of glue registers that
> > selects the interface type and trims the clock timing, and a
> > multiplexer that points the management bus at the on-chip 100M PHY
>
>
> > +                                     internal_ephy: ethernet-phy@8 {
> > +                                             compatible =3D "ethernet-=
phy-id0180.3301",
> > +                                                          "ethernet-ph=
y-ieee802.3-c22";
> > +                                             interrupts =3D <GIC_SPI 3=
40 IRQ_TYPE_LEVEL_HIGH>;
> > +                                             reg =3D <8>;
> > +                                             max-speed =3D <100>;
>
> It is a 100M PHY. What supported speeds does it report in its
> registers?
I cannot read them. On the VIM4 the MDIO mux points at the external
PHY and the internal one never probes, and no board in tree uses it.

The line was copied from meson-g12-common.dtsi, which has the same
max-speed =3D <100> on the same PHY ID. Dropped in v3.
>
> You should only need max-speed when the PHY is broken, says it can do
> more than it actually can do, or when a 1G PHY only has two of the
> four pairs connected to the outside world etc.
>
>         Andrew
