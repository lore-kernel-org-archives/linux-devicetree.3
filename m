Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CE12F12AE
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781642065; cv=none; b=nTVwNJPGCzMeXQyoANViLacTEJzQFSHbiXLzJJLz+kIJZ5XsSiAGP6bI4YvQCctHwA984l+5tqH37/FxXKjcVDygaQ9tNye9EtmStzhD9u+MN189WllYaBi4aCfyZu9B3sZoCU3yWusCswoeViLbXwiNRNY+m65rrYm4BsjPcko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781642065; c=relaxed/simple;
	bh=qGW0zoNcT/QsZWJXFDeoG6pOFbVbxHREYXtK/se4X0Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tld4fD90AczmMU3fUs8m4A2xMtXbKqmh5xHfsDgJTvwxgJ67xGIgCIpS94qgwDlpNPv6g9X+d0NYhV7zcSHnzAO/XyOomX9/dSOXlb7pssDA7xDlfSwi0yNz0R5Ou5vS9kYKzw3oR8r8hSXmWCDRjueBflLNjyFB6lnmGlbaWyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqqlOHqD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqqlOHqD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B401F000E9;
	Tue, 16 Jun 2026 20:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781642064;
	bh=BUVY+3Cv4QLd7k+SP3vEzKSD1Y065AnE68HbL9DkPCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gqqlOHqD+gLEMSipkawS6nkZrt8uvALZ6Ak2s9YcYOuVNthWLE254N5rbm9R+j5i/
	 zr8DsW2pon9wVEU8BtZAZi/rih54pvXTFf8bYYMK/IrN5Z7P1GSa9LSKJEa06l7jWi
	 stgfqf76lb1YYuEC/q66duCWLa1WzGGJTVR7iMgHyzpqXcipEaPCBRS7upx4YsZG9u
	 i8QV1duyPUEjINWA3vinAqY4pxpmaV7VVQEJq+wevoOGNDdIijjMw91BITCZTngzYi
	 L6g62UJh1w4z9XdB+mynqQm3EMupu2Fey/8cUexF3vNUMFDYiQmfieycj9YHm4pUme
	 +K9eKQgU26cyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP
 clock and reset bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260616-zx29clk-v4-3-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-3-ca994bd22e9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 20:34:23 +0000
Message-Id: <20260616203424.02B401F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree example contains undefined phandle references (`&os=
c26m`, `&osc32k`, `&topclk`), which will cause `dtc` and `make dt_binding_c=
heck` to fail with a compilation error.
--

commit 58efa7efa64df52a18f1832747a61ff0688b9833
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset bindings

This commit adds device tree bindings for the ZTE zx297520v3 SoC LSP
clock and reset controller. It introduces the YAML schema documenting
the required properties and provides the corresponding clock and reset
macros in a new header file.

> diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcl=
k.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspclk.yaml
> new file mode 100644
> index 0000000000000..096295edb6e26
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspclk.yaml
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
> +
> +    matrixclk: clock-controller@1306000 {
> +        compatible =3D "zte,zx297520v3-matrixclk", "syscon";
> +        reg =3D <0x01306000 0x400>;
> +        clocks =3D <&osc26m>, <&osc32k>,
> +                 <&topclk ZX297520V3_MPLL>, <&topclk ZX297520V3_MPLL_D2>,

[Severity: Low]
Will this cause a dtc compilation failure during make dt_binding_check?

The phandles &osc26m, &osc32k, and &topclk do not appear to be defined
as nodes anywhere within this example block. Does this example need dummy
nodes defined for these clocks so the labels can resolve and the example
can compile successfully?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-zx29clk-v4=
-0-ca994bd22e9d@gmail.com?part=3D3
