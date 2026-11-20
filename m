Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215509;
	b=p9AKzXpuEb2vQLHzooWkktTA57z+lnY2wd577Flj25UA0eizPi+c2ATvQ1klm9ChH+jz
	 ScUMVuZ/XQOcppN6zrR5dYMlNy2AfYxE7PA4uSUZFqxtBtRV5ryFzRTDWBhN65KUCD5P5
	 HZuLPyOF/LUTTWGamyxTSZhPuDaEN4eKx5B9YNVESrJiE8XHvd5WyyXsAjyvsUD7mDMiY
	 2tjgE0ipEQWIq18kyjwzYbZv59QVLqiFAuIE8ap/og2S7oDKolGnOZ97uJzeOTYOXVI+8
	 Nmt3gXYMBpRW4fL7zr+j7KGkgSB8eLCXIbXXCzCU98Nu6v33jk+pGPuUXewf4CGffpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215509;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+gNBGIXMMxrlDL81zypN6KSs9XmZjHPL7AlG7tsjK5o=;
	b=E7AC86Q/GV9p062KohcVU3YzQnR8JPwkIfed4wnRjmOWOzB7TKLc7IsFQI3+Z+/BU/G6
	 y7BXFlnKlOGz0wVMmWyU6HwrNdsRd+YoMVMO7h85vhX9objXVT2WtdQBSxtUJPW6VJvvU
	 wC5ji9h6+aHtWO/8L/C4ieSqe0yxxrXbB3Z8Q7rqgR8aF9dXlEKrkR611XX4C1YLoJRtl
	 W0vaERpu/3X6EqVjACEJzuPyFj5wTg+l3H3j1sIUeZObRvN196Sb4aOY67/S3Sgj3qkwO
	 FAOAFI4NnOSOEZshbZLFN6wuH3827WyAdCaBKN9AN8+5nDft4tLl8EStTu9QEpS3YHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HUneq8CT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50046606A6AA
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 22:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HUneq8CT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2111F000CF;
	Fri, 20 Nov 2026 22:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795215509;
	bh=+gNBGIXMMxrlDL81zypN6KSs9XmZjHPL7AlG7tsjK5o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HUneq8CTGCn/b1EKV5dOAgSqFHygjzNsL61YMilC/nhLiaV8KgS1u3NVMbxXfFaV4
	 F1G2ZgrSstHwXKJYFG785jUCWx++gLzKIj4Kvun2nygN2nL98RI31Y+65OdQrYns9F
	 CAuNqu7GQJBJm+gQrdPXlFFrArQku43eSaormWO54XutZfjCaUCAh5m0KmiNUAnngH
	 ir0QdzvXNW1lCtyrzvCZz5XAJLpYVUdZ7afv7QpStnEHZ8XhZNwTGw2nd/feJhS6WD
	 Swy+PlNV5tlQhO0M8bjVudqWKx2sPlWrGmU3ZcDF8TPWu5KWdCT/kB68eO6B/9CJuW
	 d6p/gR6FjGwZg==
Message-ID: <sashiko-outbox-226322@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v16 06/13] dpll: sit9531x: register DPLL
 devices and pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119225752.41846-7-arouhi@sitime.com>
References: <20261119225752.41846-1-arouhi@sitime.com>
 <20261119225752.41846-7-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 22:58:28 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] dpll: sit9531x: lock error reported on inactive PLL in
  sit9531x_dpll_lock_status_get()
- [Medium] dpll: sit9531x: unmasked INTRB latches cause storm in
  sit9531x_irq_thread_fn()
--

commit f2688535e3fdf8a8e4a4d89421da6aae6f0f4bb8
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: register DPLL devices and pins

This commit registers each PLL on the SiT9531x as a DPLL device with its
XO pin, adds a periodic kthread worker and optional INTRB threaded IRQ hand=
ler
to poll hardware status into a cache, and wires up system sleep PM operatio=
ns.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 99dd5e70dc5e6..8a63b92fb7d62 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> @@ -181,132 +206,1419 @@ int sit9531x_update_pll_u8(struct sit9531x_dev *=
sitdev, u8 pll_idx,

[ ... ]

> +/* Queue an immediate poll tick; polling continues as a fallback. */
> +static irqreturn_t sit9531x_irq_thread_fn(int irq, void *data)
> +{
> +	struct sit9531x_dev *sitdev =3D data;
> +	int rc;
> +
> +	/*
> +	 * Acknowledge here: IRQF_ONESHOT unmasks the line on return, and a
> +	 * still-asserted INTRB would fire again at once.
> +	 */
> +	mutex_lock(&sitdev->multiop_lock);
> +	rc =3D sit9531x_clear_notifications(sitdev);
> +	mutex_unlock(&sitdev->multiop_lock);
> +	if (rc) {
> +		dev_warn_ratelimited(sitdev->dev,
> +				     "IRQ: failed to clear notifications: %d\n",
> +				     rc);
> +		if (++sitdev->irq_ack_fails < SIT9531X_IRQ_ACK_TRIES)
> +			return IRQ_NONE;
> +
> +		dev_err(sitdev->dev,
> +			"IRQ %d disabled: notifications cannot be cleared, polling only\n",
> +			irq);
> +		disable_irq_nosync(irq);
> +		return IRQ_NONE;
> +	}
> +
> +	sitdev->irq_ack_fails =3D 0;
> +
> +	kthread_mod_delayed_work(sitdev->kworker, &sitdev->work, 0);
> +	return IRQ_HANDLED;
> +}

[Severity: Medium]
As reported by Jakub Kicinski on v15 [1], can sit9531x_irq_thread_fn()
trigger a level-triggered interrupt storm if the device profile routes a
sticky latch outside the eight registers cleared by
sit9531x_clear_notifications() to INTRB?

The driver does not program the INTRB mask registers, and
sit9531x_eeprom_state_report() reads the sticky SIT9531X_REG_EEPROM_NOTIF
register at probe and leaves its bits set.  If an unmonitored latch like
SIT9531X_REG_EEPROM_NOTIF drives INTRB low, sit9531x_clear_notifications()
succeeds without deasserting the line and sit9531x_irq_thread_fn() returns
IRQ_HANDLED on every pass, preventing the spurious-IRQ detector from steping
in while firing continuous I2C transactions.

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> new file mode 100644
> index 0000000000000..6d676fabf13ee
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/dpll.c
> @@ -0,0 +1,295 @@

[ ... ]

> +static int
> +sit9531x_dpll_lock_status_get(const struct dpll_device *dpll, void *dpll=
_priv,
> +			      enum dpll_lock_status *status,
> +			      enum dpll_lock_status_error *status_error,
> +			      struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll *sitdpll =3D dpll_priv;
> +	struct sit9531x_dev *sitdev =3D sitdpll->dev;
> +	const struct sit9531x_chan *chan;
> +
> +	if (status_error)
> +		*status_error =3D DPLL_LOCK_STATUS_ERROR_NONE;
> +
> +	chan =3D sit9531x_chan_state_get(sitdev, sitdpll->id);
> +
> +	mutex_lock(&sitdev->multiop_lock);
> +
> +	if (chan->stale) {
> +		*status =3D DPLL_LOCK_STATUS_UNLOCKED;
> +		if (status_error)
> +			*status_error =3D DPLL_LOCK_STATUS_ERROR_UNDEFINED;
> +	} else if (!chan->active) {
> +		/*
> +		 * An unused PLL never goes active and its loss-of-lock bit is
> +		 * not driven.
> +		 */
> +		*status =3D DPLL_LOCK_STATUS_UNLOCKED;
> +	} else if (chan->inner_lol) {
> +		/*
> +		 * The core reports the error detail only with an unlocked or
> +		 * holdover status.
> +		 */
> +		*status =3D chan->ho_freeze ? DPLL_LOCK_STATUS_HOLDOVER :
> +					    DPLL_LOCK_STATUS_UNLOCKED;
> +	} else if (chan->mode) {
> +		/*
> +		 * In free-run the outer loop is disabled and its loss-of-lock
> +		 * bit is meaningless.
> +		 */
> +		*status =3D DPLL_LOCK_STATUS_UNLOCKED;
> +	} else if (chan->ho_freeze) {
> +		/*
> +		 * Test freeze before lock: a frozen PLL tracks no reference
> +		 * whatever its outer loss-of-lock bit reads.
> +		 */
> +		*status =3D DPLL_LOCK_STATUS_HOLDOVER;
> +	} else if (chan->locked) {
> +		if (chan->ho_valid)
> +			*status =3D DPLL_LOCK_STATUS_LOCKED_HO_ACQ;
> +		else
> +			*status =3D DPLL_LOCK_STATUS_LOCKED;
> +	} else {
> +		*status =3D DPLL_LOCK_STATUS_UNLOCKED;
> +	}
> +
> +	if (status_error && chan->inner_lol)
> +		*status_error =3D DPLL_LOCK_STATUS_ERROR_UNDEFINED;

[Severity: Medium]
Should setting *status_error =3D DPLL_LOCK_STATUS_ERROR_UNDEFINED for
chan->inner_lol move inside the else if (chan->inner_lol) branch?

Because it sits after the if/else-if chain, an unused PLL (!chan->active)
whose inner_lol bit is set still reports DPLL_LOCK_STATUS_ERROR_UNDEFINED
alongside DPLL_LOCK_STATUS_UNLOCKED, and sit9531x_dpll_changes_check() will
emit change notifications if inner_lol toggles on an inactive PLL.

[1] https://lore.kernel.org/r/20261117021814.2220156-1-kuba@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119225752.4184=
6-1-arouhi@sitime.com?part=3D6
