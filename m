Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869F141DEE4
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605559; cv=none; b=IQp0/p5+viKENm/AE+q0Zl0dvtd4p1SQpYaGBPy/RcWiu2715r3sAsXMsjYQOdUf/YUi+dpsyOPyOjJGtjI+Ri5qbXgc9UZHWlQppn2v50B9Ead+YrwJhxVJ/zwlvtZT32VRm1pVWXK6+LYikN0FZ1Hr1z2QBQpMORqQ+hyd79M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605559; c=relaxed/simple;
	bh=Zi/JLlsRiBBhlevsygVTZ1BlfJQ1Tl4eesCJRqT1X9s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SCkYcTcDzSnhzbs8LhN2r075BGdBJhnGW6AcajJaA6DMeQeB2jSmQkuzIKe+ZbZqpuSgMjDrHrrgg/sRiImr6jk67lgiA0d9MCt1HIq019rXbZOCpcr7oXwiyLmuwn2Vd/7Cj2bJ88XUelnkbQwmt/Iq68C5D77xA3I8Jwh1Li8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXfnj3Xu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXfnj3Xu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87F51F00A3A;
	Thu,  9 Jul 2026 13:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783605556;
	bh=2pU0IbrYcj8JWG63RkPtwpkRiWx/qJ1OQud6IC2Mz9c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cXfnj3Xu1pEnB5HWrVA2ajJIMQwwIHP5fYOf9XTRJVLe5jSfrjTK9aBtV0+mXG9Vz
	 DPUrhUxB6pAzirlpdNt+PM0DnavDoE/QEt6E/kXGRctPcuCzzQmhKg1S4cJIl9TXX4
	 6txQyRFIGd6voZXNSQKv8/nJSiT6M2hR+uiUpHfnsZlrh38c8AHZ4nrIU8HsRFjxKv
	 Q7L4OH25r5I5h8heQXqpLwqjdTD4yZAxHS7tJjpQ1sdEzIZ1kzki06pzIYbDJUOCYg
	 WoE/KHtniikEUmcRGQPZxhy3FH6qsNfKRoOiNwqQiqFVCy2tQi5jJPPVolOeM1L62z
	 muRIhqa6uGs1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 11/18] media: iris: Add framework support for
 AR50_LITE video core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260709-iris-ar50lt-v7-11-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-11-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 13:59:15 +0000
Message-Id: <20260709135915.C87F51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `iris_vpu_boot_firmware` function incorrectly returns success =
(0) when a firmware boot error is detected.
- [High] Hardware clocks are unprepared after disabling the power domain, c=
ausing a teardown ordering violation in `iris_vpu_power_off_hw`.
--

--- Patch [11]: [PATCH v7 11/18] media: iris: Add framework support for AR5=
0_LITE video core ---
commit 4e8fec9384d1018aa16fad1dc0afb88de83d8e99
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Add framework support for AR50_LITE video core

Add power sequence for ar5lt core.
Add register handling for ar50lt by hooking up vpu op with ar50lt
specific implemtation or resue from earlier generation wherever
feasible.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c b/drivers=
/media/platform/qcom/iris/iris_vpu_ar50lt.c
> new file mode 100644
> index 0000000000000..e084a5b49f2e3
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
[ ... ]
> +static void iris_vpu_ar50lt_power_off_hw(struct iris_core *core)
> +{
> +	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAI=
N], false);
> +	iris_disable_unprepare_clock(core, IRIS_THROTTLE_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_PO=
WER_DOMAIN]);
> +}

[Severity: High]
This is a pre-existing issue on the older platforms, but I noticed you are
correctly disabling the clocks before the power domains here for the new AR=
50LT
platform.

However, in the shared common function iris_vpu_power_off_hw() for the older
platforms, the power domain is disabled before the clocks:

drivers/media/platform/qcom/iris/iris_vpu_common.c:iris_vpu_power_off_hw() {
    iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_PO=
WER_DOMAIN]);
    iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
    iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
    ...
}

Does this teardown ordering violation in the older platforms cause system b=
us
hangs or unclocked access faults when the clock controller attempts to inte=
ract
with the unpowered block?

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
This isn't a bug introduced by this patch, but while modifying this functio=
n, I
noticed a potential issue in the firmware boot wait loop just above this co=
de:

	while (!ctrl_status && count < max_tries) {
		ctrl_status =3D readl(core->reg_base + CTRL_STATUS);
		if ((ctrl_status & CTRL_ERROR_STATUS__M) =3D=3D 0x4) {
			dev_err(core->dev, "invalid setting for uc_region\n");
			break;
		}
		...
	}

If the hardware reports an invalid uc_region, the loop breaks immediately.

Because the variable count will be less than max_tries, the subsequent time=
out
check evaluates to false, and the function mistakenly falls through to retu=
rn
success (0) here.

Can this bypass of the error return cause the driver to incorrectly assume =
the
firmware booted successfully and proceed to enable host interrupts, potenti=
ally
leading to unhandled timeouts, hardware hangs, or system crashes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-iris-ar50l=
t-v7-0-76af9dd4d1f6@oss.qualcomm.com?part=3D11
