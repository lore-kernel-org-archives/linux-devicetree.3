Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541B53FA5E6
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546086; cv=none; b=EbYTIrp9AGK7m54PdeH+Qgc6Gv2lDF2gZklFwW3r4bBSK22KOFpocKYy952efleT7jCMufL6cSZjazsYQdsnFwKcnL5WvLSyKFvCTQVtKahvn4mnYIQWQddF0SDJaxAd8ERiRvgtswQ3bgtcQEcYUMFnr6ae0kY24z2u9W9leUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546086; c=relaxed/simple;
	bh=KeXq4UXv1wmogNGTFMS4vVy2I1vtGvSngESO+2h2Lco=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=omlQRvGTASQf2+Nnh171mGRUhH1Ani02aKvqnMf+giuxXUkYBUbjJkvjFMnWl8PwHGL5vHxjKqg15Naod1jNNUryMzPTjBl0N4rfS8P+MsVq/Iia96f7IxL0D0lukF3C4UooWPYVboTz9l2UEyxUWzwDjIrDXcBymXQvrHoZMKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpUaD9Zz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpUaD9Zz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4FED1F0089A;
	Wed, 16 Sep 2026 08:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789546074;
	bh=fY66Fn3c+sBfXlaQ0CcOGijAUBcw5ShX/+eRYmUnCkM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NpUaD9Zz2cBp/sKFiM9cuALR+myJPHvWGBk9tDQ3eDxFLkH9aWtWY59GqHGgaitmf
	 I+OftpEmnCi/ac2JPwIVwsuJ8XbGdZ0NDNTv5n71eBCVYJQCflGDE69htSmhnFbaZP
	 r3CY37Pav05Q5C9cvPr9jumsZH4wLIm6Ln1I44epiHvbj0f3AGc04PyM/JqjtMm9Wr
	 t6c5i8Fc+qAADMku0g26A34ejKeGS9KfgE9tOcXeacDh/PZqACAfvF/LMQQMfngmWK
	 J/9RHLSQV3z+ps4PXNc4Uf9EwaVOOjzHrtV/DHxziKOpI5t4FtGtEO+VLIwx5m0Ug4
	 i6qrzd68TxepA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 3/3] w5100: detect carrier state using link
 status bit and optional interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arthur Crepin Leblond" <arthur@marmottus.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260915-wiznet-link-gpio-v8-3-d173622474cc@marmottus.net>
References: <20260915-wiznet-link-gpio-v8-0-d173622474cc@marmottus.net>
 <20260915-wiznet-link-gpio-v8-3-d173622474cc@marmottus.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 08:07:54 +0000
Message-Id: <20260916080754.A4FED1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: w5100: teardown race condition due to inverted cancel/free or=
der
--

commit a7c6f85022e2b47daf620a6b97b050a3490bd3ef
Author: Arthur Crepin Leblond <arthur@marmottus.net>

w5100: detect carrier state using link status bit and optional interrupt

This commit adds carrier state detection using the Link Status bit on the
w5500. It introduces an optional interrupt for link status changes and ensu=
res
the netdev is registered last during probe.

> diff --git a/drivers/net/ethernet/wiznet/w5100.c b/drivers/net/ethernet/w=
iznet/w5100.c
> --- a/drivers/net/ethernet/wiznet/w5100.c
> +++ b/drivers/net/ethernet/wiznet/w5100.c

[ ... ]

> @@ -820,14 +953,22 @@ void w5100_remove(struct device *dev)
>  	struct net_device *ndev =3D dev_get_drvdata(dev);
>  	struct w5100_priv *priv =3D netdev_priv(ndev);
> =20
> -	w5100_hw_reset(priv);
> +	unregister_netdev(ndev);
> +
> +	cancel_work_sync(&priv->rx_work);
> +	cancel_work_sync(&priv->tx_work);
> +	cancel_work_sync(&priv->setrx_work);
> +	cancel_work_sync(&priv->restart_work);
> +
> +	if (priv->link_irq > 0)
> +		free_irq(priv->link_irq, ndev);
> +
>  	free_irq(priv->irq, ndev);

[Severity: High]
Does this code introduce a teardown race by canceling the work queues before
freeing the interrupts?

If the threaded interrupt handler (w5100_interrupt) is running concurrently
during w5100_remove(), it could queue a new rx_work or tx_work immediately
after cancel_work_sync() returns.

Later in the teardown, destroy_workqueue() drains and forcibly executes all
pending works. Since w5100_hw_reset() is called prior to destroy_workqueue(=
),
could these newly queued works execute against a reset and uninitialized
hardware state, potentially causing I/O corruption or kernel crashes?

Should free_irq() be called before cancel_work_sync() to guarantee the
interrupt handler has completed and no new works will be queued?

> +	w5100_hw_reset(priv);
> =20
> -	flush_work(&priv->setrx_work);
> -	flush_work(&priv->restart_work);
>  	destroy_workqueue(priv->xfer_wq);
> +	mutex_destroy(&priv->link_lock);
> =20
> -	unregister_netdev(ndev);
>  	free_netdev(ndev);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-wiznet-lin=
k-gpio-v8-0-d173622474cc@marmottus.net?part=3D3
