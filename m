Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13050C8EB
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 21:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782250752; cv=none; b=lThry5z+gNROfV7/3RLeUhdGDZdBKz8/yJJOCo7WDjBF7SY3MRUYQDOTsYXQ6qGMJzutflLPVSyRGbjfUpl8BkP1ve7VbjsGGNbfz0Mto+or9nuWua2EbYCBkabyOUpqrZrAo+WdthHYJjQfGPAADfmLNlb0gTk3geeDNn0HjuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782250752; c=relaxed/simple;
	bh=3Tybx+IdeqK4qq2+XMaIna6C3IgebmvKmA29a03VxGc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RiwylV+S2uT6FrvV/N2BnPPXHqD5DbyOPsRgAqt5WzbPhzrm1bLc7IncEQ2+mMrSGClHjP/+bHqktKb65dLF3vn3ZVkU7yh5Oklb11saX1DORxKzo54ycGSxrw2LZ2t8H2+lKM7xJBRZd25mPrJrNZwABhesP7len1wJnL+Lit4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2adzVhu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2adzVhu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E6E1F000E9;
	Tue, 23 Jun 2026 21:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782250750;
	bh=reJ8UlNnE3CNAZ1Ws74n4lSKZOktGkGDBcZupL/87ms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F2adzVhu2A2TgFG9R3h+NxlLN2pnW1pKSgNcqpDxZbcNoI+6qA0z+GgOYcddaApRF
	 8v45MOg4N3tCcKW9CW9gf0UEbXl2ShyC77ix5rhWbbFUqgz8XQZxQTgJv5oNsDfqu/
	 OJQHTWvl06UaE+/mq6Xpcr81OxVPIbVt45AxdJ0a1P/ivGYz4vd2C+AgYjPNWM0xix
	 csUL0O5L9aGmlq7fwajMboKemTQqUyBWO/uJzvrXZf+NpQ0H8LJkFYkhW9LdQjc3XD
	 2bR0fXnnbv+cQMSL797f4dd5ePzg9Pzyu2AXgAocJ20WIEkTlJJowGPn+tLbtCK4lD
	 Fhyq2iP7gOEAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] riscv: dts: spacemit: improve RTL8211F PHY
 configuration on K3 Pico-ITX board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aurelien Jarno" <aurelien@aurel32.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260623204431.498700-6-aurelien@aurel32.net>
References: <20260623204431.498700-1-aurelien@aurel32.net>
 <20260623204431.498700-6-aurelien@aurel32.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 21:39:09 +0000
Message-Id: <20260623213910.72E6E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Adding vendor-specific properties (`realtek,aldps-enable` and `r=
ealtek,clkout-disable`) to a PHY node with a generic `compatible` string by=
passes DT schema validation and perpetuates probing fragility.
--

commit 06c0a01ebf26666aceea3d45a75bbed3025600af
Author: Aurelien Jarno <aurelien@aurel32.net>

riscv: dts: spacemit: improve RTL8211F PHY configuration on K3 Pico-ITX boa=
rd

This commit enables ALDPS and disables the clkout signal on the RTL8211F
PHY for the K3 Pico-ITX board to save power and match hardware schematics.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/bo=
ot/dts/spacemit/k3-pico-itx.dts
> index 532c72006ef1f..2476f5585a200 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -226,6 +226,8 @@ phy0: phy@1 {
>  			reset-gpios =3D <&gpio 0 15 GPIO_ACTIVE_LOW>;
>  			reset-assert-us =3D <10000>;
>  			reset-deassert-us =3D <10000>;
> +			realtek,aldps-enable;
> +			realtek,clkout-disable;

[Severity: Medium]
Will adding these vendor-specific properties without specifying a Realtek
PHY ID in the compatible string bypass device tree schema validation?

The realtek,rtl82xx.yaml schema is only selected if a Realtek PHY ID is
present. Since the phy0 node only specifies ethernet-phy-ieee802.3-c22, the
validation tools will ignore the new Realtek-specific properties, meaning
typos or invalid types could pass silently during dtbs_check.

Also, since this node uses reset-gpios, if the PHY is kept in reset by
hardware or the bootloader, could the MDIO framework fail to read its ID
and probe it unless the exact PHY ID is provided in the compatible string?

Would it be better to update the compatible string to include the specific
PHY ID (such as ethernet-phy-id001c.c916) alongside the generic one to
ensure proper schema validation and reliable probing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623204431.4987=
00-1-aurelien@aurel32.net?part=3D5
