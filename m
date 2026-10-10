Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC8A3B5846
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791622389; cv=none; b=YWIxp5C7pc/kMtMGlQV4QcIhzjASY8DQmU2JHIbkxTBgo5SVbLoy10HOVj8WANcwNU0/Vh6Xbw/VjWYWp4zgZ6ovqTMY4GOAwjdkmhI34sfZbIheiksaakpM0psuTdGUf/j7L744uIaiWKtrUAJfp+HlUWoPInxD0gASCSvYDlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791622389; c=relaxed/simple;
	bh=iBh1kwlcs2z9KZN7YjAqFM9JRO0HOxYYFq/SZFa1GM8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Vcs9xoUDnBwxAHeXJP/WgRzXcu4RxyX7HfT4t5WeNORnqbDbqnI5Sx3M+q3qHXudC/sFfT3Jk2oQc4lGQRilrQE5BzFo3eIL0c81/qMhrEyWXOa7TCtPZKMtKf0rdBow2F3ojBfgO7SOjSEuNpo2GXVdZd3c8edpvnWIyXJxFrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6ThClTl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6ThClTl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A271F000FF;
	Sat, 10 Oct 2026 08:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791622384;
	bh=Dn1wwQyE4v85DKaUtbvT+bXM10dHNEuCjLxYRnG+2no=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c6ThClTla7ewIoPevTfkfxDqN0OTR7Cw3dXt856XUqtaX158n4j2OF7XnZchWUnbw
	 WCeN9MyV1xjWzN6MuUvVAioBY1YoRAwR3HW6RQBylH49zMMlxLPDqueFkJ9LeJjCxa
	 uq7eZLbOtR5UsoXcjA8hseJe5eRjNHzcnfr7RcPqKb5olKQLuM6MUAIG0KO1aGB5zg
	 aQ/MAhwjoBV5+HeDhizQynOwahohzG9kznUBuqH7e7Uf4vyMJH3arFRQgsCtgz6oq8
	 UiElMWCzxGFJ8dBbACoSTWRuJgRsZidYsGRvh3Fd1rU3pWXXLbQxCI+y883wt7gdgM
	 N0+OeCyjcaS3A==
Message-ID: <sashiko-outbox-166379@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 02/14] media: mediatek: vcodec: add driver to support
 vcp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <c20ce2980a5fa57296b3593045225f02e782fb57.1791619742.git.kyrie.wu@mediatek.com>
References: <cover.1791619742.git.kyrie.wu@mediatek.com>
 <c20ce2980a5fa57296b3593045225f02e782fb57.1791619742.git.kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 08:53:03 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] media: vcodec: vcp: Modprobe bomb in mtk_vcodec_vcp_get_vcp_device=
 retry loop
- [High] media: vcodec: vcp: IPC desync and UAF from unhandled late ACKs
- [High] media: vcodec: vcp: Out-of-bounds read in mtk_vcodec_vcp_msg_ack_i=
sr
- [High] media: vcodec: vcp: Unvalidated firmware payload length enables OO=
B read
- [High] build: missing headers and identifiers in mtk_vcodec_fw_vcp.c
- [High] module: 10000-iteration modprobe fork bomb in mtk_vcodec_vcp_get_v=
cp_device
- [Medium] media: vcodec: vcp: Remote processor reference leak in mtk_vcode=
c_vcp_release
- [Medium] media: vcodec: vcp: Signal retry loop in mtk_vcodec_vcp_msg_ipi_=
send instantly bypasses timeout
- [Medium] media: vcodec: vcp: Race condition from premature is_init_done f=
lag assignment
- [Low] media: vcodec: vcp: Incorrect printk format specifier for dma_addr_t
- [Low] media: vcodec: vcp: Unused fw_type variable in probe functions
--

commit bd79ec43ee8b23d8e7b2f7ace79397de331b886a
Author: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: media: mediatek: vcodec: add driver to support vcp

The processor is changed from scp to vcp in mt8196 platform.
Adding new firmware interface to communicate kernel with vcp
for the communication method is changed.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> new file mode 100644
> index 0000000000000..150d842c7d226
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> @@ -0,0 +1,571 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + * Author: Kyrie Wu <kyrie.wu@mediatek.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/dma-direction.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/iommu.h>
> +#include <linux/remoteproc/mtk_vcp_public.h>
> +#include <linux/firmware/mediatek/mtk-vcp-ipc.h>

[Severity: High]
Are these included headers missing from the kernel tree? It looks like
mtk_vcp_public.h and mtk-vcp-ipc.h are completely missing, along with
identifiers like VDEC_FEATURE_ID and IPI_OUT_VDEC_1, which will cause
compilation failures.

[ ... ]

> +		if (!handler) {
> +			dev_err(&fw->pdev->dev, "invalid ack ipi handler id =3D %d\n", obj->i=
d);
> +			mtk_vcodec_vcp_ipi_unlock(fw->vcp, obj->id);
> +			mtk_vcodec_vcp_free_msg_node(fw, msg_node);
> +			continue;
> +		}
> +
> +		handler(msg, obj->len, fw->vcp->ipi_desc[obj->id].priv);

[Severity: High]
Does this unvalidated length field allow an out-of-bounds read? The obj->len
value is extracted directly from the untrusted IPC payload and passed to the
handler without bounds checking against the physical constraints of the
share_buf array.

> +		mtk_vcodec_vcp_ipi_unlock(fw->vcp, obj->id);
> +
> +		fw->vcp->msg_signaled[obj->id] =3D true;
> +		wake_up(&fw->vcp->msg_wq[obj->id]);

[Severity: High]
Can unhandled late ACKs cause IPC desynchronization and a use-after-free?
If wait_event_interruptible_timeout() in mtk_vcodec_vcp_msg_ipi_send() times
out, the wait is abandoned. A subsequent delayed ACK processed here would
signal completion prematurely for a new wait, or cast the stale
msg->ap_inst_addr to a potentially freed context.

[ ... ]

> +static int mtk_vcodec_vcp_msg_ack_isr(unsigned int id, void *prdata, voi=
d *data, unsigned int len)
> +{
[ ... ]
> +	if (!list_empty(&msg_queue->node_list)) {
> +		msg_node =3D list_entry(msg_queue->node_list.next, struct mtk_vcp_msg_=
node, list);
> +
> +		memcpy(&msg_node->ipi_data, obj, sizeof(*obj));

[Severity: High]
Will this memcpy() perform an out-of-bounds read if the provided len is sma=
ller
than sizeof(*obj)? The length parameter passed to the ISR is ignored, which
could lead to a page fault if the payload sits at the end of a mapped page.

[ ... ]

> +static int mtk_vcodec_vcp_msg_ipi_send(struct mtk_vcodec_fw *fw, int id,=
 void *buf,
> +				       unsigned int len, unsigned int wait)
> +{
[ ... ]
> +wait_ack:
> +	/* wait for VCP's ACK */
> +	ret =3D wait_event_interruptible_timeout(*msg_wq, *msg_signaled,
> +					       msecs_to_jiffies(IPI_TIMEOUT_MS));
> +	if (!ret) {
> +		vcp->ipi_id_ack[id] =3D VCODEC_IPI_MSG_STATUS_FAIL;
> +		dev_err(&fw->pdev->dev, "wait ipi ack timeout! %d %d\n", ret, vcp->ipi=
_id_ack[id]);
> +	} else if (ret =3D=3D -ERESTARTSYS) {
> +		if (retry_cnt++ < 5)
> +			goto wait_ack;
> +
> +		dev_err(&fw->pdev->dev, "wait ipi ack err (%d)\n", vcp->ipi_id_ack[id]=
);

[Severity: Medium]
Will this retry loop instantly exhaust all its attempts? Since the pending
signal on the task is never cleared, subsequent calls to
wait_event_interruptible_timeout() will immediately see the signal and
return -ERESTARTSYS again without sleeping.

[ ... ]

> +static int mtk_vcodec_vcp_get_vcp_device(struct mtk_vcodec_fw *fw)
> +{
> +	struct device *dev =3D &fw->pdev->dev;
> +	int retry =3D 0, retry_cnt =3D 10000;
> +	phandle vcp_phandle;
> +
> +	while (!try_then_request_module(mtk_vcodec_vcp_driver_loaded(fw), "mtk-=
vcp")) {
> +		if (++retry > retry_cnt) {
> +			dev_err(dev, "failed to load mtk-vcp module");
> +			return -EPROBE_DEFER;
> +		}
> +		usleep_range(1000, 2000);
> +	}

[Severity: High]
Does this loop act as a local denial-of-service fork bomb? The
try_then_request_module macro internally calls __request_module() synchrono=
usly
every time its condition evaluates to false. If the module is missing or fa=
ils
to probe, this will spawn up to 10,000 modprobe helper processes in rapid
succession.

[ ... ]

> +static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
> +{
[ ... ]
> +		fw->vcp->is_register_done =3D true;
> +	}
> +
> +	fw->vcp->is_init_done =3D true;
> +
> +	for (i =3D 0; i < VCP_IPI_MAX; i++)
> +		mutex_init(&fw->vcp->ipi_desc[i].lock);
> +	mutex_init(&fw->vcp->ipi_mutex);

[Severity: Medium]
Is it safe to set is_init_done to true before initializing the mutexes and
waitqueues? A concurrent operation observing is_init_done =3D=3D true could
attempt to use these uninitialized primitives, leading to lockdep crashes or
NULL pointer dereferences.

[ ... ]

> +	fw->vcp->vsi_addr =3D vcp_device->ops->get_mem_virt(vcp_device, mem_id);
> +	fw->vcp->vsi_core_addr =3D fw->vcp->vsi_addr + VCODEC_VSI_LEN;
> +	fw->vcp->vsi_size =3D vcp_device->ops->get_mem_size(vcp_device, mem_id);
> +	fw->vcp->iova_addr =3D vcp_device->ops->get_mem_iova(vcp_device, mem_id=
);
> +
> +	dev_dbg(&fw->pdev->dev, "vdec vcp init done =3D> va: %p size:0x%x iova:=
%p.\n",
> +		fw->vcp->vsi_addr, fw->vcp->vsi_size, &fw->vcp->iova_addr);

[Severity: Low]
Does this print the memory address of the iova_addr variable instead of its
value? The %p format specifier prints the pointer itself, but %pad should
be used for printing a dma_addr_t passed by reference.

[ ... ]

> +static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
> +{
[ ... ]
> +	ret =3D vcp_device->ops->deregister_feature(vcp_device, fw->vcp->featur=
e_id);
> +	if (ret < 0) {
> +		dev_err(dev, "deregister feature_id(%d) fail(%d)\n", fw->vcp->feature_=
id, ret);
> +		return;
> +	}
> +
> +	fw->vcp->is_register_done =3D false;
> +	fw->vcp->is_init_done =3D false;
> +
> +put_device:
> +	mtk_vcodec_vcp_put_device(fw);
> +}

[Severity: Medium]
Will this early return leak the remoteproc reference? By returning early wh=
en
deregister_feature fails, the function bypasses the put_device cleanup labe=
l,
preventing the remote processor driver from being cleanly unloaded.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index 426d060d937c1..0f9cb651e59b0 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -376,16 +376,22 @@ static int mtk_vcodec_probe(struct platform_device =
*pdev)
>  	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
>  				  &rproc_phandle)) {
>  		fw_type =3D VPU;
> +		dev->fw_init =3D mtk_vcodec_fw_vpu_init;
>  	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
>  					 &rproc_phandle)) {
>  		fw_type =3D SCP;
> +		dev->fw_init =3D mtk_vcodec_fw_scp_init;
> +	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vcp",
> +					 &rproc_phandle)) {
> +		fw_type =3D VCP;
> +		dev->fw_init =3D mtk_vcodec_fw_vcp_init;

[Severity: Low]
Is the fw_type variable unused after this assignment? The mtk_vcodec_fw_sel=
ect
call below was updated to use dev->fw_init instead, which leaves fw_type
orphaned and could trigger a -Wunused-but-set-variable compiler warning.

> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv=
.c
> index 4e4541b2fc8ea..811bc62a196f5 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> @@ -259,16 +259,18 @@ static int mtk_vcodec_probe(struct platform_device =
*pdev)
>  	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
>  				  &rproc_phandle)) {
>  		fw_type =3D VPU;
> +		dev->fw_init =3D mtk_vcodec_fw_vpu_init;
>  	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
>  					 &rproc_phandle)) {
>  		fw_type =3D SCP;
> +		dev->fw_init =3D mtk_vcodec_fw_scp_init;
>  	} else {
>  		dev_err(&pdev->dev, "[MTK VCODEC] Could not get venc IPI device");
>  		return -ENODEV;
>  	}
>  	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
> =20
> -	dev->fw_handler =3D mtk_vcodec_fw_select(dev, fw_type, ENCODER);
> +	dev->fw_handler =3D mtk_vcodec_fw_select(dev, ENCODER, dev->fw_init);

[Severity: Low]
Similarly here, is fw_type unused after assignment now that
mtk_vcodec_fw_select has been updated to take the dev->fw_init callback?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791619742.gi=
t.kyrie.wu@mediatek.com?part=3D2
