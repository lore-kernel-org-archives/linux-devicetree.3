Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013108;
	b=r/9fF2LECwzJdMq7SvSzS0wF/3VxjsJnuCUMjr25pxfvxuSiWO4kVuWkdzLQ6ajW16kE
	 +IXurT6NIlCd91QzMSydRQJNKSbheEC8Zda37n3XdGphKPas0SAPWOi20gYtVoaCCrAPD
	 vEIcJKpeZ4fd8Z8SYqUqv6O03Ll1GHenIvx+I6avX1GopBb4DJFaKA3IW+9JTSELB6iPg
	 EAJE9tpVPn7U9klkRG/OWLQW17K3pe1xU5Pa6kO3KufIYqKRtjGfnhTmZotlcAEzloGLS
	 OKOHAxxOB8znm7uUGxiYjHD2UJCyiyoH88KDSNubKULpXvJKOqHlxrqfJfSAgVJnKXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013108;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6wABfdgJn9uXdChsaU3X547Znlis1fzmOShZNL8S5pg=;
	b=JbXjelw1WkAhV7Rv+nctTOmvPmM5cGPbCF1qy+OCaIuNnI4m/1zw3tLwGTH4CXbusAgU
	 AqqhzRX5ybgM45oGv7jOivHPeAr2py7jHm2+hfaXXj7nG5NNfNIIP3x1CfBtDui9VkiWV
	 cJ4rBlBaAlIj9GWwBFxzLzxQqp9u6BZSFeZtT3KlBWjWUAIHGkn7dUi5j9hVUIeJCPz4G
	 7MpJS/6fg5NW3QRGABkJIQzgfUBW3LGgOCk8uTERLLLNuTe/x1f0H2vTVDnZjbufDAGga
	 sgFwyxPY6mRkwJoDcrN1yEE0p0k7VbO5Di1d8rMPjtDveGBRzfi71XbDaXYnf3Z0IeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z7JVWJBY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6686606A325
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z7JVWJBY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C271F01343;
	Mon, 26 Oct 2026 11:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793013107;
	bh=6wABfdgJn9uXdChsaU3X547Znlis1fzmOShZNL8S5pg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z7JVWJBYeYdxzhC9LgVKm5DvX9PQERmTXLnyeuvmLEDZgEUlfHiRIOfWdsOGQPZNP
	 wFnXgt2ZSCb8P7D83JctvZe3uzDpkSW4zxM8IxGOwkabD4iOLuiwgqAkymKFpte8Co
	 ZGf81OOx2diA5Z1xPRep7nseDWe47Hwmt4lPO0bmezgeHUmXu8ae8xJZrk76DHwOXh
	 C1LPabdgBxJtU8FnA1xgYWkML7RW6avqHMnm/b9hxIcC8caXuk0y3xsplBTgvlN9n9
	 tXPCut3BqyI99fbM6UfsWXxDZmg8/nrFlchBjI7XiCojPpowD8viCo08wnk8WTU2z8
	 VDLSfPx4gjfRg==
Message-ID: <sashiko-outbox-185067@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/9] arm64: dts: airoha: en7581: add watchdog node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026095727.31708-6-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
 <20261026095727.31708-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 11:11:46 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: airoha: watchdog reg size 0x38 excludes WDT_RELOAD a=
t 0x38
--

commit 285873958d4bd82b85e9f3812fdf852db2de2884
Author: Christian Marangi <ansuelsmth@gmail.com>

arm64: dts: airoha: en7581: add watchdog node

This commit adds the watchdog device tree node to en7581.dtsi to handle
system stalls and reboots.

> diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts=
/airoha/en7581.dtsi
> index 58bd8b318910e..3a4a4fb0eba9b 100644
> --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
> @@ -484,6 +484,14 @@ uart1: serial@1fbf0000 {
>  			clock-frequency =3D <1843200>;
>  		};
> =20
> +		watchdog@1fbf0100 {
> +			compatible =3D "airoha,en7581-wdt";
> +			reg =3D <0x0 0x1fbf0100 0x0 0x38>;

[Severity: Medium]
Should the reg size in watchdog@1fbf0100 be 0x3c instead of 0x38?

In drivers/watchdog/airoha_wdt.c, WDT_RELOAD is defined at offset 0x38 and =
is
accessed as a 32-bit register in airoha_wdt_ping() when pinging or resuming
the watchdog:

#define WDT_RELOAD			0x38
#define   WDT_RLD			BIT(0)
...
static int airoha_wdt_ping(struct watchdog_device *wdd)
{
	struct airoha_wdt_desc *airoha_wdt =3D watchdog_get_drvdata(wdd);
	u32 val;

	val =3D readl(airoha_wdt->base + WDT_RELOAD);
	val |=3D WDT_RLD;
	writel(val, airoha_wdt->base + WDT_RELOAD);

	return 0;
}

With a size of 0x38, the resource mapped via devm_platform_ioremap_resource=
()
in airoha_wdt_probe() only covers offsets 0x00 through 0x37, leaving the
4-byte WDT_RELOAD register at 0x38..0x3b outside the declared MMIO resource
region (and the binding example in
Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml also uses
0x3c).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026095727.3170=
8-1-ansuelsmth@gmail.com?part=3D5
