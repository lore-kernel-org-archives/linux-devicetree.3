Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5569E3ACEF2
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145798; cv=none; b=GBYPWBnBKdJRvQHMk0IWsZuVz10izZ1WPPCwpf5IpQFWd4X3j/+cTOw0l84pts2nZbGgAeqeANcRt+h6mgcGaCBce+A/rsjU0PpxHVI1UkG0bHfcdD3aID3RqTiIG6TiE9xoNBBFXOBREzcQfmfAvkLv90wG812a4LOOgEFg4BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145798; c=relaxed/simple;
	bh=UcVdLIhVLLocwBPgqgynFiaqHyJaXkQJN7i3kceIwOc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YGP3fiC5t25Hhspab5cQGvtfzObY9rDnbsPor7Wp1mTDkvqNLbpjmn3N72qywUrETMtDQ3o2BqfyRewSF6uUnHSV4vmZz0NZxDMIrj1JbtgMgSFeIMPt4QVr3q6yBDShcGVtOZM1ebWpqkCCxcRIIsm1y9M1dOsfok3BAlz4U6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmTu4kok; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmTu4kok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470BB1F000E9;
	Mon, 31 Aug 2026 03:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788145796;
	bh=7EwDuDpF3GYu2HkvzbD6lNHuPI8ONWk90oN5k6oWETE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OmTu4kokKGWDzwtifGuay5e4rNe6ly0fG//W/oJ/AiLwx1TzSBiJ240Mp2kp1V61y
	 /mAZlnhoy0UYFR4myG4IOWe3c2sMmbPeSRsSw/+DC5p2L4VOhxDPKvHhyYiyW2nZvW
	 Zm9/jml8d0sewmxyV9ZUm7tgSuanPqLVTgbQSD8qPE9RcCrMmBMIqxGb1rn4XjYSvH
	 /xRVYjwpLCLHBvK0dpyffA76dPmvk/tLnZbvpFKoyB5bbpQ9comUeUrFTgQfojaCwy
	 1tDuNpoCD/Dd9Y12zUwBSJhtcV2Ne9OZlVmStKjjK/Wc4WdNxZJMG4rC91sUSkv4dv
	 eGT20pTpCtIlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/8] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260831030147.1500616-2-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
 <20260831030147.1500616-2-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 03:09:55 +0000
Message-Id: <20260831030956.470BB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `#address-cells` and `#size-cells` in the `required` list o=
f conditional blocks for configurations that use child nodes with unit addr=
esses (`eud-path@X`).
--

commit 4ec64fc010ea8502aae975163886af215d1fa042
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing

This commit modifies the EUD binding to model UTMI paths as separate child
nodes (eud-path@X) with their own OF graph, replacing the flattened ports
representation. It introduces the qcom,sm8350-eud compatible for dual-path
topologies and conditionally maintains legacy support for sc7280.

> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/D=
ocumentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> index 84218636c0d8d..c377a77d623cf 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
[ ... ]
> @@ -45,10 +46,88 @@ properties:
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sc7280-eud
> +    then:
> +      oneOf:
> +        - required:
> +            - ports
> +          properties:
> +            eud-path@0: false
> +            eud-path@1: false
> +        - required:
> +            - eud-path@0

[Severity: Low]
Does this configuration need to require #address-cells and #size-cells
for the parent node?

Since the eud-path@0 child node has a unit address, failing to mandate
the cell size properties in this branch allows configurations to omit them,
passing schema validation silently even though the structure is invalid.

> +          properties:
> +            ports: false
> +            eud-path@1: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8350-eud
> +    then:
> +      required:
> +        - eud-path@0
> +        - eud-path@1

[Severity: Low]
Should this branch also explicitly require #address-cells and #size-cells?

Similar to the sc7280 case above, the sm8350 variant strictly requires child
nodes with unit addresses. Without mandating the cell size properties in the
required list, a device tree could miss them and still pass YAML validation.

> +      properties:
> +        ports: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831030147.1500=
616-1-elson.serrao@oss.qualcomm.com?part=3D1
