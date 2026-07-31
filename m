Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCB13D9026
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509583; cv=none; b=C+iAq384hnECPXzISYMvMjn8nepgqOl+9vmiLDXms4igILT2zh0SbCxmWu5nmKod1uA1CCAW/ZmW/4CYhtsq0k7CjMyHYfZuu5OrUR4jX0ESOBIsCcGz55FuHvVjNl+k+WvBnPNCIuN1UfB0BtW18M3ZZU4OWLL0bzXBmYmQDw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509583; c=relaxed/simple;
	bh=doOpRezCxX4+my/8RIHKmMicJnNlyx9YVSTWkI/sCYc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lczURSYQU0iBxb3YpUp7/eI0lgh0ng3v2kbIcvSVjs83Yyu7hJuvxEmMoACIZPRXzGYiRD0+k5g8z6gY7u8bs09fg911dXh6NVIX+FypoDNIJVR4mJAm2GfqQIzklFbpzJAXLax1aPIKXEFA4gewO7B5ozWcTaemO20bKA59tEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtUtUAxr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtUtUAxr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12671F00A3A;
	Fri, 31 Jul 2026 14:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785509582;
	bh=NVZVVg881wEhIuki0uvo5lydh8o76ndv1w4xGolCc68=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EtUtUAxrNKjBBJt/oCbH6DU+Ortyzf9nUMJb2A12jF48guu3FiIdzYe/M3qRrlgmK
	 RGudbxtPP/uTmHEI79hy6ItbOb6PWY6Jd8ZhY5bN330XtC0L1h3nPHcbyNiEIulCC0
	 bmfVRyZjKPXtm7g00kjWpA6cV6cNgTmuazITUB2FNSTGifiHg6yjwHfi1yntc+3Knf
	 4OVjaGNntnqyk3k0i8tM2my/m2PWccNNCKBSLGAbkIr9YhB5zJL7SKJ2WP4Z+9FxQ2
	 EKoirmKJKCBPpYvAHbeTfKyXLsmgU87BSX3id7TAbOgrbaymHday4ajbCT4eU296zZ
	 bJf49CmSWuo2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260731-axp318-regulator-v6-4-b4e745552a35@baylibre.com>
References: <20260731-axp318-regulator-v6-0-b4e745552a35@baylibre.com>
 <20260731-axp318-regulator-v6-4-b4e745552a35@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 14:53:01 +0000
Message-Id: <20260731145301.A12671F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `axp318_cells` array defines the `axp20x-regulator` cell wit=
h a hard-coded ID of 1 instead of using `PLATFORM_DEVID_AUTO`, violating MF=
D subsystem guidelines.
--

--- Patch [4]: [PATCH v6 4/5] mfd: axp20x: Add support for AXP318W PMIC ---
commit a5dbdb5469c59acc76c36e5d6f37cd6f060e0f47
Author: Andre Przywara <andre.przywara@arm.com>

mfd: axp20x: Add support for AXP318W PMIC

This commit adds support for the AXP318W PMIC to the axp20x MFD core and
I2C driver. It exposes the device's regulators and interrupts.

> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
[ ... ]
> @@ -1061,6 +1129,10 @@ static const struct mfd_cell axp313a_cells[] =3D {
>  	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
>  };
> =20
> +static const struct mfd_cell axp318_cells[] =3D {
> +	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),

[Severity: Medium]
Does this hard-coded ID of 1 risk sysfs naming collisions?

The MFD subsystem guidelines recommend using PLATFORM_DEVID_AUTO for
automatic cell indexing. If multiple devices share this explicit ID, it cou=
ld
lead to duplicate device names in sysfs (e.g., axp20x-regulator.1) and
subsequent driver load failures.

> +};
> +
>  static const struct mfd_cell axp717_cells[] =3D {
>  	MFD_CELL_NAME("axp20x-regulator"),
>  	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-axp318-reg=
ulator-v6-0-b4e745552a35@baylibre.com?part=3D4
