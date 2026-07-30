Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319D439E6EB
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 04:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785386920; cv=none; b=YNnZB75fNW9Ey9Kpkh2dWxMmjAR8tTQaKOG5giWaYjPRcJpC57tPqf/Iycjzi8P6g9Gluji3GM82gtqk9x1b5DjGMiSyNqergraA4rdmjM2wL136gyCYmCEgKEDn39kG3ZvcGKPwKMU+s9Kcft1WtfmI4yTxK42xTvcKWDP4WaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785386920; c=relaxed/simple;
	bh=D0jeBLh0/qThhoecmq2kx4zrAh69+mneqV8bznGBS5s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QZTADfIyRYNB0fYLdqiItgj72pDni40aij18/4GQ6UvO+J4p4UHXjJLahPJqp/vzE0oFTgiquwJmAr7MPt5i5JTJxpqNHSDaMyIld+SRW/TkNkp7MLaKBZKgIp/aSktC+twptQSZhDm3KoFwHFzlZ+A++oDM4zGz2ezfbwY6TyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQf93XG0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQf93XG0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3F21F000E9;
	Thu, 30 Jul 2026 04:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785386918;
	bh=ZXobB38rh3fmYgMoBXZMloFUfw1W1NMCrXbXYxNl4+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HQf93XG05R2ky8a2QJU0M/guNnxeDQkDLlXdxwQCJ9uBP4+YaYJQPDMKGsO0yG9yM
	 KusbPF5CnQa8Jw4A1Jo4QZLxr60J9AUjOs8sL1L6tMOLEzDLr14Mrl4quw7+Wccxhm
	 A74ZoXTTgtTZDHzZ/7AWV4F/i1wm8DF/Dh3go9ufbZyWm6jnti8h0TnVJGCf552C5j
	 E5vzaaMPZQjNyvs6UXTmmke9tdtq7l6fqLhfDZsgI35VRGtXSQ3l9C2TXYiKcqKHVy
	 m7VdsPCLsJDwQQwuTyz/GQxGdvoXdZzfHxIVgR9Tu0SqOFlPim0jGWUsHZv0/ekjqO
	 xkWySQRjTQBCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mailbox: add Axiado AX3005 mailbox driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Swark Yang" <syang@axiado.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729-upstream-axiado-ax3005-mailbox-upstream-v1-2-8961b7350338@axiado.com>
References: <20260729-upstream-axiado-ax3005-mailbox-upstream-v1-0-8961b7350338@axiado.com>
 <20260729-upstream-axiado-ax3005-mailbox-upstream-v1-2-8961b7350338@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 04:48:37 +0000
Message-Id: <20260730044838.4C3F21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The driver violates I/O accessors guidelines by using register a=
ccessors (writel/readl) instead of stream accessors (writesl/readsl) for bu=
lk FIFO transfers.
--

--- Patch [2]: [PATCH 2/2] mailbox: add Axiado AX3005 mailbox driver ---
commit 49c49dbc503dbb9fb858d95d2747ac82a8d54442
Author: Swark Yang <syang@axiado.com>

mailbox: add Axiado AX3005 mailbox driver

Add a mailbox controller driver for the Axiado AX3005 SoC.
The controller provides communication channels between
the host CPU and the coprocessor.

> diff --git a/drivers/mailbox/axiado-mailbox.c b/drivers/mailbox/axiado-ma=
ilbox.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/mailbox/axiado-mailbox.c

[ ... ]

> +static int axiado_mbox_send_data(struct mbox_chan *chan, void *data)
> +{

[ ... ]

> +	for (offset =3D 0; offset + sizeof(u32) <=3D msg_len;
> +	     offset +=3D sizeof(u32))
> +		writel(get_unaligned_le32(buf + offset), priv->mbox_reg);
> +
> +	tail_len =3D msg_len - offset;
> +	if (tail_len) {
> +		memcpy(tail, buf + offset, tail_len);
> +		writel(get_unaligned_le32(tail), priv->mbox_reg);
> +	}

[Severity: Medium]
Does this code use the correct I/O accessors for FIFO transfers?

According to the I/O accessors guidelines, stream accessors like writesl()
should be used exclusively for FIFOs instead of register accessors like
writel().

While get_unaligned_le32() attempts to cancel out the endianness mapping,
using writel() in a loop introduces unnecessary per-access memory barriers.
Could this be updated to use writesl() for the bulk transfer?

[ ... ]

> +static irqreturn_t axiado_rx_thread(int irq, void *dev_id)
> +{

[ ... ]

> +	for (i =3D 1; i < num_words; i++) {
> +		word =3D readl(priv->mbox_reg);
> +		put_unaligned_le32(word,
> +				   buf + i * sizeof(u32));
> +	}

[Severity: Medium]
Similar to the transmit path in axiado_mbox_send_data(), should this loop
use readsl() instead of readl() for reading bulk data from the RX FIFO?

Replacing readl() with readsl() would align with the guidelines for FIFO
data streams and avoid the implicit memory barriers on each read access.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-upstream-a=
xiado-ax3005-mailbox-upstream-v1-0-8961b7350338@axiado.com?part=3D2
