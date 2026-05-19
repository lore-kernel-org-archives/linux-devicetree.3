Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3091C84A2
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193865; cv=none; b=s3ALee6zZ1Nvw2YeoGTUlxpZnERJ97MWWiAWqfSu0gl3+Z/aZKsIYaxPCUmGEbiP5e3rVIKAy8GacC1KSEW7APPxxoo4xbZPWkqZkdxE4qkLCmzmfM0qolUF7mnU1V40BprMJYsX7F+IlSoX7fLdWfSlOA4KM89XiVxLrWIJFIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193865; c=relaxed/simple;
	bh=OuYJlCYRn9vh4P9tkKFr10xRkG/LgEO7ecrskFafRHU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O2C7rH/r84eMKokLdFNG/I0qQxE7DQRTmoLvY6j+ys0pTYfiQIY/6Byyh2Duj4F0+ejS8N4rA+3iXiSOrVsLn0kK6OIz+8Et5TcsTffui3ytI8ewm9tTVIqOxM/Psefzvdo4wtGnMgGQdmKaIlv1uijM3goUmuanZb9lCHucChE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXF5TgOk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXF5TgOk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318F3C2BCB3;
	Tue, 19 May 2026 12:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779193865;
	bh=OuYJlCYRn9vh4P9tkKFr10xRkG/LgEO7ecrskFafRHU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=SXF5TgOk46wvIiibbGqcE9r2hhV+ioLktGesXi2oQevuVMQ6UmRhbiv6JKfV66/VV
	 1gk34dWd7J2CMkqS616JJ2VTA5EyVrGfQOPPTg0STC4gUARH3WR429VqDl3WJVtV6U
	 pUyU3ognD5exUZ7ZVMxuCakqomzh4NPSzqnMhIcZrd3zrx9AYMXkEJhqIfeu09ro4O
	 W9T1Kfx+gVTf0LlBIFhXNpjq3GljMXADHOfGzb/oyuVODTbZ5449VsCnDE6uFBqsvS
	 P/8LF2Zl6vrjFaO/n2LAETaCG/nKx0IPS/a0qV8qWH3afOzeqMo2sEBQ2I75oaTmy8
	 9SiZOqlFFjbSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: mfd: sprd,sc2731: Include SC2730
 regulator bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?T3R0byBQZmzDvGdlcg==?= <otto.pflueger@abscue.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519-sc2730-regulators-v3-2-5bf0e02507e3@abscue.de>
References: <20260519-sc2730-regulators-v3-2-5bf0e02507e3@abscue.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 12:30:57 +0000
Message-Id: <20260519123058.318F3C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The newly referenced `sprd,sc2730-regulator.yaml` schema contains =
a critical bug that causes it to falsely reject valid device tree nodes.
- [Medium] Unconditional relaxation of the `regulators` node schema permits=
 incorrect hardware configurations to silently pass validation.
--

commit 0ef24a84813b14435877f202403f8d49b85173ac
Author: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>

dt-bindings: mfd: sprd,sc2731: Include SC2730 regulator bindings

This commit updates the SC2731 MFD binding to allow using the SC2730
regulator bindings for the regulators node. The SC2730 PMIC provides a
different set of regulators than the SC2731.

> diff --git a/Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml b/Doc=
umentation/devicetree/bindings/mfd/sprd,sc2731.yaml
> index b023e1ef8d3cc..e74ec49709941 100644
> --- a/Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml
> +++ b/Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml
> @@ -54,7 +54,9 @@ properties:
> =20
>    regulators:
>      type: object
> -    $ref: /schemas/regulator/sprd,sc2731-regulator.yaml#
> +    oneOf:
> +      - $ref: /schemas/regulator/sprd,sc2730-regulator.yaml#

Does the newly referenced sprd,sc2730-regulator.yaml schema contain an
issue that causes it to falsely reject valid device tree nodes?

This issue appears to be introduced by the preceding patch in the series
(commit "regulator: dt-bindings: Add Unisoc SC2730 PMIC") but manifests
here because this commit adds the reference to the broken schema.

The sprd,sc2730-regulator.yaml file specifies "required: [compatible]"
and "additionalProperties: false", but entirely omits the properties block
necessary to define the compatible property.

Because dt-schema rules forbid any property not explicitly defined when
"additionalProperties: false" is set, it seems any device tree node
defining an SC2730 regulator node will instantly fail dtbs_check for
containing an additional property named compatible.

Does this unconditional oneOf block permit incorrect hardware configurations
to silently pass validation?

This change replaces a single $ref for the regulators node with an
unconditional oneOf block. This allows any PMIC compatible string
supported by this MFD binding to legally declare either the SC2730 or
SC2731 regulator bindings.

Because the commit message correctly notes that the SC2730 provides a
different set of regulators, should the schema strictly associate the
regulator binding with the corresponding top-level PMIC compatible string?

This could be implemented using an allOf list of if-then conditional blocks
that evaluate the parent node's compatible string to selectively apply the
correct $ref to the regulators node, preventing cross-generational hardware
mismatches from silently passing validation.

> +      - $ref: /schemas/regulator/sprd,sc2731-regulator.yaml#

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-sc2730-reg=
ulators-v3-0-5bf0e02507e3@abscue.de?part=3D2
