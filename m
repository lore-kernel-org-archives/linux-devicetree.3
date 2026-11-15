Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794774766;
	b=EwLqCW30+y5tSVu/8lUsjkJkU87KUwP5qmR/dPKzW4afYmAaVFbzqRnBg5G8Dg9Bwcox
	 AFCOJ82k4q+wuRE52epId+upc8uNvxlc7FRZzUNw807xAzYzGAypEKkF7j7VgFZfD1A1p
	 xjX/X8i6C9tNIrvITBP+3H/1xxchAQ+JTo5eiTiRU7aQ5nxW7xynhceFM3QoCJsIarmWr
	 ++QLtdsajvtTc3rib5TSBuzyC04J2fa9n3RB97pySBDOdAqw8QdZ3eHYnBBkLcVsCmwMW
	 L8u1xOtRWLE3WHGWVH9qDbbDbGABQTNPsOQNMp063OwBpX1Q9t2gb2Bk22MBBFwG8fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774766;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Zdmt3jaBqypK+XeCbxAWVFpPyKwA95vmyKO52U+w3qc=;
	b=4jD9zw7/PvkA7OXkUV3KURZUyuClp2qY/FF2KFW3MytrBDXPJMnkkwClfZJ77YJbWG8n
	 OMFWk25SgG1UxrLI2Ds9w+8AMPm8Jqr9JCue2xMxMyql0qaJgn9PPRiKhbnMa/6UP9muL
	 28o3GIk/q7zrx6xgBCukQxM6HMYSmQdi4mnUi0e62Rpgs7vcGRDY8gm154fRFczSGUQTN
	 /UwPcRWTjXk4ULUpESWO8ec5UB+ya3XXpIHOuZ4BeAimLmevKZqSiRTWeF5zZ2t+CpA1j
	 oOT/o5rr2qeZt61fYjLpX9DmFGXy1UN95Jnx1KN3fGjO3e1MNavp3k0a9++EsjgUhQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lq+2rEsF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071E4606A329
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 20:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lq+2rEsF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999721F000C4;
	Sun, 15 Nov 2026 20:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774765;
	bh=Zdmt3jaBqypK+XeCbxAWVFpPyKwA95vmyKO52U+w3qc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lq+2rEsF6iMpDb1IwoD2+0cgSyLADGlnTXGAu0NOg3cYSd++1gq98o94hulthCOT2
	 frDkvHtptfzf1K5CX1f87oErJanLj3TraoJhU2oNk3gSOlrT+JpIc9rp0xVnocUCqc
	 846qtgDsGtScwFDSNaZbG+2wP7eLH2weVIbtYPO/W0hG7QvcGuLNHbHWkBm5z7BmDs
	 LqRMbnCptKqDxbAWgublLrK1g+91QuYFMf+z8nWpq7S+qsOZxSe0qhhwI02E3HNAgk
	 9bA8k+TSgblWGX9bci1282J8z5RCuDlcSNPwSbmyslI/i6j7n17/S5iN/CyIBOi8ur
	 R2u5kvaVN5KOw==
Message-ID: <sashiko-outbox-215828@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Ilitek ILI97680A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Venkat Yadlapati" <venkat.yadlapati@yahoo.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-vantage-panel-v1-1-30b95bd49216@yahoo.com>
References: <20261116-vantage-panel-v1-0-30b95bd49216@yahoo.com>
 <20261116-vantage-panel-v1-1-30b95bd49216@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 20:32:45 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dt-bindings: display: panel: missing panel-specific
  compatible string
--

commit 7841ad6a366c1d68596c6fd31270d044bd848d2b
Author: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

dt-bindings: display: panel: Add Ilitek ILI97680A

This commit adds a Devicetree binding schema and MAINTAINERS entry for the
Ilitek ILI97680A-based 1264x2780 BOE AMOLED panel found in the Motorola
Signature.

> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili97=
680a.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili97680=
a.yaml
> new file mode 100644
> index 0000000000000..f3323fbd587f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili97680a.ya=
ml
> @@ -0,0 +1,70 @@

[ ... ]

> +description:
> +  1264x2780 BOE AMOLED panel driven by an Ilitek ILI97680A controller ov=
er
> +  four MIPI DSI lanes in command mode with DSC 1.2 compression, as found=
 in
> +  the Motorola Signature.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: ilitek,ili97680a

[Severity: Medium]
Should compatible require a specific panel compatible string (such as
boe,<panel-model> or motorola,signature-panel) followed by ilitek,ili97680a
as a fallback?

ILI97680A is the display controller IC driving a specific 1264x2780 BOE
AMOLED panel.  Other panels built around the same controller can have
different resolutions, dimensions, DSC settings, and initialization
sequences, so using the bare controller compatible alone prevents
distinguishing them in future Devicetrees without breaking ABI compatibilit=
y.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-vantage-pa=
nel-v1-0-30b95bd49216@yahoo.com?part=3D1
