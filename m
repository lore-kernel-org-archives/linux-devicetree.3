Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A883914E5
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 05:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784956990; cv=none; b=h/xudvs2Gj+/+nZ0d/F7ISmMeyV75jGDq9mwgG0EHl7tndsS29Zdvvr1HDRsDwDeDogv2rOOZgw55INBQ2bKNnosrwdPxtlySLrlrNn1w4DUGk7a+sccnWZCVIgpFCp4m3yCaVBMjnQJSCIQRriNN0inL7UM3UOxoVC5m/muv4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784956990; c=relaxed/simple;
	bh=L2rameiijPIkKpcQ7TTU2DFMxvSh78oXGNs842Wx3NQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pteGmO9s72B5AY2eV/Gfilg0VxKnCEhGTbaDJQ5o3QwlM2wZLrJ0CpqjwxMahkIL9sMB3VUo4uCMs34hcHPVgHXZEgLVZhWZaL0rv5hy7VGH3/LoRGbHTj/sODprxw23kxhweD/poAf28mvq19l47Hmu1N/zmAXXJ0cAb0e6xKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DmhiTzte; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DmhiTzte"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB92B1F000E9;
	Sat, 25 Jul 2026 05:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784956989;
	bh=8zdUiXBGz2VORpIqv5g6dxpTkhPL1Q4b9q6AGNx/aBc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DmhiTzteTVZUqnaS/92H6FX73KR+s/jWIgnHNsspOJMoTpHU3ivqa4Lo04TGWrMA0
	 vvpICXe1rT1kYBzFkMqLVPbDktQUvnIWqMFxvHfyQx3Qbekzh6fhq6r7/AtyRdDQkx
	 O3JIkoXcE7e3nyRobRJV5ONNJBnMzbfdgjZb2+gIDEQq1ne9rN2bsMa09a7gySU13n
	 V5CiZOquXdnUlp3LJNmO9koR8uyKXYysZ3OVz/ijr9VWXcMg9Q88XhRTlk9DfUu5XD
	 KOPdRadv9awVzUwtxupJW9IrtsjrSHNjKllFirImBCPfief0yO0OGBZwAXixozX3G3
	 HZmGAJGRoPz5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/17] riscv: dts: spacemit: k3-pico-itx: enable the
 DisplayPort output
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cody Kang" <codykang.hk@gmail.com>
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20260724-k3-display-v1-15-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
 <20260724-k3-display-v1-15-f22a10a52867@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 05:23:08 +0000
Message-Id: <20260725052308.EB92B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Pixel clock truncation causes DisplayPort Transfer Unit (TU) misca=
lculation.
- [High] EDID extension block reads fail due to omitted DP_AUX_I2C_MOT bit =
in I2C-over-AUX transactions.
- [Medium] Missing get_modes implementation for DRM_BRIDGE_OP_MODES capabil=
ity.
- [Medium] Dropped hotplug interrupt notifications due to omitted DRM_BRIDG=
E_OP_HPD.
--

--- Patch [15]: [PATCH 15/17] riscv: dts: spacemit: k3-pico-itx: enable the=
 DisplayPort output ---
commit 81b9c7b43f433a109ef12eb306af123e3e5941fc
Author: Cody Kang <codykang.hk@gmail.com>

riscv: dts: spacemit: k3-pico-itx: enable the DisplayPort output
   =20
Pico-ITX brings the second DPU's output to an external DisplayPort
connector. Enable that DPU and the DisplayPort controller it feeds.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/bo=
ot/dts/spacemit/k3-pico-itx.dts
> index b89c1521e6649..6c31460990a75 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts

[ ... ]

> @@ -221,3 +222,13 @@ hub@1 {
>  &usb2_phy {
>  	status =3D "okay";
>  };
> +
> +&dpu1_crtc0 {
> +	status =3D "okay";
> +};
> +
> +&dp1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&dp1_1_cfg>;
> +	status =3D "okay";
> +};

[Severity: Medium]
Enabling this DisplayPort output exposes some issues in the underlying driv=
er.
Does the DisplayPort driver incorrectly declare support for
DRM_BRIDGE_OP_MODES?

drivers/gpu/drm/spacemit/spacemit_inno_dp.c:spacemit_dp_bind()
		dp->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
				 DRM_BRIDGE_OP_MODES;

The callback structure omits the logically required .get_modes callback:

drivers/gpu/drm/spacemit/spacemit_inno_dp.c:spacemit_dp_bridge_funcs
static const struct drm_bridge_funcs spacemit_dp_bridge_funcs =3D {
	.attach				=3D spacemit_dp_bridge_attach,
...


[Severity: Medium]
Will hotplug events be silently dropped here?  The driver omits the
DRM_BRIDGE_OP_HPD flag:

drivers/gpu/drm/spacemit/spacemit_inno_dp.c:spacemit_dp_bind()
		/*
		 * No OP_HPD: the HPD interrupt is gated by the DP pixel clock.
		 * Leaving it out marks the connector POLL_CONNECT |
		 * POLL_DISCONNECT instead.
		 */
		dp->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
				 DRM_BRIDGE_OP_MODES;

However, the hardware interrupt is fully enabled:

drivers/gpu/drm/spacemit/spacemit_inno_dp.c:spacemit_dp_dev_init()
	enable_irq(dp->irq);

And the handler invokes the notification function:

drivers/gpu/drm/spacemit/spacemit_inno_dp.c:spacemit_dp_hotplug_event_handl=
er()
	drm_bridge_hpd_notify(&dp->bridge, status);

Because DRM_BRIDGE_OP_HPD is omitted, the DRM core never registers a hotplug
callback. This turns the notification into a no-op and forces the system to
fall back to a 10-second polling interval.


[Severity: High]
Could this calculation result in an incorrect DisplayPort Transfer Unit (TU=
)?

drivers/gpu/drm/spacemit/spacemit_inno_dp.c:spacemit_dp_hw_set_msa_and_enab=
le_video()
		fp =3D mode->clock / 1000;

The pixel clock is truncated from kHz to an integer MHz value, losing
precision for standard clocks like 148.5 MHz.  This truncated value is then
used directly to compute the Transfer Unit:

drivers/gpu/drm/spacemit/spacemit_inno_dp.c:spacemit_dp_hw_set_msa_and_enab=
le_video()
	/* Transfer unit: tu =3D fp * bpp * 640 / (8 * lanes * link_rate) */
	{
		u64 temp_tu =3D (u64)fp * bpp * 640;

This math error produces a systematically incorrect Transfer Unit which can
lead to FIFO underflows and video corruption.


[Severity: High]
Can EDID extension block reads fail due to protocol violations on the
I2C-over-AUX transactions?

drivers/gpu/drm/spacemit/spacemit_inno_dp.c:spacemit_dp_conn_get_edid_block=
()
			ret =3D spacemit_dp_aux_i2c_write(dp, DDC_ADDR,
							&edid_offset, 1);
			if (ret)
				continue;

			ret =3D spacemit_dp_aux_i2c_read(dp, DDC_ADDR,
						       buf + offset, chunk);

The custom message request explicitly lacks the DP_AUX_I2C_MOT (Middle Of
Transaction) bit:

drivers/gpu/drm/spacemit/spacemit_inno_dp.c:spacemit_dp_aux_i2c_write()
		.request =3D DP_AUX_I2C_WRITE,

Issuing a write and a read separately without maintaining I2C transaction
continuity triggers an I2C STOP condition.  This can cause I2C EEPROMs to
reset their address pointers, preventing the reading of EDID extension bloc=
ks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-k3-display=
-v1-0-f22a10a52867@gmail.com?part=3D15
