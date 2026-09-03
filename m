Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107BB4E8E03
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471682; cv=none; b=BCynWffd1CA+FXSmaoJnx6J9puVW1IMhkislozUFrOaLfv6C20crkpa8M1xGLQi7nfEIfdxEVWtsjnsCRCqeDNvWmCGm+T2bgwYctdGEpcng97rSdIvpFKR89mGJLk9j44YkXvbIHvG463MQlsfO8Sj1ahLzViOZZXQFTHEyTI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471682; c=relaxed/simple;
	bh=BEKAFybJjC0SBAHTm6ke1Ndo+MjJ1xio8aoTU5xo5IM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bc0hlBDte2KIPUdnmufqGBdu9B54y6KwdQfDWUHCpBJWwML20guqAkTG5q+znLcET72kF44197365xRDDO+KzyqxlsRAf8SXW5mTy5lN/Z0dytSlQ8CrAdobD2et8v0Ip63d+XZP8XCghoVqDMZPpPfXIRCjGr5dxVGJQ4uw/ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KglAPNr7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KglAPNr7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB05F1F00A3F;
	Thu,  3 Sep 2026 21:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788471681;
	bh=PrPUi1ymku4A+l+iGH3qMDJ5XEVnQQ1KyO2jpKyEg50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KglAPNr7y6xpjY9VoaGuv3G03FlX4/9JVlT1uVSu5n/DDk1OSHU2NFdz6t5k7ifuc
	 TrJPQ98N0uHgNbmPqNlah/5bxyqlNVyRsWwAhnPUcTt2mVehNfghwt9zkeulh5gSy2
	 uD2kn/0YUKkIKPuCvLT9krPrEr249XO2IDTqwOl077WgtQd/eRgzDOA1mmG9+ky4ee
	 45RUMCcQlxsMpsvkilMch3PUvhuM5BzNZDGtQ5WdUxz5wi9qWHatEufTBzUm3/Wdsj
	 TthVFIIMHxcDCiMrmXL1MLG+w/z/b0hUIdlgnMhQn9oJ0D3IaBO4JIFJJhlwZyIiz/
	 n714Wl2LirT3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 11/15] dpll: sit9531x: add support to get
 and set esync on pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902214030.20955-12-arouhi@sitime.com>
References: <20260902214030.20955-1-arouhi@sitime.com>
 <20260902214030.20955-12-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 21:41:20 +0000
Message-Id: <20260903214120.AB05F1F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The driver's esync and regular output frequency controls are not m=
utually exclusive or synchronized, allowing subsequent operations to silent=
ly break the esync state.
- [High] The driver misinterprets the DPLL embedded sync frequency paramete=
r, requiring a 10 MHz carrier instead of the 1 Hz sync frequency.
- [High] Disabling embedded sync mutes the output entirely and leaks the `p=
ulse_ctrl` state, corrupting the pin if re-enabled as a regular clock.
- [Medium] Missing rollback on error path leaves the hardware in a partiall=
y configured state.
--

commit 6a002e713c18df7ee3b9b8cd0d53f2b485acb5fc
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: add support to get and set esync on pins

This commit introduces support for embedded sync marks on pins for the
sit9531x DPLL driver. It adds esync get and set routines that control
the output frequency and pulse configurations.

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index c07fb22565107..76d7d7d21d3d6 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c
> @@ -25,6 +25,17 @@
>  #define SIT9531X_ESYNC_FREQ_10MHZ	10000000ULL
>  #define SIT9531X_ESYNC_PULSE_DEFAULT	50
> =20
> +static const struct dpll_pin_frequency sit9531x_esync_ranges[] =3D {
> +	DPLL_PIN_FREQUENCY(0),
> +	DPLL_PIN_FREQUENCY(SIT9531X_ESYNC_FREQ_10MHZ),
> +};

[Severity: High]
Does this range advertise the carrier frequency instead of the embedded
sync frequency?

The DPLL subsystem ABI expects the frequency parameter in esync_set to
represent the embedded sync pulse frequency itself, which would be 1 Hz
here (matching the commit message's description of a one-pulse-per-second
boundary). Advertising 10,000,000 might confuse userspace expecting a=20
sync rate.

[ ... ]
> +static int
> +sit9531x_dpll_output_pin_esync_set(const struct dpll_pin *pin,
> +				   void *pin_priv,
> +				   const struct dpll_device *dpll,
> +				   void *dpll_priv,
> +				   u64 freq,
> +				   struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll_pin *dpin =3D pin_priv;
> +	struct sit9531x_dpll *sitdpll =3D dpll_priv;
> +	struct sit9531x_dev *sitdev =3D sitdpll->dev;
> +	u8 actual_pll;
> +	int rc;
> +
> +	if (!sit9531x_dpll_esync_pin_supported(dpin)) {
> +		NL_SET_ERR_MSG(extack,
> +			       "Embedded sync not enabled for this pin");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	actual_pll =3D sitdev->out[dpin->id].pll_idx;
> +
> +	mutex_lock(&sitdev->multiop_lock);
> +
> +	/*
> +	 * This output is a dedicated embedded-sync pin.
> +	 * Treat freq=3D0 as a request to disable the entire output.
> +	 */
> +	if (!freq) {
> +		rc =3D sit9531x_output_disable(sitdev, dpin->id);
> +		if (!rc)
> +			dpin->esync_freq =3D 0;
> +		mutex_unlock(&sitdev->multiop_lock);
> +		return rc;
> +	}

[Severity: High]
Does disabling the embedded sync here inadvertently corrupt the pin's state
for future use?

The commit message states that "disabling it restores the requested rate".
However, calling sit9531x_output_disable() forces the pin into Hi-Z
instead of restoring the prior frequency.=20

Additionally, does this leak the pulse width configuration? Because
PROG0 PULSE_CTRL is not cleared, if the pin is later re-enabled as a
regular clock via state_on_dpll_set(), it looks like it will still run
with the stale embedded sync pulse control active.

> +
> +	if (freq !=3D SIT9531X_ESYNC_FREQ_10MHZ) {
> +		mutex_unlock(&sitdev->multiop_lock);
> +		NL_SET_ERR_MSG(extack,
> +			       "Only 10 MHz esync frequency is supported");
> +		return -EINVAL;
> +	}

[Severity: High]
Will this check incorrectly reject a valid 1 Hz embedded sync request
from userspace?

If userspace passes 1 Hz to configure the 1 PPS sync pulse, this check
returns -EINVAL. It seems to conflate the carrier frequency with the
sync pulse frequency.

> +
> +	rc =3D sit9531x_output_freq_set(sitdev, dpin->id, actual_pll,
> +				      SIT9531X_ESYNC_FREQ_10MHZ);
> +	/*
> +	 * Program the pulse generator (PROG0 PULSE_CTRL) so the embedded-sync
> +	 * pulse is actually emitted; without it the output carries the clock
> +	 * but no esync marker.  SIT9531X_ESYNC_PULSE_DEFAULT is the same duty
> +	 * the esync_get callback advertises.
> +	 */
> +	if (!rc)
> +		rc =3D sit9531x_output_pulse_ctrl_set(sitdev, dpin->id,
> +						    SIT9531X_ESYNC_PULSE_DEFAULT);
> +	if (!rc)
> +		rc =3D sit9531x_output_enable(sitdev, dpin->id);
> +
> +	mutex_unlock(&sitdev->multiop_lock);
> +
> +	if (!rc)
> +		dpin->esync_freq =3D SIT9531X_ESYNC_FREQ_10MHZ;
> +
> +	return rc;
> +}

[Severity: Medium]
If sit9531x_output_pulse_ctrl_set() fails, does this leave the hardware
in a partially configured state?

The hardware carrier frequency is changed to 10 MHz via
sit9531x_output_freq_set() first. If the subsequent pulse control set
fails, the function returns an error without reverting the frequency
change. This seems to irreversibly alter the hardware carrier frequency
to 10 MHz while leaving dpin->esync_freq as 0, desynchronizing the
software and hardware states.

[Severity: High]
Is the embedded sync state vulnerable to being silently broken by a
standard frequency change?

Because the esync logic and regular output frequency controls do not appear
to be mutually exclusive, a subsequent call to:

    sit9531x_dpll_output_pin_frequency_set()
        sit9531x_output_freq_set()

will unconditionally overwrite the hardware output divider without checking
if esync is active or clearing the dpin->esync_freq state. This could
silently corrupt the esync operation while software still reports it as
active.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902214030.2095=
5-1-arouhi@sitime.com?part=3D11
