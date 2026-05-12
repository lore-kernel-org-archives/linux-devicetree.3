Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7318438333E
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778552331; cv=none; b=NAKMcPpgJuI64ETmEvxn7BANpghLy1bQDFxcwD/s89y75qjlvakhCoa1yFxu8QsHpiSWqgGq5yPxVm/Z2TOcyWxruw01HEBGzzlZXhgfb/tqIzegAZ/mgInkkj7CQmONRrJSloYAChBtCAcGoxSM3P/45nXg8t3NBoZUPCLsV/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778552331; c=relaxed/simple;
	bh=bQtBJS8Y5hOinAWkzWN3iQ9k54kzRrmmy4nxyo/eCQQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qQQ1Y8nuHHGV+9PaHpSiovJaQAmDplCU6mOAAShQyFA3z3PVACnM0x8ruxsyD4LB5I2tR487IiHG7OASrqoy03g3OvopWT/hLseCSX1dYouvr26T+nUgewjbFGk+kwbq2jLkSXV5zkwDgjekFHWgN2W2n91NMNYO7ymuuNg5JSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0Mxttfy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0Mxttfy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48DFC2BCB0;
	Tue, 12 May 2026 02:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778552331;
	bh=bQtBJS8Y5hOinAWkzWN3iQ9k54kzRrmmy4nxyo/eCQQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=A0MxttfycYEXwux+Hx9OunSkGoG+P+PGtXsLwpIgliGjw6p3PxQeMtYIM+ESZ2Z8r
	 hbRIdR4fHZy3jdwsvAwD3uH+bIraX1Y56gaIUsW3e6tYUQyM9WSquNALtSY8TTTF3Q
	 OeaeDOn9GKUMegsvxjsjs/jPcH6O3O6NeyPBe/ojR4ZBCUvdTkXVfDicekbSb1+SD6
	 1IJTnteNowkDWOma07nFs+C/5unKbJLk1oORPJLz5GoyivBTKihV/b5Q9/GLI83FtS
	 NSu1Z4jWgWGobsNDwLoGkRgKsvywZt5+P+ysNRP4h1RsosCDICNzyTLVGHC4mP3SJA
	 tVJuDZtsr73fQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] riscv: dts: spacemit: k1-musepi-pro: add 24c04
 eeprom
Reply-To: sashiko@lists.linux.dev
To: "Andre Heider" <a.heider@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511111116.1109643-3-a.heider@gmail.com>
References: <20260511111116.1109643-3-a.heider@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 02:18:50 +0000
Message-Id: <20260512021850.D48DFC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Mismatch between commit message specifying 24C04 EEPROM and the =
device tree implementation specifying 24C02.
--

commit 8474b79f5a61bfe2629e2e2bdbab9bc9128b8502
Author: Andre Heider <a.heider@gmail.com>

riscv: dts: spacemit: k1-musepi-pro: add 24c04 eeprom

This commit enables i2c2 and adds a connected EEPROM containing an ONIE
TLV table.

> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/=
boot/dts/spacemit/k1-musepi-pro.dts
> index 88c35ad1ef2ae..79415d760f162 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
[ ... ]
> @@ -92,6 +93,38 @@ &pdma {
>  	status =3D "okay";
>  };
> =20
> +&i2c2 {
> +	pinctrl-0 =3D <&i2c2_0_cfg>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	eeprom@50 {
> +		compatible =3D "atmel,24c02";
> +		reg =3D <0x50>;
> +		vcc-supply =3D <&buck3_1v8>; /* EEPROM_VCC1V8 */
> +		pagesize =3D <8>;
> +		read-only;
> +		size =3D <256>;

The commit message states "add 24c04 eeprom", but the device tree uses the
atmel,24c02 compatible string, a page size of 8, and a total size of 256
bytes.

Since a 24c04 EEPROM is typically 512 bytes with a 16-byte page size, is
this hardware actually a 24c02, or does the device tree node need to be
updated to fully describe a 24c04?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511111116.1109=
643-1-a.heider@gmail.com?part=3D2
