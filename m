Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9B619B5B1
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784511394; cv=none; b=A9jAuKNE2mdc9HO92Ou8bVDYaGCeTkz3DNmQwYPw1F+o/lpppQV6IkMZmeRiXhjQB39CLDwSVoPb3MiAT/jJlz2n37bPRSGRNILrVIP3hYnKL3nIvDuN8AhMF4KLr1UydGiyX9QJe835O+2j9DuGbyLEfd4FKiN+MuRknIpexkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784511394; c=relaxed/simple;
	bh=O8DGSu8MuXD44FJM9uo+VPsnHvf/2QuWZHSBoUKijCI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h15Wx1eN8I/WY8gXhhzAIcHxP+BP94jDOG0C6+bdBOXjdrQh4n0xhwty6TRlP0zWGJiRDj0BzVKg8JJrYrG7gZ8lqc+MjiyB5q93DHCUDaa9U46K5twnqPlABhQJKQO1nwh4zQRKZoDxVyF7xWdNP7wY769GNqrLMJdID8mReK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNM/GOp+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNM/GOp+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D681F000E9;
	Mon, 20 Jul 2026 01:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784511393;
	bh=gZ+1SOipgBqvOFcofwYiPNplsYG7VT99F77h/tUxdY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VNM/GOp+JkhzHUn6qGB2sad6jLjPJmO8hQyQ8nIKiEnvXwgMZo4SK3JwCHfA1eUtm
	 hhfloc20xECuGalmCzoqwKBwdejodvUXV9e7g8gZuErngJkC0Ln5ud6w6egOoiheqp
	 fiNsTnv20anZNBbd4reWOJXtjGioo7dpaFNGA6TLvIsFC8Ncbiw1L+Ix3U2BuOxzft
	 IXCTNs/X5L2+gCeT20P37e9O4/ctY1Ap+zLfEFsG2kho5dnIvp7ROmxXLdBRQX1OO1
	 NIuddkNrPiKCxnXKM7y9YxU58UM+DN+CsLKe81nb8pd+hJFr5ZYBnqB0DiM5R4HTBO
	 a/G2qbK0kjbHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/14] media: mediatek: vcodec: support vcp
 architecture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720012056.1026551-2-kyrie.wu@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
 <20260720012056.1026551-2-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 01:36:32 +0000
Message-Id: <20260720013632.A5D681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] The patch adds support for the VCP architecture but fails to handl=
e the VCP enum in mtk_vcodec_fw_select(), resulting in guaranteed probe fai=
lure.

Pre-existing issues:
- [Critical] The driver destroys decode_workqueue before unregistering the =
video device, allowing concurrent ioctls to queue work to a destroyed workq=
ueue.
- [Critical] The driver state structure (dev) is managed by devm_kzalloc bu=
t is accessed by file operations that outlive the device binding, leading t=
o a Use-After-Free.
- [High] The video device allocated via video_device_alloc() leaks on multi=
ple probe error paths.
- [High] Child platform devices created by of_platform_populate() are never=
 cleaned up.
- [High] The ordered workqueue 'dev->core_workqueue' leaks in mtk_vcodec_de=
c_remove().
--

--- Patch [1]: [PATCH v6 01/14] media: mediatek: vcodec: support vcp archit=
ecture ---
commit 86e187a5e23e9a4483af39ff82e14ad66126f95a
Author: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: media: mediatek: vcodec: support vcp architecture

This commit adds support for the VCP architecture for the video codec on
some platforms. It detects the VCP coprocessor in the device tree and sets
the VCP architecture type.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.=
h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> index 300363a40158c..c1642fb09b42a 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> @@ -14,6 +14,7 @@ struct mtk_vcodec_enc_dev;
>  enum mtk_vcodec_fw_type {
>  	VPU,
>  	SCP,
> +	VCP,
>  };
> =20
>  enum mtk_vcodec_fw_use {

[ ... ]

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index e936ed8dffbaf..d220b645e4556 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -379,6 +379,9 @@ static int mtk_vcodec_probe(struct platform_device *p=
dev)
>  	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
>  					 &rproc_phandle)) {
>  		fw_type =3D SCP;
> +	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vcp",
> +					 &rproc_phandle)) {
> +		fw_type =3D VCP;

[Severity: High]
If the mediatek,vcp property is present, probe sets fw_type =3D VCP and lat=
er
calls mtk_vcodec_fw_select(). However, since mtk_vcodec_fw_select() does not
have a case for VCP, won't it hit the default case and return ERR_PTR(-EINV=
AL),
causing probe to unconditionally fail?

mtk_vcodec_fw.c:mtk_vcodec_fw_select() {
        ...
        default:
                dev_err(&plat_dev->dev, "Invalid vcodec fw type");
                return ERR_PTR(-EINVAL);
}

[Severity: High]
This is a pre-existing issue, but does the video device allocated by
video_device_alloc() leak on multiple error paths in mtk_vcodec_probe()?

If initialization steps like v4l2_m2m_init(), alloc_ordered_workqueue(), or
of_platform_populate() fail, the code jumps to error labels like
err_dec_alloc, err_event_workq, or err_reg_cont, which skip calling
video_device_release(vfd_dec):

err_dec_alloc:
        v4l2_device_unregister(&dev->v4l2_dev);

[Severity: High]
This isn't a bug introduced by this patch, but are the child platform devic=
es
created by of_platform_populate() in mtk_vcodec_probe() ever cleaned up?

If probe fails after of_platform_populate(), or when the driver is unbound,
mtk_vcodec_dec_remove() executes but appears to never call
of_platform_depopulate() to unregister the child devices. Can this cause st=
ate
corruption and resource leaks on subsequent probes?

[Severity: High]
This is a pre-existing issue, but does the ordered workqueue
dev->core_workqueue leak when the driver is unbound?

In mtk_vcodec_probe(), alloc_ordered_workqueue() allocates dev->core_workqu=
eue
for the VDEC_LAT architecture. However, mtk_vcodec_dec_remove() destroys
decode_workqueue but seems to completely omit destroying core_workqueue:

mtk_vcodec_dec_drv.c:mtk_vcodec_dec_remove() {
        ...
        destroy_workqueue(dev->decode_workqueue);
        ...
}

[Severity: Critical]
This is a pre-existing issue, but is there a use-after-free window during
driver removal?

In mtk_vcodec_dec_remove(), destroy_workqueue(dev->decode_workqueue) is
executed before video_unregister_device(dev->vfd_dec). During this window,
could userspace invoke V4L2 ioctls that call m2mops_vdec_device_run(), which
executes queue_work() on the already freed workqueue?

mtk_vcodec_dec.c:m2mops_vdec_device_run() {
        ...
        queue_work(dev->decode_workqueue, &ctx->decode_work);
}

[Severity: Critical]
This is a pre-existing issue, but can the dev state structure be accessed
after it is freed by devres?

The driver state dev is allocated with devm_kzalloc in mtk_vcodec_probe() a=
nd
is automatically freed when mtk_vcodec_dec_remove() returns. If a process
holds /dev/videoX open during unbind, the file descriptor remains valid.

When the application later closes it, fops_vcodec_release() executes and
dereferences the freed dev pointer to acquire dev->dev_mutex:

mtk_vcodec_dec_drv.c:fops_vcodec_release() {
        struct mtk_vcodec_dec_dev *dev =3D video_drvdata(file);
        ...
        mutex_lock(&dev->dev_mutex);
}

>  	} else {
>  		dev_dbg(&pdev->dev, "Could not get vdec IPI device");
>  		return -ENODEV;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720012056.1026=
551-1-kyrie.wu@mediatek.com?part=3D1
