Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F954746BE
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706232; cv=none; b=W5JO086+oOISX16zsJoGl/1RkbDI/vFrBvUjK3jgCD3n03qJ6Qfzi6W5ahqmHvxAMgRXnPXqHWx3nIvdJoWKyQJ0bqJKMxnTGDlqsGdmBgA4Y3wSb2PMGub1NGvl6wIGRpQeyvOmF7IwhYcIvXWw12esmSh1FQGsF6fnOLv/H2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706232; c=relaxed/simple;
	bh=wK/KpYZUjX0rnFmsAQjFwCSn4vTwAsYjGWFKXMkCjAE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XW9Ddhdf6i++Rgor5kZkygT+3jEW0Xm3NJzTQGkHFzcN4DYJk7cZ1LCkSCbyN1mB22tx6Emds7Nrongfics5YZi4OPLzeqU7GASMsFdwOQncHSS6BCWQXVDaiXNqEkTGFVbvPPJVbEKoqCa6/YAUONyJlOqYxrVdkYowEDFh+to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAgpD4qZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAgpD4qZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4E31F000E9;
	Wed, 22 Jul 2026 07:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784706230;
	bh=sZv2MGt+o7XTEQbyQKmQJCPak9b60hprbtzM0z6epJU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XAgpD4qZsXxDw2oaoPMHAE6DOR1Xcl23M0SaOKZWA48D8QA/Tte/XiV/++tFnKrgk
	 D+iYLrFuPUtYQp8j54tk6yFLnu/n5VMgI94vdeLFv0OGWhsYijdJJUGLYjau4TNShK
	 hrmIGBqbjFXaFHFJFAi4r40VF55QwZO/Qpz7UI78/QS0Wiz2c7FxqxLULkIZeVe1zs
	 Rt3P+QxlMYQtG2g6qWrHTn8H7p19PhlZxcLDBWQFkkGpanh87dhI2FD2kK+UYrabA8
	 +X0v2SfZ1uQH1qj1Gn7snn6ckXb+8YkV0np6Gr0Kh2NfAjhRW/96taj/clXlz/1qHs
	 1oUnM82c5radg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 3/3] arm64: dts: rockchip: rk3576: add VEPU H.264
 encoder nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260722073417.2064667-4-gahing@gahingwoo.com>
References: <20260722073417.2064667-1-gahing@gahingwoo.com>
 <20260722073417.2064667-4-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 07:43:49 +0000
Message-Id: <20260722074349.CF4E31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device tree nodes are not sorted by unit-address in ascending order.
--

--- Patch [3]: [RFC PATCH 3/3] arm64: dts: rockchip: rk3576: add VEPU H.264=
 encoder nodes ---
commit 6e5cf8fb6138851fdbc5bc797d5562505948a1ae
Author: Jiaxing Hu <gahing@gahingwoo.com>

arm64: dts: rockchip: rk3576: add VEPU H.264 encoder nodes

This commit adds the two VEPU510 encoder cores at 0x27a00000 and 0x27a10000
along with their corresponding IOMMUs to the rk3576 device tree.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3576.dtsi
> index e12a2a0cfb891..58d706d563290 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1314,6 +1314,56 @@ vdec_mmu: iommu@27b00800 {
>  			#iommu-cells =3D <0>;
>  		};
> =20
> +		vepu0: video-codec@27a00000 {

[Severity: Low]
This isn't a bug, but should these new nodes be placed before vdec_mmu?

The device tree coding style generally expects nodes to be sorted by their
unit-address in ascending order. Here, the vepu0 node at 0x27a00000 and
subsequent vepu1 node at 0x27a10000 are being placed after vdec_mmu at
0x27b00800.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722073417.2064=
667-1-gahing@gahingwoo.com?part=3D3
