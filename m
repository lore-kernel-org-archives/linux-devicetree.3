Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792770486;
	b=idJFwsyg0bV+nxqc9wA2jejW5IuXzyDK/hYmjmuFGCKex3XYyMh1H+rM2v25xLvOveHH
	 ax0u4pvue4E/3eMTSQI5efRJjRW8x8dFntnlZRJYq2GOwG1Xdf1QUT/05ZRUp5goz2vpB
	 lseCgy9GbpWy9XPW/9S3mTV2SmnoOfjSSzAxhsdfJhaNhWi1PQMMjn+5AQK/3iXD78RC8
	 mqCJk3EkBB0wqQSxTsg3Pv7duu7WVz7yLM2rerE9U0l8k3vGfyQ5B/PiJb5U/5fEOh8Cb
	 Bvxju+9dmcgS42IZV1LCwGaEdDQsYVNwWuB19MK7r1GwpDeQpnCWpIvpY26iMjtzCLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770486;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=V4i2Lc7pbZ5OVv4PHb4ts+cE3NYD0qCWt6o3oY78o/I=;
	b=aX2/rRSAQrhtAxsvQQYo8apHu1hkHxXUVLnZMvP/D2T3/yFqVEgtokuYVEP4wCGAQZJF
	 Bitgfn/ceD4DCsq+LZfiBXFQu3iOuFROi3iETxKM3wmHNFjaA3ztntoH6MmeQ5b+BUD8B
	 Y6qMEhMySHdNxC53H4OUM3XzDJTErQk7AXaWn9Wjy+LW26BFm8++CTcfer7xQ0BAmEDLl
	 IZbtLfaHIxpUXwrb4kVWZK1FBWK/kPhGdObg45CWgfocCfr9PWxKvIuyYi5qtBbQTSzcN
	 TZQaZHywJNhxtXDuPwDvyaaCukBMwqpE6Ol51YefDz6/qYr/xjUp4gTSZUjUn56UKEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=luD5HMdF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA11606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=luD5HMdF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34ED1F01825;
	Fri, 23 Oct 2026 15:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792770486;
	bh=V4i2Lc7pbZ5OVv4PHb4ts+cE3NYD0qCWt6o3oY78o/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=luD5HMdFylgRhn8J0X1vyxYSUwcZvsy9wrWQOpFPfwO8QcrVPxsWKru7yHeTDJ0uy
	 1Kn5LZQwP9HCxw1OFRTUwZBv9m+UtXJqiGOh6AP3a0sRpWywb3KERKNbVrJmFHyLcZ
	 rbBtO8HyABWEQX9vQu2gkUW073EhvFPKlDhf219YPT37eIJkvjVeAn6FrVnf9WnlFZ
	 XBtcsiBdOi9KotfMKzv+1qY7hoUflAstT7SrligjHeoOBHdQIrhydzw2+NQbdzF4Qd
	 /lxJV+ewqQFtkheOhLSlgCrojXJGx/fraOR9Bd96klsfFJzq2Npbz4GUZuoZj5+EXH
	 ATp4Lowtb7Qmg==
Message-ID: <sashiko-outbox-182924@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 7/9] arm64: dts: qcom: agatti: Add OPE node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261023-camss-isp-ope-v11-7-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
 <20261023-camss-isp-ope-v11-7-0c2937195298@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 15:48:05 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: qcom: camss: premature job scheduling in ope_job_ready()
--

commit aa471928bbc1acb687daa92f09cbfa25620a5f39
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

arm64: dts: qcom: agatti: Add OPE node

This commit adds and enables the Offline Processing Engine (OPE) device tree
node for the QCM2290 (Agatti) platform, describing its register regions,
clocks, interrupt, interconnects, IOMMU mappings, power domains, and OPP
table.

> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/q=
com/agatti.dtsi
> index 590bd2432d85b..69237959adc15 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -1984,6 +1984,83 @@ port@1 {
>  			};
>  		};
> =20
> +		isp_ope: isp@5c42000 {
> +			compatible =3D "qcom,qcm2290-camss-ope";

[Severity: High]
Enabling isp_ope exposes the qcom-camss-ope driver added in this series. Can
ope_job_ready() in drivers/media/platform/qcom/camss/ope/core.c schedule ha=
rdware
DMA before ope_start_streaming() has validated the pipeline on the capture
queue?

In drivers/media/platform/qcom/camss/ope/core.c, ope_job_ready() checks only
ctx->started (which is set when OPE_QUEUE_FRAME_IN starts streaming) and
whether the input and output rdy_queue lists are non-empty:

drivers/media/platform/qcom/camss/ope/core.c:ope_job_ready() {
	struct ope_ctx *ctx =3D priv;

	guard(spinlock_irqsave)(&ctx->queues_lock);

	return ctx->started &&
	       !list_empty(&ctx->queues[OPE_QUEUE_FRAME_IN].rdy_queue) &&
	       !list_empty(&ctx->queues[OPE_QUEUE_DISP_OUT].rdy_queue);
}

When OPE_QUEUE_FRAME_IN is already streaming with a queued input buffer and
userspace pre-queues a capture buffer on OPE_QUEUE_DISP_OUT before calling
VIDIOC_STREAMON, vb2_start_streaming() passes the pre-queued capture buffer=
 to
ope_buf_queue() prior to calling ope_start_streaming():

vb2_start_streaming()
  -> ope_buf_queue()
       -> list_add_tail(&buf->list, &ctx->queues[idx].rdy_queue);
       -> ope_try_schedule(ctx)
            -> ope_job_ready(ctx) /* returns true */
            -> schedule_work(&ope->run_work)

Because ope_run_work() runs asynchronously without holding ctx->vbq_lock,
ope_run_job() can start hardware DMA into the capture buffer before
ope_start_streaming() on OPE_QUEUE_DISP_OUT runs
video_device_pipeline_alloc_start() (including ope_disp_output_link_validat=
e())
or pm_runtime_resume_and_get().

If video_device_pipeline_alloc_start() or pm_runtime_resume_and_get() then
fails in ope_start_streaming(), the error path drains rdy_queue without
canceling the scheduled or running job:

drivers/media/platform/qcom/camss/ope/core.c:ope_start_streaming() {
...
err_pipeline_stop:
	video_device_pipeline_stop(vdev);
err_drain:
	ope_queue_drain(ctx, idx, VB2_BUF_STATE_QUEUED);
	return ret;
}

Wouldn't this return the capture buffer to VB2_BUF_STATE_QUEUED while the O=
PE
hardware is actively DMA-writing to it, or trigger
WARN_ON(!list_empty(&q->done_list)) in vb2_start_streaming() if
ope_job_finish() already completed the buffer?

Should ope_job_ready() require both OPE_QUEUE_FRAME_IN and OPE_QUEUE_DISP_O=
UT
to have completed ope_start_streaming() before returning true?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-camss-isp-=
ope-v11-0-0c2937195298@oss.qualcomm.com?part=3D7
