Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD79C44AB84
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425486; cv=none; b=uw41y8tdlDipRWB2kHAr25Zed4LRynW67F3N1e6eD5EZxYjf/4sV1XmHCp2+RRZl9bbDYXBlhAro9TRvQITwEXdniTeLB5j7be3zLtPZSO9yx0l3X1bj2d9p0WasjwZ+Z5gWKkYHWO2QOB3U0S4DuwQyMjxHmHdjrAIg5Vuqkvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425486; c=relaxed/simple;
	bh=au0TMt0cGNITV+D2h/bO2AzfGBawEZAt1u+9aWshTCQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QYDSADsLLQP64S8rZhkcmy/XzvU8Fs6EbLMvg7+9LXTN+j4NMPULtl0MaYMY7zzuqlIgUGUtUsdXqu535kn1uZBkiDo78gSHdwGG3jz51xJrWFJXoo7QPJZNwG3JxZlS5IZhAnTlErB5pLonQE+sHjXiOzn5OQhDo2zArVo7ZFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XwxsrGA8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XwxsrGA8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA9C1F00A3A;
	Thu, 30 Jul 2026 15:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785425484;
	bh=8wBn0iSrweF5+d7fzXGLatIBfmARioYQt1Df5wDOmvw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XwxsrGA8R23xto/2LgHGiM+2u3MAqmfR0khriBwEPVDqs2yOQsVE9DhM0jl8sQlnE
	 +pxKyYZkwtOngIhRH/nbWETG4Guh37I6Sgpb6IhePHL4UY7XVBf0FMZabrUtlLe/og
	 A6B8RgLcNS9B24cRjNaoMBWB1gf2YQvryXbAlH9kY+hVfhZ8wdzPPQoYSmReM26iq+
	 TrOMSP1F1BVO+Z4IkGDuFYgTdG7IosofMLWRYT8x8UpeZFwa/poSwefko5DFr8IMng
	 MB+cQT+6aw4olkb89utz2Uvx+l3+oLmgOZvBl+fJfipnRSv1RBkS4lfNWp7DxD9PLW
	 V7hOX1FVPaLIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 15:31:23 +0000
Message-Id: <20260730153124.3FA9C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Critical] Unmanaged Interconnect Bandwidth / DT Misconfiguration
- [High] Incomplete / Ambiguous OPP Performance State Mapping

Pre-existing issues:
- [Critical] Missing Power Domain Attachment Logic (Driver)
- [High] Clock Ordering and Unconfigured Clocks
--

--- Patch [3]: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder no=
de ---
commit 78bc4a1419802a831ed1f485f610899cf6a592a5
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

arm64: dts: qcom: sm8250: Add JPEG encoder node

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/q=
com/sm8250.dtsi
> index f11da2ca41818..d42b294193202 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi

[ ... ]

> +		jpeg-encoder@ac53000 {
> +			compatible =3D "qcom,sm8250-jpeg-enc";
> +			status =3D "disabled";
> +
> +			reg =3D <0x0 0x0ac53000 0x0 0x1000>;
> +
> +			interrupts =3D <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains =3D <&camcc TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MX>;

[Severity: High]
Will the OPP framework map performance states to the correct domain here?

The device node lists three power domains, but the jpeg_opp_table
provides only a single required-opps entry per OPP. The OPP framework
maps required-opps entries sequentially to attached genpd domains.

It looks like this maps the single entry to the first domain
(TITAN_TOP_GDSC), which does not support performance states, while the
scalable MMCX and MX domains receive no performance scaling mapping. Could
this lead to voltage scaling silently failing?

> +			power-domain-names =3D "titan_top", "mmcx", "mx";

[ ... ]

> +			jpeg_opp_table: opp-table {
> +				compatible =3D "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz =3D /bits/ 64 <400000000>,
> +						 /bits/ 64 <100000000>;
> +					required-opps =3D <&rpmhpd_opp_min_svs>;
> +				};

[Severity: Critical]
Are we missing the opp-peak-kBps arrays required for interconnect bandwidth
voting?

The DT node defines interconnects, but the OPP table omits opp-peak-kBps.
If the driver relies entirely on the OPP framework for interconnect managem=
ent,
without opp-peak-kBps the framework votes for 0 kBps when an OPP is set.

Could this cause a synchronous external abort when the JPEG hardware access=
es
memory through unclocked or unpowered NoC paths?

[ ... ]

[Severity: Critical]
This isn't a bug introduced by this patch, but does the qcom-jpeg driver
have the necessary logic to attach and manage multiple power domains?

The new device tree node specifies three power domains:

power-domains =3D <&camcc TITAN_TOP_GDSC>,
		<&rpmhpd RPMHPD_MMCX>,
		<&rpmhpd RPMHPD_MX>;

Looking at the driver's probe function:

drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c:qcom_jpeg_probe() {
    ...
    rc =3D devm_pm_runtime_enable(jenc->dev);
    if (rc)
        goto err_free_jenc;
    ...
}

The driver relies solely on the driver core, which automatically attaches
only the first domain (TITAN_TOP_GDSC). Because the probe function does
not explicitly call devm_pm_domain_attach_list(), the MMCX and MX domains
are never powered on.

Will this result in unhandled page faults when accessing unpowered hardware
registers?

[Severity: High]
This is a pre-existing issue, but is the clock ordering correct when resumi=
ng
or during active transitions?

Looking at the driver's clock enablement logic:

drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c:qcom_jpeg_clk_on() {
    ...
    rc =3D clk_bulk_prepare_enable(jenc->num_clks, jenc->clks);
    if (rc)
        return rc;

    /* setup the OPP according to the calculated optimal frequency */
    opp =3D dev_pm_opp_find_freq_ceil_indexed(jenc->dev, &jenc->opt_freq, J=
PEG_OPP_CORE_IDX);
    ...
    rc =3D dev_pm_opp_set_opp(jenc->dev, opp);
    ...
}

Clocks are explicitly enabled before the OPP framework handles the required
voltage scaling constraints via dev_pm_opp_set_opp(). If the bootloader left
clocks at a high frequency, enabling them before voltage is scaled up could
violate hardware voltage constraints.

Additionally, three of the five provided clocks (sf_axi, core_ahb, cpas_ahb)
are never rate-configured by the driver, leaving them at arbitrary unmanaged
rates. Could this lead to hardware instability?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730150524.2659=
577-1-atanas.filipov@oss.qualcomm.com?part=3D3
