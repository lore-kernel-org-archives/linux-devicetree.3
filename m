Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5733830674C
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 05:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784094890; cv=none; b=TJyTBr20qZQV70RnYx0RYYmaypqeMPuz/VuL5qeyELxVYOIbmeL5J85H+d2nsuZ0Lcx/WeiO3CXvMHnmsP0Sy3vsY4YcI1rrotMZt/KXVURsbObnCVCuZu9dx/caGBjo4N2A3Q98x4GHGqgbHBmImMp+kq1ChXhbsuPK0ydb/qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784094890; c=relaxed/simple;
	bh=zTqDTQLID8eA2+LlyEvZG13RE524wCKy85HD84vljzU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QpwbjPWMmNhNi5vAX5t/rOysuWFxhnQ8W3E28Xh2daZW+yxwvXcLCk1dmFKUcepnfHUoGab9IqCxDtq+fNC7H5c4Kdz+r8T2pxWrWZE8KIuTv5T/jSO64MoTFdtwYP9D2Y/mxyPxbi4mx3mU3n2PpK3bIh9XVh/98pJr03LfBjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdL5hKFD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdL5hKFD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA021F000E9;
	Wed, 15 Jul 2026 05:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784094888;
	bh=qKtImZ1MYt9kpHfRUDSJLwm3G/UGkDuQm5qrAkyUYew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DdL5hKFDFnE1GXzNvKzejVLs17KShvXDchzpO9pBBO5nz3gddIe51kDjEtqRWwPAw
	 Dn6J9YlD7xMr8HP1cm3A48nfQEZaANlBGXMhmEkIuUO3nEAlbW/qdxVPmWCScVVCE8
	 Cgr+/M3q19uPUbLSvA3onqbqG4GHyV+A74nAae//lnaq6Zba8AvBhS4bgOkvlsNJ1a
	 1JqKDltgN8cZGigECyXWwhyZCrxSvOJAzmsvQxrZPG7qC3THMXBwbOxPQLxJ3Y5Rq/
	 MR1Tro/w5NSsb/xEQuDs08+yJBriZW2gM4LJ/k+QSBMWP9wCJkvO8vtpA1Lx3d0Lf8
	 L0KmDTV9VsQPA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add
 #sound-dai-cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Paunovic" <royalnet026@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260715051939.64652-2-royalnet026@gmail.com>
References: <20260715051939.64652-1-royalnet026@gmail.com>
 <20260715051939.64652-2-royalnet026@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 05:54:48 +0000
Message-Id: <20260715055448.AEA021F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect cell count constraint for single-DAI provider.
--

--- Patch [1]: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add #so=
und-dai-cells ---
commit e6b0bac0b97f568ce749084e6c1e728bcd258b10
Author: Igor Paunovic <royalnet026@gmail.com>
dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells

This commit adds the #sound-dai-cells property to the HDMI RX controller
bindings, enabling a generic audio codec to capture incoming embedded audio.

> diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml=
 b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> index b7f6c87d0e06a..83c10d9997c8e 100644
> --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> @@ -78,6 +78,13 @@ properties:
>        The phandle of the syscon node for the Video Output GRF register
>        to enable EDID transfer through SDAIN and SCLIN.
> =20
> +  "#sound-dai-cells":
> +    const: 1
> +    description:
> +      The HDMI RX controller registers a generic HDMI audio codec so the
> +      audio embedded in the incoming stream can be captured. A value of 1
> +      lets a sound card reference the audio DAI as <&hdmirx 0>.

[Severity: Medium]
Is this cell count constraint correct for a single-DAI provider?

Looking at properties:#sound-dai-cells, the hardware exposes only a single
generic audio DAI. Requiring a cell count of 1 forces device tree nodes to
use a non-standard syntax like <&hdmirx 0> instead of just <&hdmirx> for a
single resource.

Should the constraint be set to 0 to follow standard device tree norms?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715051939.6465=
2-1-royalnet026@gmail.com?part=3D1
