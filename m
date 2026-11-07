Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794093552;
	b=5G898xlKGRpgDCIPiWZSFD9IW+WXqyZeWxxEBF/YX9yG2LPpC5FpTId2e/dH2WwSqKDk
	 RBmTZGAmP1sbSsbn3OLoVgAOouVGLILt+wOUSb/tBt8IxdviSYIOBkPsrgQcB6yW3kJOI
	 d3OmQb1YIgtsTuddaZOra+8EDQEUcf9s487wghY6o4OJlrNuuaOvvYjFk68J8knSQdICG
	 WpjJXRh0Vf48h0bRuAo9HlgUOIIynYnS2jQ6+7vM1i+9S3pMCC3ltVHnKxw/CpDJRb3Dy
	 6phL2bjCjoGDhfWtYtQ0rwm4/7a6+SeDZMqYhPZME6w4o8iH9fQTJTqPYgbgElb2T7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794093552;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6Faxq69zmj7KieOStTwutIA6SovgKaTE2M+ZprmIjUU=;
	b=MmvrPYUV/lbii0wuoY1KbY1B5B/7MjKM5Yi/chRBxEDq2FvN9nKoUk2dXHI+3NJRoxAx
	 GYoE6YxBBoYg57g6i/6qTrI7IbesOLK1uZM9q8m8ohF6wT5D8E74sbpZd6DHi/gij/MMg
	 fqK07+zJX51vto0COd5PyJVTYRWHrJm14ozngHiviKcPQCQ/EyEkHfcCFJ6XsLnBzq7Qt
	 v8yCnsCcP+rAGz38G5dgSu0GCmSRY6OfRUyHcCp+46a2ndEPpNdxCb6Fzxsau39QXVmcX
	 6bNYVOpgh+Gqu5AWrNFhyeCBaipUkFvmycsSszorIPtN0n1rwio5cZUfr+guMZ6dKsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iqkwdsNd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11321606A326
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 23:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iqkwdsNd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F67D1F008A5;
	Sat,  7 Nov 2026 23:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794093551;
	bh=6Faxq69zmj7KieOStTwutIA6SovgKaTE2M+ZprmIjUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iqkwdsNdcMueT3ILbxwNMyMoTYJSZ8eUO7OEoqGPoRf8X8qQTHHBH2B7RRGt2xBni
	 ieCdYqTMWc8pAbkc9NDOkQH5MxlFI/JYjgmYou4tXeCrTgF6xZKtc3syoVdfKD5qPA
	 Rm9h0y6PKPJhReIyee2KBUpFWH4JR75UavarG6TKuYEVJ0EZlGoWadKjDryBz6cqWK
	 KCQ+ce9eJsI/qSxXI+6TsiSJOlS8yh71ANNDnIn7FAEJ46p0QIAsiEsIMcdEtahsRM
	 68rwaX8+DXjQgXDLVjv2JPmDwhU+pn2s9j3G+RXvXayBPpk6G2LKJ+rK6+Gl1aoWKn
	 Eua59Yh7T/KBg==
Message-ID: <sashiko-outbox-203382@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 06/11] net: ethernet: oa_tc6: Support for
 vendor specific MMS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-s2500-mac-phy-support-v10-6-31b5a69b85b7@onsemi.com>
References: <20261106-s2500-mac-phy-support-v10-0-31b5a69b85b7@onsemi.com>
 <20261106-s2500-mac-phy-support-v10-6-31b5a69b85b7@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 23:19:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] net: oa_tc6: oa_tc6_set_vend1_mms() called after PHY init in
  oa_tc6_init()
- [Medium] net: oa_tc6: NULL deref in oa_tc6_phy_exit() on capability
  read failure
--

commit e3d2308dcadfed4c734bdcf29ba226ef0116d5e7
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Support for vendor specific MMS

This commit adds oa_tc6_set_vend1_mms() to allow MAC-PHY drivers to map
MDIO_MMD_VEND1 Clause 45 accesses to a vendor-specific Memory Map Select
(MMS) value.

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_main.c b/drivers/net/ethe=
rnet/oa_tc6/oa_tc6_main.c
> index e793d7fb0635f..5b2454b759740 100644
> --- a/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
> @@ -266,6 +266,18 @@ static int oa_tc6_update_standard_capability(struct =
oa_tc6 *tc6)
>  	return 0;
>  }
> =20
> +/**
> + * oa_tc6_set_vend1_mms - Add vendor specific MDIO_MMD to OA TC6 MMS
> + * mapper value.
> + * @tc6: oa_tc6 struct.
> + * @mms: vendor defined MMS value for VEND1 mdio device.
> + */
> +void oa_tc6_set_vend1_mms(struct oa_tc6 *tc6, int mms)
> +{
> +	tc6->vend1_mms =3D mms;
> +}
> +EXPORT_SYMBOL_GPL(oa_tc6_set_vend1_mms);

[Severity: Medium]
Can oa_tc6_set_vend1_mms() be called before the internal PHY is probed
and initialized?

struct oa_tc6 is allocated inside oa_tc6_init(), which initializes
tc6->vend1_mms to -EOPNOTSUPP and then calls oa_tc6_phy_init(tc6) before
returning the tc6 pointer to the caller:

drivers/net/ethernet/oa_tc6/oa_tc6_main.c:oa_tc6_phy_init() {
	...
	ret =3D oa_tc6_mdiobus_register(tc6);
	if (ret)
		return ret;

	tc6->phydev =3D phy_find_first(tc6->mdiobus);
	...
	ret =3D phy_connect_direct(tc6->netdev, tc6->phydev,
				 &oa_tc6_handle_link_change,
				 PHY_INTERFACE_MODE_INTERNAL);
}

Because oa_tc6_mdiobus_register() and phy_connect_direct() synchronously
run the PHY driver's .probe(), .get_features(), .soft_reset(), and
.config_init() callbacks inside oa_tc6_init(), any Clause 45 access to
MDIO_MMD_VEND1 during PHY initialization sees tc6->vend1_mms =3D=3D
-EOPNOTSUPP and fails.  Calling oa_tc6_set_vend1_mms() after
oa_tc6_init() returns also modifies tc6->vend1_mms without
synchronization while the MDIO bus is already registered and live.

Passing vend1_mms into oa_tc6_init() (for example via struct
oa_tc6_quirks or an init config struct) would set it before
oa_tc6_phy_init() runs.

[ ... ]

> @@ -1658,6 +1672,7 @@ struct oa_tc6 *oa_tc6_init(struct spi_device *spi, =
struct net_device *netdev,
>  	SET_NETDEV_DEV(netdev, &spi->dev);
>  	mutex_init(&tc6->spi_ctrl_lock);
>  	spin_lock_init(&tc6->tx_skb_lock);
> +	tc6->vend1_mms =3D -EOPNOTSUPP;
>  	tc6->ttsc_current_id =3D OA_TC6_TTSCA_REG_ID;
>  	INIT_LIST_HEAD(&tc6->tx_ts_skb_q);

[Severity: Medium]
In oa_tc6_init(), does a failure in oa_tc6_update_standard_capability()
cause a NULL pointer dereference in oa_tc6_phy_exit()?

Commit "net: ethernet: oa_tc6: Support for hardware timestamp" earlier in
this series added oa_tc6_update_standard_capability() before
oa_tc6_phy_init(), jumping to phy_exit on failure:

drivers/net/ethernet/oa_tc6/oa_tc6_main.c:oa_tc6_init() {
	...
	ret =3D oa_tc6_update_standard_capability(tc6);
	if (ret) {
		dev_err(&tc6->spi->dev, "Failed to read capability\n");
		goto phy_exit;
	}
	...
	ret =3D oa_tc6_phy_init(tc6);
	...
phy_exit:
	oa_tc6_phy_exit(tc6);
	return ERR_PTR(ret);
}

Because oa_tc6_phy_init() has not run yet at that point, tc6->phydev and
tc6->mdiobus are still NULL, so oa_tc6_phy_exit() passes NULL to
phy_disconnect() and mdiobus_unregister() whenever OA_TC6_BROKEN_PHY is
not set.  Returning ERR_PTR(ret) directly, as the adjacent error paths
before oa_tc6_phy_init() do, avoids calling oa_tc6_phy_exit() before PHY
initialization.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-s2500-mac-=
phy-support-v10-0-31b5a69b85b7@onsemi.com?part=3D6
