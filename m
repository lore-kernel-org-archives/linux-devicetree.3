Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA563AE197
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 03:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430790; cv=none; b=nwhWKDrIu4ni7dogoTLeamvgE119Y8TwZZ7jFbq93h+21WMG+EITNBrr8NQAuF62ffNLcodIcWHNKBJuC4OdzV4W9EAoY3ns6vAgxzjYhh76lSki43NKIvKXsjcYq/TkhfXuRSRMxR27Z9KsC+3s1G3VfT5IKev70A7eUJf/Q6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430790; c=relaxed/simple;
	bh=Qu7nbVzHhR5+uzhex5LLXHgcVGa7q3IGOu8GP9G0PSM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gQQWhxkDx7HNQ5/1Y/Aub0SZDN64HOQ1q1AQ0N2brpfBcMxJgmCboBkVqoX7LvdadguNidrghChnPoM0TQ3zQYmT97PW42JC1mSTL150XaMcONOm+Js1V0pGHbscCWmv9GrPi/9KIu+9s3Y334SgP2tY/MP2LyZG049HPLURfzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSNhoETK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSNhoETK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9C01F000FF;
	Thu,  8 Oct 2026 03:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791430789;
	bh=llobzcLl4mEEZptuPLyKw2+X549onMu7dkpok1gk7U8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nSNhoETKVMuj1ST3rPD2LnROi+ZfaJ4pChbPaboedtggVhfrMxRddyA/9RWP6hthl
	 U6TxmQstq3hwWQJWdM60PdioFWCVM8rqJfc9j6r/FLxGMd5OnyKA9CXx6Y/+T6Q4Vr
	 WHlYuAaq1UdFsQxrdhuq+8LmcNoB1/cCiVzGWSZ268/vSW1AM9x2c9K7Vpfq4jVEEz
	 tu066EpuOwhDzvDruXmYRkERaAOulnfKoA1jannvVRw4P/gLYrWeZg4VN+aI26CyQb
	 2lLLRzjV1ANrCHu0y2RjT1ZPD0fXctFVDISu+a8WffOiQQyhCaK4hmjaX9QSVrjMZ7
	 35qQ79BKCRByg==
Message-ID: <sashiko-outbox-163569@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 01/10] mailbox: add direct synchronous send
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261007-riscv-rpmi-tee-abi-v2-1-45939a13d223@oss.qualcomm.com>
References: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
 <20261007-riscv-rpmi-tee-abi-v2-1-45939a13d223@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 03:39:48 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mbox: missing check for send_data ops when binding async clients c=
auses NULL dereference
--

commit 32ed128a065b48b8882da987a95570f9f1da93f8
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

mailbox: add direct synchronous send support

This commit introduces a direct synchronous send path, allowing controllers
to complete transactions within the calling context without the TX state
machine. It adds the send_data_sync operation and validates that clients
requesting synchronous transmission are bound to compatible controllers.

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

[Severity: High]
If a controller implements only the new send_data_sync path, could a legacy
asynchronous client (where cl->tx_sync is false) successfully bind to it?

If this happens, wouldn't mbox_send_message() unconditionally execute
chan->mbox->ops->send_data() inside msg_submit():

drivers/mailbox/mailbox.c:msg_submit() {
    ...
		if (chan->cl->tx_prepare)
			chan->cl->tx_prepare(chan->cl, data);
		/* Try to submit a message to the MBOX controller */
		err =3D chan->mbox->ops->send_data(chan, data);
		if (!err) {
    ...
}

Will this cause a NULL pointer dereference? Does __mbox_bind_client() need a
reciprocal check to ensure chan->mbox->ops->send_data exists when
cl->tx_sync is false?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-riscv-rpmi=
-tee-abi-v2-0-45939a13d223@oss.qualcomm.com?part=3D1
