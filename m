Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E130A298CAB
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 17:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652352; cv=none; b=qiH31nzo/F3qsvGQIDzyAjj/2oaw3VCFoVtf4sEyEr4wzPcS2v0oFcRf7wO+JkTlruY0HH5sGN8571xBZGBDnDKjYuOOOhMkajrBned+Z6fwDdNYq/MTy3RkNGQPzi/3gK9OL6iY4A208dJuzveqnKDMabJ7WqVltE4zWIStb9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652352; c=relaxed/simple;
	bh=X4Q69YbrWIytUGUqops7vRN1hVBXTMnzjDbcpdA+iTs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=a+qo/1OnVGnMtOILmUcpp7FqS1vDeJHD7WdmLWkjamOvLm6sIKMtUJRR0gDStrHZfspr1Hy5kmLGeeYHfwtGfs3o67tpKs4L/e8uz3rHH1fK+Uucpiy5YU4YSiyzEUHj0kQPVEoZWeNLPTlM4xujYXTTkX0DmXphxhV3z2TM/wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DTedYhtd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DTedYhtd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7643F1F000FF;
	Sat, 10 Oct 2026 17:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791652351;
	bh=rnRIgaCO+SwJtkm0QJCHDR/XySkQKgddYztnMMcRTTM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DTedYhtd+/kW5FYd603JOKG+ktuRupulW/1y+cRirBisFBrWmsx5eomJNezDPzM39
	 52jzRavreH4gnVUmWn12Gkaz49JkGuWbx/L1c48O+GYGze6aISPdrBcH3b+D5ZaJSV
	 HncODwOs3XkwYvdgmx7nRyH3Vwu0MlhCmoxaSzV0K77E2myq2lthuYS3dWKQhqx8y1
	 Z9V5ziEghBL8ah5XAdmT8Tj9cRQn4th2n1shCSPLB7rXuiVftCh7ffROcF+OXEEKgi
	 U0M7BPWDYVdYhJUfvZ1NBvb+19vB+Fzunqu1QZFkoqK58MXrOlPYSgURIrSySzdhiu
	 JqgRdktJKaiSA==
Message-ID: <sashiko-outbox-166767@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 10/11] net: phy: ncn26000: Support for
 onsemi's S2500 internal phy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009-s2500-mac-phy-support-v9-10-dcefe1d0bf0d@onsemi.com>
References: <20261009-s2500-mac-phy-support-v9-0-dcefe1d0bf0d@onsemi.com>
 <20261009-s2500-mac-phy-support-v9-10-dcefe1d0bf0d@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 17:12:31 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] phy: ncn26000: incorrect mask used in interrupt status check
--

commit cb778753ba572a2fae81e527bd874be04eccae66
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: phy: ncn26000: Support for onsemi's S2500 internal phy

This commit adds support for the internal PHY of the integrated media access
controller S2500. It configures the PLCA tx opportunity timer's default val=
ue
for this device, compared to the currently supported NCN26000 PHY.

> diff --git a/drivers/net/phy/ncn26000.c b/drivers/net/phy/ncn26000.c
> index 6d433f4e2c45d..a33ebb2a7ecef 100644
> --- a/drivers/net/phy/ncn26000.c
> +++ b/drivers/net/phy/ncn26000.c
[ ... ]
> @@ -163,6 +169,26 @@ static int ncn26000_config_intr(struct phy_device *p=
hydev)
>  }
> =20
>  static struct phy_driver ncn26000_driver[] =3D {
> +	{
> +		PHY_ID_MATCH_MODEL(PHY_ID_S2500),
> +		.name                  =3D "S2500",
> +		.features              =3D PHY_BASIC_T1S_P2MP_FEATURES,
> +		.config_init           =3D ncn26000_config_init,
> +		.config_intr           =3D ncn26000_config_intr,
> +		.config_aneg           =3D ncn26000_config_aneg,
> +		.read_status           =3D ncn26000_read_status,
> +		.handle_interrupt      =3D ncn26000_handle_interrupt,

[Severity: Medium]
Is ncn26000_handle_interrupt() working correctly here?

Looking at drivers/net/phy/ncn26000.c:ncn26000_handle_interrupt(), it uses =
the
register address macro (NCN26000_REG_IRQ_STATUS, which is 17 or 0x11) as a
bitmask instead of the correct interrupt bit (NCN26000_IRQ_LINKST_BIT, BIT(=
0)):

    if (ret < 0 || (ret & NCN26000_REG_IRQ_STATUS) =3D=3D 0)
        return IRQ_NONE;

This inadvertently checks both bit 0 and bit 4 (NCN26000_IRQ_PLCAREC_BIT).

Consequently, if a PLCA receive interrupt occurs, wouldn't the driver
incorrectly trigger the PHY state machine?

While this logic existed previously in the driver, adding this callback
assignment newly exposes the S2500 device to the issue.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-s2500-mac-=
phy-support-v9-0-dcefe1d0bf0d@onsemi.com?part=3D10
