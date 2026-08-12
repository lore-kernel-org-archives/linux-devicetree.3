Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6388637E5DD
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 03:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505674; cv=none; b=bR6UeFgxEuItOOpY8X7c5hWtQ7qmsFb+5tZsALviPh8+S9ZawkTPjsBBwSw89vSORb/hbnv5N3kFDXr+h9t3xSTBfn8/X3qwk9UYOzNxsk80lWcqqyjZRruN7/aZcCZ73S+yPnWLfgFeGCWVtBsIMugRlH1dxHXYP0UqWjfOhqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505674; c=relaxed/simple;
	bh=MTKFVNNPcC7P8IPSOfN6oTwTNKRq/G32AOh11UFYRxI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WsbtxbzdACoIvICnl1icu0F40pcaLEVwyqCotQMfBSBTn97UTuEFYA6IRynf/cUvTPGmDavDkHSYQMJ59TUL/zyWCInw+Zwr8X7O/YbMJmMUQgR140OqXWkF1xhbns4qyBGnPzDrwEUi/R56AoQ6sLMIQMzTXbedK+Ek4I1zdjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHv3gE1F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHv3gE1F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6271F000E9;
	Wed, 12 Aug 2026 03:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786505668;
	bh=tCxR66lYyc3cKAjoPg9NR5+lbi6N8jhFPMKlHL/lxyI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RHv3gE1F8Ho12+682TJQgToW/pNd61uaMc+Ymjn/yZXal/R4S7fqr90zWzKG0OhQD
	 Cwx9XEC8e/MRdBNpKh+WDdoXWPemBzfaQUD1jqX5Te52npZmELbXp/fHdnOjiKeTEK
	 HGytG54eRtz68Qf2xbBZ52RNWPBigDIPUP/5pw8kkj10Z9/5RMtFaUWYP0jLBWh/I6
	 H5US1pviA5D97eZtPysTVPHmw4m8ZF0jN0DPi9KDweXHiTXpRi/ZDzmtihySbsV560
	 EdaToH0AtMnXvacTcUYBKXVk80oBF4/gGLcHQdK3DzFpr9uNY/x9LcVD0GQKWM8Mns
	 8ZdygHPcAt2dQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] pwm: add Andes PWM driver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Zong-You Xie" <ben717@andestech.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260812-andes-pwm-v7-2-a806da8185d1@andestech.com>
References: <20260812-andes-pwm-v7-0-a806da8185d1@andestech.com>
 <20260812-andes-pwm-v7-2-a806da8185d1@andestech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 03:34:27 +0000
Message-Id: <20260812033427.BA6271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The driver fails to update the inactive output state (PARK bit) wh=
en disabling the PWM channel, ignoring polarity changes and leaving the out=
put at the active level if previously at 100% duty cycle.
- [High] Emulating 0% or 100% duty cycles leaves RELOAD registers stale and=
 breaks `pwm_get_state` reporting by corrupting polarity, enabled status, a=
nd duty cycle calculations.
--

--- Patch [2]: [PATCH v7 2/3] pwm: add Andes PWM driver support ---
commit 76e1cbe61be3ddd82abebdaef695376f3fc6a571
Author: Ben Zong-You Xie <ben717@andestech.com>

pwm: add Andes PWM driver support

Add a driver for the PWM controller found in Andes AE350 platforms and
QiLai SoCs.

> diff --git a/drivers/pwm/pwm-andes.c b/drivers/pwm/pwm-andes.c
> new file mode 100644
> index 0000000000000..8dafce7c467c1
> --- /dev/null
> +++ b/drivers/pwm/pwm-andes.c
[ ... ]
> +static int andes_pwm_config(struct pwm_chip *chip, unsigned int channel,
> +			    const struct pwm_state *state)
> +{
[ ... ]
> +	/*
> +	 * A zero-length phase means a 0% or 100% relative duty cycle, which the
> +	 * hardware cannot run. Emit the matching constant level by parking the
> +	 * channel: high_cycles =3D=3D 0 stays low, low_cycles =3D=3D 0 stays h=
igh.
> +	 */
> +	if (!high_cycles)
> +		return andes_pwm_park(chip, channel, false);
> +	if (!low_cycles)
> +		return andes_pwm_park(chip, channel, true);

[Severity: High]
Does using the PARK bit to emulate 100% and 0% duty cycles cause incorrect
states to be reported by andes_pwm_get_state() later?

If a channel is emulating a 100% duty cycle, andes_pwm_park() modifies the
PARK bit and disables the channel without updating the RELOAD registers.=20

When andes_pwm_get_state() is later called, it uses the PARK bit to deduce
polarity, which incorrectly evaluates to PWM_POLARITY_INVERSED. Additionall=
y,
the enabled status will be evaluated as false since the channel was physica=
lly
disabled, and the unupdated RELOAD register will cause stale period and duty
cycle values to be returned.

[ ... ]
> +static int andes_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			   const struct pwm_state *state)
> +{
> +	unsigned int channel =3D pwm->hwpwm;
> +
> +	if (!state->enabled) {
> +		if (pwm->state.enabled)
> +			andes_pwm_enable(chip, channel, false);
> +
> +		return 0;
> +	}

[Severity: High]
When disabling the PWM channel, does the driver need to update the PARK bit
to ensure the output goes to the correct inactive state based on polarity?

If a channel is configured to a 100% duty cycle with NORMAL polarity,
andes_pwm_config() will have set the PARK bit to 1. If the PWM is
subsequently disabled, andes_pwm_apply() clears the PWM enable bit but does
not reset the PARK bit.=20

Since a disabled channel continues to drive the PARK level, might this leave
the disabled channel driving the active state (HIGH) instead of the expected
inactive state (LOW)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-andes-pwm-=
v7-0-a806da8185d1@andestech.com?part=3D2
