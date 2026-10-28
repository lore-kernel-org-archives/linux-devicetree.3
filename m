Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160372;
	b=wAB2TFJX5YURI+Yg1HeYF7LJ6hW/N+gzlgWywdIG+DYwe8mDt/aJ7ZhJ45+df7hkyeR/
	 B71glkUNhbbYRfyC7nArzmr0bg8u0XxObuMwokoxubm+FwBVdiJH+wnPwslg/yf/LcOFw
	 lHKVsWgBl6+qmq0SmLzJwRwTE0cVoDMaSHLPp7FWNT9bTr176rx4r3XsvFTbgJ3qD6NWs
	 bH8iOn1wjnxhR1B8JPGzSyFDGUQtFTkbZJVwku+GmdbsjEf7/04/SCyMswMf+Jv6MB/Io
	 KbYk6m/EL2zUjAXhgD74n0/nWMqUiHRCsicwhxNEd465KE1ySCUChkAecGT1RkUCYqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160372;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kmNU20myOQcf0B1PZVYl3V9QOp45aRf6TnyfacS9qUE=;
	b=X+iJjW7c2O4Indy1I/x/c0fmQLilAC3YNTyN/XpSYYLxOnbAfgPfElLofLv/gS18LaJQ
	 vvjTLDr7bSL0kj+6TicY8FIUCSvhKTeU7nEcHmZ8qytCIak7IpsZoXGQo9kNLO2KQ0WDD
	 rY6XTba2SBuxa6nNV9Xrv5w5yt5mqxV6p8cihZYO8fyWhWS5p6A81yEi9JHL+Nev3UFya
	 158OEcdc7Vn2M4P62MXiwla6tWm63jZYHa7hPFr/uRkfWAfqVr3pYH3X8u5YZ9VHmeJNE
	 Sm8KNP1BWb3bFFOLas6F8Bv0DIzMczpW2Hjo2dOoQK7kW2oFk1QYRD7hrTaudavJKVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvHVm+MU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B44606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 04:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvHVm+MU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E474C1F01825;
	Wed, 28 Oct 2026 04:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793160372;
	bh=kmNU20myOQcf0B1PZVYl3V9QOp45aRf6TnyfacS9qUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kvHVm+MUWFVNjN7kGTdGgXa+VUaVI4uO79HysIm0nnclNsl2ci3TzwMsR22gNFDof
	 PGDOfzS8pDQIJZViFoEAdrXH554MZOS0dmgIg1Lg9KKRbMqiZZiXnJP6Ni3k6stzpk
	 a3NpWsB7mi1+caEza4/oK21tLZnd0J4203fcJ0w6Yh6aHI1To052J4lbEBdC1sP4HJ
	 bVZ+sIOGLrxyOXbdEExlMRFLcMvw7h6DxJz4EEVnlISvCC28PaCBBv9dtzn4jwk26l
	 LRmSfrMbwzEfu9yPREdty4lODyqdfoar/48IGPpD5W2QDxJZry6xldDojc39OqMiIS
	 IRDvLtA8FyCjQ==
Message-ID: <sashiko-outbox-187462@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 9/9] arm64: dts: qcom: sm8750: add the camera subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261028034105.326535-10-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261028034105.326535-10-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 04:06:11 +0000
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
- [High] media: camss: csid_set_stream() skips configure_stream() on stop a=
nd restart
--

commit d503f6b5ea6cdbb52ee98c8873d6ffd4c3dc7c21
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

arm64: dts: qcom: sm8750: add the camera subsystem

This commit adds the camera subsystem (camss) device tree node for the
Qualcomm SM8750 SoC, describing the CSID, CSIPHY, and VFE instances along
with their registers, clocks, interrupts, interconnects, and power domains.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index dd738d13df8e0..12dcf2f33854a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3495,6 +3495,185 @@ dispcc: clock-controller@af00000 {
>  			#power-domain-cells =3D <1>;
>  		};
> =20
> +		camss: isp@ad27000 {
> +			compatible =3D "qcom,sm8750-camss";

[Severity: High]
Can stopping a stream or unwinding a failed stream start on SM8750 leave the
CSID RDI stream enabled with interrupts unmasked, and skip stream
configuration on a subsequent start?

In drivers/media/platform/qcom/camss/camss-csid.c, csid_set_stream() gates
csid->res->hw_ops->configure_stream() on csid->phy.need_vc_update and clears
that flag on the first call:

drivers/media/platform/qcom/camss/camss-csid.c:csid_set_stream() {
	...
	if (csid->phy.need_vc_update) {
		csid->res->hw_ops->configure_stream(csid, enable);
		csid->phy.need_vc_update =3D false;
	}

	return 0;
}

Because csid->phy.need_vc_update is only set in csid_set_power() (on power-=
up)
and csid_link_setup(), it is already false when streaming stops via
video_stop_streaming() -> video_stop_subdevices() or when
video_start_streaming() unwinds already-started subdevices on error:

drivers/media/platform/qcom/camss/camss-video.c:video_start_streaming() {
	...
error:
	video_stop_subdevices(video, entity);
	video_device_pipeline_stop(vdev);
	...
}

When v4l2_subdev_call(subdev, video, s_stream, 0) invokes
csid_set_stream(sd, 0), csid_configure_stream(csid, 0) in
drivers/media/platform/qcom/camss/camss-csid-980.c is skipped:

drivers/media/platform/qcom/camss/camss-csid-980.c:csid_configure_stream() {
	u8 i, k;

	__csid_configure_rx(csid, &csid->phy);

	for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_980; i++) {
		if (csid->phy.en_vc & BIT(i)) {
			u32 mask =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_MASK(i));

			writel(INFO_CAMIF_SOF, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
			mask =3D enable ? mask | INFO_CAMIF_SOF : mask & ~INFO_CAMIF_SOF;
			writel(mask, csid->base + CSID_CSI2_RDIN_IRQ_MASK(i));
			mask =3D readl(csid->base + CSID_TOP_IRQ_MASK);
			mask =3D enable ? mask | CSID_RDI_TOP_IRQ(i) : mask & ~CSID_RDI_TOP_IRQ(=
i);
			writel(mask, csid->base + CSID_TOP_IRQ_MASK);
			writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
			__csid_configure_rdi_stream(csid, enable, i, 0);
			__csid_configure_rx_vc(csid, 0);

			for (k =3D 0; enable && k < CAMSS_INIT_BUF_COUNT; k++) {
				__csid_aup_update(csid, i);
				__csid_rup_update(csid, i);
			}

			__csid_ctrl_rdi(csid, enable, i);
		}
	}
}

As a result, INFO_CAMIF_SOF in CSID_CSI2_RDIN_IRQ_MASK(i) and
CSID_RDI_TOP_IRQ(i) in CSID_TOP_IRQ_MASK are not masked, and
__csid_ctrl_rdi(csid, 0, i) is never called to stop the RDI stream.

In addition, if streaming is restarted without an intervening CSID power
cycle or link change (for example, if video_start_streaming() fails in CSIP=
HY
or sensor s_stream(1) after CSID s_stream(1) has already run when
VIDIOC_STREAMON was called before min_queued_buffers were queued and a later
VIDIOC_QBUF triggered vb2_start_streaming(), or while another active VFE li=
ne
keeps the CSID entity powered), csid->phy.need_vc_update remains false.

On that subsequent start attempt, vfe_enable_output_v2() in
drivers/media/platform/qcom/camss/camss-vfe.c skips ops->reg_update() becau=
se
vfe->res->reg_update_after_csid_config is true on SM8750:

drivers/media/platform/qcom/camss/camss-vfe.c:vfe_enable_output_v2() {
	...
		if (!vfe->res->reg_update_after_csid_config)
			ops->reg_update(vfe, line->id);
	}
}

And because csid_set_stream(sd, 1) also skips csid_configure_stream(csid, 1=
),
the initial CAMSS_INIT_BUF_COUNT calls to __csid_aup_update() and
__csid_rup_update() are never issued, leaving the initial buffer addresses
unlatched and stalling capture.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028034105.3265=
35-1-xiaqinghuan@mail.ustc.edu.cn?part=3D9
