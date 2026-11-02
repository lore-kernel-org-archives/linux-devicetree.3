Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639811;
	b=ucUEeMZLkzYZyax4CTUU99QKybWn7TZDrSH8ntUyrdrk0tyjxFIloCKJft02p2bkhNiW
	 8sRxuOsLJ2PnUeFOjQLZgIE3v2NbJB0WY4wjaUCo+cCpiwQRr4r7/SDiIfzlybBqoWUIp
	 kL26jBO2vhR+UkpcqN46hcq7gK+cnud6IDhOp4lQjwBHw9uZ7uIxaRYJWQ+AcBsJad9hs
	 x/M48of04lQfRR7r8Pim2dRwbHlLxuXtHYY7Qk0sKyGt411lPhknsTHLf/+PgmMgMD9IE
	 9gOvRMrs71SA2lamDTvmdXRzdl3duDFbO0EyhfCn5sPhxtEvwmVBv9uWHU4YZWhqJZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639811;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DL6eWlq15EKPr/TYScc900w62Ml/3uJ7lKLaTqSBLI8=;
	b=Yr2EJNfo6yHdOAs2T9unqEufuzK+Pws6IYUqHH+5Coq4XBKGEhb6jkl40UL9uuYhnbLt
	 dcKyqCI5NMcPBB58Dfy8qqUMahlyyDOhlbbah+3uJlqX10NWPnmn0EhkPL89ZH07nDUq9
	 cw/nQ/CdWAwFmOSLoS4cuMCZ/Qsw/mTXQOaej1t1GuCkKE2bU9FwOVtfLiyGpVxkxG56U
	 XH9vyXU7VWc/mGKiZQeZ/eo2PLvoaNnyBgiLrLMezNBpMVYLV2Jg1dL+zeo4wxS85DR6W
	 +/R6pq+qxmhLc4+HeCJH2jAiZ/b7b6yqzhpXcrPyJFC2K2+Bz6KHWwMCzECbNwpvkNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UBNdxZNF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E8C6072C4C
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UBNdxZNF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963C61F00A16;
	Mon,  2 Nov 2026 17:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793639810;
	bh=DL6eWlq15EKPr/TYScc900w62Ml/3uJ7lKLaTqSBLI8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UBNdxZNF0/nvAXDJ9wpbTR13bTPY0Z/F9Gmbo2NHORKlfj1jWSy1HzmkHaldlMYDN
	 kYTdHgeFB4mXNLyM/ARKtKaKKPZn279QnerITZlfUkHAgK8gMxqRaEONF2tSZOuDMe
	 TeebFujuT6CHkB9bim4naeMPWh8LZBnE/qA8MrfZRwG6onuiLjyP4WwFgc3BBrKtiO
	 3OQ0NLnn/v3u7z2rYhS5fSdPtcsNgz1CGzZPWqDlPWUZvuzageZVZv854Rtsp/dbSj
	 IzWbQFHK1Ck4XcnnP1x+uIqeSt4jIsc+QA4vWiJ8pA0ZQPQeFkrjy5ActgRjEvXmAL
	 ffEjxWUxJmgSQ==
Message-ID: <sashiko-outbox-193815@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 7/9] arm64: dts: qcom: agatti: Add OPE node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261102-camss-isp-ope-v12-7-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
 <20261102-camss-isp-ope-v12-7-702254689feb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 17:16:50 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: qcom: camss: premature job scheduling in ope_job_ready()
- [Medium] arm64: dts: qcom: agatti: duplicate OPE SMMU stream IDs in camss=
 and isp_ope
--

commit 0107815e7961692e1726c48663af675e73445331
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

arm64: dts: qcom: agatti: Add OPE node

This commit adds and enables the Offline Processing Engine (OPE) device tree
node (isp@5c42000) for the Agatti (QCM2290) platform, describing its regist=
er
regions, clocks, interrupt, interconnects, IOMMU stream IDs, power domains,
and OPP table.

> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/q=
com/agatti.dtsi
> index d9f4cbfd2861c..8f2b451b8f6e8 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -1990,6 +1990,83 @@ port@1 {
>  			};
>  		};
> =20
> +		isp_ope: isp@5c42000 {
> +			compatible =3D "qcom,qcm2290-camss-ope";

[Severity: High]
As reported by Sashiko on v11 [1], enabling isp_ope exposes the
qcom,qcm2290-camss-ope driver (drivers/media/platform/qcom/camss/ope/core.c=
),
where ope_job_ready() only checks whether ctx->started (set by
OPE_QUEUE_FRAME_IN) is true and the frame input and display output rdy_queue
lists are non-empty:

drivers/media/platform/qcom/camss/ope/core.c:ope_job_ready() {
	struct ope_ctx *ctx =3D priv;

	guard(spinlock_irqsave)(&ctx->queues_lock);

	return ctx->started &&
	       !list_empty(&ctx->queues[OPE_QUEUE_FRAME_IN].rdy_queue) &&
	       !list_empty(&ctx->queues[OPE_QUEUE_DISP_OUT].rdy_queue);
}

When userspace starts streaming on ope_input (OPE_QUEUE_FRAME_IN) first so
ctx->started is true, and then pre-queues a capture buffer on
ope_disp_output (OPE_QUEUE_DISP_OUT) and calls VIDIOC_STREAMON,
vb2_start_streaming() passes the pre-queued buffer to ope_buf_queue() before
calling ope_start_streaming():

drivers/media/platform/qcom/camss/ope/core.c:ope_buf_queue() {
	...
	scoped_guard(spinlock_irqsave, &ctx->queues_lock)
		list_add_tail(&buf->list, &ctx->queues[idx].rdy_queue);

	ope_try_schedule(ctx);
}

Because ope_job_ready() does not check whether OPE_QUEUE_DISP_OUT has
completed ope_start_streaming(), ope_try_schedule() schedules ope->run_work
immediately and starts hardware DMA into the capture buffer before
ope_start_streaming() runs video_device_pipeline_alloc_start() (including
ope_disp_output_link_validate()) or pm_runtime_resume_and_get().

If video_device_pipeline_alloc_start() or pm_runtime_resume_and_get() fails
in ope_start_streaming(), the err_drain path calls ope_queue_drain() without
calling ope_sched_cancel():

drivers/media/platform/qcom/camss/ope/core.c:ope_start_streaming() {
	ret =3D video_device_pipeline_alloc_start(vdev);
	if (ret)
		goto err_drain;

	ret =3D pm_runtime_resume_and_get(ctx->ope->dev);
	if (ret) {
		dev_err(ctx->ope->dev, "resume failed (%d)\n", ret);
		goto err_pipeline_stop;
	}
	...
err_pipeline_stop:
	video_device_pipeline_stop(vdev);
err_drain:
	ope_queue_drain(ctx, idx, VB2_BUF_STATE_QUEUED);
	return ret;
}

Can this leave OPE hardware actively DMA-writing into a buffer returned to
VB2_BUF_STATE_QUEUED, or trigger WARN_ON(!list_empty(&q->done_list)) in
vb2_start_streaming() if ope_job_finish() has already completed the job?

In addition, because all three video nodes (ope_input, ope_disp_output, and
ope_params) share a connected media graph, starting ope_params
(OPE_QUEUE_PARAMS) or ope_disp_output (OPE_QUEUE_DISP_OUT) first runs
video_device_pipeline_alloc_start() -> __media_pipeline_start(), validating
links once and setting pipe->start_count =3D 1 while leaving ctx->started
false. While ctx->started is false, ope_state_is_busy() returns false:

drivers/media/platform/qcom/camss/ope/core.c:ope_state_is_busy() {
	...
	scoped_guard(spinlock, &ope->ctx_lock)
		list_for_each_entry(ctx, &ope->ctx_list, list)
			busy |=3D ctx->started;

	return busy;
}

Doesn't this allow userspace to modify active subdev formats/selections (via
ope_proc_set_fmt(), ope_proc_set_selection(), and ope_disp_set_fmt()) and
video node formats (via ope_s_fmt_vid_out() and ope_s_fmt_vid_cap()) after
link validation has already completed, since subsequent VIDIOC_STREAMON cal=
ls
on the remaining queues see pipe->start_count > 0 in
__media_pipeline_start() and skip re-validating links?

[ ... ]

> +			iommus =3D <&apps_smmu 0x800 0x0>,
> +				 <&apps_smmu 0x820 0x0>,
> +				 <&apps_smmu 0x840 0x0>;

[Severity: Medium]
In arch/arm64/boot/dts/qcom/agatti.dtsi, the existing camss node
(camss@5c11000) already lists the three OPE SMMU stream IDs (0x800, 0x820,
and 0x840) alongside VFE stream ID 0x400:

		camss: camss@5c11000 {
			compatible =3D "qcom,qcm2290-camss";
			...
			iommus =3D <&apps_smmu 0x400 0x0>,
				 <&apps_smmu 0x800 0x0>,
				 <&apps_smmu 0x820 0x0>,
				 <&apps_smmu 0x840 0x0>;

Adding isp_ope with the same 0x800, 0x820, and 0x840 stream IDs without
removing them from camss causes both devices to claim the same stream mappi=
ng
entries when camss is enabled (such as via
arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso).

In drivers/iommu/arm/arm-smmu/arm-smmu.c, arm_smmu_device_group() merges
devices that share SMEs into a single iommu_group, and if isp_ope probes
before camss, the loop in arm_smmu_device_group() finds isp_ope's group on
SMEs 0x800/0x820/0x840 and returns early without assigning
smmu->s2crs[idx].group for camss's 0x400 SME:

drivers/iommu/arm/arm-smmu/arm-smmu.c:arm_smmu_device_group() {
	for_each_cfg_sme(cfg, fwspec, i, idx) {
		if (group && smmu->s2crs[idx].group &&
		    group !=3D smmu->s2crs[idx].group) {
			mutex_unlock(&smmu->stream_map_mutex);
			return ERR_PTR(-EINVAL);
		}

		group =3D smmu->s2crs[idx].group;
	}

	if (group) {
		mutex_unlock(&smmu->stream_map_mutex);
		return iommu_group_ref_get(group);
	}
}

Should the 0x800, 0x820, and 0x840 stream IDs be removed from camss@5c11000
so that camss only claims 0x400 (as done in shikra.dtsi and allowed by
Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml) and VFE and
OPE remain in separate IOMMU groups and domains?

[1] https://lore.kernel.org/r/20261023-camss-isp-ope-v11-7-0c2937195298@oss=
.qualcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-camss-isp-=
ope-v12-0-702254689feb@oss.qualcomm.com?part=3D7
