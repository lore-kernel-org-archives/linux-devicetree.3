Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C892E7BD6
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918969; cv=none; b=VqV5Ctn6hYSAOh5Qi8/q3wrVZ199QJqKpzpoN/KFwG3qKYIA13RxxAs0sPxobrlEGYTH1JhPt7gT9EuiA69TTnJem935S5AN8gN1I7pDFAGQkTY2c7ynHhar0IG0zTBYopqKi852lnG4zOuGdlOfKkggu8iO5bnPVkcWHfJ7aVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918969; c=relaxed/simple;
	bh=/YPh8QHvkDFhlac8viK+z/RES1tpfK3IFx9HFac9pV4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GeLOTKwJaSKQu1hx8giDg5kwOy0CuFs7zuuvsgXW+MhzWJSs8OKTC0/UmM/0SnjxomkxspZcz/U/FTDi7uzxp1mrsxTt8z07NcRxBv17C43MddVWiuZ+V8JkQd/xXVGKQNeOkr2GkyTJKo/IEgt+TxhgmHBW81c2FPpoivLPwj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kA7e43Sb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kA7e43Sb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4911F000E9;
	Fri, 24 Jul 2026 18:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784918968;
	bh=wH1lx4dq4fMl5Cx6lpXCmoDm18QXjSGvIXyErpjZ5jQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kA7e43SbvWiU/DT5qpAqIXwtBkeqcMGJ2tTOsK4hFofA24zDWT6M8w443IUe9gDIW
	 XZaFT8ltthH4iz1Ra++9B6gnUQZN+/3rF0LGLJi8P03nD2KfuZ2Olyxt1CpxTbb9nP
	 pxMH9Q9tE6eeB8cQ8JmTDZmiwqB+9QvQP4S0rsatdCcW7NZB0S6qpQkMz6O/xdsudH
	 Jf9lmsHsc4jwzA1z7m96mGfFdIjWmccMu8tTpIRCNQxQPM8i+tylhho8mh0AwivRpg
	 WAbNnXJRPGFQ9ZknKWuIPMP992AvziFFutZwNrzEXBmEfhFcprT4/mi0qLo2v3XLg8
	 7dj7GERnIqj7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: airoha: Add PHY binding for
 Serdes port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724184304.192962-2-ansuelsmth@gmail.com>
References: <20260724184304.192962-1-ansuelsmth@gmail.com>
 <20260724184304.192962-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 18:49:27 +0000
Message-Id: <20260724184928.2C4911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch introduces PHY provider capabilities for the `airoha,e=
n7581-scu` variant by adding the `#phy-cells` property, but fails to make i=
t a required property for its compatible string and does not update the exa=
mple.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: clock: airoha: Add PHY binding for =
Serdes port ---
commit 5719603a01527297dc730214337f813a27ac01a3
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: clock: airoha: Add PHY binding for Serdes port

This commit introduces a #phy-cells property for the airoha,en7581-scu
compatible string to support Serdes port selection. It also defines the
available Serdes ports in a new dt-bindings header file.

> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.ya=
ml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index eb24a5687639e..fc37786ac7ed8 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
[ ... ]
>    - if:
>        properties:
>          compatible:
> -          enum:
> -            - airoha,en7581-scu
> -            - econet,en751221-scu
> +          const: airoha,en7581-scu
>      then:
>        properties:
>          reg:

[Severity: Medium]
Should #phy-cells be added to a required list in this conditional block?

If the property is omitted for the airoha,en7581-scu hardware, device trees
will silently pass schema validation despite being incomplete, which can le=
ad
to runtime failures when dependent drivers attempt to use the PHY functiona=
lity.

Additionally, does the airoha,en7581-scu example further down in the file n=
eed
to be updated with #phy-cells =3D <1>; to satisfy validation once the prope=
rty
is required?

Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml:examples
      scuclk: clock-controller@1fb00000 {
        compatible =3D "airoha,en7581-scu";
        reg =3D <0x0 0x1fb00000 0x0 0x970>;
              #clock-cells =3D <1>;
              #reset-cells =3D <1>;
      };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724184304.1929=
62-1-ansuelsmth@gmail.com?part=3D1
