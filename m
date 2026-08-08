Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6FB33D4E4
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 10:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786186017; cv=none; b=S4aOsRVdbmWPdHyJiuXh14xTztqwjcnZoryb3frV+HYC0hlVe2PV3l5eMqGiIGoDctnz+CN6w9LW7D9X5gHlFx88vWv/4xGLo5N/C/CemrAdVkpdsijeDdKt3I+Itsg1GNFWmPjWZAf317Rvas3LHFnvwgtXVF0cP1hKUdc/g/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786186017; c=relaxed/simple;
	bh=EpOTbpO1IkEhnlzXxo5uJL5WXP3Om87IanFGAqUZtQg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XB53eUToIU8j+V/4adVmm72kVIE4653J2sXtC8LiqUCcIdUMKckVbA88hpQ1SoZ5AGkyFX9wBCmA5poZEp9d/aRNybWV9jk5j7+tjaIkbiEMizzQP5m6D9ZZxFoX/RSYeGhR1v6r+M23/nqzIb1d+WXMvcqxCyHwCnWbJTn22cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eeCnBmqI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eeCnBmqI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6F71F00A3A;
	Sat,  8 Aug 2026 10:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786186016;
	bh=j46Ukc7GnuAnEd+uxc9Vib8P4BUOQiemAN+Cn626udQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eeCnBmqIZWqkQnDKBiS3chEh6P1eKorKIkqGNgQwgUXc9g63+QbsPL9sltWJtA/1m
	 Uj4WkiBqYI9V5dJe7ti0OdHjnFsqMespFE1xKIYTWB3eBbMYctNT1G1CuBFNPTOXHT
	 vHOHCz4ENLzCewH5CBow+Fqa2Df9Ql2zzfVvbyTF4gf5SMeYoYyPD55z2RAGxMWbrS
	 5gVtFuDEnSMvY19EYPeUNTnENqPtMN5FIYa/ctqUQfco/xRikK/JDNcCdW2+AKVLF0
	 Gwqbbo8tCvYjSa96XUHVZ9VbKbQ/AGp8eJCN03mGnLbYb8kH9pmaMyXqkbHKj2QYvE
	 YCDFIbBtyEocg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/20] net: dsa: xilinx: register PHC backed by the RTC
 timer block
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nagadheeraj Rottela" <nagadheeraj.rottela@amd.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260807104431.157230-16-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
 <20260807104431.157230-16-nagadheeraj.rottela@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 10:46:55 +0000
Message-Id: <20260808104655.BF6F71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The generated PTP_CLOCK_PPS event is not phase-aligned to the inte=
ger second boundary of the PHC, violating the PPS requirement.
- [Medium] The PTP clock character device is exposed to userspace before it=
s software state and hardware time are initialized, leading to a race condi=
tion.
--

--- Patch [15]: [PATCH 15/20] net: dsa: xilinx: register PHC backed by the =
RTC timer block ---
commit ffe197a5a866d50ba55dd44d6f08fb6883f25a39
Author: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>

net: dsa: xilinx: register PHC backed by the RTC timer block

Bring the IP-wide RTC timer block up under the switch driver and
expose it as a PTP hardware clock. The timer block sits at a fixed
offset inside MAC1's per-MAC register window, which the switch driver
already owns via the "mac1" reg-name. Map it in probe() and register
the PHC in setup().

> diff --git a/drivers/net/dsa/xilinx/xilinx_tsn_ptp.c b/drivers/net/dsa/xi=
linx/xilinx_tsn_ptp.c
> new file mode 100644
> index 0000000000000..75c177f752f1b
> --- /dev/null
> +++ b/drivers/net/dsa/xilinx/xilinx_tsn_ptp.c

[ ... ]

> +static irqreturn_t xlnx_tsn_ptp_timer_isr(int irq, void *priv)
> +{
> +	struct ptp_clock_event event =3D { .type =3D PTP_CLOCK_PPS };
> +	struct xlnx_tsn *sw =3D priv;
> +
> +	sw->countpulse++;
> +	if (sw->countpulse >=3D TSN_TIMER_PULSES_PER_PPS) {
> +		sw->countpulse =3D 0;
> +		if (sw->ptp_clock && READ_ONCE(sw->pps_enable))
> +			ptp_clock_event(sw->ptp_clock, &event);
> +	}

[Severity: High]
Is the generated PTP_CLOCK_PPS event in xlnx_tsn_ptp_timer_isr() phase-alig=
ned
to the integer second boundary of the PHC?

The hardware timer block fires 128 ticks per second. The ISR increments
a free-running counter (countpulse) and emits a PTP_CLOCK_PPS event every
128th tick. Because countpulse starts at 0 during driver load and has no
correlation with the PHC's time-of-day (when tv_nsec =3D=3D 0), the PPS eve=
nt
does not appear to indicate a new second boundary.

Furthermore, if the PHC time is changed via settime or adjtime, the
countpulse phase doesn't appear to be adjusted, leaving the PPS signal
decoupled from the PHC time.

[ ... ]

> +	sw->ptp_clock =3D ptp_clock_register(&sw->ptp_clock_info, sw->dev);
> +	if (IS_ERR_OR_NULL(sw->ptp_clock)) {
> +		ret =3D sw->ptp_clock ? PTR_ERR(sw->ptp_clock) : -ENODEV;
> +		sw->ptp_clock =3D NULL;
> +		return dev_err_probe(sw->dev, ret,
> +				     "failed to register PTP clock\n");
> +	}
> +
> +	sw->rtc_value =3D div_u64(NSEC_PER_SEC, TSN_TIMER_GTX_CLK_FREQ) <<
> +			TSN_TIMER_RTC_NS_SHIFT;
> +	mac_iow(&sw->mac[XLNX_TSN_PORT_MAC1], TSN_TIMER_RTC_INCREMENT,
> +		(u32)sw->rtc_value);
> +
> +	ts =3D ktime_to_timespec64(ktime_get_real());
> +	xlnx_tsn_ptp_settime(&sw->ptp_clock_info, &ts);

[Severity: Medium]
Could the PTP clock character device be accessed before its software state
and hardware time are initialized in xlnx_tsn_ptp_init()?

ptp_clock_register() creates the /dev/ptpX character device and exposes it =
to
userspace. Since this happens before sw->rtc_value and the hardware time are
initialized, a userspace process could theoretically open the device and re=
ad
uninitialized hardware time.

Additionally, adjustments (e.g., via adjfine or settime) could be calculated
incorrectly since sw->rtc_value is still 0, and then immediately overwritten
by the remaining initialization sequence.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807104431.1572=
30-1-nagadheeraj.rottela@amd.com?part=3D15
