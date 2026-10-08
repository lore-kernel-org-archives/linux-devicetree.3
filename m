Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BFE3914ED
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451602; cv=none; b=WNFDjXxDeZrw8W3gFeo9dOmJ163//Rv7IV5kFb2Ie4+NLOtkIQSI05suAjzIVrD5aK1DUg41AS1IFYZJ0tRoYkW96+TTHu/ImzZ8QEsUu5XAzEyx8yywY5Yqiwvp5QYRVzXxHmbD5TuyHhuypXshDqfUdqU4GWi7LW/lP/emWhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451602; c=relaxed/simple;
	bh=F61iKJT9A0B94FOLVSvjcxRenoaU7p4b6bxcV6xkYL8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=GjDdA4WdZYAeJ+LIPCCv8Ubo+HzWoCWfvTDXjRN+0hDoPsjtiN9vVksF+kcZwKiSsDr0aYpP7WrKzxgkRZXU+roATUWnrrT7/s3QqUJwDdkhYzlzc5+r22d8At/WisrIM8hfm/w5lVwH608HuZzW8tM5iZW8ag34B1Jcg647s2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEZfv1Ga; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEZfv1Ga"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6438A1F000FF;
	Thu,  8 Oct 2026 09:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791451600;
	bh=fqMMd74Gmx7+IBY8Cum4tagLNBzWy41hlmbboiTUip4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cEZfv1GahPDi7+JbnK3oGuVQ37U+Q8PQi8CMBoc8zOvsuA8jly6o8G28NaNXdxFmX
	 YqwJavl2oILmdPV4GxPy6NiVnTkXKpblz3+Z9KtoGYdjgL48eBbdAHGBvRBKjcEOq7
	 FUaJPcHI67HtTkllqsYnwOPHjoEgTGNQ3WrQVKj5HHhO0sUWXk0/2TaOydEfMsi5El
	 FS8SfPs5KaIG/061emOirs5RhNGtx26CPUv+xgBrpNbfxqG3JtzpnLwPgAKwj8iHuE
	 /qW+3Z94IGiV7NgWtS+w96RdIB1f1f7Uc9bcSpuiXFAwgaKbkLQPCBbOYrKEzQvEYt
	 wgmYM7JaOCBQg==
Message-ID: <sashiko-outbox-163933@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 NAND variant DT file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008-08-dts-v6-3-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
 <20261008-08-dts-v6-3-f9c4ec8664d8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 09:26:39 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: redundant property duplication in flash@0 node
--

commit 730037c043b086f6324dee42a3f417cb7d8c240b
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Introduce RDP504 NAND variant DT file

This commit adds a new Device Tree file for the NAND variant of the
IPQ5210 RDP504 board. It also updates the Makefile to include the new
dtb target.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts b/arch/arm6=
4/boot/dts/qcom/ipq5210-rdp504-nand.dts
> new file mode 100644
> index 0000000000000..8b7106cbd7c6d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
> @@ -0,0 +1,29 @@
[ ... ]
> +&qpic_nand {
> +	status =3D "okay";
> +
> +	flash@0 {
> +		compatible =3D "spi-nand";
> +		reg =3D <0>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		nand-ecc-engine =3D <&qpic_nand>;
> +		nand-ecc-strength =3D <4>;
> +		nand-ecc-step-size =3D <512>;

[Severity: Low]
This isn't a bug, but should these properties be omitted here?

They appear to be identical to the ones already present in the included
ipq5210-rdp504-common.dtsi. Re-declaring them verbatim in the flash@0 node
creates duplicate definitions where future updates in the common .dtsi could
be silently overridden.

Could this node just contain the new spi-rx-bus-width and spi-tx-bus-width
properties instead?

> +		spi-rx-bus-width =3D <4>;
> +		spi-tx-bus-width =3D <4>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-08-dts-v6-=
0-f9c4ec8664d8@oss.qualcomm.com?part=3D3
