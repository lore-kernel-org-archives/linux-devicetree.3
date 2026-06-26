Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A273F7AAB
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 14:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782483054; cv=none; b=bxjtFsF+a4ylnr9NePbE4ZC2XG+2OifjVTk8gPYnWbbAZ0fKNGv7/errJeYvqcB3oGmn1OD8ZcrrnGINE+tiB3gdNThkzaSQ5PNI4yMQjYjRwplC0lmZ62vw3QtSWbCKTuhGvOONfJga35eaeP2E4t0at3nqxDkJpF245stBdrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782483054; c=relaxed/simple;
	bh=e6SQjG3Ppqpecfa/cOeXD909QWHkXDSaWAn/AgM0B6c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OefIG2PfwyP4toiFsV7MZ9BuszJ0+zCICLpniIqzbn9sA/p+Bg+L2RDRG6GWydkKz13RGN5MAWixUPbkWtU/DxXt5yr5qZ1kpQG5wlrio6YRuMmfXsWPb13CgKdoZVHTVLkIN886nhPxLZPRBtas3dl9UeNIVGScwRbxVvqHczk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCT/mSTm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCT/mSTm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D366B1F000E9;
	Fri, 26 Jun 2026 14:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782483051;
	bh=SdrXOSLcBxchPmHF1Y8g5RUEBjhwhc1rUWMBshrC9oQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YCT/mSTmQJutHIEFBq+JEq0wEnoZEPgAK7lhMDF9j2YcgTShx8wB02+00WZ0cDbO7
	 VvYYH3+zK6tAvehFoWyvuO9jh+S3Hyfs3DP5r3p+OTa7k7gCLPEc0QJpP2Ys/ENVLi
	 G6GbnGL7ghDCxwXEFYQL/vZZn8MyP5lYaQQWxwNAVP8KlLh2xUyTVQf3ke0gt8Jdxw
	 0fq95MoRq+e4RCBQG69mEiqfklQ8HZ+VFWqRa0o0XYLOp6KQGnuaxT5zl4p4wbsKPS
	 //MoqIk2apUjBDnv6q57ljCQm7pmIW+YNMW/Kkyb6zhDHwoFCXm7llWoL1UOZ6hRZl
	 8G8oZRvI3sAzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] remoteproc: qcom: Add M0 BTSS secure PIL driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem via B4 Relay" <devnull+george.moussalem.outlook.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260625-ipq5018-bluetooth-v1-2-d999be0e04f7@outlook.com>
References: <20260625-ipq5018-bluetooth-v1-0-d999be0e04f7@outlook.com>
 <20260625-ipq5018-bluetooth-v1-2-d999be0e04f7@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 14:10:50 +0000
Message-Id: <20260626141050.D366B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Redundant request_firmware call leaks newly allocated firmware and=
 metadata on success path.
- [High] Direct return on kstrdup failure leaks previously acquired metadat=
a and firmware objects.
- [High] Heap buffer underflow and overflow when formatting split segment f=
ilenames with sprintf.
- [High] 32-bit integer overflow in ELF segment bounds validation allows ou=
t-of-bounds memory writes.
- [High] Missing size validation for split firmware segments leads to out-o=
f-bounds reads.
- [High] Out-of-bounds read due to unvalidated ELF headers and hardcoded pr=
ogram header offset.
- [High] Time-of-Check to Time-of-Use (TOCTOU) vulnerability due to parsing=
 ELF headers from a different firmware copy than the one authenticated.
- [Medium] Subsystem guide violation: Mixing goto-based error handling with=
 scope-based __free() cleanup.
- [Medium] Failure to zero-initialize the BSS section of ELF segments expos=
es stale memory to the peripheral.
- [Medium] Missing reset assertion on late probe failures and driver remova=
l leads to resource leaks and state mismatch.
--

commit a3d2212c4a13a5646a7fb048e4d391fc0784f11e
Author: George Moussalem <george.moussalem@outlook.com>
Subject: remoteproc: qcom: Add M0 BTSS secure PIL driver

This commit introduces a new Peripheral Image Loader driver for the M0
bluetooth subsystem found in the IPQ5018 SoC. The driver brings up the
M0 core by loading signed firmware, authenticating it via TrustZone,
and starting the peripheral using a Secure Channel Manager call.

> diff --git a/drivers/remoteproc/qcom_m0_btss_pil.c b/drivers/remoteproc/q=
com_m0_btss_pil.c
> new file mode 100644
> index 0000000000000..7168e270e4d46
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_m0_btss_pil.c

[ ... ]

> +static int m0_btss_load(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct m0_btss *desc =3D rproc->priv;
> +	const struct elf32_phdr *phdrs;
> +	const struct firmware *seg_fw;
> +	const struct elf32_phdr *phdr;
> +	const struct elf32_hdr *ehdr;
> +	void __iomem *metadata;
> +	size_t metadata_size;
> +	int i, ret;
> +
> +	ehdr =3D (const struct elf32_hdr *)fw->data;
> +	phdrs =3D (const struct elf32_phdr *)(ehdr + 1);

[Severity: High]
Does this code perform an out-of-bounds read if the firmware file is smaller
than the ELF header structure? The pointer is cast and dereferenced without
validating that the provided firmware is large enough.

[Severity: High]
Is there an issue with using a hardcoded offset to locate the program heade=
rs
instead of using the standard e_phoff field from the ELF header? If the file
uses a non-standard layout, it could parse arbitrary memory as program
headers.

> +
> +	ret =3D request_firmware(&fw, rproc->firmware, rproc->dev.parent);

[Severity: High]
Does this code introduce a time-of-check to time-of-use vulnerability? The
ehdr and phdrs pointers are established from the original fw parameter, but
then a new fw copy is requested and authenticated by TrustZone. If the file
changes between these reads, could malicious segment locations from the fir=
st
unauthenticated read be used to subvert the loading of the authenticated da=
ta?

[Severity: High]
Is this call to request_firmware() redundantly overwriting the local fw
parameter, preventing the original structure from being accessed?

> +	if (ret) {
> +		dev_err(rproc->dev.parent, "Failed to request firmware: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	metadata =3D qcom_mdt_read_metadata(fw, &metadata_size, rproc->firmware,
> +					  rproc->dev.parent);
> +	if (IS_ERR(metadata)) {
> +		ret =3D PTR_ERR(metadata);
> +		dev_err(rproc->dev.parent,
> +			"Failed to read firmware metadata: %d\n", ret);
> +		goto release_fw;
> +	}
> +
> +	ret =3D qcom_scm_pas_init_image(BTSS_PAS_ID, metadata,
> +				      metadata_size, NULL);
> +	if (ret) {
> +		dev_err(rproc->dev.parent, "PAS init image failed: %d\n", ret);
> +		goto free_metadata;
> +	}
> +
> +	for (i =3D 0; i < ehdr->e_phnum; i++) {
> +		char *seg_name __free(kfree) =3D kstrdup(rproc->firmware,
> +						       GFP_KERNEL);

[Severity: Medium]
Is it safe to mix goto-based error handling with scope-based cleanup helpers
like __free(kfree) in the same function? The kernel cleanup subsystem
guidelines indicate that functions should either use goto-based cleanup
exclusively, or scope-based cleanup exclusively, to prevent confusing
ownership semantics.

> +		if (!seg_name)
> +			return -ENOMEM;

[Severity: High]
Does returning directly here leak the metadata buffer and the locally
requested fw structure? It appears this direct return bypasses the
free_metadata and release_fw cleanup labels.

> +
> +		phdr =3D &phdrs[i];
> +
> +		/* Only process valid loadable data segments */
> +		if (phdr->p_type !=3D PT_LOAD || !phdr->p_memsz)
> +			continue;
> +
> +		if (phdr->p_vaddr + phdr->p_filesz > desc->mem_size) {

[Severity: High]
Can the addition of phdr->p_vaddr and phdr->p_filesz overflow? Since both
are read directly from the ELF header as 32-bit integers, a crafted firmware
could provide values that wrap around the 32-bit limit, passing the bounds
check against desc->mem_size and allowing out-of-bounds memory writes.

> +			dev_err(rproc->dev.parent,
> +				"Segment data exceeds the reserved memory area!\n");
> +			goto free_metadata;
> +		}
> +
> +		/* Check if firmware is split across multiple segment files */
> +		if (phdr->p_offset > fw->size ||
> +		    phdr->p_offset + phdr->p_filesz > fw->size) {
> +			sprintf(seg_name + strlen(seg_name) - 3, "b%02d", i);

[Severity: High]
Could this sprintf() call result in a heap buffer underflow or overflow?
If the provided firmware-name is fewer than 3 characters long, the pointer
arithmetic could underflow. Additionally, if the unvalidated ehdr->e_phnum
produces a large index, the formatted string could overflow the allocated
buffer.

> +			ret =3D request_firmware(&seg_fw, seg_name,
> +					       rproc->dev.parent);
> +			if (ret) {
> +				dev_err(rproc->dev.parent,
> +					"Could not find split segment binary: %s\n",
> +					seg_name);
> +				goto free_metadata;
> +			}
> +
> +			/*
> +			 * Use the virtual instead of the physical address as
> +			 * the offset
> +			 */
> +			memcpy_toio(desc->mem_region + phdr->p_vaddr,
> +				    seg_fw->data, phdr->p_filesz);

[Severity: High]
Does this memcpy_toio() read past the end of seg_fw->data? It uses
phdr->p_filesz from the main ELF header, but there doesn't seem to be a che=
ck
ensuring that the loaded seg_fw->size is actually at least that large.

> +
> +			release_firmware(seg_fw);
> +		} else {
> +			memcpy_toio(desc->mem_region + phdr->p_vaddr,
> +				    fw->data + phdr->p_offset, phdr->p_filesz);

[Severity: Medium]
If an ELF segment's memory size (p_memsz) exceeds its file size (p_filesz),
does the remaining memory need to be zero-initialized for the BSS section?
The driver currently only copies p_filesz bytes, which might leave stale
kernel memory exposed to the peripheral.

> +		}
> +	}
> +
> +	return 0;

[Severity: High]
Does this success path leak the dynamically allocated metadata buffer and t=
he
firmware structure? The function returns directly without freeing them.

> +
> +free_metadata:
> +	kfree(metadata);
> +release_fw:
> +	release_firmware(fw);
> +	return ret;
> +}

[ ... ]

> +static int m0_btss_pil_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	desc->btss_reset =3D devm_reset_control_get(dev, "btss_reset");
> +	if (IS_ERR_OR_NULL(desc->btss_reset))
> +		return dev_err_probe(dev, PTR_ERR(desc->btss_reset),
> +				     "unable to acquire btss_reset\n");
> +
> +	ret =3D reset_control_deassert(desc->btss_reset);

[Severity: Medium]
Is a cleanup action needed to assert the reset if probe fails later or if t=
he
driver is unbound? The probe function deasserts desc->btss_reset but
doesn't seem to register a corresponding devm_add_action_or_reset() to hand=
le
teardown.

> +	if (ret)
> +		return dev_err_probe(rproc->dev.parent, ret,
> +				     "Failed to deassert reset\n");
> +
> +	rproc->auto_boot =3D false;
> +	ret =3D devm_rproc_add(dev, rproc);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, rproc);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-ipq5018-bl=
uetooth-v1-0-d999be0e04f7@outlook.com?part=3D2
