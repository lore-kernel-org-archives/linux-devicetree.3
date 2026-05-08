Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604A52F8E86
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 20:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778272794; cv=none; b=FO+DxBROkc6qTZm0N92eNrGr3eL39iN5BcojfU/omOoBEGzACRr/eH4kHqocEZR01vZqrbCk3Xq/uE3HxUIYHuWV9lnl/LPJ30/l43skTieoJniO9ZkRmkV8kzvznJR945ibqTULidZIl99u/PmjDGp+3ktdwFDFIoo1f5zTnVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778272794; c=relaxed/simple;
	bh=1ZlggzjarYbEyEFfK0qHQuDvUwHvdI7g37ArjlWNOL8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fuRqoVIDSgcPkEFLg/E5pXHuG4WwD8sWj8PGeySOJvkfmwefn7PIdPOyIHC3bbJSb9vpiv2GwETt4w7DUlf6QCHMPWsMMp29f+iNyHlwfBQmcrihvZNe9J/tQlkL0mt8tdJaO9VDlrVYwz6GB6hNvwez2hl/ONtGMpzjSHjAj2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeGYvu4S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeGYvu4S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C981AC2BCB4;
	Fri,  8 May 2026 20:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778272794;
	bh=1ZlggzjarYbEyEFfK0qHQuDvUwHvdI7g37ArjlWNOL8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=KeGYvu4S1j00pMZ6W/N0W9wuJnuGwJz8m15bc6a61Xrds9syADIdDcseH7qwyNGe1
	 NtayrF8bPp5Xq/r+6VmKOSdf4cZQm2++8kr4qg6HGxnRqPplheDRwgT2LS4+fdUKzr
	 UFgbZchAov/XgwrEKPL5BlQ2RdOhi27UH2Hi/UTUbmop4s6KkKSUM1QoFYDk9uJog7
	 HF22Gjn4lcbtr2apJwgAmRfjId3aM2ZSgiaWVCI/NsGMDndOLxZ/ln8fYDJJky4g1G
	 uhh3VJjssjUDdMGSTG6JJdBjX6LEnEocrXdFZAkyaGWtWO47Anv1bdvMjhsC1ZRFeU
	 +4jGMxmlnhKjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: thead: Enable WiFi on Lichee Pi 4A
Reply-To: sashiko@lists.linux.dev
To: MoeLeak <i@leak.moe>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260508-lichee-pi-4a-wifi-v2-2-7acf63559e62@leak.moe>
References: <20260508-lichee-pi-4a-wifi-v2-2-7acf63559e62@leak.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 20:39:53 +0000
Message-Id: <20260508203953.C981AC2BCB4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `&sdio1` node specifies `#address-cells =3D <1>;` and `#size-ce=
lls =3D <0>;` but contains no child nodes.
--

commit 89c378a34273e40ecc4c5313fff87bf9f739222c
Author: MoeLeak <i@leak.moe>

riscv: dts: thead: Enable WiFi on Lichee Pi 4A

This commit enables the RTL8723DS WiFi module on the Lichee Pi 4A. It
configures the SDIO1 controller and sets up the I2C1 bus for the GPIO
expander used to drive the module reset line.

> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/ris=
cv/boot/dts/thead/th1520-lichee-pi-4a.dts
> index 7cb7d28683bce..af6f25ebbf607 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts

[ ... ]

> @@ -132,6 +153,32 @@ rx-pins {
>  	};
>  };
> =20

[ ... ]

> +&sdio1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;

This isn't a bug, but since this node does not contain any child nodes,
will including #address-cells and #size-cells trigger the dtc compiler
warning for avoid_unnecessary_addr_size?

Should these properties be removed if no child node is being explicitly
added for the WiFi module?

> +	bus-width =3D <4>;
> +	max-frequency =3D <198000000>;
> +	cap-sdio-irq;
> +	keep-power-in-suspend;
> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> +	non-removable;
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-lichee-pi-=
4a-wifi-v2-0-7acf63559e62@leak.moe?part=3D2
