Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598611;
	b=2KF0gTXzmvwk9PYwEwv2fMcgu+3V5+3n3RaF4qkuinQ3WjsB3cfva9mGbO5MXEpTu/0Q
	 ZFy1joopbN8WkjWG0EO+pVb9EpTeYkTk5jXsdvADeCYeA4TctAqc8fZx5lT8tmW38uOaN
	 RW5jit2m71NQZ0E8sQjnh4dMLZ5oVyDdG8NIrOEr2fVhXY+QaGfn9vmIKuyK66dUQkelo
	 9+rYkqV6zzzJk8Q0exo9Da6y4djhAsGM3HSFRkRlojLWmvUQhQVRoj9KpD+lOEj7eTnxL
	 y5bf8ccaV1EJbfmQFPEVyAWLCzJ4u+8BKbGUU5Yps8t0atO3P4kBWHtG7iuUAAgbJGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=o+0U5uc8o8aSpg/3Nq2d92vcnnoDIvQVEgNyLz/yOhM=;
	b=sKpJdXB7DWIqOYTZi4gZFLD/5sTyQkENjl5N121NcBGntnXXJuK9HWujBhmdqoKgxDeM
	 LG2UOlaOxYh+/5i+T/qlo1GNwJ1y5fz7zGGNhUTJa62jJk386PZmB9JiUsSj8xAG276GP
	 e9/NWu5CVhGu0c1XaVnmqXVLQUj3hk0cPU0y8KiqPjMqKlOWwtDsl+ZMeY7fl1jAH+RxK
	 FVaqXFdBVAV0+s+wTijbrC0i5mmjjE1LIM6oMfC3wm+kx9FJBC9eUBWfdW/KGIFC4jeoh
	 OY8DnYU7a8Wdwz9i1abAhLTlSg3S8Yz9t0FaH+I313ejseF3PzAiQDKtML9wAO7QRzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=abpGTXCU;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BB3606A328
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98BB3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=abpGTXCU
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so6904475e9.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792598609; x=1793203409; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o+0U5uc8o8aSpg/3Nq2d92vcnnoDIvQVEgNyLz/yOhM=;
        b=abpGTXCURGDONG81jxmVKNcLGAN0Gdj/VCCMt18rxdFNxVzOuhjViGTn5A0TUBKx9L
         dbxkHdztm68zVkDQc4tnl2k77NqCqYc5OHtJsqWQ8QACnjMzTA9/UMSAjnLzTu2O8UWk
         r68S9Q3YKpi0rIDLcz0oiM6mYC3JYOIV+uC6MGrPcwzKQzFYl1cnNfV4HuaJwKh4FBHR
         ffDDdhSXewhj5Iy20HQF50u5a0To1UbEMCrjxQtZc3r3Wzk8ZAz+cragSU1HvGxduMdN
         jawWxutsafJfgYBx03bxJuThOC+XF/WoKP7hlLgIkZYE2dpxhzFPkpyVc1bYiFT9Ds0e
         aHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598609; x=1793203409;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+0U5uc8o8aSpg/3Nq2d92vcnnoDIvQVEgNyLz/yOhM=;
        b=Xei0RP4pFgGevK8mBKdeagGW0+5+3mVd7vBOskBGH+YflYcMNHZtMYxnOjMTfo6nD1
         7h79nktJAAnMfnM0A8aZIPIx3ODV1gCEFWSoWK4qzNNQmNWoJLHplshBqMsAyDxJR3/L
         1B5lZ6+sFeVLQCuMSe0DPPwiNm6ahGMVvMqJtJOoGnUv+71A2L/ESqbU4DHJ3bNC/RTp
         0uCoxkEPO6nV6pnDtGNIVsHBeGaAuxTr9l7cwTXmKiJWQAwT5gzMmgpDD6Vb7QeOtlPL
         VkTK8iYmu45gRSCI8Y4MIxHHmFyCrfe4cNnxXWCu52geigr7VtH2R0Wu1XDjHfaxq5Ii
         E4eA==
X-Forwarded-Encrypted: i=1; AKwUvByKSE/FDl4pGCIaNugitPgqruQhUy64lkxMhA4RKlWxOdawtHAXA9quhhV2KDdoZWcQv0lP8IaXN2YE@vger.kernel.org
X-Gm-Message-State: AFq9FYKbNKc7Egad/xg6R/Os8XNWQ8jLj6I05AfuNRLI6VbNfMe/0dCn
	IcgJ6kXkykYg6PkQ9BXrPbOcT/WBsfvTP9NHgtzhbdeCMYP0F2CE+OePLc/ksu++DpA=
X-Gm-Gg: AYBFou21Llefn4UMY5P2iu8Q0hrQDHE0Bv8uHS8DbV1qoK+mncLtXIpZSRLb+vIuBcW
	cedrIX+eKFNEaD/v94WjZUjHaUPTubdub+B3X8sdo281pbcKhDs3z2173+pe9T1Sfq9V5ki8CsD
	gUG10k9Qdx/Mn/zr3zkeR1RFrKpyHB8XKiDy4ak0rW4iPe574W+AC03ozh1gKjQjJ2bPDk19lJK
	wc4BWCVz2CRqRIOFqiCB+aBa/vCFUM5ZZ8KnGOJWJJsUqtiwdjH2R9tDWbnk6jwDKksOAm4JlAJ
	AQjR7eAq74/6dmecdC1YItpWVhJDW9FittpwRLRRSPYretz49UgR2eZXWuuochpuaRMY8oYNpQv
	PlsRnggDD+3OAQ38wek44NT1QRi8WWtW9TBYGFp0FNu1dgLPYJFEg+p91OVtHMtEqVcshPP+44o
	FttqAeYEGRu2CHalOyyv4moa7LoMRO1UYDuaCXOK4iIVPJTUY7dBRiiZpDhLQjha1m12hWUlwNG
	cofCm7zMxfo0KRXQNVWKmhJ2uIlZ1YJYXILu08VSfRb453WcbYwc5dnM5QgPVW9sIORXyqJURou
	WOXZ3GePht+Du51/PdsGMbTcq41zISh+2H18tb+XdK7MH3Q=
X-Received: by 2002:a05:600c:4fc8:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a1fdd2472emr58485645e9.11.1792598606167;
        Wed, 21 Oct 2026 09:03:26 -0700 (PDT)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd629bbsm53982045e9.5.2026.10.21.09.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:03:25 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 18:03:23 +0200
Message-Id: <DMAN65SWMXQ0.125AVDDDSIG7@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Paul Walmsley"
 <paul@pwsan.com>, "Aaro Koskinen" <aaro.koskinen@iki.fi>, "Kevin Hilman"
 <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>, "Tony
 Lindgren" <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Christopher Obbard"
 <chris.obbard@oss.qualcomm.com>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Linus Walleij" <linusw@kernel.org>, "Rouven
 Czerwinski" <rouven.czerwinski@linaro.org>, <linux-omap@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 02/10] dt-bindings: pinctrl: Add devicetree bindings for
 DM816x SoC Pinctrl
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: "Andreas Kemnade" <andreas@kemnade.info>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-2-b4ce30217028@linaro.org>
 <ec27fd26-1862-43cf-803a-428846d66663@kernel.org>
 <DM6CUP7TSOMH.31T789KQ3Q6OB@linaro.org>
 <46414ff2-1273-4690-9001-4d1f825d8cf6@kernel.org>
 <DM9L7QLLNMOR.1NHOUWGMQK181@linaro.org>
 <20261020215143.7dd0ad5d@kemnade.info>
In-Reply-To: <20261020215143.7dd0ad5d@kemnade.info>

Hi Andreas,

On Tue Oct 20, 2026 at 9:51 PM CEST, Andreas Kemnade wrote:
> [...]
>> Sorry, does dm814x.h not look as bindings? I'm a bit confused.
>
> probably also not the ideal placement in bindings.
>
>> FWIW, dm8148-evm.dts is not including the header, dm814x.dtsi is.
>> Following=20
>>=20
>> Basically PULL_ENA define in omap.h is wrong for DM8168 SoCs.=20
>>=20
>> For a better solution, you would prefer:
>> - Keep omap.h in dm816x.dtsi
>> - Add a variant like DM816X_PULL_{ENA,DIS} in dm816x.h
>> - Replace defines in dm8168-evm.dts
>> - Add the header in dm8168-evm.dts
>>=20
>> or:
>>=20
>> - Keep omap.h in dm816x.dtsi
>> - Add a variant like DM816X_PULL_{ENA,DIS} in omap.h
>> - Replace defines in dm8168-evm.dts
>>=20
> Hmm, there is dm8168-evm.dts which uses PULL_UP / PULL_ENA
> in nandflash-pins. Do they factor in this inversion? Do you have that boa=
rd
> by chance? We probably need to take the brush there anyways.

Andrew has one, AFAIK he already tested that, it should be fine.
We are checking the schematics anyway to be *extra* sure, but the board
boots and all the peripherals seem to work.

>
> If I had my head in some OMAP3/4/5 dts files with non-prefixed
> defines, I would probably not object against any PULL_ENA without
> DM816X_ in front of it if I am not very awake.
>
> So better do the undef and not use DM816X_ prefixes there.
> Maybe rename that file to dm816x-pinctrl.h. That is a bit
> inconsistent with the other omap files but at least that inconsistency
> can be catched by the compiler.
> Other arm32 platforms have things like e.g. nxp/imx/imx6sll-pinfunc.h

Ok, it is a nice idea, I'll refactor in dts/omap/ti, using the same
pattern as dm814x.h.

>
> Regards,
> Andreas

Thanks,
Ettore

