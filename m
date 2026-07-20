Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2822D126BF7
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784511420; cv=none; b=CEf/v9l1rrmHllLe50nPdnifUFtXpIgo9eM0FwqOJPAaVQbqrDK7AKJNCJToFKY/fAOHxEwB2YiAAiNgX1US0bEAYNKkmzHT9HIPBR0sjbJd9R5wiFeNNhA7aTKNve11KMeBOQ6QaYvhIH36ryevSolVEk72E8nSRkcDIOeRQE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784511420; c=relaxed/simple;
	bh=E73+Vf9T9r4ZMOEbOIzUQLTAnPt2hCKcVK05jts4xAc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kEP/VZMU2vtIzsPfTsPqSrBX4HThKjg6o7n8uTQ0FFCMDasE4maqgAwr/H7UJWGS8pGLiv9te6Tb7bFJyA+qPINAdzDu6IwFqtAEQxjSEWLK1xSID7sZeEDnHALamzxAq5XY/fvEPha+CRiUkNuFVl4TIxKzzKUhoUVJWMHz3Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SB8mfvRJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SB8mfvRJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874B81F000E9;
	Mon, 20 Jul 2026 01:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784511418;
	bh=wNOoAPM9ASXpDqieUceW7LxY9Jsom/jJftRplHB47X4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SB8mfvRJhTs7DAU/BN34QnjQ8OKay+KYP71sjASN4x4FCdIqMzzkWTa3/wXiOuhSk
	 gw3w3m1NOWp4AKkWJ3aQXayK4AoltTWR65Fb6yjwyzT6YuG4n9P09SL1Lbgp0cudzn
	 2NxvULWRRTwQSGFgtTZFPnCoz/Co37UcNDSRrUepYJgts5xrEHmJcPpEpfu0yk0WO1
	 oPFLto73+iN3YrnmL7DFbSQ83KFAasgqVAExMf2RtfGMSrKIc8j2rWeewqOQBkIUkC
	 aLj4TEXU2B9/BXyMs23ml0VkHWUl6mTeF88DXoemwyDcfDNMWM7IdzB5yGq48Dz8ZJ
	 cfgjS8mLhKq5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/14] media: mediatek: vcodec: add driver to support
 vcp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260720012056.1026551-3-kyrie.wu@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
 <20260720012056.1026551-3-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 01:36:58 +0000
Message-Id: <20260720013658.874B81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Destructive `request_module` polling loop causes a massive modprob=
e fork bomb and breaks deferred probe.
- [High] A timeout in `mtk_vcodec_vcp_msg_ipi_send()` leaves the system vul=
nerable to late ACKs, causing host-firmware state desynchronization.
- [High] `ipi_mutex` serializes the entire `wait_event_interruptible_timeou=
t()`, breaking IPI concurrency and risking deadlocks.
- [Medium] Early return in `mtk_vcodec_vcp_release()` leaks remoteproc devi=
ce reference and breaks teardown state.
- [Medium] Missing IPC message length validation enables potential out-of-b=
ounds reads from untrusted firmware.
- [Low] Unused variable `fw_type` in encoder and decoder probe functions.
--

--- Patch [2]: [PATCH v6 02/14] media: mediatek: vcodec: add driver to supp=
ort vcp ---
commit 06d72e77d54f36511b46df20abe564b636b8dc79
Author: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: media: mediatek: vcodec: add driver to support vcp

This patch changes the processor from scp to vcp for the mt8196 platform.
It adds a new firmware interface to handle communication between the kernel
and the vcp.

> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
[ ... ]
> +static int mtk_vcodec_vcp_msg_process_thread(void *arg)
> +{
[ ... ]
> +		handler =3D fw->vcp->ipi_desc[obj->id].handler;
> +		if (!handler) {
> +			dev_err(&fw->pdev->dev, "invalid ack ipi handler id =3D %d\n", obj->i=
d);
> +			mtk_vcodec_vcp_ipi_unlock(fw->vcp, obj->id);
> +			mtk_vcodec_vcp_free_msg_node(fw, msg_node);
> +			continue;
> +		}
> +
> +		handler(msg, obj->len, fw->vcp->ipi_desc[obj->id].priv);

[Severity: Medium]
Could this pass an arbitrarily large length to the handler?
The firmware-provided obj->len does not appear to be validated against the
boundaries of VCP_SHARE_BUF_SIZE (64 bytes). If the firmware provides an
out-of-bounds length, it might lead to out-of-bounds reads in the receiving
handlers.

> +		mtk_vcodec_vcp_ipi_unlock(fw->vcp, obj->id);
[ ... ]
> +static int mtk_vcodec_vcp_msg_ipi_send(struct mtk_vcodec_fw *fw, int id,=
 void *buf,
> +				       unsigned int len, unsigned int wait)
> +{
[ ... ]
> +	mutex_lock(&vcp->ipi_mutex);
> +	feature_id =3D VDEC_FEATURE_ID;
> +	mailbox_id =3D IPI_OUT_VDEC_1;
[ ... ]
> +wait_ack:
> +	/* wait for VCP's ACK */
> +	ret =3D wait_event_interruptible_timeout(*msg_wq, *msg_signaled,
> +					       msecs_to_jiffies(IPI_TIMEOUT_MS));

[Severity: High]
Does holding ipi_mutex across this sleep serialize all VCP communication?
Acquiring the mutex before sending the IPC message and holding it while
waiting for the ACK seems to single-thread all communication, which might
defeat the purpose of the per-ID waitqueues.

Also, if any registered IPI handler executing in the receiving msg_thread
needs to send a followup command via mtk_vcodec_vcp_msg_ipi_send(), could
it deadlock trying to acquire ipi_mutex while this thread holds it?

> +	if (!ret) {
> +		vcp->ipi_id_ack[id] =3D VCODEC_IPI_MSG_STATUS_FAIL;
> +		dev_err(&fw->pdev->dev, "wait ipi ack timeout! %d %d\n", ret, vcp->ipi=
_id_ack[id]);

[Severity: High]
Can a timeout here lead to state desynchronization with the firmware?
If the wait times out, the function returns an error and releases ipi_mutex
without invalidating the transaction (e.g., via a sequence number).

If the firmware later completes the abandoned task and sends a delayed ACK,
msg_thread will set msg_signaled[id] =3D true and call wake_up(). If another
thread subsequently reuses this id for a new command, could it be premature=
ly
awakened by the stale ACK, causing the kernel to reuse or free memory buffe=
rs
while the firmware is still accessing them?

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
Could this polling loop cause a modprobe fork bomb?
If the mtk-vcp module is missing or unable to load, this loop executes up to
10,000 times, synchronously calling request_module() on each iteration. This
will spawn an excessive number of user-space modprobe processes.

[ ... ]
> +static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
> +{
[ ... ]
> +	if (mtk_vcodec_vcp_get_vcp_device(fw) < 0) {
> +		dev_err(&fw->pdev->dev, "vcp device is null.\n");
> +		return -EINVAL;
> +	}

[Severity: High]
Is it intentional to overwrite the -EPROBE_DEFER return value from
mtk_vcodec_vcp_get_vcp_device() with -EINVAL here? This will permanently
break the deferred probe mechanism for this device if the module is simply
not loaded yet.

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
Will this early return leak the remoteproc device reference?
If deregister_feature fails, returning early skips mtk_vcodec_vcp_put_devic=
e(),
which leaves the rproc reference elevated and prevents the remoteproc module
from being cleanly unloaded.

> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
[ ... ]
> @@ -376,19 +376,22 @@ static int mtk_vcodec_probe(struct platform_device =
*pdev)
>  	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
>  				  &rproc_phandle)) {
>  		fw_type =3D VPU;
> +		dev->fw_init =3D mtk_vcodec_fw_vpu_init;
>  	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
>  					 &rproc_phandle)) {
>  		fw_type =3D SCP;
> +		dev->fw_init =3D mtk_vcodec_fw_scp_init;
>  	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vcp",
>  					 &rproc_phandle)) {
>  		fw_type =3D VCP;
> +		dev->fw_init =3D mtk_vcodec_fw_vcp_init;
>  	} else {

[Severity: Low]
It looks like the fw_type variable is assigned here, but is never used anyw=
here
else in the function since the firmware selection was refactored to use
fw_init. Is there any remaining need for fw_type?

> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
[ ... ]
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

[Severity: Low]
Similarly, fw_type appears to be dead code here as well, since it is no lon=
ger
passed to mtk_vcodec_fw_select().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720012056.1026=
551-1-kyrie.wu@mediatek.com?part=3D2
