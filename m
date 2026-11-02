Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630213;
	b=FxiTc3zT+NizxZMua0UY4/QEmSp9eLqa05GRARtuiag11chP3xdAhEXTLMu8fXwPPIks
	 W1Qt80PCLKiaNEK87SIPa6mJxU9RC0ae7Ppv27D+QFKifzDNcKChBqW1yzcKYNKGbw4va
	 azwnLXLmbQex/dQNQD8vcm3lyFI8paH3uBFkFDWI9vOi5Sr757HacG8ly6F7E4+s+x7YP
	 b30/oJBfB+mFeL7xczE7XzE+lOeE6pOfTK7w0+Xj0qUzBHUBDMo//MRReAjgMQ0LByJOq
	 hX0Qm0FqztRn0DJeW+1iIMqED4cn1QRixs+pawSRC+M5Yv1I95yNfh3kbCBdKHWEMFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630213;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zWF8SJnA0nPvjs9RDHqmbx7RCSxFjG3ShTRqsuyx98U=;
	b=k/2kSBa6INOBsi/4IIUxMj+/qiLRs4lYeFwTQPdSO64vczuLE8HZV2rxGVwSzb27U8OU
	 cHB91ASVcJBwTpLb4oDpfXG97ezB5C9IeMUU/uv0PuwyEzKg4zB/+KQpZwOU6ftgD62FB
	 KXcqpuQpozljmi+N3z4qtFOcUaB3fZHictMg67Ry59Q6mMagyD4Pxmfh6xywG7L+ipx6b
	 ZSgZJ5RGETIHXzYsJLtJMHWf2o1O7f8Z7+eeP7aJjpyFkmK6bSJw92ZB+edJP4Ggei6vL
	 F45Ei5AJRA9OiUpCUzfqTyYmmQNBz6lgfPRIhkGUt2fRLiNzR4MUru1iCJoLE0ZkO2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DX1mn/F6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8F1606A336
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 14:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DX1mn/F6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16A31F00A16;
	Mon,  2 Nov 2026 14:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793630213;
	bh=zWF8SJnA0nPvjs9RDHqmbx7RCSxFjG3ShTRqsuyx98U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DX1mn/F6/+fTDWvJ94sIhbbyRK3ll8Qw1XSDrnlF1//eDYz1mTsQuoxWwvUr9BWQ/
	 8TeiA2PwWGjr5vGZ0ApCG+dNUGTweI2gjioTAf4MFKnZ3kZC+3twNI2phuoAmRgh4n
	 w0Uq60oNaRwHGSYWgl4mKRu16m7H4z0+KgODffkLL+4x8oPoYVEt8ftKvWaVgRsh3e
	 zB0W6Psg5F0O3AbXMfyriS+pHULAiiIpP0ne4CpXb816y/bQ6NsHSHDBrsCs8VNqfJ
	 bTTfQDKOzu5Z1K6qlVneRJedl1QMkKR3V4cvjesI1hmzay6eJm2cNSzYZHirudrpqv
	 d1K+IwzEDONdA==
Message-ID: <sashiko-outbox-193585@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mmc: sdhci-msm: Add support for firmware-managed
 resource platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anjana Hari" <anjana.hari@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-sdcc_scmi-v1-2-244dbd893051@oss.qualcomm.com>
References: <20261102-sdcc_scmi-v1-0-244dbd893051@oss.qualcomm.com>
 <20261102-sdcc_scmi-v1-2-244dbd893051@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 14:36:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] mmc: sdhci-msm: NULL deref and PM refcount underflow in sdhci_msm_=
remove()
- [High] mmc: sdhci-msm: host->runtime_suspended not updated on fw_managed =
runtime PM
- [Medium] mmc: sdhci-msm: redundant pwr_dev RPM refs with PD_FLAG_DEV_LINK=
_ON
- [Low] mmc: sdhci-msm: unused label fw_detach in sdhci_msm_probe()
--

commit 23a31b3dbe728fdf7361ca3e72723808a56fa53e
Author: Anjana Hari <anjana.hari@oss.qualcomm.com>

mmc: sdhci-msm: Add support for firmware-managed resource platforms

This commit introduces a firmware-managed variant of the sdhci-msm driver f=
or
Qualcomm SoCs such as Nord, managing power and performance states via logic=
al
power domains and OPPs rather than programming GCC clocks and regulators
directly.

> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index aecd425bf0951..da52a45203a57 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c

[ ... ]

> @@ -1892,6 +1967,40 @@ static void sdhci_msm_set_clock(struct sdhci_host =
*host, unsigned int clock)
>  	__sdhci_msm_set_clock(host, clock);
>  }
> =20

[ ... ]

> +static int sdhci_msm_fw_power_state(struct device *dev, bool power_on)
> +{
> +	struct sdhci_host *host =3D dev_get_drvdata(dev);
> +	struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host =3D sdhci_pltfm_priv(pltfm_host);
> +	struct device *pwr_dev;
> +
> +	pwr_dev =3D msm_host->pd_list->pd_devs[DOMAIN_IDX_POWER];
> +
> +	if (power_on)
> +		return pm_runtime_resume_and_get(pwr_dev);
> +	else
> +		return pm_runtime_put_sync(pwr_dev);
> +}
> +
>  /***********************************************************************=
******\
>   *                                                                      =
     *
>   * Inline Crypto Engine (ICE) support                                   =
     *
> @@ -2550,6 +2659,17 @@ static const struct sdhci_msm_variant_info sdhci_m=
sm_v5_var =3D {
>  	.offset =3D &sdhci_msm_v5_offset,
>  };
> =20
> +static const struct sdhci_msm_variant_info sdhci_msm_fw_v5_var =3D {
> +	.mci_removed =3D true,
> +	.var_ops =3D &v5_var_ops,
> +	.offset =3D &sdhci_msm_v5_offset,
> +	.pd_data =3D {
> +		.pd_flags =3D PD_FLAG_DEV_LINK_ON,
> +		.pd_names =3D (const char * []) { "power", "perf" },
> +		.num_pd_names =3D 2,
> +	},
> +};

[Severity: Medium]
Does combining PD_FLAG_DEV_LINK_ON in sdhci_msm_fw_v5_var with manual
pm_runtime_resume_and_get(pwr_dev) and pm_runtime_put_sync(pwr_dev) calls in
sdhci_msm_fw_power_state() cause duplicate runtime PM reference counting on
pwr_dev?

When dev_pm_domain_attach_list() runs with PD_FLAG_DEV_LINK_ON (and without
PD_FLAG_NO_DEV_LINK), it creates a device link with DL_FLAG_STATELESS |
DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE, which already calls
pm_runtime_get_sync(pwr_dev), and pm_runtime_set_active(&pdev->dev) in
sdhci_msm_probe() also calls rpm_get_suppliers(&pdev->dev). Calling
sdhci_msm_fw_power_state(&pdev->dev, true) in sdhci_msm_probe() and
sdhci_msm_runtime_resume() then takes an additional manual runtime PM
reference on pwr_dev.

Because __rpm_callback() invokes sdhci_msm_runtime_suspend() before
__rpm_put_suppliers(&pdev->dev, false), the device link still holds its
runtime PM reference on pwr_dev when sdhci_msm_fw_power_state(dev, false)
calls pm_runtime_put_sync(pwr_dev). As a result, __pm_runtime_idle() sees
usage_count > 0 and returns 0 without suspending pwr_dev synchronously.

Similarly, in the error path of sdhci_msm_probe() and in sdhci_msm_remove(),
sdhci_msm_fw_power_state(&pdev->dev, false) runs before
dev_pm_domain_detach_list() deletes the device link, and during
pm_runtime_force_suspend(&pdev->dev), if pm_runtime_need_not_resume() is
false, pm_runtime_set_suspended() / rpm_put_suppliers() is skipped, leaving
the device link's runtime PM reference on pwr_dev active.

[ ... ]

> @@ -2917,6 +3102,12 @@ static int sdhci_msm_probe(struct platform_device =
*pdev)
>  bus_clk_disable:
>  	if (!IS_ERR(msm_host->bus_clk))
>  		clk_disable_unprepare(msm_host->bus_clk);
> +fw_detach:
> +	if (msm_host->fw_managed) {
> +		sdhci_msm_fw_power_state(&pdev->dev, false);
> +		dev_pm_domain_detach_list(msm_host->pd_list);
> +		msm_host->pd_list =3D NULL;
> +	}
>  	return ret;
>  }

[Severity: Low]
Is the fw_detach label in sdhci_msm_probe() needed? Nothing in
sdhci_msm_probe() jumps to fw_detach, which triggers an unused-label compil=
er
warning (-Wunused-label) and breaks builds with CONFIG_WERROR=3Dy.

> =20
> @@ -2930,6 +3121,12 @@ static void sdhci_msm_remove(struct platform_devic=
e *pdev)
> =20
>  	sdhci_remove_host(host, dead);
> =20
> +	if (msm_host->fw_managed) {
> +		sdhci_msm_fw_power_state(&pdev->dev, false);
> +		dev_pm_domain_detach_list(msm_host->pd_list);
> +		msm_host->pd_list =3D NULL;
> +	}
> +
>  	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_put_noidle(&pdev->dev);

[Severity: High]
Can detaching and clearing msm_host->pd_list before pm_runtime_get_sync() a=
nd
pm_runtime_disable() in sdhci_msm_remove() cause a NULL pointer dereference
and runtime PM refcount underflow?

In sdhci_msm_remove(), sdhci_remove_host() releases the MMC host while runt=
ime
PM with autosuspend is still enabled on &pdev->dev (or &pdev->dev may alrea=
dy
be runtime-suspended when entering sdhci_msm_remove()):

  sdhci_msm_remove()
    sdhci_remove_host()
    if (msm_host->fw_managed) {
        sdhci_msm_fw_power_state(&pdev->dev, false);
        dev_pm_domain_detach_list(msm_host->pd_list);
        msm_host->pd_list =3D NULL;
    }
    pm_runtime_get_sync(&pdev->dev)
      -> sdhci_msm_runtime_resume()
        -> sdhci_msm_fw_power_state(&pdev->dev, true)
          -> msm_host->pd_list->pd_devs[DOMAIN_IDX_POWER]

If &pdev->dev is runtime-suspended at that point,
sdhci_msm_fw_power_state(&pdev->dev, false) calls pm_runtime_put_sync(pwr_d=
ev)
a second time (underflowing pwr_dev's usage_count), and the subsequent
pm_runtime_get_sync(&pdev->dev) invokes sdhci_msm_runtime_resume() ->
sdhci_msm_fw_power_state(&pdev->dev, true), which dereferences
msm_host->pd_list after it has already been detached and set to NULL. Even =
if
&pdev->dev is active, an autosuspend timer can fire concurrently before
pm_runtime_disable(&pdev->dev) is called.

Should the msm_host->fw_managed cleanup in sdhci_msm_remove() be moved after
pm_runtime_get_sync(), pm_runtime_disable(), and pm_runtime_put_noidle(),
matching clk_bulk_disable_unprepare() and the unwind order in
sdhci_msm_probe()?

> @@ -2947,6 +3144,9 @@ static int sdhci_msm_runtime_suspend(struct device =
*dev)
>  	struct sdhci_msm_host *msm_host =3D sdhci_pltfm_priv(pltfm_host);
>  	unsigned long flags;
> =20
> +	if (msm_host->fw_managed)
> +		return sdhci_msm_fw_power_state(dev, false);
> +
>  	spin_lock_irqsave(&host->lock, flags);
>  	host->runtime_suspended =3D true;
>  	spin_unlock_irqrestore(&host->lock, flags);
> @@ -2967,6 +3167,9 @@ static int sdhci_msm_runtime_resume(struct device *=
dev)
>  	unsigned long flags;
>  	int ret;
> =20
> +	if (msm_host->fw_managed)
> +		return sdhci_msm_fw_power_state(dev, true);
> +
>  	ret =3D clk_bulk_prepare_enable(ARRAY_SIZE(msm_host->bulk_clks),
>  				       msm_host->bulk_clks);
>  	if (ret)

[Severity: High]
Should sdhci_msm_runtime_suspend() and sdhci_msm_runtime_resume() still upd=
ate
host->runtime_suspended under host->lock when msm_host->fw_managed is true?

In drivers/mmc/host/sdhci.c, both sdhci_led_control() and sdhci_irq() check
host->runtime_suspended under host->lock before accessing SDHCI MMIO regist=
ers
(SDHCI_HOST_CONTROL and SDHCI_INT_STATUS):

  sdhci_led_control()
    spin_lock_irqsave(&host->lock, flags);
    if (host->runtime_suspended)
        goto out;

  sdhci_irq()
    spin_lock(&host->lock);
    if (host->runtime_suspended) {
        spin_unlock(&host->lock);
        return IRQ_NONE;
    }
    intmask =3D sdhci_readl(host, SDHCI_INT_STATUS);

Because sdhci_msm_runtime_suspend() and sdhci_msm_runtime_resume() return
early for msm_host->fw_managed without updating host->runtime_suspended (as
added in commit f8def10f73a5 ("mmc: sdhci-msm: pervent access to suspended
controller")), host->runtime_suspended remains false while the SDCC power
domain is powered off, allowing LED brightness updates or shared/spurious
interrupts to access unpowered MMIO registers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-sdcc_scmi-=
v1-0-244dbd893051@oss.qualcomm.com?part=3D2
