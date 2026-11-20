Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167181;
	b=h5at0wuGPnoUzPINytGKUralnPI0cTZ4YkeS9fv4G6POpG6IXTziZ5LTQnsxIYUkcAo+
	 0T7vLsHy0VXbB7Kv3HpONiZvMKongQtxSJwj+Nau8a4pIULj88r5dbpNVbyHSkzE6rXml
	 gUekmEGuyMLe27GYYDhFEX6ii27aeApQdZrDE4jD1j8oxFbH4HfYJFZC18FZWN1pZV3WV
	 0yHldwrzXk0ZzLhckI/0JXULTGENMZ7ktNucqCbOK67pKuXIOmd09jRk7MdwUHyomn81X
	 u2ns11xRNSl9d8vN/Rz/z42ypLfX2rvLQZq5Rla9HLMI7E3cLNs3RNal07xMfmiLA8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167181;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iGBX4zPdjrEicp5vNcMxh0PDlqBYs9v7+a6bzr8K3yo=;
	b=RMSsZ52CRrbAn+NkoWamT0zrftRt3250yvggg+wPvYDaXH0w3pWNJxs0sigOCziX2zla
	 FbJWD+NJ2h7aj3raOajUyDcMjUA4XgR+zVrXOqOHb12GFneWztsW/DIQsEKmuzBvIE4OS
	 j4a29dPZc5m8LeotDlaRlx+4SXjxebIP/b2RAsOpRAMunfOzF58OamHpLBcm9hvA31VlN
	 9KdvmKtwbE2s6rffzUiy76F3iZB6zenQ0/BZMBIOBGjMYI3kb7385KsRiiXy+lO9ND2Ny
	 fwNcGgEqmv3R2G/C3mY9xZOHkEylpymgl9dMZkWdbb47GTD9JJHS29OzBUBNreWtuMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RpKvmHsM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A19D606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RpKvmHsM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27E61F000CF;
	Fri, 20 Nov 2026 09:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795167180;
	bh=iGBX4zPdjrEicp5vNcMxh0PDlqBYs9v7+a6bzr8K3yo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RpKvmHsMoQofwWM3J1aUHRccwh9hJ6tfZSjfS0fDYvqiQ/1EiZSoEy0cRqkIkGYZT
	 Wr8Us8wxTk5Nfbxp6/qNbxEToPadlvj+gv/ze0LN2V2I9mY8UgDwnPyKJBS06N3qo4
	 rCdADBdH37FxrSM+xrjXOqUU92NBgpqMrITAi1F35IcljAKUqWRvGt477kTF6FuWWO
	 USZSbVVi39JDpc3Pc7ZlnO/vm/pwSFM6o3xYt5jBXsy6X4EKn3sGFsinoVwttc8xtc
	 so0MRM6eTPHny0VrMb/MTIFHYFV5G1G9xkhL/rOGj/qfbCWcAVeQUjKguY6QN+kGMj
	 Tyc/LbTNzvPOg==
Message-ID: <sashiko-outbox-224858@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 5/7] net: ftgmac100: Require phy-mode for
 AST2700
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-support_ast2700-v7-5-33c8ca2d0dd7@aspeedtech.com>
References: <20261119-support_ast2700-v7-0-33c8ca2d0dd7@aspeedtech.com>
 <20261119-support_ast2700-v7-5-33c8ca2d0dd7@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 09:33:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: ftgmac100: unreachable AST2700 phy-mode check in
  ftgmac100_mii_probe()
--

commit b86b29199842bf4516e7a704118276e8a5eb8767
Author: Jacky Chou <jacky_chou@aspeedtech.com>

net: ftgmac100: Require phy-mode for AST2700

This commit requires the device tree "phy-mode" property to be specified
on AST2700 in ftgmac100_mii_probe(), returning -EINVAL instead of
defaulting to RGMII.

> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ether=
net/faraday/ftgmac100.c
> index 9b7becb017262..5a578a62df673 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1526,8 +1526,13 @@ static int ftgmac100_mii_probe(struct net_device *=
netdev)
> =20
>  	/* Default to RGMII. It's a gigabit part after all */
>  	err =3D of_get_phy_mode(np, &phy_intf);
> -	if (err)
> +	if (err) {
> +		if (priv->mac_id =3D=3D FTGMAC100_AST2700) {
> +			dev_err(priv->dev, "phy-mode is required for this SoC\n");
> +			return -EINVAL;
> +		}
>  		phy_intf =3D PHY_INTERFACE_MODE_RGMII;
> +	}

[Severity: Medium]
Can this FTGMAC100_AST2700 check ever be reached?

ftgmac100_mii_probe() returns -ENODEV right above this when !priv->mii_bus,
and priv->mii_bus is only allocated by ftgmac100_setup_mdio(), which
ftgmac100_probe() only calls for FTGMAC100_FARADAY, FTGMAC100_AST2400, and
FTGMAC100_AST2500:

drivers/net/ethernet/faraday/ftgmac100.c:ftgmac100_probe() {
    ...
	if (priv->mac_id =3D=3D FTGMAC100_FARADAY ||
	    priv->mac_id =3D=3D FTGMAC100_AST2400 ||
	    priv->mac_id =3D=3D FTGMAC100_AST2500) {
		err =3D ftgmac100_setup_mdio(netdev);
		if (err)
			return err;
	}
    ...
}

For FTGMAC100_AST2700, priv->mii_bus is always NULL, so
ftgmac100_mii_probe() always exits with "No MDIO bus available" before
reaching of_get_phy_mode().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-support_as=
t2700-v7-0-33c8ca2d0dd7@aspeedtech.com?part=3D5
