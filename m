Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBF22AD35
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132781; cv=none; b=YiS3uZdnEBdSiqez9/q6iXGA5Wg/Uz6tgTAdCEZg7DxM2sH5OFv0k6EnV+uW9791zfoEHFhyQBuvG9jXZcEHD/4XcEi5V4mPzsMgdgNIpVJ4VbXuwWV4S75HC2TDpJaaePLzMrmsiCaHkPCkXhrGXiws3gE8Z5Cd+nPibUeX0nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132781; c=relaxed/simple;
	bh=hkeO0NbmgZpQch9c5uHBQLyvylwYjc89edCLoILbtBo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bibqP3tfJyfgUgHHMaC+zO/htVbdkKujm3WAnGXQNRMmKKeB71WuyjukAS0qtH1Iz1U0mkd53BA/Pur2Vn2gO3YLpQcxzCU837/yb75sj6BOCwRkoV6sqagqv+gZD0jgMCydaWpyJ9spx+E8dRNjQIGrMF28gA4uORH1sitIq+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFqplJsu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFqplJsu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DCF1F000FF;
	Wed, 23 Sep 2026 03:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790132778;
	bh=LruLFPfabbez5eG7D78iobn2gvihtBblmFYvDYfCzt0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KFqplJsuLnIQKLTQpJh12clJTdqrdAn5Kx5RYMuDmU3p4XwKmHgidksdw7Fu2B1XE
	 064t9HXZjzudR9gynmHzGQNf966MZzltNFS7AcXc1/oac8kYlW6hEoXlpUTzfB3BUO
	 BTiZb8yw+XxNpfH3TQykb9eaxo5e10rl9U64ePTesSMNAPslfzb3DqXRAXI3uQOqi7
	 B2Lx/QqnqPL46QdjaTG8ZL57Xyd4rRNBRYk265DyjHn+atBrrDHBFYYZR2opiBOJ6z
	 cCLXmp5VkOQcUX8N3l1ayavC6wzfxeYLaKVYVF5wshFF4NiW1lkTSzCWN57VpagCsD
	 F95H2ku+j4vxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 03/14] media: mediatek: vcodec: add driver to support
 vcp encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260923024258.257846-4-kyrie.wu@mediatek.com>
References: <20260923024258.257846-1-kyrie.wu@mediatek.com>
 <20260923024258.257846-4-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 03:06:18 +0000
Message-Id: <20260923030618.91DCF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing device tree parsing makes VCP encoder initialization dead =
code
- [High] Stub mtk_vcodec_vcp_dm_addr() returns NULL causing encoder init fa=
ilure
- [High] IPI ID mismatch causes VCP encoder IPI registration and messaging =
to fail
--

commit 28bb4d159c923a5740008e975162078560f6eee9
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: add driver to support vcp encoder
   =20
Encoder also need to call vcp interface to communicate with vcp,
add driver to support encoder.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> index 150d842c7d226..ece4e3e87e62d 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> @@ -223,8 +225,13 @@ static int mtk_vcodec_vcp_msg_ipi_send(struct mtk_vc=
odec_fw *fw, int id, void *b
>  	}
> =20
>  	mutex_lock(&vcp->ipi_mutex);
> -	feature_id =3D VDEC_FEATURE_ID;
> -	mailbox_id =3D IPI_OUT_VDEC_1;
> +	if (fw->fw_use =3D=3D ENCODER) {
> +		feature_id =3D VENC_FEATURE_ID;
> +		mailbox_id =3D IPI_OUT_VENC_0;
> +	} else {
> +		feature_id =3D VDEC_FEATURE_ID;
> +		mailbox_id =3D IPI_OUT_VDEC_1;
> +	}

[Severity: High]
Does this code handle the IPI IDs used by the encoder correctly?

The VCP firmware abstraction requires the IPI id to be less than VCP_IPI_MAX
(which is 3). However, the encoder driver initializes its vpu->id to values
like SCP_IPI_VENC_H264 (4) or IPI_VENC_VP8 (5).

For example, in venc_h264_if.c:

drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:venc_h26=
4_init() {
    ...
    inst->vpu_inst.id =3D SCP_IPI_VENC_H264;
    ...
}

When this id is passed to mtk_vcodec_vcp_msg_ipi_send() and checked against
mtk_vcodec_vcp_ipi_id_valid(), won't validation fail and return -EINVAL?
This would prevent the VCP encoder from successfully sending messages.

Note that while patch 04 ('media: mediatek: vcodec: get different firmware
ipi id') fixes this mapping for decoders via mtk_vcodec_fw_get_ipi(), it
appears to completely omit the encoder implementations.

[ ... ]

> @@ -402,6 +414,26 @@ static int mtk_vcodec_vcp_load_firmware(struct mtk_v=
codec_fw *fw)
>  		mutex_init(&fw->vcp->ipi_desc[i].lock);
>  	mutex_init(&fw->vcp->ipi_mutex);
> =20
> +	if (fw->fw_use =3D=3D ENCODER) {
> +		init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_ENCODER]);
> +		fw->vcp->msg_thread =3D
> +			kthread_run(mtk_vcodec_vcp_msg_process_thread, fw, "vcp_enc_msq_threa=
d");
> +		if (IS_ERR(fw->vcp->msg_thread)) {
> +			ret =3D PTR_ERR(fw->vcp->msg_thread);
> +			fw->vcp->msg_thread =3D NULL;
> +			goto err_deregister_feature;
> +		}
> +
> +		fw->vcp->vsi_addr =3D vcp_device->ops->get_mem_virt(vcp_device, mem_id=
);
> +		fw->vcp->vsi_size =3D vcp_device->ops->get_mem_size(vcp_device, mem_id=
);
> +		fw->vcp->iova_addr =3D vcp_device->ops->get_mem_iova(vcp_device, mem_i=
d);
> +
> +		dev_dbg(&fw->pdev->dev, "enc vcp init done =3D> va: %p size:0x%x iova:=
%pad.\n",
> +			fw->vcp->vsi_addr, fw->vcp->vsi_size, &fw->vcp->iova_addr);
> +
> +		return 0;
> +	}

[Severity: High]
Does the encoder receive a valid VSI pointer during initialization?

In mtk_vcodec_fw_vcp.c, mtk_vcodec_vcp_dm_addr() is currently a stub that
unconditionally returns NULL:

drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c:mtk_vcode=
c_vcp_dm_addr() {
    static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 dtcm_=
dmem_addr)
    {
        return NULL;
    }
}

When the encoder receives VPU_IPIMSG_ENC_INIT_DONE, it calls
mtk_vcodec_fw_map_dm_addr(), which invokes this stub and causes vpu->vsi
to be NULL.

The core encoder initialization then explicitly rejects a NULL VSI address:

drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c:vpu_enc_init()=
 {
    ...
    if (IS_ERR_OR_NULL(vpu->vsi)) {
        mtk_venc_err(vpu->ctx, "invalid venc vsi");
        return -EINVAL;
    }
    ...
}

Will this cause VCP encoder initialization to unconditionally fail?

Even though patch 05 ('media: mediatek: vcodec: get share memory address')
updates this function to switch on mem_type, won't the caller in venc_vpu_i=
f.c
still pass a remote instance address (e.g., msg->vpu_inst_addr) rather than
the expected ENCODER_MEM enum value? This would hit the default case and
still return NULL at the end of the series.

[ ... ]

> @@ -530,7 +562,11 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *p=
riv, enum mtk_vcodec_fw_use
>  	struct mtk_vcodec_fw *fw;
>  	int i;
> =20
> -	if (fw_use =3D=3D DECODER) {
> +	if (fw_use =3D=3D ENCODER) {
> +		struct mtk_vcodec_enc_dev *enc_dev =3D priv;
> +
> +		plat_dev =3D enc_dev->plat_dev;
> +	} else if (fw_use =3D=3D DECODER) {
>  		struct mtk_vcodec_dec_dev *dec_dev =3D priv;
> =20
>  		plat_dev =3D dec_dev->plat_dev;

[Severity: High]
Is the newly added VCP encoder initialization unreachable due to missing
device tree parsing?

While this patch adds VCP firmware support for the encoder, the encoder's
probe function only checks for mediatek,vpu and mediatek,scp:

drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c:mtk_vco=
dec_probe() {
    ...
    } else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
                                     &rproc_phandle)) {
        fw_type =3D SCP;
        dev->fw_init =3D mtk_vcodec_fw_scp_init;
    } else {
        dev_err(&pdev->dev, "[MTK VCODEC] Could not get venc IPI device");
        return -ENODEV;
    }
    ...
}

Since mediatek,vcp is never checked, won't the driver return -ENODEV if an
encoder node specifies it? The assignment to mtk_vcodec_fw_vcp_init seems
to be missing from the encoder probe path.

This appears to remain unfixed through the end of the patch series.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923024258.2578=
46-1-kyrie.wu@mediatek.com?part=3D3
