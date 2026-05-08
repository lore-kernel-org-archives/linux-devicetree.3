Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872BC376BD5
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 19:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778268486; cv=none; b=S5QM00aJ3gWwfyOKls6oZEEY5g4xKfDQuQTfssvB5JrWEoYVoO/g5sgy4JwGtQWCJaKe2XtYY2sPg5iwfP2+WVN3yOQxmieJJwYQEcedpV/T/FWe0ayeQbNwXeCmlJjlCAfzWFzeW8wb2ogrOK1Wmg5CfDH09ivM2gCiexh0u/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778268486; c=relaxed/simple;
	bh=8Ewt0U+dljznILziI/NAmt7ntlH/r/U30ha2Duay4pk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tyB5gBXt+54HKsL9EDSWIMf479rwgAgnvP8TFStdsQ8Guk86fNuWlbGfCEDZYdL6vszP5zUQW7vyUc3R+cfSA1SdGRVABaUFqQj6uRzwgNq6hcw+E1qAmccV/YSUjVKY+tz2Owscxme+4hxdHDGpVEnDmGkkgDs/bFLxBI2z3YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYirpsI9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYirpsI9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9E1C2BCB0;
	Fri,  8 May 2026 19:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778268486;
	bh=8Ewt0U+dljznILziI/NAmt7ntlH/r/U30ha2Duay4pk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=QYirpsI9sM5vQCcqDw4CAnEn/pg4CIwaFIBo0ISdusesFeP/nY0E3K4dl9C+HYF57
	 eycP5t/ikXmFn5dksVpnFpRjoUpwP1PWNPzig1HGZcJp8WGkUhInoWWb5PnCCBuBgm
	 F0hPwbgDvKwn6jeYhDeraeR+mwaWH0EtyWYp8sczlCpdPolrbxsqJ25PXWap1Dkqx5
	 wJshnJ8mHyYRvsEi00lDdGe9NW25hEslamYOM+i3iT7CrDZSeljOegAnXk6sU9+XKK
	 ++LABDdaMVrJkqAi81EmpG7LGVg7I4irqM3Qbh5s4/GDVWPZhbEq15AFtqIZAeNdPv
	 x5qLocsuWLC7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/15] can: grcan: Simplify timing configuration
Reply-To: sashiko@lists.linux.dev
To: "Arun Muthusamy" <arun.muthusamy@gaisler.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260508070121.6918-7-arun.muthusamy@gaisler.com>
References: <20260508070121.6918-7-arun.muthusamy@gaisler.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 19:28:05 +0000
Message-Id: <20260508192805.ED9E1C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch removes the hardware-specific bounds check `ps1 > ps2`=
 under the false assumption that it is a redundant check handled by the CAN=
 core.
--

commit 245e4bc80a0c4a622684c9f656acd758d80ee6a0
Author: Arun Muthusamy <arun.muthusamy@gaisler.com>

can: grcan: Simplify timing configuration

This commit simplifies the CAN bit timing configuration by removing
error checks deemed redundant and using FIELD_PREP for bit assignments.

> diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
> index 8d7bde1c006f2..8ba21d94e87df 100644
> --- a/drivers/net/can/grcan.c
> +++ b/drivers/net/can/grcan.c
[ ... ]
> @@ -396,41 +396,26 @@ static const struct can_bittiming_const grcan_bitti=
ming_const =3D {
>  static int grcan_set_bittiming(struct net_device *dev)
>  {
[ ... ]
>  	ps1 =3D (bt->prop_seg + bt->phase_seg1) - 1; /* tseg1 - 1 */
>  	ps2 =3D bt->phase_seg2;
> -	scaler =3D (bt->brp - 1);
> -	netdev_dbg(dev, "Request for BPR=3D%d, RSJ=3D%d, PS1=3D%d, PS2=3D%d, SC=
ALER=3D%d",
> -		   bpr, rsj, ps1, ps2, scaler);
> -	if (!(ps1 > ps2)) {
> -		netdev_err(dev, "PS1 > PS2 must hold: PS1=3D%d, PS2=3D%d\n",
> -			   ps1, ps2);
> -		return -EINVAL;
> -	}

The commit message claims the error checks are redundant. While the
ps2 >=3D rsj constraint is enforced by the CAN framework via can_sjw_check(=
),
does the CAN core actually enforce the ps1 > ps2 constraint?

A user with network admin privileges can configure CAN standard values via
netlink that result in ps1 <=3D ps2. For example, configuring an unusually =
low
sample point can lead can_calc_bittiming() to generate parameters where
ps1 <=3D ps2.

If the hardware strictly requires ps1 > ps2, as the original error message
suggests, could removing this safeguard allow unsupported configurations to
be programmed into the hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508070121.6918=
-1-arun.muthusamy@gaisler.com?part=3D6
