Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C621A2C0B
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784511960; cv=none; b=TEDv8Sn2rM9ISfwf819eTccP7qDkiXxXhxz9FQySNKGoYhwseLK8l+vUlhMK/SObyM24x8UQTuV5OYNchCdqfeDZ1A3tpufex9VWOC0bfbJFOsXsE4BYFkSKDXqsed5O9qK086Hp9BnrINRgK/fG+x3lgPeLk/3pYpAFUHajk1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784511960; c=relaxed/simple;
	bh=IW3DzLpo7uqOJ1dt/5Pvq4h0cI1wmKpfJqcE/jH+W/0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=drIEwemD7UOq1Rl5J6/lS4HWs5O8vwFsYCPHiA2lS3P/kEt6zwqx3f0VgIWrokhagAe/uEWKiD/iMZOpavbpv4gNP+qZL7560E7IxP9u5wxkQ1Vo1kO3mEqsqfbHq3BTp0zhZ8KkQYQhVgEhDhBVUQ7OytIaSm3dAcvSDJ66E3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICqGox7a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICqGox7a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AFA41F000E9;
	Mon, 20 Jul 2026 01:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784511959;
	bh=ye9/NOnM4M1jq+e/zgGe2A8blQpn4MEhKwT1ZtX0kHc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ICqGox7acLJs/3a7zPh9Re0uPi9RxvFNeCsI4WBvneLzMilaaPEof5EYit39OUc4N
	 ruVh2Pp5u2DfHZ2V/jJWGJAP5o/ndhOjSG9xx17WGyQJc2VQ9qmhEVy7iluTMUOkb8
	 SGzTkvFkeeUAvk40u50q/QUCfOeDzC0o9U36t0PuYMXLeho8qB8GPTxvsB8JyUtcQ9
	 EQF6ndEFOSIJvXz5tXcK0x9WBu5A3fLXy3MfrztG2aTU8fq/37Vmcd0cIZSBcIj24o
	 IkfiuGg9FI470SUVumJlbzgoKxz+A0D/AKPh4NdUHDzao7VjwK3CnUTsF3Uu10d16N
	 FxDn22OtMCqAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/14] media: mediatek: vcodec: add driver to support
 vcp encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720012056.1026551-4-kyrie.wu@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
 <20260720012056.1026551-4-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 01:45:58 +0000
Message-Id: <20260720014559.0AFA41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing `.get_venc_capa` callback in `mtk_vcodec_vcp_msg` causes a=
 guaranteed kernel panic on encoder device open.
- [High] Late IPI acknowledgments from the firmware can falsely satisfy sub=
sequent IPI requests after a timeout, leading to data corruption or desynch=
ronization.
- [Medium] Early return on `deregister_feature` failure leaks the `rproc` r=
emote processor reference.
--

--- Patch [3]: [PATCH v6 03/14] media: mediatek: vcodec: add driver to supp=
ort vcp encoder ---
commit 9d12e27cbb34067860fe1673f4f8bfcc5549ebf1
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: add driver to support vcp encoder

This patch adds VCP encoder support to the mediatek vcodec driver. It enabl=
es
the encoder to call the VCP interface to communicate with the coprocessor.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> index 150d842c7d226..ece4e3e87e62d 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
[ ... ]
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
> =20
>  	timeout_jiffies =3D jiffies + msecs_to_jiffies(VCP_SYNC_TIMEOUT_MS);
>  	while (!vcp_device->ops->vcp_is_ready(vcp_device, feature_id)) {

[Severity: High]
Can late IPI acknowledgments from the firmware falsely satisfy subsequent I=
PI
requests after a timeout?

If wait_event_interruptible_timeout() in mtk_vcodec_vcp_msg_ipi_send() times
out, it aborts and unlocks the IPI mutex. If a new request is submitted reu=
sing
the same ID, and the firmware finally sends a delayed ACK for the original
timed-out request, the background msg_thread could blindly accept it:

mtk_vcodec_vcp_msg_process_thread() {
    ...
    fw->vcp->msg_signaled[obj->id] =3D true;
    wake_up(&fw->vcp->msg_wq[obj->id]);
    ...
}

Would this cause the new request to immediately return success while reading
stale responses belonging to the timed-out request, leading to protocol
desynchronization?

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
Does this patch miss implementing the get_venc_capa callback in the
mtk_vcodec_vcp_msg operations struct?

When the V4L2 encoder device is opened, fops_vcodec_open() unconditionally
calls mtk_vcodec_fw_get_venc_capa(), which attempts to dereference:

mtk_vcodec_fw_get_venc_capa() {
    return fw->ops->get_venc_capa(fw);
}

If the mtk_vcodec_vcp_msg struct does not have this callback registered,
could this result in a NULL pointer dereference when a userspace application
opens the encoder video device node?

[Severity: Medium]
In mtk_vcodec_vcp_release(), if the coprocessor's deregister_feature operat=
ion
fails, the function emits an error and returns early:

mtk_vcodec_vcp_release() {
    ...
    ret =3D vcp_device->ops->deregister_feature(vcp_device, fw->vcp->featur=
e_id);
    if (ret < 0) {
        dev_err(dev, "deregister feature_id(%d) fail(%d)\n", fw->vcp->featu=
re_id, ret);
        return;
    }
    ...
}

Will this early return skip the put_device label that calls
mtk_vcodec_vcp_put_device(), leading to a leaked rproc reference since
rproc_put() would be bypassed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720012056.1026=
551-1-kyrie.wu@mediatek.com?part=3D3
