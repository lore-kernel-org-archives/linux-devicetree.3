Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95831175A8D
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790221668; cv=none; b=EHRQ3SuUoGkYFA4w5OeEGGunqGmIF9X2CX8n1BpwekFzOmrhvu3UvZUDQydVCJ6X8u3zF5IL2o6h9yeoOVWBLKYL0Q/T6YH673W7rYGOxcJackDrUEiCZCHdCMJ6D6N9VZ0zH8P6VBLRbVSExMTqTA7//ELrYOz1J1mWTKwb95M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790221668; c=relaxed/simple;
	bh=phjpQDP3aqs8GoXADQ4f7idVm9eZdDhcHCFAHFDbYVc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tb10F2ICxdsTmNG90MHA/RtMmvtIEWSLMz9o1OcjcJOfz9EnjefGsYALhfqdKmBS1czx77x/4fHQTxkdDvbvnZLXbMQ3SWYDvuIL7cptK1XQOfkXp3NdSv8ZG4lAOo8n9FaVeuv7IowATEjcowqc/fO5xxo0Zbc4b64gwLHP7HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSNcGJSg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSNcGJSg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7521F000FF;
	Thu, 24 Sep 2026 03:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790221667;
	bh=2CDCNJGRqZY+h0ZmKGSCrgHFx3b4fPwem1wSc9+Tuf8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LSNcGJSgYaxwFGbucpcQRyeFrofqvUdQzs2uzJdsIzhUDQKlRSK8yHt1WKit2xuJt
	 Xglps1uqTbPLGObxHJigHmSE/0THFAi4ZFBOxm2MFkW1J2YFZsH7wkClMc2v9nZFXB
	 oqF2ih4vHxXijGfWHEokRrKjLLoYw5FSHusJCAY2Uvt14u8ur+ovyrAixOJtrkKq2j
	 sd65YeCuxjnBfwDpfmXiiJU+mJ8CMIDaR1+wvgiMdmgLXakqZw5W3YzCIx5++Un/Uz
	 A650NdqmSzmpykYIS7diwFfENGSiU9rXovuTPus+NjrXg9gzs2amCbUqwYrz521hqy
	 ZMdgh3N8LdluA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH bluetooth-next v4 3/3] Bluetooth: btaic: Add AIC8800D80
 SDIO loader and UART transport
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yanli Yang" <yanli.yang@bedmex.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <179022103316.2.10766336739313723963.btaic-v4-3@bedmex.com>
References: <179022103315.2.2907053891316619435.btaic-v4-cover@bedmex.com>
 <179022103316.2.10766336739313723963.btaic-v4-3@bedmex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 03:47:46 +0000
Message-Id: <20260924034746.CA7521F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] bluetooth: btaic: unused suspend/resume functions when !CONFIG_PM_S=
LEEP
--

commit 774c6b59e34be9758b37b2fc097ca43acb716194
Author: Yanli Yang <yanli.yang@bedmex.com>

Bluetooth: btaic: Add AIC8800D80 SDIO loader and UART transport

This commit adds a driver for the AIC8800D80 Bluetooth chip, utilizing SDIO
function 1 for firmware loading and a serdev UART interface for the HCI
transport. It coordinates the firmware provider and UART consumer through a
reference-counted boot state.

> diff --git a/drivers/bluetooth/btaic_sdio.c b/drivers/bluetooth/btaic_sdi=
o.c
> new file mode 100644
> index 0000000000000..18d58f0832a5a
> --- /dev/null
> +++ b/drivers/bluetooth/btaic_sdio.c
[ ... ]
> +static int aic_bt_sdio_suspend(struct device *dev)
> +{
> +	struct sdio_func *func =3D dev_to_sdio_func(dev);
> +	mmc_pm_flag_t caps;
> +
> +	caps =3D sdio_get_host_pm_caps(func);
> +	if (!(caps & MMC_PM_KEEP_POWER))
> +		return -EOPNOTSUPP;
> +
> +	return sdio_set_host_pm_flags(func, MMC_PM_KEEP_POWER);
> +}
> +
> +static int aic_bt_sdio_resume(struct device *dev)
> +{
> +	return 0;
> +}

[Severity: Low]
Will compiling this driver with CONFIG_PM_SLEEP disabled trigger
unused-function build warnings?

When CONFIG_PM_SLEEP is not set, SET_SYSTEM_SLEEP_PM_OPS expands to nothing,
leaving aic_bt_sdio_suspend and aic_bt_sdio_resume unreferenced in this
file. Adding the __maybe_unused attribute to these static functions would
prevent the warnings.

> +
> +static const struct dev_pm_ops aic_bt_sdio_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(aic_bt_sdio_suspend, aic_bt_sdio_resume)
> +};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179022103315.2.2907=
053891316619435.btaic-v4-cover@bedmex.com?part=3D3
