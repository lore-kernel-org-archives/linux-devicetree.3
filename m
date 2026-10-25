Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792957382;
	b=WzTjy2KRm02oUD0WeSiezfDxG+nKWzIFHRaOVGpJ3raEJBnprt6Rr909bg8LRlFrP165
	 98SaGVQh6FHLk1NsVPvLBsQ7+nX6gcwlro3OyAxQ6RNEK2WIlfL0IVbJx8ayKtSTSyJ0Q
	 65ebQBUkurFpgKMl9wMSbl3hh9PCQxocbNrXoxvyKt9gpvKTsfiZ/e2YHdG4zAmkqZPxf
	 aJZFv/4n0HPVhLSJc0KbE+wZG/QWeV0yhmPIavNoKsw1LnVmOMzsbkyo2jI4uAmq0flnz
	 6Um+XKx+GSIwYZV5VLJtJOzCOrpqZ2C4UIK378N0ymBJSn54BNCPi4vZof+j0CC4umg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792957382;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8h8F/ulXVgUyzmdy0weLIC0OOzaMsDaQfyRgn9jCG5g=;
	b=2zs3TmRlIoAjYFpGwoW5hxET8ElJB/+COEjJH0rSqdMlGKyVwqQxSNTwNRNX8+ahBFkb
	 gvwJkGVbEOyChkUMA+yVB4NCQkDPRWaOXlAE6usLPL5q+7W2Jb3M9picPbHkiIAIMrV7r
	 3vxfdCxbDcsBcD5xlPSRwheB4hHtqisZf6/uZ0xSG5r5WtPVNWQT2UPhgGzfaTZLJR26l
	 aETXQE2mD77YV5MRC4ekMrAWvNowRFudWxfbuhib82joiN0ACkb+1/h+vgLST/k7tKp3l
	 vn9U3WClbelnDOQJ3d/H7fzoE0FXBiocvBro1ZulTA6gPie8M2osgDjDGAol282LhBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bUmDhlcV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E387C606A31E
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 19:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bUmDhlcV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650341F01828;
	Sun, 25 Oct 2026 19:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792957381;
	bh=8h8F/ulXVgUyzmdy0weLIC0OOzaMsDaQfyRgn9jCG5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bUmDhlcVyXuNR9lm4fFX+bOcycqGAbhiP2qum3eh1llzGHrxWVPtvOgJ2/z0NduVw
	 qHobfekG3qtnbEcaCQULrwT1eYaoo8YjykcshjbBlElwRuYvnGSpAiVAhJFqI+ibgu
	 7zPvbB1DzxABrvTK15p4Vg9j8NrxaUAePZdvfeqsqWLUfvQ/eBUaeR3pjxFOHEHX69
	 PDLjYdnJ+x1rt8UOtNbzLDh6x/HB4yLclFwl8Xe2MRkQbyjwBjPLL2XjOpMueyz8Zp
	 o6wQst48fMJSKSXvJ4xYzQkds+35NvBLW3DucfC6NTvkVVs1Xbc6p/NnADfN6kmUkx
	 Y6gulkO9NtwxA==
Message-ID: <sashiko-outbox-184390@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: thermal: amlogic: add the S4 CPU
 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261025192244.209256-2-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192244.209256-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192244.209256-2-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 19:43:01 +0000
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
- [Medium] dt-bindings: thermal: amlogic: missing bus clock constraint for =
S4 sensor
--

commit b2d42a2f90c7882650efb090daff31a9ed1ad3e0
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

dt-bindings: thermal: amlogic: add the S4 CPU sensor

This commit adds the amlogic,s4-cpu-thermal compatible string to the Amlogic
thermal binding schema for the S4 CPU temperature sensor.

> diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.ya=
ml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> index e72cb39ac635d..5d966ab4d820e 100644
> --- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> @@ -23,6 +23,7 @@ properties:
>            - const: amlogic,g12a-thermal
>        - enum:
>            - amlogic,a1-cpu-thermal
> +          - amlogic,s4-cpu-thermal
>            - amlogic,t7-thermal
> =20
>    reg:

[Severity: Medium]
Should amlogic,s4-cpu-thermal also require two clocks (bus and core) in the
allOf conditional block, or use amlogic,t7-thermal as a fallback compatible?

In Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml, the seco=
nd
allOf conditional checks only for amlogic,t7-thermal:

  - if:
      properties:
        compatible:
          contains:
            const: amlogic,t7-thermal
    then:
      properties:
        clocks:
          minItems: 2
      required:
        - clock-names
    else:
      properties:
        clocks:
          maxItems: 1
        clock-names: false

Because amlogic,s4-cpu-thermal is omitted from that condition, it falls into
the else branch, which restricts clocks to a single entry and forbids
clock-names.

In commit 8195b945794c ("dt-bindings: thermal: amlogic: describe bus clock
for t7-thermal"), the single-clock else branch was retained only for older
bindings to avoid breaking existing device trees, whereas T7 requires both
the peripheral bus gate clock and the shared core clock.

Looking at drivers/clk/meson/s4-peripherals.c, S4 has the same clock topolo=
gy
as T7, with dedicated per-sensor bus gate clocks (s4_ts_ddr / CLKID_TS_DDR
and s4_ts_pll / CLKID_TS_PLL) in addition to the shared functional clock
(s4_ts_clk / CLKID_TS):

drivers/clk/meson/s4-peripherals.c:
static S4_PCLK(s4_ts_ddr,	CLKCTRL_SYS_CLK_EN0_REG1, 15, CLK_IGNORE_UNUSED);
static S4_PCLK(s4_ts_pll,	CLKCTRL_SYS_CLK_EN0_REG1, 16, CLK_IGNORE_UNUSED);

Without allowing both clocks in the binding, device tree nodes using
amlogic,s4-cpu-thermal cannot describe the sensor's peripheral bus gate clo=
ck
for amlogic_thermal_probe() to manage via devm_clk_bulk_get_all(), leaving
the sensor reliant on the temporary CLK_IGNORE_UNUSED flag on s4_ts_pll.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025192244.2092=
56-1-christian.koever-draxl@student.uibk.ac.at?part=3D1
