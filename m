Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794521461;
	b=iO17Ui1USsSTi4+mFEmv1i0tPt0nekM1g9Y0wq9iV1voY4KX5n9oOeXl8g6vH64WMn8D
	 Ha5hJs+1ijH02J+rY9pQmHL9L2kFEy3WfrIGvThRQVhCMo3WfZfZUU4qSuHIuyB7qz+YM
	 8qw27Yejs0LT0BkRzwpRDNf3aTnRRE7ArlYCxSrzl84ubiVYOXzucTLe1pXtQ4/kl0SoC
	 Eob8MfXf1TiB8VoWBCCE4mwWd737JqEhtGE41nZvPBSaYgSYYi4V6hi4ltwfio/zeT2K9
	 qIGXAoakOsjy3qvWJXp5qALNbQvng2oXWjCXI6HSDphtB+p0snlaazsZf2lEGw/eaaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794521461;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=v+LF/VPnHbngQYwsBsD1WT8KD9VCD6DnQveHjDgSXo0=;
	b=TtY+pZMAQ4ldQ3zmc4qbAN3dq4vzQCR28qGOEWnBeZVHpOGjXM4wMHOrkFJDr5GQK9jE
	 W56avweZjvHCflx8DJwBYE/vV7uZeL2Ekn7CGd/N66L2lvaktqwntA7RWntKBW3M7/ykX
	 xjR9399JShtXJuG7h/Go0IdvtaBZ7RdqgPldqaQ90xLZqXVVkcsqRV+dpbGzHu8MY/Ki7
	 U2tdN/8BBJ96mKMVCVA07Yf1NvvSQHpqhkLHuoiarNrMztzxVcs7xFRs0McWvcw/FkoEh
	 fq36zVIaJxvj5G8FOLNHfAcxMgIx/3VOFAKsHa6WHFwsuP4qO58JQwUkobmXeWSGrPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EiuHdvOb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE53606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EiuHdvOb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63B21F000C4;
	Thu, 12 Nov 2026 22:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794521460;
	bh=v+LF/VPnHbngQYwsBsD1WT8KD9VCD6DnQveHjDgSXo0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EiuHdvObZajkv1/W50tZJTCowHDGGt6iUUGuVtJe5V/VDBaCyeAoC2QRA7D0LWzNZ
	 egkOa7PAcpj7ULeLAttMU7vNQJDu/5Cx9sFE9xXXc16/ZDghNrYm7oBLSmPY9O/3QI
	 6sYK1rU23Im+OFpSCwcZfEHoEbyb4sm7P3UYER+Ef9CX4WZ7HzOCmts4C4c1bR9eEh
	 zJ95gxuu0i2IpkhPd2VaoGyAy1PZCq6XRcMIJJvXGogUiqdTGOk8Ri03Lo45t//ipE
	 NFF+Q1hXAL7vpP7amFtX8aVpYPkMqEgZn5Rn85Mtxk59r6Uw4sKvwrwYfUfiGcqU7/
	 n6bs1TPu9mAQQ==
Message-ID: <sashiko-outbox-211890@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv3 4/4] arm64: dts: socfpga: agilex5: add support for the
 ECC manager
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112215342.2476801-4-dinguyen@kernel.org>
References: <20261112215342.2476801-1-dinguyen@kernel.org>
 <20261112215342.2476801-4-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 22:11:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: socfpga: eccmgr node violates
  altr,socfpga-ecc-manager binding
--

commit 2d0a9122ec3d7d762cb61c5759aa15895402f73d
Author: Dinh Nguyen <dinguyen@kernel.org>

arm64: dts: socfpga: agilex5: add support for the ECC manager

This commit adds the ECC manager node and child ECC nodes for OCRAM and
EMAC0/1/2 to the Agilex5 base device tree.

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
Does this eccmgr node fail make dtbs_check against
Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml?

Matching "altr,socfpga-a10-ecc-manager" selects that schema, which does not
document "altr,socfpga-agilex5-ecc-manager" in compatible, limits interrupts
to maxItems: 2 rather than 7, and rejects interrupt-names under
additionalProperties: false.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112215342.2476=
801-4-dinguyen@kernel.org?part=3D1
