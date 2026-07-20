Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D5A14EC73
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784511098; cv=none; b=CZhGar/n0hYlG7FaebLDkClqjgHotdqGx3s+iZvRRA4QMu9PIy/04kaPTynmjiKeO78mreK0ZgPK1taPUl6cbeGCJ5fnDpjK9l89+8vAoxpHa7lyy9bZjuDbu2n+Cce9RKB8Kv3gfSIPWke7+2uQWjJnV8LJhWqvm2N4W7TYK/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784511098; c=relaxed/simple;
	bh=opnF1ADF4T4bJoYikH0ns8jkAWmsmADiWpM2GfWuhK8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VH+KrsUgezM1XUfokt0vqgjbk1EfyHMsJKgwSxBneHHJfnDHJF+VP6j4PIln0QrsTkkWLAuuJXmbdhDypPXvOEtTakjc1UtoyzBd93bvC3J4+jHIitFA0PtWjKEpV4DN3hVkE8rTWk3/kfbl5vVm3QCCvUTgr3ksfya3Hmo6ung=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bA/LU4d8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bA/LU4d8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345FA1F000E9;
	Mon, 20 Jul 2026 01:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784511096;
	bh=BveCx6NW07CmlLaqkJ+P3/xHnhmZ2StOh6TKLMe8b10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bA/LU4d8+5o2MQFF5xYa07Nvq/OkDLTS16NgXGcs6ETcwxvKOLqi64cBbgFiygv4q
	 CPukxVFNFxF4wlI9Z2MMt9VQn4H+x84woOxIcbW7q6bhYTr7qMnjCmAcmWABGdLeo1
	 Yd6iIyt9jUiN9gAVMNGj/8tB7vygHMR/qYrhIPs5Wl7nF4+iHWZlzGuhecrU7nP00p
	 SHCIw3dPcHp54MWgSFn4lr1I4pRWFhICBuOsStnPFZBvKvr707fvU2lJq1ieXjEwJ5
	 ijFKjAlN+s+xOzKAdj8W4ZRNdF171xgs42IDw5QAhc50gfg3hf7bHScrx5FfYeaWKx
	 LtDQavC4AML8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/14] media: mediatek: vcodec: add debug information
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260720012056.1026551-7-kyrie.wu@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
 <20260720012056.1026551-7-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 01:31:35 +0000
Message-Id: <20260720013136.345FA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Lack of adequate locking on the `dbgfs_head` instance list all=
ows concurrent list modifications, leading to Use-After-Free and list corru=
ption.
- [High] Misuse of `snprintf` return values combined with a TOCTOU race on =
`inst_count` leads to an out-of-bounds read and WARN_ON_ONCE.
--

--- Patch [6]: [PATCH v6 06/14] media: mediatek: vcodec: add debug informat=
ion ---
commit 339b2440735f521e0732ed61e123f2dc8ea944d3
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: add debug information

This commit adds hevc and av1 output format printing to the debugfs
output. It also introduces 10-bit capture format and bitstream
information to the debug output.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbg=
fs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> index 2da11521fc7b9..a9e52a32079d3 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c

[ ... ]

> @@ -122,9 +138,10 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp=
, char __user *ubuf,

[Severity: Critical]
This is a pre-existing issue, but does the iteration surrounding this code
adequately protect against concurrent list modifications?

In mtk_vdec_dbgfs_read(), the list is traversed under dbgfs_lock:

mutex_lock(&dbgfs->dbgfs_lock);
list_for_each_entry(dbgfs_inst, &dbgfs->dbgfs_head, node) {

However, if a user process rapidly opens and closes the V4L2 device,
mtk_vcodec_dbgfs_remove() unlinks and frees the list element locklessly with
respect to the debugfs read lock:

mtk_vcodec_dbgfs_remove()
    list_del(&dbgfs_inst->node);
    kfree(dbgfs_inst);

Since the two paths acquire different locks, they can execute concurrently.
Can this lead to a use-after-free or list corruption when the reader hits a
freed node or poisoned list pointers?

> =20
>  		if (dbgfs_index[MTK_VDEC_DBGFS_PICINFO]) {
>  			curr_len =3D snprintf(buf + used_len, total_len - used_len,
> -					    "\treal(%dx%d)=3D>align(%dx%d)\n",
> +					    "\treal(%dx%d)=3D>align(%dx%d) 10bit(%d)\n",
>  					    ctx->picinfo.pic_w, ctx->picinfo.pic_h,
> -					    ctx->picinfo.buf_w, ctx->picinfo.buf_h);
> +					    ctx->picinfo.buf_w, ctx->picinfo.buf_h,
> +					    ctx->is_10bit_bitstream);
>  			used_len +=3D curr_len;

[Severity: High]
This is a pre-existing issue, but could this accumulation of used_len result
in an out-of-bounds read and a kernel warning?

The total_len is calculated earlier based on a lockless read of inst_count:

mtk_vdec_dbgfs_read()
    int total_len =3D 200 * (dbgfs->inst_count =3D=3D 0 ? 1 : dbgfs->inst_c=
ount);

If concurrent device opens increase the number of instances after this buff=
er
is allocated, used_len can exceed total_len.

When total_len - used_len becomes negative, snprintf receives a massive size
parameter. While vsnprintf catches sizes greater than INT_MAX and prevents a
heap overflow, it issues a WARN_ON_ONCE.

Furthermore, snprintf returns the length it would have written, which is
added to used_len. Later, simple_read_from_buffer() will use this inflated
used_len to read past the end of the heap allocation into userspace.

>  		}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720012056.1026=
551-1-kyrie.wu@mediatek.com?part=3D6
