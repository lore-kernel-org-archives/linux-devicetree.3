Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566279;
	b=Jigr7P2gW92gbvLXWyegVi8weBljh9eqb5qpk/Lu/gRBjeXqKDb7I+AJlcjtvjI5KrqZ
	 ALVsCVy1dUE6FwyZfuOSL7nB2sRHahe2DmhXFM4YgGhUPBOLTXs5gkeBvfR2BunTf/oJw
	 1AXUUmr0i4rCjWnD8pQGujiUbI/eLUnFKPOK4fkExuTmskDGzPGwRgMMhTGkyMYef0d8v
	 EFZzGBOBAuHfyW2OlC5uTzwW9aINQYgjqF3AYufMl3T+8lucnI6ADKNNVV/1XbLRnnttL
	 SM81CJwexxk7DFXnf+OZ9CnIbo/a/wCWqZ5lWJodsbMUy3pNH98VZQwtiZaLh5InnqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566279;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6k6AfQb1gBjvFlGEX0pSJGZhr+4funoFozcLk5duaa0=;
	b=ERJ661tLsyn+0RoSHwZtvpoZBoxPziF/cv36hP430i9HDgFx41vZAf+YW77j4vxf3np/
	 yUVRdYM44+ah3rTJy2cQihwI4PA31ThSWqaAstx388euSAtkugtgdlEvpfdeFpWGymGHc
	 VRFrSCWKRCuAzNu4vSdDbwc+nNhVfdBUWOPN4It1QXgdij9JswA5EjQQFjXYr8USKL4Ys
	 W4mknJi2YQqwWyprG9f3p5dxgBzuNH8HEddun4vfl49loy1EgEjuJNYUqORn8ssXB6R2Q
	 CaxriCt+Fle3DwdDc9bc+2PXo9HA6N9PidEorqvrWVYx+Z/c8f3obseAoVwYkN+m3mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cZq5Qeq1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7094C606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cZq5Qeq1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A611F000C4;
	Wed, 25 Nov 2026 00:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795566279;
	bh=6k6AfQb1gBjvFlGEX0pSJGZhr+4funoFozcLk5duaa0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cZq5Qeq1uFyssgLJOfkIjn57ty4rDulKObXLQNOT6ADti4RtXBf5r/BSsDxAy5IDt
	 lN5n0cVmJlmnbIoLzOljSugG9CKsbByFX7Z7o2NAHu1ipLiQihjqgZ11kH2xdEBE6k
	 y5wuKjOm/6imN20sFyf0LWh6yQknFrmXLNGviGrk0tKtBZszshLZZe6fsqWvOo/Ajh
	 GSsuJ9X6COSrt/oerXV4ooWhm0HPmhBRe0PmncqqD1Qafrdgbtr7fKkHxOy54P+cEV
	 WHXeS5c8IKcO092UPaxUCo501cViYL9/CmVzjtL7G3HGwc5rXE1+jauRgeCJpEevBQ
	 orgYSqI0mEN5w==
Message-ID: <sashiko-outbox-232275@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] misc: fastrpc: add HPASS domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anandu Krishnan E" <anandu.e@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-fastrpc-hpass-support-v1-2-cb1d46b29e3b@oss.qualcomm.com>
References: <20261125-fastrpc-hpass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com>
 <20261125-fastrpc-hpass-support-v1-2-cb1d46b29e3b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 00:24:37 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] misc: fastrpc: use-after-free due to dangling dma_mask in
  fastrpc_rpmsg_probe() [1]
--

commit 45628114d33912de02c404c2680ce4e7336df5df
Author: Anandu Krishnan E <anandu.e@oss.qualcomm.com>

misc: fastrpc: add HPASS domain

This commit adds HPASS_DOMAIN_ID for the High Performance Audio Subsystem
(HPASS), maps the "hpass" devicetree label to it, and enables reserved
remote heap memory and device registration for the domain.

> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 9e760f68bcaf2..c515097c3d3ba 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c

[ ... ]

> @@ -2761,6 +2765,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device =
*rpdev)
>  	case ADSP_DOMAIN_ID:
>  	case MDSP_DOMAIN_ID:
>  	case SDSP_DOMAIN_ID:
> +	case HPASS_DOMAIN_ID:
>  		/* Unsigned PD offloading is only supported on CDSP and GDSP */
>  		data->unsigned_support =3D false;
>  		err =3D fastrpc_device_register(rdev, data, secure_dsp, domain);

[Severity: Critical]
This problem wasn't introduced by this patch, but can fastrpc_rpmsg_probe()
leave a dangling rdev->dma_mask pointer [1]?

drivers/misc/fastrpc.c:fastrpc_rpmsg_probe() {
    ...
	rdev->dma_mask =3D &data->dma_mask;
	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
    ...
	err =3D fastrpc_cb_devices_create(rpdev);
	if (err)
		goto err_deregister_fdev;
    ...
err_free_data:
	kfree(data);
	return err;
}

fastrpc_rpmsg_probe() points rdev->dma_mask at data->dma_mask inside the
heap-allocated fastrpc_channel_ctx.  If fastrpc_cb_devices_create() fails
or the driver is later unbound via fastrpc_rpmsg_remove() ->
fastrpc_channel_ctx_put(), data is freed while rpdev->dev lives on with
rdev->dma_mask still pointing into the freed object, causing a
use-after-free on any subsequent probe or DMA API access on the device.

[1] https://sashiko.dev/#/bug/linux-3d83ea49-16e6-4a33-9f74-77e4b19335b8

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-fastrpc-hp=
ass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com?part=3D2
