Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475553;
	b=KbhQhm/APl2YgHoXLmAMMsCingToGcDbCavDDxumJQpFXupm0c+a1ShgaSj5R0Aeg0Yp
	 FXBDWEbLszYceIFbSw6FEkEzLTOL1Ob6aNttqTW9YEXe8Bur6jMpivKKiduBr2uujnm5N
	 py+dA8uo/WKCaR2Sv9yggifSeQ3TBgrOenWNZ6jMnEKAompuoU7OkKQhhaJhCnGvOawR6
	 /y0CvVV2boBB2P1mT5Zh4pch2kfdNBWWJA7qNAVlinxQlwe6A5b5NHKEFSaZDZOBwUuuP
	 09KxWGCRFUqJtVc9pFelAkyvX1Y1FYTup8vy9I9g7pu6iaNv/G944kox4VM/vXIsGbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475553;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WZR/EqHYhlreq8fEutJwmPPkxaaEEiwBjXtohxB+KT0=;
	b=4Za8VaT/m8SXbiQiRsQ9yGoqqu1LGyDEFGHLS3Yzmk6MWnh8xIO/KKWP7+I51NfurrwF
	 pFOxAmuUHplQZ2vj3LPV79dBNWRA07A9YbhT8Codse19knc9yvpEDbs7RJY9ay+FnDkuD
	 0IehzMjJhOYVMel5in77LfumwFt5mPevt72mZD1/tWyYwantoH6QGiIyZM655RoLPjPfZ
	 FHvN7mgmUi6elmRAYaROQg1TiGFBfXi/HlfjBWL/W13uqAX4k/FPpAWnpwxTqNyKcaJUW
	 029KRVdGZm2lKoVBEMKui5hYIZagybm5psTWJ4Vvw1iGVpFIHISUd5mwDDjHjo7Rwdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=coEgjY2R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59787606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=coEgjY2R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C541F00A06;
	Thu, 12 Nov 2026 09:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475553;
	bh=WZR/EqHYhlreq8fEutJwmPPkxaaEEiwBjXtohxB+KT0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=coEgjY2RsloDFDIJrWicPskLzcR2cUx2DR0L3eWeQ5AjrgdLi+hndXrw63wZa2r7O
	 ihhsjOb9Ujt3lZz3KvXW8D+fVh6PPDIy8kXFFvrAsxji8rp3i9WQtumHQ9VO6GWQrR
	 8qTT3IXw7oAViCMP9M/Q/4Hj5j0eqal41x4oLmzFd6PT3ZKAR9jt8+TbthMwkcLsoS
	 U2OWi7vyNzvJDVlue0BwFN7NP3FlZv1C/27U9bg3LSnrOu4mNnjO/fREcQ3Ue7fHMN
	 56vHdD/aEqMwMzgwn1W7OJEmWP8IQhAfBuNn1xC8SrIm8cDsR1Cw2adjph/NDjQFwT
	 /qDm2I8w+Gd2g==
Message-ID: <sashiko-outbox-210876@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 08/15] wifi: ath12k: add Wi-Fi 8 HAL ops and
 descriptor definitions for QCN9575
Reply-To: sashiko-reviews@lists.linux.dev
To: "Madhavan Ganesan" <madhavan.ganesan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-8-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-8-3f30fbc2bb69@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 09:25:52 +0000
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
- [High] wifi: ath12k: undersized srng_config in
  ath12k_hal_srng_create_config_qcn9575()
--

commit a0803bb7ba2b3bd95c6970f62088631be5af1b5d
Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>

wifi: ath12k: add Wi-Fi 8 HAL ops and descriptor definitions for QCN9575

This commit adds Wi-Fi 8 HAL operation callbacks, CE descriptor
definitions, and wires hal_qcn9575_ops into the QCN9575 hardware-version
map.

> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c b/driver=
s/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
> index 56d45785ecd44..076a5a609f8b6 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
> @@ -2,8 +2,37 @@
>  /*
>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
> +#include "hal.h"
> +#include "hal_desc.h"
>  #include "hal_qcn9575.h"
> =20
> +static const struct hal_srng_config hw_srng_config_template[] =3D {
> +	[HAL_CE_SRC] =3D {
> +		.start_ring_id =3D HAL_SRNG_RING_ID_CE0_SRC,
> +		.max_rings =3D 16,
> +		.entry_size =3D sizeof(struct hal_ce_srng_src_desc) >> 2,
> +		.mac_type =3D ATH12K_HAL_SRNG_UMAC,
> +		.ring_dir =3D HAL_SRNG_DIR_SRC,
> +		.max_size =3D HAL_CE_SRC_RING_BASE_MSB_RING_SIZE,
> +	},
> +	[HAL_CE_DST] =3D {
> +		.start_ring_id =3D HAL_SRNG_RING_ID_CE0_DST,
> +		.max_rings =3D 16,
> +		.entry_size =3D sizeof(struct hal_ce_srng_dest_desc) >> 2,
> +		.mac_type =3D ATH12K_HAL_SRNG_UMAC,
> +		.ring_dir =3D HAL_SRNG_DIR_SRC,
> +		.max_size =3D HAL_CE_DST_RING_BASE_MSB_RING_SIZE,
> +	},
> +	[HAL_CE_DST_STATUS] =3D {
> +		.start_ring_id =3D HAL_SRNG_RING_ID_CE0_DST_STATUS,
> +		.max_rings =3D 16,
> +		.entry_size =3D sizeof(struct hal_ce_srng_dst_status_desc) >> 2,
> +		.mac_type =3D ATH12K_HAL_SRNG_UMAC,
> +		.ring_dir =3D HAL_SRNG_DIR_DST,
> +		.max_size =3D HAL_CE_DST_STATUS_RING_BASE_MSB_RING_SIZE,
> +	},
> +};
> +
>  const struct ath12k_hw_regs qcn9575_regs =3D {
>  	/* SW2TCL(x) R0 ring configuration address */
>  	.tcl1_ring_id =3D 0x00001604,
> @@ -40,3 +69,55 @@ const struct ath12k_hw_regs qcn9575_regs =3D {
> =20
>  	.qrtr_node_id =3D 0x01e03300,
>  };
> +
> +static int ath12k_hal_srng_create_config_qcn9575(struct ath12k_hal *hal)
> +{
> +	struct hal_srng_config *s;
> +
> +	hal->srng_config =3D kmemdup(hw_srng_config_template,
> +				   sizeof(hw_srng_config_template),
> +				   GFP_KERNEL);

[Severity: High]
Does sizing hw_srng_config_template[] implicitly cause out-of-bounds reads
on hal->srng_config?

Because the highest designated initializer is [HAL_CE_DST_STATUS] (10),
hw_srng_config_template[] has only 11 entries, and kmemdup() allocates an
11-entry buffer for hal->srng_config.  Common HAL code such as
ath12k_hal_srng_shadow_config() iterates up to HAL_MAX_RING_TYPES (25):

drivers/net/wireless/ath/ath12k/hal.c:ath12k_hal_srng_shadow_config() {
	for (ring_type =3D 0; ring_type < HAL_MAX_RING_TYPES; ring_type++) {
		struct hal_srng_config *srng_config =3D &hal->srng_config[ring_type];
    ...
}

This reads past the end of the kmemdup() allocation for ring types above
HAL_CE_DST_STATUS.  Declaring
hw_srng_config_template[HAL_MAX_RING_TYPES] would ensure all ring types
are allocated and zero-initialized.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-wifi8_qcn9=
575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com?part=3D8
