Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795889734;
	b=tGf8huonKfMiRQIOA+5cKWm8PKaHvasIMtxDbD8+4aw3OVWLYUHtajDdXxUAYsGGKsQ0
	 u70qe2L33RhcOfiE0szAG7rEWulfcVbi3DTTwvixxrGB3eMjNbkysZIJTgEcAgHQ7XzCd
	 PQ/DJ20rRGL1Xs5OT1uu30gbdpcUWEXDKkrIkg+4cczKjn0cTIxxHEornx0ALBJCUwVYV
	 wjhLM6rxwgrElSI0kXJs5FlNhG4gGCRJ1d47MuOti6ClWtee9vvfYdl5iTi8XAy/hiUGS
	 qxK+Dkzla8R5e/XVd6t5H1YqYyqAKrRIxhZmHmB/TbM8pmiziRsdH9Hva6POXMCEwhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795889734;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1F/HJEwZJZdTUjRDlNel9+YWswCjA97PHrFt/xrZ0h4=;
	b=ztLq7hYizshFqHIpladwLvJHnPrmKj064IAXE3DpYbpiXUipzpQlMIQxrmmaoQATQVb0
	 u606V01ZF+DEyRAZgmdlM/RTj/ViQdhYY55IocSrTvNtQnS2UyLj6C2eamz6EJgqmYnF/
	 iUtzOlTGAet6gNjVg+jgSrVK2d1TGrx1noUab3btuC+B5MfHeFEbxv8sy1uL97eGl2ogO
	 tSRdsaJqxolHFdUZtPg4WN9awBlJrnO5ahpyP9AJXcKjMQwkMSSlL85HFb/K+NX19L+09
	 xQ+38FmWNMFSwPYeJl+hphvboIXbPKRugCyXY+tnYBOg8TcbNBWyHXa7H0kD0gy8BSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gSKgxM1P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79A5606A324
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 18:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gSKgxM1P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8741F00899;
	Sat, 28 Nov 2026 18:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795889734;
	bh=1F/HJEwZJZdTUjRDlNel9+YWswCjA97PHrFt/xrZ0h4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gSKgxM1PtKoCZ9Yi/dxIzSN0Tz0C3F2eFLk3b0O27LolWo0oGh1FlyzVj0vOIQMqF
	 dJ4/7Vui9Vep8RDmfOsExm1UKCSNqN8iR6rmzT4Pay1HUccHPHkqGoNAQ5TTOzTpPD
	 BLBvWHMGp0cMANUFCT/zF5nyHn37cy8Q8BMXqL0Pk8iKx+q+HUwxg2LAa4kdjjoSXv
	 IxK3JRd0Yq5IopzFoMcJbwGNKFgPVa/SlKHaA0UvMaTc2Lqfoi83PVCeGC7VPh6YIQ
	 2RaPXSfhS83tFcbJHZzEjDg4jEGRBqIEfywpPZUINUtJ8Sfzyh1o7NAOn2fEqVJsfN
	 aLzxInImpC7IA==
Message-ID: <sashiko-outbox-238948@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: pcs: renesas,rzn1-miic:
 Document rzn1 resets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hendry" <khendry@reliablecontrols.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261127-miic-reset-consumer-v1-1-3cab78b94e23@reliablecontrols.com>
References: <20261127-miic-reset-consumer-v1-0-3cab78b94e23@reliablecontrols.com>
 <20261127-miic-reset-consumer-v1-1-3cab78b94e23@reliablecontrols.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 18:15:33 +0000
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
- [Medium] dt-bindings: net: pcs: renesas,rzn1-miic: misindented resets
  under else
--

commit 575b03c2d089ed2bbbd4eb3b68259490440d654a
Author: Kyle Hendry <khendry@reliablecontrols.com>

dt-bindings: net: pcs: renesas,rzn1-miic: Document rzn1 resets

This commit documents the two reset lines for the Renesas RZ/N1 MIIC in the
device tree binding schema and moves the per-variant reset definitions into
the conditional allOf branches.

> diff --git a/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.=
yaml b/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
> index f9d39114e6672..5ad1f993e8bd1 100644
> --- a/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
> +++ b/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml

[ ... ]

> @@ -161,9 +165,14 @@ allOf:
>        properties:
>          renesas,miic-switch-portin:
>            const: 0
> -      required:
> -        - resets
> -        - reset-names
> +      resets:
> +        items:
> +          - description: Converter register reset
> +          - description: Converter reset
> +      reset-names:
> +        items:
> +          - const: rst
> +          - const: crst

[Severity: Medium]
Should resets and reset-names be indented under properties here?  As
written, they sit directly under else, which causes make dt_binding_check
to fail schema validation and leaves the rst/crst reset constraints
unapplied to the RZ/T2H and RZ/N2H variants.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-miic-reset=
-consumer-v1-0-3cab78b94e23@reliablecontrols.com?part=3D1
