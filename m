Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD441FF5E3
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782225872; cv=none; b=SUupldK6RgvAuL5fUeCKCgZMjjM+1JOwRagetsYTlYdTJZIi74+cj/hOU0uwhfiB9y4M6xIB3h+5Wu+Fayrtcr8CEZXwoWsTjWj0kbhSGvtFTNIo5Q0PuuCxEcPn4ICTBmkN7y39oCHH67jU3FYxJiDwA0M7WnFLrT/8cgrpSk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782225872; c=relaxed/simple;
	bh=TwgzISR6RHwgYftpFmQvfMIztkErVUF8S363p55lBBk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n+aqnCipuhz4piBX4hKTFDLa+17SSE+SOhO4/gFoeMXYz2MvPw5XmAv+/jEi7WJGnJ8M0hlJvv28Umc6RUN5E5eVfx/EU1dw0fa/IcfdhYMTJwG2N/2Ar4fQPhm002tguhO8+EEOULyzh+DMhP0kDCMgfWOIfp/3ZQsXUoWlbM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBH6O9CJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBH6O9CJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE281F000E9;
	Tue, 23 Jun 2026 14:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782225870;
	bh=mjgHOQSDx3KeCLhwG3plFD1Yf97HbwK3i3CZh2o9474=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EBH6O9CJRY5b10GFdhHYx/FQJPP/F3Kcf9K5yeoNKdIfHsJ4+Iis7zHmVkRyOts8S
	 LZXoJ3ySCQtyXg+IWXC+gHOZ5sQiQuL4SkHZf7EbjlnJZqB2vWj7O6UKbYtiAfpT1o
	 0Eik7HOCdPIY9kIs5gV4OXPEAfCMZfQ6qxg23Ula+olhJKzVEo9n8MNFSsBnv3MB6f
	 mp3xFrXxxk39Zqc4ym07FKjc/cBK7/rCL9wp3LYd1P8h4TsCZgn0wjUPtH2EDfH2Xt
	 dNB3VNFJd9MOiHYhT7rkW3KN1Fxcde46q6mhDsDQcbjkl0ILPhdzLABW4rTcsgPpMN
	 p88yBjizEq/ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] ARM: dts: aspeed: g6: add aspeed,vuart-over-pci
 prop to vuart3 and 4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <86fc0b2a105a16ceb301ba53fadd096877455bb8.1782224060.git.gregoire.layet@9elements.com>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <86fc0b2a105a16ceb301ba53fadd096877455bb8.1782224060.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 14:44:30 +0000
Message-Id: <20260623144430.7CE281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Adding `aspeed,vuart-over-pci` to nodes with multiple compatible st=
rings violates the `const` constraint in the YAML binding, causing a schema=
 validation failure.

Pre-existing issues:
- [High] Probe error paths fail to unregister the 8250 port and remove the =
sysfs group, resulting in a use-after-free of the devm-allocated driver sta=
te and resource leaks.
--

commit 3ce60a66a65e6d307209da21c88e6e5c758ddf74
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
Date:   Tue Jun 23 14:25:45 2026 +0000

    ARM: dts: aspeed: g6: add aspeed,vuart-over-pci prop to vuart3 and 4
   =20
    The VUART 3 and 4 are VUART over PCI.
    This flag indicates this information.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/=
aspeed/aspeed-g6.dtsi
> index 5ff52697e8bb4..b33468288d4a5 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -714,6 +714,7 @@ vuart3: serial@1e787800 {
>  				interrupts =3D <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&syscon ASPEED_CLK_APB2>;
>  				no-loopback-test;
> +				aspeed,vuart-over-pci;

[Severity: Low]
Does adding this property cause a device tree schema validation failure?

Looking at Documentation/devicetree/bindings/serial/8250.yaml, the schema
restricts the compatible property to a single string when
aspeed,vuart-over-pci is present:

        compatible:
          const: aspeed,ast2600-vuart

Since the vuart3 node uses multiple compatible strings
("aspeed,ast2600-vuart", "aspeed,ast2500-vuart"), does this violate the
constraint and cause dtbs_check to fail?

[Severity: High]
This isn't a bug introduced by this patch, but adding this property appears
to trigger a pre-existing resource leak and use-after-free in the driver's
error path.

In drivers/tty/serial/8250/8250_aspeed_vuart.c, if
aspeed_ast2600_vuart_over_pci_set_enabled() fails during
aspeed_vuart_probe(), the function returns directly:

        rc =3D aspeed_ast2600_vuart_over_pci_set_enabled(pdev);
        if (rc) {
                dev_err(dev, "could not enable VUART over PCI\n");
                return rc;
        }

Does this bypass calling serial8250_unregister_port() and
sysfs_remove_group() after a successful serial8250_register_8250_port()?
Since the devm-allocated driver state is freed on probe failure, does the
UART core retain a registered port pointing to freed memory?

>  				status =3D "disabled";
>  			};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782224059.gi=
t.gregoire.layet@9elements.com?part=3D7
