Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AD543847E
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513683; cv=none; b=ht5k+tH7Jbu0V5vaUFIfL0Yxe27ygPVmUbApVQmqOMtytB1KYuIC6eAnlloj255VBQ2fr5SPU/h+KpAWr/e6KtYDyLxCXh/rC9Iqrkfn2PDFcy5u8xW76XSZ35eRLHTk6h5y8VnBIeMCeV+K2CRJ+vyJvaQZU21DLfcAQe4DZrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513683; c=relaxed/simple;
	bh=SraSMbmqC1SiSy7El4IChDq4FyPpv42h3IzcNDznbJo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pdjlAwk5HEKC1i2qR9j/ie4X7/5knWU1YTGxTQDxvTsr+ycPwEo4iUSdkrMiD+Prxo+M9l4ozZC0q5SV2yQN4294UebOVcf0iMOwDi5N0PaeIeFPum11YuCs0J0Yo/E4shJOrPtqlZJ02fZ0DsAGX9nsEF7ABSSnaC0aOzNZwG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IUqkPDQi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IUqkPDQi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4DC1F00ACA;
	Fri, 31 Jul 2026 16:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785513681;
	bh=CmY5dkVC+4cxsjgSXDwDx9Ah4cPPuSdVxSVxipYtWR4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IUqkPDQi9uKSwtSO8Oq4S2oUEAzyfDaQknzZMiknqz88uWVRElKq5dCp8Lr+vx7st
	 zl606nBCuenmLzAe/0h2pzNPFbPzEO4Ao328OSvzZZZQRju9atj+TV/JYP3VzkfLWY
	 VuPqmrLM0wi64VXEqF2Jb78l+Wju3uKiMUdbAwnuxW1plx22MzXJagjfeASmtWMr/C
	 l/rJ6w7Bh/y+5qCpP6f+IclAGL68Eno3TABKcb3wDzOwqKD/KiZAoet6/tKp8QCrUj
	 Acbttp+5TLI0zSLLl07bMVzAzIzHcp0v8H0w1gIKYBIuszNH6qYxQr/Hucu1DZ1dlL
	 xzFuG6Kj8YsQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 05/10] block: partitions: of: Attach partition fwnode
 to the block device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260730-block-as-nvmem-v9-5-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
 <20260730-block-as-nvmem-v9-5-f72935817dbf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 16:01:21 +0000
Message-Id: <20260731160121.9E4DC1F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Fwnode reference leak in partition parsing error and skip paths.

Pre-existing issues:
- [High] Uninitialized stack variable `len` validation allows NULL pointer =
dereference when the 'reg' property is missing.
--

--- Patch [5]: [PATCH v9 05/10] block: partitions: of: Attach partition fwn=
ode to the block device ---
commit a6e4cc997f016ffdca55d082b2ff10454aec24f8
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

block: partitions: of: Attach partition fwnode to the block device
   =20
The OF partition parser reads offset, size and label from each
"fixed-partitions" child node but does not associate that node with the
resulting partition block device. As a result a partition has no
of_node, unlike the whole-disk device which gets its firmware node via
add_disk_fwnode().

> diff --git a/block/partitions/of.c b/block/partitions/of.c
> index 53664ea06b654..4fc7c80c407de 100644
> --- a/block/partitions/of.c
> +++ b/block/partitions/of.c

[ ... ]

> @@ -62,6 +63,8 @@ static void add_of_partition(struct parsed_partitions *=
state, int slot,
>  		partname =3D of_get_property(np, "name", &len);
>  	strscpy(info->volname, partname, sizeof(info->volname));
> =20
> +	state->parts[slot].fwnode =3D fwnode_handle_get(of_fwnode_handle(np));
> +
>  	seq_buf_printf(&state->pp_buf, "(%s)", info->volname);
>  }

[Severity: High]
Does this create a fwnode reference leak if the partitions are never
successfully added?

If blk_add_partitions() aborts early (such as for zoned block devices) or
skips a partition, it jumps to out_free_state and calls free_partitions().
This frees the parsed partitions array without dropping the unconsumed
fwnode references.

Also, if add_partition() fails before calling device_initialize():

block/partitions/core.c:add_partition() {
    ...
    err =3D -ENOMEM;
    bdev =3D bdev_alloc(disk, partno);
    if (!bdev)
        goto out_put_disk;
    ...
}

will it return an error without dropping the fwnode, since part_release()
will never be executed to clean it up?

[Severity: High]
This is a pre-existing issue, but can the uninitialized len variable cause a
NULL pointer dereference when parsing malformed device trees?

Looking at validate_of_partition() in the same file:

block/partitions/of.c:validate_of_partition() {
    int len;
    const __be32 *reg =3D of_get_property(np, "reg", &len);
    ...
}

If the 'reg' property is missing, of_get_property() returns NULL and leaves
the stack variable len uninitialized. If the uninitialized stack garbage in
len happens to satisfy the subsequent length check:

    if (len / sizeof(*reg) !=3D a_cells + s_cells)

it will proceed to evaluate:

    offset =3D of_read_number(reg, a_cells);

Since reg is NULL, will this result in a kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-block-as-n=
vmem-v9-0-f72935817dbf@oss.qualcomm.com?part=3D5
