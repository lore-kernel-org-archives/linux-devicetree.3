Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A171F3E1718
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495613; cv=none; b=PnZhlxbZZL+G86rbwvShSmrJXDTXmKv1tHPLbRIVSPVCjC9jTVCn/DRiLJpo6dLcYZiML2MZBVPyHFIQJHTM3+T+a+Mjg55S7sowNCLg5RH5O9G4X3C2mTU8CS+ric+MCvcu8xKxZnULaYYDhrRT6jAO9okTMfnGX1Kw87xqxKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495613; c=relaxed/simple;
	bh=d7OUNN/08isuwVbtnnTvqlnziLdmjCZHlYdKdHcSsLM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UBhb7b6FUmGNg0p/B/YdzjwmmMiZUzznVw/EjkEw8lH2m0Pd2F+YD2PliLnjIgaPjOjMu+O7yOR/e1eVWVwqOcdeVHukqhGj1RGpOPWn8kjdBAj6k97S0tIkeieftgcPBIdgez412AA3YZc+UD7KlXkeLFIG3k8NpWBBaTZT1Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNN94lXs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNN94lXs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FBB1F000E9;
	Wed,  8 Jul 2026 07:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495605;
	bh=+il07BEAYSlKME11WhQCtS36fQBku6u8Ycs0h7Pd7Lk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iNN94lXs5vD1b+L7svuhXnspuzW9bjM9xoOPeD/CJGHCL56glq6hlyQXACspoZUNr
	 GSCY3IOjMp1Ne78RQzHkusib+jrxLQ2tmhxV+OhRokucvsJFd1vZU2zETD7nn6sjPR
	 WvVK4Ls9byacBmtSOP1XacRsrFQSFIBqcfag+2r2V3mfS1WunMAECsrvLcfBIJH8sy
	 fwN7hBy5SmhgzckH0+PaOsHo2avZa4HdeNApfn1ru3/Et/h6+J+lFPscS8ZMyo1j5P
	 9eoNkdy5jHJpsVlPf704B5m/AlplECd4wVLpVMUrqffcNHYrpNI385fmqe67xIw16e
	 wmAlOub8bV5/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 23/26] soc: qcom: Add minidump backend driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-meminspect-v3-v3-23-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-23-7aa5a0a74d5c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:26:44 +0000
Message-Id: <20260708072644.C8FBB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Out-of-bounds memory access due to negative error code stored in `=
unsigned int`.
- [High] Missing bounds check and TOCTOU vulnerability on untrusted SMEM in=
put.
- [High] Buffer overflow due to insufficient size check for SMEM item.
- [High] Dangling physical pointer in persistent shared memory upon driver =
unload.
- [Medium] Endianness mismatch on `seq_num` field.
- [Medium] Missing memory barrier when publishing minidump regions.
--

--- Patch [23]: [PATCH v3 23/26] soc: qcom: Add minidump backend driver ---
commit d86b0d20fa14b573f8275a326c648b5d20d6e0aa
Author: Eugen Hristev <ehristev@kernel.org>

soc: qcom: Add minidump backend driver
   =20
Qualcomm Minidump is a backend driver that manages the minidump shared
memory table on Qualcomm platforms. It uses the meminspect table that
it parses in order to obtain inspection entries from the kernel and
convert them into regions. Regions are afterwards being registered into
the shared memory's Minidump table of contents. Further, Qualcomm boot
firmware can read the table of contents and dump the memory accordingly,
as per the firmware requirements.

> diff --git a/drivers/soc/qcom/minidump.c b/drivers/soc/qcom/minidump.c
> new file mode 100644
> index 0000000000000..78d199b7c552a
> --- /dev/null
> +++ b/drivers/soc/qcom/minidump.c

[ ... ]

> +static int qcom_md_get_region_index(struct minidump *md, int id)
> +{
> +	unsigned int count =3D le32_to_cpu(md->toc->region_count);
> +	unsigned int i;
> +
> +	for (i =3D 0; i < count; i++)
> +		if (md->regions[i].seq_num =3D=3D id)

[Severity: Medium]
Will this comparison break on big-endian hardware?

The struct member md->regions[i].seq_num is an __le32 field, but it is
directly compared to an int here without any endianness conversion.

> +			return i;
> +
> +	return -ENOENT;
> +}

[ ... ]

> +static void __maybe_unused register_md_region(void *priv,
> +					      const struct inspect_entry *e)
> +{
> +	unsigned int num_region, region_cnt;
> +	const char *name =3D "unknown";
> +	struct minidump_region *mdr;
> +	struct minidump *md =3D priv;

[ ... ]

> +	/* Check if there is a room for a new entry */
> +	num_region =3D le32_to_cpu(md->toc->region_count);
> +	if (num_region >=3D MAX_NUM_REGIONS) {
> +		dev_dbg(md->dev, "maximum region limit %u reached\n",
> +			num_region);
> +		return;
> +	}
> +
> +	region_cnt =3D le32_to_cpu(md->toc->region_count);

[Severity: High]
Does this code contain a time-of-check to time-of-use (TOCTOU) race?

The region_count field is read from shared memory (md->toc->region_count),
checked against MAX_NUM_REGIONS, and then read again to index the
md->regions array. A compromised coprocessor could modify the count between
these two reads, bypassing the check and causing kernel memory corruption.

> +	mdr =3D &md->regions[region_cnt];
> +	scnprintf(mdr->name, MAX_REGION_NAME_LENGTH, "K%.8s", name);
> +	mdr->seq_num =3D e->id;

[Severity: Medium]
Should e->id be converted to little-endian here?

A native-endian integer (e->id) is directly assigned to the __le32 field
mdr->seq_num without using cpu_to_le32().

> +	if (e->pa)
> +		mdr->address =3D cpu_to_le64(e->pa);
> +	else if (e->va)
> +		mdr->address =3D cpu_to_le64(__pa(e->va));
> +	mdr->size =3D cpu_to_le64(ALIGN(e->size, 4));
> +	mdr->valid =3D cpu_to_le32(MINIDUMP_REGION_VALID);
> +	region_cnt++;
> +	md->toc->region_count =3D cpu_to_le32(region_cnt);

[Severity: Medium]
Is a memory barrier needed before updating md->toc->region_count?

The md->regions array in normal memory is updated, followed directly by an
update to md->toc->region_count in SMEM. Without a memory barrier (wmb()),
the CPU or compiler could reorder the writes, exposing the updated count to
firmware before the region data is fully visible. If a kernel panic occurs =
in
this window, the firmware will read invalid regions.

> +
> +	dev_dbg(md->dev, "%s:%d region registered %llx:%llx\n",
> +		mdr->name, mdr->seq_num, mdr->address, mdr->size);
> +}

[ ... ]

> +static void __maybe_unused unregister_md_region(void *priv,
> +						const struct inspect_entry *e)
> +{
> +	struct minidump_region *mdr;
> +	struct minidump *md =3D priv;
> +	unsigned int region_cnt;
> +	unsigned int idx;
> +
> +	idx =3D qcom_md_get_region_index(md, e->id);
> +	if (idx < 0) {

[Severity: High]
Will this error check always fail?

When unregistering a region that doesn't exist, qcom_md_get_region_index()
returns -ENOENT. Because idx is declared as an unsigned int, -ENOENT is
cast to a large positive value. The error check `if (idx < 0)` will fail,
allowing execution to proceed with an invalid index.

> +		dev_dbg(md->dev, "%d region is not present\n", e->id);
> +		return;
> +	}
> +
> +	mdr =3D &md->regions[0];
> +	region_cnt =3D le32_to_cpu(md->toc->region_count);

[Severity: High]
Can an untrusted coprocessor cause an out-of-bounds read or write here?

The untrusted region_count from shared memory is read and used unconditiona=
lly
without any bounds checking.

> +
> +	/*
> +	 * Left shift one position all the regions located after the
> +	 * region being removed, in order to fill the gap.
> +	 * Then, zero out the last region at the end.
> +	 */
> +	memmove(&mdr[idx], &mdr[idx + 1], (region_cnt - idx - 1) * sizeof(*mdr)=
);

[Severity: High]
Could this memmove cause out-of-bounds memory corruption?

If idx is a large positive value resulting from -ENOENT, or if
region_cnt is manipulated by a compromised coprocessor, this memmove will
use those invalid values in its size and address calculations.

> +	memset(&mdr[region_cnt - 1], 0, sizeof(*mdr));
> +	region_cnt--;
> +	md->toc->region_count =3D cpu_to_le32(region_cnt);
> +}

[ ... ]

> +static int qcom_md_probe(struct platform_device *pdev)
> +{
> +	struct minidump_global_toc *mdgtoc;
> +	struct device *dev =3D &pdev->dev;
> +	struct minidump *md;
> +	size_t size;
> +	int ret;

[ ... ]

> +	mdgtoc =3D qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, &siz=
e);
> +	if (IS_ERR(mdgtoc)) {
> +		ret =3D PTR_ERR(mdgtoc);
> +		return dev_err_probe(dev, ret, "Couldn't find minidump smem item\n");
> +	}
> +
> +	if (size < sizeof(*mdgtoc) || !mdgtoc->status)
> +		return dev_err_probe(dev, -EINVAL, "minidump table not ready\n");
> +
> +	ret =3D qcom_md_table_init(md, &mdgtoc->subsystems[MINIDUMP_SUBSYSTEM_A=
PSS]);

[Severity: High]
Does this size check properly account for the flexible array member?

struct minidump_global_toc ends with a flexible array member subsystems[].
The size check only accounts for the 12-byte header, but the code immediate=
ly
accesses and modifies mdgtoc->subsystems[0]. If the SMEM item is smaller th=
an
the header plus one subsystem element, this results in an out-of-bounds wri=
te
into adjacent shared memory.

> +	if (ret)
> +		return dev_err_probe(dev, ret, "Could not initialize table\n");
> +
> +	meminspect_notifier_register(&md->nb);
> +	meminspect_lock_traverse(md, register_md_region);
> +
> +	return 0;
> +}
> +
> +static void qcom_md_remove(struct platform_device *pdev)
> +{
> +	struct minidump *md =3D platform_get_drvdata(pdev);
> +
> +	meminspect_notifier_unregister(&md->nb);
> +	meminspect_lock_traverse(md, unregister_md_region);
> +}

[Severity: High]
Does this leave a dangling physical pointer in persistent shared memory?

md->regions is allocated via devm_kcalloc(), and its physical address is
written to the persistent SMEM table (md->toc->regions_baseptr) while enabl=
ing
the subsystem. When the driver is unloaded, the devres-managed memory is fr=
eed,
but this remove() function fails to disable the minidump subsystem or clear
the pointer. If a crash occurs post-unload, the firmware will attempt to pa=
rse
freed memory, leading to incorrect minidumps or firmware crashes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-meminspect=
-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com?part=3D23
