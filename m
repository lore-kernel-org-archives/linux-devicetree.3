Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A704BEE38
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766130; cv=none; b=PZ7Q1cX9UaFvuul5LDfphgVFvDUyTZzAdQBOEfOVJ3O4AHB7KTW6Qxj5w22xzo3D7WOFvSvQt3igH4FVZFy+AyRvw+nfOk4Wm/3g1gC+40fyVn8J7HYlu65fZ+SbCTd0eKE6deVDBttJKbPzIbwAa6pbMXsviK+NpXhv9inAKhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766130; c=relaxed/simple;
	bh=2xX4TGIby4W1lED2iYrPcbVUgLcR8bA1rRp0/n6MmwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtlGqDNhRuMU7R9u334wuWUkZm1z9oguZl1XZZCmR5tGJue40iEbc9dNNwQA8906tAWXGs0ta+ngM/Ej7H1TWgxDJO5uvmUvtZ39MfNCstZlQ16179wEVAcfiFEjl8tSIfsbZJ9rs9yqsSZ5kK+EdAam9JSAg9zpO0edYTVUNaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxsQmaiE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxsQmaiE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70191F0089F
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790766120;
	bh=wM8W3udRuQDxIq2R1VNl0FNo7Tqwd3aCD0aaYmlp5nI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SxsQmaiE8bMHn80+76krI/+rDRJyVNbtXQvfjM8bKzgFUZzlX8uZWyJUc1HGVHcpk
	 NKXNYqek4ZfoD2ATyhnwJgnqBmBObWZtv0DX7FenDkiKI+zGfYChfikKOgZf4RowE6
	 PIopWY/km4MUSmATa4fC4Yvmz4EacBI8bFo0fyQPB82w15Ow6VD8uJmD+pv9GQYHvF
	 JkEMu916tk7toLxZtX1LKi+5/BZI9rClR6aFohbRoSshTQ10gZO1/0SCJ2GQiQgRkE
	 TrDtuYSmlfo6TSiac620irkQYyOxLCm0erLfuqEdDXz41VhDH3SuuJCpkRjawnRWug
	 Cs0P5wmKM7Xrg==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a773bdf720so4557321fa.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:02:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx6QjU4ZQh8G9yMzublxnm64artdSW72pag5cv+KIFAjqQTMH2gAE+p1i+9q3KPw5bFa9kZFuNVohR/@vger.kernel.org
X-Gm-Message-State: AFq9FYL6Uj0S+bTfuyiEb6L8yz8lPCa9Q8CSE86vrfaIh0sGDlxuQujd
	ohW8oEQEQJyjeubCchHuCoC4DTSv5cgZ2/toSfWJke6QlSTA26sUcZh5L58amcV1ARzQKyz0tpd
	8REOS3E/hlkAyI2yVO7yqHIhWe6NhqkU=
X-Received: by 2002:a2e:be86:0:b0:3a6:772c:2763 with SMTP id
 38308e7fff4ca-3a777d41008mr3400901fa.0.1790766119222; Wed, 30 Sep 2026
 04:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-4-4617c4463529@gmail.com> <65c87e07-1722-44c2-9a08-ed9e18902058@kernel.org>
 <179076583795.3054628.14443934429806440798@gmail.com>
In-Reply-To: <179076583795.3054628.14443934429806440798@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 13:01:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLnZBpoF3H3-sqzmrtwzxLGombFMdSYMVo59jiGFYcyCFA@mail.gmail.com>
X-Gm-Features: AclHuK_ChPvqXpZcBtgi1ur23GoXeg-9LEYM9g162V4LxDv3fyrrqjh1iIDXE7U
Message-ID: <CAD++jLnZBpoF3H3-sqzmrtwzxLGombFMdSYMVo59jiGFYcyCFA@mail.gmail.com>
Subject: Re: [PATCH RFC 04/10] ARM: cortina: Add support for the CS75xx SoC family
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 12:57=E2=80=AFPM Fil Dunsky <filipp.dunsky@gmail.co=
m> wrote:
> On 30/09/2026 12:20, Krzysztof Kozlowski wrote:

> > How is it different from Cortina Gemini?
>
> Apart from the vendor, they have little in common. Gemini (SL3516/
> CS3516) is a single ARMv4 FA526 with Faraday peripherals (FTINTC010,
> FTTMR010, FTGPIO010, a 16550 UART) and builds for ARCH_MULTI_V4. The
> CS75xx ("Goldengate G2") is an ARMv7 dual Cortex-A9 MPCore with GIC,
> SCU, TWD/global timer and a PL310, and its UART, GPIO, interrupt
> controller and NAND controller are different blocks from the Gemini
> ones. So it cannot share mach-gemini or its drivers.
>
> >> +machine-$(CONFIG_ARCH_CORTINA_CS75XX)       +=3D cortina
> >
> > Arch should be rather per entire family, not one SoC.
>
> CS75xx is meant as the family (the vendor kernel covers the CS7522 and
> CS7542 with one ARCH_GOLDENGATE), but I see the name reads like a
> single part. Following Linus' suggestion of mach-goldengate, v2 will
> use ARCH_GOLDENGATE and arch/arm/mach-goldengate for the whole family.

Put the rationale into the commit message, that's exactly what we want to
see in there.

Thanks!
Linus Walleij
