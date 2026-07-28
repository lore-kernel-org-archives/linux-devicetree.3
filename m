Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14011FC8
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785202282; cv=none; b=Jox+ze8UqD6M4WyL6ZglwpAmj4AXkAzWpiODQOd47G0uqgzOU6LJTPBN3FAEyk3NbgFckCHLUYGQ7UnN6Z+EU9FgAsDp2/e3D1EUzqPzSGtmr+9ONf9ts3TTmD7aTe1om5hHfQoJ58StrZ5MRf5MDqxTsmQnn+gyuG12Al9kzew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785202282; c=relaxed/simple;
	bh=n39o3XRWL3tGbGGnjZJZDi0J7NDdhb5jzDt19PRefo8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VtpD3rTlfux5CN2fMH1odFADXQHIvR+F6RPq2zTOuPebzNQaVa2IsvM4yvIGG8xU2IxwyYmyBHDI2uPUzE47rIaGipl/iUnsmL7qGP/UVWt3eUhOVqFUF051FshJcSYH2MklmSCaEgJwak6uD5n7qAqSLB/vJhDHT/fJnq2JkWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/A/aEI3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/A/aEI3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 063761F000E9;
	Tue, 28 Jul 2026 01:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785202281;
	bh=KnjYOjpovqJwmANwWKtQ6KuLARPrTd5brORaEbJwbug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F/A/aEI3cyU8jKXQwQj50ZbP1xRIocCIZ6BSfB9blLQswMDbbC9hGi/hqHRa2jqZi
	 Tg13xf4WvqAIU+Wp6WTVtSkCSqWPHD76UEZ0heEa7BWo7rhRC4spE6EwzFOAzpu8/p
	 oAgd/EfmPL81roDC2wf0WRDV1Qg8oHOH+C1G2TcwL14/ye4N8IckYSpE0QAK9e9+ZK
	 eZWwicL3UxhjnOCI0fafitlIqz2XanXXqOxHP761dkIn+3KxbkuUT2QEnUkfJDk4+2
	 P4msPZxXDNtjzO83A2l59fecjtGI3LUmw3Kb99VdKIDgROsnkfZt7z5gSGJsWrEX5M
	 UlJImb76XFivQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car
 Gen5 DWC3 xHCI USB controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260728011656.465040-1-marek.vasut+renesas@mailbox.org>
References: <20260728011656.465040-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 01:31:20 +0000
Message-Id: <20260728013121.063761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree binding example uses a deprecated compatible string=
 'synopsys,dwc3' for the child DWC3 node.
--

--- Patch [1]: [PATCH v1 1/2] dt-bindings: usb: dwc3: Document Renesas R-Ca=
r Gen5 DWC3 xHCI USB controller ---
commit 716289e3efcde452eab06f93d71e6ed140cbc0c3
Author: Marek Vasut <marek.vasut+renesas@mailbox.org>

dt-bindings: usb: dwc3: Document Renesas R-Car Gen5 DWC3 xHCI USB controller

This commit adds documentation for the Renesas R-Car Gen5 DWC3 xHCI USB
controller and its glue logic wrapper. It defines a new YAML binding schema
that references the core snps,dwc3.yaml schema.

> diff --git a/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-usb.=
yaml b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-usb.yaml
> new file mode 100644
> index 0000000000000..a334648e2dfc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-usb.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    bus {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        usb@c9c54000 {
> +            compatible =3D "renesas,r8a78000-usb", "renesas,rcar-gen5-us=
b";

[ ... ]

> +            ranges =3D <0x0 0xc8800000 0x0 0xc8800000 0x0 0x100000>;
> +
> +            usb@c8800000 {
> +                compatible =3D "synopsys,dwc3";

[Severity: Low]
This isn't a bug, but the example uses the deprecated compatible string
"synopsys,dwc3" for the child DWC3 node. The base schema snps,dwc3.yaml
explicitly marks this as deprecated in favor of "snps,dwc3".

Should this be updated to avoid triggering warnings during schema validation
and to prevent users from copying outdated patterns into new device trees?

> +                reg =3D <0x0 0xc8800000 0x0 0x100000>;
> +                interrupts =3D <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>;
> +                maximum-speed =3D "super-speed-plus";
> +                phys =3D <&mp_phy 2>;
> +                phy-names =3D "usb3-phy";
> +            };
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728011656.4650=
40-1-marek.vasut+renesas@mailbox.org?part=3D1
