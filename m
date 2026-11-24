Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539236;
	b=QW4Eyj3zzFQbFKXggFRgvypMp8bZNOV7t7j3Mzr23GD7h30pwvzSAXvDoi1mkf+Hoacf
	 92QQPOe5pwsATGziOYmAoXHN3OKG0M7zTKW8rTahOac/nMod6QsySjg6WY/mapnVg5MOW
	 CYjLU8cYZEraxA7SG+tvrGXXJIsq/mhRTs5NtVzb1++cRB7hK6H18DUtugGyddSzzgfX4
	 csTB4/RKgERrqpNG8UQsU17ygNijRW108CfpgwbRiBoDHU4+a4QtFeQnMIvtxoVej5he7
	 0xdCdAsEfmWw/3A6/q5f7CTKolSBxdBd1ahePofvXreZdBz+tfV8yzQqIUFi9G/XL8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539236;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WNuj6dOrgLgvgihBTl8o7RNRY0uK99ZqNVYE2wNfBas=;
	b=xZ7Hg4aEo/5jmnCIri29rFFdm5TuOFjeFIZWJFGydLqSu9SydM453WTs1E3Rtan2U8Lh
	 N7hXmJ2udq5PMDRZmMwAuiR1B4qjyC/5C6ZS9mKtLTasQqLxLYJsVF1o1CMlfYOkGZacA
	 xFVrJeYu9O6zEwQavuYRdIm2Q2yOBH7ZQfJ8aSXjyCxUXDHkFiJc1ASGBvabeq7zf6zRJ
	 VjFiriuOxB4Gl63IdzTFnJ127wjdRnMTN4WbCOyLE4aX6L8W0j+4MTehFFGCWoqzhlMt4
	 6AB26Xqq9Tokzfes6PIsaR1EYI1wrfQ4PiPRXgDxF+mWVIFCUFTCOlEK99U5LN4NhXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fZ6/Vumy";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2C9606A33C
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fZ6/Vumy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EB51F00A36;
	Tue, 24 Nov 2026 16:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539236;
	bh=WNuj6dOrgLgvgihBTl8o7RNRY0uK99ZqNVYE2wNfBas=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fZ6/VumyDGOpCN3akKIsc7j1sJD5xruvPNDFtpRljxaz7oLMT50uZQt7nw2ddv6mz
	 ngVC0dNpQQsLN352zkOi2liV70YsybKhscjPo4VUB1XePKnsGv+PKPyuGkmOYHHWZI
	 nOLz061ndA0oHvBr1BaFjnOaRdtXavonCVuOu2/ahTUlrdJtFXrYcxtH/QCUhfAFZR
	 znHtfQzBDUerOQsajEIMC7o0egauwXHY+yWlPsor+TpwPAjbA0RYH8xQYCgdLeINCp
	 eveortzG3ZY2X7xLmKRfpozAtnNF3zyNPvxn65oR0p3MYS1nlYfQuQYUcYNpy1D/r0
	 bdhOzAyEmdZQA==
Message-ID: <sashiko-outbox-231613@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next v4 07/14] wifi: ath12k: add Wi-Fi 8 HAL ops and
 descriptor definitions for QCN9575
Reply-To: sashiko-reviews@lists.linux.dev
To: "Madhavan Ganesan" <madhavan.ganesan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-7-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
 <20261124-wifi8_qcn9575_bringup-v4-7-1f5b87ece6a3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 16:53:55 +0000
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

commit af3e649dba7ae61709248892f1ca2ef731afbb24
Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>

wifi: ath12k: add Wi-Fi 8 HAL ops and descriptor definitions for QCN9575

This commit adds Wi-Fi 8 HAL operation callbacks, CE descriptor definitions,
and SRNG configuration for QCN9575.

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

[ ... ]

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
Should hw_srng_config_template[] be explicitly sized to
HAL_MAX_RING_TYPES?

Because the highest designated initializer here is [HAL_CE_DST_STATUS]
(10), kmemdup() allocates only 11 entries for hal->srng_config instead of
HAL_MAX_RING_TYPES (25).  Callers such as ath12k_hal_srng_shadow_config()
iterate from 0 to HAL_MAX_RING_TYPES - 1 and index
hal->srng_config[ring_type], reading past the end of the allocation for
ring types above HAL_CE_DST_STATUS.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-wifi8_qcn9=
575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com?part=3D7
