Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC45C305674
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 22:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783464176; cv=none; b=h0upo24g9nbs91WBgBQI9OxT4IQycpuCzFSoDORLazO7FZ1h2zkVEOOPbXw61KEdhtGxV1itSFupWXSp4lKfHdFeh3HqxFYmEc3XI9jlyY7mJgFmSSCl95jZyjdq++PxlWcAPKVDc7nxYCCOMAeF7dZMQV5Eb94NahyBS7skbpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783464176; c=relaxed/simple;
	bh=YQl3I/8aBCjV4r9SVofyswfOgZMJJjnMLiIBklDMLVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SA+WkxI3h35/96Paewy0fFmkwu8yW87TgRbH2qtp+h4moHM5ShgIzrkjW6rDMVQhvVJd41MT2m4aBAB+c+DFUSjCImirFLLCbH3uR0PGBFEzrYjlwHarlDAB53edlIuxHTORAYyPSPIVHaspNPmDCUWyfMD88MeQXQPFkKciYUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCdWAu/R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCdWAu/R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7CE1F000E9;
	Tue,  7 Jul 2026 22:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783464174;
	bh=2t3mnt1aGTJkZ7+bmJ8MrGqKJp+Gfo4FQrvcRngkt7A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZCdWAu/Rso8itN0mhGhMV2yMfhxigDIhdh0N76zdydKIP2zUXDiHr4kaEViPajV6v
	 3ZvrQYqw4UAT+UuzIEuh2JKGt8V/qSpYhCWrgSDRPHpX8vBq8IbTUnh9JbnWce5wpS
	 WoVxqcQJnIXamTKE0DcumZ4PghJPr2r5pEmDHMMlGA/P9aq7Ng2W3E1Pp5lkHhQubn
	 V2ALrWfiA7vzphLcxPbNvqFxrv2zkScLa/FYAA181wl4O0hv69WpqPcMcqTDzTjP9c
	 Yd0g5wE2hxtmpKtD3X33kwm40zKiqqjX7pLLXawFt0R9QRwvGhGh4uRhpgYjUPw0pW
	 f9JnMJcj7oulQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/18] media: iris: Add framework support for
 AR50_LITE video core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-iris-ar50lt-v6-11-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
 <20260708-iris-ar50lt-v6-11-374f0a46c23b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 22:42:53 +0000
Message-Id: <20260707224254.4B7CE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Firmware boot errors in `iris_vpu_boot_firmware()` are silently ig=
nored due to a premature loop break without returning an error code.
- [High] Early returns on error in `iris_enable_power_domains()` and `iris_=
disable_power_domains()` leak runtime PM usage counts.
--

--- Patch [11]: [PATCH v6 11/18] media: iris: Add framework support for AR5=
0_LITE video core ---
commit 8407376927e1cbde94a3ada7a51a697669409b40
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Add framework support for AR50_LITE video core

Add power sequence for ar5lt core. Add register handling for ar50lt by
hooking up vpu op with ar50lt specific implementation or reuse from
earlier generation wherever feasible.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c b/drivers=
/media/platform/qcom/iris/iris_vpu_ar50lt.c
> new file mode 100644
> index 0000000000000..e084a5b49f2e3
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c

[ ... ]

> +static int iris_vpu_ar50lt_power_off_controller(struct iris_core *core)
> +{
> +	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_=
POWER_DOMAIN]);

[Severity: High]
This is a pre-existing issue, but could this leak the PM reference count if
iris_disable_power_domains() fails internally?

Looking at the implementation of iris_disable_power_domains() in=20
iris_resources.c:

int iris_disable_power_domains(struct iris_core *core, struct device *pd_de=
v)
{
        int ret;

        ret =3D iris_opp_set_rate(core->dev, 0);
        if (ret)
                return ret;

        pm_runtime_put_sync(pd_dev);

        return 0;
}

If iris_opp_set_rate() fails, the function returns early and skips the
required pm_runtime_put_sync(pd_dev). Will this permanently prevent the
device and its power domain from suspending?

> +
> +	return 0;
> +}

[ ... ]

> +static int iris_vpu_ar50lt_power_on_controller(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret =3D iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRI=
S_CTRL_POWER_DOMAIN]);

[Severity: High]
This isn't a bug introduced by this patch, but does calling
iris_enable_power_domains() here leak the runtime PM usage count on
failure?

Looking at iris_enable_power_domains():

int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
{
        ...
        ret =3D pm_runtime_get_sync(pd_dev);
        if (ret < 0)
                return ret;

        return ret;
}

When pm_runtime_get_sync() fails, it increments the usage counter but the
early return leaves it incremented without dropping the reference. Could
pm_runtime_resume_and_get() be used instead to safely handle the failure?

> +	if (ret)
> +		return ret;

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers=
/media/platform/qcom/iris/iris_vpu_common.c
> index 41498f94480e8..d64e7745a63dc 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -97,7 +97,8 @@ int iris_vpu_boot_firmware(struct iris_core *core)
>  	}
> =20
>  	writel(HOST2XTENSA_INTR_ENABLE, core->reg_base + CPU_CS_H2XSOFTINTEN);
> -	writel(0x0, core->reg_base + CPU_CS_X2RPMH);
> +	if (!core->iris_platform_data->no_rpmh)
> +		writel(0x0, core->reg_base + CPU_CS_X2RPMH);
> =20
>  	return 0;
>  }

[Severity: High]
This is also a pre-existing issue, but does iris_vpu_boot_firmware()
erroneously return success when the firmware fails to boot?

Looking earlier in iris_vpu_boot_firmware():

    while (!ctrl_status && count < max_tries) {
        ctrl_status =3D readl(core->reg_base + CTRL_STATUS);
        if ((ctrl_status & CTRL_ERROR_STATUS__M) =3D=3D 0x4) {
            dev_err(core->dev, "invalid setting for uc_region\n");
            break;
        }
        ...
    }

If this break occurs because of an invalid uc_region setting, the loop
exits without setting an error code. Since count is still less than
max_tries, the subsequent timeout check is bypassed, and the function
falls through to return 0 here.

Will this cause the driver to continue initialization with an unusable
VPU, potentially leading to cascading failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-iris-ar50l=
t-v6-0-374f0a46c23b@oss.qualcomm.com?part=3D11
