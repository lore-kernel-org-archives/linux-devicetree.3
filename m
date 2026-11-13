Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547264;
	b=F/f6KFF8AX8r26tgsJ6M6XPgAWagws1RbN4HrFmk3soEvuvldWtDc3RPJq5aer4DLpv9
	 zRfLZfLbhUsu5xupPv08rkpy8AoRnudKto1EFM6n2pYNUCn7c6My8Km8mYx6kt/Rhyon4
	 iEy91oUpkRVq7KXSsOblShC6itiupzdRaav68mAzZcZRZL59IIGv6UJ/aYJHcfKLXQrtm
	 Yi0+OBeSMdkzzF85sw3Inx9iJObNX47Dp8d5KL7h9anpQrBsjURn15HXS5UHPlZEnatZi
	 yQtPrRqoy/dNO/Gh3+eV2yeXNPZG8NDpZP7xSH7JdUsAlehq4sYoOyrhtNejCdfYgIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547264;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=V+yvbruD1Wv2R6jQ0pj9riQX904mQFvnzyt1HCB43RU=;
	b=OmslkPH3oq1ho3RmNreoxl/9UaOX7lIF5dhkw+igV4QyE2wLu8O5gLtD8ah/hJiJ0XEa
	 jWSgE0qaNFBQUPJQbH8/qAcThhIXGJmixZMWBbO9ZCIVEnyCcYN0Mu4JWcfFQRBfQmXCw
	 +ULcF7jUlv+uZTzjaFJB7uAf+Qk1YX8QdfHPUFiRB0l2q8W6H2n6AehPnNViZ7c/XfmiM
	 2ippn83NhorYCqZWk9naqin2/kLgSuGvqPvZUhKSOaRPb13Cuh4lfhQD89XluD+txii/1
	 QfUvD3jD9rlDH6JeoODse0icSDUxhqc4WEiGarigVxKNwxotHuw/XnFxCnRScT15PAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fWve0LMG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53099606A323
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fWve0LMG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21841F000C4;
	Fri, 13 Nov 2026 05:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794547264;
	bh=V+yvbruD1Wv2R6jQ0pj9riQX904mQFvnzyt1HCB43RU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fWve0LMGlhfc3hX4Jw8W6lvJNVxR7NlxM7dJYQ55kueZkEHxK2G9OAtZadY8MMYM8
	 g1sXweYDFT98/uShhP5b/czMHqkaRCkzrLSmoCrZrWmNfq/hh+WRPAlXRZzPp5xpEX
	 mjPrNY3TJy7GZefJ6VF6dmOsO3x7vM6p4icJEYN5R4wcwhCkM+w9J5tgQs4rweMhaW
	 x2XGUsmHpIHLfC+8r9+18bsP2u2/taGsRfVG/l/czOr1B3S5uF0SOi05zvksSWpJ3A
	 6z8Or2i58s88TEabH20qOos6EuW7ATzFy3CGJ2Rz/a4g6kWRqNKDLvaRA4S06Z8tSk
	 CnDJVNEsiVzbQ==
Message-ID: <sashiko-outbox-212222@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] pmdomain: Add support for system-suspend-only
 states
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maulik Shah" <maulik.shah@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-s2idle_state-v2-2-ad604182e7e7@oss.qualcomm.com>
References: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
 <20261113-s2idle_state-v2-2-ad604182e7e7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 05:21:03 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] pmdomain: unfiltered system_state in
  genpd_reflect_residency()
--

commit 1997c1201917b38c7d4bd3614225f7a62b53a68b
Author: Maulik Shah <maulik.shah@oss.qualcomm.com>

pmdomain: Add support for system-suspend-only states

This commit adds a system_state boolean to struct genpd_power_state,
populated from the "system-state" DT property, so the genpd governor skips
system-suspend-only states during regular CPU and runtime idle while
keeping them selectable during system-wide suspend.

> diff --git a/drivers/pmdomain/governor.c b/drivers/pmdomain/governor.c
> index 38bba24ec26e3..7684f9eecf853 100644
> --- a/drivers/pmdomain/governor.c
> +++ b/drivers/pmdomain/governor.c

[ ... ]

> @@ -407,6 +410,9 @@ static bool cpu_power_down_ok(struct dev_pm_domain *p=
d)
>  	 */
>  	i =3D genpd->state_idx;
>  	do {
> +		if (genpd->states[i].system_state)
> +			continue;
> +
>  		if ((idle_duration_ns >=3D (genpd->states[i].residency_ns +
>  		    genpd->states[i].power_off_latency_ns)) &&
>  		    (global_constraint >=3D (genpd->states[i].power_on_latency_ns +

[Severity: Medium]
Should genpd_reflect_residency() also skip next_state when
next_state->system_state is set?

When cpu_power_down_ok() skips a system_state idle state and selects a
shallower state, it sets genpd->gd->reflect_residency =3D true.  On wakeup,
genpd_power_on() calls genpd_reflect_residency(), which checks the next
deeper state unconditionally:

drivers/pmdomain/core.c:genpd_reflect_residency() {
    ...
	} else if (state_idx < (genpd->state_count -1)) {
		next_state =3D &genpd->states[state_idx + 1];
		target_ns =3D next_state->power_off_latency_ns +
			next_state->residency_ns;

		if (sleep_ns >=3D target_ns)
			state->below++;
	}
    ...
}

If genpd->states[state_idx + 1] has system_state set, it is not eligible
for regular CPU idle, yet any CPU idle sleep reaching its target_ns will
falsely increment state->below in the debugfs idle_states statistics.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-s2idle_sta=
te-v2-0-ad604182e7e7@oss.qualcomm.com?part=3D2
