Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9621B1BD9D0
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 01:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780969853; cv=none; b=G6wn0RQpko+n6eOurd/qt2lbBXVDJ3pE9s07TYvQIl6hM7H9kMJMQXmDaMO2r+KcpxctbfqAZ/Fd4nBts1EJ9GMfb4usC2X3bGycrLkbcdVk26X+uIFELd1K6EeJx4Myyb2OFPu4oTdielnvq5q2rS2fe0EuuzH+xqeWseo5HzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780969853; c=relaxed/simple;
	bh=iFpDxXJLm7U1CLx0KAJxfuEl4nQjZ5TkyMRCcy2LVvQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W6i5X+vFM9siVyitdrLE5oi47tX+zvhsd8XC4uwUp035y81hGL/81QODQElVMU0zvsM6JH3XDvtj2aFl2/waphWY3XyxWQZq/MNL6HQz2wW0r92e6gIk6eCH7yX/uRfP78da7/7XtLxZU+h6CqhG2seoPSg5F00HDBDFhbyO+Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1L+ZgZ/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1L+ZgZ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077751F00898;
	Tue,  9 Jun 2026 01:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780969852;
	bh=pfMdvACiI/vFvX1jx/tL/D1VPwThUC+/ZM+sCpNBtmk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l1L+ZgZ/+z3UKrpYjyU8VAz68l74NmxIj2CmV988ONd+7D6JY+qcDFurKHl+83hEp
	 A1gYIkS6sWjmoA+EvVReRes8w9gQwWp5r5rp7WPfZPVAZrp7Lt3/po13qg/kXZnU2C
	 uJ/4BnhtHdsRzVvLrbC3jexUWw4wTMWUlA3UvNPIZYYKWh6/gS9Y2KxSKEGoQ5emEY
	 H+LHklv9+j9JeIlSRhEjKsJtAQYG/NANpil4RJY3p3/6PNAUIBZtVH8YVFQXNWLQqt
	 3xpTuviEC1HqXBBGmowg2XXDC1CRpP6tQ1flVPYfR3qsV9uUgkJBLHAP+qEwi/PHvu
	 ywjVr1KSiXfBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/11] ASoC: renesas: fsi: Add SPU clock control in
 hw_startup/shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260609013107.5995-12-phucduc.bui@gmail.com>
References: <20260609013107.5995-12-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 01:50:51 +0000
Message-Id: <20260609015052.077751F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The `clk_spu` clock reference is permanently leaked due to an earl=
y return in the shutdown path and a missing error cleanup in the startup pa=
th.

Pre-existing issues:
- [High] Data race on the shared clock reference counter `clock->count` bet=
ween concurrent playback and capture triggers.
- [High] Sleeping in atomic context caused by calling `clk_set_rate()` with=
in the ALSA DAI trigger callback.
--

commit 0619c0d2b5fae18d99bc804f41b27cefd1176f67
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown

This patch enables and disables the SPU clock in fsi_hw_startup() and
fsi_hw_shutdown() to ensure the clock is active while the driver accesses
hardware registers.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -1560,6 +1560,11 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
>  			  struct device *dev)
>  {
>  	u32 data =3D 0;
> +	int ret;
> +	/* enable spu bus bridge clock */
> +	ret =3D clk_enable(fsi->master->clk_spu);
> +	if (ret < 0)
> +		return ret;
> =20
>  	/* clock setting */

[Severity: High]
This is a pre-existing issue, but calling clk_enable() and interacting with
the clock API from the startup path seems to lead to sleeping in an atomic
context.

The ALSA core invokes the fsi_dai_trigger() callback with the substream
stream_lock spinlock held and hardware interrupts disabled. Inside this
atomic context, the call chain leads to sleepable clock setup functions:

fsi_dai_trigger()
   fsi_hw_startup()
      fsi_clk_enable()
         ret =3D clock->set_rate(dev, fsi);

For example, fsi_clk_set_rate_cpg() executes clk_set_rate(), which
acquires a mutex. Will taking a mutex while holding a spinlock with
interrupts disabled trigger a sleeping in atomic context warning or a
potential deadlock?

Furthermore, later in fsi_hw_startup(), the function ends with:

    if (fsi_is_clk_master(fsi))
        return fsi_clk_enable(dev, fsi);

If fsi_clk_enable() returns an error, the function exits without disabling
the successfully enabled clk_spu. Does this need an error handling path to
avoid leaking the clock reference?

[ ... ]

> @@ -1617,6 +1622,8 @@ static int fsi_hw_shutdown(struct fsi_priv *fsi,
>  	/* stop master clock */
>  	if (fsi_is_clk_master(fsi))
>  		return fsi_clk_disable(dev, fsi);
> +	/* stop spu bus bridge clock */
> +	clk_disable(fsi->master->clk_spu);
> =20
>  	return 0;
>  }

[Severity: High]
If fsi_is_clk_master(fsi) is true, the function returns early and completely
bypasses the newly added clk_disable(fsi->master->clk_spu) call. Will this
cause the SPU clock reference to leak when stopping the audio stream?

[Severity: High]
This is a pre-existing issue, but I noticed a potential data race on the
shared clock reference counter clock->count when starting and stopping
the streams.

Because the ALSA core allows independent and concurrent triggering of
playback and capture substreams on the same DAI, fsi_hw_startup() and
fsi_hw_shutdown() can be executed in parallel by different CPUs.

In fsi_clk_enable(), clock->count is read and incremented locklessly:

    if (0 =3D=3D clock->count) {
        ret =3D clock->set_rate(dev, fsi);
        ...
        clock->count++;
    }

Similarly, fsi_clk_disable() decrements it without synchronization:

    if (1 =3D=3D clock->count--) {
        clk_disable(clock->xck);
        ...
    }

Could this race condition lead to unbalanced clock reference counts and fail
to properly enable or disable the hardware clocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609013107.5995=
-1-phucduc.bui@gmail.com?part=3D11
