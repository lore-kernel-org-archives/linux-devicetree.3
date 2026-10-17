Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE0229D294
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 01:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792198824; cv=none; b=XjBG6CLFRa02pUs94VFFMblWxx2bMBBVf8OE2bE49ouIuhoJBgh46CPUlSf6n1eOUwQAr/MbPIVzPk8ppNUqkC2ElpDFCSbfsvlXDnyN4FH2W19ZZzz/jU4Uq2f1zpnIRwscvk1vthGw/ZMWTgY2SKU6FfiKXOzStynCku5k4Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792198824; c=relaxed/simple;
	bh=24vDvmJ+EuUxvu2RGh7/VqCesRmQbmYqYfrdEcDen1k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kacIVFIRmbUYUH3yKsEcOke3Wm06sKFSdKZpS5C/h2lY+Pul4zS/qe8miPgVZFIsxKWpuynmdUCtMa+XXiiv2FHvmlNrGhlqFlfIfd8v5ILFbXlZiGE7sKJ4+nRN6zjpjL5HimONys4RcSgVTyfgRjeKiXOrUy8GOjVOk0XpCPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZyRCmR5d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZyRCmR5d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9021F000C4;
	Sat, 17 Oct 2026 01:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792198822;
	bh=gmx+TrflDghc/SOfT9hRzGDH/3zUzvwWvxa2FcvRl8w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZyRCmR5dwsAvEWNvh/2sB4BNIy4anc5tajth9M8GDpWJpSWPoCp04n2C09mkrr/I8
	 NpXLM3Yzq46BY/9cqXQSep4qDnOIe+CCjUkoeEr7pnTOZyTzFIEfjN2Oiz/Og3sNAY
	 otuKUG6ip6E3RwPAL91/T2t5amE44EZAbTdigDmEp+zpq/6YttsB+VMIHxaUldoMLP
	 eWsADCjJHHGhPFoYCT2ZF+o5fRYniwBoJ900eITYTrEoZipajdkTASh5Xjb3vgAIQT
	 /9zcwSHWmrxL2rzvDuQTiC42qXxCc4NL1sOeqF+XENApkrQ7A8TU643PDIk8a7+h1j
	 YfDNDO5UUHtIQ==
Message-ID: <sashiko-outbox-175094@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v14 10/12] dpll: sit9531x: add support to
 adjust output phase
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016005823.13690-11-arouhi@sitime.com>
References: <20261016005823.13690-1-arouhi@sitime.com>
 <20261016005823.13690-11-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 01:00:22 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dpll: phase adjust on unrouted output causes spurious flush on PLL=
 0
--

commit 110382f4bcb6a9f0c30f287863026dd1cb412fb3
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: add support to adjust output phase

This commit introduces support for output phase adjustment in the SiT9531x
driver. It computes coarse and fine delays and implements the hardware
programming sequence, including divider realignments.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> +int sit9531x_output_phase_adjust_set(struct sit9531x_dev *sitdev,
> +				     u8 out_idx, s32 phase_ps)
> +{
> +	u8 old_bytes[SIT9531X_OUT_PRG_BYTES], new_bytes[SIT9531X_OUT_PRG_BYTES];
> +	const struct sit9531x_chip_info *info =3D sitdev->info;
> +	u64 fvco, divo, coarse;
> +	u8 pll_idx, fine;
> +	s32 phase_adj;
> +	int rc, ret;
> +
> +	lockdep_assert_held(&sitdev->multiop_lock);
> +
> +	if (out_idx >=3D info->num_outputs)
> +		return -EINVAL;
> +
> +	pll_idx =3D sitdev->out[out_idx].pll_idx;
> +	if (pll_idx >=3D SIT9531X_NUM_PLLS)
> +		return -EINVAL;

[Severity: High]
Does this code need to check if the output is actually routed?

For unrouted outputs, the initial state fetch assigns a default placeholder
pll_idx =3D 0. Without verifying sitdev->out[out_idx].routed is true, this
extracts pll_idx =3D 0 and computes phase bytes against PLL 0's Fvco when
userspace requests a phase adjustment on a disconnected pin.

[ ... ]
> +flush:
> +	/*
> +	 * Restart the output divider phase so the freshly programmed delay is
> +	 * applied against a known edge instead of the divider's arbitrary
> +	 * running phase.
> +	 */
> +	rc =3D sit9531x_output_phase_flush(sitdev, pll_idx);

[Severity: High]
Will this cause a spurious flush on PLL 0 for unrouted pins?

If the request proceeded with the placeholder pll_idx =3D 0, this flush
restarts the divider phase for every output driven by PLL 0. This could
subject active, properly routed outputs on PLL 0 to an unintended phase
jump and loss of lock, simply because userspace issued a valid DPLL netlink
request on a disconnected pin.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016005823.1369=
0-1-arouhi@sitime.com?part=3D10
