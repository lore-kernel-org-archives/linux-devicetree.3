Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A267E369D6F
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 08:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786696610; cv=none; b=Zm8ZZc51xuCeW8ZQ8YpDZMnBPoDFiJa/4UAUCkYUCNROBvMFXdUnKvnyWLupZStmOfqZcZzinj5VziQfSlpCI6WjOsY5mlXqqO3ne1R61UxCXIInj2HW3E8XEC8ARLJoGB11fiilYhIBPG+wV2TKRL1iPYhKG3ABIR7aK+tX5eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786696610; c=relaxed/simple;
	bh=LQ6+ywlbog2eXRQ1zP2M1nj3VTlEoiVhj3AZ8vB5i/Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uTODx8btga4StJXDKr5xod5nGJVJwy/gJIcPb9gXOC4R6FSi/wo5elXvB85+5xZaarJ8BtjXT1Q3fdHdMbIXiOHuQ+lPWW26wdW6OnLN+PshYbx49zHWu4JKM3GXOCg2OarlDCzdbKhQkyKDfCw1AxSj3Mcm70BNp099pCTP3cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j75N99eA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j75N99eA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FC41F000E9;
	Fri, 14 Aug 2026 08:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786696604;
	bh=GqN+hUv007NhWdKfTux1NN4ntBEPu0k95EXECjZF1lw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j75N99eAyQeAJDkq3ZfIx41PPdjHRVjXZVY6/T1DlM7yqYKq8QzkZHzQlX0mOOD14
	 Rk2DQXHv0Z9JXpShbkkwewkYYPvs9pQmRhd/Fv0xL2HTBvVmwgEmaB0w9/DYMQvS87
	 4rBjeQzY1X5zhkVlmjibhS3/diCIlInz47DI9PCNxJbOd4N+0eNZlx2dXgqYHxrIYo
	 omO83X/JhaM11pV1rTmIccAGdwHuqkXBKK1aDkoDcZLiJAjEtyAo9AiNoKi/7oMNyz
	 SALSukc+iPRX7zZEmz3VUpQJ5fVQdkXokMcwhUzkbDQOJSkFwuAnOD5xMpVfMQ0FF6
	 /RzNFwlx0JpsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 12/12] net: airoha: add phylink support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260813083536.970196-13-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
 <20260813083536.970196-13-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 08:36:39 +0000
Message-Id: <20260814083643.B3FC41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `.nway_reset` callback in `ethtool_ops`, preventing users f=
rom restarting autonegotiation.
--

--- Patch [12]: [PATCH v14 12/12] net: airoha: add phylink support ---
commit 04ce17914816acfbcbe80f577754f5b7cd6c55ff
Author: Christian Marangi <ansuelsmth@gmail.com>

net: airoha: add phylink support

This commit adds phylink support for each GDM port, configuring internal
interface modes for GDM1 and necessary PCS settings for external PHYs or SFP
cages on GDM2/3/4. It also updates the ethtool get and set link ksettings
functions to use phylink.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 64619e9a704dd..c3827bf9791b6 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
[ ... ]
> @@ -3353,7 +3392,8 @@ static const struct ethtool_ops airoha_ethtool_ops =
=3D {
>  	.get_drvinfo		=3D airoha_ethtool_get_drvinfo,
>  	.get_eth_mac_stats      =3D airoha_ethtool_get_mac_stats,
>  	.get_rmon_stats		=3D airoha_ethtool_get_rmon_stats,
> -	.get_link_ksettings	=3D phy_ethtool_get_link_ksettings,
> +	.get_link_ksettings	=3D airoha_ethtool_get_link_ksettings,
> +	.set_link_ksettings	=3D airoha_ethtool_set_link_ksettings,
>  	.get_link		=3D ethtool_op_get_link,
>  };

[Severity: Low]
Since this patch fully supports phylink and implements set_link_ksettings,
should airoha_ethtool_ops in drivers/net/ethernet/airoha/airoha_eth.c also
include the .nway_reset callback?

Without this callback, userspace attempts to manually restart
autonegotiation via "ethtool -r <interface>" will receive -EOPNOTSUPP. It
is standard in phylink conversions to also provide an nway_reset wrapper
that calls phylink_ethtool_nway_reset(dev->phylink) to allow administrators
to trigger autonegotiation restarts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813083536.9701=
96-1-ansuelsmth@gmail.com?part=3D12
