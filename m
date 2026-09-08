Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27074FB9A3
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 15:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882053; cv=none; b=h0W+fRRxhY8P8ZbGHJlYEXNM7CaxlIx3UmM0ZU3P3UZr3pRACv2vpWwI030M5GaVwg8HWJIlGIVMINGc/czS0TjuI0lXqnl9jyDz2vjP6lEStn/e3ko/lrKmPEvhFVTcm/oC7PP0JAe86xEBJDc1xxaH9v8+EL+evk2iDdrrfpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882053; c=relaxed/simple;
	bh=xP+SGTJ0UeVr5NeGVk9ATENN9MhV2ZGSZKnihroPGgo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MUqE7t1YEZgVZquqbTiK+P+60ApMkMQd8/uljjRAak7G2zae+9yCFoeIQQLGGsTWAS/465v9dSHEntdzlfUC7wsXHqCumBOXkN7TgXGP9wzXf5uIPj57XW//7q5vd8G/rtavc1YUZUBnWD0be8GzvS3TJtKArtTvfUxxqkxtQRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 665AF1F00A3D;
	Tue,  8 Sep 2026 15:40:50 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 06/10] net: pcs: xpcs: add ANRESTART support
 for SGMII link recovery
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com, robh@kernel.org, neil.armstrong@linaro.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260907153713.2572547-8-coiaprant@gmail.com>
References: <20260907153713.2572547-2-coiaprant@gmail.com>
 <20260907153713.2572547-8-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 15:40:26 +0000
Message-Id: <20260908154050.665AF1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Stale comment contradicts new ANRESTART behavior.
--

commit 553a0aad47033d8800155c135475e03ebbeacf26
Author: Coia Prant <coiaprant@gmail.com>

net: pcs: xpcs: add ANRESTART support for SGMII link recovery

This commit modifies the XPCS driver to trigger ANRESTART alongside ANENABLE
to ensure auto-negotiation correctly restarts on link state changes for
certain hardware. It applies this both when starting AN and when the link
is down but AN completion is detected.

> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> index 0337e2bcc0125..50b9cdf94fdaa 100644
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
Since this change explicitly triggers AN restart here, does the comment
earlier in xpcs_config_aneg_c37_sgmii() need to be updated?

The block comment at the top of the function currently states:

        /* For AN for C37 SGMII mode, the settings are :-
[ ... ]
         * Note: Since it is MAC side SGMII, there is no need to set
         *       SR_MII_AN_ADV. MAC side SGMII receives AN Tx Config from
         *       PHY about the link state change after C28 AN is completed
         *       between PHY and Link Partner. There is also no need to
         *       trigger AN restart for MAC-side SGMII.
         */
        =20
It seems the new code logic contradicts the last sentence of this comment.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907153713.2572=
547-2-coiaprant@gmail.com?part=3D6
