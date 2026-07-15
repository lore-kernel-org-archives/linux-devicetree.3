Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC04A346E72
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103485; cv=pass; b=b2Y/oghDFrVIRiL2Plw0Nh41PSO0HvC6h/IRv9rBZFdJwEbwBiYJDRCdjx+hGAKWzouyr8Rht4GvTfRc1sw15XUYWWuZL7FdcyLC0kmKm/yQ1IU2AfhbQGWBf3Z1HO/JFR9RBN3qMXdbnZld7uaMGl3uNqbeWOk81v8uBiF5V2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103485; c=relaxed/simple;
	bh=AP6gF0tEjEv/vMctSCH8Yuu5/FqIiEEb+sjajbQSp+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nXuLSGxsQWd4ljcnMV+05b6e7+fPYJTrJJYghsTwH/m8SjyeNDBGPl69wu/4D5KBtaOJ2KhPRf/UiZYSMBM7gU2ZR0BpuB3Hpnjg/277kWKN3zYu3G9b4qL7jIvj0ZpavXRGmRofAwv/psd/0SpkVC5JBzzoadbfkjjhI35UReA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixkHnIqc; arc=pass smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixkHnIqc"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-c15c42a45adso61580166b.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784103482; cv=none;
        d=google.com; s=arc-20260327;
        b=DzUja9iVb3xB2Po5kKfE97iv5C42ZHnZCvDODiZYGWcUYTt6Dljy9JSyRYsqM5Jg79
         PNHaW7cfoJJMwB40wxF6v7UaqktpUM9nh4GgKTBwmLrevDxeUwDG8WOr393+44UigfzY
         GwmTf5PHpgKsSxTNbIBTRTC4QUxOD3Y6VZsdz5REdIJ/CXsHclnlSCCekLa6xnH/W8M7
         gEH4RxSbYBQf7DA/UYKlkVBkSrxFKAoGLZnUoGFrZHMcGgi5SHBO96BwaJ50Ov4nhoKZ
         14f/hmrMK9eBbXAjUpLnRbvsgU+nyJhvmMJ5jSea98dBs6bt+h4HRX0FZsowhLMMZ6jx
         Z2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D1M03uqUJX0kuAkqVXmzpq08Mjp3bxAKOr4K6xCx7KU=;
        fh=jMQKC0N6Urngq4+cP9f4D2ZwShrJ8ZZJr454JJ+4HWc=;
        b=rBAvM+vsEOWKazC/EgskWGwVs6VJ0ZfD/ETlk+Bhb3Fp+pH8UfrxeaVVvGY5XGPo4L
         sdxZaXYzxI625PE729B/MDiIqxcWXtZcDFtlnN/rDtcuZSav7oc1l5QZvDjMuaqBsiHm
         4LzpZ6ZI0SKOVL2/UL/KHjho0kPNCzYyaF42iDjQSHdbLDYnD0qeVf+9+AdT+2MjyNXn
         VFeU0EtQRNP1LwmyRL+Qo07f5NRNolu52BiGLJuYjPWwBDaFtHWJmZd+TTtGQVnvu3hz
         y0+icWX9JkdUyksFKcfKr4rlB7W8LsH/DtFaFlyTDbeRGffIa4Xa3j35mlxLyo7aIxkR
         6mrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784103482; x=1784708282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D1M03uqUJX0kuAkqVXmzpq08Mjp3bxAKOr4K6xCx7KU=;
        b=ixkHnIqcIHKkcsgc7Yk3FexgizJtkGwBlxTTvXB7H5WsFVIntZK+kzg0ivhXfaSL0D
         3XXB2sIf+47x4UsWkHVe27yjWHqmlKpcIVov19iJTn5ZrL8qlWR2Hjo0R0nH8VnbCw+u
         T9bK0M8O4bXdt1aOV5/qD3bWjCGxwC0eVwMWPqoa1pL22hQ/LV0OEJbXud70TTD8Ksyw
         tX2PFARJGI2aaGnQXyVjF4pZLKK10b1NEmncVoKYHwqkONaSxoDgNlQljDmYg2w1LTAx
         2isEWIx8UxbaBN1UalyI6YZL7WKBr+bo1ob5nkKvUHzmx044pH5NGgkeqfAhxpJGVLri
         SZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784103482; x=1784708282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D1M03uqUJX0kuAkqVXmzpq08Mjp3bxAKOr4K6xCx7KU=;
        b=Nr826MTcrhPQq5PqnMVDIn+1RIIFhZVgMJxYLQCwAFIIfPT+wZIvFDUdc309UlLI6F
         Xy9+axG++K+ycKgsAg0uVU2p8bi0S7NLxTBOqUmiEfS9qdsxjL56J/tQ9CpApmWf8ZND
         KoZ9QN7OSmNWJwkrlUP1dW6BfA/RDMXfbV3iVH3bqzaorjMk/CNjkwJUtPM+EeISepUW
         LALuhc4KQi1jevSkNCFN3PJM7nMA1gl6yjGMzWAh96JRizTRs1HTZFEwxoyFRUJyxUJw
         aSM3VEOP+v9ckKfHGE5rBAfLtCG+h/Hpp3bFuCABgJMQ2UmmZ3M0Xz6fkFETZ+7XplqC
         +9Hw==
X-Forwarded-Encrypted: i=1; AHgh+Rqe9sGmk2rHyRmR/LvFvaliJkz/UUwc9SZwwPvStEhp6mwe2XCNFO+RJIrTQbJcFgBU4/x17bhHqTSm@vger.kernel.org
X-Gm-Message-State: AOJu0YxcYMaIfRXJvJUhzX/32lS8VUpe11Adt+Ssvp8MJmPoXgQjI/gn
	EJqlZ1K+E4tg7AsRBQVCCDmAOBQa9WOwEPw9kKqgK0aM54RQN4Enec0dkHyg+dyNuBmj9ldSYwH
	84RpNy20cixrlKQtxQS/pAZibyn14Y8Y=
X-Gm-Gg: AfdE7cnrY7YRfRiZxIBEKiOH5whNecLYj5faDLxx0RpzT4dnpbTbpN9Y03o0Z7FsBPU
	GxAF63NIkCAklBXjZo4uXIRSgsZpGe9/lfNI3FPMXmFkGROM6fgRSRI8f7aFhC5vufd4blC2Ivb
	557OePFn5ZIpyea0zEW9ykcBywrIEF+3CVIOY8A0i+BWdbjFZnuIou6c9tTNgF37Qs08dCjm3GM
	Mbj/wyZ1C8bc7OET8ephJSjvxmWTG1WwRGarOLrLeZsFxNBfv8GM17JOI5DOEfhg+FGcJODGklO
	yNO2zHhWVzQ=
X-Received: by 2002:a17:907:d587:b0:c12:58c0:db2 with SMTP id
 a640c23a62f3a-c15fe781907mr1024570366b.18.1784103481564; Wed, 15 Jul 2026
 01:18:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-2-coiaprant@gmail.com>
 <dc21b2fc-ae11-4fde-a5b9-09e2c6bee5c9@bootlin.com>
In-Reply-To: <dc21b2fc-ae11-4fde-a5b9-09e2c6bee5c9@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 15 Jul 2026 16:17:50 +0800
X-Gm-Features: AUfX_mxch48mUromtsSVd92z4I08mky6NZMzT4EVIwR-2P4_-bFyj_YHpBs-rv8
Message-ID: <CALj3r0gWyfHHp0S4=71M1-TjgHKcgGax4Lr0DzPi37Q69-iCwA@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] net: stmmac: move XPCS lifetime management to
 platform drivers
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, robh@kernel.org, krzk+dt@kernel.org, 
	heiko@sntech.de, netdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, Christian Marangi <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B47=
=E6=9C=8815=E6=97=A5=E5=91=A8=E4=B8=89 15:31=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> +Christian
>
> On 7/14/26 21:08, Coia Prant wrote:
> > The current XPCS creation logic in stmmac_pcs_setup() is problematic
> > for several reasons.
> >
> > First, if a device tree specifies a "pcs-handle" but no select_pcs()
> > callback is provided by the platform driver, the created XPCS is never
> > used. The phylink framework requires select_pcs() to actually return
> > the PCS to the core, so the pcs-handle property becomes effectively
> > useless without the matching callback. This is confusing for developers
> > who expect that specifying a pcs-handle in their device tree should be
> > sufficient to enable the PCS.
>
> I think Christian's work on fwnode PCS would help a lot with that PCS
> handling in stmmac:
>
> https://lore.kernel.org/netdev/20260618125752.1223-1-ansuelsmth@gmail.com=
/
>
> I don't know when Christian plans to iterate, it could be worth using
> that new fwnode mechanism here ?
>
> Maxime

Hi Maxime,

Thanks for pointing me to Christian's work. This looks like a
much-needed improvement.

I actually spent all night debugging call traces caused by the current
stmmac PCS lifetime management, and it was not a pleasant experience.
The code feels like accumulated technical debt that should be cleaned
up.

Regarding timeline: since Christian's series is still in RFC with an
uncertain merge date, I'd prefer to keep this series as-is for now, as
it solves the problem for Rockchip and has already started receiving
review feedback. Once Christian's fwnode PCS work lands in net-next,
I'm happy to rebase and convert the Rockchip glue driver to the new
interface.

One thing I'd really like to see: the ability to specify the logical
MII port instance via something like:

    pcs-handle =3D <&pcs MII_PortX>;

That would make the DT binding much cleaner and more flexible for
multi-port configurations.

Thanks,
Coia
