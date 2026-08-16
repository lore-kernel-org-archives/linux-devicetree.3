Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BDD23EA97
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 21:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786916801; cv=none; b=Xa55lv8N8UtV/bXbpv0jiR+9pNrWz9ujGogZur/og9pHXl+uji3ywckHaVsm517MaORKtoyCtCspDhEcGJcv+sPgTvjZUl9bXyibJKvKKNxe/a+nNm9ko5b3NEzdV66ANpcgC1B5VHzlRnczAfOvViVVS8BE7NTnhANvHBN0RrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786916801; c=relaxed/simple;
	bh=CV4uOETHhhb03EOryVR3FhReJ5AGTOB2c4vkxupZRYQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OR5L/VdCVcQqkYO54rfhBHpVXXyz3uQ4d4SK2GUZGE7RYJhAQMrue39jyGA56TKXmUcGjWSAdZxI8Wbqi/GvcbCdpvp1d9nxiOXfT/fWEMvpJ4Aa8dgBqiz7zxOEw5URsMjpOJF1Y98iuv2DtL+k83iNZfJA+khiZPOEUMwnipk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jvSeApKp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvSeApKp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1B11F000E9;
	Sun, 16 Aug 2026 21:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786916799;
	bh=N1yPng0hDUiR0SYCoB7hfu/loI16gFAg/z2Zkiq8RGY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jvSeApKpdgr/B1x+f2KQwFW9XHMjsFNjDyFvrgRJRu9iKqalnp2pqb0niE8SmUwfq
	 AZjAgXGxMvTkftThE4ig4AVSFxxR6Mjq+ktBAC3vDrfqE4ljtXjYqCAlAblbLF8XXI
	 M0UJf8bsJSXXw/qHUTXjTNG8+xpGCMr8Lggii7GfAMBmjkKWmYURi3ifQvqRB9Rx/9
	 Ul3Mo0GOvv+2dayOS4PnREPbFRY+5U1TJNXG0OhwMcz3fA1RyGj+xeEU4dNoXYEQ78
	 njlxhFjFOmoG1u7goB65acegX/BaAFopJ4o8opqmvbrwEzw4dne3T2e0SifLxTcb8s
	 obHirD03SNHZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/9] dt-bindings: usb: generic-ehci: Document
 access-controllers property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: olteanv@gmail.com, robh@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260816213849.1044073-4-marex@nabladev.com>
References: <20260816213849.1044073-1-marex@nabladev.com>
 <20260816213849.1044073-4-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 21:46:38 +0000
Message-Id: <20260816214639.4A1B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch adds the `access-controllers` property to `generic-ehc=
i.yaml` but fails to update the companion `generic-ohci.yaml` binding schem=
a.
--

--- Patch [3]: [PATCH v2 3/9] dt-bindings: usb: generic-ehci: Document acce=
ss-controllers property ---
commit 53582485218bdac0220f3acaf5124a6d9549f7b3
Author: Marek Vasut <marex@nabladev.com>

dt-bindings: usb: generic-ehci: Document access-controllers property

This commit updates the generic EHCI device tree binding to document the
access-controllers property for controllers that require access checks.

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

[Severity: Medium]
Should Documentation/devicetree/bindings/usb/generic-ohci.yaml also be
updated symmetrically?

When access-controllers are configured for the companion OHCI controller
in the device tree (such as on STMicroelectronics SoCs where EHCI and OHCI
operate as firewalled companions), wouldn't the dt_binding_check validation
fail since generic-ohci.yaml enforces unevaluatedProperties: false?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816213849.1044=
073-1-marex@nabladev.com?part=3D3
