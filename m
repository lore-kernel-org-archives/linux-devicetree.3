Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB54367F26
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778284261; cv=none; b=pCPGOCw+sVv+82DPS9RQUmmAmTF+SLL+QM+TKGkNLp+PrTBrG0RsjMx942yG2nXUSi3C3t3Kj1nG+utcu7WooGp2njJQPHiykkZ+DQdO/INbNMvztkmVkop6UTus5HLMT3cnahtxv7PAVczmHkKNvBqiDCIx6V1SD0eJGyuXcrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778284261; c=relaxed/simple;
	bh=mcckM0bp06M2H/95BiohV3DlAg9nxCRbHv2XK89mC8E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lp6zRhXOgd/ZnyJ8LMr7WPZwTKt1/CoEv0EEEQNrvB/iCm0GlPEC1ja+Itavx6fJb7zQnPCSD6kkOnX0+xlE28PubPLlrNvkYWQgTsQvccq3Lsule0sDUFRzvQU0mB4wFR+3ph7OyosUTo5/6i5UVKPUuWMgIULjbfBLRL7JjSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUPHSDvK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUPHSDvK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5609BC2BCB0;
	Fri,  8 May 2026 23:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778284260;
	bh=mcckM0bp06M2H/95BiohV3DlAg9nxCRbHv2XK89mC8E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=iUPHSDvKUuV75SqQWnTo7XeFj8JiCJhc0lJzls4paWetg6ndJ3sByO3hxINtZ57wk
	 p65kwSnvQP4IXR77HsP9AEwNgVujug1jQHWihUoL6rz/Uwz6MnckB6ZSl59e4WjEn1
	 nUOHZOufV/BGz3cRBgTWo0PZzv2fcGvSdgQyVuRTHK43wrZFYOO6iKclwCGCUVpUlo
	 AsB8g3/lRs/cV1ddQnH5eiABMgtMq9TOIIxskUpiYxymgo3rfRpvqmRG1dOOEj1+zI
	 JTgKgxNfrDElY/mlsP5iNanayEBrN39UW2XLg9Akv3TskOdHau9eBrqMhu+mVZ+BLe
	 mdSZ+NTMEay+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 15/15] can: grcan: Advertise CANFD capability
Reply-To: sashiko@lists.linux.dev
To: "Arun Muthusamy" <arun.muthusamy@gaisler.com>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260508070121.6918-16-arun.muthusamy@gaisler.com>
References: <20260508070121.6918-16-arun.muthusamy@gaisler.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 23:50:59 +0000
Message-Id: <20260508235100.5609BC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing CAN FD Data Phase hardware configuration.
- [High] Advertised data bit timing constraints exceed hardware register li=
mits.
- [High] Socket buffer allocation failures permanently stall the NAPI recei=
ve queue (infinite loop).
- [Medium] The CANFD_BRS flag is lost on received CAN FD frames.
- [Medium] Unconditional exposure of CAN FD data bit timing to userspace fo=
r non-FD hardware.
--

commit 73799692e455f9bd1a3d6243e60de78467c0a58b
Author: Arun Muthusamy <arun.muthusamy@gaisler.com>

can: grcan: Advertise CANFD capability

Advertise CANFD capability for GRCANFD hardware by enabling
CAN_CTRLMODE_FD flag and providing CANFD timing operations.

> diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
> index 06ef081970a24..060031df81924 100644
> --- a/drivers/net/can/grcan.c
> +++ b/drivers/net/can/grcan.c
> @@ -1766,11 +1766,14 @@ static int grcan_setup_netdev(struct platform_dev=
ice *ofdev,
>  	priv->ofdev_dev =3D &ofdev->dev;
>  	priv->regs =3D base;
>  	priv->can.bittiming_const =3D hwcap->bt_const;
> +	priv->can.fd.data_bittiming_const =3D hwcap->bt_const;

Are the data bit timing constraints advertised here too large for the
hardware registers? It looks like hwcap->bt_const (which sets
tseg1_max =3D 63) is assigned, but the hardware macro for the Data Bit
Timing Register (GRCANFD_FDBTR_PS1) defines only a 4-bit field (max value
15). Could this result in bitwise truncation and corrupted baud rates if the
register is programmed?

Also, is it safe to assign data_bittiming_const unconditionally, even for
hardware that does not support CAN FD? Since hwcap->fd is not checked
before this assignment, this seems to unconditionally expose
IFLA_CAN_DATA_BITTIMING_CONST to userspace tools for classic CAN controller=
s.

>  	priv->can.do_set_mode =3D grcan_set_mode;
>  	priv->can.do_get_berr_counter =3D grcan_get_berr_counter;
>  	priv->can.clock.freq =3D ambafreq;
>  	priv->can.ctrlmode_supported =3D
>  		CAN_CTRLMODE_LISTENONLY | CAN_CTRLMODE_ONE_SHOT;
> +	if (hwcap->fd)
> +		priv->can.ctrlmode_supported |=3D CAN_CTRLMODE_FD;

With CAN FD being enabled here, there appear to be a few issues in other
parts of the code handling the FD functionality.

First, does the hardware timing configuration callback grcanfd_set_bittimin=
g()
omit programming the CAN FD data phase? It seems to only read the nominal
bit timing (priv->can.bittiming) and write it to the Nominal Bit Timing
Register (regs->nbtr), completely ignoring priv->can.fd.data_bittiming
and never programming the Fast/Data Bit Timing Register (regs->fdbtr).
Will this cause immediate communication failures on the bus when transmitti=
ng
CAN FD frames with Bit Rate Switching (BRS)?

Second, is the CANFD_BRS flag lost on received CAN FD frames?
In grcan_receive(), when a CAN FD frame is received:

    hdr =3D grcan_msg_header_at(&dma->rx, rd);
    if (hdr->ctrl & GRCAN_RX_FDF)
        skb =3D alloc_canfd_skb(dev, &cf);

It doesn't look like the hardware's BRS bit (GRCAN_RX_BRS, BIT(25)) is
ever checked to set cf->flags |=3D CANFD_BRS. Does this mean userspace is
incorrectly informed that no received frames used bit-rate switching?

Finally, this code exists in grcan_receive():

    if (unlikely(!skb)) {
        netdev_err(dev, "dropping frame: skb allocation failed\n");
        stats->rx_dropped++;
        continue;
    }

If alloc_can_skb() or alloc_canfd_skb() fails, the code continues to the
next loop iteration. However, because rd is not advanced (via
grcan_ring_add()), won't the next iteration read the exact same message,
fail allocation again, and repeat until the NAPI budget is exhausted? Could
this permanently stall the receive ring and cause a NAPI livelock under
memory pressure?

>  	priv->need_txbug_workaround =3D txbug;
>  	priv->hwcap =3D hwcap;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508070121.6918=
-1-arun.muthusamy@gaisler.com?part=3D15
