Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF5013AD26
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778785400; cv=none; b=IPN2iBL2sZgaoNvE/HRojI4RO3YILtS7SkPksUMuB4cP1/oC5HUwQsYI99bqxMk/fkS9g/xx5YClvHD8V4ZnKmY0ALws5Ihb1Jm00qSQrqJCL8LPZSvrrnjyKglHf/J7hk+jobtIFTX8/2FBUz9CfO8W4VhFC4yjNai+7znuADs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778785400; c=relaxed/simple;
	bh=cKild/jXaFMZN3h5vHY/nUpKV5BMyNGVFr7w8vhgH1I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d+t4xMv6R6fvXYbHVa8ZKf4kE1yWJwxDqAFbziwE71VdLcyXBnpllHrNhYRh9uscMwnaiRSkC8fxo7Ht+7hZq6YG3esqjHtXYfs5hAGKG72V+3qVM6KVh41+GjM5JIvU2G3lmqVBzHMkPX1jr8mEpmooe2eCsHientpxo2yoi6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRXbFgf0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRXbFgf0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB0BC2BCB3;
	Thu, 14 May 2026 19:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778785400;
	bh=cKild/jXaFMZN3h5vHY/nUpKV5BMyNGVFr7w8vhgH1I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=dRXbFgf0Tl3X85Cq7ZNCmFlv/UFhCz7rHCeYBjL7zJvFwtKC0WPhYjXxqpTJgsnd6
	 r2ruZSlbHE8iMT+kGii0pBrcuGmFd0OcVSQhlR9sLci61hemLtspVaQ7VfBvp+khK7
	 zGErdvbeKW9uz8IPu33VOFjWNkBr2H7lwtefcMO6uP7tZCkO0w0mMGuJJJ0wcBkbTH
	 Aa6RsR74am9WwbyEdX9felALqm0xkxHohXWAUQeZHuXai6RZCbnP1V6XBVe6QQHKJi
	 3E0f5W+vNTrBUQjhlGakFlxEU1pNuUpHFuS/NcTV61nC1lZwRYyW0k+g8JhVEyFZ05
	 Fy1ypm4CUmtiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260514-rcar-du-dsc-v1-2-d65f7a9e9841@ideasonboard.com>
References: <20260514-rcar-du-dsc-v1-2-d65f7a9e9841@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 19:03:19 +0000
Message-Id: <20260514190320.1FB0BC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree example will fail `dt_binding_check` because the `r=
eg` property uses 4 cells without a parent node specifying `#address-cells =
=3D <2>` and `#size-cells =3D <2>`.
--

commit 6a7e60ed22b69bbc15e77243a1b4bdb0d60396df
Author: Marek Vasut <marek.vasut+renesas@mailbox.org>

dt-bindings: display: bridge: Document Renesas R-Car V4H DSC bindings

This commit adds the device tree binding documentation for the VESA DSC
Display Stream Compression encoder embedded in the Renesas R-Car V4H SoC.

> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsc=
.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
> new file mode 100644
> index 0000000000000..91245beb67d7b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a779g0-sysc.h>
> +
> +    dsc@feb8d000 {
> +        compatible =3D "renesas,r8a779g0-dsc";
> +        reg =3D <0 0xfeb8d000 0 0x400>;

Does this introduce a regression during dt_binding_check? By default, the
schema tooling wraps examples in a root node with #address-cells =3D <1> and
#size-cells =3D <1>.

Because the reg property uses 4 cells, it will be parsed as two items, which
violates the maxItems: 1 constraint defined earlier in the binding. Wrapping
the example in a parent node that specifies #address-cells =3D <2> and
#size-cells =3D <2> should resolve this.

> +        interrupts =3D <GIC_SPI 559 IRQ_TYPE_LEVEL_HIGH>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-rcar-du-ds=
c-v1-0-d65f7a9e9841@ideasonboard.com?part=3D2
