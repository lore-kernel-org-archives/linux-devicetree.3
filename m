Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2D437DAAE
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113576; cv=none; b=tjsfsXKYXao2zi4pAEBkbP8ASSJ16nrr7+t4gtGba10vMA40VS0yxZspCXV5cvr13BmPbS69YfGTzoGDQW6d3Zo2zI1jsKUe6BTg3nFLR96DIX/QVbTiNf77rV0ThKfpEDf7CxQc4NRHNA1jgddppjgRc+3pyS8ujLHNAULUF9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113576; c=relaxed/simple;
	bh=1WtSjVLZ5cQ9oZ3PJ2xxcSSFPGzU/wLt8CFw35K1i48=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J8Bh3hnTDtpG/z3ctzwegtOKUt1LacJHiRr42llPnM+P6DKOXhK4Q0tBr26c2mIU4qXJ2uqC3iaGSJ3UykR9UmGB5dDUUvNK/dW8fiztdRzgisej/DibJL9YCvoXeZEWrig3iihCZrKtjZxKGBL42HKPdzjDQQ5StFxs1Tp9omg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Af4BAxPq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Af4BAxPq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5731F00A3A;
	Fri,  7 Aug 2026 14:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786113566;
	bh=XLWTVPsDzqmeFYZeZB/i0MLuLyjwHXU4F4Lt1lTYZkY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Af4BAxPqb6utamugcY7WGNP/0YGw73CD1JjA6wLpFZiprwAOkXAIdFmnDMMceedUN
	 hV4cVy7S/DKoj1se+r94EkYOdOdFSzc3P5lhwafXDT/QJ2WkFfBUS19XRxLAPORGnb
	 PTvHw2iioX74S4hhAVkmo/9P9YLrSPCE/smXyfJD04xehNppxsq3S/Ynrox9bWn5Wo
	 n0v9b+fvwBLr9u/hru8zy5OKJbQFapS079595ukqfsiudnnU6bSE4TxHjSW0bZFQjT
	 1q8lJ1AgA9MVvYzcV+uVmBd+VZQw+Fu9TKSCRXzX6wMEY7Y99FNmlTWqerPTKLCmPA
	 5wydRulWoMXzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 05/10] block: partitions: of: Attach partition
 fwnode to the block device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806-block-as-nvmem-v10-5-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
 <20260806-block-as-nvmem-v10-5-be598b2a5606@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 14:39:25 +0000
Message-Id: <20260807143926.0C5731F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] In `validate_of_partition` and `add_of_partition`, if the 'reg' pr=
operty is not found, `of_get_property` returns `NULL` and leaves `len` unin=
itialized. This uninitialized `len` is then used in a length check, which m=
ay coincidentally pass, leading to a NULL pointer dereference.
--

--- Patch [5]: [PATCH v10 05/10] block: partitions: of: Attach partition fw=
node to the block device ---
commit 84a9bb090d9a515321ec327f495f887813824601
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

block: partitions: of: Attach partition fwnode to the block device

This patch carries the partition's device tree node through the OF parser
and attaches it to the block device. This mirrors the whole-disk case and
allows consumers to look up per-partition properties in the device tree.

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

[Severity: High]
This is a pre-existing issue, but can this code path trigger a NULL
pointer dereference if the "reg" property is missing in the device tree?

Looking earlier in add_of_partition(), it calls of_get_property() for the
"reg" property:

	const __be32 *reg =3D of_get_property(np, "reg", &len);
	int a_cells =3D of_n_addr_cells(np);
	int s_cells =3D of_n_size_cells(np);

	/* Convert bytes to sector size */
	u64 offset =3D of_read_number(reg, a_cells) / SECTOR_SIZE;

If the "reg" property is not found, of_get_property() returns NULL and
leaves the len variable uninitialized.

The same pattern exists in validate_of_partition(). If the uninitialized
len variable happens to match the expected length, validate_of_partition()
could bypass its check, leading to of_read_number() unconditionally
dereferencing a NULL reg pointer.

Should there be an explicit check for reg !=3D NULL before attempting to
read the offset?

>  	seq_buf_printf(&state->pp_buf, "(%s)", info->volname);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-block-as-n=
vmem-v10-0-be598b2a5606@oss.qualcomm.com?part=3D5
