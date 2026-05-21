Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6FB395ACE
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 17:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779386260; cv=none; b=mfNVhX6Ns/0WZoBMlkpyyveoa1pOV97J7uB4pBcerm4/AEaz34OYsbmlLGXkszmIcVqML6+syh7nXJZbum4mZpHft/EHeHQ8HmWkCO8Owd7hCKWgtPLn4EOIVAuKqBpgD2RRp+LNLV3zPR+1gkYV9Nd7Qiq5Zv5LeuGvBzOQ6b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779386260; c=relaxed/simple;
	bh=EfsaR4zYXku5FBGWWJFCsRPsYTXtAknNHNRFsTZoQCo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HomELp4MC7/de4TAY3yEDmQ5S0re5/VZvG4Lhn7uxTT5gTAJOO9LCV9iYciIRTuoZdJ/eZq8602PSMVOxn88jc2jSURdrByn1N24518dcjlN9hojmMUzSmMZv787bzVBqdRYIWzdhKdvXJ+ZIeJ6wEetUQW3PnnhSzaYY5Nkj9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSV7UG02; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSV7UG02"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15271F000E9;
	Thu, 21 May 2026 17:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779386259;
	bh=BUcG+U3UgMRjWGpJOaK7MCJ/ZP0SZJgBr3dl+BpdgwI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lSV7UG02zqVgRF0k0+URxGty6pO4pwkb+Ey7nvJtoEd5ThWhY2FxOFmoIcw2XSxrj
	 pI65dPC+hUySMNbhuNJZH+M8gm32YRu4hJVBMW0/Pm6dQEqwvi2GRCRY2TdYrgN3gm
	 cuiLAfr1K9KuxPhfZYjPn3CPbPCC716u0F7+gNo2ySWApORVfSZH+lHkJEWMxxye03
	 eenROWGZYJpF+a0UrYgj+M00dnS/9efEveF3vGEe8rROlyoD+fXRAnVuvDPUjw4Wal
	 tKwtidJM9IoJpQsCcTGyg5tJ9z5REBHMnroPaPYKJbmy/RDCHzeM1WlnxDLm5OnTR5
	 PiDMjfRl+boFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] regulator: Add regulator driver for Unisoc
 SC2730 PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?T3R0byBQZmzDvGdlcg==?= <otto.pflueger@abscue.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521-sc2730-regulators-v4-4-1ac8a3b5ed82@abscue.de>
References: <20260521-sc2730-regulators-v4-4-1ac8a3b5ed82@abscue.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 17:57:38 +0000
Message-Id: <20260521175738.F15271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The register offset for `SC2730_LDO_VDDCAMIO_VOL` is defined as `0=
x28`, which breaks the LDO register layout pattern and points to the DCDC/g=
lobal control region. This is highly likely a typo and could cause silent c=
orruption of another PMIC register when setting the LDO voltage.
--

commit 5c1a2f6397caa4ad7997b2f6f912d7c202d97041
Author: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
Subject: regulator: Add regulator driver for Unisoc SC2730 PMIC

This commit adds a regulator driver for the Spreadtrum/Unisoc SC2730 PMIC,
which is used with SoCs like the UMS512 and UMS9230. The new driver is
based on a downstream Unisoc driver and the existing SC2731 driver.

> diff --git a/drivers/regulator/sc2730-regulator.c b/drivers/regulator/sc2=
730-regulator.c
> new file mode 100644
> index 0000000000000..9e40c6eae4943
> --- /dev/null
> +++ b/drivers/regulator/sc2730-regulator.c

[ ... ]

> +/*
> + * SC2730 vsel register
> + */
> +#define SC2730_DCDC_CPU_VOL		(SC2730_REGULATOR_BASE + 0x44)

[ ... ]

> +#define SC2730_LDO_AVDD18_VOL		(SC2730_REGULATOR_BASE + 0x104)
> +#define SC2730_LDO_VDDRF18_VOL		(SC2730_REGULATOR_BASE + 0x110)
> +#define SC2730_LDO_VDDCAMIO_VOL		(SC2730_REGULATOR_BASE + 0x28)

[Severity: High]
Is 0x28 the correct offset for the VDDCAMIO voltage register?

All other LDO voltage and power-down registers are clustered in the 0x100
to 0x210 range. Defining this at 0x28 places it in the DCDC or global
control region.

Could writing voltage configurations to this offset fail to configure the
VDDCAMIO regulator and potentially corrupt another PMIC register instead?

> +#define SC2730_LDO_VDDWCN_VOL		(SC2730_REGULATOR_BASE + 0x120)
> +#define SC2730_LDO_VDDCAMD1_VOL		(SC2730_REGULATOR_BASE + 0x12c)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-sc2730-reg=
ulators-v4-0-1ac8a3b5ed82@abscue.de?part=3D4
