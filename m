Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D731F2744F
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784512136; cv=none; b=ulqLgIXKxLbdyAaWzyZcPxovrbQB+UAry+12UNiTPlnkVZOmZC18J6RUwnd4paREn5iXD/Hv79l+ZkgVk1dd6gdV/jGWoo6aSfFgctB0l4WzkNtp+LaKQArgLDuqcsVvN9uUSpxOSWrdXBK1+8LtmweSANTOYqtzulxFrq2PBKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784512136; c=relaxed/simple;
	bh=hx5BCJpRnIZ1Vad5KHuuYQ1vQAiTsSP+YFptgqPEQws=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VwDCV8dhZGh8kxzPKQyQsJXL9HCNhHfdHpOK9CHoyKqpkVGS/TqIDK9UBRiQB/fo7Py/E0UuoEsZkdOLStNTC4XD2X9Qw/l6M/qExCU2D1iqrvT3FQD/rOsF/YVwNRAHCJgLmmKPugPUN90oRxv9unrqlXM6TzEJ69HDTpJcbnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPWFchsl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPWFchsl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E44E1F000E9;
	Mon, 20 Jul 2026 01:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784512135;
	bh=GDeA/+x3NSEEzv0Zt53UH9D8KVPzj/xZSEVGmkQI5VQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MPWFchsljjYA+vRf/oVJwm/z4dUtJMxfl68wkqzIzvA3XknLQgm5+++LgE69SFjoB
	 GgFdbZoeu9dnSKr0J2kRnSZaMletI+GDZvM8c/JTtf6jLU/L7J8CrvXoEfKcZD/TMa
	 m5/EQZPxtsR16bV5rgrkiUu4yCNUzq4+r0KpIaqMYm/NvxVpOaxXUJkVwiNIxORyfm
	 APcVsot9+J4GEKS4XOptXxml9tOgakt4h94URzx2AV2F4BHmuK3NSXEZlEh5KgmlGB
	 avBntTlQ30TtgkaDbqAVfJnSfI+cUudlZjFy3TPCHL6Ou3/uK0sJGdzmzQjocYjxGH
	 RNny7SmfMHVBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 13/14] media: mediatek: decoder: fill av1 buffer size
 with picinfo
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260720012056.1026551-14-kyrie.wu@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
 <20260720012056.1026551-14-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 01:48:54 +0000
Message-Id: <20260720014855.2E44E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but this patch incom=
pletely fixes a subsystem-wide issue by fixing AV1 while leaving the exact =
same bug in the VP9 stateless decoder. The C plane offset for reference fra=
mes is incorrectly calculated during dynamic resolution changes.
--

--- Patch [13]: [PATCH v6 13/14] media: mediatek: decoder: fill av1 buffer =
size with picinfo ---
commit 6fb6f33cb9871d45e294575fbf5e9c61dfa39742
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: decoder: fill av1 buffer size with picinfo

The buffer size of y and c plane has been calculated in vcp/scp,
can fill each frame buffer size with picinfo directly.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c

[ ... ]

> @@ -1845,8 +1846,10 @@ static int vdec_av1_slice_setup_core_buffer(struct=
 vdec_av1_slice_instance *inst
>  		}
> =20
>  		vref->y.dma_addr =3D vb2_dma_contig_plane_dma_addr(vb, 0);
> +		vref->y.size =3D vsi->fb.y.size;
> +		vref->c.size =3D vsi->fb.c.size;
>  		if (plane =3D=3D 1)
> -			vref->c.dma_addr =3D vref->y.dma_addr + size;
> +			vref->c.dma_addr =3D vref->y.dma_addr + vsi->fb.y.size;

[Severity: High]
This is a pre-existing issue, but this fix for AV1 appears to leave the exa=
ct
same bug unfixed in the VP9 stateless decoder.

When a VP9 stream changes resolution mid-stream, the driver calculates the
C plane offset based on the current frame's width and height. Does this
erroneously apply the current-frame offset to all previously decoded
reference frames?

vdec_vp9_req_lat_if.c:vdec_vp9_slice_setup_core_buffer() {
    ...
    size =3D ALIGN(w, 64) * ALIGN(h, 64);
    ...
                    vsi->ref[i].c.dma_addr =3D
                        vsi->ref[i].y.dma_addr + size;
    ...
}

If the current frame is smaller than the reference frame, would the hardware
read corrupted chroma data from the middle of the reference frame's Y plane?

If the current frame is larger, could the calculated offset applied to the
reference frame point beyond its actual chroma offset, potentially triggeri=
ng
a hardware fault via the IOMMU?

Could a similar fix using ctx->picinfo.fb_sz[0] be applied to VP9?

>  		else
>  			vref->c.dma_addr =3D vb2_dma_contig_plane_dma_addr(vb, 1);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720012056.1026=
551-1-kyrie.wu@mediatek.com?part=3D13
