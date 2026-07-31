Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED7D426697
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502102; cv=none; b=gEqQ5dRy5bqfP44FYukAk9IW2ofBgi8F0TyHdIfRHNkCGuhP8i/zGJZooX5O+Fwxqr6KWkX4QV2O+ASybdNdE9pNv19hSuvmX9ZVhG7F+zSTLqZytoM2xzpAvPFH+VmBNR7PSZ1ARSHbQVf7nzdsARzYwZAUXQLwVYdk6KiWacg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502102; c=relaxed/simple;
	bh=yuEMuHK1gGOkug8fAR22qAThgjJ+BWGbKS+z7hMY7No=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QoRtYD3juorXtLJe3t9sfWm+AK8lxtGfi0gSBiYC/oQYyetULzURMUHk/BGUusthAdvjrGVzZVCiiiaLEPGhU1AH56v6HZHEqihBgh9JtnuDY2ecsbix2T5iXBPgUJ1wWSfWmXPWlsrVvz16djfD1l5S9CXYfP6XSLccSyx0XoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NtJWXLXW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NtJWXLXW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BD91F00A3A;
	Fri, 31 Jul 2026 12:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785502101;
	bh=7BU2tbyQmjbmWe3EVD0ZC8pQFDdEB8A8d9IBXxj0I7c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NtJWXLXWEVs0QZ4AnYEGZly13f3YCaowL7CDFcwEqRbfr6PZR5TtrRZzkgQOPYKGW
	 VRdsXnzhZmQzB3Z0P7jYlNEAwJ0n1/Z+rThPBeaFOvg2Bc5rZI8FDpvkf1/+q4NRdR
	 KosMRTcs2B+6kmP6FxWzM8NtEDtVvjhbEK6tQcr6MO1n+Whtb8ZFKqGXM9vZijVcGx
	 kBa7VoZV5v9YWpUYA5Ej2UFjy2JgGjipo2yl6mcZW7BUly5BKhJVhEKtsXG7KzLnlx
	 W/aF2WavJmGYw4E4wVLxcLdwfcGMOrY4upVyr3+XFdwfoHWi113T1jALut76FnbxTW
	 3sQf7nGjK922g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 11/11] net: airoha: add phylink support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730102444.1967900-12-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
 <20260730102444.1967900-12-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 12:48:20 +0000
Message-Id: <20260731124820.96BD91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing Kconfig dependency for FWNODE_PCS causes GDM2/3/4 ports to=
 permanently fail at runtime.
--

--- Patch [11]: [PATCH net-next v10 11/11] net: airoha: add phylink support=
 ---
commit 1e7a014be0e15c64f532ea8b2276b6e883f1d63b
Author: Christian Marangi <ansuelsmth@gmail.com>

net: airoha: add phylink support

Add phylink support for each GDM port. For GDM1 add the internal interface
mode as the only supported mode. For GDM2/3/4 add the required
configuration of the PCS to make the external PHY or attached SFP cage
work.

> diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/a=
iroha/Kconfig
> index 1f6640a15fc94..789906516bf8f 100644
> --- a/drivers/net/ethernet/airoha/Kconfig
> +++ b/drivers/net/ethernet/airoha/Kconfig
> @@ -20,6 +20,7 @@ config NET_AIROHA
>  	depends on NET_DSA || !NET_DSA
>  	select NET_AIROHA_NPU
>  	select PAGE_POOL
> +	select PHYLINK
>  	help

[Severity: High]
Does this also need to select FWNODE_PCS?

If the kernel is built with NET_AIROHA but without FWNODE_PCS, the GDM2/3/4
network ports will fail to link up at runtime.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index dba7c52c08969..5065d6583b9f0 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
[ ... ]
> @@ -3409,6 +3441,155 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth *e=
th,
[ ... ]
> +	} else {
> +		config->mac_capabilities =3D MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> +					   MAC_10 | MAC_100 | MAC_1000 |
> +					   MAC_2500FD | MAC_5000FD | MAC_10000FD;
> +
> +		config->num_possible_pcs =3D fwnode_phylink_pcs_count(dev_fwnode(confi=
g->dev));
> +		config->fill_available_pcs =3D airoha_fill_available_pcs;

Without FWNODE_PCS in Kconfig, fwnode_phylink_pcs_count() and
fwnode_phylink_pcs_parse() will fall back to the inline stubs in
<linux/pcs/pcs.h> which return 0 and -EOPNOTSUPP.

This leaves config->num_possible_pcs at 0, resulting in an empty PCS list.
When phylink later attempts to configure the link in phylink_major_config(),
it will fail to find a required PCS for interfaces like SGMII and log that =
it
couldn't find a PCS, failing the configuration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730102444.1967=
900-1-ansuelsmth@gmail.com?part=3D11
