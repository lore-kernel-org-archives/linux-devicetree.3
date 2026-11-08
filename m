Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794141875;
	b=uYYbAYMgvb2jzBVnykywHS/5DW0R2IpzluCfBg9NI9wcfnQW7mHArHHcjazTa3kolmW2
	 jFOawLxiQPqnXhhufpr88mjk3Tgo+Q4bC6/yAKzK3PS+6G7egxgoA5iv+ogAYfRnXD/eS
	 qnK+No7RYXp1s/yVv96HJbexRGg+uGyRrXD+kbHEsyDu44UzouxEa+6Do9pwTBh3hQvZ/
	 ww3u93P06m2t8N5OHvS4c2qajufc6D+SVq0J9e/DbugVVKMJcs5DPPQsGP84Q6qIoOu9y
	 xDYvVij5U1DrsU/W1TgksdqMJZmGvQnmgaAU1f92DebR1/kmQtoiTEhg4hxrX/ScGCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794141875;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pCnS0pfhzpgsF5uPdMrWrRI7DodG5MhUD1yKl2G3kUg=;
	b=hxznoxPPAnrdeBHiF5v80rDsFHzMieVaU/qd2DYxnk+QpJFSCE4A3xNEfYRt0ewg7je7
	 lf+XyoKQXAqPDErJ5drjVZ9t/qvUQA1/m3CX/dcPQmQFOK+q11SXYnwnVoL2i2E8hpUmC
	 iNjXotzoI9aBKWJqpvTwrRbtnKVDRVFPj6Kohgg+gdCU+iXHrGTVvPuk5Yx3GclzvI8nT
	 j2r3OiRMGas0kglypUy3g3hbexNMuKidYZvBBXo4jE7s5GPrnZUlS7o5/nBqiPhpHHxy5
	 hCyb6sBiSxZ5DQMalppVYkgnaQL9q8G69Sb1T3DI3qf06G1WoKZ66pINqx3tnL0hGHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CYU6njK7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E41606A31C
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 12:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CYU6njK7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084381F0089F;
	Sun,  8 Nov 2026 12:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794141874;
	bh=pCnS0pfhzpgsF5uPdMrWrRI7DodG5MhUD1yKl2G3kUg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CYU6njK7qIrCP39fs2TO3W8Rzvpq0vwO/O6NkRs9jYmWHEpG/sBA2dKcvT0jZ3cur
	 +ZRB/YQVPGHqtVOrQaO6cQy6czlwWMHnfYJImxiC1hHFO2k4GkPWcJbEKY3ugVWttm
	 86joXPqyovoWoVymkE2kXKsO2E0Qrd63uBQvtJjojdqldfjvLXRgInLnUpvAD8UA4Y
	 9DJ7akjQpQAoOYV1hEYcQfYi+O966SBs2inUYW2MM7n8tpyIWyYPn9V3KwQwu8YQI+
	 4aBcOMj66LoeW3nHbnwdznvVLpwC0oyTpvZKxGQH1JSxbBNKypwmyuu+zT2gaRBq3k
	 xztZk2McslHbQ==
Message-ID: <sashiko-outbox-203744@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/10] dt-bindings: display: panel: samsung,s6e3ha8:
 Add AMB630QY01 panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261108-crosshatch-panel-v3-2-87dd4ec4f7cc@ixit.cz>
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
 <20261108-crosshatch-panel-v3-2-87dd4ec4f7cc@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 12:44:33 +0000
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
- [Low] dt-bindings: display: panel: samsung,s6e3ha8: unwieldy
  per-compatible conditionals
- [Low] dt-bindings: display: panel: samsung,s6e3ha8: required and allOf
  before properties
- [Low] dt-bindings: display: panel: samsung,s6e3ha8: changelog omits
  supply changes
--

commit 2e2113bfd1b86858603c7b29b0786ff6036afe10
Author: David Heidelberg <david@ixit.cz>

> dt-bindings: display: panel: samsung,s6e3ha8: Add AMB630QY01 panel
>
> The Google Pixel 3 XL (crosshatch) uses a Samsung AMB630QY01 6.3"
> 1440x2960 flexible AMOLED panel.
>
> Signed-off-by: David Heidelberg <david@ixit.cz>

[Severity: Low]
Could the commit message also describe the regulator supply changes?  Beyond
adding the samsung,s6e3ha8-amb630qy01 compatible string, the patch adds
vddpos-supply and vddneg-supply for the ELVDD and ELVSS boost regulators and
makes vddr-supply vs vddpos-supply/vddneg-supply conditionally required per
panel variant.

> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3=
ha8.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.=
yaml
> index ca250b1b91712..dcf347fe5ca83 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
> @@ -12,17 +12,45 @@ description: |
> =20
>    Known panels:
>      - AMB577PX01, 5.77", Samsung Galaxy S9 (samsung,s6e3ha8-amb577px01)
> +    - AMB630QY01, 6.3", Google Pixel 3 XL (samsung,s6e3ha8-amb630qy01)
> =20
>  maintainers:
>    - Dzmitry Sankouski <dsankouski@gmail.com>
> =20
> +required:
> +  - compatible
> +  - reset-gpios
> +  - vdd3-supply
> +  - vci-supply
> +
>  allOf:

[Severity: Low]
As reported by Krzysztof Kozlowski on v2 [1], should the properties block
come before required and allOf?  Standard DT schema ordering places
properties first, followed by required, allOf, and unevaluatedProperties:
false, rather than listing required properties and allOf before properties
are defined.

>    - $ref: panel-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,s6e3ha8
> +              - samsung,s6e3ha8-amb577px01
> +    then:
> +      required:
> +        - vddr-supply
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,s6e3ha8-amb630qy01
> +    then:
> +      required:
> +        - vddpos-supply
> +        - vddneg-supply

[Severity: Low]
Would it be cleaner to split samsung,s6e3ha8-amb630qy01 into a separate
binding schema document instead of adding per-compatible supply conditionals
here?

samsung,s6e3ha8-amb630qy01 and samsung,s6e3ha8-amb577px01 are standalone
compatibles with no shared fallback compatible and different power supply
topologies (vddpos-supply and vddneg-supply vs vddr-supply).  Keeping both =
in
one schema requires per-compatible if-then blocks, and still leaves
vddr-supply allowed on samsung,s6e3ha8-amb630qy01 and vddpos-supply and
vddneg-supply allowed on samsung,s6e3ha8-amb577px01 unless further
constraints are added.

[1] https://lore.kernel.org/r/20260929-automatic-humorous-muskox-45bdfd@quo=
ll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-crosshatch=
-panel-v3-0-87dd4ec4f7cc@ixit.cz?part=3D2
