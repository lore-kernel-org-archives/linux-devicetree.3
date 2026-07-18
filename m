Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A007E25A354
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 03:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784344837; cv=none; b=U2bc1rTo4KELb7x6PsadQBohhk5ZJGjTvDbJkGGqD7lRioWzvZiPJNr5/Kmr7BldM2QSzxUx4ybLcLqzZPyalJsw25xjEn7gBS6ARvmSe/1OpU46A7hdEWoY0syq67vjisdpn8p35DeeHdtiICReKoPmaiXYPz0y8hdFW0SGndk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784344837; c=relaxed/simple;
	bh=qW8ay5yIEqK2iqMeHLqtnfg0D6dfz+XzqyOAsGbrbwA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V+T8YJWWctFQftd1ld5RUwnuBfBLNaDoQOkSRoT53SPgCf62fxIR2bszzQKJnllcM4XbDTSLud0TMEGlBnwNEtHaPj3jJZM4lCSRtOlOtjNrjwpnyd+XRdyeteVUPxWGh8IaN4v8vcqqInxpk+J8RM/IA2+0nD5ODOineYyDTfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWQkKH0+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWQkKH0+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1000A1F000E9;
	Sat, 18 Jul 2026 03:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784344836;
	bh=odXcpOwQmd8uyldO3l8CCz4AVEO+Gh5iU9jICwEg1bc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PWQkKH0+HgXcn/HrNqCNhkJYecMuC9gHnJcqG6e71ec+6onOyDF6hrJ5ng7A1ALOK
	 pO3PYfOFVqvxryUEL1H35kmvUJRbL0xqguildB4pIjzhnBhHwhXLq9EOK+80FepDpa
	 AuApeeGXoiwWhcTtvBP/blNGXuY2xbgWL020feb1OVQngekux0cMW9KGQMUQ/PBaP+
	 jfwSzmUI3Ha0t4KAjM+/vnEdtw039ZX86RNKZpPUlevhEZygYT7LXGT6UcjPBpEzj5
	 CJzCEmaSs5HD4IeWyo5xsA69KS+LdsDN6sCn/SP82u6cgW5BHvm1sHODyiE3iYinFf
	 Z1GsmJO0IvBKg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 2/8] pmdomain/rockchip: add optional per-domain
 power-on settle delay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260718031146.3368811-3-gahing@gahingwoo.com>
References: <20260718031146.3368811-1-gahing@gahingwoo.com>
 <20260718031146.3368811-3-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 03:20:35 +0000
Message-Id: <20260718032036.1000A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing state rollbacks in the error paths of rockchip_pd_power() =
can leave the hardware in an inconsistent or unusable state, leading to a k=
ernel panic.
--

--- Patch [2]: [RFC PATCH v2 2/8] pmdomain/rockchip: add optional per-domai=
n power-on settle delay ---
commit 5d8a3f8a8260643f6533a94cae0393fe9867b0cc
Author: Jiaxing Hu <gahing@gahingwoo.com>

pmdomain/rockchip: add optional per-domain power-on settle delay

This commit adds a per-domain settle delay for the RK3576 NPU domains.
It introduces a delay_us field to rockchip_domain_info and applies the
delay in rockchip_pd_power() before restoring QoS settings.

> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index 490bbb1d1d8e8..1787f62ba3a81 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c

[ ... ]

> @@ -667,6 +668,9 @@ static int rockchip_pd_power(struct rockchip_pm_domai=
n *pd, bool power_on)
>  		if (ret < 0)
>  			goto out;

[Severity: High]
This is a pre-existing issue, but there appears to be a problem with the
error path in rockchip_pd_power() when a domain transition fails.

When the genpd framework attempts to power off a domain and
rockchip_pd_power() is called with power_on set to false, the driver
successfully idles the bus interconnect:

        if (!power_on) {
                rockchip_pmu_save_qos(pd);

                /* if powering down, idle request to NIU first */
                ret =3D rockchip_pmu_set_idle_request(pd, true);
                if (ret < 0)
                        goto out;
        }

If the subsequent call to rockchip_do_pmu_set_power_domain(pd, false) fails
due to a hardware timeout, the function jumps to the out label without
reverting the idle request.

The genpd framework seems to gracefully handle the error by keeping the
domain status as GENPD_STATE_ON. However, when a consumer device later
resumes and attempts to access its MMIO registers, the interconnect remains
physically idled.

Can this cause the bus to hang and raise an SError, leading to a kernel
panic? Would it be appropriate to revert the idle request in the error path
before returning?

> =20
> +		if (pd->info->delay_us)
> +			udelay(pd->info->delay_us);
> +
>  		rockchip_pmu_restore_qos(pd);
>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718031146.3368=
811-1-gahing@gahingwoo.com?part=3D2
