Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F48238C2A
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 13:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786194834; cv=none; b=epIMRFnhRLj5QNVzK9Tlu3ShvfqdqIDQ5rKP/3yMMSn0Hwf+RP2qjy4/JDUmp9dIBXxOvdpCgHaPxwp1CSQhAsqSQTdbY7B+OkRgXE3G80aqoTsvc3cQqDGugOZSEZccep4ZBJbJLYW9vxXb0MG/EU82cpZvfti1Vsgngg0Y7/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786194834; c=relaxed/simple;
	bh=vjQih0t5cokdHoDkdUTcnpraqsW7Q2JCHsNFDE8/r10=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NHpgn2b7tJDvrCZGKejJ3iZAbJ4vMLdWXe2erKXplNnnCj7eJwQwu1X7jh7Hxhbrt9J3aiTchk58XuVI62F/JhjxAZP15N4Zp0K25q4p5kGop/4teNB2Lla451tVbq6sDp88lg6vQct861YoubCI45HsK5x5Cnijdqd+ycsLdE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drQ3T4Q/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drQ3T4Q/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FEDC1F000E9;
	Sat,  8 Aug 2026 13:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786194832;
	bh=9oGq816VjUVA56DzCUFr1GJ2SuS56xByNdVIj3AiuTA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=drQ3T4Q/qIawm3qLEyKmtfQYRK7sJ68S8ZdfbwxYIV1Qz1gHbMaSBNUtEDH+nG52O
	 Ea0c7rH+8M8lXiH1iN2pqpNYgi4EqIaeVYRnTuiTyvrFHHcoXuso249i8tD5xLrFJ6
	 mkQhHClmQN5T+/4ltQe3MvBofxnq+qiuxD+b1GMSDNA3hnBqsUs/FLPFhGk55I9iQc
	 4EGAoXiUWhCKmNF62BgiBITnDnAjxF0jeg8h5PJgNQjjkF1ruos6wus49U6PSafPRA
	 GuC4de0t2AVAMP+VR62iqJQUNPrnq4rSABHH/lFJh8kkDB2gr4GcepMZ1lLzIxFRtF
	 9EdxJXTvmtxrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 04/12] net: phylink: save phylink instance
 fwnode on phylink_create
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260807131301.192060-5-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <20260807131301.192060-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 13:13:52 +0000
Message-Id: <20260808131352.9FEDC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch saves a pointer to a reference-counted `fwnode_handle`=
 in `struct phylink` without acquiring a reference, creating a dormant use-=
after-free vulnerability.
--

--- Patch [4]: [PATCH net-next v11 04/12] net: phylink: save phylink instan=
ce fwnode on phylink_create ---
commit 45a3120238ef47d0743c1bd3fbcd3cc41505b72f
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: save phylink instance fwnode on phylink_create

This commit adds a new fwnode field to the internal struct phylink and
stores the passed fwnode_handle pointer during phylink_create(). This
allows future functions to reference the firmware node after creation,
as it might differ from the device firmware node.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 9decd7333c702..041405ce6bf05 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -44,6 +44,7 @@ struct phylink {
>  	const struct phylink_mac_ops *mac_ops;
>  	struct phylink_config *config;
>  	struct phylink_pcs *pcs;
> +	const struct fwnode_handle *fwnode;
>  	struct device *dev;
>  	unsigned int old_link_state:1;
> =20
> @@ -1988,6 +1989,7 @@ struct phylink *phylink_create(struct phylink_confi=
g *config,
>  	INIT_LIST_HEAD(&pl->pcs_list);
> =20
>  	pl->config =3D config;
> +	pl->fwnode =3D fwnode;

[Severity: Medium]
Will this lead to a use-after-free when callers drop their fwnode reference?

If a caller retrieves the fwnode via iterators like
fwnode_for_each_available_child_node(), the iterator drops the reference to
the node when the loop proceeds. Because phylink_create() assigns the
pointer without taking its own reference via fwnode_handle_get(), the
stored pointer could become dangling immediately after the caller's loop
iteration finishes.

Should this use fwnode_handle_get(fwnode) to ensure the node remains valid =
for
the future code paths mentioned in the commit message?

>  	if (config->type =3D=3D PHYLINK_NETDEV) {
>  		pl->netdev =3D to_net_dev(config->dev);
>  		netif_carrier_off(pl->netdev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807131301.1920=
60-1-ansuelsmth@gmail.com?part=3D4
