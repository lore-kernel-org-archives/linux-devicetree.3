Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739520;
	b=XX0nPzHTj5z7db0Qus6mWVk2tfyh6jHDFMHu6AZqG/jBz4mfKEsfL5V/AnKfzZyUMUff
	 EcHLdOV64nrbpPlhNLL1oG73W6eX7nyxtbP9z3Gii4wysa8LtyWXj85L2eQuVMUeZdPZ3
	 8RMUPZHNLxhh/sCPzarzmum3qZh6L8ygVI8jUZJdbv2ScViOqgnSQmQMlOYT5Upus6pGx
	 ETsc/1FhCTKv73JLmhEo2BPjhQMmE30l4tU1LXB9WLnt4UFpEcEnIgsjpOyKibHoAtDBj
	 1cMA6s9OC2RjJpvOhlHkOhEcwSefA+ZBDl5dk/RMMivRlJyOl8df+SpcFoAA2JDmmhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739520;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fQrZDcMG+3uTlFYy5lqv9p2lLlMEVESXqV9TfMItNcQ=;
	b=d/YyLdmp1oUFoHF35OEdF6eglt/Yfc6JMmURjq/bROLZ/vigdddmmXHBxmda8zL2aL+c
	 FJ2tpAIlE6PC4ZBmwze9OEXwazKAWyurASCH2/E6iY80u6hxlr+3g83+1gfNJmmCpoSIn
	 25bJhHb5S8Gm3Lv2q6uTQlSzSRaORRM0wX5iy/Ae7IKSDwybIEg3N+Lz+caQnqTRNLYXc
	 iFoQWI4hg9VZAVqFE16Nem2X38cITZOqowyE+cAA55liWf3ng88kzTAUlx+TB+HzwHcTK
	 PGc3H0el3NJOYCCi3E1Zrte5gEQTnjRmgBTXbJdZ32UOy0arfUj7mPmX/cfl6jcLFLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UIUjV8ot;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA63606A337
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UIUjV8ot
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383591F000C6;
	Sun, 15 Nov 2026 10:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739520;
	bh=fQrZDcMG+3uTlFYy5lqv9p2lLlMEVESXqV9TfMItNcQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UIUjV8otHZFK4Dk2XfjXZAL7NIpjOdxq6BhEkO/1bq6D4/KLxFO+7cH49E4M/ooaY
	 FHGNYwlK+BPhmUGr7ZelxqQGjTus0lwuJUBOjfhktf9EiCwsx773L+7pJSi3vsmswZ
	 Ypw4/PWnOK6jPjQV6B3Q68tZ6POxhpVFeweR74+x3N65X31xZskVU+eoLJEDrTDGDA
	 5X/0+Fe3Nvf3JdoJFKXtjYKJQ7gq9xN9YuANUtZ4b9eoJVVW7N04Wv3jpsIiPLiFW4
	 srIbCwT8kiIPv6axfs0yJFTMhPv/yEovKu7928cgX5gVPtuhSxKjsnQTHU5kLy3leJ
	 E4R6riqAuo1gA==
Message-ID: <sashiko-outbox-215405@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 15/15] net: airoha: add phylink support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114104426.235620-16-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
 <20261114104426.235620-16-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:45:19 +0000
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
- [Medium] net: airoha: Kconfig selects hidden PCS_AIROHA symbol in
  NET_AIROHA
--

commit 5ff2dca20962cb3dbeba514686627b90b3733e68
Author: Christian Marangi <ansuelsmth@gmail.com>

net: airoha: add phylink support

This commit adds phylink support for the GDM ports in the Airoha Ethernet
driver, including PCS attachment for GDM2/3/4 and phylink-backed ethtool
link ksettings callbacks.

> diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/a=
iroha/Kconfig
> index 1f6640a15fc94..5c54a07d2a768 100644
> --- a/drivers/net/ethernet/airoha/Kconfig
> +++ b/drivers/net/ethernet/airoha/Kconfig
> @@ -20,6 +20,8 @@ config NET_AIROHA
>  	depends on NET_DSA || !NET_DSA
>  	select NET_AIROHA_NPU
>  	select PAGE_POOL
> +	select PCS_AIROHA
> +	select PHYLINK

[Severity: Medium]
Should NET_AIROHA select FWNODE_PCS (or PCS_AIROHA_AN7581) instead of the
hidden PCS_AIROHA symbol?

PCS_AIROHA only builds pcs-airoha-common.o, while pcs-an7581.o is gated on
CONFIG_PCS_AIROHA_AN7581:

drivers/net/pcs/airoha/Makefile:
	obj-$(CONFIG_PCS_AIROHA)	:=3D pcs-airoha.o
	pcs-airoha-objs			:=3D pcs-airoha-common.o
	ifdef CONFIG_PCS_AIROHA_AN7581
	pcs-airoha-objs			+=3D pcs-an7581.o
	endif

When CONFIG_PCS_AIROHA_AN7581 is not enabled, selecting PCS_AIROHA builds
pcs-airoha without pcs-an7581.o, so the AN7581 PCS callbacks fall back to
inline stubs in pcs-airoha.h that return -EOPNOTSUPP during probe.
Conversely, if CONFIG_NET_AIROHA=3Dy and CONFIG_PCS_AIROHA_AN7581=3Dm,
selecting PCS_AIROHA forces CONFIG_PCS_AIROHA=3Dy and builds pcs-an7581.o
into vmlinux instead of as a module.

airoha_eth.c only calls fwnode_phylink_pcs_count() and
fwnode_phylink_pcs_parse(), which are provided by CONFIG_FWNODE_PCS.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114104426.2356=
20-1-ansuelsmth@gmail.com?part=3D15
