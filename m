Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BA33AEF22
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451265; cv=none; b=TNdWLTfqltOkrsDZuMuFTxnjlwKSmNnK6+ASeggDroo64m4t1fEih+HZIKHHeUMkXh+iyPC2wM+POn8VkDeRaeAHCp8kKbKQlZyRetalvjxXe54aLDEPb2uDNV5dYC3nRJXYJO6BW3IvJ9SrDJjX+5UHYC0AV7Rhvh+teJadsl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451265; c=relaxed/simple;
	bh=6GvtSdHo9Dht4FZTgReHDMSP4gRBt7m6PXZKlsB8iko=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=T3h8z792tR3Uf+8V2J604jlbtrlIrR6s/hLIaVbr0/kXNdZ5wBnjMHfnZgUgmbcpzDnit4NpPp4Tpynzv8orTKFUKrZK2NrRZu6w/tKsxw105eNuyt+el6jYWlOa8wjzH0BbYO/wiYFw1EVm1XbZulIHNQkya0WdByTcq7QcVds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKjo8w/4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKjo8w/4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6455B1F000FF;
	Thu,  8 Oct 2026 09:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791451254;
	bh=fkW7En2lyIh4S9UKScMG7kHssSkfMn55HQVWQ8EYNFI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oKjo8w/4+KRPAM66y1rNbVivoj8TulcKd+HEJ45jRPuVc8CH34Oo0pDLA+9DPA7qg
	 MIdeymmLNWCB4LY3m8+7vlFqB2uIgmiBDq5ix9Q9XduM8YjE8tWNNGuiS0A4jECndW
	 kvxIf6c4t2NZrNW47Mvv96uSWfT5+WK7aBmB/ZmtY/lpXwVQS6ISZGxBlXng9EJ73Q
	 Ux388iymCQ3+C4RzuC2fQC+dOovBGcpi4KhUUL0lZf//VKjYW+OKi2m4cGWEkJuDuI
	 TWKn71f+I3gd9rU8b/E6m1d5i4qkvFrU8xGQJOET5IIM2HUBuKO8DFwtO3+TisZ/Gd
	 52VD5a8qUfi0g==
Message-ID: <sashiko-outbox-163924@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/11] arm64: dts: qcom: ipq5210: Add random number
 generator node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261008-08-dts-v6-11-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
 <20261008-08-dts-v6-11-f9c4ec8664d8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 09:20:53 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: child node inserted out of unit-address order
--

commit 2020cb31990e9e26b7fe5e1e8919a503b1184e3a
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add random number generator node

Add random generator node for the RNG block present in IPQ5210.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 23a2e27b70fa3..4795de0c8baaf 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -198,6 +198,13 @@ soc@0 {
>  		dma-ranges =3D <0 0 0 0 0x10 0>;
>  		ranges =3D <0 0 0 0 0x10 0>;
> =20
> +		rng: rng@4c3000 {
> +			compatible =3D "qcom,ipq5210-trng", "qcom,trng";
> +			reg =3D <0x0 0x004c3000 0x0 0x1000>;
> +			clocks =3D <&gcc GCC_QRNG_AHB_CLK>;
> +			clock-names =3D "core";
> +		};
> +
>  		qusb_phy_0: phy@7b000 {

[Severity: Low]
This isn't a bug, but does the placement of rng@4c3000 violate the Device T=
ree
convention for node ordering?

Standard DT convention requires child nodes under a common bus to be sorted=
 in
ascending numerical order of their unit-address. Since 0x4c3000 is greater
than 0x7b000, should the rng@4c3000 node be positioned lower in the soc@0
node list?

>  			compatible =3D "qcom,ipq5210-qusb2-phy", "qcom,ipq6018-qusb2-phy";
>  			reg =3D <0x0 0x0007b000 0x0 0x180>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-08-dts-v6-=
0-f9c4ec8664d8@oss.qualcomm.com?part=3D11
