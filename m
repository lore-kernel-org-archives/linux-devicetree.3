Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDBC345EC2
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 07:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785914384; cv=none; b=rOshth9KXn0aGiMFKeOBYEqyJo21bpwWYLCVR8hK2GchC3denqzCUpMSYT850/A1fXci6ehP147qxIo/LIcUzR/eGuOlK66RH242vUx4yASgd4H3CPGUPlMetD7FeJAM98fV4Gg4RBbHWAbtTl6TVu+vn03/J6u9zn/SN7bRq6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785914384; c=relaxed/simple;
	bh=ak5xc9wkM5CSZ9/JtvUeaoVaY0Y5f/9vidTcHVtqZWg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XFC6WiMBeOpXE201u1wpJDK5CtX2moXtxW2jNKNwzg16L6Bccj9OK5ZMB7Mn9uRkEEyqsYEAP6NsmPOYICfCnk0BsHjRlgcrR0Aybo+JqbQMQzZvX4Aj/S4ePuNSF+N8wbGTtkidYhCfEM3PmULCg0DCautr4Y5EyzNSXIgMwAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=co6MMXJ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="co6MMXJ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC9B1F000E9;
	Wed,  5 Aug 2026 07:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785914383;
	bh=3a8tJbREc+6bPB3Xdd/u3Dc6l7NxNS2jrMaxfK906W0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=co6MMXJ0HhAFXPXPWStE2tz5FXLzSMkhGxJInmjNnPp7/24b5SAoyduXziHIP6ARZ
	 rUGjyI/MW/GhtyGKhG95DQ5hZ1xVgfUdPNj5ZiqurF60rmCUk6OLu39SOz2aN/+Ia8
	 QCRWJt+0d3hdYyu5ttcFaDXnJ2KrRfBvDCmNC4SnFKV65dkz1rmgvrcj2DGN/ArIdA
	 VI0KTM4GKHkUIxDux53CrDG0BzL385HlLVq1648YkX+RLlZ/kBl3aeI/WYJqdaiiXw
	 gn4fpH9hpl+9qdn9bTR/TwM0ANf+I7PvD13zNwLtxTAsCN8hxwlNWgO1S78DmWTril
	 NTM1QICJMRXGg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v5 v5 4/8] pmdomain/rockchip: add optional
 per-domain power-on settle delay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805063826.95682-5-gahing@gahingwoo.com>
References: <20260805063826.95682-1-gahing@gahingwoo.com>
 <20260805063826.95682-5-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 07:19:41 +0000
Message-Id: <20260805071942.DCC9B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] On the first power-on from a cold boot, `rockchip_pmu_restore_qos(=
)` incorrectly writes uninitialized zero values to the hardware QoS registe=
rs if the domain was powered off by the bootloader.
--

--- Patch [4]: [RFC PATCH v5 v5 4/8] pmdomain/rockchip: add optional per-do=
main power-on settle delay ---
commit c7d671d6283e8b2b3bf5a4fdce967757abdd8d2f
Author: Jiaxing Hu <gahing@gahingwoo.com>

pmdomain/rockchip: add optional per-domain power-on settle delay

Adds an optional delay_us parameter to rockchip_domain_info to allow the=20
RK3576 NPU domains to settle after the idle request is released. This ensur=
es=20
the QoS registers answer properly and prevents an async SError on the first=
=20
cold power-on.

> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c

[ ... ]

> @@ -681,6 +684,10 @@ static int rockchip_pd_power(struct rockchip_pm_doma=
in *pd, bool power_on)
>  		if (ret < 0)
>  			goto out;
> =20
> +		/* Some domains need to settle before the QoS registers answer. */
> +		if (pd->info->delay_us)
> +			udelay(pd->info->delay_us);
> +
>  		rockchip_pmu_restore_qos(pd);

[Severity: High]
This isn't a bug introduced by this patch, but is it possible that
rockchip_pmu_restore_qos() writes uninitialized zeroes to the hardware
QoS registers on the first power-on?

If a domain is powered off by the bootloader, pm_genpd_init() initializes
it as off, and rockchip_pmu_save_qos() is never called to save the hardware
defaults.

Since qos_save_regs is zero-allocated in rockchip_pm_add_one_domain():

    pd->qos_save_regs[j] =3D devm_kcalloc(pmu->dev, pd->num_qos,
                                        sizeof(u32), GFP_KERNEL);

When the domain is powered on for the first time by a consumer, this path
is reached and rockchip_pmu_restore_qos() directly writes those zeroes to
the QoS registers, such as QOS_PRIORITY.

Can this cause performance degradation or starvation for IPs in the domain?

>  	}
> =20
> @@ -1300,25 +1307,26 @@ static const struct rockchip_domain_info rk3568_p=
m_domains[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805063826.9568=
2-1-gahing@gahingwoo.com?part=3D4
