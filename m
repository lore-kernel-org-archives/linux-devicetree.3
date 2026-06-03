Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37B5384CD6
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 20:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519191; cv=none; b=RdUt14tYAphbiJizsx4O7W9yCdniAjHCSu5TrCP3Jil+NniIk+yJke+l8DoWiYTzyIBHG2ZPfrxu8IxLB331vkd2VOgTXXwH+zUKpPvMflH2hVnVRQ5C5oZGfmhCXzMADFg8neKlyVdS21NHwdRh8dnizXxq9ZD8n+kmcGKMBRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519191; c=relaxed/simple;
	bh=+vRsFz7cfY5l9I4oz7IlPm0snO8psfUyGRx+MUBFiKk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rZoyisu924m+iPCpYfba66WJiClN1MTVRocJ0vujBdbIzk1smqJEw+ueYPHOwgc0VT4UHrVg8jww9DyAwXi3FBDplUBZ9sg09kDU1kUWv5joeThtuatf4AhGX1a5PoKuc5yqEeL9cnQeoZQHiOAj/1e5xYz6G5WPVc0zmzcn9dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCWsTIXr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCWsTIXr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131831F00893;
	Wed,  3 Jun 2026 20:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780519190;
	bh=VnQSHJNXbAz+s60b8qG3os4OFaf12xs1pEgv1tMcaoI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SCWsTIXrNjjUx0cePTDTwRBZMaarm01A+ImPVZe0hp9NbCv4MkLWbdO0DPczIhwE9
	 7Ve7tmJ5WWX7xBwmexrVlqjM4qy2wKFTKO+DPyJx+8oDuDf0CA8Xp60N/iZHyLO5Ks
	 xlJzk3BIpnWS1Ga5V7DqoOBrf7eQKAm9YUBK2yJYs4A72MnlO7IuJ8NOYwdtwGOCkm
	 3wt3Xw4nOIk30LfbIG5hPIjcYPE1FJZjkP77cAq/Ra77OOzDDkAVIYeh3Q4x6ACwQg
	 VOC4n70M5sK1XMPG7zftfvwa8YRYtfLcBArkg80+02sBZTOoCK+7taLx97CkAqI1vp
	 4bHFrl4ii5grg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix
 dma-names list and ports schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260603202805.3530046-1-john.madieu.xa@bp.renesas.com>
References: <20260603202805.3530046-1-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 20:39:49 +0000
Message-Id: <20260603203950.131831F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `dma-names` schema modification unintentionally converts var=
iable-length arrays into strictly fixed-length tuples, enforcing exactly 5 =
or 10 items instead of allowing 1-5 or 1-10.
--

commit a5213139a119a047832e83895a5e3d493f04d666
Author: John Madieu <john.madieu.xa@bp.renesas.com>

ASoC: dt-bindings: sound: renesas,r9a09g047: Fix dma-names list and ports s=
chema

Express the dvc/src/ssiu dma-names as an items list rather than an
allOf-wrapped single schema, and drop the now-redundant maxItems. Fix
the ports container to reference graph.yaml's ports definition instead
of port-base (a ports container is not itself a port), keeping
port-base on the port@N children, and constrain each playback/capture
phandle-array entry to a single phandle.

> diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-so=
und.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.=
yaml
> index d7fa165546985..80670019d2f45 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml

[ ... ]

> @@ -143,11 +139,12 @@ properties:
>                through the list to find a free channel.
> =20
>            dma-names:
> -            maxItems: 5
> -            allOf:
> -              - items:
> -                  enum:
> -                    - tx
> +            items:
> +              - const: tx
> +              - const: tx
> +              - const: tx
> +              - const: tx
> +              - const: tx

[Severity: Medium]
Does this unintentionally enforce exactly 5 items?

In dt-schema, specifying an items list without an explicit minItems property
defaults minItems to the length of the list. Since the property description
mentions "As many as 5 can be provided", should we add minItems: 1 here so
it doesn't reject valid device trees specifying fewer fallback channels?

[ ... ]

> @@ -203,12 +200,22 @@ properties:
>                falls through the list to find a free channel.
> =20
>            dma-names:
> -            maxItems: 10
> -            allOf:
> -              - items:
> -                  enum:
> -                    - tx
> -                    - rx
> +            items:
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]
> +              - enum: [ tx, rx ]

[Severity: Medium]
Similarly for the ssi and ssiu nodes, does defining an items list of 10
elements without an explicit minItems implicitly set minItems: 10?

Could this break dtbs_check for valid hardware configurations that provide
fewer than 10 channels?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603202805.3530=
046-1-john.madieu.xa@bp.renesas.com?part=3D1
