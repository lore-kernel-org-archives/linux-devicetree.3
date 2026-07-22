Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6143546E0
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728919; cv=none; b=pT0VifEIAx+vvm85XET29/R7SBq9jrkVi7nb568eTQvDXXnxHccjiJDbC6JAPtXcyYoCElCmlcQAJiRJ724Kt7BoC7r2J8lcDgt7HAGf7eQjF++hvWGvI6C/Cq4QCGOFa8oavRcKIfykl8fuI5f0iLF67B2MofuCYO1LSLKTayY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728919; c=relaxed/simple;
	bh=euWAh0ytWsiTLa9LjeWm7LGxAn7zLvto7OTIw+M1eHo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cRmDv9V7GMoytiFGk45M8cpek+KMgKyOtwtC3gi/IRsd7tx5SRUc3+VjN8wnBhk556im+6s9bP+5sheSwxNYH1p0C0BACPVyk7cXM/W9ZeQOYgMUlwlJaI0idyuejG3ejgyX4Gepu4OatKMain8wvBONjC8sEEun/OzcSGs1px8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AeAobieH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AeAobieH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619571F000E9;
	Wed, 22 Jul 2026 14:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784728917;
	bh=T/Ebh9n6wMSSNQHytfNWJWj3bMOROvGvIor+jJYvW7c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AeAobieHgNyYEBEVp/iwGkhsbR/S7zQqeqxLQ12chiycacPlN8oCPhovfBxH4aVgR
	 LB5xYjISrWjQIAyis1FCPKts4B1qzVmtTLCI75ztZRUqmuF8JTDhV4DOEljeaWcxDc
	 P+m+t2qEwkl23wC3ipO+NrUOshCuDPrOoZ8lg4Uo8/dggZkYFDMMxAZ9zHDZLYpq0a
	 VH2pPGU5Run3nvI9eFyOUSNJtUi6EpQk+DX7pFCRlALd6wY1UwDI8PT2NWsFJ7Ejrg
	 0NFjwB0jeRV2AwLVL3mvs5QqjP4JV8sU86zRF3ZlpJpo534qN692gtiX28d6KXn7/X
	 i0H1lKdobvQLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] phy: qcom: qmp-usb: Add support for SA8255P
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mattijs Korpershoek" <mkorpershoek@kernel.org>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-phy-qcom-qmp-usb-8255-v3-2-e789070b48f7@kernel.org>
References: <20260722-phy-qcom-qmp-usb-8255-v3-0-e789070b48f7@kernel.org>
 <20260722-phy-qcom-qmp-usb-8255-v3-2-e789070b48f7@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 14:01:56 +0000
Message-Id: <20260722140157.619571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Incorrect power domain sequencing in `d3_to_d0` and `d0_to_d3` tra=
nsitions, violating hardware constraints.

Pre-existing issues:
- [High] Unbalanced clock prepare/enable and disable/unprepare, leading to =
`pipe_clk` enable count leak.
--

--- Patch [2]: [PATCH v3 2/2] phy: qcom: qmp-usb: Add support for SA8255P -=
--
commit 2b06432a4f84c161e8379370587f792f91bca968
Author: Sriram Dash <quic_sriramd@quicinc.com>
Subject: phy: qcom: qmp-usb: Add support for SA8255P

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
This commit adds support for the SA8255p SoC in the QMP USB driver by
using SCMI power protocols to manage platform resources via runtime PM
framework APIs. Two sets of resources are modeled as "core" and "transfer"
power domain suppliers.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualco=
mm/phy-qcom-qmp-usb.c
> index c5507168e1354..881f4ce23241e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
[ ... ]
> @@ -1865,6 +1890,77 @@ static const struct qmp_phy_cfg glymur_usb3_uniphy=
_cfg =3D {
>  	.regs			=3D qmp_v7_usb3phy_regs_layout,
>  };
> =20
> +static int qmp_usb_domain_attach(struct qmp_usb *qmp)
> +{
> +	struct dev_pm_domain_attach_data pd_data =3D {
> +		.pd_flags       =3D PD_FLAG_NO_DEV_LINK,
> +		.pd_names       =3D (const char *[]) { "transfer", "core" },
> +		.num_pd_names   =3D 2,
> +	};
[ ... ]
> +/* d3_to_d0 transition by turning on all the suppliers */
> +static int qmp_usb_d3_to_d0(struct qmp_usb *qmp)
> +{
> +	int ret;
> +
> +	if (!qmp->pd_list)
> +		return 0;
> +
> +	ret =3D pm_runtime_resume_and_get(qmp->pd_list->pd_devs[0]);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D pm_runtime_resume_and_get(qmp->pd_list->pd_devs[1]);

[Severity: High]
Does resuming the 'transfer' domain before the 'core' domain cause hardware
bus hangs?

The commit message states that the "core" domain controls the GDSC (power),
while the "transfer" domain controls clocks. It appears this sequence turns
on the clocks before enabling power to the logic.

> +	if (ret)
> +		pm_runtime_put_sync(qmp->pd_list->pd_devs[0]);
> +
> +	return ret;
> +}
> +
> +/* d0_to_d3 transition by turning off all the suppliers */
> +static void qmp_usb_d0_to_d3(struct qmp_usb *qmp)
> +{
> +	if (!qmp->pd_list)
> +		return;
> +
> +	pm_runtime_put_sync(qmp->pd_list->pd_devs[1]);
> +	pm_runtime_put_sync(qmp->pd_list->pd_devs[0]);

[Severity: High]
Similarly, does suspending the 'core' domain before the 'transfer' domain
cause issues?

This sequence disables the GDSC (power) before disabling the clocks, which
might also violate hardware constraints and lead to timeouts or freezes.

> +}
[ ... ]
> @@ -2126,14 +2234,23 @@ static int __maybe_unused qmp_usb_runtime_resume(=
struct device *dev)
>  		return 0;
>  	}

[Severity: High]
This is a pre-existing issue, but does this early bailout lead to a pipe_clk
enable count leak?

The code right above this addition in qmp_usb_runtime_resume() is:

	if (!qmp->phy->init_count) {
		dev_vdbg(dev, "PHY not initialized, bailing out\n");
		return 0;
	}

During the standard PHY lifecycle, this check appears to cause an unbalanced
clock prepare/enable and disable/unprepare state:

1. phy_init() starts with init_count =3D=3D 0, so qmp_usb_runtime_resume() =
skips
   enabling clocks.
2. After phy_init() completes, init_count is 1, so phy_pm_runtime_put() cau=
ses
   qmp_usb_runtime_suspend() to disable pipe_clk, triggering a clock framew=
ork
   underflow warning since it was never enabled.
3. Conversely, during phy_exit(), init_count is 1, so qmp_usb_runtime_resum=
e()
   enables pipe_clk. Then qmp_usb_exit() decrements init_count to 0.
4. Finally, phy_pm_runtime_put() triggers qmp_usb_runtime_suspend() (which
   has a similar bailout check), leaving pipe_clk permanently enabled and
   preventing the system from hitting deep sleep states.

Can this state tracking be fixed to ensure the clocks are properly matched
during suspend and resume?

> =20
> +	ret =3D qmp_usb_d1_to_d0(qmp);
> +	if (ret < 0) {
> +		dev_err(qmp->dev, "Failed to transition to d0 state\n");
> +		return ret;
> +	}
> +
>  	ret =3D clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
> -	if (ret)
> +	if (ret) {
> +		qmp_usb_d0_to_d1(qmp);
>  		return ret;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-phy-qcom-q=
mp-usb-8255-v3-0-e789070b48f7@kernel.org?part=3D2
