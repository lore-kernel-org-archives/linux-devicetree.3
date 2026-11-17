Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887760;
	b=GVb8IntR7FjzE9WMSYajpri7LKPP81eHzyF7Ocng0LBAuC/8nWUWThw3w8iVNdSL8JeH
	 h3tZMfCW4kb1Im+QCnuma8j03qlRtG0pAsjWB3oiFCu7immAKhPwGySKjJKVPtryds7F3
	 BJv1mo4AwkqGvz2ov4nd3aZhA+a+C4tmf3EkfIbEr0DbR/VJRrEjrYWpE2hetfNRUE3lu
	 LsDT+LAFLV3QRxaM+yPDQjERYoDtsZHkWTndtS1uRGmamsn7V0xXr5Dk9aXiPZY7BOHlZ
	 0OOlswsHkEKOEnqiJuqp8bry7n1n6s+dzqK2DYW6qC+rhhn40+sfq0AjP4S9c+zG/RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887760;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JYCIs+rvASLufs1uPh16h3X4+qcoze7bD1Onp+AQ2aA=;
	b=dy/agboCRKcRKRrnZdRkeIXI9v1hULLqIBsrHJgzZ37mG8rxy/PXuPh0oT8XfXJTraED
	 rrLo7czyOCF3qzRBLIfLrK6pIHYMACtZkAUx3gl8Fy0kQWExAc2xFy0iecQD/Lvfr0Ogu
	 cwZfBt6fxRDpwZIojPlzlxsoy8PA9dDsmEh/rq8MH6weIYnLXIoJ2UKC/mi8dnD8tj2PJ
	 tRSS37eD9aDzd8vxad5BgrJPLbkEgvuOD0Fg/jIMLdCzOX8baEzz77LRGKVRaUqC7tWI+
	 0gMDs3YkMsAlWVbjtmspb/LTxV9ZYxiKEnJfd7flDpPmLnHwbxncal0NyHsnfm5kKFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C10S4nxe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50593606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C10S4nxe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C571F000C4;
	Tue, 17 Nov 2026 03:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794887760;
	bh=JYCIs+rvASLufs1uPh16h3X4+qcoze7bD1Onp+AQ2aA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C10S4nxeoEvHc3K9Oc0K9Jk6kYo2A2aXSKN/EdJ5tBWfzHrqz2ibVRJEPxkbFmivY
	 N88oI38NwCZdyujOCJfTwUxwp/g8z85FYFU/I2ei6rAnXzZNILMzy/qaJOBZ/I4FDp
	 GTFWunTN058zEiLpt3JcjJ8SK4noGs2pfhI8hVsHCjHC6cZG1BDW4vUyMqhFoNAT7k
	 gxGnfnckS58SDRjbAQmCJLUtP6DjYsn44TbYrCjohaatPx5AuDt5SXhEeGGm9A0l/z
	 eo4L87h8qanvIu7lHqaIZfqddRlCeHA/kZrq8nrdDyHyyOuT2Uv0UVxKj4jOLBI+1z
	 dLu5GtBhfwdjg==
Message-ID: <sashiko-outbox-218172@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 02/14] media: mediatek: vcodec: add driver to support
 vcp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261117032950.1425556-3-kyrie.wu@mediatek.com>
References: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
 <20261117032950.1425556-3-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 03:55:59 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] media: mediatek: vcodec: missing VCP headers and MTK_VCP_RPROC
  Kconfig deps
- [High] media: mediatek: vcodec: 10000-iteration modprobe loop in
  mtk_vcodec_vcp_get_vcp_device()
- [High] media: vcodec: vcp: IPC desync and UAF on late ACK after
  ipi_send timeout
- [Medium] media: mediatek: vcodec: unlocked ipi_id_ack read and signal
  spin in mtk_vcodec_vcp_msg_ipi_send()
- [Medium] media: vcodec: vcp: broken -ERESTARTSYS retry and unlocked
  ipi_id_ack read
--

commit c713bc7fb9740ba11c4b6d799c501d0a787e9d1f
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: add driver to support vcp

This commit adds a VCP firmware interface for the MediaTek vcodec driver
and updates the firmware selection callbacks to support VCP alongside VPU
and SCP.

> diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig b/drivers/med=
ia/platform/mediatek/vcodec/Kconfig
> index bc8292232530b..d23dad5c78ce3 100644
> --- a/drivers/media/platform/mediatek/vcodec/Kconfig
> +++ b/drivers/media/platform/mediatek/vcodec/Kconfig
> @@ -1,4 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_MEDIATEK_VCODEC_VCP
> +	bool
> +
>  config VIDEO_MEDIATEK_VCODEC_SCP
>  	bool
> =20
> @@ -21,6 +24,7 @@ config VIDEO_MEDIATEK_VCODEC
>  	select V4L2_MEM2MEM_DEV
>  	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
>  	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
> +	select VIDEO_MEDIATEK_VCODEC_VCP if MTK_VCP_RPROC
>  	select V4L2_H264
>  	select V4L2_VP9
>  	select MEDIA_CONTROLLER

[ ... ]

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> new file mode 100644
> index 0000000000000..3b85ae0e632a8
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
Does this build when CONFIG_VIDEO_MEDIATEK_VCODEC_VCP is enabled?

Neither linux/remoteproc/mtk_vcp_public.h nor
linux/firmware/mediatek/mtk-vcp-ipc.h exists in the tree, leaving struct
mtk_vcp_device incomplete and symbols such as VDEC_FEATURE_ID,
vcp_get_ipidev(), mtk_vcp_ipc_send(), and mtk_vcp_get_by_phandle()
undeclared throughout mtk_vcodec_fw_vcp.c.

In addition, VIDEO_MEDIATEK_VCODEC still has:

  depends on VIDEO_MEDIATEK_VPU || MTK_SCP
  depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
  depends on MTK_SCP || !MTK_SCP

without MTK_VCP_RPROC.  On VCP-only platforms VIDEO_MEDIATEK_VCODEC cannot
be enabled, and a configuration with VIDEO_MEDIATEK_VCODEC=3Dy and
MTK_VCP_RPROC=3Dm builds mtk_vcodec_fw_vcp.o into the kernel image and fails
to link against modular MTK_VCP_RPROC symbols.

[ ... ]

> +static int mtk_vcodec_vcp_msg_process_thread(void *arg)
> +{
> +	struct mtk_vcodec_fw *fw =3D arg;
> +	struct vdec_vpu_ipi_ack *msg =3D NULL;
> +	struct mtk_vcp_share_obj *obj;
> +	struct mtk_vcp_msg_node *msg_node;
> +	vcp_ipi_handler_t handler;
> +	unsigned long flags;
> +	int ret =3D 0;
> +
> +	do {

[ ... ]

> +		handler(msg, obj->len, fw->vcp->ipi_desc[obj->id].priv);
> +		mtk_vcodec_vcp_ipi_unlock(fw->vcp, obj->id);
> +
> +		fw->vcp->msg_signaled[obj->id] =3D true;
> +		wake_up(&fw->vcp->msg_wq[obj->id]);
> +
> +		mtk_vcodec_vcp_free_msg_node(fw, msg_node);
> +	} while (!kthread_should_stop());
> +
> +	return ret;
> +}

[Severity: High]
Can a delayed firmware ACK after a timeout or signal in
mtk_vcodec_vcp_msg_ipi_send() cause a use-after-free and desynchronize
subsequent IPI waits?

CPU0                              CPU1 (vcp_vdec_msq_thread)
vdec_h264_slice_init()
  vpu_dec_init()
    mtk_vcodec_vcp_msg_ipi_send()
      wait_event_interruptible_timeout()
        --> times out or -ERESTARTSYS
      mutex_unlock(&vcp->ipi_mutex)
  kfree(inst)
                                  mtk_vcodec_vcp_msg_process_thread()
                                    vpu_dec_ipi_handler()
                                      vpu =3D (void *)msg->ap_inst_addr
                                      vpu->failure =3D -EINVAL  <-- use-aft=
er-free
                                    fw->vcp->msg_signaled[id] =3D true
                                    wake_up(&fw->vcp->msg_wq[id])

When mtk_vcodec_vcp_msg_ipi_send() times out or aborts on a signal, the
caller tears down and frees the codec instance while VCP is still
processing the request.  When the late ACK arrives, vpu_dec_ipi_handler()
still dereferences vpu->ctx and writes to vpu->failure and vpu->signaled
even when vpu_dec_check_ap_inst() fails.  mtk_vcodec_vcp_msg_process_thread=
()
then sets msg_signaled[obj->id] =3D true and wakes msg_wq[obj->id],
prematurely completing the next caller waiting on the same IPI ID.

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
> +		vcp->ipi_id_ack[id] =3D VCODEC_IPI_MSG_STATUS_FAIL;
> +	} else if (ret < 0) {
> +		dev_err(&fw->pdev->dev, "wait ipi ack fail ret %d %d\n", ret, vcp->ipi=
_id_ack[id]);
> +		vcp->ipi_id_ack[id] =3D VCODEC_IPI_MSG_STATUS_FAIL;
> +	}

[Severity: Medium]
Does jumping back to wait_ack on -ERESTARTSYS spin through all 5 retries
without sleeping?

Because the pending signal on current is not cleared before returning to
userspace, each retry of wait_event_interruptible_timeout() immediately
returns -ERESTARTSYS, aborting the wait with VCODEC_IPI_MSG_STATUS_FAIL
while the firmware command is still in flight.  Also, vcp->ipi_id_ack[id]
is read after mutex_unlock(&vcp->ipi_mutex) below, where a concurrent
caller can overwrite it before this function returns.

> +
> +	dev_dbg(&fw->pdev->dev, "receive message: id %d len %d data 0x%x\n",
> +		obj.id, obj.len, data[0]);
> +
> +	mutex_unlock(&vcp->ipi_mutex);
> +
> +	return vcp->ipi_id_ack[id];

[Severity: Medium]
Can a concurrent caller overwrite vcp->ipi_id_ack[id] after
mutex_unlock(&vcp->ipi_mutex) before it is read for the return value?

A second thread waiting on vcp->ipi_mutex can immediately acquire the lock
and reset vcp->ipi_id_ack[id] (for example to VCODEC_IPI_MSG_STATUS_OK or
-EINVAL) before the first thread returns, and the -ERESTARTSYS retry loop
above returns immediately on all 5 attempts while a signal remains pending
on current.

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
Does this loop invoke request_module("mtk-vcp") up to 10,001 times during
V4L2 device open() if the mtk-vcp driver is not available?

try_then_request_module() synchronously spawns /sbin/modprobe whenever
mtk_vcodec_vcp_driver_loaded() returns false.  Because
mtk_vcodec_vcp_get_vcp_device() is called from
mtk_vcodec_vcp_load_firmware() during fops_vcodec_open() while holding
dev->dev_mutex (rather than during probe like SCP and VPU), opening
/dev/videoX when mtk-vcp is absent spawns 10,001 modprobe processes and
blocks all V4L2 open and release calls for 10 to 20+ seconds before
returning -EPROBE_DEFER (which mtk_vcodec_vcp_load_firmware() then turns
into -EINVAL).  Furthermore, if the driver is unbound before open() is ever
called, fw->vcp->vcp_device is still NULL and mtk_vcodec_vcp_release() logs
a spurious error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117032950.1425=
556-1-kyrie.wu@mediatek.com?part=3D2
