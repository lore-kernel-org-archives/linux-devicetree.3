Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887596;
	b=0VBnrxPzCkhTUK7B+pexj9gOyZPeEQv+WN9frVBjqzq4hE+lSYIKH+8GrRgNtXGXDH30
	 GqeBlR01EeTERagfX8u34h5kW3SWHhPKyXERLQ+bz19yvGCBYeRXgP6DQCLlaGXnvasnx
	 5VE8KsiOWQDt61oYGLWqie+0ONfTN2roTQtMWVNYGVk7qxAenD/6bpdcCg2qHtuG2S1TQ
	 hbEoXzJykCQSBcCeLAsVdHuKaS44GQ3r3mvUH8/10CJ7C5GXSGL9CyTuTBXtc0PHobQo4
	 +fBkrsL4CM+iWZgskbpjjv6yY9hkHwJJXG6OUcCuA4+DebCwm1hsmOcdVAizHn+2evg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887596;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n9Ywp6KThLEffhUa4Ev+Bz23d29sLUyBrY7vcTocCwE=;
	b=N+BbBWia++6CEepHVm+VQmkOrLgQk6hfhvri/9rYO1uUhthOxMhmpQ3cMLG0H1kXaquw
	 OTP/45rtIVw9ZrM3z1/BncSOc/vRF2Ap7hRRZcFqvMFZiCZ0hpCD2RgCw/P0SrRpEQeEk
	 Au/mNZJQIWGv30fjadLpC3Wmjc1aqfnubk+2RvyUXAZ4KsonUBr5XNgmGF7gubM3iFcEA
	 aJz7BrfMwnMZ7424yCSe/iN6CVnu2OJ3RbH31J5F7ingEt4TdrlY17RJ2JXUwS47dphGR
	 xc3QMe7ej4FsyenFs8DFaOzHgw461msF0CVQVBOO3eLF6LMt6v9AZ0sBvu432fveOdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ET6Rh3bw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0CB606A32C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ET6Rh3bw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596501F000C5;
	Tue, 17 Nov 2026 03:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794887596;
	bh=n9Ywp6KThLEffhUa4Ev+Bz23d29sLUyBrY7vcTocCwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ET6Rh3bwWd/EUuDF/LTvAdjbNUAtBM/el/W7HOB7EDsmgCuKIkeBXENWHrNV1/FPa
	 wepNeP0/fMUwDTbfebpmhJHow5YhSyqjbPhS/ioR15AMOlCFgu9e00tlOq+HMA8Pzb
	 CoUK7XD5b8VpqwDnk3wVIS0U9hhifWksxp45v5gu9GoMprVLN2aU1GyYhE0c7BCLEY
	 XyzY69w08gI/FscAiNYdWaH9i46yVpQ+jlT7S9SsPXTS8dEgEDEgC0ujcKsXezB0Jk
	 BnUzV4Kbb77OMS0icxafP8079nnLrgotr604XF3y2WzVa9MlaCcF3XiY5bNde7gaW6
	 +z7A0oljLk5rA==
Message-ID: <sashiko-outbox-218168@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 03/14] media: mediatek: vcodec: add driver to support
 vcp encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261117032950.1425556-4-kyrie.wu@mediatek.com>
References: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
 <20261117032950.1425556-4-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 03:53:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] media: mediatek: vcodec: UAF in IPI handlers after VCP IPC
  timeout
--

commit e54823b0eef88187197f04023f2a3956ba3b46d7
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: add driver to support vcp encoder

This commit extends the VCP firmware interface driver to support the video
encoder by handling the encoder feature ID, memory ID, mailbox ID, and IPI
message queue thread.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> index 3b85ae0e632a8..5ec7a67b51b67 100644
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
Can a timeout or signal interruption in mtk_vcodec_vcp_msg_ipi_send() lead
to a use-after-free in vpu_enc_ipi_handler() and vpu_dec_ipi_handler()?

mtk_vcodec_vcp_msg_ipi_send() ignores its wait argument (2000 ms) and waits
with wait_event_interruptible_timeout() for 100 ms (IPI_TIMEOUT_MS), which
includes both VCP firmware response time and scheduling delay for
mtk_vcodec_vcp_msg_process_thread().  If a DEINIT IPI times out or is
interrupted by a signal during device close, h264_enc_deinit()
unconditionally frees inst (and fops_vcodec_release() frees ctx) while the
ACK is still in flight or queued:

drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:h264_enc=
_deinit() {
	...
	ret =3D vpu_enc_deinit(&inst->vpu_inst);

	if (inst->work_buf_allocated)
		h264_enc_free_work_buf(inst);

	kfree(inst);
	...
}

drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c:vpu_enc_ipi_ha=
ndler() {
	...
	mtk_venc_debug(vpu->ctx, "msg_id %x inst %p status %d", msg->msg_id, vpu, =
msg->status);
	if (!vpu_enc_check_ap_inst(enc_dev, vpu) || msg->msg_id < VPU_IPIMSG_ENC_I=
NIT_DONE ||
	    msg->msg_id > VPU_IPIMSG_ENC_DEINIT_DONE) {
		mtk_v4l2_venc_err(vpu->ctx, "venc msg id not correctly =3D> 0x%x", msg->m=
sg_id);
		vpu->failure =3D -EINVAL;
		goto error;
	}
	...
error:
	vpu->signaled =3D 1;
}

CPU0                                      vcp_enc_msq_thread
fops_vcodec_release()
  ...
  h264_enc_deinit()
    vpu_enc_deinit(&inst->vpu_inst)
      mtk_vcodec_vcp_msg_ipi_send()
        wait_event_interruptible_timeout()
        /* times out or -ERESTARTSYS */
    kfree(inst)
  kfree(ctx)
                                          mtk_vcodec_vcp_msg_process_thread=
()
                                            vpu_enc_ipi_handler()
                                              mtk_venc_debug(vpu->ctx, ...)
                                              vpu_enc_check_ap_inst() /* fa=
lse */
                                              mtk_v4l2_venc_err(vpu->ctx, .=
..)
                                              vpu->failure =3D -EINVAL;
                                              vpu->signaled =3D 1;  <-- use=
-after-free

When the delayed ACK is processed, vpu_enc_ipi_handler() dereferences
vpu->ctx before calling vpu_enc_check_ap_inst(), and both
vpu_enc_ipi_handler() and vpu_dec_ipi_handler() still dereference vpu->ctx
and write to vpu->failure and vpu->signaled after the instance check fails.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117032950.1425=
556-1-kyrie.wu@mediatek.com?part=3D3
