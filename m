Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78315175A5
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787116104; cv=none; b=Fpsx/WVyxyiGXRIJywYQeS60uOv8B+tRh6C2r6SlK9Yf0rmdfZSLOUPO4f81XREd25s0UJcMVkkuQl/d1KgLeQ3Cth1uc6kz+RVewUkmotm5iZTB941hcvBwbA8iLEhuEri+47TsdTrYk6rZwxI4QhyotxGWkZ+quqbYK4Yt33M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787116104; c=relaxed/simple;
	bh=d6+d8am1owAB/tnWcXadZqXUTRytJG47/T2Tg8Ljr34=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NO037TCoKBCX7+y+pFIcgJ6daQHHPjNSGRw9poTJi4LA9rHm94MbXZbm6MzsLpwTd3O9y7whAOWKtMvRcS4odeHkfqdPxTLkQf5Ou2MdktbwG2v05kxv5MIbVxJX127E0dj2jkDthtvAk137maRKvBbqao3WkwV8YlYoozZ4aGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZuUH24U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZuUH24U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E577E1F000E9;
	Wed, 19 Aug 2026 05:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787116103;
	bh=nY2AG2K4habl13OdtwfIaRzgVCOFl+VJXKBVkJ/fLAY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WZuUH24UmVo5QcgGGAN2CGhUwDyHea0138soO0yPJphkuVkYG6ongfsDoi5eOH4AA
	 kP+iP4Yy7A3po5v2cVgEDocNIlJ1dPP1kb7+SVQbyVl5Gvy0QaJJf8lRGGVZTsL2lV
	 YD2M/9ge9+NkYOlb//N1e59zmVkykpZly2Gr5MjA2F+gTATqgZGJaVBbh0cVPQEV27
	 vAIY1Sy3cV40l1HDenulXYNnsD3jPMuKb/id7X6r4d+RkD7cYVYp8/mHlS29febrUs
	 4SuA739bZrw8/eBIhBQZOmSTi4LsHnHov8SQMQvxNopeMSPqg9PG8g5tREqJ2VhWl2
	 wZh1KtjY+Sn2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car
 Gen5 DWC3 xHCI USB controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260819050109.681890-1-marek.vasut+renesas@mailbox.org>
References: <20260819050109.681890-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 05:08:22 +0000
Message-Id: <20260819050822.E577E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `phys` and `phy-names` property constraints in the local sc=
hema, allowing device trees with up to 19 PHYs to pass validation.
--

--- Patch [1]: [PATCH v4 1/2] dt-bindings: usb: dwc3: Document Renesas R-Ca=
r Gen5 DWC3 xHCI USB controller ---
commit cb2d4b4bfe0dea655c7acecc9fb3e13518b6d5fb
Author: Marek Vasut <marek.vasut+renesas@mailbox.org>

dt-bindings: usb: dwc3: Document Renesas R-Car Gen5 DWC3 xHCI USB controller

This commit documents the device tree bindings for the Renesas R-Car Gen5
DWC3 xHCI USB controller. It adds a new YAML schema referencing the generic
DWC3 common schema and defines local hardware constraints.

> diff --git a/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3=
.yaml b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml
> @@ -0,0 +1,68 @@
[ ... ]
> +allOf:
> +  - $ref: snps,dwc3-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,r8a78000-dwc3
> +      - const: renesas,rcar-gen5-dwc3

[Severity: Low]
Should phys and phy-names constraints be included in this local properties
block?

The commit log mentions dropping generic phys/phy-names because of the
generic snps,dwc3-common.yaml reference. However, the generic schema permits
up to 19 PHYs.

Without local constraints (like maxItems: 2) specified in this block, the
schema would allow device trees with 3 or more PHYs to silently pass
validation, even though the hardware only supports 1 or 2.

> +
> +  reg:
> +    maxItems: 2

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819050109.6818=
90-1-marek.vasut+renesas@mailbox.org?part=3D1
