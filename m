Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861942;
	b=JlOHbT76/wUhcLAHr+Yqc+a2pIpwoAIHiOsBSOlEQYstySReFW9DNlb8nzfW7RSGCR64
	 uQlfhM8dewN8RnxrOvIFfSg8NgxJ7ishKkP6899FyB5nbXjhcAOpMINDyQNJNziujiSwi
	 dzXp8/gsNDoT6mqjAj76vQjEPp443MdEfKUcX6NET1qBoumIzMZ0uh0+c/TYRy+VWY/77
	 gW2kPySKFqfeyCz81LsxnBhbXTYBUuBzlvOx2VJBVuEqUjMfelhUy3WrLtB7gQEu6lE+b
	 0GomQDQEj+IGADMZ9EoE0XRl/bC+Tk65PKMHWwNEoF7hGO6RfNCje9yRMtdg/Hi/sAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861942;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4oSlJewN/kNoUqYUlEdd/3T3JGFzI+Y7BfuLan/yWT4=;
	b=LzPEYMOEDrs7WGggSx+1TKeq3q4+z4gfBHaH66ZtOKgPXrNYHiu+e9TmNS9nG1TOgUAb
	 UB60Zb1DRoRl6OYecNs830RrfAM8GrrRbPX5/2Zeww/54sp8EUE9Fj1nkdAWRCSag40l5
	 Swd7MTD6eFHIxZQESlmdElujj7XlWbMstGzq/pluXC+0qgKBjzBFiuVacPgFRzUrK/rvL
	 0Wfe9ZZzKHveh706jRu+85TzUuMICzWgRxyDM4viVtz+KBtOiYZjy+tZmGRcGdt3OpZ/b
	 DmZOIWAPyGxGQ5clCWKMuQ1wfBH66X71gGbQHq0LVD0baj2OOqa0rf1nrjjptm1ONUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TawFYq8k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F430606A332
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 20:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TawFYq8k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B065F1F000C4;
	Mon, 16 Nov 2026 20:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794861942;
	bh=4oSlJewN/kNoUqYUlEdd/3T3JGFzI+Y7BfuLan/yWT4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TawFYq8kWSrFSPNg/POlXnjOttKhWZPLyoDfNSKzxdC9FI3m7Q09zT3C33lPKhnb3
	 /ogm+rwrGzub0KjaWx6PokOPHKlrxAQMMFuhgJMnXySOtr3CHiFVvA1WjmuzyjBjLx
	 vQUzGZeDfWG33RjtoN203tHX9nfOWcYkGbzLS5MoCc16rp3G+8WgOR42zmEC2MovQa
	 GM9hPszhMV5UbIClhs56Lga1CNH4MoN/STHMZDX0hxx+lKKkq9wfdwcTw7Gi/Pmnh4
	 9zaRrzrBLoKORUWVhxfu5O8gvnyfA7njpNKZMByKPKoYrSg9VKEC+HL0YQRTrzHXXU
	 ML+bEKGkwivWQ==
Message-ID: <sashiko-outbox-217674@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv4 4/4] arm64: dts: socfpga: agilex5: add support for the
 ECC manager
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116202854.3087673-4-dinguyen@kernel.org>
References: <20261116202854.3087673-1-dinguyen@kernel.org>
 <20261116202854.3087673-4-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 20:45:41 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] arm64: dts: agilex5: eccmgr node violates
  altr,socfpga-ecc-manager.yaml schema
- [Low] arm64: dts: agilex5: dtc W=3D1 unit_address_vs_reg warning on
  eccmgr node
--

commit 80980c0e21089f61a20d6226bf0f7f5a1d6f7334
Author: Dinh Nguyen <dinguyen@kernel.org>

arm64: dts: socfpga: agilex5: add support for the ECC manager

This commit adds the eccmgr node to the Agilex5 base dtsi along with child
nodes for OCRAM ECC and EMAC0/1/2 RX and TX ECC.

> diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi b/arch/arm64=
/boot/dts/altera/socfpga_agilex5.dtsi
> index 161f3d4bbefe8..12d623d4b892e 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi
> @@ -160,6 +160,75 @@ qspi_clk: qspi-clk {
>  		};
>  	};
> =20
> +	eccmgr {
> +		compatible =3D "altr,socfpga-agilex5-ecc-manager",
> +			     "altr,socfpga-a10-ecc-manager";
> +		altr,sysmgr-syscon =3D <&sysmgr>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 95 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names =3D "global_sbe", "global_dbe", "io96b0" , "io96b1",
> +				  "sdm_qspi_sbe", "sdm_qspi_dbe", "sdm_seu";

[Severity: Low]
Does the eccmgr node pass make dtbs_check against
Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml?

Matching "altr,socfpga-a10-ecc-manager" selects that schema, which does not
document "altr,socfpga-agilex5-ecc-manager", limits interrupts to at most 2
items instead of 7, and rejects interrupt-names because additionalProperties
is false.

> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +		ranges =3D <0 0 0 0xffffffff>;

[Severity: Low]
Does a non-empty ranges property on eccmgr without a unit address trigger a
dtc unit_address_vs_reg warning ("/eccmgr: node has a reg or ranges
property, but no unit name") when building DTBs with W=3D1?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116202854.3087=
673-4-dinguyen@kernel.org?part=3D1
