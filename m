Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9393DC4AF
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 11:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547186; cv=none; b=lo9at6+lfpvYx5PKiFTiG4lS5/nEzb7U7bTZFjgOR2qqgGhizoSQN5RMwbR1fWuuDU6EvvKhCDNljOB67kYrJiP2TsmjzHcEnA/wBX9ejGiylUIe5fQEm+mClUwFITGKQp5kICY7RMAQf4puOGgNc9TKMn0ck/W6UC8Xip2smuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547186; c=relaxed/simple;
	bh=HeYIlAR8nWFagKNsyX5CZrsB5sOzO8ayCJ290pzyfLw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tXuMiLefiPTqtEMCVuxNqsZKHyFoOOXKGXG0eRQ6azBtj0OseKVmQ5ZPXqjWdMKa1RS3UVguGYL1x8tUKbe9UaZNeJZlKxxekmXSbXhqvymB6/abmWvbT2NBS0QDGSPqfe+4bQ2U6h8NVFfaowCQ+sa958NLe7cP+bwC9tRpGSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RE0RkU3g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RE0RkU3g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2441F00A3D;
	Mon, 20 Jul 2026 11:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784547184;
	bh=9pt33Tbx73NBLnlrXn7GxdfHurZ9owVrinp7us5FXF8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RE0RkU3gMmn8/MYQG88+JXeHTbGGC65elfutvw17VfmaLv3KY32UaWNxqq0qGnJU0
	 Fe4WvpMeJgIqoP5fE7s4wBPidfnFyVh+CJoCsexdVogg1n2+bMb/5/OMoDjZ33DBl9
	 ielfoyZuro0hF0itoCJyRcs66ak7ZSY3trp8Ms69SREiyUoXsdCYbbZU/DdwCUfiJz
	 Pj2e8vGh+GxcW3i7vgpuAlZisYg7symYf+Xtf2zjLmMN/zCZ0qLgpNRWf8tEu4B4C0
	 ZxF7CTdaYPHLo9NNv5qnTN4W6nkFRQps/i/2PWWILgFvNjDO/pxAboeUq2Bv0NDqwd
	 29Y+c109MxreA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/5] mfd: axp20x: Add support for AXP318W PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720-axp318-regulator-v5-4-a1afa7ee24f9@baylibre.com>
References: <20260720-axp318-regulator-v5-0-a1afa7ee24f9@baylibre.com>
 <20260720-axp318-regulator-v5-4-a1afa7ee24f9@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 11:33:03 +0000
Message-Id: <20260720113304.4E2441F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The MFD cell array `axp318_cells` hard-codes the MFD cell ID to 1 =
instead of using `PLATFORM_DEVID_AUTO`, violating MFD subsystem guidelines.
--

--- Patch [4]: [PATCH v5 4/5] mfd: axp20x: Add support for AXP318W PMIC ---
commit 76c82c1e91d9894a1be9b93884198b1f956c4a6b
Author: Andre Przywara <andre.przywara@arm.com>

mfd: axp20x: Add support for AXP318W PMIC

This commit adds support for the X-Powers AXP318W PMIC to the axp20x driver.
It describes the regmap and MFD bits, and exposes the regulator and interru=
pt
registers via I2C.

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

[Severity: High]
Does this hard-coded MFD cell ID cause naming collisions in sysfs?

Setting the cell ID to 1 instead of using PLATFORM_DEVID_AUTO can cause
device registration to fail due to a name collision on axp20x-regulator.1
if multiple MFDs defining the same cell name and ID are instantiated on the
same system.

> +};
> +
>  static const struct mfd_cell axp717_cells[] =3D {
>  	MFD_CELL_NAME("axp20x-regulator"),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-axp318-reg=
ulator-v5-0-a1afa7ee24f9@baylibre.com?part=3D4
