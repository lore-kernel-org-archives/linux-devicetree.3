Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313FF2931D1
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122390; cv=none; b=UZ3sf/SGNrCeN0QR7b7uCq2yQ8/PUYYfqxuhZzUIP3xbb6MbfwxQGT7ueMsP4xXaC5v3BAo4QW+6o4HIOMXz85HSA6nIId9ed/mjrW8nEIz47xE1sjxdNljUJ/z5U7FChP07c5Q27/iwetQUEt+RUTR6ELX9V4XVPqNuqfV1rzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122390; c=relaxed/simple;
	bh=fypS5sH2ojuj3Md2hE/nHT+xEcbmXnpx18jZaGXRa4w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=m8a38Kpb43J4scFkfMBQ8JC+LJAPMGY4KKTaRDF7pxHFvqS6YAu5n8lSozwwaOyWRXFBlfWm+Rq38ZaHiebfFI+cHHN9//JUxJtWjpTF1cJgy7SU9OWJy1+yLjYDMGbo8Hc00ROJlWSxjVRrwdqaZYdIO1htI/hhqiyVdb7LLcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgJ8nEH6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgJ8nEH6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BCE81F000C8;
	Fri, 16 Oct 2026 03:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792122388;
	bh=cCr8czCH7uPp/OWdcgyyLctPbucGwoumYeXkwF+2MGA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mgJ8nEH6Au5DeGeOj2kU2wGeNVgrc4t7eEd+mqr/ZXNFHLlkRDrJWI6foHSyt737x
	 nanyMP7wvQFP2/FY7m5cPxqowz0ya+EU4nU7OhP1oNPPnvidz7jLeqx3ajSL+OeE21
	 tEJk6uAw9g1JRgcCwnv/jAZ5sR97kQKJODbnFuOoXS6r/UriLQVmfZWm4p/t0lNQZA
	 UtpWrXR+bzjYj3krNMzMJXJ4RaDH8jht8dFasKIy2FnG8TDhncieGjOSIoWX3r9ZbY
	 M2r4Eru4fcSl/2LN2456vb108xzJNbtFnmSSiNSwnWGZSH0psMUbqjUv5IS8da8p6W
	 BulMS7apaDArw==
Message-ID: <sashiko-outbox-173697@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next v2 08/17] wifi: ath12k: Add hif operation
 support for QCN6432
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaradhana Sahu" <aaradhana.sahu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-mpp-bringup-v2-8-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-8-f510c33bfcf5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 03:46:28 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] net: ath12k: unconfigured dynamic window in pcic read32/write3=
2 causes out-of-bounds MMIO
- [High] wifi: ath12k: use-after-free in timer callback ath12k_ce_rx_replen=
ish_retry()
--

commit d724e1834e7dbd2c47e113791169e389fe945179
Author: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
wifi: ath12k: Add hif operation support for QCN6432

This commit adds HIF operations for the QCN6432 Wi-Fi driver by reusing
existing methods from IPQ5332 and QCN9274 where applicable. It implements
QCN6432-specific operations in a new pcic.c file.

> diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireles=
s/ath/ath12k/pcic.c
> new file mode 100644
> index 0000000000000..e3c8476af459c
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath12k/pcic.c

[ ... ]

> +void ath12k_pcic_stop(struct ath12k_base *ab)
> +{
> +	ath12k_pci_ce_irq_disable_sync(ab);
> +	timer_delete_sync(&ab->rx_replenish_retry);
> +	ath12k_ce_cleanup_pipes(ab);
> +}

[Severity: High]
Is there a mechanism preventing ab->rx_replenish_retry from re-arming itself
here?

If ath12k_pcic_stop() executes while the timer callback
ath12k_ce_rx_replenish_retry() is running concurrently, timer_delete_sync()
will wait. However, the callback invokes ath12k_ce_rx_post_buf(), which bli=
ndly
re-arms the timer on allocation failures (-ENOMEM):

drivers/net/wireless/ath/ath12k/ce.c:ath12k_ce_rx_post_buf() {
    ...
    ret =3D ath12k_ce_rx_post_pipe(pipe);
    if (ret) {
        if (ret =3D=3D -ENOSPC)
            continue;
        ...
        mod_timer(&ab->rx_replenish_retry, ...);
        return;
    }
}

Could this cause the timer to be re-enqueued after timer_delete_sync()
unblocks, leading to a use-after-free regression when the timer fires after=
 the
structures are freed?

[ ... ]

> +u32 ath12k_pcic_read32(struct ath12k_base *ab, u32 offset)
> +{
> +	u32 window_start;
> +
> +	if (offset < WINDOW_START)
> +		return readl_relaxed(ab->mem + offset);
> +
> +	window_start =3D ath12k_pcic_get_window_start(ab, offset);
> +	return readl_relaxed(ab->mem + window_start + (offset & WINDOW_RANGE_MA=
SK));
> +}

[Severity: Critical]
Does this read from an unconfigured dynamic window?

When offset does not fall into the statically mapped UMAC or CE ranges,
ath12k_pcic_get_window_start() returns the fallback dynamic window address
(WINDOW_START, which is Window 1).

However, unlike the cmem accessors or the PCI equivalent (ath12k_pci_read32)
which explicitly lock and program Window 1 to the high bits of the target
offset, this function skips configuration entirely and blindly performs the
read.

Could this result in out-of-bounds MMIO reads, directing the read to whatev=
er
physical memory address the dynamic window was previously configured to map?

> +
> +void ath12k_pcic_write32(struct ath12k_base *ab, u32 offset, u32 value)
> +{
> +	u32 window_start;
> +
> +	if (offset < WINDOW_START) {
> +		writel_relaxed(value, ab->mem + offset);
> +		return;
> +	}
> +
> +	window_start =3D ath12k_pcic_get_window_start(ab, offset);
> +	writel_relaxed(value, ab->mem + window_start + (offset & WINDOW_RANGE_M=
ASK));
> +}

[Severity: Critical]
Similarly, does this write to the dynamic window without first programming =
the
hardware register to map the target offset?

Like the read path above, ath12k_pcic_write32() uses the dynamic window wit=
hout
calling a window selection function such as ath12k_pcic_select_static_windo=
w().

Will this regression corrupt memory or hardware state by writing to a previ=
ously
configured but currently unrelated memory address?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-mpp-bringu=
p-v2-0-f510c33bfcf5@oss.qualcomm.com?part=3D8
