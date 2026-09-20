Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FE9393DFB
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 11:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789902775; cv=none; b=snNtmhUoEpa7haFAfKBLF0r26IdYzEVkfoLcvWJjG8jb1VRXYSM+h+PM7KDQX6aEmNk7fQ7ObbfurpBIxDXjYpOo6/ORodAyMRIudrB5HFHUcFNVGMZmNRDDn4vP+vt05NC4IHC+R4PslFyjvuPlS16wd0ONNdpOLOaa8WgOXVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789902775; c=relaxed/simple;
	bh=LVCBHEzf+vLW15VAWEki1nVBkzaieA8mDBSQCSiOj/Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dKIDRmcIUzhzqHeX4426oJDkA+8X5Q77lscUaBUKGaAjAnGa+IGfmzz4uTMMvZ/HBlfrQOTeYo+ta0OBPaRZsvSjgNpDnOcPsSmySvcRUwcUsELsN8UuJqfI4yASYo33NsRif0t1kMKMavG2G/3ktg52v06pRcAFRM4nIqKvTjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJobMpyz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJobMpyz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D061F00893;
	Sun, 20 Sep 2026 11:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789902774;
	bh=SfOkMbGqoJf95+haSaA+DqVFyDYytyE6Ldla0XNPubw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EJobMpyz7txAjwv2b/ggrwF3NgzwID0HXMt78honBc1fbeHpUTITydyCjXGapy41c
	 QUOMkggkbShzO2ZkYV0wqfdcPMNb/4SNSYsx4T8kQWgw73nUgmLliGTh47WDAD/cZt
	 tfPiYPB3yEBdlp1agW8ACyS6x4xplCpgfD/sS7DroxFyH/1aH7+fRnGn5p+t6U1JHk
	 6DhpWZtxOYTsRI1aRXW84D2ronSH07WheKuut0V7uYERFF2cRndKm9NRnIO21AHLCl
	 Dk3anSgkCTe25oX1PG/V5OnRWxCNG487hE3jci4JWJHazl4tviu0nNE7D81pdlxvAd
	 riPQ3I3ewuJeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/11] dt-bindings: display: panel: samsung,s6e3ha8: Add
 AMB630QY01 panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260920-crosshatch-panel-v1-2-de6e9512da96@ixit.cz>
References: <20260920-crosshatch-panel-v1-0-de6e9512da96@ixit.cz>
 <20260920-crosshatch-panel-v1-2-de6e9512da96@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 11:12:53 +0000
Message-Id: <20260920111253.E0D061F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: commit message omits deprecation and new compatible st=
ring
--

commit 1def073e2834624beafbcc0f1b404f941e99bc1b
Author: David Heidelberg <david@ixit.cz>

dt-bindings: display: panel: samsung,s6e3ha8: Add AMB630QY01 panel

This commit adds device tree binding support for the AMB630QY01 6.3" flexib=
le
AMOLED panel used in the Google Pixel 3 XL.

> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3=
ha8.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.=
yaml
> --- a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml

[ ... ]

> @@ -38,12 +60,17 @@ properties:
>    compatible:
>      oneOf:
> -      - const: samsung,s6e3ha8-amb577px01
> +      - enum:
> +          - samsung,s6e3ha8-amb577px01

[Severity: Low]
This isn't a bug, but does this introduce a new compatible string that is
completely undocumented in the commit message? The commit log solely claims=
 to
add support for the AMB630QY01 panel, leaving this change unexplained.

> +          - samsung,s6e3ha8-amb630qy01
>        - const: samsung,s6e3ha8
>          deprecated: true

[Severity: Low]
This isn't a bug, but could the commit message be updated to explain the
deprecation of the original generic compatible string? The change implicitly
deprecates the generic samsung,s6e3ha8 string without explanation in the
commit log.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-crosshatch=
-panel-v1-0-de6e9512da96@ixit.cz?part=3D2
