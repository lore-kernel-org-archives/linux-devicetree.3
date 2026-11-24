Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539396;
	b=bb7Vchw6jEYwSLMJP7nb+PZPfDx9EB2A8MfJWhaMEIbPmI0FFzLwaEE8F5xKhhEBSo6I
	 7XvPxJbMl2NwffNBD1v0mxdh/X2s18Jqo7e98Y8inJ5BBC4Ds1+i4vTrgx6D0J2H+trgi
	 sIxO5FfmDK6oCUinrEiSxg2BSrotCwo0Imn4Eq7JB2U9jCIiDvgJrPcPPGBjuSAArYOmK
	 YMjlvB8spEEz0AwVhflrxqv5jrObsAorupt3/G24Cw2mzy7yf9AFXCkf4u0uLR6z8GKW9
	 GQQWLPLStTLxIPpX8ktmPMOTCslTb4sxwS92krGb0I/7wKat50OO/JBdEdVu3DlaTTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539396;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=b7clQLWOOai0/jTiRdTQwYcvvTbGhN2356WHhOjWJ7I=;
	b=2Jv/CrUXP8z36AYOHteJbS4dCqNNPRxOPMCBczUlEsoTRdbwsvCCeNlLlPX6JSi9S2w4
	 kHOpok8l7mhKwFKeMmkYzLHwkX1XCONGg2o4m36vadoV4m62ZsiTOOwV9MMRPewEIsCw9
	 VApR7QhkZg1oxha0RRG4RryaPVN0vtBh/0UM8X1g/YiJmkDKDe/rKTBNPX5OpvhftMCYf
	 p8UoD2F3YfBr3ekcragYM6PzbFoNlevk2QTw5mWH0zSwyDnC/gCa7gIfNZyqstGCVjk05
	 Nslrn6t7DqrWQdyJXQUN1HueKfRUXpTL0DZ4r7PepAW71b37qwrfzrzvqg8zLSxFdMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DUvcI+yZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F378606A33A
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DUvcI+yZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A5B1F000C0;
	Tue, 24 Nov 2026 16:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539395;
	bh=b7clQLWOOai0/jTiRdTQwYcvvTbGhN2356WHhOjWJ7I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DUvcI+yZcLHkpIXshkLovCJLDjQiPdWxY6gvhM74xkxPhEZAZuUjcLmyKatylzQ1b
	 Wq6qsk6eS7aCF+rTSgFFhGMxRAcJEe2jPmFbv8XxOzC8Y6yKgXhmID2qoHzYgqzp0J
	 +tOtE0B1CcbJ3BT3Tm8DWCuF9YHBNDWQHE3Dx5dHm9U4LZsc2ri1vqs/FQNRtZV1bD
	 Ki9GGDr5uhLHXMfxHQccbvKWDpv5HlpS0rmDHe2Rkmx0cHZzmbjo+Xi8vdlMD6FrQu
	 lM00r6TJmJ6pB4IxApK4B5+wVVHKvvsRzdVjEFPaSQN2gwxIJQXf+iAQQ3gFWOsgQY
	 XM7xWDusLLA4Q==
Message-ID: <sashiko-outbox-231627@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next v4 14/14] wifi: ath12k: add Wi-Fi 8 PCI driver
 scaffolding for QCN9575
Reply-To: sashiko-reviews@lists.linux.dev
To: "Madhavan Ganesan" <madhavan.ganesan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-14-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
 <20261124-wifi8_qcn9575_bringup-v4-14-1f5b87ece6a3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 16:56:33 +0000
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
- [High] wifi: ath12k: ath12k_wifi8_pci_init() fails due to NULL
  arch_init/arch_deinit
--

commit ca6bfb87b9d6ad76af31eb7c52a0bf5c4357ce9c
Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>

wifi: ath12k: add Wi-Fi 8 PCI driver scaffolding for QCN9575

This commit adds Wi-Fi 8 PCI window register definitions, the QCN9575
probe callback, and PCI driver registration in ath12k_wifi8_pci_init().

> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wi=
reless/ath/ath12k/wifi8/pci.c
> index 3975081d167b8..fd0489f8333f4 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi8/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
> @@ -5,14 +5,101 @@

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
Does ath12k_wifi8_pci_init() always fail with -EINVAL because
ath12k_wifi8_pci_driver leaves .ops.arch_init and .ops.arch_deinit NULL?

drivers/net/wireless/ath/ath12k/pci.c:ath12k_pci_register_driver() {
    ...
	if (!driver || !driver->ops.probe ||
	    !driver->ops.arch_init || !driver->ops.arch_deinit)
		return -EINVAL;
    ...
}

Because ath12k_wifi8_init() calls ath12k_wifi8_pci_init() during module
initialization, loading or initializing ath12k_wifi8 will fail on every
boot or modprobe even without QCN9575 hardware present.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-wifi8_qcn9=
575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com?part=3D14
