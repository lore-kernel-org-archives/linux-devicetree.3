Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E4F411F8B
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066701; cv=none; b=C26H6NFB9//K/oZYfYOmskjxscB8bPbBrQUiLpuCW3cPUJTLmyjq0ZhvQ5jYsqmIFFtiZZTIDoVjpoMGQeFaqKFEJqqIpOI27vuio8xnitngl1bteJalv3TDdQ/Hke7i1+IHc+2xJtVfWSWWJ4uXCug0sIN4DsZmg6mtQzSjw4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066701; c=relaxed/simple;
	bh=WX5S70HTUdpSl27bnuJ+q953nrwLIr+uoVqTxJuxwO8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jh/899dvzuaFKuzBehXYE3igyKGo3HZ8vgyiU7owIkvlSkhNevxxxkhQTXAooGEZzKVwaQolV6450AZ4Qqayj6Ikz/vmbgLasG5WIqRBD4eXvoTw9k9lVdW3TeQx0vq4qEcdxz07oxk/jHbs1/pmaMcNFhLm2bMBIZN/BuhTpEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwMeyR/F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwMeyR/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F8B1F000E9;
	Tue, 18 Aug 2026 15:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787066700;
	bh=MO7jXdGJo9QygZhWAAze+TQqh72Oe9X6BoJeVi+zUsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hwMeyR/F81Y3c0620uMZ8/h8q8uoAsg8MK2YnLksGjdPqvbhgous1CogTZY9rEkr7
	 +srIPd6+QG50cybynA2T5npZLSXyMHo6dtyi7Y51FMdI1UTyoL0INghn1bl71TqU+a
	 RhNqtKuQ31KxkgWzTz7Zye7Te7hbc92mSSBRXSlkjsLCoWCWNx5H74ijTIBzT08mtJ
	 pSCO8Hfo2WWl0UVMl6LtgcaqpVpUA8/CJC6A6AEiSQK+vzITKg+jm7bXE1NpxKvFRB
	 IQdwVinfuEtlNNckWBADr0Rg7zHPdz8T3+jK3YF26y/viqt2o2bcKKM60U2/QZukho
	 8aMklQXsz4X9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] power: supply: qcom_battmgr: add Xiaomi taoyao
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: user.email <zstaseg@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260818151039.409767-3-zstaseg@gmail.com>
References: <20260818151039.409767-1-zstaseg@gmail.com>
 <20260818151039.409767-3-zstaseg@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 15:24:59 +0000
Message-Id: <20260818152459.E4F8B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing exposure of charge control thresholds for the Taoyao var=
iant.
--

--- Patch [2]: [PATCH v2 2/3] power: supply: qcom_battmgr: add Xiaomi taoya=
o support ---
commit 7dca11719c74cb544dcbbafa2547e26c0a56fd43
Author: Stanislav Zaikin <zstaseg@gmail.com>

power: supply: qcom_battmgr: add Xiaomi taoyao support
   =20
The Xiaomi taoyao firmware defines an additional BATT_CONSTANT_CURRENT
property (ID 12) between BATT_CHG_CTRL_LIM_MAX and BATT_TEMP, shifting
all higher battery property IDs by one.

> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/q=
com_battmgr.c
> index 7716eb9e1aff5..a16d226ac5b30 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -452,16 +453,87 @@ static const u8 sm8350_bat_prop_map[] =3D {
>  	[POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD] =3D BATT_CHG_CTRL_END_=
THR,
>  };
> =20
> +/*
> + * Xiaomi Taoyao firmware has BATT_CONSTANT_CURRENT (ID 12) inserted
> + * between BATT_CHG_CTRL_LIM_MAX and BATT_TEMP, shifting all subsequent
> + * IDs by one.
> + */
> +static const u8 taoyao_bat_prop_map[] =3D {

[ ... ]

> +	[POWER_SUPPLY_PROP_POWER_NOW] =3D BATT_POWER_NOW + 1,
> +	[POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD] =3D BATT_CHG_CTRL_ST=
ART_THR + 1,
> +	[POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD] =3D BATT_CHG_CTRL_END_=
THR + 1,
> +};

[Severity: Medium]
While you've explicitly mapped the charge control thresholds here for the
Taoyao variant, does qcom_battmgr_probe() actually assign a power supply
descriptor that exposes these properties?

Looking at qcom_battmgr_probe(), QCOM_BATTMGR_TAOYAO will fall through to
using sm8350_bat_psy_desc:

	} else {
		if (battmgr->variant =3D=3D QCOM_BATTMGR_SM8550)
			psy_desc =3D &sm8550_bat_psy_desc;
		else
			psy_desc =3D &sm8350_bat_psy_desc;

Since sm8350_bat_psy_desc lacks
POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD and
POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD, will these properties
be silently unavailable for Taoyao devices?

If they should be supported, does this require a dedicated power supply
descriptor or using sm8550_bat_psy_desc instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818151039.4097=
67-1-zstaseg@gmail.com?part=3D2
