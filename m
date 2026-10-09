Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46433AD53F
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 12:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548608; cv=none; b=g4wi9Ns+d42VY8eMtjeL1Mvfy7qCaVWOjgqTrDLqa9vTQ5vbJDREpcPIJXkfMpiNN9OhFd0H4mfijZCJu6rdg/w0BfQajNN5faWixtKt3p1aafAJT2eNSP1UOF6Jd39LkKKwXNlRE5266ZsohbQyxnyG1sOLDg1zXwJSDtKewrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548608; c=relaxed/simple;
	bh=W0v5YE46mtsUt2R/ZDQ2S37Ca4sN7cqPth6WmLkckAs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=NnaJQvfc4rnKIN+olL0jK7QJi+1J/6qTV0AYsbDvdBGcbWoxHuDdKZUPzuiMf9Ntwc/Fx4FXkrPB6vwBDh6qVXaSpvoMZNKfJku9uPbr5nej4Rgkj4oELeG5NHhFzqHknEUbR2laIfFCfhKETYTetaKsEYxBYqeWGSr1dmbwqkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVQ5q47I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVQ5q47I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1774C1F000FF;
	Fri,  9 Oct 2026 12:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791548601;
	bh=zZsYcIqLxg0OAkcAKLbc2gV52UTsbPaItZkbN001vq8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RVQ5q47IJXbdCJ33IhFhCqoxPNWZvkHSjS9V/IYBH2Sz7aFrMMv2nHXcD+Dvw8riE
	 8cPBQ9YN6e4ho9q5d1/yH90jUTppGatEfSo97GepPKfiZf9wUQxxk09MyEFyZ0upNy
	 Ls4jKIHaifo/QI3aCvFcw31OVSjUzWVcI1xvi8Ke+gwQ5Exh+ixS3zcNQDXu4Ud6Wu
	 Z4RZqYQ6IqJgYYbiMbP+rLvufbxciojxhSbKg1O47SHJKWOPThOODvORuQ8sQk63jY
	 LEnot/4/R2EPGQFKzJNo+n7swFavBbEYpDMdt91xcT5Vh9sz0R07/13RCQ8k7k7neS
	 r00evXOBlcDnw==
Message-ID: <sashiko-outbox-165529@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: power: Convert Ux500 PM domains to
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009-ux500-power-domains-v7-3-rc1-redux-v1-1-5eb1b90bc35e@kernel.org>
References: <20261009-ux500-power-domains-v7-3-rc1-redux-v1-0-5eb1b90bc35e@kernel.org>
 <20261009-ux500-power-domains-v7-3-rc1-redux-v1-1-5eb1b90bc35e@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:23:20 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: node name pm_domains0 violates generic power-domain.ya=
ml pattern
--

commit e036f4f6150d2ad689c2435137c3f93e75ad275c
Author: Linus Walleij <linusw@kernel.org>
Subject: dt-bindings: power: Convert Ux500 PM domains to schema

Convert the legacy Ux500 power domain text binding to YAML. Move it under
bindings/power. Reference the generic power-domain schema.

> diff --git a/Documentation/devicetree/bindings/power/stericsson,ux500-pm-=
domains.yaml b/Documentation/devicetree/bindings/power/stericsson,ux500-pm-=
domains.yaml
> new file mode 100644
> index 0000000000000..bf83ce3326746
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/stericsson,ux500-pm-domains=
.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---

[ ... ]

> +allOf:
> +  - $ref: power-domain.yaml#
> +

[Severity: Low]
Does referencing the generic power-domain.yaml cause dtbs_check to fail for
existing device trees?

By referencing the generic power-domain schema, this binding strictly enfor=
ces
its node name pattern:
^(power-controller|power-domain|performance-domain)([@-].*)?$

However, the existing device tree node in arch/arm/boot/dts/st/ste-dbx5x0.d=
tsi
is named pm_domains0:

		pm_domains: pm_domains0 {
			compatible =3D "stericsson,ux500-pm-domains";
			#power-domain-cells =3D <1>;
		};

While the example below was updated to power-controller to pass local
dt_binding_check, the corresponding .dtsi file was omitted from this patch.
Should the .dtsi file be updated in this series to prevent a lingering
dtbs_check validation regression?

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/arm/ux500_pm_domains.h>
> +
> +    pm_domains: power-controller {
> +        compatible =3D "stericsson,ux500-pm-domains";
> +        #power-domain-cells =3D <1>;
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-ux500-powe=
r-domains-v7-3-rc1-redux-v1-0-5eb1b90bc35e@kernel.org?part=3D1
