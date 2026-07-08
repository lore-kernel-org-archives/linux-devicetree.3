Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A6628642B
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 13:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516285; cv=none; b=OWAFgZv9ZqwRZnwdhQNymujx7Z7m42SU5HU1AM1tR0dwwvMVDt4NPF3F3aYIfIzgL5Ti/dZKNtnijZ69bLN95Z0TCacba5jGb/1PW70eGe7qbCoeHnHjf/5TFd1nsLjSgmksEgIbbv/+DyplqZDbksInMdNUayJbbQn9qPfZ9DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516285; c=relaxed/simple;
	bh=P2X1fSwAP8TurJhUGCk8jmQO3sYSs/ko+IJLchobcvo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JDd/uGX9AXoKhzJRfYDGFExLvG0ZXO3LQnU3Z5v1PYA65GZeA7bqYDBC8/25AJsWsv86Lmtn5aWPfmtZwMeOY4B0UEpjN8f0oqkrL9vskTb+HK1jd+B70+AP7dJiFxPEDRassZa6z1sRN3bDro0Nl0AK/bt3u/A1BgRCgfht/U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXiAnv8a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXiAnv8a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F29B1F00A3A;
	Wed,  8 Jul 2026 13:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783516284;
	bh=wfzHycTlnx6XlfSp6CDMIPLe8NL0K/Um2WLq4b/TDTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EXiAnv8aY2AZCyf+U62uoM2OroTAJANph1jv7VXNiRsoIuzSfnrWMkcc4nH8xqk6S
	 Lu2PWWXFBl5ZnFj8nNU8eazxpHVOSYdIZHLc0MnHLN9o4nTAylgxU22Ox6lEIa8Asq
	 eBKBPp+b+Cf3c8qWW4EegN2lcAZI1znvY1hTC0+kYOfip6B4H1iAxWxZXZQud4107N
	 f8ZuV8E3RcNQVc8X/HDtwtK0y4/2tgPD2IQoO5yz4j1mZZ/CxcbR04E5f544rv7gui
	 +Sh0O2lq5ssltK5p+yjRa8yhBlXCUztCcxg/nw5WHjVJ8kXhAPu5AfE2wELBhwJPS0
	 uDYd/sKEjI2gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-usb: Add support for SA8255P
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mattijs Korpershoek" <mkorpershoek@kernel.org>
Cc: olteanv@gmail.com, devicetree@vger.kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260708-phy-qcom-qmp-usb-8255-v1-2-8d852a9535db@kernel.org>
References: <20260708-phy-qcom-qmp-usb-8255-v1-0-8d852a9535db@kernel.org>
 <20260708-phy-qcom-qmp-usb-8255-v1-2-8d852a9535db@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 13:11:22 +0000
Message-Id: <20260708131123.3F29B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The driver leaks runtime PM usage counters for its manually manage=
d power domains ('usb_transfer' and 'usb_core') on multiple error paths, le=
aving hardware permanently active and risking usage counter overflow.
- [High] Teardown operations disable PM domains before disabling leaf consu=
mer clocks and asserting resets, violating strict reverse-initialization or=
dering and risking hardware access faults.
--

--- Patch [2]: [PATCH 2/2] phy: qcom: qmp-usb: Add support for SA8255P ---
commit 487667fe3c076bbe0851ee1739a5d0f2311634d9
Author: Sriram Dash <quic_sriramd@quicinc.com>
Subject: phy: qcom: qmp-usb: Add support for SA8255P

This commit adds support for the SA8255P SoC to the QMP USB PHY driver.
It introduces firmware-managed power domains that are controlled via
runtime PM APIs during the driver's power state transitions.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualco=
mm/phy-qcom-qmp-usb.c
> index c5507168e1354..2ac6a23868bf9 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
[ ... ]
> @@ -1890,6 +1890,77 @@ static const struct qmp_phy_cfg glymur_usb3_uniphy=
_cfg =3D {
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
> +
> +	return ret;

[Severity: High]
If the resume of pd_devs[1] fails here, will this leak the runtime PM usage
counter for pd_devs[0]? Should there be a pm_runtime_put_sync() for
pd_devs[0] before returning the error?

> +}
> +
> +/* d0_to_d3 transition by turning off all the suppliers */
> +static void qmp_usb_d0_to_d3(struct qmp_usb *qmp)
> +{
> +	if (!qmp->pd_list)
> +		return;
> +
> +	pm_runtime_put_sync(qmp->pd_list->pd_devs[0]);
> +	pm_runtime_put_sync(qmp->pd_list->pd_devs[1]);

[Severity: High]
Since qmp_usb_d3_to_d0() enables these domains in the order 0 then 1,
should this disable them in the reverse order (1 then 0)?

> +}
[ ... ]
> @@ -1980,6 +1980,12 @@ static int qmp_usb_init(struct phy *phy)
>  	void __iomem *pcs =3D qmp->pcs;
>  	int ret;
> =20
> +	ret =3D qmp_usb_d3_to_d0(qmp);
> +	if (ret < 0) {
> +		dev_err(qmp->dev, "Failed to transition to d0 state\n");
> +		return ret;
> +	}
> +
>  	ret =3D regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>  	if (ret) {
>  		dev_err(qmp->dev, "failed to enable regulators, err=3D%d\n", ret);
>  		return ret;

[Severity: High]
If regulator_bulk_enable() fails, this returns directly. Does this leave
the PM domains enabled, leaking their usage counters since qmp_usb_d0_to_d3=
()
is not called to balance the earlier qmp_usb_d3_to_d0() call?

> @@ -2025,6 +2025,8 @@ static int qmp_usb_exit(struct phy *phy)
>  	struct qmp_usb *qmp =3D phy_get_drvdata(phy);
>  	const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> =20
> +	qmp_usb_d0_to_d3(qmp);
> +
>  	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
> =20
>  	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);

[Severity: High]
This disables the power domains via qmp_usb_d0_to_d3() before disabling
the leaf clocks and asserting the resets. Can this sequence cause
unclocked or unpowered register accesses and trigger hardware faults?
Should the domains be disabled at the end of the teardown instead?

> @@ -2212,6 +2212,8 @@ static int __maybe_unused qmp_usb_runtime_suspend(s=
truct device *dev)
> =20
>  	qmp_usb_enable_autonomous_mode(qmp);
> =20
> +	qmp_usb_d0_to_d1(qmp);
> +
>  	clk_disable_unprepare(qmp->pipe_clk);
>  	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);

[Severity: High]
Similar to the exit path, this powers off the transfer domain before
the clocks are disabled. Could this cause bus errors when the clocks are
manipulated?

> @@ -2232,6 +2232,12 @@ static int __maybe_unused qmp_usb_runtime_resume(s=
truct device *dev)
>  		return 0;
>  	}
> =20
> +	ret =3D qmp_usb_d1_to_d0(qmp);
> +	if (ret < 0) {
> +		dev_err(qmp->dev, "Failed to transition to d0 state\n");
> +		return ret;
> +	}
> +
>  	ret =3D clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
>  	if (ret)
>  		return ret;

[Severity: High]
If clk_bulk_prepare_enable() fails, the function returns ret without
undoing qmp_usb_d1_to_d0(). Will this leak the transfer domain's PM usage
counter?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-phy-qcom-q=
mp-usb-8255-v1-0-8d852a9535db@kernel.org?part=3D2
