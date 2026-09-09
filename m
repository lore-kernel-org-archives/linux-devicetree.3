Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AC337DABC
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 17:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976146; cv=none; b=a3dwqweco9ry6v/GwCKDwvQfbnNxALweuTFozij+OVxB5eTawiuUdVlfg8CKnKC+4E+ah79sg5lS9m9mKxNBxvv/iVp/7uWGaNKS39jm6lOGg0dzVHW7x/HZ+ZBDMQyUMI/g0yLjXvnHUbQFhpgdXel5VVQ7p0knyPemLDUV9dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976146; c=relaxed/simple;
	bh=RxB4E8Q6wnhSuAafiabxnxHVUK0zAM00T+kDWkIO3Rg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cl6wEWH6tcUCfsm5CM278PQAgrfv1rekyoRmNlTPX11umFtyugKfoAB+uaGnXyIrm6tCnzRx1m9+qosrvYLzoaI1FKCMRqhbOu1bIehnbjVhdxZSEG8Mu9v34JC6dygGeVdUT5kZ1N6bLF/dQwG+Xrfrh2mzC1unb+6rPgsgdbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIOb9VMq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIOb9VMq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708DB1F000FF;
	Wed,  9 Sep 2026 17:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788976144;
	bh=gfbWO6tk/nIKQO27CWS6JFKv9Nwdaq5aCbIQKmls+Rg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DIOb9VMqndYkhkb3KtTu6CIFK9XGzpYmBQ2oVam9P2t5aYG4dnLZlXf8SViRWHQfr
	 bdkPnaBu1/+CAYb7NofprB72D4lwNdG6T6xCNTqpHj9qbwPP1mtEGhaKb3Kyh31qx5
	 6AvxTaBYnaazodRGoIcdwN3W218c4C/GdsaDhTMT2lsu0l53DHwpu/HFiFdZOkf9M5
	 ekr1Qa9+k6s01231womdk/jYn5tS82+3sE9k3n4qz9h59pTB1dyFhYAED1x/rf5VvU
	 GcRDLoHtRf/zJ4lWwZLFkQ8rmW3j746cq8eilLmaeW38o7weWWyYI6cwpfT0COxkxr
	 PLe92t9jgh2aQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: ti: k3-am654-base-board: Add
 power-off delay for proper MMC power cycle
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260909173833.764103-2-jm@ti.com>
References: <20260909173833.764103-1-jm@ti.com>
 <20260909173833.764103-2-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 17:49:04 +0000
Message-Id: <20260909174904.708DB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `power-off-delay-us` property is placed directly in the SDHCI =
host node where it is silently ignored by the kernel, rendering the intende=
d fix ineffective.
--

commit ad27b5f7c84e8187c60f3d6ec61cfd8ac2996675
Author: Judith Mendez <jm@ti.com>

arm64: dts: ti: k3-am654-base-board: Add power-off delay for proper MMC pow=
er cycle

This commit adds a power-off-delay-us property to the SDHCI1 node in the
AM654 base board Devicetree. It intends to ensure the MMC1 VDD rail fully
discharges during power cycles between boot stages.

> diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/=
boot/dts/ti/k3-am654-base-board.dts
> index ca1300e130936..edcf039ccfbd0 100644
> --- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> @@ -460,6 +460,7 @@ &sdhci0 {
>  &sdhci1 {
>  	status =3D "okay";
>  	vmmc-supply =3D <&vdd_mmc1_sd>;
> +	power-off-delay-us =3D <650000>;

[Severity: High]
Will this property be parsed by the kernel when placed directly in the host
node?

The power-off-delay-us property is specific to the mmc-pwrseq-simple binding
and is parsed exclusively by drivers/mmc/core/pwrseq_simple.c. Neither the
core MMC code (drivers/mmc/core/host.c) nor the SDHCI host drivers parse
this property directly from the host controller node.

Because it is placed directly under &sdhci1 rather than inside an
mmc-pwrseq-simple node, the kernel will silently ignore it. Does this leave
the MMC initialization failure unresolved?

>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&main_mmc1_pins_default>;
>  	ti,driver-strength-ohm =3D <50>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909173833.7641=
03-2-jm@ti.com?part=3D1
