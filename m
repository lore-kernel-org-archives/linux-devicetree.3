Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C566C30C168
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 01:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790212186; cv=none; b=BdPOvDyRgdkg08x6lAgHFAB76+QIPzBeplgbkdUIAYnXOq05UMjxLWNb+VI7TybkTmlNRP8Sc6WZdYqn8Ie9r3bndzZfN9dRpXXgOxxQTXPqZhvvs1O8eoCBXVpd7JrkBKseqNwPMkiLw8o+InoszuwuuD2FaClnlG9S64p11UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790212186; c=relaxed/simple;
	bh=GoGivyjq5CwchAu3jOVtietwLEAjJwQ9BFnu4C4mpJc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CZIDD5FoR2t8lUH4auX9MxNzLgpQtoZllZgR1jPf5QTuCOvRKhfGcZeEPKHZnRSzsCfNfboKupZUolPAlcxuSsdhqKXIYyygAXvKUApmvaQkHuRM3p+7Lc/hzZjcCB0XQfDiKg0GCp5Oygw/ADpxKb2hrf3afPS6Tma57ZSG+w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLheSfSl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LLheSfSl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A731F00893;
	Thu, 24 Sep 2026 01:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790212185;
	bh=60BR92TVDQmujy2fuoshLCSd3W3mBYRojTGkkpXopyQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LLheSfSlzm2t0F9GCqjDtVMHoPJCdXS61zD1hNAOiDzTYfgfPkEn5EBxrVZHWggMP
	 mVM0ZZc1vJ0uszQhA3ySg1DOex8K3UCg8onHQ+J0SXhAVG//vjP1PQYjDKi6h2g4MX
	 axN+QjYUjURQ1APbxeoqa7xCztOyygQxL8YAlQMhR07vZRqeOW6IKF6L76ixeig688
	 y7z9bpQNsui6CQs1rgWQNtDEN3pQQIohVVZkr0BlLl2fK8ByhY6arn5FgQY8ktuqLi
	 4bDlrhxBq5zxVYBFGXN0+35qTKVsdBQOnowGTzR9CrbSvi81aWV8eshPTo3Y50xTlx
	 Qw8HnRQ2SDfNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC net-next 8/9] net: stmmac: qcom-ethqos: support
 external PCS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-8-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-8-4b1c682af70f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 01:09:44 +0000
Message-Id: <20260924010945.39A731F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: stmmac: unsupported PCS interfaces are silently accepted with=
out a PCS
--

commit 7e5af7c53413fc3b964ab675b20db937601457fb
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

net: stmmac: qcom-ethqos: support external PCS

Select the XPCS instance initialized by stmmac when firmware provides
a pcs-handle. Reject interfaces that are not supported by the selected
PCS.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index ac7d6d3e205a1..a99a78880c0fb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

[ ... ]

> @@ -681,6 +683,21 @@ static void ethqos_ptp_clk_freq_config(struct stmmac=
_priv *priv)
>  	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
>  }
> =20
> +static struct phylink_pcs *
> +qcom_ethqos_select_pcs(struct stmmac_priv *priv, phy_interface_t interfa=
ce)
> +{
> +	struct phylink_pcs *pcs;
> +
> +	if (!priv->hw->xpcs)
> +		return ERR_PTR(-ENODEV);
> +
> +	pcs =3D xpcs_to_phylink_pcs(priv->hw->xpcs);
> +	if (!test_bit(interface, pcs->supported_interfaces))
> +		return ERR_PTR(-EOPNOTSUPP);

[Severity: High]
Does returning an error pointer here actually reject the unsupported
interface?

Looking at stmmac_mac_select_pcs() in
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:

	if (priv->plat->select_pcs) {
		pcs =3D priv->plat->select_pcs(priv, interface);
		if (!IS_ERR(pcs))
			return pcs;
	}
	...
	return NULL;

It appears that if select_pcs() returns an error pointer like
ERR_PTR(-EOPNOTSUPP), stmmac_mac_select_pcs() will ignore the error and
eventually fall through to return NULL.

Since phylink interprets a NULL return from stmmac_mac_select_pcs() as "no =
PCS
required" rather than a failure, won't this result in silently accepting the
unsupported interface mode and configuring the link without a PCS instead of
failing the initialization?

> +
> +	return pcs;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-qcom_xpcs_=
nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com?part=3D8
