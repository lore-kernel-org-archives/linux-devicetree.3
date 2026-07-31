Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E769B3D9DBA
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487204; cv=none; b=fYzZzk9yjbIV8edOfXc/VODTMFn6kjBShLjfu+q2cMx0KyU/CXAfP1B7pNkUsznCZb8BFnFdGVFbVh/Gwfq51xvi0A/RvMsO27QJtB35W6qjoFUshQ8vw5aMRyHFSQilQ7XXnIP5EcyGSbbLAforQ+DhJLgA+nfhArqa0JAShXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487204; c=relaxed/simple;
	bh=ewd88yJ5NivXVPtguyvHyu754kS2LDqgZNPl0YlmRJw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nq0ZtdBK53tg/UpCGy4Seiyri9yxuL/tN2tJR/EPZErvZJdmC+AutcWkJKSPLuSqlm2jf3Nk2xiLBo5Jz6naUQ/yFiDmBqYgBpGH/+6J4Fxy/TU4fyOx83fMmvBkjZ6h6WGr0MeJHuuJqQnM+gZT92+MGkjY4XuJZQDTlpGBP5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fh6l/dPu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fh6l/dPu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06C71F000E9;
	Fri, 31 Jul 2026 08:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785487196;
	bh=kue5sO5goUDkkvTA6JQa2eZBGxYBxE4KXngzR0gA5uI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fh6l/dPuGyH3RAF0G7RQsg3BOghKrYN2FziRoS2uixWcfM/bwdNSKyg51IVL4a0H1
	 RwDFxbm9WdMbxiGjF1JhzBdVCjSvHrJJjPUpc5iDHKmKRnHRzzD7//6OiSo7r0vKAA
	 GRm/1z6RcUgAXT8bgCmwqvnHkpYNNTxVz9o35DO/qCcYXcfmj4Mo3Jkk19XWxOfyWU
	 FU1g+ixd9tXhc7zDV+ii6FpC7Prw8CNImJjWSU9gTWb/DJRfYt4mRWw/m2BBXiVIU/
	 9JyAYolA1SE/0GelS9LOga9Qf6dtKQPXbX/INwkBkyAdmADDslW3y3VDbDbfwpB4Xj
	 uyV8saz31OuLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: iio: adc: adi,ade9000: add
 adi,ade9078 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antoniu Miclaus" <antoniu.miclaus@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260731082951.1228-3-antoniu.miclaus@analog.com>
References: <20260731082951.1228-1-antoniu.miclaus@analog.com>
 <20260731082951.1228-3-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 08:39:55 +0000
Message-Id: <20260731083955.B06C71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The IIO channels for Phase B and Phase C have overlapping `scan_in=
dex` values, causing them to conflict in the IIO buffer and preventing corr=
ect channel configuration.
- [High] The IRQ1 handler loop stops at bit 24, completely ignoring Phase C=
 dip events (`ADE9000_ST1_DIPC_BIT`) which are located at bit 25.
--

--- Patch [2]: [PATCH v2 2/4] dt-bindings: iio: adc: adi,ade9000: add adi,a=
de9078 compatible ---
commit fea768d482e94a570394d820d69e5c756bc56362
Author: Antoniu Miclaus <antoniu.miclaus@analog.com>

dt-bindings: iio: adc: adi,ade9000: add adi,ade9078 compatible

This commit adds the ADE9078 compatible string to the ADE9000 binding and
lowers the maximum spi frequency for the new variant.

> The ADE9078 is a polyphase energy metering device from the same family as
> the ADE9000. It is register-compatible with the ADE9000 but does not
> provide the on-chip dip/swell detection and is limited to a 10 MHz SPI
> clock.

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the ADE9000
driver family, I noticed a potential conflict with the channel
configurations.

Looking at drivers/iio/adc/ade9000.c:

#define ADE9000_CURRENT_CHANNEL(num) { \
...
	.scan_index =3D num,
...
#define ADE9000_VOLTAGE_CHANNEL(num) { \
...
	.scan_index =3D num + 1, /* interleave with current channels */

Does this cause Phase A Voltage (index 1) to conflict with Phase B Current
(index 1), and Phase B Voltage (index 2) to conflict with Phase C Current
(index 2)?

When a user enables Phase B or C channels via sysfs, it seems this could
cause the active_scan_mask to map to the wrong bits. Could this lead to
an unsupported combination of scans or incorrect channel configuration in
ade9000_waveform_buffer_config():

	bitmap_to_arr32(&active_scans, indio_dev->active_scan_mask,
			iio_get_masklength(indio_dev));

	switch (active_scans) {
	case ADE9000_SCAN_POS_IA | ADE9000_SCAN_POS_VA:


[Severity: High]
This is also a pre-existing issue, but I noticed a potential problem with
the Phase C dip detection logic.

Looking at drivers/iio/adc/ade9000.c:

#define ADE9000_ST1_CROSSING_DEPTH	25
...
#define ADE9000_ST1_DIPC_BIT		BIT(25)

And later in ade9000_irq1_thread():

	bitmap_from_arr32(interrupt_bits, &interrupts, ADE9000_ST1_CROSSING_DEPTH);
	for_each_set_bit_from(bit, interrupt_bits,
			      ADE9000_ST1_CROSSING_DEPTH) {
		tmp =3D status & BIT(bit);

Since ADE9000_ST1_CROSSING_DEPTH is 25, will these operations only handle
bits 0 through 24? Does this mean bit 25 is missed and Phase C dip events
are silently ignored when the hardware triggers an IRQ1?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731082951.1228=
-1-antoniu.miclaus@analog.com?part=3D2
