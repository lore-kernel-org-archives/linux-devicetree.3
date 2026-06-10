Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172DB33122D
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 15:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105304; cv=none; b=gav94Aw7BCv537uIrczZTsoe2+2nSKPmugPvfiXSewr588ZiPfSz2hzbrCkQeadyy4mQ0VdAWc0ol0vp5IF1jDkCsvcD/pwpVYANcfZq4g1Qo6m1Avk0yFiXcljEmPGjEFEH0i0ZpeSodKZcy2zJWF449Y/JAjAsi2+bNvYsYUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105304; c=relaxed/simple;
	bh=KphDJEljzz1B0L/rkxUZfXlBPc6kjk2dUSXUNm+P/Ms=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UnP42F4wFHRucEo1LQCQL828gxlfTez7kYR4IH1KksyUuq4AE5pXBpLEOtZfhrFYd4ZAFD0Rosn2zK27fCehKU/jtRdlEpc/HKfqi16Ndm7nC8C2i/JpTWfRZG4jFRJQv1ZQyPd8DaAGwb/rXTnall6KsWbq5Gw4MWwTdBW1GZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGKoNT0I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGKoNT0I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D341F00893;
	Wed, 10 Jun 2026 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781105302;
	bh=f6veyJn+caHLGc0rk/Y13OyXICSeN8sVehwN/gzubws=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NGKoNT0IzL3vjnpuh+GskjuWOX/VZ7vBa55r+SX0rzIogUABkbj75iYbl/aeP4Jgk
	 NA1QCNwuPbf6NpfZvc49G34avJD9+27LaVdCLAlQDGvrTjLwZyeads7itqZFjfLEgO
	 b47vgX0VzLIev9GsnyiSvgkclB1np025n0F6vV1shPOydqxvZxWa0yK3ZnTbKvo39E
	 KamVYubwc3SSWbwhh7QLOUCRepHOWHLMuoRfsKmHrKXDXEarMuzoiSJguxKq7tDiZu
	 OtHt7Ip5jGVLNsZxBZic8zijIu7XQivXU9+DyOnK/xSEK7n6N+dCUFM5ENKUn7kS5f
	 fPN05uGBY7/ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 04/13] net: ethernet: oa_tc6: Export the C45
 access functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Regus via B4 Relay" <devnull+ciprian.regus.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609-adin1140-driver-v4-4-0753e28ee004@analog.com>
References: <20260609-adin1140-driver-v4-4-0753e28ee004@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 15:28:21 +0000
Message-Id: <20260610152822.27D341F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Missing forward declaration of `struct mii_bus` in `include/linux/o=
a_tc6.h`.

Pre-existing issues:
- [High] A Time-Of-Check to Time-Of-Use race in `oa_tc6_start_xmit` can res=
ult in a permanently stopped TX queue.
--

commit 8341f219f15c736a6e2b1b018d43e766db074905
Author: Ciprian Regus <ciprian.regus@analog.com>

net: ethernet: oa_tc6: Export the C45 access functions
   =20
The C45 access functions can still be used by some Ethernet drivers
which set the OA_TC6_BROKEN_PHY flag. Export them.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Ciprian Regus <ciprian.regus@analog.com>

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> index 2a72f0c4b0095..b37e398e30e37 100644
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but is there a race condition in
oa_tc6_start_xmit() that can result in a permanently stopped TX queue?

In drivers/net/ethernet/oa_tc6.c:oa_tc6_start_xmit(), tc6->waiting_tx_skb
is checked without holding tx_skb_lock:

    if (tc6->waiting_tx_skb) {
        netif_stop_queue(tc6->netdev);
        return NETDEV_TX_BUSY;
    }

Concurrently, the SPI thread can acquire the lock, move waiting_tx_skb
to ongoing_tx_skb, and set waiting_tx_skb to NULL.

After processing, the SPI thread checks if the queue is stopped to wake
it up in oa_tc6_try_spi_transfer():

    if (!tc6->waiting_tx_skb && netif_queue_stopped(tc6->netdev))
        netif_wake_queue(tc6->netdev);

If the SPI thread evaluates netif_queue_stopped() before oa_tc6_start_xmit()
executes netif_stop_queue(), it won't wake it. oa_tc6_start_xmit() will
then stop the queue and return NETDEV_TX_BUSY.=20

With waiting_tx_skb being NULL and the queue stopped, will the SPI thread
fail to wake up to process new TX frames, stalling the interface?

> diff --git a/include/linux/oa_tc6.h b/include/linux/oa_tc6.h
> index 62e3d89f80ed0..2660eefa35043 100644
> --- a/include/linux/oa_tc6.h
> +++ b/include/linux/oa_tc6.h
> @@ -31,3 +31,7 @@ int oa_tc6_read_registers(struct oa_tc6 *tc6, u32 addre=
ss, u32 value[],
>  			  u8 length);
>  netdev_tx_t oa_tc6_start_xmit(struct oa_tc6 *tc6, struct sk_buff *skb);
>  int oa_tc6_zero_align_receive_frame_enable(struct oa_tc6 *tc6);
> +int oa_tc6_mdiobus_read_c45(struct mii_bus *bus, int addr, int devnum,
> +			    int regnum);
> +int oa_tc6_mdiobus_write_c45(struct mii_bus *bus, int addr, int devnum,
> +			     int regnum, u16 val);

[Severity: Low]
Could this cause a compiler warning due to a missing forward declaration
of struct mii_bus?

Including this header without prior MDIO/PHY declarations being in scope
will generate a warning about the struct being declared inside a parameter
list.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-adin1140-d=
river-v4-0-0753e28ee004@analog.com?part=3D4
