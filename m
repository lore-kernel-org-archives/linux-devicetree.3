Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8F8351C22
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160805; cv=none; b=lwqMxZXjeulZSGlEaWYJ2ORqt2o2w45IajgR5yNKroSflZOvueNggEObluDi3o1wP4P+EGpCg8liNqMsuUgxw/kBH7tTb1e8CMXXHLhNxbSRw0rpMEAKc935k1kAw62PO4x0mbQGPpQH5ir1ngygP5iqPVBHb9u/uIPttDyxsM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160805; c=relaxed/simple;
	bh=J0twPvsyVZjkmPu4vsnXduvpIe+bow+xApt48Bq44mM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gotVk1cEINikGB5cbUUwcZFozqFz6e1h51k3G/L6BI7AE48kxm9kYohIIf/QXc/GlxU2D2VQdvZWaarRbOcaL1v7nXkm6ROZTzDca+1vWNRVoDvPNTEYzACTeC/IR/dnYGBLcRsm/Lptdk7K4gyhW6GyLKDNJa5IykW6wo0tRXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUq1PiN3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUq1PiN3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688811F000C4;
	Fri, 16 Oct 2026 14:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792160803;
	bh=TJlKLGHky//wXU/v6HdCsvRXyMjCcZWblSsvEeXbzpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cUq1PiN3XXjvWVFP6ODtrSPPI0s4LNbrWlNrHAvdmSsaj5OK6L6AYo2f2YeAQk/K6
	 IL5+LlHPUGetfIzR6SMlRuiAxHvm3wDq4WQ46PQd8XWWDdpx7YBN2A13BQcoX2QtNh
	 hoOe50EKZG7cEU5XjRf5bb+pnxnfQyWBN0Qtd2OXaVK+I1j7Iqg4mMrM/uQcDMbM6D
	 z2+/LzeHDEfLMFW4dEzifF0M65aO+mXJxkWm2n7WQaVOzVSc93i6oNY8KR7Auwd5Cp
	 Y4RzhP8CRMH2m08C7mi3oSU+rH4KpQ8hy0m3gACg3P1BhP06J+tZ5hPnC2g9lT2B4O
	 L7WcSs9fUkcZg==
Message-ID: <sashiko-outbox-174444@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/7] block: partitions: of: Attach partition fwnode
 to the block device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-block-as-nvmem-v11-2-f890ac74f87d@oss.qualcomm.com>
References: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
 <20261015-block-as-nvmem-v11-2-f890ac74f87d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 14:26:42 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] block: of_partition() TOCTOU race causing NULL pointer deref
- [Medium] block: partition extended minor leaked on add_partition error pa=
th
--

commit e902a5c054498da051a2c4910bad99091bf76ae8
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

block: partitions: of: Attach partition fwnode to the block device

The OF partition parser reads offset, size and label from each
"fixed-partitions" child node but does not associate that node with the
resulting partition block device. As a result a partition has no
of_node, unlike the whole-disk device which gets its firmware node via
add_disk_fwnode(). This commit carries the partition's device tree node
through the parser and attaches it to the partition's block device.

> diff --git a/block/partitions/core.c b/block/partitions/core.c
> index b5c59b79ca7cb..eee954df1ac6e 100644
> --- a/block/partitions/core.c
> +++ b/block/partitions/core.c

[ ... ]

> @@ -343,6 +356,7 @@ static struct block_device *add_partition(struct gend=
isk *disk, int partno,
>  	pdev->class =3D &block_class;
>  	pdev->type =3D &part_type;
>  	pdev->parent =3D ddev;
> +	device_set_node(pdev, fwnode_handle_get(fwnode));
> =20
>  	/* in consecutive minor range? */
>  	if (bdev_partno(bdev) < disk->minors) {

[Severity: Medium]
In add_partition(), if the partition number exceeds disk->minors,
blk_alloc_ext_minor() allocates an extended minor IDR entry.

If an error occurs after this allocation but before bdev_add() (such as
kmemdup() or device_add() failing), the error path calls put_device(pdev).
This triggers the following call chain:

put_device() -> part_release() -> bdev_drop() -> iput() -> bdev_free_inode()

bdev_free_inode() checks MAJOR(bdev->bd_dev) =3D=3D BLOCK_EXT_MAJOR to free=
 the
minor. Because bdev->bd_dev is not assigned until bdev_add() later in the
function, does this permanently leak the IDR entry for the extended minor on
failure?

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
In of_partition(), child nodes are parsed using two separate loops. The
first loop calls validate_of_partition(), which ensures the "reg" property
exists. The second loop then passes nodes to add_of_partition().

If a Device Tree overlay asynchronously inserts a new child node without a
"reg" property between the validation loop and the processing loop, does
this new node skip validation?

If this unvalidated node is passed to add_of_partition():

block/partitions/of.c:add_of_partition() {
	...
	const __be32 *reg =3D of_get_property(np, "reg", &len);
	int a_cells =3D of_n_addr_cells(np);
	int s_cells =3D of_n_size_cells(np);

	/* Convert bytes to sector size */
	u64 offset =3D of_read_number(reg, a_cells) / SECTOR_SIZE;
	...
}

Will this result in a NULL pointer dereference in of_read_number() when it
attempts to access the NULL reg pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-block-as-n=
vmem-v11-0-f890ac74f87d@oss.qualcomm.com?part=3D2
