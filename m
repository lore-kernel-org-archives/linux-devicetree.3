Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC76D3BFE59
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107922; cv=none; b=GcYUuus0E+6Es+k+rzU0LuD9zOLIPqkMRRukSy6wPdRJipkYfXRj/Qk7iUoOOfvgTLJmOasHZ9h2xcg6VZl424zCujwsF1FZxxaPCTwR2RLXXWiEGuVVhGw+E65mjE1qHtBNlRNCcvmzvy5thEsAmn4dTJwizwP76L9Ch38vTRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107922; c=relaxed/simple;
	bh=i3fIyucfiTN14vQBPAdPa4wEt7reTE4GXRJMPnaU0pw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rWRldrgw8vBoLQXzMLhhG7NWGwZmWleRwfznfTGDgnDsmGSTf+XUOsPwpmiAZ3lJ+jkWhh+KRle8KPoLvyVvYOwivBPpTNmuNHHnykepbGDQtVqBVtZ86lzw69MhZ6d19EkCmwk23UcxSQGqeWS+yZXi9M0hS9JehjnePh+7Jm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+7TI42a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+7TI42a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7575E1F000FF;
	Tue, 22 Sep 2026 20:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790107903;
	bh=UH79YgWthxum7mAlWz4NwWFPWGZe6K7zMi40Fh+uhn8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g+7TI42a8ZnmC5MCVd3q5BAN+dcjpZMfehk8/Fuh+baScJX0Zo80AOoNSu1H+rnvP
	 LkSQrIGmiI/WTyGEAVQRSvWL9a+IqlEMPSKjczrguOdBjuR0RbvbrXlXojNoNfIS6D
	 Bmv7DHXMVkYtEZgfGF3vwybpThLN8TYPsNb87IlcueMMRe1f5nmXR2d9cI9XT6NxVV
	 HVQg4KmrTAJ9U/j5H3hZIkeE6xqsTmuyuZuGaHTwp/KMyutfFXWeMtYcsup9VkTA31
	 dTrFHC2nC1I4uOp8rlfnoAMs7JFbohmw0smvspccu65ZWDwgrNG3K0ae9KKItMWMM/
	 BOtxozCj6rMjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 07/14] dpll: sit9531x: add support to get and set
 priority on input pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921201108.42676-8-arouhi@sitime.com>
References: <20260921201108.42676-1-arouhi@sitime.com>
 <20260921201108.42676-8-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 20:11:42 +0000
Message-Id: <20260922201143.7575E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dpll: sit9531x: unreachable priority table rollback leaves HW corr=
upted
- [High] dpll: sit9531x: UAF and list corruption in sit9531x_dpll_input_pin=
_prio_set
--

commit b6317b5bb6f30f209960f172a34c584a3034f1e4
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: add support to get and set priority on input pins

This commit adds DPLL netlink priority get and set callbacks for the
sit9531x device. It manages the hardware priority table mapping inputs to
slots, caching hardware state for fast read-backs.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 84c1f86e6d4cf..ac184c93258cb 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> @@ -629,9 +683,34 @@ static int sit9531x_prio_table_commit(struct sit9531=
x_dev *sitdev, u8 pll_idx,
> =20
>  	written =3D SIT9531X_PRIO_MAX_SLOTS;
> =20
> +	if (rc && written) {
> +		/*
> +		 * Put the slots that did reach the device back the way they
> +		 * were.  Latching a table that is neither the previous order
> +		 * nor the requested one hands the reference selection loop
> +		 * a priority list nobody asked for.  The cache is the table
> +		 * as last read, which is what those slots held.
> +		 */
> +		for (slot =3D 0; slot < written; slot +=3D 2) {
> +			u8 old;
> +
> +			old =3D sit9531x_prio_slot_set(0, slot,
> +						     chan->prio_srcs[slot]);
> +			old =3D sit9531x_prio_slot_set(old, slot + 1,
> +						     chan->prio_srcs[slot + 1]);

[Severity: High]
Does this bypass the rollback block entirely? Every failure path for
sit9531x_write_u8() and sit9531x_read_u8() just prior to this in
sit9531x_prio_table_commit() jumps directly to the 'commit:' label, skipping
the 'if (rc && written)' check. Will this leave the priority table partially
updated in hardware on a transient I2C error?

Additionally, if this rollback code were somehow reached and 'slot' reached
10, would accessing chan->prio_srcs[slot + 1] result in an out-of-bounds
read at index 11?

[ ... ]
> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index 4437c95f578f8..56a8213dee077 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c
[ ... ]
> +static int
> +sit9531x_dpll_input_pin_prio_set(const struct dpll_pin *pin, void *pin_p=
riv,
> +				 const struct dpll_device *dpll,
> +				 void *dpll_priv, u32 prio,
> +				 struct netlink_ext_ack *extack)
> +{
[ ... ]
> +	mutex_lock(&sitdev->multiop_lock);
> +	rc =3D sit9531x_input_prio_set(sitdev, sitdpll->id,
> +				     sit9531x_input_hw_src(dpin->id),
> +				     (u8)prio);
> +	if (!rc) {
> +		list_for_each_entry(sibling, &sitdpll->pins, list) {

[Severity: High]
Is this list iteration over sitdpll->pins safe against concurrent
modification? It appears sit9531x_dpll_pins_unregister() can remove
elements and free them via kfree() without holding sitdev->multiop_lock.

If a userspace netlink request sets pin priority concurrently with device
removal (e.g., driver unbind), could this unprotected iteration lead to a
use-after-free and list corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921201108.4267=
6-1-arouhi@sitime.com?part=3D7
