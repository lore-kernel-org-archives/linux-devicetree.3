Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E003E3DA4
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498971; cv=none; b=Xl8aVyXHi3555HwAx5a2akCkYZXiXu5Yo1/MeGIFkUf8ZaWy1KNMswxZmdMhfbmXw7rPSOkere7FWP6XrSPs6CcuNRG9eYdbcf1g1b8iE6r5saberOp75hE+p4BAtCR7lwvf3LeUg2GiwY657dcjJYo5ObmsVmBVtixfHcGO/Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498971; c=relaxed/simple;
	bh=6XJ0ZAUc0I3c9jRgoH0rlPRvQ5CHeS6rTwfamjzUgoc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bnb2A0fltnZN5dRv05YnYKcUZBC82OmQCUy5KHVIVAxbGtod21B97uCjIhydtnAoFFrwBTReZMVF+aXBq5OdsDJG6yZ2ftXUr7ib/Ipz8fcIijnNYiItD9pScGixgVRpNpdPQROGnGJh1/ZKSEDIlFOpqz8bGRB7F2O3Wtav9ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCfPByD4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCfPByD4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED221F000E9;
	Fri, 31 Jul 2026 11:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785498970;
	bh=N6wCT6Q3ZlKyiB8myADlvvIKu0R4xIXculGQguhbCdI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dCfPByD4crAYZUy132Km4wryge4/ekCQeluj6G0oaDPtxvlytsm9d6XA9ozMvoguc
	 iJ3ME+oGUGZcDlDTfm8mBocx3qjE9suTtjz2pta0aHjBae1fz6tORMUHpzR291lKtC
	 z+fLE9o2wJrvrJCd4+ouuKZ0EwAFt4hBhIanaxyYKumb5JiZ+5YRjdoBv38vsfr2J+
	 tLd7VqljHekq8zCy0WOs/c0I9wjZ4V/YaIeSZaC06Uy9foy+q5olQGP1G7bYxLEJQ1
	 eogZu6hXN1JRVOZPZhGeq7842pGmJO8GDjUtaglooCmCxZqlVj/Dx57JBA3rL73TlE
	 FTCoQDL8HWp3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/10] ARM: tegra: tf701t: Configure CPU DFLL clock
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260731114106.169398-2-clamor95@gmail.com>
References: <20260731114106.169398-1-clamor95@gmail.com>
 <20260731114106.169398-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 11:56:09 +0000
Message-Id: <20260731115610.4ED221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked ERR_PTR from regulator_get_regmap() is dereferenced.
- [High] Blind cast of device pointer to i2c_client without verifying bus t=
ype.
--

--- Patch [1]: [PATCH v3 01/10] ARM: tegra: tf701t: Configure CPU DFLL cloc=
k node ---
commit 0611a64af936699a9dcfc983ddb6ac8c132310ef
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: tf701t: Configure CPU DFLL clock node

Enable DFLL for ASUS TF701T since it is now supported by Tegra114.

> diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm=
/boot/dts/nvidia/tegra114-asus-tf701t.dts
> --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> @@ -1621,6 +1621,14 @@ i2s@70080600 {

[ ... ]

> +	/* CPU DFLL clock */
> +	clock@70110000 {
> +		status =3D "okay";
> +		nvidia,sample-rate =3D <11500>;
> +		nvidia,i2c-fs-rate =3D <400000>;
> +		vdd-cpu-supply =3D <&vdd_cpu>;

[Severity: High]
This is a pre-existing issue, but adding this regulator supply exposes an
unchecked error pointer dereference in the driver.

In drivers/clk/tegra/clk-dfll.c:dfll_fetch_i2c_params(), the driver calls:

    regmap =3D regulator_get_regmap(td->vdd_reg);
    i2c_dev =3D regmap_get_device(regmap);

If the vdd_cpu regulator does not use the regmap framework (such as a fixed
regulator in the device tree), regulator_get_regmap() returns
ERR_PTR(-EOPNOTSUPP). Can passing this error pointer directly into
regmap_get_device() cause a kernel panic when it dereferences map->dev?

[Severity: High]
This isn't a bug introduced by this patch, but there is also a blind cast
immediately following the regmap extraction in dfll_fetch_i2c_params():

    i2c_client =3D to_i2c_client(i2c_dev);
    td->i2c_slave_addr =3D i2c_client->addr;

Does this code safely verify the bus type? If the underlying device is
connected via SPI or another bus instead of I2C, container_of() will yield
an invalid pointer. Could this cause memory corruption or garbage data reads
when accessing i2c_client->addr?

> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731114106.1693=
98-1-clamor95@gmail.com?part=3D1
