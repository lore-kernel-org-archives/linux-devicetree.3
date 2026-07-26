Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFC91F942
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 06:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045938; cv=none; b=iP0rua+3xH6d0vzs+OhZJTBLnCs8dtF3vIm+CU/dfIwwP+vpEmycwVvW13IUHQ6ZhWD5jddx47RUTKknKmQymzn0CNlWxHrgF384+i7GcMCpDB3jCH+88bQcRCIjFsVCvY3PKxz8V3pt51DBVvweIbsnIE5WEVHNLWLh2TPY7OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045938; c=relaxed/simple;
	bh=40zpfViN+7Q0xCKBBKX3Alj90YxzKrmDjc1wuxneNi0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WuKUVCRzU9NasSBMtLSrmZvl9YudfhnaqtKrPDm/PzxxiUaoM4yKNNwKM5sQQZX2z8oVlBvf/25J68aCbbB1oLHJ2txRoQ1kea9mzF4F3utpvczDwPOYmt/FAePKltBuQUwI4A/338FOX5PSZTrJj5gO1j3rk8JzY1PrPZQbFNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWAUFIvS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWAUFIvS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27031F000E9;
	Sun, 26 Jul 2026 06:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785045936;
	bh=AHEs0YPHzrGTC91zFRBuFUM7pC5SvtEC9O2JXVX0ONo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BWAUFIvSxk/4Tp/9cgYiHJgxngqE+7GgymYMHHHKvYZxdDi8/rYRRQ3JUV4QTz4cS
	 Cumo2PofYlA1uB316mzlGE6UgRatLcilWeT+CKrzrhQERVXE4pCfysNPRzAKl180z+
	 np8u7khHfbHQv32epEBOs1IyOr7yU20DufukdJK2nk39GPQnnv6291HIK8eiwCcDf8
	 PcfCmGjeO+XoJjsUoaXP9HOdrCV5SYNfDc9tOkCkPelQaIUQasdouTtH+EfB1rDV33
	 wFpiLWw90cwxLg36jVGDZsK3fPMkV65aN5cgtnlTIwN4gJ/bn8lW3SzcKC/6qERK6I
	 Y9hdtrdimEZ8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 08/14] media: iris: Add power sequence for glymur
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260726-glymur-v10-8-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-8-de451559e88b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 06:05:36 +0000
Message-Id: <20260726060536.A27031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing required NOC LPI DONE polling before hardware reset in iri=
s_vpu36_power_off_vcodec causes a race condition.
- [High] Iteratively dropping the shared device OPP rate to 0 before all co=
res are powered off will cause a synchronous external abort.
--

--- Patch [8]: [PATCH v10 08/14] media: iris: Add power sequence for glymur=
 ---
commit d2cd6a91322f190f5a10ce98b74613cfdf850a61
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Add power sequence for glymur

This commit adds power sequencing for the glymur platform's video codec. It
introduces support for handling multiple codec cores (vcodec0 and vcodec1) =
that
share a common clock source and power rails.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu3x.c
> index 7cda946015558..1b08461ee4d70 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
[ ... ]
> @@ -221,6 +221,113 @@ static void iris_vpu35_power_off_hw(struct iris_cor=
e *core)
[ ... ]
> +static void iris_vpu36_power_off_vcodec(struct iris_core *core, u32 core=
_id)
> +{
[ ... ]
> +	do {
> +		writel(power_down_prep[core_id], core->reg_base + AON_WRAPPER_MVP_NOC_=
LPI_CONTROL);
> +		usleep_range(15, 20);
> +		value =3D readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
> +
> +		handshake_done =3D value & lpi_status_done[core_id];
> +		handshake_busy =3D value & (lpi_status_deny[core_id] | lpi_status_acti=
ve[core_id]);
> +
> +		if (handshake_done || !handshake_busy)
> +			break;

[Severity: High]
Can this loop exit prematurely if the NOC hasn't yet transitioned to busy?

If `handshake_busy` is initially 0 after writing to `power_down_prep`, the =
loop
will break before the NOC LPI DONE status is asserted.

> +
> +		writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +		usleep_range(15, 20);
> +	} while (++count < 1000);
> +
> +	if (!handshake_done && handshake_busy)
> +		goto disable_power;
> +
> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +	writel(bridge_sw_reset[core_id] | bridge_hw_reset[core_id],
> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);

[Severity: High]
Without an additional poll for the DONE status (as seen in
`iris_vpu33_power_off_hardware`), couldn't asserting a bridge reset here wh=
ile
the NOC is still active or transitioning cause a hardware bus hang?

> +	writel(bridge_hw_reset[core_id], core->reg_base + CPU_CS_AHB_BRIDGE_SYN=
C_RESET);
> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +
> +disable_power:
> +	iris_genpd_set_hwmode(&core->vcodec[core_id], false);
> +	iris_disable_power_domain_and_clocks(core, &core->vcodec[core_id]);
> +}
> +
> +static void iris_vpu36_power_off_hw(struct iris_core *core)
> +{
> +	u32 num_cores =3D core->iris_platform_data->num_cores;
> +	int i;
> +
> +	for (i =3D 0; i < num_cores; i++)
> +		iris_vpu36_power_off_vcodec(core, i);

[Severity: High]
Could this loop cause a synchronous external abort when shutting down multi=
ple
cores?

When `iris_vpu36_power_off_vcodec()` powers off the first core, it reaches
the `disable_power` label and calls `iris_disable_power_domain_and_clocks()=
`,
which executes:

    iris_opp_set_rate(core->dev, 0);

When the loop then iterates to the next core, `iris_vpu36_power_off_vcodec(=
)`
will read hardware registers such as `WRAPPER_CORE_POWER_STATUS` and
`WRAPPER_CORE_CLOCK_CONFIG`. Is it safe to read these registers when the
shared device voltage vote (OPP rate) has already been dropped to 0?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-glymur-v10=
-0-de451559e88b@oss.qualcomm.com?part=3D8
