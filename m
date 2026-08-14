Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073522D061D
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786697928; cv=none; b=SlupYJUM0PSbEMJjQ+MDf+Q2WAcoJ8KDaM8ijPYSxnpzmi4DsMkzAzeDbDDbvTiPp+Ckfok/oWLtWkATi8//gkQD6x8ShMPey3QApVzwlnqs7b9F8NSfMEyuLnmTkgF/bRkQdqZ3AvTzkeF1lqIjDOl21QUTQggiLd249IJ3hqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786697928; c=relaxed/simple;
	bh=Pw4/nQLeU6TnGkK+XAiy3XZ0cZgH6s/2O7axM85M5ak=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BY8TUSu/mkLhHROdrbcEGs9BQhj5/DZIw2Dz/lJbJYLCpvKPKPDBjygxWe6KKFmmRhEDbl2G+N4jZ6jM8HDj0QhViUj7KwZw7Rd6zTYAQ9AI/DVlyxpQDTd2aO8zIUpvIIRHq8Uy/WAsRM/0AmSy/ZZ3hQjy/Rum1WRnWSqZRns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOBdPrRy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOBdPrRy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B61D1F000E9;
	Fri, 14 Aug 2026 08:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786697926;
	bh=+J3feyES9UU0Xkil/ML/ZbDrUZ+0og+OMRn8FtYlOmU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JOBdPrRyCESkposQQIeVyMiIaIGxCBsKZxDLDPavsPCt4xkEWv4KPH1JHw30nx1nj
	 HpknJFfyvoYCYhTGbFPmQNYZdP58ZABozvFMdvPgLDRMkmMCkIzgfFyCB6hK4Ia5Th
	 nYsimgh2kfaTM7du+eCNA2hM4lTyXCQE8q0fBXvdBRMdINC/iJL8FfT5TKJuA2lEfN
	 KnkVjzUfQK+AUSi3ZOWU1paF9rVrJah4YRAegkopIHdAwBJZNuBi1XehWWu6EQk/aM
	 2UxMHiqHgPA7nKvJPpsh3/x2CSBK2DAnoIJ43rWrYEqks4YBswaqogvu9b0gUZebr/
	 uedyp0kFx7p1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 1/3] dt-bindings: net: wiznet,w5100: convert
 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arthur Crepin Leblond" <arthur@marmottus.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260813-wiznet-link-gpio-v5-1-ac8046f24413@marmottus.net>
References: <20260813-wiznet-link-gpio-v5-0-ac8046f24413@marmottus.net>
 <20260813-wiznet-link-gpio-v5-1-ac8046f24413@marmottus.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 08:58:45 +0000
Message-Id: <20260814085846.0B61D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The YAML device tree example will fail compilation during `make dt_=
binding_check` due to unresolved phandles (`<&eth1_pins>` and `<&gpio>`).
--

--- Patch [1]: [PATCH net-next v5 1/3] dt-bindings: net: wiznet,w5100: conv=
ert to DT schema ---
commit fcc3d575c269eac63488595e1b5b27fd36f552f7
Author: Arthur Crepin Leblond <arthur@marmottus.net>

dt-bindings: net: wiznet,w5100: convert to DT schema

Convert the Wiznet w5x00 SPI Ethernet controller binding from
plain text to DT schema.

> diff --git a/Documentation/devicetree/bindings/net/wiznet,w5100.yaml b/Do=
cumentation/devicetree/bindings/net/wiznet,w5100.yaml
> new file mode 100644
> index 0000000000000..217f301db182b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wiznet,w5100.yaml

[ ... ]

> +examples:
> +  - |
> +    /* Example (for Raspberry Pi with pin control stuff for GPIO irq) */
> +
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        ethernet@0 {
> +            compatible =3D "wiznet,w5500";
> +            reg =3D <0>;
> +            pinctrl-names =3D "default";
> +            pinctrl-0 =3D <&eth1_pins>;
> +            interrupt-parent =3D <&gpio>;

[Severity: Low]
Will this example fail compilation during make dt_binding_check due to
unresolved phandles? It looks like &eth1_pins and &gpio are referenced
here, but their node definitions were not carried over from the original
text binding.

> +            interrupts =3D <25 IRQ_TYPE_EDGE_FALLING>;
> +            spi-max-frequency =3D <30000000>;
> +            local-mac-address =3D [ a0 b0 c0 d0 e0 f0 ];
> +        };
> +    };
> +...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-wiznet-lin=
k-gpio-v5-0-ac8046f24413@marmottus.net?part=3D1
