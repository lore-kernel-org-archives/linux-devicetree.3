Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99D21DFFB
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132264; cv=none; b=qrKTZvev9WS9MC5OFyOWhs51Jd8IdS5pBnnBbH1LARvRbDMOQndCcJaSAJivtUp6beiBTVKoSN7+y8TLb0BxXlGtIcPLc/X780d/fdyHvO9G9GGm0rOumnAsfbXtyV8FQUM+1XCBpJcm9kmBQRLAwlT90YtrjqHOZs4gj6d8HpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132264; c=relaxed/simple;
	bh=S/svtYV54ueWsudVNS8ZP2Xx/NDVGUMXQ4fekdsqPNk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q5dWSwppCJzP4Za6O3ZwRQlkii7a63bZkCqURh6oM3GDtekTdKdULRxnbwRYDnixu21HjaovCwGE3dkSliXh3IqtKUuqkPV2HIiMizkgzIaWycbdEwjXKLVXVnSrxmUuZ3BXal4Ur0iBQjmEpswHescuJ642urDiXwcFo3FfT8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=awFxy++P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awFxy++P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9A11F000FF;
	Wed, 23 Sep 2026 02:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790132262;
	bh=jFv8DvY18O8xitiz3OCMRhgE85AbzPmPzmfBmJ9mEKo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=awFxy++PlGxBY6Gq2XOw7x03A9XjiVCSk5C3nKlJ9OIh+r3GPsoOGUkkwZWu3CqUA
	 10uWrwg6GuWvP2OupDOJQXCKZp9+RtS22eVYMFvcwGLjEgrXQV306q6C+cIYIlMTmc
	 72P29icAi4cdZ8jmJ0la7DeeWuAhARVWB9TM1pRXtgsGA9shDbiJss575awYaVtyhC
	 KxQ1wr3ZQy2wclP6tZWaZ1CxEN78ZW2ay2p982H1odKEXaOz3yyShWdl852D0DktHY
	 5BpQHLTRqx/Fu0LPkRf3Ko7DIumj4h/wfKm/FtLj/5pXBrE6gUv8RcWnn3/s+JCYXv
	 0UREQBEm2M4+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 02/14] media: mediatek: vcodec: add driver to support
 vcp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260923024258.257846-3-kyrie.wu@mediatek.com>
References: <20260923024258.257846-1-kyrie.wu@mediatek.com>
 <20260923024258.257846-3-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 02:57:41 +0000
Message-Id: <20260923025742.1D9A11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] media: mediatek: vcodec: CPU lockup due to unhandled signal in wai=
t_event_interruptible
- [High] media: mediatek: vcodec: modprobe fork bomb DoS in vcp device poll=
ing
- [High] media: mediatek: vcodec: Use-After-Free and state desynchronizatio=
n on IPI timeout
- [High] media: mediatek: vcodec: rproc reference leak on vcp deregister fa=
ilure
- [Medium] media: mediatek: vcodec: build failure due to missing MTK_VCP_RP=
ROC module dependency
- [Medium] media: mediatek: vcodec: compilation error due to undeclared VCP=
_SYNC_TIMEOUT_MS
--

commit d524a6ee370f9efe82015b1c8256b28c7fb3bc55
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: add driver to support vcp
   =20
The processor is changed from scp to vcp in mt8196 platform.
Adding new firmware interface to communicate kernel with vcp
for the communication method is changed.

> diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig b/drivers/med=
ia/platform/mediatek/vcodec/Kconfig
> index bc8292232530b..d23dad5c78ce3 100644
> --- a/drivers/media/platform/mediatek/vcodec/Kconfig
> +++ b/drivers/media/platform/mediatek/vcodec/Kconfig
[ ... ]
> @@ -21,6 +24,7 @@ config VIDEO_MEDIATEK_VCODEC
>  	select V4L2_MEM2MEM_DEV
>  	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
>  	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
> +	select VIDEO_MEDIATEK_VCODEC_VCP if MTK_VCP_RPROC

[Severity: Medium]
Will this cause a link failure if VIDEO_MEDIATEK_VCODEC is built-in (=3Dy) =
and
MTK_VCP_RPROC is a module (=3Dm)? Because this select statement doesn't
enforce a modular state dependency, mtk_vcodec_fw_vcp.c could be built-in
while attempting to call exported symbols from the MTK_VCP_RPROC module.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> new file mode 100644
> index 0000000000000..150d842c7d226
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
[ ... ]
> @@ -0,0 +1,571 @@
[ ... ]
> +static int mtk_vcodec_vcp_msg_process_thread(void *arg)
> +{
[ ... ]
> +	do {
> +		ret =3D wait_event_interruptible(fw->vcp->msg_queue.wq,
> +					       atomic_read(&fw->vcp->msg_queue.cnt) > 0 ||
> +					       kthread_should_stop());
> +		if (ret < 0) {
> +			dev_err(&fw->pdev->dev, "wait msg queue ack timeout %d %d\n",
> +				ret, atomic_read(&fw->vcp->msg_queue.cnt));
> +			continue;

[Severity: High]
Could this lead to an infinite busy loop if a signal is delivered to the
kthread? When wait_event_interruptible() returns -ERESTARTSYS due to a
pending signal, the continue statement immediately restarts the loop. Since
the signal is never cleared, it seems this will continuously spin and lock =
up
the CPU.

> +		}
[ ... ]
> +		handler(msg, obj->len, fw->vcp->ipi_desc[obj->id].priv);
> +		mtk_vcodec_vcp_ipi_unlock(fw->vcp, obj->id);
> +
> +		fw->vcp->msg_signaled[obj->id] =3D true;
> +		wake_up(&fw->vcp->msg_wq[obj->id]);

[Severity: High]
Is it possible that this accesses freed memory if the original request timed
out? In mtk_vcodec_vcp_msg_ipi_send(), if the wait for msg_wq times out,
it returns an error to the caller, which might free the associated context.
When the delayed ACK finally arrives, this handler could dereference the
freed context or wake up a completely new request reusing the same ID.

> +
> +		mtk_vcodec_vcp_free_msg_node(fw, msg_node);
> +	} while (!kthread_should_stop());
> +
> +	return ret;
> +}
[ ... ]
> +static int mtk_vcodec_vcp_msg_ipi_send(struct mtk_vcodec_fw *fw, int id,=
 void *buf,
> +				       unsigned int len, unsigned int wait)
> +{
[ ... ]
> +	mutex_lock(&vcp->ipi_mutex);
> +	feature_id =3D VDEC_FEATURE_ID;
> +	mailbox_id =3D IPI_OUT_VDEC_1;
> +
> +	timeout_jiffies =3D jiffies + msecs_to_jiffies(VCP_SYNC_TIMEOUT_MS);

[Severity: Medium]
Will this cause a compilation error? VCP_SYNC_TIMEOUT_MS doesn't seem to be
defined anywhere in this patch or the kernel tree.

> +	while (!vcp_device->ops->vcp_is_ready(vcp_device, feature_id)) {
[ ... ]
> +wait_ack:
> +	/* wait for VCP's ACK */
> +	ret =3D wait_event_interruptible_timeout(*msg_wq, *msg_signaled,
> +					       msecs_to_jiffies(IPI_TIMEOUT_MS));
> +	if (!ret) {
> +		vcp->ipi_id_ack[id] =3D VCODEC_IPI_MSG_STATUS_FAIL;
> +		dev_err(&fw->pdev->dev, "wait ipi ack timeout! %d %d\n", ret, vcp->ipi=
_id_ack[id]);

[Severity: High]
As mentioned above regarding mtk_vcodec_vcp_msg_process_thread(), when this
timeout is reached, the hardware transaction appears to remain pending. Does
this leave the firmware state desynchronized and risk memory corruption when
the delayed ACK eventually arrives?

> +	} else if (ret =3D=3D -ERESTARTSYS) {
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
Could this loop result in a modprobe fork bomb? try_then_request_module()
invokes the userspace modprobe helper. If the module is genuinely missing or
fails to load, this loops 10,000 times, potentially spawning 10,000 modprobe
processes over 15 seconds, exhausting system resources.

> +
> +	if (of_property_read_u32(dev->of_node, "mediatek,vcp", &vcp_phandle)) {
[ ... ]
> +static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
> +{
[ ... ]
> +	if (!fw->vcp->is_register_done) {
> +		fw->vcp->is_init_done =3D false;
> +		goto put_device;
> +	}
> +
> +	ret =3D vcp_device->ops->deregister_feature(vcp_device, fw->vcp->featur=
e_id);
> +	if (ret < 0) {
> +		dev_err(dev, "deregister feature_id(%d) fail(%d)\n", fw->vcp->feature_=
id, ret);
> +		return;

[Severity: High]
Does this early return cause a leak of the rproc reference count? Returning
here bypasses the put_device label and skips mtk_vcodec_vcp_put_device(),
which would prevent the module from ever being unloaded if deregistration
fails.

> +	}
> +
> +	fw->vcp->is_register_done =3D false;
> +	fw->vcp->is_init_done =3D false;
> +
> +put_device:
> +	mtk_vcodec_vcp_put_device(fw);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923024258.2578=
46-1-kyrie.wu@mediatek.com?part=3D2
