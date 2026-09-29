Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F45233134
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790652671; cv=none; b=Wf11FGsuFuTUxSjsys3VbO752ZVWsJ7QfZ9Wd2YxOEmJmgvdhFK5q4Wm5r6EN7fzerON9uZXyX4yUgvg5/H0Btqt5S09m5lnnLG2AbS1e8IfMvITUuJY7VL0qT7kQ0WVoNEl0jJOuLnao2LLiyclAosGsAH5iPZN0HK/oazzvV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790652671; c=relaxed/simple;
	bh=Gp0yuxaqe+p4w+lFPSm8IPwRKG2GJrZA2vawlJNPSAs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oJFrl8QTtwnoOnI3tMQlYLBlNDf0TOFGgP7Aners4yCa0Gn0pLs9CPxXY8TMqdbK19OvVcdq8t95lEIH6GA/55LhSD9SdxNSJEI/p8sgxpjq9M56Vneq3DMitwkApHAB4QMlB/f0tBmV0rlBXlSc/E/Jzy/dvFl+SMjsxSh+u4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mhkV6CXt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mhkV6CXt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C091F000FF;
	Tue, 29 Sep 2026 03:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790652669;
	bh=sKfZAhNUXytDbY1KNRltZrjm53xI4OfZr7envFtdvmY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mhkV6CXtejeThZ2X7YwJ+ifo98G1rB6hcc8TOtDvDzMbfV5oIWD618tRkZbxJS2L0
	 xT270/Ja+Q7cXI6Pf9KXyqZOooMWqqCpG8VyAzWDFONEnsfn5VO+qC24GxOvrBLQth
	 4gDv5Rm3om43PIxHYq8nsLrkhQ/cSbHB+N+hz6xpJ7lRkB1gg/IhbKus0UnZCUmmXk
	 bBfiQlOa5+W3zWnew5E+L+Xl/yunVdb+NougZwKu7AR+G0N0uRGbZYDBesz5dj4cJY
	 wINJQnwrjACgdK8yy9O/sYS5blyAWVkfRcVSnRDaKw54eJHeRlR3q484SE1WGfWQg4
	 P6mocRZKfuFUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 01/10] mailbox: add direct synchronous send support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-1-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
 <20260928-riscv-rpmi-tee-abi-v1-1-04908b81d885@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 03:31:08 +0000
Message-Id: <20260929033109.27C091F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mailbox: missing validation of send_data allows NULL dereference
--

commit 4e6ec78e9c624fa338c55d686383cecee65b8cdb
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

mailbox: add direct synchronous send support

Some mailbox controllers can complete a transaction entirely within
the calling context, without going through the queued TX state
machine or a TX-done interrupt. Add a synchronous send path so their
clients can request one and wait for the result directly.

> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index efacd24a085d1..c640b19de6080 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c

[ ... ]

> @@ -355,6 +412,14 @@ static int __mbox_bind_client(struct mbox_chan *chan=
, struct mbox_client *cl)
>  	struct device *dev =3D cl->dev;
>  	int ret;
> =20
> +	if (cl->tx_sync) {
> +		if (!chan->mbox->ops->send_data_sync)
> +			return -EOPNOTSUPP;
> +
> +		if (cl->tx_block || cl->tx_tout || cl->knows_txdone)
> +			return -EINVAL;
> +	}
> +

[Severity: Medium]
If a controller only provides send_data_sync (a synchronous-only controller=
),
and an asynchronous client without cl->tx_sync set binds to it, shouldn't we
also validate the presence of the legacy send_data op?

If an async client binds to a synchronous-only controller, it appears it
could later result in a NULL pointer dereference when sending a message:

drivers/mailbox/mailbox.c:msg_submit() {
    ...
    err =3D chan->mbox->ops->send_data(chan, data);
    ...
}

>  	if (chan->cl || !try_module_get(chan->mbox->dev->driver->owner)) {
>  		dev_err(dev, "%s: mailbox not free\n", __func__);
>  		return -EBUSY;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-riscv-rpmi=
-tee-abi-v1-0-04908b81d885@oss.qualcomm.com?part=3D1
