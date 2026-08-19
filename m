Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EE03C09EB
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787116110; cv=none; b=AeMmky2fmFMe/GSU5D2wYWY6GS2S4GOjl9hh4l6PsmATLIXKf2E2Ujc7uMge8O33AouRtgnOzjZYOr+rqHRnuJn+3FHJNbgbUgg4AUalwf6Fg6AlSSbfR9zztTGeq51Fc3l5Oi0PWvMHFYfv6vEYsZ6Al9rBZt2RUcIZ+m/Vqzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787116110; c=relaxed/simple;
	bh=bH3ZSdUP7mqT5XyAV1Qn2GEl6+qfLW3HS8spI5UokEA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ruLCQ0rIk6g1vsjE32Vy1BHpwEinWC2KmHeFPuXZhrLgkvh3MV/KhY/CXpdmExUeFrdxAUXnueqoOFOTuW8UgERvor5MqOivuFwAwNcHGNjUNSodwL60xrO1vKEbd1GBMbe4S5hJSTP4anX9xkAqQT29RPmlo83bWFIA0YujIgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bf0oa0sD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bf0oa0sD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8605C1F000E9;
	Wed, 19 Aug 2026 05:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787116108;
	bh=bneaSbYpPc6NUqdpZ10cFq+Q7CSAlVIFoFR07IC6ObA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bf0oa0sDZGvQrrWt0vlvNLX8NcgdhbiLKORy3AjNgak6Iot7fVgP5nB3mMYH6w+8T
	 /TW7uWV1gOOgmg7Bcyudgj6qwSvLbOKUlsIjGX+71Zl6n8SZLUmfrOvgDWFW724SJi
	 eLXj8j25ttK6Qap5pODY2me8flo4REOvmLI+QGuBHV5kFFxC8QqRsyYKMzoahk020m
	 FxcbZNKttO76ZmtfR5XQfU9sFgoUT+Ghmay9bc6LvzPFl4b4+k6LkvUmmsKSs7RtSY
	 2fCpW6S6u/RK5FuZdhUf4bIv+gqPFHoOsFGACCovNdaIvfqZfjtizPjiZZHBhpGIGL
	 5n5/jI/4urKZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260819050109.681890-2-marek.vasut+renesas@mailbox.org>
References: <20260819050109.681890-1-marek.vasut+renesas@mailbox.org>
 <20260819050109.681890-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 05:08:28 +0000
Message-Id: <20260819050828.8605C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The R-Car Gen5 DWC3 glue registers are configured during `probe` b=
ut are not restored during system or runtime resume.
--

--- Patch [2]: [PATCH v4 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-C=
ar Gen5 DWC3 xHCI USB controller glue ---
commit e26d897ddeb77c9fa5aded8c04ec1d73b9445010
Author: Thanh Quan <thanh.quan.xn@renesas.com>

usb: dwc3: dwc3-generic-plat: Add Renesas R-Car Gen5 DWC3 xHCI USB controll=
er glue

This commit adds glue logic support for the Renesas R-Car Gen5 DWC3 USB
controller to the generic DWC3 platform driver.

> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3=
-generic-plat.c
> index ca69ac0eb07ce..dec89b068291a 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c

[ ... ]

> +static int dwc3_renesas_rcar_gen5_init(struct dwc3_generic *dwc3g)
> +{

[ ... ]

> +	/*
> +	 * The datasheet describes initialization procedure without full
> +	 * information about the registers. Therefore, the source code is
> +	 * based on the bare metal code shared by the board team.
> +	 */
> +	writew(0x211, glue + 0x26);
> +
> +	/* USB2 does need additional register programming. */
> +	if (!usb2only)
> +		return 0;
> +
> +	writew(0x11, glue + 0x81c);
> +	writew(0x0, glue + 0x81a);
> +	writew(0x1, glue + 0x802);
> +
> +	usleep_range(10000, 20000);
> +
> +	writew(0x0, glue + 0x802);
> +	writew(0x1, glue + 0x2a);
> +	writew(0x1, glue + 0x81a);
> +
> +	usleep_range(10000, 20000);
> +
> +	return 0;
> +}

[Severity: High]
Will this glue register configuration be lost during system suspend or runt=
ime
autosuspend?

If the device is powered down during system suspend or runtime suspend (whi=
ch
triggers naturally after 5 seconds of inactivity), these custom registers w=
ill
lose their state.

When waking up, dwc3_generic_resume() or dwc3_generic_runtime_resume() is
executed, but neither invokes a platform-specific hook to reapply the glue
configuration. Will the controller malfunction upon resume without restoring
this configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819050109.6818=
90-1-marek.vasut+renesas@mailbox.org?part=3D2
