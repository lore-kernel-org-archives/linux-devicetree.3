Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983661;
	b=EkkSlJSmZCEEOlXzpORKfAuPtDwLHVFZ8HnPxstESxgeEnRUvIJeKN6m3sOU9ss82Hy0
	 w7td9OUgGDbpT6XOQ8HWmd5ScFsCitL1cEAukCU1nf4jKSreIkTvYNm+WmUxh+5Hgyiut
	 JEORI7NXzv8v72ZqbPpxB5frcXZiTfmSLdEAEpClEwA1vHdzEBZ5G9jrz+FQrTzTs7hF7
	 KUSRe2ZGCQBgh220TYqTQ6k+zMSsEwHRuuIAXoppL0r8jvYR73XarpV7eMPVraxQcAU/u
	 GhEZbipgAcAADlPkKkke36ZRCRh3O3r8yAqEcWhH5ryBBRnXZF5ollfsLEqN7TW2HsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983661;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=grzNb5LRvtqX2M6TOcq/vPzihkoFLtd4ftwe7tGovz4=;
	b=g7kV0PwoCCTG77YLc1Hn9jDX2yAKGkJbNP88deOrgdpvITKFOt5INvQOXMCH054laTsO
	 +fz+2YZtwVaL0g9+sNGq2n/VCF75frR3StpsLkMqxUYWVkjP7MzRbecUBOmQeS9cmksbj
	 khR5hN343dFjX0YrvXhl7TZzU2aplDWHNHW2hYyUXAtaQfA8vfkcKwu7TXOAU8l+kdhaY
	 L8NRXo+A/XdUxGkJiSW0PzvoCYhv0R/dvs0q4Y8b2sa/apbatdKOAZWfu+3sWu4oasvEb
	 xNIPcEtpzG11FBb/qRdngcM3ftpJZchpQq2G7Vm0IWJwbtKlMee4REgFToEM90tGQfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W9p8ZpA7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409D0606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W9p8ZpA7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EDE41F000C4;
	Wed, 18 Nov 2026 06:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794983660;
	bh=grzNb5LRvtqX2M6TOcq/vPzihkoFLtd4ftwe7tGovz4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W9p8ZpA7s+BRaH6MbGP36emw0oSIy7IJD6seHvJZXhmZlDgMhOgR6Ao44OQJxCCvL
	 XXrmCx9UAJvKTEoW6eTiGvjqz0x0tLSMkaJxJ3ZQJATCqsZmuhL+L2iYsi7kw3CpXD
	 X5+SVldQYGsyqiFcJwA1tdLBuw9RfmAdLH88+a7Dhc02i41VYQYSoNuus7+zTrGqMR
	 MRs1VIVpoOCW15d76OIXY1mxgTR6Jkp8jfW4lVJISANLtcPzGqY5YDIOs1iBgPPQ2r
	 MmAbx3eU7hFldltXZAJ4e45YuLduY8U28ng0ZjlLdPMS8K9mpGaI6lHG+sin6zoYeH
	 k6aN93XTlOnew==
Message-ID: <sashiko-outbox-220257@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next v2 15/15] wifi: ath12k: add Wi-Fi 8 PCI driver
 scaffolding for QCN9575
Reply-To: sashiko-reviews@lists.linux.dev
To: "Madhavan Ganesan" <madhavan.ganesan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-15-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v2-15-d81a3046290e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 06:34:20 +0000
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
- [High] wifi: ath12k: missing arch_init/arch_deinit in
  ath12k_wifi8_pci_driver
--

commit 08b309391dd1c851015ea97883831d1233952539
Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>

wifi: ath12k: add Wi-Fi 8 PCI driver scaffolding for QCN9575

This commit adds QCN9575 PCI window constants, a Wi-Fi 8 PCI probe
callback, and registers the Wi-Fi 8 PCI driver in
ath12k_wifi8_pci_init().

> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wi=
reless/ath/ath12k/wifi8/pci.c
> index 3975081d167b8..fd0489f8333f4 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi8/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c

[ ... ]

> +static struct ath12k_pci_driver ath12k_wifi8_pci_driver =3D {
> +	.name =3D "ath12k_wifi8_pci",
> +	.id_table =3D ath12k_wifi8_pci_id_table,
> +	.ops.probe =3D ath12k_wifi8_pci_probe,
> +	.reg_base =3D &ath12k_wifi8_reg_base,
> +};
> +
>  int ath12k_wifi8_pci_init(void)
>  {
> -	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. =
*/
> +	int ret;
> +
> +	ret =3D ath12k_pci_register_driver(ATH12K_DEVICE_FAMILY_WIFI8,
> +					 &ath12k_wifi8_pci_driver);
> +	if (ret) {
> +		pr_err("Failed to register ath12k Wi-Fi 8 driver: %d\n", ret);
> +		return ret;
> +	}
> +
>  	return 0;
>  }

[Severity: High]
Does ath12k_pci_register_driver() always fail with -EINVAL here because
ath12k_wifi8_pci_driver leaves .ops.arch_init and .ops.arch_deinit unset?

drivers/net/wireless/ath/ath12k/pci.c:ath12k_pci_register_driver() {
	...
	if (!driver || !driver->ops.probe ||
	    !driver->ops.arch_init || !driver->ops.arch_deinit)
		return -EINVAL;
	...
}

As a result, ath12k_wifi8_init() -> ath12k_wifi8_pci_init() fails and
prevents the ath12k_wifi8 module from loading.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-wifi8_qcn9=
575_bringup-v2-0-d81a3046290e@oss.qualcomm.com?part=3D15
