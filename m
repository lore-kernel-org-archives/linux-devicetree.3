Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADA03264F9
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 09:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791622803; cv=none; b=rFfluTlJE8KWJ6l/URGcgZmgJ+cRZERJdKBbEMEjxa/mV/T7s6ufpvGJ/gqx7+fzPEJNQ9bJUmiQjLYQNy5DmqMiXF9OodQwQUYAa8gCpMrq/jFfxAFWMMCMtB2/97wlsrLWiLZ2R+suUgpOA8qNI+SUJSnDZTCio9SMVhJBpJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791622803; c=relaxed/simple;
	bh=GqWQRIZNtcS7VU674UKHA/0xVe7oSHjbAqfQoFINiMA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=p5ul8h/HSlpjgvAI+yJbH00zIuZB0DJnurJ1raiXbHndlb7PvYA2ifSJnhE5ZWIUl2f7UPooUZs6vMNazDz5qTNPZpmgVekGcbhuA16pW8Yua9FXr6j6GQlWbnhCFcMO/C5y6wC1sdi8o+LiXRPV5YmhYgV0w69z+ASYIc0AFjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HK0hZHVr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HK0hZHVr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F6C1F000FF;
	Sat, 10 Oct 2026 09:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791622801;
	bh=a+pc0Gix1v8Yzy+flzkkWQ0jRa+vwB4GPFdEWQg/q5k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HK0hZHVrF/i7c1sKgQH/Y1rxhtRurkuLPFmjHYt8yQQOsLijlGiCVc+zA8O190yib
	 vV1hH6hIShHidOAEU5Em7hveKkeKBHSWDgCoz9WpcJjPvPWqiVAglXu8PKVLV/Cd2r
	 IJquZ/Z/HY5eP3vQEht3oSFXR/Xjdko5ies9ufAmZeuWRCcuxtXYp0aqD0kZvT1pUG
	 yrKUzUbtgoVHQT/sZfpmCs0h0KvtC+pJlO0RE9Bf6DyvrMfUMoRfdyxQ+QQwObO5mz
	 DB43vVqtuQubuzK31H7X8/FTyTxKo4eUC6LDKxGf4tCL+nyBddZO8iJa5/rBHtLPlB
	 XVPIyMuGEPeLQ==
Message-ID: <sashiko-outbox-166385@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 03/14] media: mediatek: vcodec: add driver to support
 vcp encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <c2a0025b6962f96d8d05de5970863ef6329baf0e.1791619743.git.kyrie.wu@mediatek.com>
References: <cover.1791619742.git.kyrie.wu@mediatek.com>
 <c2a0025b6962f96d8d05de5970863ef6329baf0e.1791619743.git.kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 08:59:59 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] media: mtk_vcodec: encoder initialization fails due to unmapped IP=
I ID for VCP
- [High] media: mtk_vcodec: delayed ACK causes protocol desynchronization i=
n VCP IPC
- [High] media: vcodec: vcp encoder fails to initialize due to out-of-bound=
s ipi_id
- [High] media: mediatek: vcodec: UAF in IPI message handlers on device clo=
se due to IPC timeout
--

commit c1db7dc6cad08382fb97ce9b64a0f609116bfae6
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: add driver to support vcp encoder

This commit adds encoder support for the VCP interface to allow communicati=
on
between the encoder and VCP hardware.

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

[Severity: High]
Will this initialization succeed for encoders?

The encoder driver appears to initialize its ID to SCP_IPI_VENC_H264 (4)
or IPI_VENC_H264 (3), as seen in h264_enc_init():

    if (is_ext)
        inst->vpu_inst.id =3D SCP_IPI_VENC_H264;
    else
        inst->vpu_inst.id =3D IPI_VENC_H264;

However, earlier in mtk_vcodec_vcp_msg_ipi_send() and in=20
mtk_vcodec_vcp_ipi_register(), the code checks mtk_vcodec_vcp_ipi_id_valid(=
),
which strictly requires the ID to be less than VCP_IPI_MAX.

Since VCP_IPI_MAX is 3, these encoder IDs will always fail the validation
check, returning -EINVAL and preventing the VCP encoder from communicating.


[Severity: High]
Could a delayed ACK from the firmware cause memory corruption or state
desynchronization?

When waiting for an ACK later in mtk_vcodec_vcp_msg_ipi_send(), the function
uses a hardcoded 100ms timeout and relies on a shared boolean:

wait_ack:
    ret =3D wait_event_interruptible_timeout(*msg_wq, *msg_signaled,
                                           msecs_to_jiffies(IPI_TIMEOUT_MS)=
);

If the firmware takes longer than 100ms to reply, the wait times out
and returns an error. However, the firmware might still process the message
and send the ACK later.

This appears to lead to two potential issues:

1. If the timeout occurs during device teardown, such as when sending a
DEINIT message before closing the device, the driver proceeds to free
the instance via kfree(inst). When the delayed ACK eventually arrives,
the asynchronous message thread calls the IPI handler:

vpu_enc_ipi_handler()
    vpu =3D (struct venc_vpu_inst *)(unsigned long)msg->venc_inst;
    mtk_venc_debug(vpu->ctx, ...);

The handler extracts the freed instance from the message and dereferences
vpu->ctx, resulting in a use-after-free.

2. Because there are no sequence numbers matching ACKs to requests, a
delayed ACK could arrive during a subsequent message on the same ID.
The new message resets the shared flag and waits, but the delayed ACK
from the previous message would immediately wake it up prematurely,
desynchronizing the state between the driver and the firmware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791619742.gi=
t.kyrie.wu@mediatek.com?part=3D3
