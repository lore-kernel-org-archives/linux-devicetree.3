Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDC6390990
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279239; cv=none; b=Aeq4+S8OYrDyi2QdNEn0K3Nz5V4GrVboJiMgTQCU6CTrTpzyUNQAmpq1qho2Go7kHn90nP9joAIakJIkvn96nd5VRJuOiwHMpKe14OeQFavOvo8xdXZDYLZaY3P9aH1WblwOVpzdsWxaOtgpQcmKvopGWit3KgGpiBhSXhO5uDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279239; c=relaxed/simple;
	bh=JWR0t62m7H8va620EmC6U/KzOWxEkLpx1VOwJSBzoZ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=je91uFBt9X6UVXulEcxhflEMKWzMwi6qzNu33hDbdNuc048nYbRV+ythQ01VAlyImsu27WsvlQJ/uHznIUoIlvPUx+bf7qRW9Mnkaq5iEdikgOeaQLHTAYFi5VABr9oUf5SFT5dDlSDrIJyFN63lh8xSLZWE7z9Gu0C9zObtu7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Usvv+n48; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Usvv+n48"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D241F000E9;
	Fri, 17 Jul 2026 09:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279230;
	bh=oBMCb6cwhG/GD5Jmkyey8UDgC8ZiKAjZNgzQFhyTWvE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Usvv+n48+OkZtkIhCopg3x4z+VIIVsUN7gKh7utTLUhYbv6ST4goBMnA0MGB2chgO
	 F/8QCTm3W5lSifmt64dg+LBx9ZcDoKcP+LZTNyryAmw0yjRQPiWNr3nsYBBpVYRDHV
	 f4ucFj007nEWrrRDsNxe59mxCtHUZIx9IgTBYfsVP0+fBHYqmVPEGums1VRPbKPzdh
	 VWfxqbjd0UjKUvRREakIciCIBzjExID3BCUH2ijq0UJXby2u4SflGrwAqo4omC2tqQ
	 C94kaz/2pV4KDt4L58ItY+9DxNfb4liMxRZCnMDV3DcXvYgNMT4LH/rORwNhzTUlnJ
	 9GE23vZ4M362g==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/9] pmdomain/rockchip: add optional per-domain
 power-on settle delay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260717085220.3212274-3-gahing@gahingwoo.com>
References: <20260717085220.3212274-1-gahing@gahingwoo.com>
 <20260717085220.3212274-3-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 09:07:08 +0000
Message-Id: <20260717090708.E6D241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized State Overwrite in QoS registers on first power-on
--

--- Patch [2]: [RFC PATCH 2/9] pmdomain/rockchip: add optional per-domain p=
ower-on settle delay ---
commit a8d7f648552a5a45a8073245f6be06268bc14e7d
Author: Jiaxing Hu <gahing@gahingwoo.com>

pmdomain/rockchip: add optional per-domain power-on settle delay

This commit introduces a per-domain settle delay for the RK3576 NPU domains.
The delay is applied between releasing the idle request and writing to the
QoS registers to prevent an SError while the NoC is settling.

> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c

[ ... ]

> @@ -667,6 +668,9 @@ static int rockchip_pd_power(struct rockchip_pm_domai=
n *pd, bool power_on)
>  		if (ret < 0)
>  			goto out;
> =20
> +		if (pd->info->delay_us)
> +			udelay(pd->info->delay_us);
> +
>  		rockchip_pmu_restore_qos(pd);

[Severity: High]
This is a pre-existing issue, but does this unconditional restore overwrite
QoS registers with uninitialized state on the very first power-on?

If a power domain is initially OFF at boot, qos_save_regs remains
zero-initialized by devm_kcalloc(). On the first power-on request,
rockchip_pd_power() unconditionally calls rockchip_pmu_restore_qos(),
which writes these zeros directly to the hardware:

drivers/pmdomain/rockchip/pm-domains.c:rockchip_pmu_restore_qos() {
    ...
    regmap_write(pd->qos_regmap[i], QOS_PRIORITY, pd->qos_save_regs[0][i]);
    ...
}

If the hardware reset defaults for QoS bandwidth or priority are non-zero,
writing zeros could throttle or block interconnect traffic, potentially cau=
sing
the associated IP block to hang when accessing memory.

Is there a mechanism to ensure the QoS state is actually populated before it
is restored, or should the driver avoid restoring QoS state if a prior state
was never saved?

>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717085220.3212=
274-1-gahing@gahingwoo.com?part=3D2
