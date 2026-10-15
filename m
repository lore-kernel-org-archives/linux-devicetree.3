Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC1730D410
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049087; cv=none; b=Ul7ZuOud98dK9LyIi9iJrkfqlrrHhvrVIrVVx4Oc9R/6a8kKOFLTfmRozsvnbbpgvB1em7V9umSEJVMd4TMUyGVaLg1VD+U4jm1hN+/LA58ctO5FXXWX3oSmm8B5DhDxRz7y0r2YJD1Jw1WXoutlnPVlcZ1Dm0Sdld67TI9xK7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049087; c=relaxed/simple;
	bh=7aEXW5iF9JrXZ+F5fkgOJTPyNPiMXQLb2dsAod8MjCo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CUi1pT9Gx3LnxV0nBrTpIJzIyKNcakA565GyfhB9Elbm+TUlIy8vM03BpuX9Mmg8axJhxw0E+09K6mqgbB/RIMPUzoI49tLNPgpQnd3r+/TWlo78qzY1+seW5YgeQudVOanN0HUSF3zkSziNOcgmpWpqvi1XSSJEhMAUxdAZ6uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OaAXzFgF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OaAXzFgF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DC01F000C7;
	Thu, 15 Oct 2026 07:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792049080;
	bh=+xelRklAnQuRlWLvvTrJpGYiZf+GEhBjDYw8jtClUjg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OaAXzFgFaCijcQd4FmUkpX377IZ1M39o9TTTYqLOdIpYlRTSARsynyiD3Y2jlcxSb
	 ICyPF67J2Ou+P4e3JZciCaIr0VeRQ9CZi284qplBSL9GVSQAZ5t98wOrBJadtN49tW
	 D2+oq6kIofwo96d0AhGx4uNw1AieN5MbtoUWA3JUU8rvEG533+NZsZCsDJJBUxPw9U
	 YpZ8Ie0DkcbqbuAQ05wEQx/OX7QsXRud5EZ1TC/sOLYI/ZLCcO2RRa7kf0F4qwK4v8
	 UQ2wZWCMT3ilYBH6snb3Nxq/OZjD+184kjP85QoORv+61pf/PnDcxGxzNWCEpkBYuG
	 PFhmhceFUMAhA==
Message-ID: <sashiko-outbox-172404@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/24] dt-bindings: phy: Add ZTE ZX279128S PCIe PHY
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261014072109.1759502-11-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-11-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 07:24:39 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: dt_binding_check reg_format failure in example due to =
missing parent context
- [Low] dt-bindings: phy: Invalid reg property enum constraint
--

commit 7ff99fb8ef3161ab6ed95f85e757575452c473c6
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

dt-bindings: phy: Add ZTE ZX279128S PCIe PHY binding

Add Device Tree binding for the PCIe SerDes PHY found inside the
topcrm block of the ZTE ZX279128S SoC.

> diff --git a/Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy=
.yaml b/Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml
> new file mode 100644
> index 0000000000000..7bfa363294c05
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml

[ ... ]

> +properties:
> +  compatible:
> +    const: zte,zx279128s-pcie-phy
> +
> +  reg:
> +    description: Port index (0 or 1)
> +    items:
> +      - enum: [0, 1]

[Severity: Low]
Will this schema definition for the reg property pass validation?=20

The dt-schema tool translates reg properties into arrays of arrays (matrice=
s).
Enforcing a scalar enum against the array tuple guarantees a schema validat=
ion
failure, as a list cannot equal an integer. Could this be corrected by sett=
ing
maxItems to 1 instead of specifying items with an enum list?

> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phy@0 {
> +        compatible =3D "zte,zx279128s-pcie-phy";
> +        reg =3D <0>;

[Severity: Low]
Could this standalone example trigger a compilation warning during make
dt_binding_check?

Because the phy@0 node is placed at the root level without a parent contain=
er,
dtc applies the default #address-cells =3D <1> and #size-cells =3D <1>. A
size-cells value of 1 requires the reg property to consist of both an addre=
ss
and a length (2 cells in total).

The 1-cell reg property shown here triggers a reg_format warning in dtc,
causing make dt_binding_check to fail as warnings are treated as errors.

Should the example be enclosed in a parent node (such as soc { ... }) that
sets #address-cells =3D <1> and #size-cells =3D <0>?

> +        #phy-cells =3D <0>;
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014072109.1759=
502-1-ghahramani.navid@gmail.com?part=3D10
