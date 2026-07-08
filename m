Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DC4381B1A
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 22:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783549992; cv=none; b=uMLOoGMyJk0hg9yGxhoj3fW6lSYwph09gv8hDKuj7skDbrHaejDre5wmYe/+MpUW+o/3yjB9Z7SE6ON85oIbGu9WUi1llmqFTzrziXoap8R/nb2uXSF9n7tBIpIhIgYN2gsClu+0b150qdLby7EZ8aYBt+AaPff441838aO2EL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783549992; c=relaxed/simple;
	bh=P7vzBDvGm/HcaxWKz2oF9lIdrADGC0i0CPOOdOzsIDk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JaqZ46lh6od6lXHOcrB4uOiSqUKEGlmA0iXpU4dBo1OAQg2VBcBwFHckKKPJ1I8uXAEowlM/KvIM0UL5oONowIQcYiXxxVKIJrDXT3ib+XreIuNfsPfp8iWwBK7hcYEIdQCxipn+RtLEm7tjdfcqJ5Ts2yriL6zNiKIh4BbWbLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ei/IsX/I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ei/IsX/I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F431F000E9;
	Wed,  8 Jul 2026 22:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783549990;
	bh=Bvn1HGey3eWhbHljdgfpRPndgCEsrPX3YvJ7zfv23Xo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ei/IsX/IVIblShuo77JReqLuAcGT2rTOBumussCxARgHcQ7qSwP/1HjJz+Cku4PJT
	 ezHU5upz0c+MxZ241TMkZskTow6xyfygXeoGLCD/6tEgiwkvHBQ226MxkXbvNgg/YE
	 vcfOPo2XWNO6qt1X5IKhFJeS4Z77P3CW2pMngttKwkBpzoUpeIJWTUEBNHdyLXmG4I
	 2F4bzWYqymJunp+joeq+qHXo4cB9v6c5+5Cx2PMEdq5vigDwdPz5naCklemsQLkI3F
	 YPWtLNide7jzaX9vH8vLhrpe88l9Rr65LTVS3iHfktPKa4zJLWjjdAZ7vJtAb3wqTb
	 TceH2xfN+cGfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: ixp4xx: Drop the reg-offset hack
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709-ixp4xx-little-endian-v1-3-e9622d0ba9e4@kernel.org>
References: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
 <20260709-ixp4xx-little-endian-v1-3-e9622d0ba9e4@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 22:33:09 +0000
Message-Id: <20260708223310.71F431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Removing `reg-offset =3D <3>` without a driver workaround or `reg-=
io-width =3D <4>` breaks big-endian serial consoles on IXP4xx.
--

--- Patch [3]: [PATCH 3/3] ARM: dts: ixp4xx: Drop the reg-offset hack ---
commit 441a4bee18082ddbc2bc878dd7fd00a516e2cc30
Author: Linus Walleij <linusw@kernel.org>

ARM: dts: ixp4xx: Drop the reg-offset hack

This commit removes the reg-offset =3D <3> property from the UART nodes in =
the
IXP4xx device tree. The commit message notes that this was a hack for big
endian support and that such workarounds should be handled in the drivers.

> diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi b/arch/arm/boo=
t/dts/intel/ixp/intel-ixp4xx.dtsi
> index 0adeccabd4fef..b0f98da8def47 100644
> --- a/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
> +++ b/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
> @@ -84,11 +84,6 @@ pci@c0000000 {
>  		uart0: serial@c8000000 {
>  			compatible =3D "intel,xscale-uart";
>  			reg =3D <0xc8000000 0x1000>;
> -			/*
> -			 * The reg-offset and reg-shift is a side effect
> -			 * of running the platform in big endian mode.
> -			 */
> -			reg-offset =3D <3>;

[Severity: High]
Does removing this break big-endian serial consoles on IXP4xx?

Without reg-offset =3D <3> or a replacement like reg-io-width =3D <4>, the =
8250
UART driver will default to 8-bit memory access at offset 0. On big endian
systems, this reads from the wrong byte lane, resulting in invalid data and
loss of the serial console.

Is the driver workaround mentioned in the commit message already in place to
handle this?

>  			reg-shift =3D <2>;
>  			interrupts =3D <15 IRQ_TYPE_LEVEL_HIGH>;
>  			clock-frequency =3D <14745600>;
> @@ -98,11 +93,6 @@ uart0: serial@c8000000 {
>  		uart1: serial@c8001000 {
>  			compatible =3D "intel,xscale-uart";
>  			reg =3D <0xc8001000 0x1000>;
> -			/*
> -			 * The reg-offset and reg-shift is a side effect
> -			 * of running the platform in big endian mode.
> -			 */
> -			reg-offset =3D <3>;

[Severity: High]
Similarly for uart1, will this cause a regression on big endian configurati=
ons
if the driver side doesn't already compensate for the missing offset?

>  			reg-shift =3D <2>;
>  			interrupts =3D <13 IRQ_TYPE_LEVEL_HIGH>;
>  			clock-frequency =3D <14745600>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-ixp4xx-lit=
tle-endian-v1-0-e9622d0ba9e4@kernel.org?part=3D3
