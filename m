Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D42327C0D
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 19:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781032511; cv=none; b=VlOmp1uA4nWq09cR+lKLXjQNrX9eVE5tKC9ZNmaj8xz2/+0jTGvk6fofy5u6aunkH2vM+H/Bkt/ABMMKalS1ms7HJiU6UMJuVNVRpB81IhCHe8CvHT4VGxSYyIqc76QKM1H+l1DvudnYbZRQ68XqYsnA8FW4fJPlLGzrpCL5phI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781032511; c=relaxed/simple;
	bh=Su9eWO/FvGna69BT/HqqalbCyMuErvw7jqVMK/jvEvE=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fnou/8FLLXMwbrKjnz0ACcDAqRFa3HyR+saO5J0kRuGUqI7TkTKHtNbZzv+a+4I0xZmY4pNiTamxhuWtBsYx6VtJ7vslA4cXBETqVJZwn3rBL4qJQvu6Nd7UH5Jf39yWaM/WTRsKbT4YVx2h7GbMQAJjZ9CW9Hdy4P0Hr1We8wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVtW3fRT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVtW3fRT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA341F00893;
	Tue,  9 Jun 2026 19:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781032510;
	bh=epCGM7QeQpfyzrJ6cL5Mx6jhxQVOO07hknEgobSoatw=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=oVtW3fRTVI7AROleILAHB6BfDtglmjFgKx9ESvsXY9GEUxjOlo9V/ox3BfnzfgUvE
	 drhqy8kHBZOWTrs6lJHfbKuyGg/jSCgN8YGOMXc5TA/QcJVyOXVLY87yUfYqpVngPj
	 PFEiCi3lY324np7t3+ADLVd6VT4eXSe6C+9eV73tCNLtLWth1MhPB3v8DCkcKE3e/R
	 aYAC357ZwTEl3EWPvdjPmA3PKaGpKa8XPk76kdqZDzJ9qJS0WZtSxLdx0TIbyewM9N
	 QBLjYRYKcc7L/xPgJPRcgw9Q8HsWtxQAUY9qijAtmzOQC1jVMArtr7fOTjpFuKWo70
	 AlJ3GQ9xNwtvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/11] arm64: dts: ti: k3-am62a-ti-ipc-firmware:
 Split r5f memory region
Reply-To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-9-16afba97fbe0@baylibre.com>
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-9-16afba97fbe0@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 19:15:09 +0000
Message-Id: <20260609191510.1DA341F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Missing `bootph-pre-ram` on split memory regions causes dangling p=
handles in SPL, loss of reserved memory protection, and SPL DT parsing fail=
ures.
- [High] Splitting the contiguous memory region imposes strict address tran=
slation boundaries that break backward compatibility with legacy firmware i=
mages and older bootloaders.

Pre-existing issues:
- [High] The function `k3_get_loaded_rsc_table` hardcodes the resource tabl=
e size to 256 bytes without checking the actual size of the corresponding m=
emory region (`rmem[0]`), leading to a potential out-of-bounds read and sub=
sequent out-of-bounds write.
--

commit b37808623c173089a1488283117154e8c2da6e07
Author: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
Subject: arm64: dts: ti: k3-am62a-ti-ipc-firmware: Split r5f memory region

This commit splits the existing firmware memory region into five separate,
more specific regions. It updates the memory-region array and names to
reflect these newly separated allocations.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/=
arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> index 682b1c9f3071d..fe10d3e75ceee 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> @@ -36,12 +36,36 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
>  		no-map;
>  	};
> =20
> -	wkup_r5fss0_core0_memory_region: memory@9c900000 {
> +	wkup_r5fss0_core0_ipc_region: memory@9c900000 {
>  		compatible =3D "shared-dma-pool";
> -		reg =3D <0x00 0x9c900000 0x00 0x01d00000>;
> +		reg =3D <0x00 0x9c900000 0x00 0x100000>;
> +		no-map;
> +	};

[Severity: High]
Since this newly created ipc region (and several others below) lacks the
bootph-pre-ram property that the original firmware region had, will SPL
fdtgrep strip these nodes from the SPL device tree?

If they are stripped, the parent node wkup_r5fss0_core0 will retain phandles
to missing nodes. Could this cause dangling phandle parsing failures in
U-Boot's remoteproc driver?

> +
> +	wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
> +		compatible =3D "shared-dma-pool";
> +		reg =3D <0x00 0x9ca00000 0x00 0x8000>;
> +		no-map;
> +	};
> +
> +	wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
> +		compatible =3D "shared-dma-pool";
> +		reg =3D <0x00 0x9ca08000 0x00 0x1000>;
>  		no-map;
>  		bootph-pre-ram;
>  	};
> +
> +	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
> +		compatible =3D "shared-dma-pool";
> +		reg =3D <0x00 0x9ca09000 0x00 0x97000>;
> +		no-map;
> +	};
> +
> +	wkup_r5fss0_core0_dm_region: memory@9caa0000 {
> +		compatible =3D "shared-dma-pool";
> +		reg =3D <0x00 0x9caa0000 0x00 0x1b60000>;
> +		no-map;
> +	};

[Severity: High]
Without bootph-pre-ram on wkup_r5fss0_core0_dm_region, SPL will lose the
no-map protection for this 27.3MB area. Does this mean the SPL lmb allocator
might treat this space as free DDR and allocate over it, potentially
corrupting active Device Manager firmware and causing a system hang?

>  };

[ ... ]

> @@ -78,8 +102,14 @@ &wkup_r5fss0 {
>  &wkup_r5fss0_core0 {
>  	mboxes =3D <&mailbox0_cluster0>, <&mbox_r5_0>;
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
Are there backwards compatibility risks with splitting the contiguous 29MB
firmware region into these individual smaller DMA pools?

If legacy bootloaders or legacy monolithic firmware images search for the
firmware string or expect index 1 to cover the full size, they will now
only find the 1MB ipc region.

Additionally, the Linux remoteproc driver strictly validates ELF segments
against individual region boundaries. If an older firmware image contains an
ELF PT_LOAD segment larger than 1MB or one that spans across these new hard
boundaries, might the kernel driver reject the translation and abort the
load?

[ ... ]

[Severity: High]
This is a pre-existing issue and was not introduced by the patch under
review, but I wanted to ask about how the remoteproc driver handles resource
tables regarding these memory regions.

In drivers/remoteproc/ti_k3_common.c:k3_get_loaded_rsc_table():

	*rsc_table_sz =3D 256;
	return (__force struct resource_table *)kproc->rmem[0].cpu_addr;

Since the size of the resource table is hardcoded to 256 bytes without
checking the actual size of the corresponding device tree memory region
(rmem[0]), is it possible for an out-of-bounds read and subsequent write to
occur?

Later, rproc_set_rsc_table() copies 256 bytes from this pointer, and during
shutdown rproc_reset_rsc_table_on_detach() copies 256 bytes back. If the
memory region specified in the device tree happens to be smaller than 256
bytes, could this cause memory corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-topic-am62=
a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com?part=3D9
