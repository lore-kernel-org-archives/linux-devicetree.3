Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535A31E8320
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 06:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778309036; cv=none; b=gMZ2+/hBBINRob6L81bVoNCVZ+cXgqVtOcVzDH3LjqQfaMh+Qplg95FljaAldKTDh4U2EHKrnkt1NizcoU27g5WNQAcaWJQlcDOaaIgoVWpaVg300hLWQV22dfDR68/kdzzbAQe77wvetnBlnl+QP158WDeceR3nmkO5t6qr0PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778309036; c=relaxed/simple;
	bh=FRTNHzv1R/KEX/qtNuWmwoERIC5S4yxsaNwMBJLCbx0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZFRyLaauhvdUBHaS8jMZotstu+yGkTT4Mp1C2GbDi7ZsebtLXZxYXIkjeKfvDmC1xYw0weKMp6w0vB9ULXs8RiP0qFKv6piqMD4tyyJ0ZxBbY374anWFZLUkilUrJvIzlLOlTkhvalPYARHX2E9duY+OZwIP+9eZZKg99bKkMRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vf142jhL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vf142jhL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1D1C2BCB2;
	Sat,  9 May 2026 06:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778309036;
	bh=FRTNHzv1R/KEX/qtNuWmwoERIC5S4yxsaNwMBJLCbx0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Vf142jhL091Eoddy8EHRvALZhqoHs1lyINDpE+HtQ+ifGe7eHjLUlELGFLBBOnP+c
	 pZN3MiecKdX5Dp8DEOoWORlQTnDdYLjEyIetBLi7/j933o6Tg3csnLBDKX/RnQ5KXI
	 erNm2ISfz0Wh7ml83gP9kv80DnTgVHPJuh+GjXRtFrvE8iq+ZAKedENQdf6P2lVFp1
	 Gj628xfMYECFuEFWFB+V+Wcja0xi2WFOlTi0V/Sajk3st6c7glbt6YOyUsC5tt1zJX
	 AfLh2CqZxG6Q8cy+MogppYAGrP3/MoQAnHdHjeuTB+hNf0kAU58o+AhSakUjBuxuXv
	 JtiXlrHd8heSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] scsi: ufs: dwc: Rename amd-versal2 read/write
 PHY API and move to dwc common file
Reply-To: sashiko@lists.linux.dev
To: "Minda Chen" <minda.chen@starfivetech.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260509062759.125472-3-minda.chen@starfivetech.com>
References: <20260509062759.125472-3-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 06:43:55 +0000
Message-Id: <20260509064355.EB1D1C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The functions `ufs_dwc_phy_reg_write` and `ufs_dwc_phy_reg_read` u=
se `static` local arrays (`phy_write_attrs` and `phy_read_attrs`) which are=
 modified on every call, creating a severe data race.
--

commit b544cff60ab1cb7a813f07b65debab2ffee3a426
Author: Minda Chen <minda.chen@starfivetech.com>

scsi: ufs: dwc: Rename amd-versal2 read/write PHY API and move to dwc commo=
n file

This commit moves the read/write PHY register APIs from the AMD versal2
driver to a common file. This allows other vendors using the designware
UFS MIPI PHY to reuse the code.

> diff --git a/drivers/ufs/host/ufshcd-dwc.c b/drivers/ufs/host/ufshcd-dwc.c
> index 21b1cf912dcc6..b057a78e151c4 100644
> --- a/drivers/ufs/host/ufshcd-dwc.c
> +++ b/drivers/ufs/host/ufshcd-dwc.c
> @@ -15,6 +15,59 @@
>  #include "ufshcd-dwc.h"
>  #include "ufshci-dwc.h"
> =20
> +int ufs_dwc_phy_reg_write(struct ufs_hba *hba, u32 addr, u32 val)
> +{
> +	static struct ufshcd_dme_attr_val phy_write_attrs[] =3D {
> +		{ UIC_ARG_MIB(CBCREGADDRLSB), 0, DME_LOCAL },
> +		{ UIC_ARG_MIB(CBCREGADDRMSB), 0, DME_LOCAL },
> +		{ UIC_ARG_MIB(CBCREGWRLSB), 0, DME_LOCAL },
> +		{ UIC_ARG_MIB(CBCREGWRMSB), 0, DME_LOCAL },
> +		{ UIC_ARG_MIB(CBCREGRDWRSEL), 1, DME_LOCAL },
> +		{ UIC_ARG_MIB(VS_MPHYCFGUPDT), 1, DME_LOCAL }
> +	};
> +
> +	phy_write_attrs[0].mib_val =3D (u8)addr;
> +	phy_write_attrs[1].mib_val =3D (u8)(addr >> 8);
> +	phy_write_attrs[2].mib_val =3D (u8)val;
> +	phy_write_attrs[3].mib_val =3D (u8)(val >> 8);

Could moving this function into common code expose a data race regression?

Since phy_write_attrs is declared static, it is allocated in global memory =
and
shared across all threads and UFS device instances.

If multiple host controllers probe asynchronously or undergo concurrent pow=
er
state changes, will they clobber each other's register addresses and values
here before calling ufshcd_dwc_dme_set_attrs?

Would it be safer to remove the static keyword so this structure is safely
allocated on the stack per-invocation?

[ ... ]

> +int ufs_dwc_phy_reg_read(struct ufs_hba *hba, u32 addr, u32 *val)
> +{
> +	u32 mib_val;
> +	int ret;
> +	static struct ufshcd_dme_attr_val phy_read_attrs[] =3D {
> +		{ UIC_ARG_MIB(CBCREGADDRLSB), 0, DME_LOCAL },
> +		{ UIC_ARG_MIB(CBCREGADDRMSB), 0, DME_LOCAL },
> +		{ UIC_ARG_MIB(CBCREGRDWRSEL), 0, DME_LOCAL },
> +		{ UIC_ARG_MIB(VS_MPHYCFGUPDT), 1, DME_LOCAL }
> +	};
> +
> +	phy_read_attrs[0].mib_val =3D (u8)addr;
> +	phy_read_attrs[1].mib_val =3D (u8)(addr >> 8);

Does this static array have the same concurrency issue as phy_write_attrs
above?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509062759.1254=
72-1-minda.chen@starfivetech.com?part=3D2
