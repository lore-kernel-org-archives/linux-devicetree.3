Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BAA442B1D
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 19:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789415064; cv=none; b=WPuwUDF1X4wqukHq3tMlEvUZHooeGINYkXZbl42U4Y9DbZPbCld20rdVnmCX7LwFUZ+mfnhos6NVDQ178NtXEGh6209dxNM82pTEJ0KkUrqO72LPQNTwZCWOWuSe9eslCrot7C9FojQUk+0M5BXwQGccY3oqjtB0RyqnHk+QndA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789415064; c=relaxed/simple;
	bh=DBVfptiLaAY0jgkxgc1ZkUU7O+YhHp43xLiTAjElyAs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YVrLnlQuK/792zkdcWJNcJJWnPfcKtu7seqTRqNF0G31KKTUcPg5HmzhOt7y9Kldm8XwtCi0H0z9JKfln/kmULNFIYG99KCmM3g1CdZPreetIXOZ5L3l8gyNRP6xvPUVdx7T7uAQ4pc11i3nptYnw+RrX8ZPQmgP9seyJ5m2KMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njb24naR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njb24naR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944211F00893;
	Mon, 14 Sep 2026 19:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789415062;
	bh=lqI3ODgO2LNSJBicniYkHecRRZp2tEoUeHm8xIYO/4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=njb24naRFr4370jvLpu2zSQy9Pp+LFi1K/4vV+nRJLxeSqL2oKxSJ/fOvNEimIlzW
	 Bq+yAP6NtCMGxg0FwCpX4zB0dz1QnWoSdTS6m7g56C0Ox1htRKSJxomB6jzZcZhom4
	 K+U2RY2wmFoIfdSzbc0woh2AbeCd8/FDOXNabdV/rs3eLQmkXUGN5RygIAm21D7jnZ
	 tZ/pnC6WoS2lj+Ssqj5QENdoqd32UxBsSn1WyJVZII0+oaHnI9fXogCzxAys+huUMg
	 V/LPl+FnCf7Mk1/W0t9HPrLBPpamVQFqqS3dFNBTowCo2z2sQSCj9EU9l5njQoIkQS
	 u3zxaHV4g5rGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 06/11] net: pcs: xpcs: add ANRESTART support
 for SGMII link recovery
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260913185849.907479-7-coiaprant@gmail.com>
References: <20260913185849.907479-1-coiaprant@gmail.com>
 <20260913185849.907479-7-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 19:44:21 +0000
Message-Id: <20260914194421.944211F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unconditionally applying the RK3568 SGMII AN restart quirk cause=
s an infinite interrupt storm or workqueue loop on standard interrupt-drive=
n DW XPCS configurations.
--

commit 78eb5488d0c0d3fe9f609e56e59710ced52856fa
Author: Coia Prant <coiaprant@gmail.com>

net: pcs: xpcs: add ANRESTART support for SGMII link recovery

This patch adds BMCR_ANRESTART to DW XPCS when configuring auto-negotiation
and when the link goes down. This is intended to resolve an issue on some
platforms (like RK3568) where the PCS does not automatically restart
auto-negotiation when the link goes down and comes back up.

> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> index 0337e2bcc0125..8c3875b6985b9 100644
> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c
[ ... ]
> @@ -1093,9 +1107,18 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs=
 *xpcs,
>  		return 0;
>  	}
> =20
> -	/* Clear AN complete status or interrupt */
> -	if (state->an_complete)
> -		xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
> +	if (state->an_complete) {
> +		/* Clear AN complete status or interrupt */
> +		ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Initiate the next round of AN */
> +		ret =3D xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTART,
> +				  BMCR_ANRESTART);

[Severity: Medium]
Could unconditionally applying this AN restart quirk cause an infinite
interrupt storm or MDIO polling loop on standard DW XPCS configurations?

If a cable is disconnected on an SGMII port, the PHY may continuously trans=
mit
the 'Link Down' AN configuration word. When the MAC completes AN and genera=
tes
an interrupt, xpcs_get_state_c37_sgmii() is called. It clears the interrupt
and unconditionally sets BMCR_ANRESTART.

Will this cause the hardware to reset its AN state machine, immediately
complete AN again with the PHY's continuous 'Link Down' word, and fire anot=
her
interrupt, creating an endless loop?

Should this behavior be isolated to only the platforms that require the qui=
rk
(like RK3568), rather than applied to all hardware using the DesignWare XPC=
S IP?

> +		if (ret < 0)
> +			return ret;
> +	}
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913185849.9074=
79-1-coiaprant@gmail.com?part=3D6
