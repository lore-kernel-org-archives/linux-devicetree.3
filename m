Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027783B05AA
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 16:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343520; cv=none; b=RgeKZDZ0EGSGmrQbZljb5OUfFgNj81jK5aq2ILv9f2pq2bGwSwvTcQKJltWSVcLpQAJvNtm8lJbLYdpPq994DfBmlIpk26bBnfyZEFdDLU9SEiR2gZWIshSO2MiL8gBl5ONSXFPem4tIxoC/NWFCicw9UWWYKgim5cTz0NG5sV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343520; c=relaxed/simple;
	bh=H6jkwLv6/r6Kw1vlaeQ0XIyV+QcGICMq58aikRiYW/I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CDVYN/+mp1fY+Gzu3Y23DYheTZoM6lP7X5SZ8bvJ4unJia3CkqiUfylEe3bVB8kBndbnL3DY7p+ZQiQlpWpe/d9cuGD7rwc5MRcvVZ2FQpjx778Ml/f6AXHhk1HYN22InedWTnk/PPah9SE0ykwmA2rkgVYUiIZhxbTPVJlsUbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDbHkvdi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDbHkvdi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D940F1F000E9;
	Wed, 29 Jul 2026 16:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785343516;
	bh=XX1Zjwic4kFVPv9zlp0s0TkZJDbNDaMTqAYUixpNkDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CDbHkvdiypHRUDTDxG5FzcwrS+4XwW5OVsNb5b4yUBay89xftFZN2lE7hoQI7X3Lm
	 8d5yKHvTTmjduosQuZ6MpDqqRdLd8J52pU+IptiaZvBRkCvclyHYJ1mK+EOqlz7wcX
	 Ho2YwY7yhqbhCLU0H8IBYZLxa23p/kCNIvzOZXi1NASHrQ2xiwCgKMDVbvwKW8medx
	 eISqTiHCzXvSQUPrdKyhAAbAr8g/DP98ah1ZMlKbD6FYcwR0BkdIBc58ob9zFu+rlj
	 igGJoBLy1mFDbvObt9f6WPY58/661lS+J6tEoEHklGz50M4EV/g+9mhLgCisGwZJ8r
	 RmwxnUmoQzx9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: Add Worlds ISA extensions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chien Peter Lin" <peter.lin@sifive.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729163908.249838-2-peter.lin@sifive.com>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-2-peter.lin@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 16:45:15 +0000
Message-Id: <20260729164515.D940F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] S-mode extension 'sswid' imposes an invalid schema dependency on=
 M-mode extension 'smwiddeleg', breaking guest VM device trees.
- [Medium] The patch contains 'TBD' placeholders for the ratification commi=
t hashes of the newly added standard extensions.
- [Low] The newly added multi-letter extensions violate the strict alphanum=
eric sorting requirement.
--

--- Patch [1]: [PATCH v2 1/3] dt-bindings: riscv: Add Worlds ISA extensions=
 ---
commit f77a112e3cec85c24b75fb71cd433146ac340c50
Author: Yu-Chien Peter Lin <peter.lin@sifive.com>

dt-bindings: riscv: Add Worlds ISA extensions

This commit adds device tree bindings for five RISC-V Worlds ISA extensions
that implement World ID tagging for hardware-enforced context isolation. It
also adds checks for extension dependency requirements.

> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 5ffc40d599c02..3fb13b860e701 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -193,12 +193,35 @@ properties:
>              ratified at commit d70011dde6c2 ("Update to ratified state")
>              of riscv-j-extension.
> =20
> +        - const: smlwid
> +          description: |
> +            The standard Smlwid extension for M-mode control of lower
> +            privilege World ID via the mlwid CSR as ratified at commit
> +            TBD ("TBD") of riscv-worlds.

[Severity: Medium]
Is this extension fully ratified?=20

The description still contains TBD for the ratification commit hashes here =
and
in the other extensions added by this patch.

Could you update the TBD placeholders with the actual commit hashes if the
extensions are complete?

> +
> +        - const: smlwidlist
> +          description: |
> +            The standard Smlwidlist extension for M-mode control of lower
> +            privilege World IDs via the mlwidlist CSR as ratified at com=
mit
> +            TBD ("TBD") of riscv-worlds.
> +
>          - const: smstateen
>            description: |
>              The standard Smstateen extension for controlling access to C=
SRs
>              added by other RISC-V extensions in H/S/VS/U/VU modes and as
>              ratified at commit a28bfae (Ratified (#7)) of riscv-state-en=
able.
> =20
> +        - const: smwiddeleg
> +          description: |
> +            The standard Smwiddeleg extension for M-mode delegation of l=
ower
> +            privilege World ID control to S-mode via the mwiddeleg CSR, =
as
> +            ratified at commit TBD ("TBD") of riscv-worlds.
> +
> +        - const: smwid

[Severity: Low]
Does this ordering violate the alphanumeric sorting requirement for
multi-letter extensions?

It appears smwiddeleg is placed before smwid, which is alphabetically
incorrect since smwid is a prefix and should come first.=20

Also, smlwid and smlwidlist appear to be inserted out of alphanumeric order
compared to the surrounding extensions.

[ ... ]

> @@ -924,6 +953,30 @@ properties:
[ ... ]
> +      # Sswid depends on Smwiddeleg
> +      - if:
> +          contains:
> +            const: sswid
> +        then:
> +          contains:
> +            const: smwiddeleg

[Severity: Medium]
Could this strict dependency cause a regression for guest VM device trees?

This block requires the M-mode smwiddeleg extension to be present whenever
the S-mode sswid extension is declared. In RISC-V systems, hypervisors
typically only expose Supervisor and User mode extensions to guest VMs.

If a valid guest VM device tree contains sswid but omits M-mode capabilities
like smwiddeleg, wouldn't it falsely fail validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729163908.2498=
38-1-peter.lin@sifive.com?part=3D1
