Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E9030E0EE
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 06:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778824978; cv=none; b=rYTcusH4OBPIGlEzR7pn4PqvFKoYQkyxc4ZflkFPzvim1jB0BlgUdILpTQaCCYhffwrF6DS9o3bXPUL/T5w0QIw3Ha+g1ng/9d9AZbcr8Nw6X2OqJVqcSk3bDAXB0nM8+seN8ywPcozZHkwm/krBRbLWlGA7z2MOgw6OBJVpVaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778824978; c=relaxed/simple;
	bh=shc49GocOcCWl/9wt7f5lcsdWK1RnVzEDcwO8slFLfc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HDioJ2vFVcufdkbK86XBzIRTU2Yo51tlZRrWEfJFXBrNu3qeFZfVgYpzckZ4hi7RoHXCaYdmjk/pnsitCQ62HaE5ZtFZzgSzcC2/4dP+QHSzjl7Rh6fs73gDJh/jDFIVehzhXwzPZTHU8ETLn1Pgz+OVOUzeEFP7gmHVLmYkLIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VR0Nk7yU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VR0Nk7yU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA3DC2BCB0;
	Fri, 15 May 2026 06:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778824978;
	bh=shc49GocOcCWl/9wt7f5lcsdWK1RnVzEDcwO8slFLfc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=VR0Nk7yUBVenMOkPXdWAJphyFdvaFOmz37RvtCCr/0NCOGjXrpXxdV28oOe5lKUMl
	 CjHbnvqXRbUGREZ6UYe7zVqD5NGIhNUZWSWsmc1dm0zRc38TuOw5yxYjs3bLI6DADi
	 hFWfnKQ3F90eDp6O+J/I3GL6cH1WX1q2Ba8NmVGfHg28dHw8FBmSaySgLjhu5P5O7K
	 GvdiCxW6wbsaCNj+xiKDXW6Hp3qzmHgL/iBSssvxia9mFiPEva3gtQOVYrmCMuJrMH
	 u+kmRrVgPem5ET7itVoYeWzpZwcGA8CGaRxwesgx1AlrM3m1/5CQbaMSjE2vDPzu0/
	 Ad5HVLBWJJs9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 1/3] dt-bindings: pwm: opencores: Drop starfive
 compatibles and update maintainers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hal Feng" <hal.feng@starfivetech.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515054723.25024-2-hal.feng@starfivetech.com>
References: <20260515054723.25024-2-hal.feng@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 06:02:57 +0000
Message-Id: <20260515060258.0CA3DC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Removing existing StarFive compatible strings breaks DT schema val=
idation for existing device trees.
- [Medium] The commit silently modifies the `reg` space size in the schema =
example.
- [Low] The `compatible` schema contains an awkward single-item list struct=
ure after modification.
--

commit c3152a2a38b5f4d3a25df0696646b840e0d04b60
Author: Hal Feng <hal.feng@starfivetech.com>

dt-bindings: pwm: opencores: Drop starfive compatibles and update maintaine=
rs

Each of the StarFive SoCs has 8 OpenCores PTC IP cores that only differ
by their register base address. There is no need for starfive compatibles to
distinguish them, so they are dropped.

> diff --git a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml b/D=
ocumentation/devicetree/bindings/pwm/opencores,pwm.yaml
> index 52a59d245cdb1..834fb17ec595e 100644
> --- a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml

[ ... ]

> @@ -20,10 +20,6 @@ allOf:
>  properties:
>    compatible:
>      items:
> -      - enum:
> -          - starfive,jh7100-pwm
> -          - starfive,jh7110-pwm
> -          - starfive,jh8100-pwm
>        - const: opencores,pwm-v1

Does removing the legacy compatible strings break dtbs_check for existing
device trees? Older device trees likely still use the two-string format.

Would it be better to use a oneOf construct to allow both the legacy
two-string format and the new single-string format to maintain backward
compatibility?

This isn't a bug, but leaving a single element under items is an anti-patte=
rn
in dt-schema. Since only one string is allowed now, could this be simplified
to just a direct const property instead of an items array?

[ ... ]

> @@ -48,8 +44,8 @@ additionalProperties: false
>  examples:
>    - |
>      pwm@12490000 {
> -        compatible =3D "starfive,jh7110-pwm", "opencores,pwm-v1";
> -        reg =3D <0x12490000 0x10000>;
> +        compatible =3D "opencores,pwm-v1";
> +        reg =3D <0x12490000 0x10>;

The commit message mentions dropping the starfive compatibles and updating
maintainers, but does not document changing the register space size from
0x10000 to 0x10.

Could the commit message be updated to explicitly explain and justify this
register size change?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515054723.2502=
4-1-hal.feng@starfivetech.com?part=3D1
