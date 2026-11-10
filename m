Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298272;
	b=abSiPZ0P894lbqt8jfQTCeqMzC4/QMrpjpw6/ZAOUWDH9DFD9WjheeVu1Nr+paghFz91
	 ZMdKaSWBi2KBYePQc6ELWBNDy96u8IAKexIzNj/4uRXciFYF6b94YtP1FKaL87aCjXI83
	 2VT+KxVaDx7f/rV+FrPCZfuj97cO/bCiVcMbK5S2/078FmvuCMvqo5GShRDAyo29o4oxd
	 FxgpkE7Mk/TSGwaF40+9lp8/rzt+HAiZ0Sp2q0X1pxFUj9LJklQYL+57w/y78sCa+UmPy
	 UAsXleXmfPN6NlgSqNRnCZXtj2fZhh5SiQs1l+eE6fNkR3vIkna3nIr8JA1IPaFu03w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298272;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=G2hTVRuQRjgta+rs5/PlgRcbqufNPlDCusmR3nTXejc=;
	b=CGV/oV5tA3zy49nStuxlG8ypaQGiJo9uiwKxFfAqfIMdjTLJtizZFxT9/1wyjej+94EN
	 cMkrv7jTiD8CrQlQGHhJc5xr4BFrUTzRo2VhkxoCwOjD5ikae4gcGj7JQnfUIn5cF+XRk
	 5GNXy/o16pHYJhKzmuebNJRCK0ZuJHE580qgRmF7kBSPvuHUMDFMEe6sP12hSf7MRsPkK
	 6v/hhs4C/+U8HbaAoNaiKMKVKDjhSoU1f6SS+pxfRw6dxCAj6HQf+44TMWuwupaFWP+Hz
	 jYF4gEqulK6llwO7HVqkou/2NJCvuqN6Ly5qgrNf02w96GUN5JBdUSlA0SNvQ+nxaig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gnZ7B2Nt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF25606A321
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gnZ7B2Nt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17BE61F0089F;
	Tue, 10 Nov 2026 08:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794298272;
	bh=G2hTVRuQRjgta+rs5/PlgRcbqufNPlDCusmR3nTXejc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gnZ7B2NtjoD9pR5p4llQ7O4u2Odvbnz447XScTo8rHviimHefch+tr3owOm1tbzcL
	 lvPcAeTNCatgBFcueIVaToIvKB5NEshdWniScbSgFHtwbTBbAmNtnnqcMhJa0ovE58
	 WeK4xWpUF5cHCgHJWkf/l0w6h7+RAXUFkVteQNrjzyL95OOscWueVP+2OmcD0WlvhZ
	 Ft89bJ26ippudAOt9X8dH6fGazrkVFBJYSJqTGiRh6CcCG14QX0+COpf+egn0Tk2BY
	 vJYZyKyrl9CoLwKl6HTfwzOveTfmNT4Al2LYKXf1rpdkdCqRSVg2Y3+qOTkmc6bmge
	 MKDcuDyKRM0fA==
Message-ID: <sashiko-outbox-206571@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] media: verisilicon: Reset the Rockchip encoder
 cores on timeout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261110-hantro-robust-v1-3-6b6269c05bfa@gmail.com>
References: <20261110-hantro-robust-v1-0-6b6269c05bfa@gmail.com>
 <20261110-hantro-robust-v1-3-6b6269c05bfa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 08:11:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] media: verisilicon: uncleared IRQ disable bit in
  hantro_h1_jpeg_enc_run() [1]
--

commit 433d2270fcbefc689a4dc88d1c36fa283eb8f9a5
Author: Arun Iyengar <aiyengar1990@gmail.com>

media: verisilicon: Reset the Rockchip encoder cores on timeout

This commit pulses the optional hardware reset lines in the Rockchip
VEPU1 and VEPU2 reset callbacks to recover encoder cores that become
stuck on the bus after an IOMMU fault and job timeout.

> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drive=
rs/media/platform/verisilicon/rockchip_vpu_hw.c
> index 02673be9878e1..0dced75158334 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c

[ ... ]

> @@ -468,6 +469,33 @@ static void rk3066_vpu_dec_reset(struct hantro_ctx *=
ctx)
>  	vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
>  }
> =20
> +/*
> + * Stopping the encoder through its registers isn't enough when it is st=
uck
> + * on the bus, for instance after a translation fault in its IOMMU: it k=
eeps
> + * AXI transactions outstanding and never becomes idle, which also preve=
nts
> + * the IOMMU from stalling. Pulse the reset lines of the core, if the de=
vice
> + * tree describes them, to return it to its idle state.
> + */
> +static void rockchip_vpu_enc_hw_reset(struct hantro_dev *vpu)
> +{
> +	int ret;
> +
> +	if (!vpu->resets)
> +		return;
> +
> +	ret =3D reset_control_assert(vpu->resets);
> +	if (ret) {
> +		dev_warn(vpu->dev, "Failed to assert resets: %d\n", ret);
> +		return;
> +	}
> +
> +	udelay(5);
> +
> +	ret =3D reset_control_deassert(vpu->resets);
> +	if (ret)
> +		dev_err(vpu->dev, "Failed to deassert resets: %d\n", ret);
> +}
> +
>  static void rockchip_vpu1_enc_reset(struct hantro_ctx *ctx)
>  {
>  	struct hantro_dev *vpu =3D ctx->dev;
> @@ -475,6 +503,7 @@ static void rockchip_vpu1_enc_reset(struct hantro_ctx=
 *ctx)
>  	vepu_write(vpu, H1_REG_INTERRUPT_DIS_BIT, H1_REG_INTERRUPT);
>  	vepu_write(vpu, 0, H1_REG_ENC_CTRL);
>  	vepu_write(vpu, 0, H1_REG_AXI_CTRL);
> +	rockchip_vpu_enc_hw_reset(vpu);
>  }

[Severity: Medium]
This problem wasn't introduced by this patch, but when vpu->resets is not
present in the device tree, does rockchip_vpu1_enc_reset() leave
H1_REG_INTERRUPT_DIS_BIT set in H1_REG_INTERRUPT [1] across later
runs?

hantro_h1_jpeg_enc_run() starts the encoder without writing to
H1_REG_INTERRUPT to clear H1_REG_INTERRUPT_DIS_BIT, so after a watchdog
reset all subsequent H1 JPEG encoding jobs have completion interrupts
disabled and time out as well.

[1] https://sashiko.dev/#/bug/linux-22957774-1c15-4f2d-87b4-d6b2e043ac2a

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-hantro-rob=
ust-v1-0-6b6269c05bfa@gmail.com?part=3D3
