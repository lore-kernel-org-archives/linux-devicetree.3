Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F353EBF07
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448018; cv=none; b=P7Gqd8Rlj7pLEKyHSbQEp4Q0r7OZ6niSL/D9Ve5DGvnDYDL8MVFoD96/HkxQqk6F9VN8LAUu5pUeVllnWCAkMrpi01JGcfKIM0orpBiMRnI22ibn5n6fEJr1YfjNOJypmEEAXyLHOniMMYZTgkAnBnruQIgqXxSPB4dqs41lNas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448018; c=relaxed/simple;
	bh=eqofWnF6Ucn8NB/to8k2Ig8TXYIgkb/Yc4UBILZCjN4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EI4TfBJKjh4UyzJe7cwNocyIbYbFulH4afoNzN/eRUQXahffwEVyF86A5R0L7L+fTAtrwUzAex3iZbDy/XfX0Cg2I8OGbuqCceY3nyBCrHLjQEvOgYmokgFbeY1s3X+3wFGSMV3HT9LKqkoJetLLMQYDexD5MhZelhQEkZPPF7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAQ/E9GA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAQ/E9GA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B1D1F000FF;
	Thu,  8 Oct 2026 08:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791448016;
	bh=QbwiNqUlryiAkjLGdwSvFVBVtT5S7hT5G1vHdMZPOqA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QAQ/E9GAieRxTo9U6QIWxkRvqIlKpB5xPyCuBh1GUV/wOjCVMiKHmJXR8al2GW7RA
	 5OgZJmBk0QV1Sd+dy/byHYvHmX1Hi9DBAStFjt7G3rXp6rSe31p3/b+p8pPHQ2PlW8
	 SwdYbllXa0fcO35co4INF6iNVLSd3y+M8SxYYLWlwsQWJLO4fDW/n1jFftK1apo/Y5
	 y/FluAb5DsyOtGLSJ0nzLFkTPU8I/acg9hCDpOW0SZUBLinAcVylM2rM01pDbsLgUC
	 XAC1MPdsxc8owl+GqOtMA1Y+u/Y4qj8tK18IL+6SGW04fESYmo4NN1n7KBAmR6+0c/
	 FBrmNFfq09KYQ==
Message-ID: <sashiko-outbox-163833@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 3/7] dt-bindings: net: amlogic,meson-dwmac: add
 amlogic,t7-dwmac
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lucas Tanure" <tanure@linux.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261007082627.63807-4-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
 <20261007082627.63807-4-tanure@linux.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 08:26:56 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: stmmac: silent bitfield truncation of tx-internal-delay-ps
--

commit df8d2ca7732ce1f0cf81bbfee0085a28dfb7f50f
Author: Lucas Tanure <tanure@linux.com>

dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac

The T7 has the same ethernet glue as the G12A, but the controller
reaches memory through a pipeline stage that this SoC inserts in the
bus path. That stage has a gate of its own, which no other member of
the family has, and nothing else in Linux claims it. It is therefore
switched off as unused, and the port can then no longer finish a
transfer.

Describing it needs a fourth clock, and the fourth clock of the
existing list drives the timing adjustment logic, which the T7 never
uses. So the T7 gets a list of its own with the gate in that place,
under the name the SD and eMMC controllers already use.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>

> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.ya=
ml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index 90ef79161ab1a..96118b4d15609 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
[ ... ]
> @@ -57,6 +58,47 @@ allOf:
>              - const: clkin1
>              - const: timing-adjustment
> =20
> +  # The T7 applies the RGMII RX delay through PRG_ETH1 and never enables=
 the
> +  # timing adjustment logic, so it has no timing-adjustment clock. What =
it does
> +  # need is the gate of the pipeline stage the controller reaches DRAM t=
hrough.
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,t7-dwmac
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: GMAC main clock
> +            - description: First parent clock of the internal mux
> +            - description: Second parent clock of the internal mux
> +            - description:
> +                clock of the pipeline stage inserted in the bus path bet=
ween
> +                the controller and the DRAM. Without it, the controller =
cannot
> +                complete DMA transfers.
> +
> +        clock-names:
> +          items:
> +            - const: stmmaceth
> +            - const: clkin0
> +            - const: clkin1
> +            - const: pipeline
> +
> +  # Delay definitions for Meson8b and newer (including T7)
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson8b-dwmac
> +              - amlogic,meson8m2-dwmac
> +              - amlogic,meson-gxbb-dwmac
> +              - amlogic,meson-axg-dwmac
> +              - amlogic,meson-g12a-dwmac
> +              - amlogic,t7-dwmac
> +    then:
> +      properties:
>          amlogic,tx-delay-ns:
>            enum: [0, 2, 4, 6]
>            default: 2

[Severity: Medium]
Does the schema lack constraints for tx-internal-delay-ps?

The driver reads tx-internal-delay-ps from the device tree and assigns it
without any bounds checking:

drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c:meson8b_dwmac_probe() {
    ...
	if (!of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps",
				  &tx_delay_ps))
		dwmac->tx_delay_ns =3D tx_delay_ps / 1000;
    ...
}

Because it is not validated, a value >=3D 8000 (8ns) will be silently trunc=
ated
by the 2-bit PRG_ETH0_TXDLY_MASK:

drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c:meson8b_init_rgmii_dela=
ys() {
    ...
	tx_dly_config =3D FIELD_PREP(PRG_ETH0_TXDLY_MASK,
				   dwmac->tx_delay_ns >> 1);
    ...
}

Because the schema does not define constraints for tx-internal-delay-ps
and the driver does not validate the bounds, a misconfigured DTS will silen=
tly
fail and misconfigure the hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007082627.6380=
7-1-tanure@linux.com?part=3D3
