Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D9B445ADD
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 18:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754534; cv=none; b=ldbY1qv7Zi+p3t49wGn4gBRPF5C18KPqJSqiw51CldQz/mi81+IkTv2sXJTSWBF9wBElOMwCpGewn3aHCUYK/LfLkdPckfbLV3SSqZcjxozOa2WAvSmPZY1bt8hZdQm6JNHZJ95X9RV9USJdJ6iul5wsrIIMbHZUb7ajzcm54yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754534; c=relaxed/simple;
	bh=5DC/PGTyQh++nRiYa95j8LoWPmmoPRjMmUPS9SI3KDM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ew7mxTFnCAeLJa3sW4EPzRXSJYH3dosQEXfGmWJ1/jW0cMqRF2YHeDFC/I+jBQVH8XGDsgiLweXKtpWulk2oRYDHuhjkiiBYby5yDn3KHGmrMaZyjO05McyjWFmu7/f14T7zZGgSzOiG1zZfEl46QKhzmeUiIbZN3wgmEmhGnw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXiblg9i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXiblg9i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E901F000FF;
	Fri, 18 Sep 2026 18:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789754532;
	bh=MIJDZ+cNcMBagRDBy1aKvcx6Qyva/8SUjMr7VxYnqJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nXiblg9iR6dgU9sqMlXRSpax0Z7ZDH24G2bALH/YKRmEe7ME/sUIDqrqs1068t7LC
	 OzrXVRHD2h9OXLZptff1w4odyhHlmhmD48Fwu1iFl7rTwZQht+Z1YJMlS3oCVQpve/
	 kSaxOwspuPVOT/KCqJXRarMR/O89260JMdgVcd2apSRlrK7lQTRVMxocCJ+sZWtB8W
	 11FVpHfIaNo33WgslBfXKTc97KzGq5FB+vCcjrN9xcrGFVMVS5WovsIdjaIdJtp/vn
	 KCj3lgpBxc8yPPuqUP+3b1vH6A0LyJ0BuL7+rUWNTo+XFKkdQ+rn/eVamShN9creom
	 KFFiQEv66qxFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: iio: adc: Add dt binding to xlnx,xadc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Omer PALA" <palaomer100@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918174809.17502-1-palaomer100@gmail.com>
References: <20260918145804.26957-1-palaomer100@gmail.com>
 <20260918174809.17502-1-palaomer100@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 18:02:12 +0000
Message-Id: <20260918180212.78E901F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: iio: conflicting constraints when xlnx,external-mux is=
 omitted
--

commit 650a4d99eb23987562466c53ef3d4d648db29eba
Author: Omer PALA <palaomer100@gmail.com>

dt-bindings: iio: adc: Add dt binding to xlnx,xadc

Add yaml devicetree binding for xlnx,zynq-xadc-1.00.a,
xlnx,axi-xadc-1.00.a and xlnx,system-management-wiz-1.3 from
xilinx-xadc.txt file.

> diff --git a/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml b/D=
ocumentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
> new file mode 100644
> index 0000000000000..f9b717c297158
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        xlnx,external-mux:
> +          const: none
> +    then:
> +      properties:
> +        xlnx,external-mux-channel: false
> +
> +  - if:
> +      properties:
> +        xlnx,external-mux:
> +          const: single

[Severity: Low]
Is there a potential conflict here if the xlnx,external-mux property is
omitted?

Looking at JSON schema semantics, missing properties evaluate to true when
checked against a const. Because the if block doesn't specify
required: [xlnx,external-mux], all three of the conditional branches (none,
single, and dual) might trigger simultaneously if a valid device tree
omits the property.

> +    then:
> +      properties:
> +        xlnx,external-mux-channel:
> +          minimum: 0
> +          maximum: 16
> +      required:
> +        - xlnx,external-mux-channel

[Severity: Low]
When the xlnx,external-mux property is omitted, will this 'then' block
trigger alongside the 'none' block?

If both trigger, this block explicitly requires xlnx,external-mux-channel
while the 'none' block simultaneously forbids it. This could cause valid
device trees that rely on the default value to fail dtbs_check validation.

Should these 'if' blocks include a required list for the xlnx,external-mux
property to prevent them from evaluating to true when the property is
missing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918174809.1750=
2-1-palaomer100@gmail.com?part=3D1
