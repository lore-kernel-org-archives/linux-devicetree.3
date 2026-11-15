Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767494;
	b=lDkB7qngraI+jDrpEHCY6VwKzFeU0FYgxxAbmW5dJVrwjC/LWCvCDjV+hcRcY6b5/3Zl
	 bXEd9JsKSF0Qdx5HI4DbXLb6bKOtC7oKSiHPNftaNU9qK6uHltQlXkSMB+WEOk8zI00eg
	 ucOy0IURucgnAX5rGGz/YsoisMhHx+U/dPCVr4jw+hTIHlOcaXtBCpIqJjchDUa6yN7zl
	 l/rimD26Yrkb/UldcC3THcN7HnAxk/MIdU4yqRqoXEXEUbC8MONo7OpajK9BZJGXHv6qA
	 5uZkVD5OT7A4B4q674jpxi8drafpo96T239en0cBs9uiyYRcMW1cuHCICeelL5bhvYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767494;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SZKeogZ/aPOO3oEEkscn2RhmF5BM36XBLYCqnHFxnPk=;
	b=Ean1z+Iuyn8eDycZXanXnISOWelc9smZrl1SuVp+KDBteGbeBqx9bVqQGUHk7E9aP+1u
	 gpsxNxF3C+KdM741936CLN/cqsi8zI7nfNRaZInpwJnupks7UPHagX3TtiLKos4OfemDS
	 vtCb9C1Y8c9R4LLsSa1pNzRXSv/3+FVfVspwaKOqUMN3ULZLMEjZYlHebInM/1If69AUy
	 I9R5aPuy4GDJc8vjM3PsmxGVkGGw5wpAJLMvrpqXZHuo1TRlsWTPkd9UXSDykNhhdq4YQ
	 rdObKYMDiFyZD7SYFySZnIKyhtQFu14Dm34FvKocC4MDiF2rGZc6r2rLxPtn6rxgUtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ha8nS23m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9753D606A31F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 18:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ha8nS23m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9AA1F000C5;
	Sun, 15 Nov 2026 18:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794767494;
	bh=SZKeogZ/aPOO3oEEkscn2RhmF5BM36XBLYCqnHFxnPk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ha8nS23mwUbJt6b02Vp8IAImCQmPZnp0C5RkmZI+Wr4JRETkVSxBwUJd0TwWAp1yS
	 FD+GKkRdWBx+UKrThpjTU/Woq1diQSInChnUPXRW0zpOI7cFRvGjyr+7RAuBt29JAe
	 FKTdoiwtbPfMWyBx65ofseaXLE7GLXHz5tywLFjCjk9pux9RfWE1ttczipEOuNKtY5
	 DrciaH9MQbC9oBoNA5KyIdigtg6WC0y0CIIbAoVpseiat87mLGMfIyWcoWjVsRykcl
	 QPddN93jU5C9MCfVxZ9aL58OI8zD+bTDW9RQmU4uHUAQW55IEUXwG9HOHrDbJEXcrf
	 sKV6qXgaPXI3w==
Message-ID: <sashiko-outbox-215720@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 1/6] net: xilinx: axienet: Introduce
 axienet_config for MAC-specific ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suraj Gupta" <suraj.gupta2@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114182947.2908628-2-suraj.gupta2@amd.com>
References: <20261114182947.2908628-1-suraj.gupta2@amd.com>
 <20261114182947.2908628-2-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 18:31:33 +0000
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
- [High] net: xilinx: axienet: axienet_probe() fails on software-node
  devices
--

commit 783576cb6315304b083793b1e0a0ea48b15baa81
Author: Suraj Gupta <suraj.gupta2@amd.com>

net: xilinx: axienet: Introduce axienet_config for MAC-specific ops

This commit introduces struct axienet_config to abstract MAC-specific
capabilities and callbacks, populating it from axienet_of_match and
converting the shared paths to use it.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index 7e83c4b5f1931..125ad3dbf6aa9 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c

[ ... ]

> @@ -2898,27 +3046,13 @@ static int axienet_probe(struct platform_device *=
pdev)
>  	seqcount_mutex_init(&lp->hw_stats_seqcount, &lp->stats_lock);
>  	INIT_DEFERRABLE_WORK(&lp->stats_work, axienet_refresh_stats);
> =20
> -	lp->axi_clk =3D devm_clk_get_optional_enabled(&pdev->dev,
> -						    "s_axi_lite_clk");
> -	if (!lp->axi_clk) {
> -		/* For backward compatibility, if named AXI clock is not present,
> -		 * treat the first clock specified as the AXI clock.
> -		 */
> -		lp->axi_clk =3D devm_clk_get_optional_enabled(&pdev->dev, NULL);
> -	}
> -	if (IS_ERR(lp->axi_clk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(lp->axi_clk),
> -				     "could not get AXI clock\n");
> -
> -	lp->misc_clks[0].id =3D "axis_clk";
> -	lp->misc_clks[1].id =3D "ref_clk";
> -	lp->misc_clks[2].id =3D "mgt_clk";
> +	lp->axienet_config =3D device_get_match_data(&pdev->dev);
> +	if (!lp->axienet_config)
> +		return -ENODEV;

[Severity: High]
Does this break probing for platform devices matched by driver name and
backed by a software_node, such as those registered after commits
f5185ec79dac ("net: axienet: use device_property and fwnode APIs for
probe-time config") and 418149559ef3 ("net: axienet: add a MODULE_ALIAS
for platform instantiation")?

software_node_ops does not implement .device_get_match_data and
axienet_driver has no id_table, so device_get_match_data() returns NULL on
non-OF platform devices and axienet_probe() now fails with -ENODEV instead
of defaulting to axienet_1g_config.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114182947.2908=
628-1-suraj.gupta2@amd.com?part=3D1
