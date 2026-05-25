Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AE72D94A0
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 14:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779719777; cv=none; b=MXwK2h0t8vZxEQ+Ktq82sr6s0HbEbDILBSa24f5RMe046Y8wOKlKiF4hHULPMede9iXx6e7UjA2zprpbEO8G+CQ3cmh6/MFEwApeinXwpb5NNqoNqsZF0g3dAvO+8FHRGin0obsQ4FxEk3sAhWbtXYNAaZbQj7Ch5eLdQoE4WmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779719777; c=relaxed/simple;
	bh=/V4pmKo5pdZ2AX8UlqZuBuhi0wd0f2X5XL9XKMCBpm0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A+L1q6oPK26NwRG/YOrO71QLRaoBOrb5FZ8prINE1ODE3O4qMh7g0GEKK/6kTXs8syAiO/6VhAygd4QSeZoHeWLjJ/fcIsFJklKomVW/EQ9FWPVVKKZNqEfRpA+guQ5lrlfoOM/ySbs3GvDmPWaLEXFmX/2s2Ns897oTGyuQ6E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MaVTf6za; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MaVTf6za"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFEC1F000E9;
	Mon, 25 May 2026 14:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779719776;
	bh=mVORZIMHSjn0rBAziTOy+nvibeC86/ynkPZuMqIwdRU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MaVTf6za8jSvTVKN1DhJjjQkQrGJKPsu1Rbq3ygq/YSSGH8V13tVr3oFkrr6bYTqu
	 RR8hdZPZqQeEqISd5IXspLvbiNojDgtxXp3ScuEdmD4/RRN5Y1M5z1Uhu0y4S1cKse
	 F5j/pAz0KHDAohpq8xLuq7Tv0kTBJiIf9kgRK0NM5bfawskcwg7B9fTIMkI89ByvcS
	 yPx0x0m+tTCvKLszcE5z9tS0MuFx1WawBAQIQiyShCh4aTMz/M1B9bf/hMLnF0x4S8
	 HQanz4wUEhUVlOyTKJ0KML0kwlvtZZ0t/NiXlQzSRG9Xw/tqQX6Pi90lYfBZgTsscx
	 XdeZXUGfwKX3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: i3c: dw: Add apb reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260525140018.19598-3-jszhang@kernel.org>
References: <20260525140018.19598-3-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 14:36:15 +0000
Message-Id: <20260525143616.1AFEC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Adding a second item to `resets` and `reset-names` without speci=
fying `minItems: 1` makes the new reset mandatory, breaking validation for =
device trees that only provide the core reset.
--

commit 620ece5c39191636270140b0c99ea8ddfa402c6f
Author: Jisheng Zhang <jszhang@kernel.org>

dt-bindings: i3c: dw: Add apb reset

Add dt-binding for support of apb reset which is to reset the APB
interface.

> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yam=
l b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> index 613dce7757bc3..2575442b28ff4 100644
> --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> @@ -38,10 +38,12 @@ properties:
>    resets:
>      items:
>        - description: Reset signal
> +      - description: APB interface reset signal
> =20
>    reset-names:
>      items:
>        - const: core_rst
> +      - const: apb_rst

[Severity: Medium]
Does adding a second item to resets and reset-names without minItems: 1
make the new reset mandatory?

In dt-schema, when items is defined as a list, the minItems and maxItems
properties implicitly default to the number of items in the list. By adding
apb_rst as a second item without specifying minItems: 1, the binding now
strictly requires exactly two items whenever the resets property is present.

This breaks backward compatibility for existing device trees that supply on=
ly
core_rst, causing them to fail make dtbs_check. To fix this schema issue,
minItems: 1 must be explicitly added to both resets and reset-names.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525140018.1959=
8-1-jszhang@kernel.org?part=3D2
