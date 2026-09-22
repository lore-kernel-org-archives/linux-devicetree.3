Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42913474263
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 17:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790099500; cv=none; b=dnIFikuCGxpE7L7vgzG9FVdSkJScu4U7dlhCYz90lhgrk31xvBWwwR8rVYMTZ54MKTdaaM/8psg0u4iGAdv2cMpUg0qcicFGFjg7Y3DKViVdN4MvY61EJqsZ8Z+Eqz/vzguRTSvBHa8lFtTNIc/tapUjlsW+cwvSZ4c+Sb6/k10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790099500; c=relaxed/simple;
	bh=yJMPHS559pAQOk83+QrHLv79BjByhZppXjFJdtDbAKE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dFt/TzF/beMGF1oUTNc5WStkjVILesCLnE5fTBEGQcu+lzKOfS8liHUxE92XG6jlpSGUAMrerCMwmlxsb0uxkNwjZRehnpMbh18htgaKE4R9FBrMITyCcN+23Z/DkxLUDY7OgRmItplXuhr6APCjLq0TvtxkQmZf/umTkXEgZSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TE4pNksL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TE4pNksL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35161F00893;
	Tue, 22 Sep 2026 17:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790099499;
	bh=BAyOa65Xh9mfY65VmyWU1S4XbraJwyuo9g9ztJwSzCo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TE4pNksLwqP9owAUn5FWjrIiJpxckNowrOy+1NzJzEqjkvEZH4f+7vm6xqNX9Dkcp
	 5hagIDeYf6DJxIAfephmMR7v0aBxVjjKV8cdOwxHIIcNh276Bj+rCJ01Kz7EsnTfT0
	 tYrygYZcVPLnP3MW6rbaFoN+YbOk9g1Y4FJwOKVlo3jo5LiNLE4g+uWiz2CDRckkGQ
	 QLZPQWkS9Th7xnBS0kDaz2CxqvfGbkOs8wRqtBWRRCV5bQ4Uy1//DJBWxOORLc5GtZ
	 xH+WdhGJlRNR3eFzvcGIpFWpFhChRfjha9SNL0csIA8Jr4MffcDjJCe34AFncytH7n
	 4KU7qFFzVq4zQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 05/10] net: ethernet: ravb: Propagate error
 from ptp_clock_register()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260921175037.4084310-6-niklas.soderlund+renesas@ragnatech.se>
References: <20260921175037.4084310-1-niklas.soderlund+renesas@ragnatech.se>
 <20260921175037.4084310-6-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 17:51:38 +0000
Message-Id: <20260922175138.C35161F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: ravb: ethtool timestamping capabilities are incorrectly sup=
pressed when interface is down
--

commit bba7bddbe4fcaec0df4875259d8239664ffaa696
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Propagate error from ptp_clock_register()

If the PTP clock registration failed, the error is silently ignored. This
commit reworks callers of ravb_ptp_init() to handle and propagate the error.
It also updates how the PHC index is handled.

Link: https://sashiko.dev/#/patchset/20260610102432.3538432-2-niklas.soderl=
und+renesas@ragnatech.se?part=3D1

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ether=
net/renesas/ravb_main.c
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -1774,7 +1774,7 @@ static int ravb_get_ts_info(struct net_device *ndev,
>  	struct ravb_private *priv =3D netdev_priv(ndev);
>  	const struct ravb_hw_info *hw_info =3D priv->info;
> =20
> -	if (hw_info->gptp || hw_info->ccc_gac) {
> +	if (priv->ptp.clock && (hw_info->gptp || hw_info->ccc_gac)) {

[Severity: Medium]
Does this new condition incorrectly suppress the static ethtool timestampin=
g=20
capabilities when the interface is administratively down?

If a userspace tool calls ethtool -T on the interface while it is in the do=
wn
state, priv->ptp.clock will be NULL since the clock is only active while th=
e=20
interface is open. By checking priv->ptp.clock here, ravb_get_ts_info()=20
completely skips reporting static capabilities like SOF_TIMESTAMPING_TX_SOF=
TWARE=20
and SOF_TIMESTAMPING_TX_HARDWARE.

Could the priv->ptp.clock check be moved so that it only guards the
info->phc_index assignment below, rather than the entire capabilities block?

>  		info->so_timestamping =3D
>  			SOF_TIMESTAMPING_TX_SOFTWARE |
>  			SOF_TIMESTAMPING_TX_HARDWARE |
> @@ -1785,7 +1785,7 @@ static int ravb_get_ts_info(struct net_device *ndev,
>  			(1 << HWTSTAMP_FILTER_NONE) |
>  			(1 << HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
>  			(1 << HWTSTAMP_FILTER_ALL);
> -		info->phc_index =3D READ_ONCE(priv->ptp.phc_index);
> +		info->phc_index =3D ptp_clock_index(priv->ptp.clock);
>  	}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921175037.4084=
310-1-niklas.soderlund+renesas@ragnatech.se?part=3D5
