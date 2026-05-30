Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE051D6BB
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 14:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780150450; cv=none; b=RBQRf2OwXPfF4rqXbxU7i0ozctXRYU4dmoBu43dPMo4Wki7GQd6AqeQ8RVz7av23a0Ui+bvcOxfXuTKblYNP+eau2SU3OAXEexdbmUEB7tHFae2lCp2gZhLRvUtofwkzJf1NiCHyh3AKTRTscUMowwdiZwqoFxwWPW57Qkc0WoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780150450; c=relaxed/simple;
	bh=i3+pkG0ZRJGbRVFojyhQauFR3QX0EHqVgwjXjLEZ6LE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pZfm3wbTUj4DBIPVz+JI7LysxWBmFEIhobOAeRRNLQrGBBLm2/npuy15FVokg2+eCTSM5/q1l88zDv+eyZqLffD1HtCuT5J8oGoMvJ3fG4MQ86BNiAR1r8ycWOIU7GxPfbLqyvWi8puDLkDQL6R/MngqVRmo52w4Qo9EZi5Ute0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdxWsaZ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdxWsaZ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4DD1F00893;
	Sat, 30 May 2026 14:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780150448;
	bh=HFDucF7xpr9oYPoPEmopPSL1kpw95cLn5So/ruYQSYU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fdxWsaZ9Ov3S2woc6jCPWerGnGrO774d+NHaoBPoHmzebxb2eE4FVx//Km1MfJ3Qg
	 wUxlkEfko3w33jO/AQWRrzOvb9CzLt4GnYVW6aL0Zed7rOCzvyRGIifR7L8H0kNNob
	 kogiIt2af3mL5Uy2mwxekfOaP1Nyv8amiMvRNN5Tu65t6YnvVKlMOmHlIjxkjcoVeC
	 02Ju0Yk00B+RHpKNOO4J2ekUXFjb9O9idJBSJb8wQbOnqHXT9zj40Q0PqIWbJO8u86
	 iHCi59PA+2Kuq2lrjSjIsnhD1Jbeh43sQ8mD1Peo6u6E2945bCONWbneBJJZJuupe6
	 CZc7Bub28RgSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: add MSM8x60 NoC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <208381c551886a53541b162e69b5c1e13aeec531.1780148149.git.github.com@herrie.org>
References: <208381c551886a53541b162e69b5c1e13aeec531.1780148149.git.github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 14:14:07 +0000
Message-Id: <20260530141408.4C4DD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] Compilation failure due to undeclared, unprefixed identifiers =
in node array initializers.
- [High] Clock rate calculation uses per-node buswidth and caches globally-=
shared clock rate into node-local state, causing incorrect clock frequencie=
s.
- [High] Use-After-Free of RPM device data due to prematurely dropping devi=
ce reference without establishing a device link.
- [High] Missing handling of -EPROBE_DEFER permanently cripples bandwidth s=
caling on the platform.
- [High] Arbitration collision due to `mmfab_to_appss` incorrectly claiming=
 master port 2.
- [High] Bandwidth calculation divides bytes by 8, resulting in severe bus =
starvation.
--

commit dbe665a3a4a2b6e23a2d9c951ce890ab7021e52a
Author: Herman van Hazendonk <github.com@herrie.org>
Subject: interconnect: qcom: add MSM8x60 NoC driver

This commit adds a Qualcomm interconnect driver for the MSM8x60 family
SoCs. It models the four fabrics and implements the interconnect-provider
API to allow consumer drivers to request bandwidth via icc_set_bw(). The
driver translates these requests to RPM firmware arbitration votes.

> diff --git a/drivers/interconnect/qcom/msm8660.c b/drivers/interconnect/q=
com/msm8660.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/interconnect/qcom/msm8660.c
> @@ -0,0 +1,1008 @@
[ ... ]
> +static struct msm8660_icc_node * const msm8660_afab_nodes[] =3D {
> +	[AFAB_MAS_AMPSS_M0] =3D &mas_ampss_m0,

[Severity: Critical]
Does this cause a compilation failure?=20

The internal node ID enum defines values with the MSM8660_ prefix, such as
MSM8660_AFAB_MAS_AMPSS_M0. Using the unprefixed version AFAB_MAS_AMPSS_M0
here in the array initializer appears to reference an undeclared identifier.

[ ... ]
> +/*
> + * Gateway from APPSS into MMSS: slave (port 1) for outbound traffic
> + * leaving MMSS, AND master (port 2) for inbound traffic arriving from
> + * APPSS (e.g. CPU memremap_wc accesses to SMI BOs). Without the master
> + * port and the forward links into MMFAB slaves (SMI / MM_IMEM), the
> + * ICC path-finder has no route from AMPSS_M0 to MMFAB_SLV_SMI; the
> + * cross-fabric gateway only worked for outbound traffic (MMSS masters
> + * reaching APPSS slaves like EBI).
> + *
> + * ARB_TIER1 keeps AMPSS->SMI traffic high-priority within MMFAB so
> + * CPU mmap reads/writes to SMI BOs don't get starved by MDP scanout.
> + */
> +DEFINE_QNODE(mmfab_to_appss, MSM8660_MMFAB_TO_APPSS, 8, 2, 1, ARB_TIER1,
> +	     MSM8660_AFAB_TO_MMSS,

[Severity: High]
Does mmfab_to_appss incorrectly claim master port 2 here?=20

The block comment for the MMSS Fabric nodes mentions that the APPS_FAB
gateway should be on master port 11, while port 2 is already correctly
assigned to ADM1.=20

When the arbitration arrays are packed, will this duplicate assignment
overwrite the arbitration vote for port 2 and completely deprive ADM DMA
of its bandwidth scaling on the MMSS fabric?

[ ... ]
> +static void msm8660_rpm_commit(struct msm8660_icc_provider *qp)
> +{
[ ... ]
> +	list_for_each_entry(n, &provider->nodes, node_list) {
> +		struct msm8660_icc_node *qn =3D n->data;
> +		u64 bw_bytes;
> +		u16 bw_128k;
> +
> +		/* Use max of avg and peak bandwidth, convert to 128KB units */
> +		bw_bytes =3D max(icc_units_to_bps(n->avg_bw),
> +			       icc_units_to_bps(n->peak_bw));
> +		do_div(bw_bytes, 8);	/* bits -> bytes */

[Severity: High]
Does icc_units_to_bps() return bandwidth in bytes per second rather than
bits per second?=20

If bw_bytes is already in bytes, dividing it by 8 here would cause the
driver to request only 1/8th of the necessary bandwidth from the firmware,
which might lead to severe bus starvation.

[ ... ]
> +static int msm8660_icc_set(struct icc_node *src, struct icc_node *dst)
> +{
> +	struct msm8660_icc_node *src_qn;
[ ... ]
> +	sum_bw =3D icc_units_to_bps(agg_avg);
> +	max_peak_bw =3D icc_units_to_bps(agg_peak);
> +
> +	rate =3D max(sum_bw, max_peak_bw);
> +	do_div(rate, src_qn->buswidth);
> +	/* Apply minimum floor to prevent bus starvation */
> +	rate =3D max_t(u64, rate, MSM8660_FABRIC_MIN_RATE);
> +	rate =3D min_t(u32, rate, INT_MAX);
> +
> +	if (src_qn->rate !=3D rate) {
> +		for (i =3D 0; i < qp->num_clks; i++) {
> +			ret =3D clk_set_rate(qp->bus_clks[i].clk, rate);

[Severity: High]
Could this rate calculation and caching lead to incorrect hardware clock
frequencies?

The code divides the globally aggregated fabric bandwidth by the local bus
width of the specific node that triggered the update (src_qn->buswidth).
Since nodes can have different bus widths, will this cause the calculated
clock rate to oscillate depending on which node requests an update?

Additionally, the globally calculated rate is cached in the local node's
state (src_qn->rate). If another node changes the shared hardware clock
rate in the interim, a subsequent update from this node might skip the
clk_set_rate() call entirely because its local cache matches the new rate,
leaving the hardware stuck at the wrong frequency.

[ ... ]
> +static struct qcom_rpm *msm8660_get_rpm(struct device *dev)
> +{
> +	struct device_node *rpm_np;
> +	struct platform_device *rpm_pdev;
> +	struct qcom_rpm *rpm;
> +
> +	rpm_np =3D of_parse_phandle(dev->of_node, "qcom,rpm", 0);
> +	if (!rpm_np) {
> +		dev_dbg(dev, "no qcom,rpm phandle, RPM ARB disabled\n");
> +		return NULL;
> +	}
> +
> +	rpm_pdev =3D of_find_device_by_node(rpm_np);
> +	of_node_put(rpm_np);
> +	if (!rpm_pdev) {
> +		dev_warn(dev, "RPM device not found, ARB disabled\n");
> +		return NULL;
> +	}
> +
> +	rpm =3D dev_get_drvdata(&rpm_pdev->dev);
> +	put_device(&rpm_pdev->dev);
> +	if (!rpm) {
> +		dev_warn(dev, "RPM not ready, ARB disabled\n");
> +		return NULL;
> +	}
> +
> +	return rpm;
> +}

[Severity: High]
Is it safe to drop the device reference with put_device() while keeping a
pointer to the devres-managed qcom_rpm structure?

Without establishing a device link, the RPM device could be unbound at any
time. If that happens, the qcom_rpm memory would be freed, leaving a
dangling pointer in qp->rpm. A subsequent bandwidth update would then pass
this freed pointer to qcom_rpm_write() in msm8660_rpm_commit(), causing a
use-after-free.

Also, if the RPM device exists but hasn't probed yet, dev_get_drvdata()
returns NULL. Should this function return -EPROBE_DEFER instead of NULL?
Since the interconnect driver registers at core_initcall, returning NULL
swallows the deferral and permanently disables RPM arbitration.

[ ... ]
> +static int msm8660_icc_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	/*
> +	 * MSM8660 fabric clocks are managed by RPM firmware and may not be
> +	 * available in mainline Linux yet. Make them optional.
> +	 */
> +	ret =3D devm_clk_bulk_get_optional(dev, qp->num_clks, qp->bus_clks);
> +	if (ret) {
> +		dev_warn(dev, "Failed to get bus clocks: %d (continuing anyway)\n", re=
t);
> +		qp->num_clks =3D 0;
> +	}

[Severity: High]
Should this code propagate -EPROBE_DEFER when the clocks are not yet
available?

Because this driver registers at core_initcall, it is very likely to probe
before the clock provider. Catching all errors and continuing with
qp->num_clks =3D 0 means the driver will silently discard -EPROBE_DEFER,
leaving the platform permanently without clock scaling.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780148149.gi=
t.github.com@herrie.org?part=3D2
