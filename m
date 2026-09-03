Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE864A5C34
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 12:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440269; cv=none; b=I76GgNHaRORH9JhQ1rRDwTqRX9aQRkabzxYtVSF9IS9kiMDYXfS+olIHUIUrFCcVny1LyG6jE4LLDI5TH6Os634T82iY4HYF3i89rKmyy/rc8alR8WlO2FGRd+xXCkoIF09jh+WEpXbDNNVSHTvDtIW88CnkL+isBc0K/zlfv/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440269; c=relaxed/simple;
	bh=E+T240zBcpTbFRN93TeYg2uVJpun8JxuN1nyK+xX0Ww=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T3fOb9vmOAbaFo6ig/9hFuL1NIEJ9z9tm2utTWT0oShpCRReTDd4EVP7jXrU5EZbbZxG/TGmAWZhVfwZ4600kyddlaInAN1N38YKJiot9sa29n8LbEnShAnVDWdrSaqS3SC0XkT1jenek4Esj30dzFb2vfiWna5erzaa8F1Sxeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JkVh7wa6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JkVh7wa6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881481F00A3A;
	Thu,  3 Sep 2026 12:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788440267;
	bh=dGe68pxMoAmo20XfuXq1tycXvegsJ9M3bkYzvNPJKxI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JkVh7wa67c4tZad9rIPxx+TGWkj18bA8o8EGMpqQRbtE7y9TvJA8zGi6AYIqVhblL
	 OuMPZdqVmGrWTkC/nqA6cz5yQiK1c1Iu18gbgrafZG+sU7AAxtZ5duw63IywVcGiF3
	 DCVpNvFEP9MrYk5odutrATxL7lDHrUJuZXOkvcu4b9oZ4TteialuZDzwKyl5wDF0jr
	 FxmS0Cr5LJUdYPbUJQT382lm3g/xBYHDLMxP0JGHGChVFgSgM4PBZ4KiinuiVdIwDX
	 y3X3JV6PNQvP4nzg7n55FF5wIkBoqR2/0qCk50j3TYXC5srk4/jkAumRUGb9mvxREj
	 mw0TtZlsv0lvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 8/9] arm64: dts: ti: k3-am62p: Split r5f memory
 region
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWFya3VzIFNjaG5laWRlci1QYXJnbWFubiAoVEkp?= <msp@baylibre.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-8-74c650dfdea6@baylibre.com>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
 <20260903-topic-am62a-ioddr-dt-v6-19-v8-8-74c650dfdea6@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 12:57:47 +0000
Message-Id: <20260903125747.881481F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Splitting the single firmware memory region into multiple smaller =
regions breaks kernel-side firmware loading for existing firmware binaries =
whose ELF segments do not perfectly align with the newly introduced exact b=
oundaries.
--

commit 26f5fd0eab7dd6c1ef82f91d1fe6cdf1fe46183f
Author: Markus Schneider-Pargmann (TI) <msp@baylibre.com>

arm64: dts: ti: k3-am62p: Split r5f memory region

This commit splits the firmware memory region into multiple specific parts
so bootloader software can find necessary information like LPM metadata.
This replaces a single contiguous firmware region with several smaller ones.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/=
arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> index 5d7f701420e2d..84dfbfd1986ce 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> @@ -44,8 +44,14 @@ &wkup_r5fss0 {
>  &wkup_r5fss0_core0 {
>  	mboxes =3D <&mailbox0_cluster0 &mbox_r5_0>;
>  	memory-region =3D <&wkup_r5fss0_core0_dma_memory_region>,
> -			<&wkup_r5fss0_core0_memory_region>;
> -	memory-region-names =3D "dma", "firmware";
> +			<&wkup_r5fss0_core0_ipc_region>,
> +			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
> +			<&wkup_r5fss0_core0_lpm_metadata_region>,
> +			<&wkup_r5fss0_core0_lpm_rest_region>,
> +			<&wkup_r5fss0_core0_dm_region>;

[Severity: High]
Does this fragmentation break kernel-side firmware loading for existing
firmware binaries?

When the remoteproc core attempts to load the firmware, it calls
rproc_elf_load_segments(), which requests a contiguous virtual address
pointer for each segment via k3_rproc_da_to_va().

Because k3_rproc_da_to_va() evaluates each rmem chunk independently, any
segment spanning the newly introduced boundaries fails the strict bounds
check:

drivers/remoteproc/ti_k3_common.c:k3_rproc_da_to_va() {
    ...
    if (da >=3D dev_addr && ((da + len) <=3D (dev_addr + size))) {
    ...
}

It does not coalesce contiguous chunks. Thus, any firmware segment that spa=
ns
across the newly introduced chunk boundaries will fail the check and
return NULL, rendering the device unable to boot.

Since device tree updates must not break backward compatibility with existi=
ng
firmware binaries, should the driver be updated to coalesce adjacent memory
regions before searching, or should this region split be reconsidered?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-topic-am62=
a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com?part=3D8
