Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4453A2BEFEB
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122552; cv=none; b=Cgn2hoIubSgGb/OMHho3IwLN0MsFCIteBxe/ghp0kjV0bjyTJyRwQIYMeIz0SkVryW1oex02cAtibhHfp/2u1XpxJYruT15T0DuIqcyDhAdO02pI+ZQndghFQdl1J9QwwcuaMv/1ZieVz+OfSEGBSbgVg1Trxe1PHdiTWkCPMfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122552; c=relaxed/simple;
	bh=0MngHMadLnBhsaxyfscdVsSyyc+f3pE7XDXnfKxKl3M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cEruLVDKVAaWN+2jvHLOE35gxq5q0m1TnICVg2UrqZlCJQh3ANpGj+TC1j4mvHHmu++F7Ama7EF4vmgTwItxc8I9J1lQUN3Tl8XAcA9yW3+2mKd0+VWZGtkKEpzDBbtkZiXtcxRzXBnDO0BGbnkycsmBrgkDxi9KnjkEtomz4og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F00U7Z0s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F00U7Z0s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7AF1F000E9;
	Wed, 15 Jul 2026 13:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784122550;
	bh=sijvTncilwrcraimBsnS09tT7sZ3tiESdDbOH+qGC0U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F00U7Z0s2wTUqE2auhMnwTOvoBrLmukalg+ddQpB5yqbDSJ8YQC91fjd9s/nHfEDM
	 uddVl30Zx5xdbiKahkT29hpAAM1b/iJrboPX4mvpL1C2/TfEDWAaFSfi7mJsJ4WLAV
	 kHEl/vpwpsySy+1DJtW8zyj6/kFe0MRFVz8iN+UChSYbXhYA0LVDRfaUKzbTG75PO8
	 D6CC6+B9H/YUMZfpoabVPeimFRmQX7bTWkfAsJnp5VTBjcJtUXKjue+yBgHtS1cXRJ
	 vqUuGmDx8IWVHcEJOzqWGYyOAF/Pe3E1yVTdBIbCYr0W8sMQWIuDbQSkjTzSqFe4zz
	 izEe1Uma2RRFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl:
 qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ravi Hothi" <ravi.hothi@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260715132150.1322663-2-ravi.hothi@oss.qualcomm.com>
References: <20260715132150.1322663-1-ravi.hothi@oss.qualcomm.com>
 <20260715132150.1322663-2-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 13:35:50 +0000
Message-Id: <20260715133550.AE7AF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Schema validation failure for Eliza compatible string due to sca=
lar `const` comparison against an array.
--

--- Patch [1]: [PATCH v3 1/2] dt-bindings: pinctrl: qcom,milos-lpass-lpi-pi=
nctrl: Add Eliza pinctrl ---
commit 8578b655d5c47b4337e1837fe83f459a7fed7346
Author: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl

This commit documents the compatible string for the Qualcomm Eliza SoC LPASS
LPI pin controller. It also updates the schema to reflect that Eliza only
has a single reg entry because it uses a different slew rate register layou=
t.

> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-l=
pi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpas=
s-lpi-pinctrl.yaml
> index 73e84f1885911..86c1da0f577c9 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinc=
trl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinc=
trl.yaml

[ ... ]

> @@ -74,6 +77,19 @@ $defs:
>  allOf:
>    - $ref: qcom,lpass-lpi-common.yaml#
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          const: qcom,eliza-lpass-lpi-pinctrl

[Severity: Medium]
Since the compatible property is evaluated as an array in device tree
schemas, will this scalar const comparison always evaluate to false?

It appears this would cause the validation tool to incorrectly take the else
branch, enforcing minItems: 2 on the reg property even for valid Eliza
device trees.

Should this be using contains: const: instead to correctly match the array?

> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +    else:
> +      properties:
> +        reg:
> +          minItems: 2

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715132150.1322=
663-1-ravi.hothi@oss.qualcomm.com?part=3D1
