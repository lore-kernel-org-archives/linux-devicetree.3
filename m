Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDF33F1AC4
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785499330; cv=none; b=MKlnbvo02qEBhjF4SX25Tey+YU/x+ZldnoMujMrDBFJrW0ByjP/V/9l2/WppMyhiSAZ+AdZHoSQx2fbfwBvdXyberqdbPX0nCG6yK+VztQuH4Y4bvi5etGUeFLLMwWCmnfYGVyo42rNUDVx8tpgKgQa/0SmnGIa0H1O05V0Gnsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785499330; c=relaxed/simple;
	bh=FaqMyd1q7DnrcVayhqe6eLmpnyBZKCzp+xOrs+Y49PI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h4C8t8BDfdMTgVLAM+ejeEG25ysFwjORnnHySwOrW7Wwc3totKwviAvYKnQuDT1GcpgNpiUbUe0B01tuIsHpHdAVPNqTbgb9vQs5iLSCeMN/11uy4A7l/aXwOT8esAwJMcxPqHJaWXUyvC4W1ptNj21O4rYkJwFEY4y/HVVaSZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EDVS30sI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EDVS30sI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B971F000E9;
	Fri, 31 Jul 2026 12:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785499329;
	bh=H/pLGKLIo4GV4p/pdh8LV7o1L/6FdHHgxE21YPdLD10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EDVS30sIYimNVykIcbsIsHuAAVvh0mVisQHViX6FEsvepfZWvMTvWPOIFzXh4qhta
	 rLj4fleGdFYlJOWIfzuJ2m1bKlPvShk6nn7W9a0kqRkXGQn2TLydDlfnIEehrpRxF/
	 8JL/HjzwRyXFJ8i5ieZQmTr7PjbnZ7yeOA4tdjcIEyrkZ+rk9HFu5mJ2eRpT7HT6tI
	 grOu3vw9zMI4pt5HJm2oeZbSRE4VAdMgWPtKVmvtZuKMx68LCGOn51JUZ+ERDT6fvn
	 P72UjwWXIbF0Yn2y7eVCAoP92G9dkojDpLSVmk4696C5x4CimCppDnEAkUOm/r7akg
	 PG/UM5sf53BHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/10] ARM: tegra: tf701t: Add MC and EMC timing
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260731114106.169398-4-clamor95@gmail.com>
References: <20260731114106.169398-1-clamor95@gmail.com>
 <20260731114106.169398-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 12:02:07 +0000
Message-Id: <20260731120208.53B971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The tegra114-emc driver causes a heap out-of-bounds write by c=
alling tegra124_clk_set_emc_callbacks(), which incorrectly casts the Tegra1=
14 "emc" GATE clock to a struct tegra_clk_emc.
--

--- Patch [3]: [PATCH v3 03/10] ARM: tegra: tf701t: Add MC and EMC timing n=
odes ---
commit 0da36cf6ac395d6c7a0f9761226778f6cf5ac2ed
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: tf701t: Add MC and EMC timing nodes

This commit configures the Memory Controllers for the ASUS TF701T by adding
the required EMC and MC timing nodes to the device tree.

> diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm=
/boot/dts/nvidia/tegra114-asus-tf701t.dts
> --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> @@ -1610,6 +1693,636 @@ i2c-thermtrip {
>  		};
>  	};
> =20
> +	memory-controller@70019000 {
> +		emc-timings-0 {
> +			/* Mozart Rev B Hynix DDR3 792MHz */
> +			nvidia,ram-code =3D <0>;

[Severity: Critical]
This isn't a bug introduced by this patch, but it appears that enabling the=
se
nodes causes the tegra114-emc driver to probe, which triggers a pre-existing
heap out-of-bounds write.

During probe, drivers/memory/tegra/tegra114-emc.c:tegra114_emc_probe() calls
tegra124_clk_set_emc_callbacks(). That function retrieves the "emc" clock a=
nd
blindly casts it to struct tegra_clk_emc to assign the callbacks:

drivers/clk/tegra/clk-tegra124-emc.c:tegra124_clk_set_emc_callbacks() {
    ...
    hw =3D __clk_get_hw(clk);
    tegra =3D container_of(hw, struct tegra_clk_emc, hw);

    tegra->prepare_timing_change =3D prep_cb;
    tegra->complete_timing_change =3D complete_cb;
    ...
}

However, on Tegra114, the "emc" clock is registered as a much smaller
struct tegra_clk_periph_gate, not a struct tegra_clk_emc:

drivers/clk/tegra/clk-tegra-periph.c:gate_clks() {
    ...
    GATE("emc", "emc_mux", 57, 0, tegra_clk_emc, CLK_IS_CRITICAL),
    ...
}

Writing to tegra->prepare_timing_change and tegra->complete_timing_change
overwrites adjacent memory past the end of the tegra_clk_periph_gate struct=
ure.

Should the clock registration in Tegra114 be updated to use tegra_clk_emc,
or does the EMC driver need a different way to handle callbacks on this
platform before these nodes are enabled?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731114106.1693=
98-1-clamor95@gmail.com?part=3D3
