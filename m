Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593429;
	b=j2OsUVq3eVpVI9qKK8OIBQqpfB3OCY7e5owC/VkY6TulEveFC/d9nydFQGaPipEnSqUX
	 CO8XEei4r7Szw+KcXTzn2T8Vmv7jodQquVRSjjlLM2LvBsUCSjEiH1+ASFZgLC54KoQp5
	 fB7oNFbTkMCWPD+0WVkAHtzW4YPyQGwDvTjoH3E96/A6MGHdkn0jWMG67YX5DOVGVkN5B
	 MTueNH0EarPiV24ot4fWD4VWZ5uhSF/HNuZd1+qUHbXnij6gQrBpvDTJe7iu32m7CObUp
	 LHA7anpHAiL3XBjiLEgJmYwFGJiMFHGI9tEjyIXpTp4iFC4KY5Q1XyFG2jgXdsQ4LVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593429;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mgty7jKLaicG7G0rpN8Q6hf5SIf2JiodDDemvSF5o90=;
	b=w/HgC34aMPnOzsn86OeamQUUs1KFPfwsCHaD7MUvU2Hd9LU7cM94ipvY15pCNAWAqStM
	 DK2sDwoFWNkq4nyqV7Rmua8OPKcdp6xoCX3/cSel18RU/GbGOPlNVad9jCNWqhyr07SRo
	 gF+paH2GT7Ucycpj5shDW3GbBkzi5UczPAjiLAGkfg0vYSt+9pmLoD/6d6N4tlcAn6EPl
	 anP5qqQ7G1Voy4t7Mr/yOTR0gwhWNuruJSPCx4eQvjkELVnbWbVnqQ0os02Y4Bkvm0Lc5
	 fqmUtj9nRulUR7Q0POjbgKQx3o7aIc492FgmRwiF4Ms3FZpEr392HLhLGM3OCYj+Ylw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dssvLSef;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E4B606A31F
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dssvLSef
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A6A1F000C2;
	Wed, 21 Oct 2026 14:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792593429;
	bh=mgty7jKLaicG7G0rpN8Q6hf5SIf2JiodDDemvSF5o90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dssvLSeftUb6ZPuLe0vEZqmEBe/A0eljM3vvxGGV/zPc+Hpq3JJ2IrGWNt5cN/D23
	 9FYZMLZIyKb51dCaj2vj1bzsMlcrk5a4krBuD4uCSbAnz1G+Sj6bA190YYIOzyzU5N
	 Q6rLGxceRqe4K0KFFPZdb2OLDASVFHItm/tSy7Q6Ft7h4TDC4qkU8GjFMKYfwbwqM6
	 jwO7sIBrpQUlb0o5R4Y8qtZUxxp5gpKetBjkQQlkNTkltkAYxO9hD+vAxfU69a/SZ/
	 1bxR+NophaWc8mOQP0aUQMPmDY3cXa0OEE+vyuHc5A8w8KfTgFdh4yl+I4PQNEoU+/
	 sc/hiqWJvRRiA==
Message-ID: <sashiko-outbox-180387@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: qcom: shikra-cqm-evk, shikra-cqs-evk:
 Add HDMI overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: vishnu.saini@oss.qualcomm.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261021-shikra_display_overlays-v1-1-adaea735999f@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-1-adaea735999f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:37:08 +0000
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
- [Low] arm64: dts: qcom: unit_address_vs_reg warning on panel@0 in HDMI ov=
erlay
--

commit 76425af69dfb56a6561d933cc0de85c2b87df761
Author: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

arm64: dts: qcom: shikra-cqm-evk, shikra-cqs-evk: Add HDMI overlay

This commit adds a device tree overlay for the Shikra evaluation kits to
enable hdmi output via the lt9611uxd bridge on i2c4 and disable the default
dsi0 panel node.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso b/arch=
/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso
> new file mode 100644
> index 0000000000000..a7b77114061a5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso

[ ... ]

> +&mdss_dsi0 {
> +	panel@0 {
> +		status =3D "disabled";
> +	};
> +};

[Severity: Low]
Does defining panel@0 inside &mdss_dsi0 without a reg property trigger a
dtc unit_address_vs_reg warning when building device trees with extra
warnings enabled?

In scripts/Makefile.dtbs, -Wno-unit_address_vs_reg is not passed to dtc
when extra warnings are enabled:

scripts/Makefile.dtbs:
ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
DTC_FLAGS +=3D -Wno-unit_address_vs_reg \
...

When dtc compiles shikra-cqm-cqs-evk-hdmi.dtso, check_unit_address_vs_reg()
in scripts/dtc/checks.c only exempts the fragment node that directly
contains __overlay__, not child nodes nested inside __overlay__:

scripts/dtc/checks.c:check_unit_address_vs_reg() {
	if (get_subnode(node, "__overlay__")) {
		/* HACK: Overlay fragments are a special case */
		return;
	}
	...
	} else {
		if (unitname[0])
			FAIL(c, dti, node, "node has a unit name, but no reg or ranges property"=
);
	}
}

Because panel@0 has a unit address and no reg property in the overlay, dtc
warns on /fragment@2/__overlay__/panel@0.

Could panel@0 be given a label in arch/arm64/boot/dts/qcom/shikra-cqm-evk.d=
ts
and arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts so the overlay can disable =
it
via a top-level phandle reference (or specify #address-cells, #size-cells,
and reg =3D <0> here)?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-shikra_dis=
play_overlays-v1-0-adaea735999f@oss.qualcomm.com?part=3D1
