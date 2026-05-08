Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70163A3E87
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778281722; cv=none; b=Vkp6VF0sK8bJWhfwmJ2b7bbsLdud2kCvpvX2ITsCMLYeWsMAzDX5Tq1SvrcrrX/QwDwgKGvSP5C2a1T5lxrlf15rEYfIwoNAF5vIQG4ph7BvtmylR6hUUJ5vMbLSjoGSvFfbS8iezwDNcy6YZpfHyHt5+FIjfRZbT5Y90kOYofw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778281722; c=relaxed/simple;
	bh=nh5hKtqHW4UE6I+aWS0wVHciNJPi3Drl6X9ibvMWQ8g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JDctECB2O9QrkHISMIm2oM5FLuuXRMyZaHdTvJbBpPhd2a61qxWxfzAUYTPdJBH/RbdJyB7502Xoz/hS6JzriHRPKqspyO/00w6Mya/TX9cI/b00wLNat+ruKR2ICqlH6Le1jRahqEEepvmKUC3P1jrPzOybhL2fM/UB2vjjL90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMiEzDIJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMiEzDIJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51EF6C2BCB0;
	Fri,  8 May 2026 23:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778281721;
	bh=nh5hKtqHW4UE6I+aWS0wVHciNJPi3Drl6X9ibvMWQ8g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=fMiEzDIJuVgeuVCbUq0/rMxwv92lXEB1fr+WowKJzLtrY50acXoeZeRh02Fh7M7x6
	 P6KrzEkwVin5ArT9yeYpq+h7ZVqerhj/5rytldgWaaniBz6WJsJ95wv9q7l1U0i6Bn
	 Jh+c4EgdwP6JU4vQCZN9nKmAk3GyP9L6GaS9l+u9bOW8H4YU3jR1cSS4JXqTKORvy+
	 8HOxJuGCeH0bAv/80vnoyvOG9FBxDlPu+un3MNcfIXvkQlZfDYaXfy5rHz9JJXtXM3
	 k3uuww4rLBvvLsNKly2QrRfr/tNCySC2Id3e3D/os31SkAVmpClNEDpW4yBDPvyW4W
	 zupjvPyn99sEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 13/15] can: grcan: Add CANFD RX support alongside
 legacy CAN
Reply-To: sashiko@lists.linux.dev
To: "Arun Muthusamy" <arun.muthusamy@gaisler.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260508070121.6918-14-arun.muthusamy@gaisler.com>
References: <20260508070121.6918-14-arun.muthusamy@gaisler.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 23:08:40 +0000
Message-Id: <20260508230841.51EF6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Failure to advance the DMA ring read pointer on SKB allocation fai=
lure causes a CPU livelock.
- [Medium] The driver silently ignores the Bit Rate Switch (BRS) flag for r=
eceived CAN FD frames.
--

commit ce68eaadc0f30d6e6864ce5c3ae7544dc009b802
Author: Arun Muthusamy <arun.muthusamy@gaisler.com>

can: grcan: Add CANFD RX support alongside legacy CAN

This commit adds CAN FD reception capabilities to the grcan driver,
allowing it to handle extended data payloads and higher bit rates.

> diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
> index 690e07c7b1ef8..eba52701c882e 100644
> --- a/drivers/net/can/grcan.c
> +++ b/drivers/net/can/grcan.c
[ ... ]
> @@ -1269,47 +1276,62 @@ static int grcan_receive(struct net_device *dev, =
int budget)
>  		if (rd =3D=3D wr)
>  			break;
> =20
> -		/* Take care of packet */
> -		skb =3D alloc_can_skb(dev, &cf);
> -		if (skb =3D=3D NULL) {
> -			netdev_err(dev,
> -				   "dropping frame: skb allocation failed\n");
> +		hdr =3D grcan_msg_header_at(&dma->rx, rd);
> +		if (hdr->ctrl & GRCAN_RX_FDF)
> +			skb =3D alloc_canfd_skb(dev, &cf);
> +		else
> +			skb =3D alloc_can_skb(dev, (struct can_frame **)&cf);
> +
> +		if (unlikely(!skb)) {
> +			netdev_err(dev, "dropping frame: skb allocation failed\n");
>  			stats->rx_dropped++;
>  			continue;
>  		}

This isn't a bug introduced by this patch, but if the skb allocation fails
here under memory pressure, the loop executes a continue without advancing =
the
hardware read pointer (rd).

Because rd is not advanced, the next iteration of the loop will attempt to =
read
the exact same packet, fail allocation again, and repeat this until the NAPI
budget is exhausted. Will this cause NAPI to continuously reschedule the po=
ll
function, leading to a CPU softirq lockup?

Should the driver calculate the number of descriptors and advance rd
appropriately before continuing?

> =20
> -		hdr =3D grcan_msg_header_at(&dma->rx, rd);
> +		dlc =3D FIELD_GET(GRCAN_MSG_DLC_MASK, hdr->ctrl);
> +		if (hdr->ctrl & GRCAN_RX_FDF)
> +			cf->len =3D can_fd_dlc2len(dlc);
> +		else
> +			cf->len =3D can_cc_dlc2len(dlc);
> +

The patch defines GRCAN_RX_BRS as BIT(25) to indicate that the hardware
received a CAN FD frame with Bit Rate Switch enabled, but the receive path
does not appear to check this bit.

If hdr->ctrl & GRCAN_RX_BRS is set, does the driver need to set the CANFD_B=
RS
bit in cf->flags before passing the frame to the network stack?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508070121.6918=
-1-arun.muthusamy@gaisler.com?part=3D13
