Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4C13AC0FD
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 11:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263718; cv=none; b=g9deR+kW9YUASmlcY8BHZ+bkpoWzEBcs7tzg6jdxRKKZpdIptTgKzRLRp0Zw+DQEFNqimpYs3ZAvF+JlWKMbhu6/T73Xvl7j8/QsliHSTBCuSut2dVnNNWF8QQOIHDemstaqCh0MVKqwHzwn8ekUSRsLc6gO1VsIwr6lxcT5SZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263718; c=relaxed/simple;
	bh=zfR94t7udJBh14D1VM+Asv3t2JdezreNo8Nnts59s6w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bu7QSC/eSFZbCgGeNom9/yooyarFal52lEFHBOBYute5zMkOmOweX8yJ4ui4XC4p0cMzJ/2zYs2FCjCY879LeC/DgB0oakLbe99maH9KvfaJUtCvP994SdW72pEmIRTRekl/2eg7Mdbdde1cszofj6XHw+m8bRy5MDC3+l6yR+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MSxVvF+B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSxVvF+B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A20E1F00A3D;
	Tue,  1 Sep 2026 11:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788263715;
	bh=alJdvdfAQ42Hxt9ROawbxB2ozskwRrPzaCNcH6c+gzY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MSxVvF+B3MsnmLBZzbKl0uJVTvQzqPVYrT1Iu5lrV1HEDBf8da0CgaJuCkqt0wNn0
	 GdNxfFDcDMbJcfthDCAI9NL2HwSZFm1+hx7yqwKmv+YTiZuCqFwhu9Ar91HKAeOzk5
	 ZN6/eVmSD9q+2NGgv3HU331NxwNP3lMgWc4E7BxFndWigSTkdWUzV8VpAv1g+ASAOt
	 2df+1Zhm2V9T2UJSuPh3sMEnuCI2C7O0AiX8h2o+vGjBxC2mn5Jir8B6cXYuBzC7LX
	 qLbXS3S+rJBiwyKDb+ecO/Zdixt9kd8XwBzWcWwzrh5oKuORFklfD/ZUzqv+QtHydM
	 AN95AfIELqvcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] i3c: mipi-i3c-hci: Add a quirk for 64-bit DMA
 addressing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Billy Tsai" <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260901-b4-i3c-hci-ast2700-v1-3-19909e7cbd7e@aspeedtech.com>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
 <20260901-b4-i3c-hci-ast2700-v1-3-19909e7cbd7e@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 11:55:15 +0000
Message-Id: <20260901115515.6A20E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A malicious or non-compliant hardware controller can trigger a div=
ision-by-zero kernel panic during probe by reporting a non-zero DAT_ENTRY_S=
IZE or DCT_ENTRY_SIZE.
- [High] If an I3C transfer is queued but never started by the hardware, th=
e waiting thread will enter an infinite loop in the kernel, leading to a pe=
rmanent hang.
- [High] A malicious I3C hardware controller can trigger a heap out-of-boun=
ds read by reporting an arbitrarily large number of chunks in IBI status de=
scriptors.
--

commit a8b22e15760d201630758778160cab05d823bd74
Author: Billy Tsai <billy_tsai@aspeedtech.com>

i3c: mipi-i3c-hci: Add a quirk for 64-bit DMA addressing

This commit adds a HCI_QUIRK_DMA_64BIT quirk to declare a 64-bit
streaming and coherent DMA mask for I3C controllers that support it.

> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/=
mipi-i3c-hci/core.c
> index a624e3c40484e..c03c3a9cbe4f9 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c

[ ... ]

> @@ -1167,6 +1168,12 @@ static int i3c_hci_probe(struct platform_device *p=
dev)
>  	hci->quirks =3D (unsigned long)device_get_match_data(&pdev->dev);
>  	if (!hci->quirks && platform_get_device_id(pdev))
>  		hci->quirks =3D platform_get_device_id(pdev)->driver_data;
> +	if (hci->quirks & HCI_QUIRK_DMA_64BIT) {
> +		ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> +		if (ret)
> +			return dev_err_probe(&pdev->dev, ret,
> +					     "cannot set DMA mask\n");
> +	}

[Severity: High]
This isn't a bug introduced by this patch, but could a malicious or buggy
hardware controller trigger a kernel panic due to division by zero?

In i3c_hci_init(), if the hardware is version 1.0 (where size_in_dwords is
true) and reports a non-zero DAT_ENTRY_SIZE, the driver sets DAT_entry_size
to 0 and then immediately divides by it:

drivers/i3c/master/mipi-i3c-hci/core.c:i3c_hci_init() {
    ...
	hci->DAT_entry_size =3D FIELD_GET(DAT_ENTRY_SIZE, regval) ? 0 : 8;
	if (size_in_dwords)
		hci->DAT_entries =3D 4 * hci->DAT_entries / hci->DAT_entry_size;
    ...
}

[Severity: High]
This is a pre-existing issue, but could an unresponsive hardware controller
cause a permanent kernel thread hang?

In i3c_hci_process_xfer(), if the hardware stalls or the DMA ring is blocke=
d,
the transfer might never be marked as started. The loop checks for a timeou=
t,
but remaining_timeout is not decremented, causing an infinite loop:

drivers/i3c/master/mipi-i3c-hci/core.c:i3c_hci_process_xfer() {
    ...
		/* Keep waiting if xfer has not started */
		if (!started)
			continue;
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but can an out-of-bounds heap
read happen if a hardware controller reports an arbitrarily large number of
chunks?

In hci_dma_process_ibi(), ibi_size is calculated from chunk counts reported
in IBI status descriptors. If the calculated ibi_size exceeds the physical
ring buffer size (rh->ibi_chunks_total * rh->ibi_chunk_sz), this could
overflow the rh->ibi_data buffer during memcpy:

drivers/i3c/master/mipi-i3c-hci/dma.c:hci_dma_process_ibi() {
    ...
		memcpy(slot->data + first_part, ring_ibi_data,
		       ibi_size - first_part);
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-b4-i3c-hci=
-ast2700-v1-0-19909e7cbd7e@aspeedtech.com?part=3D3
