Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2226342669C
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379930; cv=none; b=jGv/KsjKAThwaj9m1n+0zY9HTxTN2Z+shK/UowAuXPlNrhpd6vAEU9a0R5jVYO2oUjysZGANfSiksKCRAWsWhuBkP6izSqMcFf0k4Sp1gsZE8txsbJ8HOEZeuQlGo+MO3U4TA5rdQ4PfpPtGp+SVChQCSnndPvpx9qSy5Cpngzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379930; c=relaxed/simple;
	bh=m0HdupB3Z3bUQ94mCqAWtjXdM9N8iAnFkajltBeM0Nk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IAO78m/2CeP576OEf5FM0vnOLCIzq0czFaSF+GDg81h5DKaVq2QOfbEQOTH8vL2NsJXclsjKlhkXPBUlyk3MIXpRVgoIgtCx8JSUgO62IZF/uDEQWlPuenk8c4Sw0eTOV9/QbsoDt2XlpsM2UHoDu0EqRHhjKNMRkgM3fJjPL6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9/tq36z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9/tq36z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743281F000FF;
	Mon, 14 Sep 2026 09:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789379928;
	bh=e0OH765dwSoAyj4PwdKbk+GqZEMkZ2nhRMaXN2Smpys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e9/tq36zoy89249NxXCGmC6ebZFGWOvehh+C8oik+5t+Jrqz575S2r2kWeqJu9QOJ
	 /oNJJKt52bIoHpxWGVsBnlvsz1pQghsnIDc7lbR93dJDFW/U2oPybh583bz8C0BpRq
	 tuI7RJqyMkrhVXVX0XO+xuhSJVqHuJhjzcW5dTd4ipM/xOew2GtSCbmmtUBb1OfqLx
	 QgpXbBHK2yHpkW6qUE9Ztdwz1sAZxmxi/5jZO6OwXgLoX8cuyrnPx458njWNypHNjK
	 vkp7aR7U2XpdR6Y0L/zSO3HhLgqyi2KUi8tBrX4Ulc//dGTbtqav/vzWkbAyONMu1E
	 4eB+hUm4xKHsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 07/10] arm_mpam: Fix
 mpam_dt_create_foundling_msc() to create MSC platform devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yin Li" <yin.li@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-7-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-7-bf6645bb2f65@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 09:58:48 +0000
Message-Id: <20260914095848.743281F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Mismatch between counted MSCs and created MSC platform devices pre=
vents driver initialization.
--

commit bac73a6ff8544df56e037a08ea1cdb821fbb6bbc
Author: Yin Li <yin.li@oss.qualcomm.com>

arm_mpam: Fix mpam_dt_create_foundling_msc() to create MSC platform devices

This commit modifies mpam_dt_create_foundling_msc() to walk the cache's
children using for_each_child_of_node_scoped() and create a platform
device for the MSC child node, rather than for the cache node itself. It
also skips cache parents that have been marked disabled by the firmware.

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_device=
s.c
> index 480e38cfa86dc..7ef3ed55b0665 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2366,23 +2366,20 @@ static struct platform_driver mpam_msc_driver =3D=
 {
>   */
>  static void mpam_dt_create_foundling_msc(void)
>  {
> -	struct platform_device *pdev;
> -	struct device_node *cache;
> -
> -	for_each_compatible_node(cache, NULL, "cache") {
> -		struct device_node *cache_device;
> -
> -		if (of_node_check_flag(cache, OF_POPULATED))
> -			continue;
> -
> -		cache_device =3D of_find_matching_node_and_match(cache, mpam_of_match,=
 NULL);
> -		if (!cache_device)
> +	for_each_compatible_node_scoped(cache, NULL, "cache") {
> +		if (!of_device_is_available(cache))
>  			continue;

[Severity: High]
Does skipping the creation of platform devices for MSCs under disabled cach=
es
cause a mismatch with fw_num_msc?

Looking at mpam_dt_count_msc(), it appears to count all available MSCs with=
out
checking if their parent cache is actually enabled:

drivers/resctrl/mpam_devices.c:mpam_dt_count_msc() {
    ...
	for_each_compatible_node(np, NULL, "arm,mpam-msc") {
		if (of_device_is_available(np))
			count++;
	}
    ...
}

If firmware has marked a cache node as disabled but the child arm,mpam-msc
node is not explicitly disabled, this counting mismatch causes fw_num_msc to
be greater than the number of successfully probed MSCs.

As a result, would the condition in mpam_msc_drv_probe() never evaluate to
true?

drivers/resctrl/mpam_devices.c:mpam_msc_drv_probe() {
    ...
	if (atomic_add_return(1, &mpam_num_msc) =3D=3D fw_num_msc)
		mpam_register_cpuhp_callbacks(mpam_discovery_cpu_online, NULL,
					      "mpam:drv_probe");
    ...
}

This could completely prevent mpam_register_cpuhp_callbacks() from being
called and leave the MPAM subsystem functionally unusable.

> =20
> -		pdev =3D of_platform_device_create(cache, "cache", NULL);
> -		if (!pdev)
> -			pr_err_once("Failed to create MSC devices under caches\n");
> +		for_each_child_of_node_scoped(cache, child) {
> +			if (!of_match_node(mpam_of_match, child))
> +				continue;
> +			if (!of_device_is_available(child))
> +				continue;
> +			if (of_node_check_flag(child, OF_POPULATED))
> +				continue;
> +			if (!of_platform_device_create(child, NULL, NULL))
> +				pr_err("Failed to create MSC device for %pOF\n", child);
> +		}
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-mpam-resct=
rl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com?part=3D7
