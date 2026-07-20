Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056AA259CB9
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784512219; cv=none; b=Mmkpfow04IwnWgsJnSQfMAT2ZmAQ864n2uoWHD0y0NCxwCCzXIb0ny6JLo8W+n3Dg8yTvg6L4UFWUououzWHESxbdzXg011NbHdenZEfXp3TsDXY1Uen4U6x8y2zJfWAMTVy775WbpJQ7bimcRBRAL9SDhjHXO9wWtPZKRdLkh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784512219; c=relaxed/simple;
	bh=fvhoaVjoiRxjuGmofNyEupxOphWz/LJzOJ5HZrjpMS0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CJUahVd07rE+CYSHKLqIWPb+ORIYK/KbFnxdWsO33p+pmfV3rEyHcod98F8kcjPuAHQmvxgbi6jxGugmWJbKnhr1AAQAaz5q2uthUun2B8TjFkTzzJT6e/AVZApKQyg9yyPf4m3ydSsDOMzajfereYC44A4BCJTjyoyY7Md05Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AetlnDAX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AetlnDAX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49ED21F000E9;
	Mon, 20 Jul 2026 01:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784512217;
	bh=cxHqoJmrNBpAHlK/IztSiEf5nAw34xU/IM2jTIaLGHM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AetlnDAXB3s0bEz20J1QN5M7EubV7gLD2JH5Z7Ji9qK2RWFPN3h3bQfV8aRLHaUc7
	 4bSRnm5QRs3HcVH2pxl0pKdM/NKMsBWSU7ar6Gr3XRO2oxmH1KH9XWNbhDvCpFoeNf
	 U6UEiZ0qUcyWZ1qLQ94G1XoopsjPEl6l7IuiaFyfikt4Tp7bvagvRlo4MEMbmdKdnV
	 gcdBSGtkpgZXq86mxRR8/8LoU4c4Azekfj8Qt1YQ5E6w60ZJiYmC2YwejTJXJ5XPjY
	 B15inYYQ0ZXsb2V+DNs3nxvFIb82TfLaldwKlCUhHOSpDfuY0irt+3hv2wbHqlVUG/
	 M4DuxKHcHTOkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 14/14] media: mediatek: decoder: support av1 extend
 vsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260720012056.1026551-15-kyrie.wu@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
 <20260720012056.1026551-15-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 01:50:16 +0000
Message-Id: <20260720015017.49ED21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] Buffer overflow into firmware shared memory due to uncondition=
al sizeof() in vdec_av1_slice_vsi_to_remote()

Pre-existing issues:
- [High] Use-After-Free (UAF) due to lockless access to dynamic V4L2 contro=
l array in vdec_av1_slice_setup_tile_group()
--

--- Patch [14]: [PATCH v6 14/14] media: mediatek: decoder: support av1 exte=
nd vsi ---
commit ed7b2651547150bfaed8f1355f43d152991a7bc1
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: decoder: support av1 extend vsi

This commit introduces support for AV1 extend VSI architecture in the
Mediatek decoder. It adds tile group information to the VPU shared memory
structure for extended architectures.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> index 14639098fd463..1ef561dae18c7 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
[ ... ]
> @@ -641,6 +644,8 @@ struct vdec_av1_slice_fb {
>   * @frame:		current frame info
>   * @state:		status after decode done
>   * @cur_lst_tile_id:	tile id for large scale
> + * @tile_group:	tile group info
> + * @reserved:		reserved
>   */
>  struct vdec_av1_slice_vsi {
>  	/* lat */
> @@ -665,6 +670,8 @@ struct vdec_av1_slice_vsi {
>  	struct vdec_av1_slice_frame frame;
>  	struct vdec_av1_slice_state state;
>  	u32 cur_lst_tile_id;
> +	struct vdec_av1_slice_tile_group tile_group;
> +	unsigned int reserved[4];
>  };

[Severity: Critical]
Does the addition of this large struct cause a buffer overflow on
non-extended architectures?

The firmware allocates only 3408 bytes (AV1_NON_EXT_VSI_SIZE) for this
memory mapping on non-extended architectures. However, since
vdec_av1_slice_vsi_to_remote() unconditionally copies the entire struct
using sizeof(*vsi), won't this write out-of-bounds data into the adjacent
VPU shared memory?

[ ... ]
> @@ -1402,17 +1409,29 @@ static void vdec_av1_slice_setup_uh(struct vdec_a=
v1_slice_instance *instance,
>  	vdec_av1_slice_setup_tile(frame, &ctrl_fh->tile_info);
>  }
> =20
> +static
> +struct vdec_av1_slice_tile_group *vdec_av1_get_tile_group(struct vdec_av=
1_slice_instance *instance,
> +							  struct vdec_av1_slice_vsi *vsi)
> +{
> +	if (IS_VDEC_SUPPORT_EXT(instance->ctx->dev->dec_capability))
> +		return &vsi->tile_group;
> +	else
> +		return &instance->tile_group;
> +}
> +
>  static int vdec_av1_slice_setup_tile_group(struct vdec_av1_slice_instanc=
e *instance,
>  					   struct vdec_av1_slice_vsi *vsi)
>  {
>  	struct v4l2_ctrl_av1_tile_group_entry *ctrl_tge;
> -	struct vdec_av1_slice_tile_group *tile_group =3D &instance->tile_group;
> +	struct vdec_av1_slice_tile_group *tile_group;
>  	struct vdec_av1_slice_uncompressed_header *uh =3D &vsi->frame.uh;
>  	struct vdec_av1_slice_tile *tile =3D &uh->tile;
>  	struct v4l2_ctrl *ctrl;
>  	u32 tge_size;
>  	int i;
> =20
> +	tile_group =3D vdec_av1_get_tile_group(instance, vsi);
> +
>  	ctrl =3D v4l2_ctrl_find(&instance->ctx->ctrl_hdl, V4L2_CID_STATELESS_AV=
1_TILE_GROUP_ENTRY);
>  	if (!ctrl)
>  		return -EINVAL;

[Severity: High]
This is a pre-existing issue, but does this function access the dynamically
allocated V4L2 control payload locklessly?

vdec_av1_slice_setup_tile_group() fetches the control and later accesses
ctrl->p_cur.p without holding the control handler lock (ctrl_hdl->lock).
Since this executes in a workqueue, could a concurrent VIDIOC_S_EXT_CTRLS
ioctl cause the V4L2 core to reallocate the array and free the old memory?

This would result in a use-after-free read of the old array payload, potent=
ially
tricking the hardware into performing out-of-bounds DMA.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720012056.1026=
551-1-kyrie.wu@mediatek.com?part=3D14
