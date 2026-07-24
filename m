Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271623B4432
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883355; cv=none; b=ji4SxrAJbrjuDpriFXBDvQosJLFTrRrw8NGKnMQBjqmAYSuE/3XAulcA1hn+qXuerYkUkWaGBnIVUGkPPx9gM4QUvK3an5SpeKBMl89aUJOuyT8E23Q+x/E6mhUfwMT6hLbW/32z+v4zOxxTGllmj9nYjW78BGmaX3f2fXFk0Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883355; c=relaxed/simple;
	bh=3gmh/lv5gWMaKxeZbtOzv9YxCEBDCKhIRsym5PQLjuQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M3tbeKBT4kUMxt4U0S7aUtCGI6AnhmIqy11TD/DGh0btNL5YKgoD/wL54UxR9oHYr7x6WxQUkEsj5qGvWvV5EGifcuB/rroG23M+iDfRgELVNSbEtZOpHWuSApuxZVaQLyYh3ytVPgex4K4Rb3ksQgfWmZrxFUHIMQ8SQTRE2o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UybYDqjQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UybYDqjQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3971F000E9;
	Fri, 24 Jul 2026 08:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784883354;
	bh=1LpoTnQZJw7UxVXoKEnNPcWWnYIU603Je2AyqquFcg4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UybYDqjQKTu4SB3kCxjre54cmwFnvPlhZ4GGLinoNDRMpl69A48/ARw4zNqPpRej0
	 zKmCXopHZqiTF6Vy1pafCt/c/BaxyV4/CLoQeitsmIKrW8QHPgifrOIaoi6UJh7+mb
	 +BpjceXfDFnNo6fR5bVd+mtnMUXWnIH9IncF0bvu81hccVzG1phxo1IW9txjzQgLqe
	 8PTADd91ls64SGU835hGr7UyMvHwCrW215r7XM3chA0+7Ss3iXSAqpPi7Xme1Cw7yT
	 cCkajhbDTFxcabFgE2hPxF00FnrFVJ8S6JiGMTf3hTQvvOQ9qI0SDqq7Q6qyQ4uyaY
	 bMUjTrd3/OIfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 4/5] dt-bindings: timer: dwc: Update resets property
 items
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724084419.1795-1-dongxuyang@eswincomputing.com>
References: <20260724084153.1473-1-dongxuyang@eswincomputing.com>
 <20260724084419.1795-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 08:55:53 +0000
Message-Id: <20260724085553.BD3971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The timer driver is not updated to deassert the newly allowed seco=
nd reset line, which can lead to system hangs.
- [Medium] Missing `reset-names` property prevents accurate hardware repres=
entation for partial reset implementations.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the driver asser=
ts and deasserts the hardware reset before the corresponding clocks are ena=
bled.
--

--- Patch [4]: [PATCH v13 4/5] dt-bindings: timer: dwc: Update resets prope=
rty items ---
commit 10dcd30e56947333e8bfdc5270bc95e60b327052
Author: Xuyang Dong <dongxuyang@eswincomputing.com>

dt-bindings: timer: dwc: Update resets property items

The DesignWare DW_apb_timers IP has two active-low reset inputs:
presetn resets the register interface logic in the pclk (bus) domain,
and timer_N_resetn resets the counter/timer logic in the timer_N_clk
domain. The existing snps,dw-apb-timer binding only describes one.

Update snps,dw-apb-timer binding to allow up to two reset lines,
matching the hardware capabilities of the DesignWare IP family.

> diff --git a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.ya=
ml b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> index d33c9205a9093..4d30cd01ac65f 100644
> --- a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> @@ -25,7 +25,10 @@ properties:
>      maxItems: 1
> =20
>    resets:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Timer ticks reference (timer_N_resetn) reset
> +      - description: APB interface (presetn) reset

[Severity: Medium]
Since the resets array was expanded to allow multiple items, should a
reset-names property be added to allow disambiguation?

Because the schema enforces additionalProperties: false, device trees cannot
currently add names. If a platform only has software control over the APB
reset (presetn) and not the timer reset, it cannot correctly represent the
hardware because array bindings without names require index 0 to be populat=
ed
first.

[Severity: High]
Does the driver need to be updated to handle this new reset line?

If a device tree is updated to specify both resets, the timer driver only
fetches and deasserts the first one (index 0):

drivers/clocksource/dw_apb_timer_of.c:timer_get_base_and_rate() {
        ...
        rstc =3D of_reset_control_get(np, NULL);
        if (!IS_ERR(rstc)) {
                reset_control_assert(rstc);
                reset_control_deassert(rstc);
        }
        ...
}

If a platform requires the second reset (presetn) to be deasserted by the
kernel to access the APB interface, the timer registers will remain
inaccessible. Can this lead to a bus hang or external abort?

[Severity: High]
This is a pre-existing issue, but the driver asserts and deasserts the
hardware reset before the corresponding clocks are enabled:

drivers/clocksource/dw_apb_timer_of.c:timer_get_base_and_rate() {
        ...
        rstc =3D of_reset_control_get(np, NULL);
        if (!IS_ERR(rstc)) {
                reset_control_assert(rstc);
                reset_control_deassert(rstc);
        }

        /* ... */
        pclk =3D of_clk_get_by_name(np, "pclk");
        ...
}

The DW APB timer reset signals operate in their respective clock domains.
Toggling a synchronous reset while the associated clock is disabled means
the target flip-flops never receive the clock edges necessary to process
the reset.

Could this leave the timer in an undefined state if the bootloader left
it corrupted with clocks disabled?

> =20
>    clocks:
>      minItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724084153.1473=
-1-dongxuyang@eswincomputing.com?part=3D4
