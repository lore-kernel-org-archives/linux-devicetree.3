Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB777282F25
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 17:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779990046; cv=none; b=ebpy3F6uIhfjfvnNjMR/CbbXl3ZHKrdIYRVwEzGS2DBAHzLDj51vTfykkmUqjAQQzao3Z7MxFddI/DrjQpKWwn/5F/97TDUvT0ZtVy6XX0lIUVqMYUO+iRZmx5k8OYIt289VGElCaQVDyXY9zMOvDv06W2HcZRY/bMvc9YlfjJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779990046; c=relaxed/simple;
	bh=fN/BTKxQWa5C+TX3jhbG9qeuPiaN2yEJNY/PDqq6o6Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SskL18TmkmR0V3kYet+qIsNl323fqiwY2tipqtjGe5NWNWzhcIJJXATEGc+oJ6EUJKzJphi9EVMjRWgtKzyomfOs+lc2y7Jx/1j/vaPiUQifcao3VuTVerJtxcCttlhC3UJAcHbU3Pv15LwJrPJzEnXZADfoHVIcBm31rCWHlvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NAgH5qOc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NAgH5qOc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE8A1F000E9;
	Thu, 28 May 2026 17:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779990045;
	bh=BwNOb92YHl3crDPJMDHmEU2HrEqk3CyfGTDAqLIlKYY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NAgH5qOckpzCWHjodGaX3PXwM4pFsOZXRh0mEvvBH+a8m2GzuHxHVH2fuvutDwAcw
	 O8xNOS0w4DETiwOL1XzndL0MNNn2W/7GthalrHAG0bzmWkL9hJeT5OjLgHNEYdxJw2
	 9bhQX98d+lufHWVD/NHKEiR7TU+Q+Ka0xn/6pi69X2IeB6HHMWLW6PvnCo2yNUYGXL
	 tW1f2APCJUPpk2qoG3Isqs0IUGCPSSSsxGYkTOKdCeOtETrrrrmHKD2XsRB2gkjJQ1
	 C7plIF1ebGgSL0vETqIlg7NuGRmFqiWN/WXlUjus8uYH4cM/O3dJQTEoQ4V+dW3xvl
	 kE8IXt7qAqU0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH phy-next 01/13] dt-bindings: phy: lynx-10g: initial
 document
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com, vkoul@kernel.org
In-Reply-To: <20260528172404.733196-2-vladimir.oltean@nxp.com>
References: <20260528172404.733196-2-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 17:40:44 +0000
Message-Id: <20260528174044.EBE8A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Invalid JSON Schema syntax for the `reg` property constraint.
--

commit e219405276839837989c30627d109ff39c15e361
Author: Vladimir Oltean <vladimir.oltean@nxp.com>

dt-bindings: phy: lynx-10g: initial document

This commit adds a new device tree binding schema for the 10G Lynx SerDes.
It defines the register map constraints and allows flexibility for the
#phy-cells property.

> diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Do=
cumentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> new file mode 100644
> index 0000000000000..993f076bba4e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
[ ... ]
> patternProperties:
>   "^phy@[0-7]$":
>     type: object
>     description: SerDes lane (single RX/TX differential pair)
>=20
>     properties:
>       reg:
>         minimum: 0
>         maximum: 7

[Severity: Low]
Will this cause a meta-schema validation error during make dt_binding_check?

The reg property is parsed as an array type by dt-schema. Applying minimum
and maximum directly to an array property is invalid in JSON Schema, as tho=
se
keywords are only applicable to numeric types.

Should these constraints be wrapped inside an items list?

[ ... ]
> allOf:
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - fsl,ls1028a-serdes
>               - fsl,ls1046a-serdes1
>               - fsl,ls1046a-serdes2
>               - fsl,ls1088a-serdes1
>               - fsl,ls1088a-serdes2
>     then:
>       patternProperties:
>         "^phy@[0-7]$":
>           properties:
>             reg:
>               minimum: 0
>               maximum: 3

[Severity: Low]
Could the same meta-schema validation issue occur here?=20

Since reg is an array, perhaps this constraint would be better enforced by
rejecting invalid unit addresses in the then clause entirely, for example,
by setting "^phy@[4-7]$": false?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528172404.7331=
96-1-vladimir.oltean@nxp.com?part=3D1
