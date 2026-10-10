Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB393B840E
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791622655; cv=none; b=Cd656ktCIaW8ayYFCkrTgyhOOCZiRV4H7HPfNX1X9de4/BcuiDVwV66ldtP9cuwGVXiqZ2uH3KWOfChSmI+OzyqahkyLhruCQgrz2yqFkEjGgTL8ihKLJzaMo/EyLq4SiGw11zZOWjA2Yu8PDA/Dgr+/FWHPOunp982OY51FGUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791622655; c=relaxed/simple;
	bh=9KpnoDMkqeVT6ZCoUHVZ0K6QpAmLhD5P1rrcqJHxVCE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fUmH3GN0j/FKtuKhUWKSHN5kTOM0nfN/0ehaXTjTByLa7PltztwNq6RgVTNwK+VD9Byv/OYe9LnFGFbVJva1eIvgwa+nPbwGMtbZ6N5/jrd6qW6b32hb7cQ2YBQ0t+mwRO8PKwAwo5zSJGoEyMz+K7i1NINbXKLxM7WitVWJ0DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCPvIESe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCPvIESe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5981F000FF;
	Sat, 10 Oct 2026 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791622654;
	bh=aPdA7s1t9qpCfxOjbeZNIIBMscIoLwlZztHjlKO6hf0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TCPvIESeKFXzIy3lGN7X+gysiKGR7MDLFBUKg5bM4Ghgud6OG/88lJVUGggVgiWQY
	 DqbJXJwxW3ePdwZQhL0CW5jGaCTWmi5Dl7f53uiNgMyqejCjQYtdxEMI1a7FEXFY6x
	 OaacvHNHfYcNpWt0OV3VizKMxr29NpLeVMK9nFI+s03/kUzRIKYoYyKWzS/5kHHbkQ
	 1F9+UlHx0PUY6IT5vkL5bmULrr/uYaEcnOkirhT/QYSRMZiba8zQi0TGj+HGcpdQW5
	 dSeqJLifn8eE1c9kvNGFrn2ewJtqPXURo2Td7vOoZGrCm73hixrD9vL9rmxSk+ZScO
	 /w6qr2MncvdgA==
Message-ID: <sashiko-outbox-166382@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 13/14] media: mediatek: decoder: fill av1 buffer size
 with picinfo
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <f53ccdc0c8b07fbc4150ee3b0b52b4664c0cad94.1791619743.git.kyrie.wu@mediatek.com>
References: <cover.1791619742.git.kyrie.wu@mediatek.com>
 <f53ccdc0c8b07fbc4150ee3b0b52b4664c0cad94.1791619743.git.kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 08:57:33 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] media: mtk-vcodec: OOB DMA write due to concurrent global pici=
nfo mutation in stateless AV1 decoder
--

commit 4ecde7c3d617adc20b638103986012affff901df
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: decoder: fill av1 buffer size with picinfo

This patch modifies the AV1 decoder to use the buffer sizes calculated
in the vcp/scp, filling each frame buffer size directly from picinfo
rather than computing it locally from the frame width and height.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
[ ... ]
> @@ -1811,18 +1811,19 @@ static int vdec_av1_slice_setup_core_buffer(struc=
t vdec_av1_slice_instance *inst
>  {
[ ... ]
>  	/* frame buffer */
>  	vsi->fb.y.dma_addr =3D fb->base_y.dma_addr;
> +
> +	vsi->fb.y.size =3D instance->ctx->picinfo.fb_sz[0];
> +	vsi->fb.c.size =3D instance->ctx->picinfo.fb_sz[1];
> +

[Severity: Critical]
Does this introduce a race condition with concurrent requests?

The driver uses an asynchronous architecture where requests are processed
sequentially in the lat phase by mtk_vdec_worker, but core work is queued
and executed asynchronously.

If mtk_vdec_worker processes a new request, it synchronously updates the
global instance->ctx->picinfo to match the new sequence controls.
Concurrently, if the core worker processing the previous request executes
vdec_av1_slice_setup_core_buffer(), it will now read the mutated
instance->ctx->picinfo.fb_sz instead of the request-local dimension data.

>  	if (plane =3D=3D 1)
> -		vsi->fb.c.dma_addr =3D fb->base_y.dma_addr + size;
> +		vsi->fb.c.dma_addr =3D fb->base_y.dma_addr + vsi->fb.y.size;

[Severity: Critical]
Can this regression lead to an out-of-bounds dma write?

If the subsequent request specifies a larger resolution, vsi->fb.y.size here
will be larger than the actually allocated vb2 capture buffer for the curre=
nt
request.

Because this calculated c-plane dma address is not validated against the
physical capacity of the underlying vb2 buffer, the hardware could perform =
an
out-of-bounds write when it processes this offset. Userspace could potentia=
lly
trigger this by queuing sequential requests with different resolutions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791619742.gi=
t.kyrie.wu@mediatek.com?part=3D13
