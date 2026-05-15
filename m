Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3C131A56C
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778834267; cv=pass; b=tetAnkJbfFRWcmg3m+W1eZ8Dwxj3cej0A8YWfOtozENpNfsbMSIe/oNhFGfUpjaZWFq97ZvzsVPJJcf6eloQgKFnVj7y/rRycML/BN5wl6/+NzFr19l0pQ/LP4Zp60K+nR48RKCxJWx+Bwu+iKEE6S81xqVzxKC75mgopwT/a6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778834267; c=relaxed/simple;
	bh=unrCV9BlS+NT2H9YcNFBIBdPF5SnAoNci8LrnilLGqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X1CgoT83ntJ8g8I0ibbNLXOqV6Nfy6gjUT4dKNW8B6oQw8gai+m7mR0OaRjI0LA8j1OksjB6iZzMx8Lj4E0DWhS/ld62gyltfqnGiBvPQt9ZPzMsayLo9Z5Q70ckzMi6bE5sus3CP/al+bER+8EcPIli/SeB7dYS4NtQqdrpRks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6af3o+k; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6af3o+k"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f3c623322bso15205744eec.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778834266; cv=none;
        d=google.com; s=arc-20240605;
        b=LZ8CcPRD0fQYqO2sd41xhFazl2J02YIBXrj8Zn9EeWb/3WsxBcDzMb6GwyhRoVsyGk
         gXugUx8jejn2xPE2I58tCXC3YOIMNlOxEaLmrzhC1YEGRke07RjMboXhABH9q5bHhpTk
         sUZhtlSXZQQNDy/sztrvxX22pNZEyRHCsD0cfC/kiuURNbNEWPW2Mlpw19fz0dzDe1dP
         wW/EkBtDYeg1a221oxHillCw0aEokiFr8pMMCYvnp6egYJUlptbcn+HdE5j2ixp4UHcI
         V4s8U2Qj7pkr43lmq9qYJdzuT2DCFyOYwTcqpMJZ1VDtpcGIAtCFxQIb+wfsF0xKVQ3Z
         w/8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Me5hEq/uVA2vry/WusH3UXPaCOwfFKJKOpGLMOeOsm4=;
        fh=98x0tF/MrG3u6agcVnLKY2T9RX4Hf1BiAePQckpPlu0=;
        b=QSuI/jP3YFpncWKR+6SLq/hDA1qJI2RpG8wikMGf429U5HyB6N04/VDaCFFB59Uzlu
         NZGybIKmo59GmrmsjQ6Lx+Ls6BnATB5ijJ2R7srStZBia6z05dkUSF3pxyUA4TCFk+dP
         UVeyqBo3PMRnvwnfeJpxTHe5/tjercLlp8rzjHZ8upHxuE47xqK7dscZVmrOvjXynuZk
         m8i4kNLivWCy1R3WwyQ48TEJprxe9orZlR4hgCrvv/jsB9n+itaGK2rb2Fdo7XMl9rM0
         D2+olJVutRgK1xEq0azkNF3jd+FEzyw6BemPXZRpccOOAT/X0TcdxNdNdlrK1rDmsprJ
         ao9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778834266; x=1779439066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Me5hEq/uVA2vry/WusH3UXPaCOwfFKJKOpGLMOeOsm4=;
        b=J6af3o+kBsvRvTtp5InCk67+NlrHIgODsJqzwPQ4eeD/BCnyKtt777pgo+ofAPURgL
         HzF6jMMLQnZwqvEoSifIHHtDcnqLkg6tfXFJUMNbt9wOlNkvosQUL6rDxtj5EHMRtLiW
         ZSCWHveKvVYdi/LPIbok9bDg3toxM2bFzpJqtF51ebmOrU+3nQM18F81oojcUr+8CwcR
         NKVd7SskLjzvNNJ5ePGlIbeneLV81gyGLhDuLs0MTDHogUxdE/GLW6nkBHrybnLzlgy9
         HPz0FxaBnNMkD7G/1UMHm15/7xFBqsuWpGyGV03ic1+IxCMQw46To/ZPmsY8SN2Xg4oJ
         RrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778834266; x=1779439066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Me5hEq/uVA2vry/WusH3UXPaCOwfFKJKOpGLMOeOsm4=;
        b=m52GrFhoEE0c8n7Sa4XXZdFdAz9c+d7LoMiD+W+I1tbsULg8JmzT2Uzh3p6Uizp6fz
         5l2SkrRTU5aCDhlr8IK+E+OQGuiWoCsMa9sNBTK7GTgL5i1GfNGerhchEqXyOPBInQvs
         Wh+fwUyh/yRNnpx3K68cB2cOpueTC9KDg/061gbnkGcd5VO9H5xT5CO+SyN+9yScO2/x
         wf0VQhAm4acozeDPMrumYRVSyMMWuU8xXcYnTmh5VXxV9AiCrzTIVgA6Y4Wz0mxK3MZK
         Wmlsl68C9xO2Ww4AGnOA6uznBduoPPfFQhNjAaxPT9J7ARXRdDt6snZUYKVko6PgzNlJ
         x6dA==
X-Forwarded-Encrypted: i=1; AFNElJ82uxjKxBvSBTnzcKfsl6Gho0JHLmO6qftZUpbyAya6srxFdMk0RuUBzbgpneoIQQDkb7nSOX5GL1jp@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa6Q3GMNJluNWrpIiEuhmEnXfuJv4Ea8a22Q9o1xklm8pJIkYS
	p2/pXTp3XhEBWSEeoqiEB2kzy46piRkiWa4plku73OD5/Q5RPy4ClijmnYINtV2PrG5xfn5L2/q
	GBY9ZY1QD6nx7sPBHChFBzT228l6JAco=
X-Gm-Gg: Acq92OFnIRxvzF8L+QRKTNNggzj/RZeqOlfwFths5d8DYevs5W7zM62yS9085ajPBb3
	crzdW6EqXx9O2qzbSzxZADO/34M+JCmdmxmkh6Oo9mBesuuIQoJq46k4AoGGjveKdJ+gmt9f3ft
	Ru4jhu6X8/k9IFHwoTY9Mw1A/S9DAGcP3NSZa1FzPSljDf6dOIj7G8bMB7w/ftN+M5VsDYj1Xrr
	l5sZUNbIltSXplxNuZd6PKA/v0c8iFAMyFQjFAAHhGMrZsIj1Ibzb4DsXL8dq33/q/2eR4mHtBV
	Cace7Rm+
X-Received: by 2002:a05:7300:fb83:b0:2ed:ff78:2c12 with SMTP id
 5a478bee46e88-303986b7f00mr1545456eec.34.1778834265492; Fri, 15 May 2026
 01:37:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511135703.62470-6-clamor95@gmail.com>
 <20260515-utopian-malamute-of-patience-367e8e@quoll>
In-Reply-To: <20260515-utopian-malamute-of-patience-367e8e@quoll>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 15 May 2026 11:37:34 +0300
X-Gm-Features: AVHnY4LfeFEmg-csCdRMVtN73Y-dqI06XuWSB80BMJnQTmRPDx1qbsh-tCMg8j0
Message-ID: <CAPVz0n2wrAdU0JKx7eb7uosCcoGayqNchK591VPph-5_nBAMXg@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] dt-bindings: phy: tegra: Document Nvidia Tegra
 XMM6260 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@kernel.org>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 15 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:2=
0 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, May 11, 2026 at 04:57:00PM +0300, Svyatoslav Ryhel wrote:
> > Document the XMM6260 PHY used by various devices based on the Nvidia Te=
gra
> > SoC, describing its usage
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/phy/nvidia,tegra-xmm6260.yaml    | 58 +++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra-=
xmm6260.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260=
.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml
> > new file mode 100644
> > index 000000000000..0346433c9772
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/nvidia,tegra-xmm6260.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nvidia Tegra PHY for XMM6260 modem
>
> XMM6260 is Infineon modem, so any combination with nvidia,tegra is very
> confusing.
>

May you please suggest how to adjust the name then? Thank you.

> > +
> > +description:
> > +  A hardware configuration used in Tegra SoCs to provide proper intera=
ction
> > +  between the application processor and the modem, as well as control =
over
> > +  one of the SoC's USB lines for the modem.
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: nvidia,tegra-xmm6260
>
> Also here.
>
> What sort of phy is this? So far looks more like a software construct.
>

Infineon XMM6260 does not work as an ordinary USB modem, it is a
standalone CPU which just exposes itself to AP via USB. In order to do
so, it has to have control over a USB bus of AP which is dedicated to
it. In case of Tegra - XMM6260 interaction it looks like this: second
Tegra USB controller is set into HSIC mode and is dedicated solely to
the modem, modem controls this USB bus. Then the main XMM6260 driver
performs power and init sequence and once it is ready it calls phy to
register controller. Phy has its own supply, controls USB controller
de/register and using enable GPIO sends signal to modem to proceed.
Additionally, since some XMM626 versions have a few steps to setup
exposing different USB devices, phy handles controller reinit for each
step. If treat XMM6260 as an simple USB modem it will never init.

One more benefit of having PHY is that modem driver itself is generic
and PHY handles SoC specific configurations required by the modem.
Since this modem was used on a variety of different SoC's (Exynos and
OMAP for example) they can reuse modem's driver and provide only PHY
which handles modem interactions with the USB bus.

> Best regards,
> Krzysztof
>
