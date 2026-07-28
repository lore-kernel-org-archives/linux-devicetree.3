Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D8C3B95E7
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785266193; cv=none; b=ff1Sv24JuqkIna+xbXLkfMZ0Hsch6G2YJYKCmg7MaXehSRWrKtPvI7lxrYOdNnWUHU5HdruVgMCMITI3hLlnC5WEMzNBLsWpDNSMr3DjBpim2OG9TnFRMUG3QAXRegzaeuAvvG5cHhTCfRydPBHs0IyP0DlQBfKALJ/wsk4y4Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785266193; c=relaxed/simple;
	bh=VICWcYTJngu6Ul8FcfHNdnAJirNAGOGzGx9ksSUDL1g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OokJWgfHeMvVoL5Wz+fC+ieJrWUH7XfkihfIr92UaeR//ZBssiCW92Lwy3ni9JE5l1SY0pEvIPJ0+S3xoA7RqjFqaadJMVMBFrDzaEnAdBFaQ5QW2l3OWplr4Ehxl42ycRJLEVvChFqdARN6No/D4n2XAW414u2joIjhv8X8LY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYvic5dN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYvic5dN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8631F000E9;
	Tue, 28 Jul 2026 19:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785266190;
	bh=zMByD2EfqIt73SxkrNdMPfkynSgrtjUxE9t0Qj972ro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hYvic5dN6gXoRq846VpZliLASQ0RFFWpMst6HZNQER7dY8bxqXyVN9Qo1XGAj9P57
	 kh+KqN8cXknNGyTJh4iRXEanK8RqoEp/eZMvTuqt1AJmwfQ+PEEfjph5rHBXUHyLuq
	 be/tac0aKFWQMYDdKRsJm+sdTmoen7l0V7KOKUIk9K3uv9FEFt8lKmJhN2XucPZb4F
	 gxbTqP2fWiw4bCprgYcm6ohBqLWG2eS7jQI1LCDcTqYlMLBxexjpRR+GRUu95YialN
	 KIF+e3frbkvYdLlTHinr27nEpvmED4yU109KLHn02EU/hjtJonyt0Xqxyce4TWMNA7
	 +nVSo7DM0UHcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: mmc: Extend keep-power-in-suspend
 beyond SDIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kamal Dasu" <kamal.dasu@broadcom.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728190314.2325906-2-kamal.dasu@broadcom.com>
References: <20260728190314.2325906-1-kamal.dasu@broadcom.com>
 <20260728190314.2325906-2-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 19:16:29 +0000
Message-Id: <20260728191630.4B8631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `keep-power-in-suspend` DT property contract is extended to (e=
)MMC devices but is not implemented in the MMC core, causing cards to be in=
correctly powered off during suspend.
--

--- Patch [1]: [PATCH v4 1/2] dt-bindings: mmc: Extend keep-power-in-suspen=
d beyond SDIO ---
commit 586f6f073c6606f13ea85125ddb68d3d032283b3
Author: Kamal Dasu <kamal.dasu@broadcom.com>

dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO

This commit drops the SDIO only restriction for the keep-power-in-suspend
property and documents its use for MMC devices. This allows platforms where
firmware accesses the card directly during system resume to specify that
card power must be preserved.

> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.=
yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> index 3d7195e9461c3..f4663b3184355 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> @@ -291,7 +291,12 @@ properties:
>    keep-power-in-suspend:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:
> -      SDIO only. Preserves card power during a suspend/resume cycle.
> +      Preserves card power during a suspend/resume cycle. For SDIO,
> +      this is a request an individual function driver can make at
> +      runtime via sdio_set_host_pm_flags(). For (e)MMC, it is instead
> +      a fixed platform characteristic, needed on boards where firmware
> +      accesses the card directly during system resume, before the
> +      kernel's own resume path runs.

[Severity: High]
Does the MMC core currently support preserving power for MMC devices
during suspend to fulfill this newly documented contract?

Looking at the eMMC suspend path, it unconditionally calls mmc_power_off():

drivers/mmc/core/mmc.c:_mmc_suspend() {
	...
	if (!err) {
		mmc_power_off(host);
		mmc_card_set_suspended(host->card);
	}
	...
}

The SD suspend path also unconditionally powers off the card:

drivers/mmc/core/sd.c:_mmc_sd_suspend() {
	...
	if (!err) {
		mmc_power_off(host);
		mmc_card_set_suspended(card);
	}
	...
}

If a platform relies on this property because its firmware accesses the
card directly during resume, wouldn't unconditionally powering it off during
suspend break the system resume?

Is there a missing patch in this series to update the core to check
the property before calling mmc_power_off()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728190314.2325=
906-1-kamal.dasu@broadcom.com?part=3D1
