Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410EC3DA7C3
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 20:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785356620; cv=none; b=EFK/t34023qfD8TPOD0m7mXgdeesYbffYOUGSxlc3yilhshpbckwb7gcW1rfLqgl7QK3r6BcIJ4vb8vBALvR3og9c5Y+TF0+r9vfb/c4lHil9hPgb56EwfxH/vj82WwGt3tLIPVRt2wNESkss2WKPjcX8ge1zSnIoguncCMycsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785356620; c=relaxed/simple;
	bh=QrhDybLBDTOuvrc7xBUErQeKKoQ9fkmqg8KIt3ZB6js=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L3EtdsLwQU7RAOFUJJKbBgaKjkzYEGAJYF0rxXKNp268SiD1Q3YFxxVNtGpL2mylub1WEzy6BzjTsakev+LQ3MptAkx2KPWAy7Og/W3e5FiEjDRQ3yKXVpAfIth2ig5JpEANrE2JVNFOhJAi0cQTvViuA/E2Qxfd01pf6OKrynA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/WUJfb7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/WUJfb7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABD11F000E9;
	Wed, 29 Jul 2026 20:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785356617;
	bh=qSvWIpZh3+YXiBJWapJs7D+pwVAX7/eOlw49x9LDJwc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e/WUJfb70BvJF1T5m2fQnTY0EN8/IMQcByqvtIlQa5VlzBKy4XnEvQtUkdOKN6pld
	 P1+RASzEoRjstNPXdYeLJKCcxgvYDBUP5rZaHTDXLY4+QkWfQjrds2Sgr7mU3wWp2U
	 KTVb1IOxcV8KwnLWQIzm6in/L6HJFKiU0CUuoyb/bbH+2REZX0GhMHUnhU0E4CaHFY
	 7Ap3YrTxVK5/7we3YguHvf5cPAw5F4wHLZBdKpiyM821L6OtQcAg0zPxG/dknzqypb
	 70SnKpgTB0k7LuwKQ+v1d+bIdbRtCoHSNburzbgHcwWo46CPLTajoOOUMVCvgoxSTN
	 31WYIeV8cDC4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: mmc: Extend keep-power-in-suspend
 beyond SDIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kamal Dasu" <kamal.dasu@broadcom.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729201420.4047677-2-kamal.dasu@broadcom.com>
References: <20260729201420.4047677-1-kamal.dasu@broadcom.com>
 <20260729201420.4047677-2-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 20:23:36 +0000
Message-Id: <20260729202336.CABD11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The commit documents `keep-power-in-suspend` as a supported contra=
ct for (e)MMC platforms to preserve power during suspend, but the MMC core =
does not implement this behavior for non-SDIO cards, resulting in a false c=
ontract. The MMC core will unconditionally power off the card during suspen=
d, breaking firmware that relies on the card remaining powered.
--

--- Patch [1]: [PATCH v5 1/2] dt-bindings: mmc: Extend keep-power-in-suspen=
d beyond SDIO ---
commit 4c90177be3ef2dae76dde526bf579376039fcb17
Author: Kamal Dasu <kamal.dasu@broadcom.com>

dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO

This commit drops the "SDIO only" restriction for the keep-power-in-suspend
property in the MMC device tree bindings. It updates the documentation to
state that for (e)MMC devices, this property indicates a platform requireme=
nt
where firmware accesses the card directly during resume.

> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.=
yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
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
Does the MMC core actually support keeping power for non-SDIO cards during
suspend?

Looking at the implementation in drivers/mmc/core/mmc.c, _mmc_suspend()
appears to unconditionally power off the card:

drivers/mmc/core/mmc.c:_mmc_suspend() {
        ...
        if (!err) {
                mmc_power_off(host);
                mmc_card_set_suspended(host->card);
        }
}

Unlike the SDIO suspend path, it lacks a check for mmc_card_keep_power(host=
).
Without this check, won't the kernel still power off the card during suspend
even if keep-power-in-suspend is defined in the device tree?=20

If firmware attempts to access the unpowered MMC device during early resume
because it expects this DT contract to be honored, could this result in a
system crash or resume hang?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729201420.4047=
677-1-kamal.dasu@broadcom.com?part=3D1
