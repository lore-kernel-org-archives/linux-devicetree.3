Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770A83DBD65
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724149; cv=none; b=HSdhGozk/bSbZmkUprpE+4Mt/WIoc5ec+utHGagJ8suS7CCvTwgLv5nqatOfSFj5+mxNWS6yT6rsmWu8i2bq5bJqGO1O3+yHuzlFtUtbhfWw2RfZavT5K88WHdmg8+lR7Rr3Fm9LGoDQzdWtVxgR9rhDaDBcxvtKzFeQ/vrjS04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724149; c=relaxed/simple;
	bh=GrwL38FcE074vj9wQ0gghwTXFwQRf9eZqo15oQPh5M8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gssfv+i9UG0KPJpCF9Hocw24TpffLWbsPgW6c+HpLIQW77+cmzxvElyZ5oVQbNOy3I1qckvMlUWshPtVIwGN/2Vqsd9RbqqR8gDo8+bEwIeFBZm9GLJmW8WC0FHsnFzVNwGIHba2L1N/fkDta04sAH+N1ZHLB8O0fJdSwMvn4pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9cb70mg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9cb70mg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7B51F000FF;
	Fri, 18 Sep 2026 09:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789724148;
	bh=AD8h7ztbccVO+b+gFD2bjZhlsK7ZGywZ8kt36EVgsMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c9cb70mgxl1c/f4HxYK5VlXOKxQEKubjPkk1bv1NAXI0mpiTmEYHXyUvqVTTkfmzZ
	 Vh70yGlNAJj5oYmHS3DoqEKF67r00ZISa0IUfEfn151FT8+fH7JvutdFI0Yz2xsj08
	 iRXK96jlVvWH1u/W7GFC8I86HHynyfeIw8iL5MNbdkvAtuZ24cx8T1ZXhkS6vUAOpS
	 729/N+65Yh6rPOOYJ3a5YcDQN7/5q3aUyrNQJbg6yINK7rFLC+JWbiNW2xnm6DNDFB
	 MenvvbTA6/R4DW1v4YZxXdwr95YtXDEFsfwHOT9ccSLtT3sEWqbJBsU/v5sULTXvAL
	 P+eac1l13PEog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 8/9] arm64: dts: ti: k3-am62p: Split r5f memory
 region
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWFya3VzIFNjaG5laWRlci1QYXJnbWFubiAoVEkp?= <msp@baylibre.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-8-40972ef1f663@baylibre.com>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
 <20260918-topic-am62a-ioddr-dt-v6-19-v9-8-40972ef1f663@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 09:35:46 +0000
Message-Id: <20260918093547.5C7B51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] remoteproc: k3: Fractured memory regions break ELF segment loading
--

commit b4b7a5f900d44d8b6be48d2b954e57774fd913af
Author: Markus Schneider-Pargmann (TI) <msp@baylibre.com>

arm64: dts: ti: k3-am62p: Split r5f memory region

This commit splits the firmware memory region in more specific parts so it
is better described where to find which information. This allows bootloader
software like U-Boot to know where the LPM metadata is located.

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
> +	memory-region-names =3D "dma", "ipc", "lpm-stub",
> +			      "lpm-metadata", "lpm-context",
> +			      "dm-firmware";

[Severity: High]
Does splitting the contiguous memory region break the loading of existing
firmware ELF binaries?

When rproc_elf_load_segments() attempts to map an ELF segment, the bounds
check in k3_rproc_da_to_va() ensures the entire segment fits within a single
device-tree memory region:

drivers/remoteproc/ti_k3_common.c:k3_rproc_da_to_va()
    if (da >=3D dev_addr && ((da + len) <=3D (dev_addr + size))) {

If an existing firmware binary contains a PT_LOAD segment that spans across
these newly introduced region boundaries (for example, crossing from the
ipc_region into the lpm_fs_stub_region), this strict bounds check will fail
and return NULL. The remoteproc ELF loader will then reject the firmware and
fail to boot the R5F cores.

>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-topic-am62=
a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com?part=3D8
