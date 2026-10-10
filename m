Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107863CCA12
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791622137; cv=none; b=NnGSwk5jjFlrDEdgS/VMMjg6QCukhU6KX32Hz7A9J4IVXLH+ZHvo+G/6CMT5ShCSUS1vFrSpgI4neawGAzyFv/gKisivsUPdAA0W08WlQAt5jMi13cTOFLWbZLbOjmN9ZtHkTRlR8kPlUTe2RlAc6ko52amJgp0T6fs3OUYMp10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791622137; c=relaxed/simple;
	bh=7rvBLb7fkmzkMbmpqHXSyTRmyyjqOXzyOAalier4Wsc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UrBA9TQ6wqD+sra8y9LCrlqV0vZCBcNbrHavU5cndDX616Qy5Z10/FGywk//MX0iRfqe18QpKtQA+rmi4qXIbv69jgjBd8L6nrShRGikSRORo18DCC48Lm6p1pMCXkJ/cP8tkd10VgzWvtlIe5pSoe0dskyXsSeemTZw9P923sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpxo5mVi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpxo5mVi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6461F000FF;
	Sat, 10 Oct 2026 08:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791622130;
	bh=08JSpV8I0LJKAbBrcUUgvHm9B4euPPEQdRpPO9nBjLM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cpxo5mVi9GmfZXklYs4m/ttmxuXzr7SfaI/TdnRJ21xFpQn00GF5eMaZXYa+CQgOh
	 RjkKi5LKVHJPWSgIqXTnorSWsr7wR78+2skHBBgBgIFUsrf5kQ0lV8Gm3Cj/kpetN7
	 uGRGxNKdka+AiA7RSOKpG39JfU+CH2qqjBhFj5OgAktNV8YG7HrQQWO6Yq+Dl39dmZ
	 gP1vYrb/hU1AHIaRiyXq7t63Qj+49DxJ8EO0Uq1QdElqI71EC6Oh8qGF7quNWfoiEl
	 MG28sT/5nwuYVgUkbgAVNDbmrGUpNgxwth7QLe8kE1zs46BcyPnJY0I/swzeXdJXYM
	 4zsi71aUbwzHQ==
Message-ID: <sashiko-outbox-166375@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 06/14] media: mediatek: vcodec: add debug information
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <3ed92245e07d585d938b7fcbd8d49aba7d4202ac.1791619743.git.kyrie.wu@mediatek.com>
References: <cover.1791619742.git.kyrie.wu@mediatek.com>
 <3ed92245e07d585d938b7fcbd8d49aba7d4202ac.1791619743.git.kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 08:48:49 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: mediatek: vcodec: UAF due to lock mismatch in debugfs itera=
tion
--

commit 3dd0220ecce9f2ca273e1906b8312cd6795ec662
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: add debug information

This commit adds debug information for HEVC/AV1 output formats and 10-bit
capture formats. It updates the debugfs read function to include 10-bit
bitstream information.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbg=
fs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> index 2da11521fc7b9..a9e52a32079d3 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> @@ -122,9 +138,10 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp=
, char __user *ubuf,
> =20
>  		if (dbgfs_index[MTK_VDEC_DBGFS_PICINFO]) {
>  			curr_len =3D snprintf(buf + used_len, total_len - used_len,
> -					    "\treal(%dx%d)=3D>align(%dx%d)\n",
> +					    "\treal(%dx%d)=3D>align(%dx%d) 10bit(%d)\n",
>  					    ctx->picinfo.pic_w, ctx->picinfo.pic_h,
> -					    ctx->picinfo.buf_w, ctx->picinfo.buf_h);
> +					    ctx->picinfo.buf_w, ctx->picinfo.buf_h,
> +					    ctx->is_10bit_bitstream);

[Severity: High]
Can a concurrent release of the video device cause a use-after-free when=20
accessing ctx in this debugfs read path?

In mtk_vdec_dbgfs_read(), the iteration over dbgfs_head is protected by=20
dbgfs->dbgfs_lock. However, a concurrent device release calling=20
mtk_vcodec_dbgfs_remove() removes and frees dbgfs_inst without acquiring=20
dbgfs_lock:

drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c:mtk_vcodec=
_dbgfs_remove() {
    list_for_each_entry(dbgfs_inst, &vcodec_dev->dbgfs.dbgfs_head, node) {
        if (dbgfs_inst->inst_id =3D=3D ctx_id) {
            ...
            list_del(&dbgfs_inst->node);
            kfree(dbgfs_inst);
            return;
        }
    }
}

Because mtk_vcodec_dbgfs_remove() does not take dbgfs_lock,=20
mtk_vdec_dbgfs_read() can dereference a freed dbgfs_inst and a freed ctx=20
when a user reads the debugfs file at the same time the device is closed.

Should the list removal in mtk_vcodec_dbgfs_remove() be protected by=20
dbgfs_lock?

>  			used_len +=3D curr_len;
>  		}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791619742.gi=
t.kyrie.wu@mediatek.com?part=3D6
