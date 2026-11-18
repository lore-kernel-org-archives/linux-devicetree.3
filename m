Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990668;
	b=CidK3FWHGh6pHSw6Ys/7MSJeKOOoXgYC2OC5wMw8mJWyPjWG56HvmyEg4Ghfu38wUrvA
	 lZkOGOo7PKKHeX8KhnRJYfv+aczMAzAyoUWMlTrWohe/TJTNgDlX/gYgV/vVgTqCT0hVC
	 DShQTg/R6FJ9Msm7VN5mpxw1Youmr9mqDcVlWb3c7Z7UllWhAiZfyxTZmBs2s8kVCioDK
	 KFTc2HpN87mpm5D/tMC/C+EYz1AVtt/FUxKFYnuVtbIbrSUIRMSl+vJRm48+TJ/RjJTDX
	 iuB5fLshsLxafvHgGScRulg7GbkvSPR4TvfEoavhiXzy24/D2QzUd+r8l4w1019qmHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990668;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TYjIXTKoc+cJqtxl4Bl7URpIe/oR1c/WVg7MWfJqmeY=;
	b=ZV3JQ9h0Biw8ezdpPEtjSK5wquK3dHJB3+3MHOnE+0rx3aDMVnRZfb/iiT44mNtQKke7
	 gTJDY3OPSvJFTnsRdr5Q7vwheLCZLRtVj63GNSyWXRFMB6st/AZEsLW6fUr0t4pGetV/w
	 P0dd4wC4NgIscfw/K616GTBFpTMEd711hcjqBkkCtxY9vdEWv7H2d4AT297FBBF4wJtQ5
	 3ITuDXU+tWM9qgK6VSAlfaE17+K+q4KzKijKgLeW4wFHMkrGQ9injbSssd+UYBqpQvtV8
	 4sDQ20gKh7ziuvMpPSKPhNGoF+4gPbmxvQe+VjUUn1TwU4+V8q0VcmDjir5tJUAKzoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E0pP+ceH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A97606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E0pP+ceH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872ED1F000C4;
	Wed, 18 Nov 2026 08:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990667;
	bh=TYjIXTKoc+cJqtxl4Bl7URpIe/oR1c/WVg7MWfJqmeY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E0pP+ceHuBBQheYY5vJa8lXD5xmIFTPCaLkBToxJ0Bswz6JFCQpSX+fq8MSxMYwUV
	 QsmUEV1HD1sPd1boC6MPwNOe0rzbMqu/98Kj3sCO7nA22Bg7d8Tx1qbK7O7c9QAnK5
	 qe/rSGnX0M/vAxIDSK9ydPDlhz6iyD/1g3ECOJifx6c972XapjePz/L4CdIVMf44AD
	 79RIxmxd9l5NVRpeYRekfMlvjRhxaiTDr8xnuUJGP1t8eQy+UTkbQdMDV7tJf5T/6K
	 Ovn+LxGaX9aKi9Vf1TeX0oW5Dg6xYoBLZ0AYulRGmuyAEv9FRgoECoiYwbMTrrTWtH
	 KF7zYMwQFDkFA==
Message-ID: <sashiko-outbox-220454@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next v3 15/15] wifi: ath12k: add Wi-Fi 8 PCI driver
 scaffolding for QCN9575
Reply-To: sashiko-reviews@lists.linux.dev
To: "Madhavan Ganesan" <madhavan.ganesan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-15-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-15-9875d2a3953f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:31:07 +0000
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

commit 86cf6f76e704215111a2398f4b1b921425a02b1b
Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>

wifi: ath12k: add Wi-Fi 8 PCI driver scaffolding for QCN9575

This commit adds QCN9575 PCI window constants, a probe callback, and PCI
driver registration scaffolding for Wi-Fi 8 devices.

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

[Severity: High]
Does ath12k_pci_register_driver() always fail with -EINVAL here because
ath12k_wifi8_pci_driver leaves ops.arch_init and ops.arch_deinit NULL?

drivers/net/wireless/ath/ath12k/pci.c:ath12k_pci_register_driver() {
    ...
	if (!driver || !driver->ops.probe ||
	    !driver->ops.arch_init || !driver->ops.arch_deinit)
		return -EINVAL;
    ...
}

Even though ath12k_wifi8_pci_id_table is empty, ath12k_wifi8_init() calls
ath12k_wifi8_pci_init() at module load time, so loading ath12k_wifi8 fails
unconditionally with -EINVAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-wifi8_qcn9=
575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com?part=3D15
