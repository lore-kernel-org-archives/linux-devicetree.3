Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738119;
	b=ZdzI6F/mmlcH0QDkVrwa1WDrPHAB+k+ApwSHoDs3OAI5Bm7zOzupXy6NDfaUJ0oTJlx+
	 YuHialoz+PzMP48Gcdj8GC6OhZDhilaCGJjkVkvN4eZVOMF9o3MhtlzLAPJDtcLrcSVfE
	 zxybU/A1qLkey8on0l8yHGVrUxzl7NQ/F/56Ls1lutypDiwuFNhbFGs5EbRdhRseexWA3
	 Paf2CeRTwWqrqdCWTgYd7FrndXdT0rxgLzBMj3muV0+il+O67cPqIc1B6P9cMhMmDG0Iq
	 bL879sp5vBGDYxPlplPebNLh6lt7bD3gv/Ma8bJKRAoPSA3ul45IK9qnQApfiJM58mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738119;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GpLptWW92IMOqnJfqsUQVTAGi7mCp/+VkMLIYZrEKkw=;
	b=ZwQtRJAA1Y4PG8QZg3zeHvOur4ossz08m/LaQqZiD17aARIcybCy6pnSOiRuq06gVd4G
	 LWNUzYJtIdnlu/EaRyaTtc81EE0HfmVarH6DS2C7CrIjHJntdViTzLBFBElQv8cmOKHXf
	 eMU+ph4dh9u4fzg7vt+/ek+wO/sBc6iJo8Fgka4ONu2UdvusaLUxcJlQvFGbjZYQrzlBY
	 ZMUAtGo/Nuu7OW1gwFWtTNb5QByboLpydsa9qZAJIQf79bDOdJSyEQy0N7a+2FiG9hU8c
	 L3NeGPsX3IQ3OYOQOUAoGTkJ7tM9Xe6+JVs0TgaofZgCu3Rk6bN03TXfxKhtf+Nu8cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhhcVGK6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D2E606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhhcVGK6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE771F01825;
	Fri, 23 Oct 2026 06:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792738119;
	bh=GpLptWW92IMOqnJfqsUQVTAGi7mCp/+VkMLIYZrEKkw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BhhcVGK62HR6OrFrm16NlRTWKLsRftudx9e3iW/afbX2RqEkyLbCQZoT9e+OvRIht
	 tRpNyk/80RmJJ3T7jdqA5m7snYSq1txxQOTgEuPh0NRZTuS4Z4pqf+mJwq9sg+Pow7
	 2vUhnSP72NZICBC/FCsZuhD87ephtEB5kYRoqOOICg5Z24eTWJgOynDD9G/hqL3dxL
	 /q+XYAYv/+9P4kklYfALh+sLCS2D0ISe31ouw/yyVfVqV34UmZ0zpcx4r+un5NdcvA
	 Fss40uX9nPfxd2OPzRN2G6qucWcOJYhQ4OEmi/LCdIEwLtj6RcGoHprwxSa3FKtP4q
	 5PA3MOyLjABGw==
Message-ID: <sashiko-outbox-182363@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/16] dt-bindings: remoteproc: k3-dsp: Allow
 referencing the timers' power domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomeu Vizoso" <tomeu.vizoso@gmail.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261023-thames-v3-3-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
 <20261023-thames-v3-3-3ab40aa17157@tomeuvizoso.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 06:48:38 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: remoteproc: k3-dsp: misuse of power-domains for ext=
ernal timers
--

commit aa9adcac4a1bc9840a117c81a03e4ac0dade71bd
Author: Tomeu Vizoso <tomeu.vizoso@gmail.com>

dt-bindings: remoteproc: k3-dsp: Allow referencing the timers' power domains

This commit adds optional power-domains and power-domain-names properties
to the TI K3 DSP remoteproc binding so a client driver can hold the power
domains of two SoC timers used by the running firmware.

> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc=
.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> index d6319c8e96f8c..80eaef0a19b8d 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> @@ -76,6 +76,23 @@ properties:
>  # Optional properties:
>  # --------------------
> =20
> +  power-domains:
> +    description: |
> +      Power domains of the SoC timers the running firmware ticks on and
> +      times its work out with. The firmware programs these timers itself
> +      and makes no power request for them, and the timers' own nodes are
> +      reserved for it, so nothing else requests their power; a client
> +      driver of the firmware holds them on while it drives the processor.
> +      The processor's own power is managed through ti,sci-dev-id, not he=
re.
> +    items:
> +      - description: power domain of the first timer
> +      - description: power domain of the second timer
> +
> +  power-domain-names:
> +    items:
> +      - const: timer1
> +      - const: timer2

[Severity: Medium]
Should the standard power-domains property on the DSP node be used to
describe the power domains of external SoC timer peripherals rather than
the DSP device's own power domain?

In device tree bindings, power-domains on a device node specifies the power
domain(s) to which that device itself belongs. On TI K3 SoCs, the timer
peripherals already have their own device tree nodes (such as main_timer1
and main_timer2 in arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi)
which declare their own power-domains, clocks, and assigned-clocks.
Duplicating the timers' power-domains phandles onto the DSP node prevents
the binding from using power-domains for the processor's own power domain
(as done in ti,k3-r5f-rproc.yaml) and encodes a firmware-specific
workaround instead of referencing the timer nodes via phandles (similar to
ti,timers in ti,omap-remoteproc.yaml).

Additionally, requiring two fixed entries (timer1 and timer2) per DSP node
even when a single core only drives one timer appears to be shaped around
Linux's genpd_dev_pm_attach() behavior: as noted in the device tree patch
(arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi), specifying two
entries keeps the platform bus from automatically attaching a single domain
to the K3 remoteproc device during platform_probe(), which would otherwise
set core->dev->pm_domain and cause dev_pm_domain_attach_list() in
thames_core_get_timers() (drivers/accel/thames/thames_core.c) to fail with
-EEXIST.

Could the binding reference the timer nodes via a phandle property instead
of repurposing power-domains on the DSP node around Linux genpd attachment
semantics?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-thames-v3-=
0-3ab40aa17157@tomeuvizoso.net?part=3D3
