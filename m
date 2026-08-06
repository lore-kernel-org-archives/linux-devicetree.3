Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A7440911F
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013777; cv=none; b=uTA9U7A30SD/q0YWyfcYou7J1zyrIblqCvf3uyQxfOlWfRjOu8XCnd/Zpa7Y/0HcCnlDmKkifQwk/G0cFS6Pmz+fQgoI4kFYTUFG6QdCHraBeTiluxPcnnrnYAgxAjmGCA5R+aZa5Frqkkuw/cRb8NWQTb7wJNUICPm3A3M46fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013777; c=relaxed/simple;
	bh=geJ0b2m03OKqSKEezprrHmqCb7CwAgoFlmV1OzXSWvE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zv0KVzX9NNYmWcbe92F/aC+itSvExKjA78e5JG1R213lmS/wkNp1AplY/sETYSdCXX2dqKxvk9bQbAWIvZVSF/3U398HKHlWb+VhtK2C8YwZWWi8HyEVj/xDtuqBsjW64QrCxN1LUikmrPNkIXCht1YHf7pOMy4oDIoc7flti5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmyo1bSg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmyo1bSg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9618C1F000E9;
	Thu,  6 Aug 2026 10:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786013776;
	bh=1zErR8xrB/M8d1oVoVw2VgXQee8kZ8NHC3L1NQbG3ZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mmyo1bSgLcvE6O01rvb1VK6F3wUjlxh+Gz00lD6vUugnNK+Tcn31/y3V706fedWwI
	 pOtgSMcRigY5xk1eJcn1qRvUBPEH40c3GNA00WBTu+464XhDiNCyqtYqF0/jcQvl+T
	 NRhRZ0//LBb8n6s6LKIAYfvoYsa0QlC4rSSs694rdi8QyDbBSHhrA6aef0oHwg4ZPF
	 WDvrM9ccvUyceVbHNO1ktcPgFzNAzcJXRMFrivQIus+iU9/1+pbhb2a2hn/cn72wlK
	 hDF9DTu9HCBJGCGsklFZPK1oOHRF8FNVSuYAr13AlvzTnTJXd6dEBACeDGJIB37e2T
	 IOhUDRbpXwy4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 09/10] clk: qcom: camcc: Add support for camera
 clock controller for Eliza
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-9-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
 <20260806-eliza-mm-cc-v9-v10-9-6ba52dd14343@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 10:56:14 +0000
Message-Id: <20260806105615.9618C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `clk_alpha_pll_postdiv` for `P_CAM_BIST_MCLK_CC_PLL0_OUT_E=
VEN` causes incorrect clock rates
--

--- Patch [9]: [PATCH v10 09/10] clk: qcom: camcc: Add support for camera c=
lock controller for Eliza ---
commit 87585fa44458a8d4bd37784a045b9c8108ed5a11
Author: Taniya Das <taniya.das@oss.qualcomm.com>

clk: qcom: camcc: Add support for camera clock controller for Eliza

Add support for the Camera Clock Controller (CAMCC) on the Eliza
platform. The CAMCC block on Eliza includes both the primary camera clock
controller and the Camera BIST clock controller, which provides the
functional MCLK required for camera operations.

> diff --git a/drivers/clk/qcom/cambistmclkcc-eliza.c b/drivers/clk/qcom/ca=
mbistmclkcc-eliza.c
> new file mode 100644
> index 0000000000000..5cb68b81095eb
> --- /dev/null
> +++ b/drivers/clk/qcom/cambistmclkcc-eliza.c
[ ... ]
> +static const struct parent_map cam_bist_mclk_cc_parent_map_0[] =3D {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_BIST_MCLK_CC_PLL0_OUT_EVEN, 3 },
> +	{ P_CAM_BIST_MCLK_CC_PLL0_OUT_MAIN, 5 },
> +};
> +
> +static const struct clk_parent_data cam_bist_mclk_cc_parent_data_0[] =3D=
 {
> +	{ .index =3D DT_BI_TCXO },
> +	{ .hw =3D &cam_bist_mclk_cc_pll0.clkr.hw },
> +	{ .hw =3D &cam_bist_mclk_cc_pll0.clkr.hw },
> +};

[Severity: High]
Are both the EVEN and MAIN outputs mapped to the exact same hardware object
here?

Since there is no clk_alpha_pll_postdiv object defined for the EVEN output,
the Common Clock Framework will treat the EVEN output as 960MHz (the main P=
LL
rate) rather than 480MHz.

[ ... ]
> +static const struct freq_tbl ftbl_cam_bist_mclk_cc_mclk0_clk_src[] =3D {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(24000000, P_CAM_BIST_MCLK_CC_PLL0_OUT_EVEN, 10, 1, 4),

[Severity: High]
Will this lead to an incorrect physical clock rate of 12MHz instead of 24MH=
z?

Because the CCF believes the EVEN source rate is 960MHz, it will program the
hardware with a divisor of 10. However, since the physical hardware EVEN
signal is actually 480MHz, dividing 480MHz by 10 and then by 4 (m=3D1, n=3D=
4)
produces 12MHz, which might cause camera operations to fail.

> +	F(68571429, P_CAM_BIST_MCLK_CC_PLL0_OUT_MAIN, 14, 0, 0),
> +	{ }
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-eliza-mm-c=
c-v9-v10-0-6ba52dd14343@oss.qualcomm.com?part=3D9
