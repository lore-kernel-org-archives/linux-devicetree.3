Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EDD35A381
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780017905; cv=none; b=iYySrDE4b5DQXeuX3bx0LuzI5ILk1v3ejL4Q34RcRI5VgU6DLXHMr68p8fOsT9YKg1lnRowW+lruOCqU7JgB7sM0OS5hblLgPZYu4Ip34BrLGGWf4b8V9Y7llVTNec/2e49Ys07GGAg47n6dBoGqz7z+y7FQmgCJbD7A/7MEGhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780017905; c=relaxed/simple;
	bh=lg6Vbte0KWP8G9B6Y2o7bu8KOXlNcPTbiSvyYf3lspA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HswMdUsXbcX/Ozq1es6bEtZ8OtcETxArI58WIOLlBpRNUyhM7YwJlTRYZ2Qvidoovw+mqc5akBeiNXXytNuzp7mfIqy729q+OQEbqT63JETKTmSS4HvAg0UHvyDB6++46aMumpEhm/pvuON//pBuUE712/LiDk0wyo99ym0Ybn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NilX7Kjz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NilX7Kjz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF511F000E9;
	Fri, 29 May 2026 01:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780017901;
	bh=WYlSyxW/6zecdx6ra7EY78UdiVbjuPPgA57jb1BXRYg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NilX7KjzBpk5uYafp8EM6cHLJvsSD6XwR8yGWXhUflwqkOp77EqfA1ha/gbxUT+sw
	 Se7S7U5Sek3hteVhLJAPwSJ4LBMwsidJ3XGziDHT+IrtUKi3nk1TMFWSgOFcEoplUE
	 Yj5VgpycSHBqqzCyASCQNzAQDlGUwVPiGcS1WqJdUNlg8OcW0jz0zLPWhJh15/UBFg
	 LBYSyqSoiU+8AN/Jxr2LmoatTxpuwUJBfMdIy7PFfya8oynik3FVkNmh5B0qttH4qz
	 ZzM7JL5/NtKaRZpxMXFVwI5JiUuqfcs7QQAvdBWuG0EcBW5cgJnmIQ4Y0ZBfPWj03O
	 p8s4fM9udNSMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] bcma: allow SHIM-style mini-EROM wrapper-less cores
 in scan
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alessio Ferri" <alessio.ferri@mythread.it>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260529-add-bcm6362-wlan-v1-2-722242777f58@gmail.com>
References: <20260529-add-bcm6362-wlan-v1-2-722242777f58@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 01:25:00 +0000
Message-Id: <20260529012501.1AF511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unconditional dereference of `cc->core` in dependent modules can c=
ause a kernel Oops if core scanning fails or a core is missing.
- [High] The fallback bridge check in `bcma_get_next_core()` fails to skip =
the rest of the component's EROM descriptors before returning `-ENXIO`.
--

commit 257794fc3cb2f2e7a20011d91e6239f7a6956709
Author: Alessio Ferri <alessio.ferri@mythread.it>

bcma: allow SHIM-style mini-EROM wrapper-less cores in scan

This commit modifies bcma_get_next_core() to allow certain wrapper-less
components on systems with a specific mini-erom layout. It resolves a
silent failure where skipped components lead to an empty core list,
eventually causing a null pointer dereference during probe.

> On SoCs that publish a SHIM-style mini-EROM (i.e. BCM6362) the
> WLAN backplane lists three components:
> ChipCommon, IEEE 802.11 and BCMA_CORE_SHIM. None of the three is
> in the existing allowlist, so all three are skipped silently,
> bus->cores stays empty, bcma_find_core(BCMA_CORE_CHIPCOMMON)
> returns NULL, and a later bcma_chipco_watchdog_register()
> dereferences cc->core->bus on its first line and oopses mid-probe.

[Severity: High]
This is a pre-existing issue, but does fixing this specific edge case
leave an underlying structural fragility unhandled?

If a hardware variant genuinely lacks a ChipCommon core or its erom is
malformed, bcma_find_core() returns null and bus->drv_cc.core remains null.

Subsequently, bcma_register_devices() calls bcma_gpio_init() and
bcma_chipco_watchdog_register(). Both of these helper functions
unconditionally dereference cc->core->bus on their first line without
checking if cc->core is valid.

This would trigger a null pointer dereference and a kernel oops mid-probe.
Since the bus can be exposed over hotpluggable pci interfaces, could a
malformed or malicious untrusted device intentionally trigger this local
denial of service?

> diff --git a/drivers/bcma/scan.c b/drivers/bcma/scan.c
> index 983a62ddeebb0..782fc53eb6b3c 100644
> --- a/drivers/bcma/scan.c
> +++ b/drivers/bcma/scan.c
> @@ -318,6 +318,21 @@ static int bcma_get_next_core(struct bcma_bus *bus, =
u32 __iomem **eromptr,
>  		case BCMA_CORE_GCI:
>  		/* Not used yet: case BCMA_CORE_OOB_ROUTER: */
>  			break;
> +		case BCMA_CORE_CHIPCOMMON:
> +		case BCMA_CORE_80211:
> +		case BCMA_CORE_SHIM:

[Severity: High]
This isn't a bug introduced by this patch, but does the fallback bridge
check later in bcma_get_next_core() fail to skip the rest of the component's
descriptors before returning -ENXIO?

If a bridge component has master ports, the early bcma_erom_is_bridge()
check returns false. Later, when bcma_erom_get_addr_desc() identifies a
SCAN_ADDR_TYPE_BRIDGE descriptor, it logs "Bridge found" and returns -ENXIO:

drivers/bcma/scan.c:bcma_get_next_core() {
    ...
		/* Try again to see if it is a bridge */
		tmp =3D bcma_erom_get_addr_desc(bus, eromptr,
					      SCAN_ADDR_TYPE_BRIDGE, 0);
		if (tmp =3D=3D 0 || IS_ERR_VALUE_U32(tmp)) {
			return -EILSEQ;
		} else {
			bcma_info(bus, "Bridge found\n");
			return -ENXIO;
		}
    ...
}

Crucially, unlike other -ENXIO error paths, it omits calling
bcma_erom_skip_component(bus, eromptr).

If the bridge component has remaining descriptors like additional slave por=
ts
or wrappers, eromptr is left misaligned mid-component. On the subsequent
iteration of the scan loop in bcma_bus_scan(), the parser would expect a
component identifier but encounter a leftover wrapper or port descriptor
instead.

Could this result in an -EILSEQ error that prematurely aborts the entire
bus initialization?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-add-bcm636=
2-wlan-v1-0-722242777f58@gmail.com?part=3D2
