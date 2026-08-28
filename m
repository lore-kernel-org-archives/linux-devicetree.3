Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3AF357CEB
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930771; cv=none; b=oQIh14OC/un7Y8hJskaMNDMM4b1odSfJrIXbyhv0ERrfLJ03co1uwm/btexsOwN4xufAEjRwmKfncp6HKLuQ5uQ+9auZNI2psvLjaYdxpzYYPm7l1FC7UNr9qZ30GJzSzYr+bML5wlZ479v+TzUScI+7xjUsk96UiOct4MTUzSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930771; c=relaxed/simple;
	bh=wVvpv1TNCDYG36Lp1/MLiCItxJeYm55M/vEaIoXOLCc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s3ZeEihmg/o0Kjr1LZ/r8eMPEW3T74euA4g3FuiFwcMi3PvpHMT3vaATIlgiHZKFbiu+uQ/ItaM6sk4WPY+x+EcjhVcz1nx4ZKp3GKz/BsfXBiUe1J+28vU2NTN4Ay69LSCmsri03VdfO4P38RSjDLM3brA8exT1FWCJLPzz+fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AfGlazCz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AfGlazCz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B271F00A3D;
	Fri, 28 Aug 2026 15:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787930767;
	bh=+peKumwtJxTgcRLtb0shekQTZ9ay35W4Tc8sb5MP//g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AfGlazCzQHPPh+GrAKz2mvRRSKplTs9KgfUWWxy0ATqpJAq1NEl6LOMvz/LBKBPkA
	 33YcB/Bl8NGwMwTvaEw4UJPW2OcVR2kyYPj3XBlvbV/PBgaI+S5nz70n6UI/bGAi3i
	 oSdZtd4lDk7AR23eLMg1KYhctAIA81rjYq6BM24J+hLOcBA2oCW3iOWS69B8gfz1Ij
	 q/pxjQVzyHTW1RC8qBGelf9vL86rXfivoUXaYfwdfPidEwgqhATpiPIwST88FECo2M
	 86WdeQT6tl/deA9AjJpIOSseLQhdFtDf1q/X4j9XHp77H9jSmTSKG6j7EktrlWB7HE
	 e/J3o5GzC5v2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: generic-ehci: Document ST
 STM32MP1 SoC compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260828152130.176171-1-marex@nabladev.com>
References: <20260828152130.176171-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 15:26:06 +0000
Message-Id: <20260828152606.B0B271F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete binding update: missing matching SoC compatibles for =
OHCI
--

commit 7095875c29b62fc4da25d15360437f36863e8a6a
Author: Marek Vasut <marex@nabladev.com>

dt-bindings: usb: generic-ehci: Document ST STM32MP1 SoC compatibles

This commit documents SoC-specific compatibles for the ST STM32MP13xx and
STM32MP15xx series in the generic-ehci binding. This provides a more
accurate compatible string for the SoC DTSI than the plain "generic-ehci"
fallback.

> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Do=
cumentation/devicetree/bindings/usb/generic-ehci.yaml
> index 55a5aa7d7a54e..a88aa1e1ee59c 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -55,6 +55,8 @@ properties:
>                - rockchip,rk3588-ehci
>                - snps,hsdk-v1.0-ehci
>                - socionext,uniphier-ehci
> +              - st,stm32mp13-ehci
> +              - st,stm32mp15-ehci
>            - const: generic-ehci

[Severity: Medium]
Since the STM32MP13xx and STM32MP15xx hardware includes both EHCI and OHCI
controllers in a companion setup, should a matching update be made to
Documentation/devicetree/bindings/usb/generic-ohci.yaml?

Currently, generic-ohci.yaml has an equivalent list of SoC-specific OHCI
compatibles:

              - ingenic,jz4740-ohci
              - rockchip,rk3588-ohci
              - snps,hsdk-v1.0-ohci
          - const: generic-ohci

Without adding the corresponding ST compatible strings to generic-ohci.yaml,
the OHCI controller remains documented only as "generic-ohci", which leaves
it not future proof in the same way generic-ehci was prior to this change.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828152130.1761=
71-1-marex@nabladev.com?part=3D1
