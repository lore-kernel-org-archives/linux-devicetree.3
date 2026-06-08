Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5333CBE6B
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927735; cv=none; b=Pi/PEGF5Xo95AH5W4/+//+WuA6X4bWG5nCntOGb2PgKYpTxx2+R4F+yqyJOP1fquVEhE0xrVdewDqy4SxS5WEEF7rJrWX+kmME3GPj+wIbIf6zTaGdEs91VxdLM0p06zwjn0DXipa6fr1txEMTqlcu0mBhfZvZxW44qCmQl5zv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927735; c=relaxed/simple;
	bh=T2LZ9moU4Bq+b9R3olg6MFqL2GZqWF5F2Gy9FZNHugc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ENgh1kBIbN2iUmunvZSWNSsToR6LEn99rs4xd5Avodgjfrt++97dVaZ73nsD6BfSzNT2qj7K9zzgSISSFuznm5TArA6B4azbnP9QG5WFOBLn/Pv+JOs3I/VW2XP5i6hmFrQ22mw9rUrLesr11YjsYQsGhGDAsI49Q9FFdxU5zUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cm6x1PcZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cm6x1PcZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7BD1F00893;
	Mon,  8 Jun 2026 14:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780927734;
	bh=msULPc6GPMvmIjod6jKdmC548qFpO5J192xIwKnCOnk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cm6x1PcZ1begzIUH2K9hdrfSGqH4+bNmGAKeLX2SmNHRz7hXplBjEWjj6GlEsauVm
	 KnWkWdPBJUkNretTyVUmjHCoHxvGRpPuJRaWB2+/pf7x7TBpvCbggadYQ7jrcJX0Yt
	 Pik6ywV3iVEePfCh3bSHHqgO/c4YEMJMEr3T7Hkyb3syT6phD7UoaThO+0iXeYjvE4
	 jv45dpGiF1zCwAcTUg6QJWS4HYSp/GMxcoqELbvhOg4tOK2wvjgFsb+pacgdI7jlEi
	 zLMNsEQt+6MdulF/W9e5sKPvCHIKwroAjgEZntA6YYsbQfktx8fKMOYJlhi20IydQf
	 K2+faRapkkyow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: mfd: syscon: Drop unneeded case for
 syscon + simple-mfd
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v2-2-0203e6c249dc@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v2-2-0203e6c249dc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 14:08:53 +0000
Message-Id: <20260608140853.BD7BD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removing the `minItems: 3` constraint introduces a schema valida=
tion loophole, allowing device trees to use exactly `compatible =3D "syscon=
", "simple-mfd";` without a vendor-specific compatible string.
--

commit 882002de06044bfb3632f58a13384021911573e1
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: mfd: syscon: Drop unneeded case for syscon + simple-mfd

This commit removes the conditional block enforcing the number of compatible
items for devices combining "syscon" and "simple-mfd". The intention was to
remove a permissive list that the author believed was unused because
specific bindings handle their own schemas.

> diff --git a/Documentation/devicetree/bindings/mfd/syscon-common.yaml b/D=
ocumentation/devicetree/bindings/mfd/syscon-common.yaml
> index 315357da146ea..b3462e876622f 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon-common.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
> @@ -46,17 +46,6 @@ required:
>    - reg
> =20
>  allOf:
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            const: simple-mfd
> -    then:
> -      properties:
> -        compatible:
> -          minItems: 3
> -          maxItems: 5

[Severity: Medium]
Does removing this conditional block reintroduce a schema validation loopho=
le?

By removing the minItems requirement for simple-mfd, the compatible array
length constraint falls back to the base minimum of 2 defined earlier in the
file. Since syscon-common.yaml uses additionalProperties: true, device tree
nodes using exactly "syscon", "simple-mfd" without a vendor-specific
compatible string might now silently pass validation.

Are there still undocumented device tree nodes in the kernel
(such as arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts) using exactly this
2-item compatible string that will now bypass validation instead of being
properly flagged as errors?

> -
>    - if:
>        properties:
>          compatible:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-n-dt-bindi=
ngs-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com?part=3D2
