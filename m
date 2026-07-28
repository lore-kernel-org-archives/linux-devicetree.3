Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A368F344DB9
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231456; cv=none; b=bKT9KTu8oyy0ymLxVV9oVZMkQzvUGmqMHdZbEBmtO2X3O1vsV1I8Ox6CqbXQj7Qvu/GOjSjkcE9UbI6IxYo1HFvin+SsPHM0izniOf0iJXaKIAkoyLMtkImGcKd9qtT1pZm5R/kmIe3/BRtmggwSotOm3zrgCuyqOZBbszPIqCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231456; c=relaxed/simple;
	bh=9t8UjavKmOko/656wPEi+lgnJzJHuj8dwsDGlGrrRVk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=llUbcLYLtyFSpJODrUmcyQ3siRkaGO/e8DU+gpw3HJhoZMzkgn1UJrop/RFumeKN/DhZ0K8NNXUzLEURV3L2QfQHSuN0wvoYzfrokOHKocSTHppbx5fY9PDZqTGr50UUp1vcTW2g1RGpMyj7bVJ7PsdD+0YZDKNOp/EsXVfuKD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZxCDpbL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZxCDpbL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE69F1F000E9;
	Tue, 28 Jul 2026 09:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785231455;
	bh=gresHR0LaAJsP7a1mc6hKXSKUqCNhkwCw0ndeZGl3oQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LZxCDpbLt48S0xL1+HYT/J/kn7KAHGtTLLMV1uWAngk5JIP9Dz8Zqsy2SjXxaCYcR
	 +aDHCuhHh2vAnwljzvbbmJj5iO9FSJokUPmErYUF64exP7Qy1imUX5r7TvnCqKHufq
	 mefYCM6bTWrpDB+keIRGoom0Vaqtga6rNDBFSK9CFcMnUvc4GNn7U90V/7n8LLgkS3
	 9Q5O9Xs8bfSwXIOcz9Bo2TCxMWkC5mdysAAUYfJtV69IHWDxTkUnj796kmcx26YGez
	 HXN4iTrKoMewbaqal3FatLiH+dJGV6KjF/KfwoZO9+21npDpFAvVqU5MUrSDwWc7G/
	 KdnafSyYgYZzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] spmi: apple: lock around FIFOs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728-t603x-spmi-v2-5-f43e5f10e583@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-5-f43e5f10e583@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:37:34 +0000
Message-Id: <20260728093734.EE69F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver does not drain or flush the RX FIFO during initializati=
on or after error conditions, leading to cascading transaction failures and=
 state desynchronization.
--

--- Patch [5]: [PATCH v2 5/7] spmi: apple: lock around FIFOs ---
commit 0e8d4d322dfd8a19a861bdcc1b9aefd06ad5b239
Author: Alba Mendez <me@alba.sh>

spmi: apple: lock around FIFOs

The driver adds a mutex to provide locking around register interactions.

> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
[ ... ]
> @@ -86,7 +90,7 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u=
8 opc, u8 sid,
> =20
>  	ret =3D apple_spmi_wait_rx_not_empty(ctrl);
>  	if (ret)
> -		return ret;
> +		goto out;

[Severity: High]
This is a pre-existing issue, but if a transaction times out here and the
hardware eventually replies, does the unread data remain in the hardware
RX FIFO? If the FIFO isn't explicitly drained on errors, the next
transaction could incorrectly consume the stale data as its own response,
leading to persistent state desynchronization.

> =20
>  	reply =3D readl(spmi->regs + SPMI_RSP_REG);
> =20
[ ... ]
> @@ -107,6 +112,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid,
>  	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
>  		dev_warn(&ctrl->dev, "FIFO has extra data\n");
> =20
> +	mutex_unlock(&spmi->fifo_lock);
> +

[Severity: High]
This is also a pre-existing issue, but when extra data is detected here,
should the driver drain the remaining words from the FIFO? Leaving the
unexpected data inside the FIFO instead of reading it out could corrupt
the state synchronization of the next command on the bus.

[ ... ]
> @@ -181,6 +192,7 @@ static int apple_spmi_probe(struct platform_device *p=
dev)
>  		return -ENOMEM;
> =20
>  	spmi =3D spmi_controller_get_drvdata(ctrl);
> +	mutex_init(&spmi->fifo_lock);
> =20
>  	spmi->regs =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(spmi->regs))

[Severity: High]
This is a pre-existing issue, but does apple_spmi_probe() need to flush
or drain the RX FIFO during initialization? There could be stale data
left over from bootloader or firmware interactions before the controller
is fully registered and mapped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-t603x-spmi=
-v2-0-f43e5f10e583@chaosmail.tech?part=3D5
