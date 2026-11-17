Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930545;
	b=MbFksIfTqn1FL7PhEr9FjaUT1aMD2N0yd15WCAriwiNrJ/tiZWEgPfrUPARy2+rtxTx+
	 f9i2rre+u0URijmps/pugxKm6eZlYvdrLwxeAj4OMbOEE9+vB0oooCOrc13S+nmKNfAfC
	 pLdS5NsR0lHQghpBq3wEBIG8thCusybqHFutu4oam26vHPNYIEMVRdk08RBc1R12gJO3r
	 yn3Lkf8+RuRuZTodA+9MU3DkZn6pTCMvY63tkUmfKDMqIwgpmDQEBrvDjHk2Lc/j2ws4r
	 wwagN7RGcFJ2RoAV92ezXvCXbWdL3KgbnWj6rY73KHrHj8lh7tUZqv5fxrG69iapEpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930545;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BlLX5p2wr5YD5LKMrJ+z37m3aq5giGSLVE0Xx3tpiqg=;
	b=03o4/v71dEnTpMj9K4RTnrpsSe37Zlcy0g/iHvVVZlbDev3FfXvJ4K9J6NNYjqjJWg3r
	 vo1PJ3pvSYrvPD3WJm5cbp9cgWc2lCIhg0Hr4/wf3cC/MEF7wOJfY01tFvkJ5USW8azEB
	 pZal694Pah1u4PRU2wInU31hyP9J6r97hwkFabqcB1pgF6jWuDMXUi1/aaZnasviaBywM
	 gOveUAnwklIzQ8r83M02qXALlpKHnamIccScYrUd2SUOommn9ZuVCkih4DPY62PyP7u8I
	 R17HLkwlrP7N65KdAW2zqrYQJrP50MJIxUBaqJbqZMtteH9b5ZwLEchuKHjAb/ZF9PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K3GBtGny;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D7E606A336
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 15:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K3GBtGny
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3D71F000C4;
	Tue, 17 Nov 2026 15:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794930545;
	bh=BlLX5p2wr5YD5LKMrJ+z37m3aq5giGSLVE0Xx3tpiqg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K3GBtGny4yXIO3A95xf0a5qnG7m2yBUuWgd/1sH60AgtkkWlTv/v08VFHuq60Q1be
	 tzFJ+Dlfpzmt3ZtSwhYpUNx339ggJuFa5+0jy4JC3cRy/bnL5iQLCFPXyJ4hfJhq6u
	 k1jvrVzJMK/ZcHPbBtTyuANPPIanX9jQdiGCl3wRusMbzQFhZX5fdtYaIUkRZQo15J
	 7nbsDC434LvjXIfSpAMfpjVIiPpqc1MutlrHUgHIdFHE/PUm6L44yZpsyWvV609UdX
	 HCwxme+cLu/kteRdBS7qpRL5gjl/lcyMzq9zn5QQfgtlNDKls6cV9ASiv9q1wIB8Bw
	 uV8xYX86VylTA==
Message-ID: <sashiko-outbox-219111@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/9] PM / devfreq: rockchip-dfi: prepare support for
 v4 DDRMON
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-8-32ff1546b0e4@collabora.com>
References: <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-0-32ff1546b0e4@collabora.com>
 <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-8-32ff1546b0e4@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 15:49:04 +0000
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
- [Medium] devfreq: rockchip-dfi: wrong LP5 mask in
  rockchip_dfi_v4_ddrtype_to_ctrl()
--

commit f6efa125e5d1445f73668d4878a7c97df5da332d
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

PM / devfreq: rockchip-dfi: prepare support for v4 DDRMON

This commit adds support for the control register layout of version 0x40
DDRMON controllers in preparation for RK3576 support.

> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event=
/rockchip-dfi.c
> index 33a379618eb5a..ed28dc6446f10 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -42,6 +42,19 @@
>  #define DDRMON_CTRL_TIMER_CNT_EN	BIT(0)
>  #define DDRMON_CTRL_LP5_BANK_MODE_MASK	GENMASK(8, 7)
> =20
> +#define DDRMON_CTRL0	0x04
> +#define DDRMON_CTRL0_EXT_TRIGGER_EN		BIT(6)
> +#define DDRMON_CTRL0_DDR4			BIT(5)
> +#define DDRMON_CTRL0_LPDDR4			BIT(4)
> +#define DDRMON_CTRL0_HARDWARE_EN		BIT(3)
> +#define DDRMON_CTRL0_LPDDR23			BIT(2)
> +#define DDRMON_CTRL0_SOFTWARE_EN		BIT(1)
> +#define DDRMON_CTRL0_TIMER_CNT_EN		BIT(0)
> +#define DDRMON_CTRL0_HOT_RANK			GENMASK(8, 7)
> +
> +#define DDRMON_CTRL1	0x08
> +#define DDRMON_CTRL1_LPDDR5			BIT(0)
> +#define DDRMON_CTRL1_LP5_BANK_MODE_MASK		GENMASK(2, 1)

[ ... ]

> +static int rockchip_dfi_v4_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32=
 *ctrl0, u32 *ctrl1)
> +{
> +	switch (dfi->ddr_type) {
> +	case ROCKCHIP_DDRTYPE_LPDDR2:
> +	case ROCKCHIP_DDRTYPE_LPDDR3:
> +		*ctrl0 =3D FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR23, 1) |
> +			 FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR4, 0);
> +		*ctrl1 =3D FIELD_PREP_WM16(DDRMON_CTRL1_LPDDR5, 0);
> +		break;
> +	case ROCKCHIP_DDRTYPE_LPDDR4:
> +	case ROCKCHIP_DDRTYPE_LPDDR4X:
> +		*ctrl0 =3D FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR23, 0) |
> +			 FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR4, 1);
> +		*ctrl1 =3D FIELD_PREP_WM16(DDRMON_CTRL1_LPDDR5, 0);
> +		break;
> +	case ROCKCHIP_DDRTYPE_LPDDR5:
> +		*ctrl0 =3D FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR23, 0) |
> +			 FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR4, 0);
> +		*ctrl1 =3D FIELD_PREP_WM16(DDRMON_CTRL1_LPDDR5, 1) |
> +			 FIELD_PREP_WM16(DDRMON_CTRL_LP5_BANK_MODE_MASK,
> +					dfi->lp5_bank_mode);
> +		break;

[Severity: Medium]
Should this use DDRMON_CTRL1_LP5_BANK_MODE_MASK instead of
DDRMON_CTRL_LP5_BANK_MODE_MASK when building *ctrl1?  Using
DDRMON_CTRL_LP5_BANK_MODE_MASK programs dfi->lp5_bank_mode into bits 8:7 of
DDRMON_CTRL1 rather than bits 2:1 on v4 DDRMON controllers with LPDDR5
memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-rockchip-d=
fi-rk3588-cleanups-and-rk3576-support-v3-0-32ff1546b0e4@collabora.com?part=
=3D8
