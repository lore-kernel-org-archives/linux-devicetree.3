Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A3636A008
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 06:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786603913; cv=none; b=H1rBsdIbCqT6RqcgM8qMiU4zmu+pF9aVPYvIUAwRyYcZJWMZXeYU4cen3l7r9/VFHg5koVzHRFAlpEtEQGarXz3xCAYPCwpwktk8BHtCOBPzkZSGmPXkhmmiKblX7tWH9ZRqdNSjeUAhQaaSRQksuGqUsS028410Iaiqj57Eb3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786603913; c=relaxed/simple;
	bh=APeTdPMESCUQwjsO1OtpL7BCnkPY4rEet2PDN/x+t00=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C5KAzKKEKLqD2Rg+sqtVGIi3LBltOdque2PpRj3qZ3sUe1rXjGfW9pqmVQV5cpjd7AtpWYJlxuzt1GvFiZz0xzYBRMRxQGUrlrZsoKkz/K0aJY7ZJ57HYuNcZZgUAL2/qevIJfxvV9V3k/+Zxa7Wasp4BDNNqg2EqFZG4CO1Q4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XGnRaQqK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XGnRaQqK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1031F000E9;
	Thu, 13 Aug 2026 06:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786603911;
	bh=iCklps7UWvDQSnKkwI95saEdh6rTCvDeROcwE3rWGmA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XGnRaQqKjqfTAwg1ToSjOIU42PmPe9X+SPX/8fBkJAgGbPi/z0werdRyGICirilcG
	 Pu7QMwW23N/ySoVhhSb754feyY8n81s3CKj+nEvep5GZgrP58msfSaQmwvtb5bz06/
	 BZu43ryQny1mc9Nbmw29IrtroP4IrRUFeVhJzcZA2OKM+Jle8fUGoxfuxpidyjXovx
	 3ZVJ1tlHTSh85Ode92OQvkdkScaCSFmDZHCTXvOaezDTTlfkWtSGP97Do5pIcgX7sI
	 e4abPptpJPz4Ag2OgD6ImKu46iryjx4uXgJsHGjZ/vi0sraYK5ykdrJFUZHS+VIdaX
	 vMCGZQgkHOsdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] firmware: stratix10-svc: Add for SDM mailbox
 doorbell interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <0635f2f00a167faf8bcffcf70fe095a86011da6f.1786600929.git.tze.yee.ng@altera.com>
References: <cover.1786600929.git.tze.yee.ng@altera.com>
 <0635f2f00a167faf8bcffcf70fe095a86011da6f.1786600929.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 06:51:51 +0000
Message-Id: <20260813065151.BE1031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] devm_request_any_context_irq() positive success values are incorre=
ctly rejected by strict `ret =3D=3D 0` check.
- [High] Dropping trx_list_lock before callback execution allows client sta=
ck popping, leading to UAF/stack corruption.
- [Medium] Improper handling of -EPROBE_DEFER from of_irq_get().
--

--- Patch [4]: [PATCH v3 4/4] firmware: stratix10-svc: Add for SDM mailbox =
doorbell interrupt ---
commit 0c0971a9e6fe55c0bfa458e38981b259f988e3ae
Author: Mahesh Rao <mahesh.rao@altera.com>

firmware: stratix10-svc: Add for SDM mailbox doorbell interrupt

Add support for SDM mailbox doorbell interrupt for async transactions. On
interrupt, a workqueue is triggered which polls the ATF for pending respons=
es
and retrieves the bitmap of all retrieved and unprocessed transaction ids of
mailbox responses from SDM. It then triggers the corresponding registered
callbacks.

> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix1=
0-svc.c
> index f8c2da207cb4e..8c86441eae58b 100644
> --- a/drivers/firmware/stratix10-svc.c
> +++ b/drivers/firmware/stratix10-svc.c

[ ... ]

> @@ -1659,14 +1666,96 @@ static inline void stratix10_smc_1_2(struct strat=
ix10_async_ctrl *actrl,
>  	arm_smccc_1_2_smc(args, res);
>  }
> =20
[ ... ]
> +static void stratix10_async_workqueue_handler(struct work_struct *work)
> +{
[ ... ]
> +		do {
> +			transaction_id =3D find_next_bit(pend_on_irq,
> +						       TOTAL_TRANSACTION_IDS,
> +						       transaction_id);
> +			if (transaction_id >=3D TOTAL_TRANSACTION_IDS)
> +				break;
> +
> +			cb =3D NULL;
> +			cb_arg =3D NULL;
> +			spin_lock(&actrl->trx_list_lock);
> +			hash_for_each_possible(actrl->trx_list, handler,
> +					       next, transaction_id) {
> +				if (handler->transaction_id =3D=3D transaction_id) {
> +					cb =3D handler->cb;
> +					cb_arg =3D handler->cb_arg;
> +					break;
> +				}
> +			}
> +			spin_unlock(&actrl->trx_list_lock);
> +			if (cb)
> +				cb(cb_arg);

[Severity: High]
Is there a risk of stack corruption or a use-after-free here?

By executing the callback after dropping trx_list_lock, a racing client
timeout might execute stratix10_svc_async_done() and delete the handler.

This could result in popping the client stack before the workqueue executes
the callback on the now-invalid stack address cb_arg. Should the lock be he=
ld=20
during the callback or is there another way to ensure cb_arg remains valid?

> +
> +			transaction_id++;
> +		} while (transaction_id < TOTAL_TRANSACTION_IDS);
> +	}
> +	enable_irq(actrl->irq);
> +}

[ ... ]

> @@ -1727,6 +1816,22 @@ static int stratix10_svc_async_init(struct stratix=
10_svc_controller *controller)
>  	hash_init(actrl->trx_list);
>  	atomic_set(&actrl->common_achan_refcount, 0);
> =20
> +	irq =3D of_irq_get(dev_of_node(dev), 0);
> +	if (irq <=3D 0) {

[Severity: Medium]
Does this improperly swallow -EPROBE_DEFER?

Because of_irq_get() can return -EPROBE_DEFER as a negative value,
this check will convert the probe deferral into a permanent fallback
to polling mode. Should this propagate -EPROBE_DEFER instead?

> +		dev_warn(dev, "Failed to get IRQ, falling back to polling mode\n");
> +	} else {
> +		ret =3D devm_request_any_context_irq(dev, irq, stratix10_svc_async_irq=
_handler,
> +						   IRQF_NO_AUTOEN, "stratix10_svc", controller);
> +		if (ret =3D=3D 0) {

[Severity: High]
Will this correctly handle nested IRQs?

devm_request_any_context_irq() returns IRQC_IS_NESTED (which is 1) on succe=
ss=20
for nested IRQs.

By strictly checking for ret =3D=3D 0, successful nested IRQ assignments wi=
ll
be rejected. This skips INIT_WORK and enable_irq(), leaving the registered =
IRQ
permanently disabled and causing asynchronous transactions to time out.=20
Should this check for ret >=3D 0 instead?

> +			dev_info(dev,
> +				 "Registered IRQ %d for sip async operations\n",
> +				 irq);
> +			actrl->irq =3D irq;
> +			INIT_WORK(&actrl->async_work, stratix10_async_workqueue_handler);
> +			enable_irq(actrl->irq);
> +		}
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786600929.gi=
t.tze.yee.ng@altera.com?part=3D4
