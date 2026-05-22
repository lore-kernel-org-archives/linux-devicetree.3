Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9058338C2DE
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 21:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779486047; cv=none; b=qIyHhhIhVRD9Fxcu8IGR8eYujMc9Bm8qXD+iGQ3iN4MmPDyDPKzbNZbTQG2K+v4hM6GMfJG6ODb30Mj5uatwpKFbZgvNEwwUqBou1s37Wa/B/V87XJn3MOK8FyXT4jo/KVWwQKY3jJMzKRuotsSt7NTgo+wKJKh04srzSFEG8So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779486047; c=relaxed/simple;
	bh=8wKLZ4dW+ofUyQGcOay+FmIJqotgeUkzz9x0NhWsWow=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cBtS++0t+SVem9XwnlhoTAYNWtEEnGYTmwk8S6+dYa32cQ/eDMOpzDzcv93t15rn11nqdzBVkqW3r61xYiePLQijyCBvK6KnS8J8S+UCzOs5FQWI81+W5l+yXp3MI59wWGtBmZpWtknPRE3ms9Q8aNFP5G8naGtTj3CMQxcBrLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jc6KYzpY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jc6KYzpY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9DB1F000E9;
	Fri, 22 May 2026 21:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779486046;
	bh=ds0IYkPzSg1nBTXJNna2XwjaE7+PcrNPLid9wXbNYCo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jc6KYzpYeTVB3inD8eBfZFmTnzoRdKZ+5t25uiZwih0h1oS+BxKJ9W8fb142EyomJ
	 bwsYLFRiWXFRJx51GFJwdiccuyRPLgifR2XgVqGvFRLvDRVtP7IJD92flwNBp7ST7u
	 6cJECj1OB0lcSJnZHmfZTDt7iVf5I0+HGefjlaaBENN5RVIDCAyysOf89oThM9s4QC
	 2ltZ5yZYRaxjf7hN+xWtUD+LakfG5C4TiIo28Nz/pvD0aLgo7GGLycdHaEtTWui7Np
	 1AALYSDf/bzpHEzKSwdr0j0ShZTzi2uYG51IrDLAB0gwxcpbZCetnaWZIoYd+wi4gR
	 /cdfiD7hM2UXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/8] media: dt-bindings: add rockchip rk3588 vicap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Riesch via B4 Relay" <devnull+michael.riesch.collabora.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260522-rk3588-vicap-v5-2-d1d1f5265c56@collabora.com>
References: <20260522-rk3588-vicap-v5-2-d1d1f5265c56@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 21:40:45 +0000
Message-Id: <20260522214046.0C9DB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `minItems` constraint for `reset-names` in the RK3588 condi=
tional block.
--

commit 63f5bfe4a138b18bc1581d3e98d7e6a10fe7ef3e
Author: Michael Riesch <michael.riesch@collabora.com>

media: dt-bindings: add rockchip rk3588 vicap

This commit adds documentation for the Rockchip RK3588 Video Capture (VICAP)
unit. It generalizes the existing rockchip,rk3568-vicap documentation and
introduces variant-specific constraints.

> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vica=
p.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
[ ... ]
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-vicap
> +    then:
> +      properties:
[ ... ]
> +        resets:
> +          minItems: 9
> +
> +        reset-names:
> +          items:
> +            - const: arst
> +            - const: hrst
> +            - const: drst
> +            - const: irst0
> +            - const: irst1
> +            - const: irst2
> +            - const: irst3
> +            - const: irst4
> +            - const: irst5

[Severity: Low]
Does this schema correctly enforce the length of the reset-names array for =
the
rk3588-vicap variant?

Since the global reset-names definition allows a minimum of 5 items, omitti=
ng
minItems: 9 here means a device tree could provide exactly 9 resets but only
5 reset-names and still pass validation. Should this include minItems: 9 to
match the resets property?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-rk3588-vic=
ap-v5-0-d1d1f5265c56@collabora.com?part=3D2
