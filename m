Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAE133D6D5
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 16:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780677197; cv=none; b=YdcRfKJfEv0xSC/AYnRYQy4+vWQihsHYsKE1yFtcgZbYXUPc3EHjXMs1CkWtzM9PywZ9UTR/qMfzOkjmcqSFvFqRDezSgq9I2NQL9Zvn69ZYnHphUBd7XPs/VEwOFs1ZV/LwStnpvbpQn8FZ1JJU9V0Wx2dOW38XORyKIq38FJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780677197; c=relaxed/simple;
	bh=diHDzqrHcJ9gk1alHJcd3boy26xQATOxGPrJmlI+vhM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c7I1l+b/fm30WxrKDGh/0KrE0O2f7MjbNeXAeTS9dhEajyrZA1C7gsp3iecSDSS33kcXg3HiuNYSsnml7PnqF5qeLZduf81t/zgHgF6Sj3ITFrRKi1aZZsniYL+AiDW+l3e2eyjo5qd5lFbsMcY+PqFxZDrs3BkNhAD48LqTxEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWaSUcHi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWaSUcHi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20EB1F00899;
	Fri,  5 Jun 2026 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780677193;
	bh=Trsp06jMCT6RwOWTxb9geTvy5Ku4Yn9JTiZ0jRKjY+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HWaSUcHiiU9jZuXSwRB9wKjdhdWOOjlO9dbHywSm5kZJRTdw92SbcElba4+x+JBk2
	 8yK107dLJL/D0PNLQNWfAl1Cu4reeKmkf43UYttMW94iwCn2Yzfb5IHOMCvDjOyu9e
	 +xfIGmsMRJpc/PGIKIsSwBk4IJoC33jSlA69ChELa4kPWvpYrQuFpLg1DhhqYmj2D6
	 aO2ZIlQGXpBuJmrt7DxySQyX+37D4zGr18iwwpVZwd1FGKq2wdN5gUu7QQGCQMUeuH
	 R9T/T4puR+r3mwyEen1TeCY76VBByy8FQjFQYHjvxyf9l0PZAuus35bmqkjTBM+cCR
	 eo4eXW34GoDYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 04/13] net: ethernet: oa_tc6: Export the C45
 access functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Regus via B4 Relay" <devnull+ciprian.regus.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604-adin1140-driver-v3-4-5debdb3173c4@analog.com>
References: <20260604-adin1140-driver-v3-4-5debdb3173c4@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 16:33:12 +0000
Message-Id: <20260605163312.C20EB1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Missing forward declaration of `struct mii_bus` in `include/linux/o=
a_tc6.h` makes the header not self-contained.

Pre-existing issues:
- [High] Lockless check in `oa_tc6_start_xmit` races with the SPI thread, l=
eaving the network transmit queue permanently stopped (TX deadlock).
--

commit 03dcdcc6f016c85b284a9ab34918acf9f00e484a
Author: Ciprian Regus <ciprian.regus@analog.com>

net: ethernet: oa_tc6: Export the C45 access functions

This commit exports the C45 MDIO bus access functions from the oa_tc6
driver. It modifies the function signatures to be non-static and adds
their declarations to the driver header file.

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
Is a forward declaration for struct mii_bus missing in this header?

Since struct mii_bus is used in the parameter list but not declared, it is
scoped to the function prototype. Any file including this header before
declaring struct mii_bus will produce a warning about it not being visible
outside of this declaration.

[Severity: High]
This is a pre-existing issue, but could the lockless check in
oa_tc6_start_xmit() race with the SPI thread and cause a TX deadlock?

Looking at oa_tc6_start_xmit() in drivers/net/ethernet/oa_tc6.c:

	if (tc6->waiting_tx_skb) {
		netif_stop_queue(tc6->netdev);
		return NETDEV_TX_BUSY;
	}

If this evaluates to true, but concurrently the SPI kthread running
oa_tc6_try_spi_transfer() takes tx_skb_lock, moves waiting_tx_skb to
ongoing_tx_skb, and sets waiting_tx_skb to NULL, could the queue wake up be
missed?

oa_tc6_try_spi_transfer() evaluates the queue status:

		if (!tc6->waiting_tx_skb && netif_queue_stopped(tc6->netdev))
			netif_wake_queue(tc6->netdev);

If the kthread evaluates netif_queue_stopped() as false before
oa_tc6_start_xmit() calls netif_stop_queue(), start_xmit will then
unconditionally stop the queue. Since waiting_tx_skb is now NULL, the SPI
thread will not process TX packets and wake the queue again, potentially
deadlocking the TX path permanently unless RX traffic generates an interrup=
t.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-adin1140-d=
river-v3-0-5debdb3173c4@analog.com?part=3D4
