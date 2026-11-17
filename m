Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954841;
	b=4LsBCtU3tuZ+I/8GQZzT16rayOr4HvM7SKVml/HSQMlBoUBLtDyRAxDKiMfC1GKra38O
	 hvv5iVnr5S/Y0E1Mb1xVxo3VNvqO8hnyzlvycZqIWbunTCJNboqC4qHHVPCqXpQOs9g7f
	 q1NZjSEkvyC4Kfk3bAC1pc28Q758bH5afwuMA320ooR1ldUjDoMXe9SyGX14QYxQZoJAK
	 3ZbDNjQDvMpyOh0/BbYYQOiVz61IDK32ulroI8VyBjcZiChqJaxnIiFxZDjxG4eDKsNzR
	 ZTVPyegFtvmUFBb/XfAluaeGrwFV3y9h+avJItGksVxbQpKHDCDlby7yLJpL2yamTDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954841;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BRQPZrXDnfJE/V+QLtvaLZR4zsB4nU0XWLHNSB5NbYs=;
	b=Yo5CAwVQrWiTOpf4JEvosBAo5Y6q6YjNBqV1wMYhbEJ9N2gWYoc3lZGKKJvPFzvPzhLf
	 2VNRcrbqBXgZGOW/do7Q286ArkPn+9KUEMZLen0VtOQe3TpeR4kKL1m5psMZBPbCI8+Ye
	 GCMVTNtCBozqkd15jByE2UQrz0rNO0gwv5BbP/BtrNoNf740wpx28lH4Si6Zm02Wa7dxY
	 7xxzyfDx0MZFHUm6nKjNutZFfked0GXzy5ylBwjQ6AIM17ozSDaWwRufDpTvnYXqCjBR3
	 uBWrDMSvdVTR2HRbgDTRqepdxRVJDc1JtggHy+HCvt89UZU7XRF0yIXYAS4TCQX4Ixg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A+mLupPG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59E1606A335
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A+mLupPG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117B11F000C5;
	Tue, 17 Nov 2026 22:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794954841;
	bh=BRQPZrXDnfJE/V+QLtvaLZR4zsB4nU0XWLHNSB5NbYs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A+mLupPGwu1oLxbyFoRQjx+YLlc/10mJSJtd1GkxuFGNdhxUuXfs0NGwjd1KZ5TbJ
	 IZGmWcd5wAXDXTuMqSbCNymwDJKHJHrM8k+VJ+7kC2rD6Xuvd1dU6s+10HNFJxFYsl
	 cPGdUApjHqs7qEBGHrSVqDLZ8NQAyK7TmR4ymwsNGfnkcrCDp04X/I130P2rIii2Cx
	 E3L/OwnrG4pucGja+XIwPkHnWwhINBdydBpQFMW4k7o7Y7fiDee8zUmEQtDwQAGUhV
	 NbrilXvLbVUjpt+oXghT4Bhlu6nAufTstlt2vxuGIcqADYIrLU7Lm3+kcmwfD+YTN5
	 fwozOnCu0Jv9g==
Message-ID: <sashiko-outbox-219756@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 8/9] net: add KUnit coverage for FA and
 flowtable path validation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Florian Fainelli" <florian.fainelli@broadcom.com>
Cc: =?utf-8?b?b3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5EIEZMQVRURU5FRCBERVZJ?=
 =?utf-8?b?Q0UgVFJFRSBCSU5ESU5HUw==?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116222519.1416501-9-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
 <20261116222519.1416501-9-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 22:34:00 +0000
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
- [Medium] net: broadcom: fa: invalid MMIO heap pointer in bcm-ns-fa
  KUnit tests
--

commit ba8a6de53c2a0a0ed0378db8bfcb3ef2f7005c51
Author: Florian Fainelli <florian.fainelli@broadcom.com>

net: add KUnit coverage for FA and flowtable path validation

This commit adds KUnit test suites for Broadcom B53 FA exception guards,
Northstar flow accelerator rule encoding and invalidation, Broadcom FA DSA
tags, and Netfilter flowtable cached path validation.

> diff --git a/drivers/net/ethernet/broadcom/bcm-ns-fa-test.c b/drivers/net=
/ethernet/broadcom/bcm-ns-fa-test.c
> new file mode 100644
> index 0000000000000..59406f84809e7
> --- /dev/null
> +++ b/drivers/net/ethernet/broadcom/bcm-ns-fa-test.c
[ ... ]
> +static void fa_test_tcp_control_readiness(struct kunit *test)
> +{
> +	struct bcm_ns_fa *fa =3D kunit_kzalloc(test, sizeof(*fa), GFP_KERNEL);
> +
> +	KUNIT_ASSERT_NOT_NULL(test, fa);
> +	fa->regs =3D (void __iomem *)kunit_kzalloc(test, 0xc0, GFP_KERNEL);
> +	fa->learned =3D kunit_kcalloc(test, FA_SLOTS, sizeof(*fa->learned), GFP=
_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, fa->regs);
> +	KUNIT_ASSERT_NOT_NULL(test, fa->learned);
> +	mutex_init(&fa->lock);
> +	spin_lock_init(&fa->learn_lock);
> +	fa_control_state_change(fa, true);
> +	KUNIT_EXPECT_TRUE(test, fa->tcp_ready);
> +	fa_control_state_change(fa, false);
> +	KUNIT_EXPECT_FALSE(test, fa->tcp_ready);
> +	fa->stopping =3D true;
> +	fa_control_state_change(fa, true);
> +	KUNIT_EXPECT_FALSE(test, fa->tcp_ready);
> +}
> +
> +static void fa_test_lookup_gate_preserves_tags(struct kunit *test)
> +{
> +	struct bcm_ns_fa *fa =3D kunit_kzalloc(test, sizeof(*fa), GFP_KERNEL);
> +	u32 *regs =3D kunit_kzalloc(test, 0xc0, GFP_KERNEL);
> +	u32 control =3D FA_CTL_CRC_OVERWRITE | FA_CTL_NO_DA_CHECK;
> +	u32 header =3D FA_BRCM_HW | FA_BRCM_RX | FA_BRCM_TX | FA_BRCM_PARSE_EXC=
EPTIONS;
> +
> +	KUNIT_ASSERT_NOT_NULL(test, fa);
> +	KUNIT_ASSERT_NOT_NULL(test, regs);
> +	fa->regs =3D (void __iomem *)regs;
> +	writel(control, fa->regs + FA_CTL);
> +	writel(header, fa->regs + FA_BRCM_HDR);
> +	fa->enabled =3D true;
> +	fa->tcp_ready =3D true;
> +	fa->route_mtu_ok =3D true;
> +	fa_lookup_update(fa);
> +	KUNIT_EXPECT_EQ(test, readl(fa->regs + FA_L2_ETHERTYPE),
> +			(u32)(ETH_P_IP | ETH_P_IPV6 << 16));

[Severity: Medium]
Can fa->regs be backed by a raw kunit_kzalloc() buffer when writel() and
readl() are called on it here and in fa_test_invalidation()?

Running this suite under the default User Mode Linux KUnit runner (with
drivers/net/ethernet/broadcom/.kunitconfig) enables indirect iomem
emulation in lib/logic_iomem.c, where get_area() rejects plain heap
addresses that lack the ioremap bias.  Every readl() and writel() on
fa->regs triggers a warning splat, drops the write, and returns
0xffffffffU from readl(), causing the register expectations in
fa_test_lookup_gate_preserves_tags() and owner.lookup_stopped in
fa_test_invalidation() to fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116222519.1416=
501-1-florian.fainelli@broadcom.com?part=3D8
