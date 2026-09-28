Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357374BD36E
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606910; cv=none; b=OKfJp2gxFJN5fX/tupp1m3+M0SBam3pJrqAjw7d4igYwWX+yrQgZZksHz3lAzOsVsGlf++TShgMRL+43KsxLJTlbO8GeKKM8yx1R5v5QKIgLOb8ks3HpGU27xflAKIYm1lMQ0mJICzNYLQOi0X/Fv2TnFrFhvqt46byJMVlb4OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606910; c=relaxed/simple;
	bh=m1lTArCS+Vax+bYYuUXjny6lheWQ+7I/sk21AEQXBRw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sCtegQ66WGsauBQ2VJ1/L6dyp/wQF2KASh2nkXNrxhh2SPtO8WG5DtfumlqUFlbuLcL6qh2/A/K6dhqzGcKvtq9NxUP1ACkUN0Crxdcw/rYKjoeH8vmED7e3pT+G5RpyhgGq3T73Schr2mL3Nj9Oj5Zwd0NfqfN6mjtrds+ZtSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+wxK0Qu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+wxK0Qu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913141F000FF;
	Mon, 28 Sep 2026 14:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790606908;
	bh=oX1nIPclCE2hcqdrBR2c/JEHrzsUR2TofDKF8jU0eYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S+wxK0Qu7/V9P+UCAVyUvaB1pQFHIVjCn7JeCQAKWwtuOhEAC4kKVUgh3IgfTgBLe
	 jUVOMlEHLt0JRLviNUkdKOvB8p/L8QNwrm74d0tw4WtdfGD+DO9Mogu+wVL0CeK8RR
	 ss3ccoIIrfhj5PCnDjTA93xspo2JNwvVs1App7HLWvRMu7pI7hhq/6NTS5cPa0QDNj
	 uUI0SgqHU6R7u4h+2nbXvZk90rroT7TlBZcnp4S/ZJ5WJL/jJcgR1YMXdR//QG8wzk
	 xquTbXUm+UP/sfDiq6zGaGNvkABI+xBiD/8uBP2X9p0F/RFqBtly/kD6+6JPGK+I9r
	 HSXhM0WFk/ORQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <ad9bc35d7c30f7925fed4c6621ed0f67c39c3f09.1790606188.git.andrea.porta@suse.com>
References: <cover.1790606188.git.andrea.porta@suse.com>
 <ad9bc35d7c30f7925fed4c6621ed0f67c39c3f09.1790606188.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 14:48:28 +0000
Message-Id: <20260928144828.913141F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pwm: rp1: missing spinlock for shared RP1_PWM_GLB_CTRL register
--

commit 0c157fdfbde9f74961d4b31ce35f1c71872efa00
Author: Stanimir Varbanov <svarbanov@suse.de>

arm64: dts: broadcom: rpi-5: Add RP1 PWM node

The RP1 chipset used on the Raspberry Pi 5 features an integrated
PWM controller to drive the cooling fan. Add the corresponding DT
node for this PWM controller.

> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm6=
4/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> index 0fc57e72632ed..748be8f1ee9e2 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
[ ... ]
> @@ -94,6 +100,12 @@ &rp1_i2c6 {
>  	pinctrl-names =3D "default";
>  };
> =20
> +&rp1_pwm1 {
> +	pinctrl-0 =3D <&fan_pwm_default_state>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};

[Severity: High]
Can concurrent PWM channel configuration cause lost updates when this node =
is
enabled?

Looking at drivers/pwm/pwm-rp1.c, there is a read-modify-write race on the
shared hardware register RP1_PWM_GLB_CTRL:

drivers/pwm/pwm-rp1.c:rp1_pwm_write_waveform() {
    ...
	/* enable the channel */
	ctrl |=3D RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
	writel(ctrl,  rp1->base + RP1_PWM_GLB_CTRL);
    ...
}

and also in:

drivers/pwm/pwm-rp1.c:rp1_pwm_apply_config() {
    ...
	value =3D readl(rp1->base + RP1_PWM_GLB_CTRL);
	value |=3D RP1_PWM_GLB_CTRL_SET_UPDATE;
	writel(value, rp1->base + RP1_PWM_GLB_CTRL);
    ...
}

If two threads call pwm_apply_state() on different PWM channels concurrentl=
y,
the PWM core locks at the channel level, not the chip level.

One thread's enable/disable action could overwrite the other's, leading to
channels unexpectedly disabling or failing to enable.

Since this PWM drives the cooling fan, could a lost update disabling the fan
lead to a thermal shutdown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/ee0aa89faa14e0073f1=
271693bae28678652998b.1790606188.git.andrea.porta@suse.com?part=3D3
