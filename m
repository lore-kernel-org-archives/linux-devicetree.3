Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CC0238C1A
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 02:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789956284; cv=none; b=I0otRQqgZJAUTivaSPc6rw5QO+/vhmryDOMa3E/uN1bnLEPOo2xyGTYUaeRBq2QqC11sYXoxGf2h4JwQlu4wLn9V2N1WjXQ3NjfVafwhFchrDTovsPSBN9wfRQkWBzKvYcas7hfhCvKy2mjkepQuvmpU7e0hfGdFvCSsBGAjDNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789956284; c=relaxed/simple;
	bh=v16ZcRvyHhcxrtDwE79l5n6a5zokQndkjf2kAIz3Dds=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dt+WgEJNZWRfKv4y0wMbP+W23aNweWdma/ociWe+tS10mVVlspfnWf8qwTtzY4Dv8e30eFE7xJn5dIamWlsCdCIGZ+H8PWcRLAnk//KwRaUjWmFxGAjfno228CDdExpI3jLkn+WIp4m3qbQXQX9OntYSjCh7jk4U4m1ulU7G2J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=macpueRX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="macpueRX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3171F000FF;
	Mon, 21 Sep 2026 02:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789956282;
	bh=YKKNzAD165HDn/SMisTcXRQwXi5pI4YlZXd+yJxAx4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=macpueRXv3L1115EUjZTU8YwS/9wHFU3suYoFqshj+446OPdk6T/+sB94p2HQroYl
	 B9H6Nfnoi/0BIhNkKSml5q/ONxdkTZ4RH3VZ7gvi1rPF5dPssss+fhuoceO/18n02i
	 NjG3dIbgE8joPJccsngErmhLVSFQ1E5iEiWtDWmldkY8nM/chel82R1/PJFid6kZDE
	 QI3HGMUD6M9/nV9tWKv93wicbEkMbILpw4yNeyQwPvLOL3ZEqs7kpKSxWvRmd65dhq
	 i+AhF2bXiWqfbUX/HaEu8TzUFNgSYCYUl4iH1E9g9HdKNeIryswsKPyhNBkpBuJRZq
	 2ZVPS3ZMphV3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: convert IBM NDFC binding to YAML
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921015719.1045365-1-rosenp@gmail.com>
References: <20260921015719.1045365-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 02:04:41 +0000
Message-Id: <20260921020442.2F3171F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] mtd: missing eiger.dts update breaks dtbs_check
- [Low] dt-bindings: unit address mismatch in YAML example
--

commit ef4d9a61ebafb45b3d3ff44afa9f87f46f05cad7
Author: Rosen Penev <rosenp@gmail.com>

dt-bindings: mtd: convert IBM NDFC binding to YAML

The NDFC NAND flash controller was only described in a legacy text file,
so dtbs_check reported a failure to match any schema for the ndfc nodes
of several device trees. This patch converts the binding to YAML format
and describes the node's properties.

> eiger's ndfc node omits reg (supplied by U-Boot), so add a placeholder
> there to satisfy the newly required property, matching the flash@0,0
> node in the same file.

[Severity: Medium]
Since the new ibm,ndfc.yaml makes the reg property required, running
make dtbs_check on PowerPC architectures will fail for eiger.dts because
the node omits it.

The commit message mentions adding a placeholder to eiger.dts, but the
patch entirely omits any modification to arch/powerpc/boot/dts/eiger.dts.
Could the eiger.dts update have been accidentally dropped from this patch?

> diff --git a/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml b/Docume=
ntation/devicetree/bindings/mtd/ibm,ndfc.yaml
> new file mode 100644
> index 0000000000000..96e25771a8fe9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml

[ ... ]

> +                partition@0 {
> +                    label =3D "kernel";
> +                    reg =3D <0x00000000 0x00200000>;
> +                };
> +                partition@200000 {
> +                    label =3D "root";
> +                    reg =3D <0x00000000 0x03e00000>;

[Severity: Low]
Will this mismatched unit address cause a simple_bus_reg warning?

In the example, partition@200000 defines reg =3D <0x00000000 0x03e00000>.
The address 0x00000000 does not match the unit address 200000 (which was
correctly 0x00200000 in the old text bindings). Running validation on the
newly added YAML schema might fail here.

> +                };
> +            };
> +        };
> +    };
> +...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921015719.1045=
365-1-rosenp@gmail.com?part=3D1
