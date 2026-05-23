Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6703A6400
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779546270; cv=none; b=SYzEDLz8ZjCrIsMuq6THuiJqngELBGKukK30O25UCy/7NBcAyTulckkrKyNlYOkqXeNHZItZse59A2SyeyvZePjPfMj5cdwg3/dJFPXyXRmikT/H4KPtRkkPPNDzXOSJnBUEXSyKiSetq+jde91zMzXvDdSB7aQUznHkTJJzznQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779546270; c=relaxed/simple;
	bh=J36zYJBJbxJWrYBgJ0LApe1IWgWajBWhQuvtWaNmS1s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sGymDBZGO8ptVcqOuf+yzOBm9FMw2om3PbKq5bbBTk5xQJ1QI1o3apnhvq08iZ1SETZQOUuNStwRukxqe1xznKI9GMRw6hcNqCb62YXgyseq69pbDHjFeU8/bXyivSewbGxjUBoMM7pJ8+pW+F7+iikg/za13bHQ33vpMtEwSRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kw1R9xAU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kw1R9xAU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332141F00A3A;
	Sat, 23 May 2026 14:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779546269;
	bh=kHVyM5Qij8GHDd55JQFvPi8rNp9XQo1Ku6zlr3XnSg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kw1R9xAUbqELyBBAs4m69Bqoe1BzjsE35pReQTi+XC15OFHHBVi+1gvgpsoB+bGiB
	 Dfqy1K8SNlmkQZPqT31BzKqN8GnGsXLxjItmzSZT6rzW9PlWNE67T5vSumSCIBShqr
	 LKFGTTCRNx7D1CkzpnABGOmwEmb5kOzs31tK6D8UYJKiBgFotvncmu+GZysFPVcErl
	 FYEaUNbl/+uOsok8l3cwZvO5BIvZwwzwP7DyACGs+gk6jtJ2Dw3ndzQzTYAX8tPgjQ
	 pYYmVQtSHvIq2K2VBhJaAs7Scw30yhp9ONdCM07/zftHzjyToxe7t6Ju3Io7TfV8fF
	 gt6ZijvCYnCVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/17] dt-bindings: timer: arm,arch_timer: Fix
 requirements for interrupt description
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marc Zyngier" <maz@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260523140242.586031-5-maz@kernel.org>
References: <20260523140242.586031-5-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 14:24:28 +0000
Message-Id: <20260523142429.332141F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new `minItems: 2` constraint in the `interrupts` array maps =
to the wrong interrupts due to the static `items` list, contradicting the c=
ommit message's stated requirements.
--

commit 5eb08d516ae8d3fb049e6d6f31c8f0dd7d3f7165
Author: Marc Zyngier <maz@kernel.org>

dt-bindings: timer: arm,arch_timer: Fix requirements for interrupt descript=
ion

This commit updates the arm,arch_timer binding to explicitly define the
requirements for interrupts based on the architecture. It increases the
minimum number of interrupts from 1 to 2, clarifies architectural
terminology for the interrupts, and removes outdated descriptions.

> diff --git a/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml =
b/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> index c5fc3b6c8bd0b..c65e48a155ab6 100644
> --- a/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml

[ ... ]

> @@ -33,13 +28,13 @@ properties:
>            - const: arm,armv7-timer
> =20
>    interrupts:
> -    minItems: 1
> +    minItems: 2
>      items:
> -      - description: secure timer irq
> -      - description: non-secure timer irq
> -      - description: virtual timer irq
> -      - description: hypervisor timer irq
> -      - description: hypervisor virtual timer irq
> +      - description: EL1 secure physical timer irq, if EL3 is implemented
> +      - description: EL1 non-secure physical timer irq
> +      - description: EL1 virtual timer irq
> +      - description: EL2 physical timer irq, if EL2 is implemented
> +      - description: EL2 virtual timer irq, if FEAT_VHE is implemented

[Severity: Medium]
Does changing this to minItems: 2 while keeping a static items list cause
the first two provided interrupts to always be validated against the
"EL1 secure physical" and "EL1 non-secure physical" descriptions?

JSON schema array validation maps elements sequentially by index. If a
device tree node only provides 2 interrupts (the always-required EL1
non-secure physical and EL1 virtual timers), they will be mapped to the
first two indices.

Since the EL1 secure physical timer is optional (only if EL3 is
implemented), should interrupts use a oneOf block with separate lists,
mirroring the existing structure of interrupt-names, to correctly model
when the first element is omitted?

> =20
>    interrupt-names:
>      oneOf:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523140242.5860=
31-1-maz@kernel.org?part=3D4
