Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F006C383326
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778541121; cv=none; b=X2Srfd067sLTG402bbqb+8lM683Img6aiiaKZw4hoPV8GAr816g4n/n97jmRbWDKL2DP9Eem70E/NTQ/GRCxJsHgOchQeorj+91ZgEikk4aSUw8owNrqoaUvtn6L877a/Vk+BBUBhrRfMecNl1Kr4OW+IUzL8LwdUtMNT2dkblQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778541121; c=relaxed/simple;
	bh=+z+E5+m6cbTBZPzHuqmAzt+ndtiKCx7tPIdP58O3Jf8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tXH3BQvRQiBHv1rtZZkACdAvXZUW2EAGuMQdPayq+Q91djjmSMnmDJijgQ7Nl63rOMXBMDLJyq8qwCR+551z1nrWsHj87Zv64DDaOeltdvoZx6VUIvEF/tgzBpuWn2wO8kzmMEt9kQRMLWjvnLCzot8mGVZEYURlxqn9uzgIPhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3D9r0S8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3D9r0S8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED783C2BCB0;
	Mon, 11 May 2026 23:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778541120;
	bh=+z+E5+m6cbTBZPzHuqmAzt+ndtiKCx7tPIdP58O3Jf8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=G3D9r0S87gRN++lVgvmWvB/iuFGHlHeY7RTREFKaWi8Z+M6PHHllqGtSuQmG7xdgb
	 4AzjsBy4Zkc1k48k56rjKNmRL/PZhZNo0Z1bIuPA30f2++Hl8+E/xIkVk11WSEmjeO
	 iMxb9AGS1YMLald77cihda0PnrQcKAXqpr/uodHNmSPup+QoPJ0O/zoh2vGKL9H7am
	 rtO6tImoMhuw2wVrHueGKeMv3llwVLOXZ1vCgFawhv3YXrW3xP7coMempPLepcitZD
	 KxLpHAeycEBp7GiiXDbp2/HtydjJWyOoBkt6N+PtGoaO87ECAup0occyX/qI6GqquL
	 gIouVdlHXRNfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 08/11] iio: frequency: adf41513: handle LE
 synchronization feature
Reply-To: sashiko@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260510-adf41513-iio-driver-v12-8-34af2ed2779f@analog.com>
References: <20260510-adf41513-iio-driver-v12-8-34af2ed2779f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:11:59 +0000
Message-Id: <20260511231159.ED783C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver modifies the cached register state (`st->regs`) before =
performing SPI transactions, but fails to revert these changes if the SPI t=
ransaction fails. This leaves the shadow register state corrupted and viola=
tes hardware sequencing constraints on subsequent retries.
--

commit a7ad01199feb60254a514f4aa41d379243946b28
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: adf41513: handle LE synchronization feature

This commit introduces support for the LE synchronization feature on the
ADF41513. It enables the feature during device setup and handles
enabling/disabling it during resume and suspend.

> diff --git a/drivers/iio/frequency/adf41513.c b/drivers/iio/frequency/adf=
41513.c
> index b8a8b9fb81d9d..397e859170cc0 100644
> --- a/drivers/iio/frequency/adf41513.c
> +++ b/drivers/iio/frequency/adf41513.c

[ ... ]

> @@ -634,13 +635,27 @@ static int adf41513_set_frequency(struct adf41513_s=
tate *st, u64 freq_uhz, u16 s
>  static int adf41513_suspend(struct adf41513_state *st)
>  {
>  	st->regs[ADF41513_REG6] |=3D FIELD_PREP(ADF41513_REG6_POWER_DOWN_MSK, 1=
);
> +	st->regs[ADF41513_REG12] &=3D ~ADF41513_REG12_LE_SELECT_MSK;
>  	return adf41513_sync_config(st, ADF41513_SYNC_DIFF);

If adf41513_sync_config() fails, is it possible for st->regs[] to be left w=
ith
these updated values?

If the SPI transaction fails when writing ADF41513_REG12 (which happens bef=
ore
ADF41513_REG6), the state in st->regs is not reverted. A subsequent frequen=
cy
change might then inadvertently power down the device because the dirty
st->regs state is pushed to the hardware during adf41513_sync_config().

>  }
> =20
>  static int adf41513_resume(struct adf41513_state *st)
>  {
> +	int ret;
> +
>  	st->regs[ADF41513_REG6] &=3D ~ADF41513_REG6_POWER_DOWN_MSK;
> -	return adf41513_sync_config(st, ADF41513_SYNC_ALL);
> +	ret =3D adf41513_sync_config(st, ADF41513_SYNC_ALL);
> +	if (ret)
> +		return ret;
> +
> +	if (st->data.le_sync_en) {
> +		st->regs[ADF41513_REG12] |=3D ADF41513_REG12_LE_SELECT_MSK;
> +		ret =3D adf41513_sync_config(st, ADF41513_SYNC_DIFF);
> +		if (ret)
> +			return ret;

Could this cause a regression on a subsequent retry of adf41513_resume() if
the SPI write fails here?

If adf41513_sync_config(st, ADF41513_SYNC_DIFF) fails, the function returns
an error, but st->regs[ADF41513_REG12] retains the
ADF41513_REG12_LE_SELECT_MSK bit.

On a subsequent retry of adf41513_resume(), the first call to
adf41513_sync_config(st, ADF41513_SYNC_ALL) writes all registers in reverse
order (ADF41513_REG13 down to ADF41513_REG0). Since st->regs[ADF41513_REG12]
already has the ADF41513_REG12_LE_SELECT_MSK bit set from the previous fail=
ed
attempt, it will write ADF41513_REG12 with this bit set before writing
ADF41513_REG6 to power up the device.

Does this violate the hardware constraint mentioned in the commit message t=
hat
LE sync must be set after powering up?

> +	}
> +
> +	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-adf41513-i=
io-driver-v12-0-34af2ed2779f@analog.com?part=3D8
