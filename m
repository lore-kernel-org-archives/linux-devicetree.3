Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD112F851
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 12:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857412; cv=none; b=tE/MIsx3J30xJYrIVWnFxYCGydKIgjbpQ0BpkkDY9+Uzhsr/8t3c5wNOX4/PsMjRfwQpnyGPwmkjBFTMBi6NEqyyQEodlHK7ODltsW0vNZCweI86eqVbbOst2QI/j78LVbp8XFDCLPbsFIzj3UyUD3XV3C6AgiZGfdDag+w+Mt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857412; c=relaxed/simple;
	bh=P3WmcqGomnYekTiZTwSHS3NCV1Jr6QvXiXMDDTmur4M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YWg5zVOez1C/JeTtCcx/blUgBmADtF683o/WDW/G3DNaWHK3kussMn64w+tZKqivPRRJXUF8vYwn5W0DkGFGLZRdcEtcy0ND+6vWskI+Re2ZmmZyPnVPwI3Ycd6aje4GfAVesEveVQ4E8a9JZGdL6jvOddT89PmtatuqmmKkzgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GUbM963Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GUbM963Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AA71F000FF;
	Thu,  1 Oct 2026 12:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790857411;
	bh=PiuvQfSMwIhhH2xla3ryUA6L6o12FA5tCbC6y0/uezU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GUbM963YJJic30IQPRgNkyOYd3Uizzj1mrHn5Q/IDHn+XrH6Q++4qRwUW5VGBBM/c
	 c1VLPXGMGP3I2zO+zZVerviK7t/2wuFKWVwXSy0pyrKrawKXZH2e4kneH/FavCOj+b
	 2QJTC0KIBn8FZhu+P5/TDoSXWqTDlmBY2VnNdlJl/fCQbJEA1yyQK6rhpjJ6L4Dkue
	 iecGqvJnc6Ia0IX0phOdB45gacSiRIwX0JIFmuf0Eu8jjomAEyvA7imx0gumLVT7CP
	 BjI+IYMYMeuqkeEtJt2ReYKTnCR2xmGUHp8+FmTCY92lZxqdsr1T00YAf0f6NFEYGx
	 mFfCykDte7Djw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] net: phy: mxl-gpy: release MxL86211C Super Isolate
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260930122305.293686-3-robert.marko@sartura.hr>
References: <20260930122305.293686-1-robert.marko@sartura.hr>
 <20260930122305.293686-3-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 12:23:30 +0000
Message-Id: <20261001122330.F2AA71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: phy: missing stabilization delay after Super Isolate release
--

commit 696acbb2e810bf2a7d2b0db83b48e8096bfe7dcf
Author: Robert Marko <robert.marko@sartura.hr>

net: phy: mxl-gpy: release MxL86211C Super Isolate

The commit clears the VSPEC1_PM_CTRL_SI bit in mxl86211c_probe() to release
the MxL86211C PHY from Super Isolate mode. This is done after registering
the MDIO voltage regulator and before generic initialization.

> diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
> index 4cbbfae046317..790075632fc3f 100644
> --- a/drivers/net/phy/mxl-gpy.c
> +++ b/drivers/net/phy/mxl-gpy.c
[ ... ]
> @@ -459,7 +456,15 @@ static int mxl86211c_probe(struct phy_device *phydev)
>  		return PTR_ERR(rdev);
>  	}
> =20
> -	return 0;
> +	ret =3D phy_modify_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_PM_CTRL,
> +			     VSPEC1_PM_CTRL_SI,
> +			     0);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D gpy_probe(phydev);

[Severity: Medium]
Will the hardware be fully initialized and ready to respond to MDIO reads
immediately after de-asserting the Super Isolate bit?

The commit message mentions that the PHY is halted after reset until
software releases it. If it behaves like a device coming out of reset, does
it require a stabilization delay (e.g., using usleep_range()) before
gpy_probe() reads the firmware version via phy_read()?

Without a delay, could this result in read failures or uninitialized
hardware responses if the PHY requires time to boot its firmware?

> +
> +	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930122305.2936=
86-1-robert.marko@sartura.hr?part=3D3
