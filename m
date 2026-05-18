Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7E726B777
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779115890; cv=none; b=PuEh0p+tGcIkdUTnhtpr5rD0p/RoosAwCnTux/Pz4t+hDEf3BhUDvETEEjVggofQkdJmIrhIFVeTg8bQU5ecVeapyBYb8fdVtBfYY5O5382N6RG2NpUmIk/td+Nt5QjWnucgXKCQmtDUV5vevHhwzg5c87TCJn52ZrjpEhgNpYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779115890; c=relaxed/simple;
	bh=q7N6f0O1fL7CnMh9vlnmxZC9H0Mq5P8xsNIyAlAW370=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eByuVZhTXkxRXR/qBuI5jkh+wgBQxX6Yb9br33b+kLezYXyxKaYYI6Lsk8IkazLGr5947wu9SYXkIOBkLBaa4rSHVUuv2U4jmO3331c6QXstNMQ8LAitfv2auwluDeLlh7Be2qN14BE70npCGirxefdgZ3CQxwLVmdlW1jYrxq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFcZeDxn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFcZeDxn"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so26739925e9.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779115887; x=1779720687; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q7N6f0O1fL7CnMh9vlnmxZC9H0Mq5P8xsNIyAlAW370=;
        b=IFcZeDxnjfJ4zbK0walbxVJyHdQQwnLIrdz4q6JZXGx5YWmXcLR3oiuQg+f/H4M0cO
         qO/ZpeLW6tSW77ghFwdPImp+RT3oxFmP+8A5nmMrM8fDgzW74nK/6Tn8iJVOOJ6z460u
         r2IzeATE1kOFHMlPPW+EBB8DN1yC/qTce6eKCgGA4zsnwo0TqqfH12LDEX9+cUOKZ1F5
         0L6ZsycVhPY8N7e1K069Xp0C3a5GK2lzdtgXF9G0gad9aBV6v/W7pO8FgulMgtYWKSQN
         dMiBDjBP5OTda6lWTfsNA3EUYvj4T38LEmOkPeby11hNf+0+puvM2MLo3eXlQrfQZJFK
         eRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779115887; x=1779720687;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7N6f0O1fL7CnMh9vlnmxZC9H0Mq5P8xsNIyAlAW370=;
        b=ddds8rQzxY2ZbWKtumjf+6L5hRHeapERa18nJP7RKZeiQg4yfFUS7jIP82rbNEXqAP
         cSMmnNXj4B5Dfh9vL5VrIsqKOXOHIuww/jhI30urQks9TN8sAjKhfb1cJ4yqSevUa6Hg
         WjhWm3WTn9qjoK3YgNOmjjFK/wt+X+x/0TmKqYHFQe8tPDdW4n6j4FDrjWnKhXZxqXJd
         okENfHcuMmMsISzCPTjwHl3DDRcjV/ER6eXbqjqS2ZS5nJrLM3nGeyDUP5ofsequ5IX+
         ycIS+0ATmMjfv00htVzo85rNFS8Hdk1NbnItoQ9wy/0L77Uszgk5TsaA+FMK7iwl3a7E
         p8JA==
X-Forwarded-Encrypted: i=1; AFNElJ8uiXWtvhv/3CIzU5z89sDOeoP5nQuTXsKjEjzLblKEXseNmXtKgHYcAz2CXF46r1AVmz6heMJeLkHr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi+XtfAp2Gi2lWFS5/+lwLpFDK8/jKf4kKpcB07csw9xxMiuU2
	hBXtz3jAh0P9rSx7J6vXmbtZhPnL7sjkea0DQk3grKlQvBR0Ax0nfCTO
X-Gm-Gg: Acq92OE3GjgR3FJnDfb8fqQbHLtVAxkLxSDasXXxWtGSoXqmTWYC/oaOcGKwKT0o+JV
	KQIYMSeIef3IpfJzNMAmzjxkTfLBPhe0lthKWDZoyyrmG4wu6pRVUyPtPMe57lHCnAaRj4ypNwj
	iOotfX2B5vYcb6Yy/JaDvLFKA4ID5PgL4hhUc46JbNNUitCHWz8tgLjFAApzp1wzR/kgcmlMN9e
	5gyrCnPk8+y4tntBA89St4YE4yBNr4hfeUvks6ZKSvTnAW2woookDJTOZgZiVlCzr7b0OASo6JZ
	yUko/eAIqmEh05W24PnberyQTChJ4nRjk6deFUCGgJc06kEQm/uYz6wLCReJshvZ+mtVGwmwsBN
	s5JK3/cP0VkXzaHD7EtVZ1Rx6D/kbjvwiHkjlUyoX2wx8UeQyaHrm9TO37UMpTNu9jFOVBHH6C8
	i+4otatlBn3K5J5lBOhwhCEv8R6949x8A7XYdkOV1NKb34q7cgq82Pe4OxHBFuqx/7pb0NZkfvX
	SA=
X-Received: by 2002:a05:600c:698d:b0:48f:e230:2a1c with SMTP id 5b1f17b1804b1-48fe6631158mr246804535e9.31.1779115887039;
        Mon, 18 May 2026 07:51:27 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaa2a878sm131021135e9.1.2026.05.18.07.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:51:26 -0700 (PDT)
Message-ID: <22731dae5ed48680bd456a3a5fe5e7086d17a54c.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: wens@kernel.org, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej
 Skrabec	 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 16:51:25 +0200
In-Reply-To: <CAGb2v65jpG-XXNjT46H2KnLoM_SHOatFw82u38ZGEELgXmvDtQ@mail.gmail.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
	 <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
	 <256b1cd8-b143-4f71-91cc-8513be04ce4c@arm.com>
	 <CAGb2v65jpG-XXNjT46H2KnLoM_SHOatFw82u38ZGEELgXmvDtQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Chen-Yu,

On Mon, 2026-05-18 at 22:47 +0800, Chen-Yu Tsai wrote:
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> > > > > @@ -0,0 +1,162 @@
> > > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > > +/*
> > > > > + * Copyright (c) 2025 Arm Ltd.
> > > >=20
> > > > Please put your own copyright here, even if that has been largely c=
opied
> > > > from an existing file.
> > > >=20
> > > > > + */
> > > > > +
> > > > > +/dts-v1/;
> > > > > +
> > > > > +#include "sun50i-a100.dtsi"
> > > > > +#include "sun50i-a100-cpu-opp.dtsi"
> > > > > +
> > > > > +/{
> > > > > +=C2=A0=C2=A0 compatible =3D "baijie,helper-a133-core",
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "allwinner,sun50i-a100";
> > > > > +
> > > > > +=C2=A0=C2=A0 aliases {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ser=
ial1 =3D &uart1;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* BT module */
> > > >=20
> > > > Do we really need an alias for the BT UART? And is the BT module
> > > > supported already? Then please add a child node to the UART node.
> > >=20
> > > That's the only thing I can do currently regarding BT: stabilize the
> > > serial enumeration, because UART1 cannot be used for anything else
> > > except BT module, because this is soldered inside "core" module.
> > > We can avoid different tty enumeration, should the support for
> > > BT be implemented in the future...
> > >=20
> > > > Isn't the WiFi/BT module on the SoM? Then please mention and enable=
 MMC1
> > > > here. Provide the child node for the WiFi chip, even if there is no
> > > > upstream support in the kernel for it yet.
> > >=20
> > > So both the above BT and the WiFi is AW869A/AIC8800 combo chip, which
> > > has neither upstream driver, nor [upstream] DT bindings. Even github
> > > driver for AIC8800 doesn't seem to use DT, therefore it looks quite
> > > pointless to me at this point to specify anything in the DT for the
> > > chip which doesn't have the bindings idea even theoretically.
> > >=20
> > > Nothing in the current DT shall block any future work on the AW869A
> > > support though and the above "aliases" entry shall even guarantee
> > > unchanged serial enumeration shall such support arise.
> >=20
> > Fair enough for not providing DT nodes for those unsupported chips, but
> > why do we need to force enumeration? For the eventual Bluetooth usage,
> > the driver will find the respective serial interface by just looking at
> > its parent interface. IIUC there is nothing referring to ttyS1
> > explicitly. So we wouldn't really need an alias, would we?
> > I see that some boards do define an alias, but others with Bluetooth
> > don't, which I think is the right thing to do. Which name the kernel
> > comes up with for UART1 shouldn't matter in any way.
>=20
> It does provide a hint for any users enabling more UARTs and adding
> aliases for them that they should number them starting from 2? And
> just stable numbering overall.

that's exactly what I had in mind, as the the status of BT/WiFi might
change in future, we might want to make UART1=3Dtty1 and UART2=3Dtty2
today and this will not change with potentially coming AW869A support.

But that's not an essential feature to me, just nice to have.

--=20
Alexander Sverdlin.
