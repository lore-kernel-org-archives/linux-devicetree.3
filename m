Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D7346DFFC
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 15:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929831; cv=none; b=c4WkhlSMezyqHlqWpfhQZ+r1/SmVY11xnjvmhXxMXafQwAQxhZRrlxNCbv60G1D1l245pW6B7gIwrUl8S0FhhK52ytvssRzy4t0R50U8j02QUsgsik/zz26qbXFFDgLdPb3YLzsw9/cP2PVn8S+ublWWYV2ui8coFXkz1tURKmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929831; c=relaxed/simple;
	bh=UHB5wAimB0XLgtMDONPlKEO/c6uNKd9LGTJakW60IhY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JjBNYmnfYOKs+36es/DVLYBbnB8wq6Xf6ZbG6CL1iCp33cr5Ebt1wu/HuYfn2GPZPlgsf4K2diTfS13O713cWnv62GDGxrzbvzmDK0Bz+jg5xjdxQWGI6nlkTJjJ2EnjKivL7dmYiT/7sSYY71eDfNXGCUl4QfVSeZyzu5UJizs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QVP5wsum; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QVP5wsum"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEB01F000E9;
	Fri, 28 Aug 2026 15:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787929829;
	bh=U7BpeMG4DAiZ1JfdFeVrqrAjEeetIuHNyrczQhmfPX4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QVP5wsumoltpyZyaLcDJPKtTjElSx1XWQmxgiPueCqniewjJtNwgpXx+FtqMc/mqv
	 H7omwjB1lX8DGS0QZtP1iClamotk6sNqxYzyKyJx+0Zf0s2K2ECjFQSiJwIXHMbHsY
	 lzuLysMkIhdTMNzUKywWB2BdnVsurOaxSOodCVIcpnsjlCm65c2YBPZpBd65E2Q57h
	 hMWrsAZ9lcuyE6Fzgr1XOVB6U12YNfe+iATKArfSHJ/PyAdpxWNX3wE9lzx6/PzP9Q
	 UEz9mzDj/PE4aGBS1zdZZbfV+1CDhSSLyOn9r61r/ZXePQgf3WmO/ee+UWAuqdsmXv
	 xIXnWoeApwZMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: generic-ehci: Document ST
 STM32MP1 SoC compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260828150245.173147-1-marex@nabladev.com>
References: <20260828150245.173147-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 15:10:29 +0000
Message-Id: <20260828151029.8DEB01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Alphabetical ordering violation in compatible strings list.
--

commit 02866cad5ea0e6cf3b7ff32996fc2ff6f326adb3
Author: Marek Vasut <marex@nabladev.com>

dt-bindings: usb: generic-ehci: Document ST STM32MP1 SoC compatibles

This commit adds SoC-specific compatible strings for the ST STM32MP13xx and
STM32MP15xx series to the generic-ehci device tree binding. This allows for
more accurate compatible matching in the SoC DTSI files.

> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Do=
cumentation/devicetree/bindings/usb/generic-ehci.yaml
> index 55a5aa7d7a54e..408f9860d8079 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -54,6 +54,8 @@ properties:
>                - qca,ar7100-ehci
>                - rockchip,rk3588-ehci
>                - snps,hsdk-v1.0-ehci
> +              - st,stm32mp13-ehci
> +              - st,stm32mp15-ehci
>                - socionext,uniphier-ehci

[Severity: Low]
This isn't a bug, but should these compatible strings be sorted
alphabetically? Since st comes after socionext, it looks like the st,stm32
compatibles should be placed after the socionext,uniphier-ehci entry to
maintain the standard alphabetical ordering.

>            - const: generic-ehci
>        - items:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828150245.1731=
47-1-marex@nabladev.com?part=3D1
