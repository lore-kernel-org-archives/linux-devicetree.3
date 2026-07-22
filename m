Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6118836B908;
	Wed, 22 Jul 2026 20:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752604; cv=none; b=Mt3pF2dh0wDfSgou+27Ld8BLOz6dthUGwce6OxqkcByk9Gk0EgGcZRp3x0IXkua2h1lSHA6hWIf0+CYbk1yhO75MPaBCCMVoGcnTyIPOmhaHQFYzoDPSiODON9S7gc7a4H97ifhASbgMkK36bR3E/8Jrl21aPnn2PHZIRR/FCsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752604; c=relaxed/simple;
	bh=0DNIeZYJaXQFyygvsV1Kxh4s7PW7MEvU/IAvcnyYPGQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ZBSpC6b5lyVSwPYsJ4bv4WyUdL0Zv2oEqhdHNbtRVenrf4yGYbAam+U18feuoP9ToRDOej4AMnppkn880fYuUo9olfQdWQlopaRPDL4bmFzmLoCtfbgSPKDtsHOlgG8Xs3im1aTMfltad0zkSwuuuKyiSX6EOrxNKhPDvwCF+1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PyY0aoQX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PyY0aoQX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18221F000E9;
	Wed, 22 Jul 2026 20:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784752603;
	bh=w4/VgTMh+oO/TgiDD5O7Kz0x35QFCrvVJqZrCsZqSeQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=PyY0aoQXiqgQQZRV5jqP9K9lp0Xs0yfwDRo5CFzlp+kBd6BDj5VGEHZCQVYWeTaHY
	 dud81pefjyWvFdF+SS0RpeWB5YDvrkymHA8PwID5/mTgEHc8D6oNG6ggntcDYqyCNh
	 +B8+JHvPWqYwx8NFxHfkY7Yr2y261cx2BCLXAAKkTHZ/enyaakatzdIVoWBq2uwpHl
	 7dO0XS6jzT+kEjf+NGcG07V/GjOP5/NPtBZet5Jbt2wry+m1e5wXjLZg0MpIvqar+B
	 6FLclLwcOmZgTTxh7zK3z3dKWg6kcGlS8yZvo7LI11mBbjCTAVUxHP/dVcQH3MOXUZ
	 iXWP1MXiPo8FA==
Date: Wed, 22 Jul 2026 15:36:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: m-chawdhry@ti.com, devicetree@vger.kernel.org, daniel.baluta@nxp.com, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 simona.toaca@nxp.com, goledhruva@gmail.com, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
In-Reply-To: <20260722171840.299303-1-egbostina@gmail.com>
References: <20260722171840.299303-1-egbostina@gmail.com>
Message-Id: <178475260228.1957707.1122595004130166592.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: omap: Convert L4 interconnect to DT
 schema


On Wed, 22 Jul 2026 17:18:40 +0000, Eduard Bostina wrote:
> Convert the Texas Instruments OMAP L4 interconnect bus bindings
> to DT schema.
> 
> During the conversion, several updates were made:
> - Defined the compatible property as an array to require
>   the TI-specific string first, followed by either 'simple-bus' or
>   'simple-pm-bus'.
> - Added a 'select' block to ensure this schema is only
>   applied to TI-specific nodes, preventing duplicate
>   schema warnings against the core simple-pm-bus.yaml.
> - Made 'reg' and 'reg-names' optional.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>  .../devicetree/bindings/arm/omap/l4.txt       | 37 --------
>  .../bindings/arm/omap/ti,omap-l4.yaml         | 93 +++++++++++++++++++
>  2 files changed, 93 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/omap/l4.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/omap/ti,omap-l4.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/omap/ti,omap-l4.example.dtb: interconnect@48000000 (ti,omap4-l4-per): $nodename:0: 'interconnect@48000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260722171840.299303-1-egbostina@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

