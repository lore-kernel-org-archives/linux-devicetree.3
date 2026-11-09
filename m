Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230393;
	b=1DzYWGojaxAk6MCEJ3WPhKTCxeZFPFAepkXvpUSGvHzj4H8uiSSMj5evgJaruHbp3S2o
	 DudU0bFJXRw7x0lEADR+V4PvnbN8eJzz8b27xIHOV+drRc2ieTKa14zUdixotwwZG0ZPL
	 4UHg3lQZ4FsB6pzzscU/CFoMjEWScEGFSapkgFRA6Q37pS7IgEIcBEJEitgWwy1uIZ5cG
	 wJO0wI987etus5A60yUfXqxc6fofOwj1JtaMrgRpF9Tv4atgSJFE9c1p7ZaBhljNHrdrL
	 YoUSZhhDvG+xdewO6E6Cjh+So+Rdkga8hkyYaa0ixa6DMdNaD2d596f2ZPx0vYXG89g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230393;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6IwCzY+AySci8iPmyfKrIWX2MspNM/+0u6Ri1mKhH9M=;
	b=mzED5qtx27oQiJGbnLgQpIpnBzJ1Mr8npz9BCVS+w2H7vIkVFpsZj0WVdy1rPPGr7jsW
	 JSTGl6nn8ZopB7ColMqF8wqabFnhLO3y9aQEacb3+2ygcSvIOsjkja+W+Un2toTzi3RND
	 +++I1ZRRrRCre/4NrrfKmqbBfeRmjL2LJem3Hy3w61GdlcQpr4pbQYBNkzTUN9c7gNqZS
	 sGsFKkxVKJAMYNqF/h/R1xvvJ4MJ7cbqhsI4kXW6e64o6T1+3VtwHmF9BkVpOEdQSg/oz
	 QCArEswgrkcqpRHFQ3wRj0DsJxAWXrkusEn7eX7RtPHlmYYok5CPoLLPU8+0Jf7BBWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fC0Fy1hy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E61606A322
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fC0Fy1hy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA931F0089F;
	Mon,  9 Nov 2026 13:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794230393;
	bh=6IwCzY+AySci8iPmyfKrIWX2MspNM/+0u6Ri1mKhH9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fC0Fy1hyk2nVI15UTnBi+KuAEv071DLs7R4TZGCeXLMHfVISb5OAbFQL1ROz2kYY6
	 zsbEpvWFqv/m7dxHpVx+rZV0+rIvBD80OlqupSvJ7EojEkXGI6l+BHMHolt+hHq2be
	 gPJxatItlfSSn3sBsSeSgWXBzWyjvciK2bjBhyLjCewW7kvQ0zyU3s6H0VntUlxVih
	 WRvfSVH9cNk2GGAm4daRSLJ4zHJkgnyHOYDBnC09K4donZG16BEP+tbYkWHZg4OnVJ
	 KnWCPE89sC/ek9rBB5LelaEyl35nD1709IuAO9WM5JXy8FcGXBB1F7yUNX3Hgl4w53
	 +pE4VMdmG/Eyw==
Message-ID: <sashiko-outbox-204998@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/10] dt-bindings: ptp: Document the TSCSS on
 Qualcomm SA8775P and QCS8300 SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261108-tscss-v2-1-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-1-d5f575010427@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 13:19:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] dt-bindings: ptp: qcom,sa8775p-tscss: misuse of pinctrl
  states for ETU slices
- [Medium] dt-bindings: ptp: qcom,sa8775p-tscss: coupling SoC etu reg to
  board properties
- [Low] dt-bindings: ptp: qcom,sa8775p-tscss: missing bounds on slice
  and event arrays
--

commit b07780b80d655036ec2e7df24ec2f89f821cf257
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

dt-bindings: ptp: Document the TSCSS on Qualcomm SA8775P and QCS8300 SoCs

This commit adds the Devicetree binding schema for the Timestamp Counter
Subsystem (TSCSS) on Qualcomm SA8775P and QCS8300 SoCs.

> diff --git a/Documentation/devicetree/bindings/ptp/qcom,sa8775p-tscss.yam=
l b/Documentation/devicetree/bindings/ptp/qcom,sa8775p-tscss.yaml
> new file mode 100644
> index 0000000000000..b3e3a7cd71664
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ptp/qcom,sa8775p-tscss.yaml

[ ... ]

> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: tsc
> +      - const: etu
> +
> +  clocks:
> +    items:
> +      - description: TSC AHB configuration clock.
> +      - description: TSC global counter clock.
> +      - description: TSC ETU clock.
> +
> +  clock-names:
> +    items:
> +      - const: ahb
> +      - const: cntr
> +      - const: etu
> +
> +  interrupts:
> +    items:
> +      - description:
> +          Summary interrupt raised based on an external event for any
> +          of the ETU slices.
> +
> +  interrupt-names:
> +    items:
> +      - const: etu_summary
> +
> +  pinctrl-names:
> +    minItems: 1
> +    maxItems: 16
> +    items:
> +      pattern: "^slice[0-9]+$"

[Severity: Medium]
Does defining pinctrl-names as per-slice entries ("slice1", "slice2", ...)
and placing each slice's pin into a separate pinctrl-<n> property (as shown
in the second example with pinctrl-0 and pinctrl-1) misuse pinctrl states?

In the Devicetree pinctrl binding and drivers/pinctrl/core.c, pinctrl-0
through pinctrl-N represent mutually exclusive device-wide states such as
"default" and "sleep", not concurrent channels.  When pinctrl_commit_state()
switches to a new state on the device, it calls
pinctrl_cond_disable_mux_setting(old_state, NULL), which disables the pinmux
settings of the previously active slice state so multiple slices cannot be
active at the same time.  Restricting pinctrl-names to "^slice[0-9]+$" also
prevents standard "default" and "sleep" pin states from being used; all
concurrently active ETU slice pins belong in a single state such as
pinctrl-0 with pinctrl-names =3D "default".

> +  qcom,etu-slice:
> +    description:
> +      ETU slice number for each entry in pinctrl-<n>, pinctrl-names and
> +      qcom,etu-event-sel.
> +    minItems: 1
> +    maxItems: 16
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  qcom,etu-event-sel:
> +    description:
> +      External event selection value for each ETU slice listed in
> +      qcom,etu-slice.
> +    minItems: 1
> +    maxItems: 16
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

[Severity: Low]
Should qcom,etu-slice and qcom,etu-event-sel define per-item minimum/maximum
bounds (and uniqueItems: true on qcom,etu-slice)?

Without item bounds, out-of-range slice indices or event selector values and
duplicate slice entries will not be caught by dtbs_check.  Also, encoding t=
he
slice index in both pinctrl-names ("^slice[0-9]+$") and qcom,etu-slice
duplicates the slice number across two properties without ensuring they mat=
ch.

> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        reg-names:
> +          contains:
> +            const: etu
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +          maxItems: 2
> +      required:
> +        - interrupts
> +        - interrupt-names
> +        - pinctrl-names
> +        - qcom,etu-slice
> +        - qcom,etu-event-sel

[Severity: Medium]
Should the SoC-level etu register region and interrupt be decoupled from the
board-specific ETU slice properties?

The tsc and etu register blocks, clocks, and etu_summary interrupt are fixed
SoC resources, whereas pinctrl-names, qcom,etu-slice, and qcom,etu-event-sel
depend on board pin wiring.  Requiring the board slice properties whenever
reg-names contains "etu" prevents an SoC dtsi from describing the full TSCSS
register map and interrupt unless every board also configures ETU slices.

In addition, this if/then block has no else branch when "etu" is absent,
which allows reg to have 2 entries when reg-names only lists "tsc" and leav=
es
the ETU properties allowed without the etu register region.  Finally, the
description notes that the TSC block is functional with just the AHB and
counter clocks, yet clocks and clock-names unconditionally require all three
clocks including "etu".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-tscss-v2-0=
-d5f575010427@oss.qualcomm.com?part=3D1
