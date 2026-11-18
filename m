Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990787;
	b=gXWPzBxlX+Lk7DWRDYsaA95ALFgv0Xz0XTZ7NEicxPRj5Ne5Lqa/uMvWNhi/0qiE2VYn
	 G4L2Z3zattcdw5wVabaVx+bAT38OxaxegYu2y93/nwg200oWE0Ur0jzmbu9FKxBDNVC57
	 6AKW7l4/qpKxCjwKq1IVlGeI6IrQBTl/cam9YTmnGeOg/z02TtfcWBS1Tw7E29UDq6QqV
	 vcoOaQr7VWI/llU1Yaa5gfb/mkd3SWszYk9xtcH+KYiK4C4194G2iCm9LEXryzc0LZF3q
	 Man12Na1SWfwhpAjsOKz+MKULQItKCL13YyvVpVNgEGUc4KY1h2Wy9ZGAEknS9krVIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990787;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=V41fr8nhfe/WUf3NFnOrOxez7UkfHrSvq/833T9AXnE=;
	b=0imZiWpKiGoBVszQqmroQU6rv1jELBTJGiLkXX1k6laAjVc2k9KWYrnRS5qEAVEbLQNb
	 8WnWpVPJEyiOXsTI0oF1POUznN6sKQUig3vhfQ59TR79iaT43Jd6c20oIcFN4SfcIs3hM
	 uLrXyLPHGjj58W3z9niXnTdpiQOAvFDqWrgH+GCzB2Ib/+OuvdEf6gYTa25mzt5Xg3eXQ
	 K73bO/81IoYmOzJQAuhalFIdL80AaU7FFabmB+grISLoNa0CvMzuGYDdMdW1/jUDAax3+
	 qthhOZQ/Zt2+UdaB2rkcEesP+aJsyIRfcCc9wpRhsDa7RzeRIh9cACWs4Phbe6EKmPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AFO5FbeA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEC6606A32C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AFO5FbeA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DE51F000C4;
	Wed, 18 Nov 2026 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990787;
	bh=V41fr8nhfe/WUf3NFnOrOxez7UkfHrSvq/833T9AXnE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AFO5FbeARnYmnRJ7mWgszBjwRs0gcnCBc1Ny6+G3uBW4li8TI0UtWm1RlMv8466K/
	 DyeuC8G9gKyDr1Zx+p0YigLIFIeCHycfC6WzFHo+xVHJUSjI1csPprLdGQEpWQJu5y
	 pnh6s+nMC7v2MpRgtlyf1efzE3lIGmSaH2Wn1c4sBty2shC7psr3jX58fVPoX4RytZ
	 N/ONdcf8tkjReXTXnNSaeAxVJT/2sxQypOA8uyNU5vUID0FcZWuGTCSX3nFe7QgKh6
	 HMc2PGR1Tp9ix3gR3Xib/QKFMPU1yGXFh0+vMFlDMOa0aekjv6D645zzwz4RUaRwyQ
	 2jJARWVc1iiAQ==
Message-ID: <sashiko-outbox-220456@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next v3 08/15] wifi: ath12k: add Wi-Fi 8 HAL ops and
 descriptor definitions for QCN9575
Reply-To: sashiko-reviews@lists.linux.dev
To: "Madhavan Ganesan" <madhavan.ganesan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-8-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-8-9875d2a3953f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:33:06 +0000
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
- [High] wifi: ath12k: undersized hw_srng_config_template in
  hal_qcn9575.c
--

commit c90add26721221071c7aba069630ff7548f8ea25
Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>

wifi: ath12k: add Wi-Fi 8 HAL ops and descriptor definitions for QCN9575

This commit implements Wi-Fi 8 HAL operations, CE descriptor layouts, and
SRNG configuration for QCN9575.

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
> =20
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
Should hw_srng_config_template be sized to HAL_MAX_RING_TYPES?

Because hw_srng_config_template[] has no explicit array bound and its last
initializer is [HAL_CE_DST_STATUS] (10), kmemdup() allocates only 11
entries for hal->srng_config instead of HAL_MAX_RING_TYPES (25).  Callers
such as ath12k_hal_srng_shadow_config() and ath12k_hal_srng_get_entrysize()
index hal->srng_config up to HAL_MAX_RING_TYPES - 1, causing an
out-of-bounds slab read for any ring type above HAL_CE_DST_STATUS.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-wifi8_qcn9=
575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com?part=3D8
