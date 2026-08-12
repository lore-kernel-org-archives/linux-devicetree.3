Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CA03624C9
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 01:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786497055; cv=none; b=Q6utRyo97TzXoMyUYPrHeKjUOPkfgzULcguLz91+CUf7U5Et6vxYG18/+uVtT//7d/GvSzD0rVO9fftpGXrURArHNBxrkDiWLQSN7Q1rECXBTjqVhQxQ2GGUKC159ZGxZRGZwiaUDrn0DC57LZZRVkC9wdk5po0SGERR4XrRqag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786497055; c=relaxed/simple;
	bh=DBSFXZV1NnfDOqmpFuE4PsquU8uwaOy2G1EU3yfUZxI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kVZhhkbczPiePj9YdADiO2etjQPx3nFrhEH++EO3L0lhj8ziEsIf0eaFe2yPcCG7a+VWoH+9kbNlvFHNe/xmtxXcy+lzQc3LzH2wrOl8jOIRu7koWPf/u1GjKy1ZQH/1ZChaEzIm1e+Da7EjTZEoKZbDGnZajyceShg29FRvNwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUM3dLH6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUM3dLH6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7259F1F000E9;
	Wed, 12 Aug 2026 01:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786497053;
	bh=ra0t7egHfjaRM3h7bxPvs/uNuD6LIUc6DQWFIVlgVto=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KUM3dLH6kFO/HmVNpOXM3bZchQtpiKp/R4G1VTqNS4rAoehKVumpLA22SkfudTcg+
	 mvytZiV3Fcb+GEHj7hDf2xwvezhHLrcn+kh3KUF4vr+yQafospqrla+31j3V1SqIDO
	 tCTuRdqTkH/Q9ondPMoGaMwbPvl1M7M081tRWTrP/KeMHPjHE+eYzAzsjW6H1YB8c4
	 /8w5A9Yh0pR/5ufsUp8A65byscD6WtO1kn03ke9DLIgKcSJ/uGK1eQ3+vNJqUzhdV0
	 Imb+GOrhq6Kj/3DA+kAlKJBCVKQTsY+DRdznt1GvbgrDWzdTCw54cWVa9oottZ4aK+
	 6/QMfe5wHuMWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] dt-bindings: usb: generic-ehci: Document
 access-controllers property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260812010157.1772849-4-marex@nabladev.com>
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-4-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 01:10:53 +0000
Message-Id: <20260812011053.7259F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incomplete schema update: `access-controllers` is added to EHCI but=
 omitted from the companion OHCI binding.
--

--- Patch [3]: [PATCH 3/8] dt-bindings: usb: generic-ehci: Document access-=
controllers property ---
commit 5a4a63ad96f05ab82966f723bbb1698bcfb4356a
Author: Marek Vasut <marex@nabladev.com>

dt-bindings: usb: generic-ehci: Document access-controllers property

This commit adds the access-controllers property to the generic EHCI USB
controller device tree binding schema. This allows access checks to be
documented for these controllers.

> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Do=
cumentation/devicetree/bindings/usb/generic-ehci.yaml
> index 55a5aa7d7a54e..602241887d995 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -80,6 +80,9 @@ properties:
>      minItems: 1
>      maxItems: 2
> =20
> +  access-controllers:
> +    maxItems: 1
> +

[Severity: Low]
Does this property also need to be added to the generic OHCI binding
(generic-ohci.yaml) or a common schema like usb-hcd.yaml?

If a device tree configures both an EHCI controller and its companion OHCI
controller behind an access controller, the OHCI node might fail
dt_binding_check validation because generic-ohci.yaml enforces
unevaluatedProperties: false.

>    dma-coherent: true

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812010157.1772=
849-1-marex@nabladev.com?part=3D3
