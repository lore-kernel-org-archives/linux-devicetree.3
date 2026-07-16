Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4877E3AD539
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 23:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784245027; cv=none; b=cgPl7P980Gzas1C7WA4TNogoclOXUiPdzYkGI0d6y+zvjuXGRImKw3ECeCAvFEf6vxOL2RjObzZpmYS5jPpFddf3H5UNnNwdjec198xue/cJM2cRNzg66zXU639FFmk8oo32r/OWQlqPUBIwm9S4HiKuKpCSRZO2HkNIEZZZC8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784245027; c=relaxed/simple;
	bh=vBBMtqEuDA45Vg66KHAfFnZ4WzEV6pBN/0vrmVYi6js=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jAoWGoSarLzTvMHGm5XHaFmUsYyG9f4cOpleyytRIpF8CpY9hUUVsg8RYypd8c5FBEiM47ZxrnllDwqC6AN8yvULISW5OqsZ/RXbeTeReGLXBFDHJFrUIWIeCBea7t2PFLLt+95kEBeef68YPrHtHzecdLWdEV9NiGqKKop8wHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5yZBmY4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5yZBmY4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B831F000E9;
	Thu, 16 Jul 2026 23:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784245025;
	bh=5mJmteMwyeQ9SX5+E3wcxQ0hHgIcKDlFR4uRLuGrQ6Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S5yZBmY4hzTUOgRVMVYW6PiqiCtKEFmtnhtpmQPNOPpndTj6DW5+/P16U7kaaJop+
	 Yasn72ZDTNFVfmVQ3S7ByTCM2+FhKq8oDD8lCwmKs0iROByIH3Bh2gXMVlAAaf+WLW
	 DYwCLn1tUDF+GdoCAWieBJS5TqttDxPXhS7K1D49pCaxDtqBLAINWKzTXFi1EqKyuQ
	 70qDLOqXklzHaE7xjyjdVpiLSjwO74WZHgkkNWFRt02Pn7whvnW9q/GbwyOC4pvSGi
	 SybO4qtIJPX7WjrqGjE+N0NaU3MuNfMEOhekuz9agtR5e1WmEOF5j8gEtNj3/GO7fw
	 gTujkiwOPX2Pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mmc: core: Add post-power-off-delay-ms support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716232641.2659710-3-jm@ti.com>
References: <20260716232641.2659710-1-jm@ti.com>
 <20260716232641.2659710-3-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 23:37:05 +0000
Message-Id: <20260716233705.96B831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `post-power-off-delay-ms` hardware constraint is only enforc=
ed in `mmc_power_cycle()`, leaving decoupled power-off/power-on sequences v=
ulnerable to hardware timing violations.
- [Low] Explicitly configuring a 0 ms post-power-off delay in the device tr=
ee is ignored, falling back to the 1 ms default.
--

--- Patch [2]: [PATCH 2/2] mmc: core: Add post-power-off-delay-ms support -=
--
commit 36ce7de56b9b7e7608c56353aede4cb3de73df5b
Author: Judith Mendez <jm@ti.com>

mmc: core: Add post-power-off-delay-ms support

This commit adds support for post-power-off-delay-ms, allowing a
configurable delay after an MMC power off.

> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 29e80e5f928e9..f9049aaf44394 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -1394,8 +1394,12 @@ void mmc_power_off(struct mmc_host *host)
>  void mmc_power_cycle(struct mmc_host *host, u32 ocr)
>  {
>  	mmc_power_off(host);
> -	/* Wait at least 1 ms according to SD spec */
> -	mmc_delay(1);
> +	if (host->post_power_off_delay_ms) {
> +		mmc_delay(host->post_power_off_delay_ms);
> +	} else {
> +		/* Wait at least 1 ms according to SD spec */
> +		mmc_delay(1);
> +	}

[Severity: Medium]
Will this delay be missed for decoupled power-off and power-on sequences?

If a device relies on post-power-off-delay-ms (e.g., 100ms) but goes throug=
h a
runtime PM suspend or system suspend, mmc_power_off() will be called, follo=
wed
later by mmc_power_up(). Because the delay is only enforced here in
mmc_power_cycle(), will the decoupled off/on path violate the power-off time
constraint?

Could mmc_power_off() record a timestamp, and mmc_power_up() calculate the
elapsed time to only delay the remaining required duration?

[Severity: Low]
Does this ignore an explicitly configured 0 ms delay?

If a developer explicitly specifies post-power-off-delay-ms =3D <0> in the
device tree, this condition will evaluate to false and unexpectedly fall
back to the 1 ms default.

Could this be resolved by initializing the default value in mmc_alloc_host()
and removing the if/else condition here?

>  	mmc_power_up(host, ocr);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716232641.2659=
710-1-jm@ti.com?part=3D2
