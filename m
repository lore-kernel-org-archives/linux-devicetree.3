Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B65D3009D6
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 03:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779939646; cv=none; b=C1WcS6Mk8A+m6WHdD2Y8ylShYsVwNqRSoTdX+zqlx1LrKWwZQEj6DRJqyqZGhJGIf+cMW01vuiprT/QHktgpK/ntG8IDWUqudypiEyVxJVt3m2rVKZWCG3rrd+FBd4fG9Ic3XKak70hg7UmEWQR7qBpZPFdxhuZvm64Piet3W8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779939646; c=relaxed/simple;
	bh=iW/Uh+SSAf3kuL/wzfm0TRokgSsIZm0CbzZaCtfiSBg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o20N3g8/UK3T66PTy4DsXl4drnX2PmLl9OFUndzsfQN1+vV4kavaFh41RdyibsAmI/J/e0XCBttaSJwzb/PVt7HHo24WlBCrBqA9+g+a8FL4Ai4Ir/zLE8rZBOCCUueI6NMhxiRw+ZTJc3PkDfTMKfWMSitXQvCKmV+0VVs3rgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAKsT3hJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAKsT3hJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5EA1F00A3A;
	Thu, 28 May 2026 03:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779939645;
	bh=1grl156ENExPNZW+Y79YyQI5u6HNOxRjQtfDrqBcN6Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XAKsT3hJVeNAB+EKwhIYhALKVr2XY822/ASNmKMonHfLxvyXHEzbJd3lbrz4aeJK9
	 RnlEGjkvTd68bIXjcQJemPA7Qbs8TCeQsjVxrI1BfYr/JOfX0+D4Pp2xxf2CROoMS8
	 TDr6gOBBWYuRmPNZA8C/kjrlSASxaYeW6z5vuVPtaGRPfyYyWzI5AYQfoajW2PODYO
	 Cu+6qSDUfiPuLi7hTgJOailEtPNGVQ3Wto5jdbT0v+i1PkEAh+hjGwirxjRY0l1oRh
	 TvzIwG70KrD/ylKuCKujy+hYLPoZ61x5ORliGhr2s9LLv8FgYjuGukf2GFNTaLjJA2
	 E2MDd7d3VKdLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527-tcsr_qref_0527-v4-3-ded83866c9d9@oss.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-3-ded83866c9d9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 03:40:43 +0000
Message-Id: <20260528034044.8D5EA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] TCSR_PCIE_4_CLKREF_EN incorrectly reuses the regulator mapping for=
 PCIe 2, leaving its actual PHY unpowered.
--

commit d13bf7559fc4e2e26b752b7696e31f42885ef946
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

clk: qcom: tcsrcc-glymur: Migrate tcsr_pcie_N_clkref_en to clk_ref common h=
elper

This commit replaces local clk_branch-based clkref definitions with
descriptor-based registration via qcom_clk_ref_probe(). It keeps the driver
focused on clock metadata and reuses common runtime logic.

> diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-g=
lymur.c
> index 9c0edebcdbb12..e317003398d16 100644
> --- a/drivers/clk/qcom/tcsrcc-glymur.c
> +++ b/drivers/clk/qcom/tcsrcc-glymur.c
[ ... ]
> @@ -4,277 +4,111 @@
[ ... ]
> +static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] =3D {
[ ... ]
> +	[TCSR_PCIE_4_CLKREF_EN] =3D {
> +		.name =3D "tcsr_pcie_4_clkref_en",
> +		.offset =3D 0x58,
> +		.regulator_names =3D glymur_tcsr_tx1_rpt012_rx2_regulators,
> +		.num_regulators =3D ARRAY_SIZE(glymur_tcsr_tx1_rpt012_rx2_regulators),
>  	},

[Severity: High]
Does TCSR_PCIE_4_CLKREF_EN incorrectly reuse the regulator mapping for PCIe=
 2?

This array powers the rx2 and rpt2 regulators, which belong to the PCIe 2 P=
HY,
leaving the actual PCIe 4 PHY unpowered.

The device tree binding requires vdda-qrefrpt3-0p9-supply,
vdda-qrefrpt4-0p9-supply, and vdda-qrefrx4-0p9-supply for Glymur.=20

Since these supplies are absent from the driver's defined arrays, should a
dedicated array be defined for the RX4 and RPT3/4 blocks instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-tcsr_qref_=
0527-v4-0-ded83866c9d9@oss.qualcomm.com?part=3D3
