Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AA43C0603
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789542919; cv=none; b=T2iyM8JjVkvHF5Bx+5kCgTzJodcGppGMXMFiASczjPXoSDgtSKpYhEd+SiIvFjEqs5kf97IUm5QX/pNag4PnOZXPfYik9TF+V/f4OrkUqhmZCbLubBEsXPp5y7+4H6avm8RclKNZKNA4uuEP3p2RKb0D0l6qRa0BxVQtsF/o2kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789542919; c=relaxed/simple;
	bh=LP0HKaRBY2npP0oX3EtyhFE7qdd+uTk5EJs7NTSrSug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JDL73BFEFkmab+wi39+s0dIDKpafH53c6NclP7bT+koQ9bYrrI62DANJ1i4v97DaZLB4i4jKG8jUTVIk1zWawycgA+v1syeQFoZSXy1ieikboyOzTzf9cAJBJg//ZrJE/J2g1krbWC5jcq2ITBhRWgZbacUmMQ7lH4zsfEwHHRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpuqduFD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpuqduFD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E7B1F000FF;
	Wed, 16 Sep 2026 07:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789542918;
	bh=PPa3o/HX9BFw0xoyZ7N3iM7Gp8/nKCepFKTkbn+SZIw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GpuqduFDugJ2lQtPvl2VLVos1JI/UeXRAOwhsUYDTbO5Vw4jl3Vyx3wV4Cl18nsK7
	 QH30nujhfiZfOlgJjv16zO3O7bwltB4JhUtbUSsD7K8bZ9u0jCG4xQKu/c6S5utBlW
	 Pmd/GHE8TDjF3PgzRg2xQ18xL9dzDDsSWC62FPrKjWxO7DnKP6jV9AwqrzS7u5tvOP
	 GYfsf+ZbC65FA786d5JxvYz9zt9JO//g3Tos8ujwSuQaivqsVAAY1AmDkgI7Hg01jy
	 8NRSZG6baFtvz4IPOfefUII9IWtCN+ABqpbf65QyBVficxYdm9CBcFcUEf0W8cpQOM
	 HlEJEz6M5I68w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 3/8] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, robh@kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260916070728.1088801-4-lakshay.piplani@nxp.com>
References: <20260916070728.1088801-1-lakshay.piplani@nxp.com>
 <20260916070728.1088801-4-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 07:15:17 +0000
Message-Id: <20260916071517.A5E7B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing compatible in the required properties list
--

commit 99e5e0734a8e4028d9b6a9430b09604b1fe931b7
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support

This commit adds device tree bindings for the NXP P3H2x4x multiport I3C
hub family. These devices connect to a host via I3C/I2C/SMBus and allow
communication with multiple downstream peripherals.

> diff --git a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml b/Doc=
umentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> new file mode 100644
> index 0000000000000..09508a7bcbeb6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
[ ... ]
> +      ldo-tpg1:
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +required:
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'

[Severity: Low]
Does this list incorrectly omit the compatible property?

Device tree nodes referenced directly via a schema $ref might incorrectly
pass validation if they omit the compatible property, as the schema does
not enforce its presence. If a parent schema uses $ref to include this
schema for a child node, and the child node lacks a compatible string,
validation would silently succeed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916070728.1088=
801-1-lakshay.piplani@nxp.com?part=3D3
