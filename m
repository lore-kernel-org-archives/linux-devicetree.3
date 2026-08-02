Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F45265629
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 14:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785680739; cv=none; b=Nez891xsvXumBwL0guy57/9zHC6bAOe+q9jcNoHZ3oakV6UX7e0ZnkedQWS9q7MdPjilDIOSK4YirINtstX5ZqWs2bgSV3g+IqjR/VRZKmTFeqIz3X3fqbA6TSrsDEizE50f5Px04Hv671i9Ihj9zaaxLX2Rlg3lvYe33u79K0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785680739; c=relaxed/simple;
	bh=4zMpT+pPI2McsfOkXJyhzizy3uWgngyS1AR2yDrDQsA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a8p8KSd3359+UGwgz3lQXNp2alA/2TBKXbAElBqBY678m+nO/HjvDXni9VrJrIH+3QG9abadUOx2CbhBXfYhVflio954iiMPbmWn3Qvn88cnETGXFGOqk/+u7HJy6L+5u4O8tAwpvpYtue0E0BjWOQS2AbwXDmjXyfnsys4CfoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WjfO60iZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WjfO60iZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173511F00A3A;
	Sun,  2 Aug 2026 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785680738;
	bh=Ajfk1sWm/rfcHxaz74GWCemxT4vUasqcda/MNI7Zs0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WjfO60iZpjEiVIr3wMWpd1E7ZDmIj83TmJpOr8dlz/5vDse1GsK8491KYVgftRooz
	 MkRqy+wkZO5+uDUD5WbyMYYZKQx1tA170LRRBfBzrT+FdhPYezVw/MHc+CO1+Poldv
	 TyyQNICALZXUgPveWAcMereQvsTNF79Ps+0pkKUWLmXr5Cofnb9+/lBLFwSPn01Qie
	 JvicybI63OB0cVSPdkJ8Hc9GpepMdRCysmPEGQ/9JVTINJaUeG+mmCco32MxFrLt8h
	 +6shiaQYAmCCvVWGlf0oP+ECLCP8D5Lj+1wB/gGf0I6d4blKmThu8EmIsp6JKU97ne
	 U923Z6t1T+Qvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/10] net: pcs: xpcs: add ANRESTART support for
 SGMII link recovery
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20260801142244.679437-8-coiaprant@gmail.com>
References: <20260801142244.679437-2-coiaprant@gmail.com>
 <20260801142244.679437-8-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 14:25:36 +0000
Message-Id: <20260802142537.173511F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Stale documentation: the patch introduces BMCR_ANRESTART for MAC-si=
de SGMII but fails to update the block comment that explicitly states this =
is not needed.
--

--- Patch [6]: [PATCH v2 06/10] net: pcs: xpcs: add ANRESTART support for S=
GMII link recovery ---
commit 2bc2528d92a030c16f9b0b3ce9ca602d98573c26
Author: Coia Prant <coiaprant@gmail.com>

net: pcs: xpcs: add ANRESTART support for SGMII link recovery

This commit adds ANRESTART support for SGMII link recovery on hardware
using the DesignWare XPCS IP. It sets BMCR_ANRESTART when starting
auto-negotiation and triggers it again if the link goes down after
completion to ensure the negotiation restarts properly.

> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c
> @@ -816,9 +816,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs=
 *xpcs,

[ ... ]

>  	if (neg_mode =3D=3D PHYLINK_PCS_NEG_INBAND_ENABLED)
>  		ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
> -				 mdio_ctrl | BMCR_ANENABLE);
> +				 mdio_ctrl | BMCR_ANENABLE | BMCR_ANRESTART);

[Severity: Low]
This isn't a bug, but does this change make the large block comment earlier
in xpcs_config_aneg_c37_sgmii() contradictory?

The existing comment explicitly states:
"There is also no need to trigger AN restart for MAC-side SGMII."

Since this patch adds the BMCR_ANRESTART flag to the MAC-side SGMII path,
should the comment be updated to reflect the new behavior?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801142244.6794=
37-2-coiaprant@gmail.com?part=3D6
