Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479345;
	b=xpky8W3FhhAHYWX7vUT5a9MUnZclHeQ26z3uMZn7UdU+XKLHaLgI28EhjzmaToD1e23Z
	 zu3WXOSlSmWWqQPbKr6KpqwmD3B8ibafQH07CsTgJVs5U/I8+a5WbsE0Fn5AbK0w3bVt3
	 RevSkpavfU9uBXjb92OydDIqY98NOxAbHt5OcPCo/eg2kpUY5WzeIfuUKu3erNnD7TrFV
	 eTsUwPy8P1OK6girU67D2DTluslu8CU6hQhW99/19KxQ11CGTNYHNfRQ0BoSy2XbLCcLO
	 tQcXbJMn+sFNX5kq1eLBUbE3EWVS0TnzqeU3cnNQniuS1H1A962KvTT9fYaxntjpYeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479345;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZMux2Tvl0fsKEjrNR8NknYtwdZX4ucNtPe4BG5XK0W8=;
	b=U0gkCA6ZW/+S93NWtV4EOWkZuBjFwN+jblOscIkdPgMKaMmcBT3NdTSqIUc4+uDxpqSP
	 gg3opowyQpPbJHqm6bwhbk8q3fKdlIOAasW9rh+Os4ZzOvIpGWuzFrhy/uowZ+Xy1mFIe
	 WgzeQJi5kqbjT3fCLhePRPPd6hiNCIikuJFUL+OuiAwKTG50S4ECcT5PYUF/N5yUNrFHv
	 MdbuhhyMxUC4og54y7nobcunyF4ATFWjL1whc6wEze+H4PtxIo5/8mFK0EV+VkmlPya2G
	 BjB6GQbCI8oBpLVI1kV4lw6Q/ZY0m7JU0DKs+xOI+nROzXMxujXz0DIWCzdsChgUI3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S053tN2B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7001D606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S053tN2B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB82F1F00A05;
	Thu, 12 Nov 2026 10:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794479345;
	bh=ZMux2Tvl0fsKEjrNR8NknYtwdZX4ucNtPe4BG5XK0W8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S053tN2BgFxh3UJRYU4uNMBp5Muh9L6LQ+ZQ1GxxD0sKWLLqX1zbsXIzpUCj6IxPN
	 D3XROAfJ6/nLsNT4/PeOJtR6+rS+0FLPz81gXxt/bXGqC1tx4AmU1+1yTky9UA81yj
	 PhufVbY+ehAXXKXLKjZKLxP3r2IzOXcoF7Kg+s5RgdInMj3Hq19oTQXTsLxTbPMcC8
	 oW3I+v/wDokcCTnAYPhVSEkFDA0VUzqCIOK7l79b0HoEGWLkKeDYhh9AszUE0/xg84
	 Z5C/fwjMxSyyO5CFYd7YccvaT5vKjkR+vDOlSG0XKgzc02bujIzXzrUiB5kyItnj4E
	 m3MMJDTkdSMvA==
Message-ID: <sashiko-outbox-210942@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 15/15] wifi: ath12k: add Wi-Fi 8 PCI driver
 scaffolding for QCN9575
Reply-To: sashiko-reviews@lists.linux.dev
To: "Madhavan Ganesan" <madhavan.ganesan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-15-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-15-3f30fbc2bb69@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 10:29:04 +0000
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
- [High] wifi: ath12k: missing arch_init and arch_deinit in
  ath12k_wifi8_pci_driver
--

commit ad19b62d9fe2e5840dd771d3681d43b9adc7965d
Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>

wifi: ath12k: add Wi-Fi 8 PCI driver scaffolding for QCN9575

This commit adds QCN9575 PCI window register constants, implements
ath12k_wifi8_pci_probe(), and registers ath12k_wifi8_pci_driver in
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
Does ath12k_pci_register_driver() always fail here with -EINVAL because
ath12k_wifi8_pci_driver omits .ops.arch_init and .ops.arch_deinit?

drivers/net/wireless/ath/ath12k/pci.c:ath12k_pci_register_driver() {
	...
	if (!driver || !driver->ops.probe ||
	    !driver->ops.arch_init || !driver->ops.arch_deinit)
		return -EINVAL;
	...
}

With both callbacks left NULL, ath12k_wifi8_pci_init() fails and
prevents the ath12k_wifi8 module from loading.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-wifi8_qcn9=
575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com?part=3D15
