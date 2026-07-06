Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528CF3DDB19
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 20:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783369102; cv=none; b=tuYv6C9H0ypUuetnL/v5G2mluxwwMZV71swEgWjDQVff+/I8xcHPsGvJLkl4keVnE8Br1gFkHgItfhIvDC2QElFBnkMvNDbBgNQy5BUY6xo3D+F7XmE2rCEgjWDmQ97GUdo8GirGndqVLUNzm7xuA3qDzQp9nb2aSwAAlEKrFjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783369102; c=relaxed/simple;
	bh=c7ZuzdeHMvyi8BEq22sPzoWr345HEHk+ilHZyj2nipk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bCRJTORnKRIEk5M7Og4dKOrJbLxlNCn7gP1fMrH2JbCRP/Sqa488ezQGHrgQWRUSdmjS+eOzFVDu8gkyJjIrcbitWrdIMCulXvHCI2VmHbD5oalxF0mMvwgcoWcj+QixgqVtImeQoG8PZVrJc4YKGw8IAFGTJal7MEvyPVsncYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVeEkr4J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVeEkr4J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ECDC1F000E9;
	Mon,  6 Jul 2026 20:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783369101;
	bh=tKnpfMo5NOrnBk7eOKxpP5Sf6s+hmBQryO31cg8e4RY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eVeEkr4J/IrUditXY4wml+11Qx2baFg/7v+mJbNGECaKYD2i6vjqj+VQFyANNbRDa
	 Bhz4Kub237JW7oezCviujPK3akxx7sqc7th5vFfpl/uSlFUhc3gXq3LCU+uhT7hJ/5
	 skyEyN1RVkhkZV5VO6sH1bSbnVxZyfMZee4fMAASaUhqxow33nHw9vyuYnFK+Cgu85
	 zGdVff1d14wKULwAWpdXIFDx97g+1n1Xerg3jpYVNlHCSXgHoLfzqJiikQ/70fqRlM
	 gZ9SqdhCRB9mR1cS+HUhaGtYAGY9IcyMSLBErUM07EvFGc+/J2R6hKRFSE1bTcGfeo
	 siB1nljT8u5WA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/12] dt-bindings: arm: rockchip: Add Luckfox Pico Mini
 B
Reply-To: sashiko-reviews@lists.linux.dev
To: "Simon Glass" <sjg@chromium.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260706195818.3906949-12-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
 <20260706195818.3906949-12-sjg@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 20:18:19 +0000
Message-Id: <20260706201820.1ECDC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new compatible block for 'Luckfox Pico Mini B' is inserted out =
of alphabetical order in the binding list.
--

commit fc06cf28ad2eaf0cae38df99becb9a16d3aee26b
Author: Simon Glass <sjg@chromium.org>

dt-bindings: arm: rockchip: Add Luckfox Pico Mini B

This commit adds the device tree binding compatible strings for the Luckfox
Pico Mini B board. The board utilizes a Rockchip RV1103 SoC.

> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index 1a9dde18626d0..711029ee78af2 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml

[ ... ]

> @@ -813,6 +813,11 @@ properties:
>            - const: netxeon,r89
>            - const: rockchip,rk3288
> =20
> +      - description: Luckfox Pico Mini B
> +        items:
> +          - const: luckfox,pico-mini-b

[Severity: Low]
This isn't a bug, but should this entry be placed higher up in the file to=
=20
maintain alphabetical ordering? It looks like "luckfox" is being inserted=20
between "netxeon" and "onion", which breaks the alphabetical sorting of the
list.

> +          - const: rockchip,rv1103
> +
>        - description: Onion Omega4 Evaluation board
>          items:
>            - const: onion,omega4-evb

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706195818.3906=
949-1-sjg@chromium.org?part=3D11
