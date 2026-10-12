Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2CC443AA7
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789887; cv=none; b=k2UyhBz3lv1DQ0vgqVwrq95LUJK33InbW7RCrAUOtVHLpKuQfKFM8owuTSX4WtTswSKFrcUu/D5/1vuWORsdLtClJMBHvZbGyvBYnOlDIhvuw8MYjyDjIviaQVqZDo+cof5QQP3B+efXNdmhYS0J3T6HU9Oqs9TtnIDSs5dfgdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789887; c=relaxed/simple;
	bh=Kal4GGsGp43KyV9T4Fa3GcTWeYGfB37h6t0z25f6Ul8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DUFwmd6CBX1+OKtLVDf8f5rAtKCDWCfAJmG4Dsfl0ljJH1UUtmaOkhxzpmWvrhxNTxPuUSfRikkxgAAEo+iPrCOXeINz0rm2iBbgG6Y18yNXfnaE5hkTJJVInvOCFEqGsat4fujWkaSp7uLxHMMwPNUIYQyLQmIxSOxbE2ZI/NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dATnZllv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dATnZllv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8041F0089B;
	Mon, 12 Oct 2026 07:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791789886;
	bh=1/KzxEJ9e8eiHinxkGhmCVdKgubpOAl+ivWXII3PIr0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dATnZllvMV3qTGgdd+/0F9MxOA/f7XbG3bqsd8sxe1zRPVKOwGhoDc4ponOyh09kF
	 HINUx8Qu3+Mi2PL9JXBmE65rYd05oiHQ1QxSStlZMFG0lZPUAl7qO55z1wURz/SR2X
	 6xbNdTuSP9IzO77vrKRjZt5aTQtAuYP49ugFLviZrQuIKCFW5wfvYEPCGe+TgWbrhn
	 xkmid2CtzCok6n8yThDmgUs/8KIKwfIRzXXuMivOLJmRNoRMJMTfq3OxTMHsCB4YFf
	 kx43kHFTz6MRVVAN87BPaCNl2mp8HTiaRbKLpIjxgYDE8SrQ/m5u6iARwCa7qu27JP
	 l8Dmnp5zicy2Q==
Message-ID: <sashiko-outbox-167786@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 5/6] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261012-b4-s4-vdec-upstream-v11-5-25939f85ada5@amlogic.com>
References: <20261012-b4-s4-vdec-upstream-v11-0-25939f85ada5@amlogic.com>
 <20261012-b4-s4-vdec-upstream-v11-5-25939f85ada5@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 07:24:45 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: amlogic: vdec: Missing locking in the timeout/error path of=
 aml_h264_dec_run()
- [High] media: amlogic: vdec: Infinite loop in threaded IRQ handler due to=
 0 timeout in read_poll_timeout()
--

commit caf90beec035f24ac592fd4c243200813bb1fcc4
Author: Zhentao Guo <zhentao.guo@amlogic.com>

arm64: dts: amlogic: Add video decoder driver support for S4 SOCs

This commit adds the vdec node to enable the Amlogic V4L2 stateless video=20
decoder for S4 SOCs. It also enables the optee node to support loading the
video firmware via TEE helpers.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/=
dts/amlogic/meson-s4.dtsi
> index 2a6fbd5308362..7a1dcb3951c82 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi

[ ... ]

> @@ -907,5 +912,33 @@ emmc: mmc@fe08c000 {

[ ... ]

> +		video-codec@fe320000 {
> +			compatible =3D "amlogic,s4-vdec";
> +			reg =3D <0x0 0xfe320000 0x0 0x10000>,
> +			      <0x0 0xfe036000 0x0 0x20>;
> +			reg-names =3D "dos",
> +				    "dmc";
> +			interrupts =3D <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>;
> +			clocks =3D <&clkc_periphs CLKID_DOS>,
> +				 <&clkc_periphs CLKID_VDEC_SEL>,
> +				 <&clkc_periphs CLKID_HEVCF_SEL>;
> +			clock-names =3D "dos",
> +				      "vdec",
> +				      "hvdec";
> +			power-domains =3D <&pwrc PWRC_S4_DOS_VDEC_ID>,
> +					<&pwrc PWRC_S4_DOS_HEVC_ID>;
> +			power-domain-names =3D "vdec",
> +					     "hvdec";
> +			resets =3D <&reset RESET_DOS>;
> +			amlogic,canvas =3D <&canvas>;
> +			amlogic,secure-monitor =3D <&sm>;
> +		};

[Severity: High]
Enabling this device exposes a locking regression in the driver. In the
timeout/error path of aml_h264_dec_run(), aml_stop_vdec_hw() is called with=
out
holding dec_hw->ctx_mutex:

drivers/media/platform/amlogic/vdec/h264.c:aml_h264_dec_run() {
...
		/*
		 * Halt the hardware and wait out any in-flight threaded IRQ
		 * handler before cleaning up, otherwise both contexts may run
		 * h264_release_decode_spec() concurrently.
		 */
		aml_stop_vdec_hw(dec_hw);
		synchronize_irq(dec_hw->dec_irq);
		h264_release_decode_spec(dec_hw, ctx);
	} else if (-ERESTARTSYS =3D=3D ret) {
		ret =3D -1;
		aml_stop_vdec_hw(dec_hw);
		synchronize_irq(dec_hw->dec_irq);
		h264_release_decode_spec(dec_hw, ctx);
...
}

If wait_event_interruptible_timeout() times out or is interrupted, the
threaded IRQ handler vdec_threaded_isr_handler() may execute concurrently on
another CPU while holding ctx_mutex.

Because aml_stop_vdec_hw() is unprotected, can it reset the hardware
concurrently while the ISR is still interacting with it?=20

If the ISR writes to DPB_STATUS_REG after the reset, it could inadvertently
restart the hardware decoding process. This means a restarted hardware block
could fire a new interrupt after synchronize_irq() returns, allowing a new
ISR to run concurrently with h264_release_decode_spec().

Will this lead to concurrent double-freeing of canvas indices?

[Severity: High]
Enabling this device also exposes an infinite loop risk in the threaded IRQ
handler. In h264_config_decode_buf(), read_poll_timeout() is called with a
timeout of 0:

drivers/media/platform/amlogic/vdec/h264.c:h264_config_decode_buf() {
...
	read_poll_timeout(read_dos_reg, reg_val,
			  !(reg_val & 0x800),
			  10, 0, true, hw, H264_CO_MB_RW_CTL);
...
}

The read_poll_timeout() macro treats a timeout of 0 as an infinite wait.

Since this executes inside the threaded interrupt handler on every H264 fra=
me
decode, if the hardware hangs or the register condition is never met,
would the thread spin indefinitely and hang the system or consume 100% CPU =
on
the IRQ thread?

>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-b4-s4-vdec=
-upstream-v11-0-25939f85ada5@amlogic.com?part=3D5
