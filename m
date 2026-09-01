Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B3839A7E0
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 11:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263483; cv=none; b=mV7LmGMdb0/f/1FN8jg4flvXfIEUZ4+NJLJERwDyExZU96tddwgjPSxVUQ3zBsIbNr7yFheC2WyO6tbQ8XmKK3HiVnlIEKclhe7Ik5Z9SXizHIPReySllGDgFarmYQypzPiHCI9lc0my/4QVGXeDtHrqZhSeHCKk4tganKbL8K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263483; c=relaxed/simple;
	bh=JtxqVk5NwK808DcPDDJZyAfomJtbzDXg0y3m6792SSM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kWZ5BBijK3kTrQSFIr+7+H0o/1epwFxS/o+4ODxw1UnRLbfOyZkNJBC/LTnR1P1VERrsUgc4tufCxOcsXuO5rdT/5xXH3JnsNdRZVoYCshzZJd7GOohOM0Zkt9nA69hhSNxlk2mYNAoh6XIDroMHJ4mIGBRWJDloibvHspmqn0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFzUhJgY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFzUhJgY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622F71F000E9;
	Tue,  1 Sep 2026 11:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788263481;
	bh=VR0hNmq1MqgYNy0fHyILETThfMxQJXGNu4w58/otCnM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lFzUhJgYdzaCgN8h+njVv3VgtviT2o4eLmqPz9sVER2b+eYULyxCvJYd08Osa+NFn
	 hNcgu/lxMuZdvUwx1E3fTRW4WhVzizDhDFVUpOVwqLEC1Fcqf+8rpqTFom0HMkb4Du
	 YhRwrtK2mEPjC6ueUrDW0TakVRCMIc95+8JzvtNWj0SosK4Nw4uGQBK2ojqlPbHnrA
	 B4bsj2ThDGyTp1zyTzAgSaIrm51RHuo+4pztTwkj8oTh0pug4JT0Y8GGjmXRfXcLjB
	 8UQ7KEtEurgYTl5dHh8KY4seewHcEeBd6jMsC+iQculpJ7xoTyOCpg9ICRdi7NWASm
	 y2ZRjA22Trc8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/8] i3c: mipi-i3c-hci: Improve AST2700 PIO TX queue
 utilization
Reply-To: sashiko-reviews@lists.linux.dev
To: "Billy Tsai" <billy_tsai@aspeedtech.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260901-b4-i3c-hci-ast2700-v1-7-19909e7cbd7e@aspeedtech.com>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
 <20260901-b4-i3c-hci-ast2700-v1-7-19909e7cbd7e@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 11:51:20 +0000
Message-Id: <20260901115121.622F71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Calling `of_device_is_compatible()` via the `is_aspeed()` helper i=
nside the high-speed PIO TX data transfer loop causes severe CPU overhead a=
nd latency.
- [High] Hardware TOCTOU / Stale write pointer read leading to FIFO overflo=
w.
--

commit 3be95193756af176407d7f4071b09a591d9a4eb3
Author: Billy Tsai <billy_tsai@aspeedtech.com>

i3c: mipi-i3c-hci: Improve AST2700 PIO TX queue utilization

This commit updates the MIPI I3C HCI driver to improve TX FIFO utilization
for the AST2700 controller. It introduces a vendor-specific check to poll
the exact number of free FIFO entries using hardware read/write pointers
instead of relying on a half-empty threshold.

> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/m=
ipi-i3c-hci/pio.c
> index 6bd5e43364a1d..3d70257dcc1dc 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c

[ ... ]

> @@ -295,11 +296,23 @@ static bool hci_pio_do_tx(struct i3c_hci *hci, stru=
ct hci_pio_data *pio)
>  	p +=3D (xfer->data_len - xfer->data_left) / 4;
> =20
>  	while (xfer->data_left >=3D 4) {
> -		/* bail out if FIFO free space is below set threshold */
> -		if (!(pio_reg_read(INTR_STATUS) & STAT_TX_THLD))
> +		unsigned int avail =3D pio->tx_thresh_size;
> +
> +		if (is_aspeed(hci)) {

[Severity: High]
Does calling of_device_is_compatible() inside this fastpath byte-transfer
loop cause significant CPU overhead and latency?

Looking at is_aspeed() in vendor_aspeed.h, it parses the Device Tree and
performs string matching:

static inline bool is_aspeed(struct i3c_hci *hci)
{
	return of_device_is_compatible(hci->master.dev.of_node,
					"aspeed,ast2700-i3c-hci");
}

Since this executes repeatedly for every 4 bytes transferred, it might ruin
throughput, especially for non-Aspeed controllers where it gets evaluated
constantly. Would it be better to check compatibility exactly once during
probe and cache the result as a quirk flag?

> +			/*
> +			 * The vendor FIFO pointers give the exact free space,
> +			 * allowing better TX FIFO utilization than the
> +			 * threshold status.
> +			 */
> +			avail =3D aspeed_i3c_avail_tx_entries(hci);

[Severity: High]
Could this read of the hardware write pointer immediately after posting a
write lead to a FIFO overflow?

Memory-mapped I/O writes over buses like AHB/AXI are posted, and the
hardware controller might need a few clock cycles to commit the data and
update its pointers.=20

If aspeed_i3c_avail_tx_entries() reads QUEUE_PTR0 before the hardware
increments the write pointer, won't avail remain artificially high?
If it does, the loop will immediately push another chunk of data,
potentially overflowing the 32-entry hardware FIFO.=20

Should the driver locally track and deduct the number of words written from
the available space during the active transfer instead of re-polling the
hardware register?

> +			if (!avail)
> +				return false;
> +		} else if (!(pio_reg_read(INTR_STATUS) & STAT_TX_THLD)) {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-b4-i3c-hci=
-ast2700-v1-0-19909e7cbd7e@aspeedtech.com?part=3D7
