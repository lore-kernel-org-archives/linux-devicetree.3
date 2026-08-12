Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37C5314A8D
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786538052; cv=none; b=c+rv6lojDSaHDiHZANRh3QsgxF1FUleB5DvlTHfHZAJWfioJR2y10ZH6/jRBKEJ2pMBTSuhZ2mc4V4u4gJTG0strc/6Mn3Wjnv8dzoD+f+LFUCG0Vp/Osw0ABA4qOf37q5gQ1tPxja9ez02P2ZkyztPB+Ab5+/7gowHn+anCLXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786538052; c=relaxed/simple;
	bh=5c+EWLuHstJ3ezQaUt5aVDSOUVlO3sFyq+w3SoPDtjo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lixFNCqL+0ITPgcONun83JGG8OePGlo2o39y6di4nLOIv5ZsiYxJRe1JKp6JnqjW9CX894PqgI76hAqlyTwfLXYeVJzyTcC6riMzryZuPL+OHQMgVgBTF3e/6J/VfwArB7DeUp241q8bwjT5b+dkzXM3kbVdRY5+DhmAG/qpKCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2nf03nE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2nf03nE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 411E31F000E9;
	Wed, 12 Aug 2026 12:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786538050;
	bh=Cfcr5lXHm5b9LrYPK+QYIHq+PanxuOEzMKqYFJ2vwiI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i2nf03nEydkCVtbiY9dKY9VbjYdCmMp+fr8KtWusB8/NZF61XnAdDbNQnS7LqdHzo
	 HzF4xJm9mfuPdQ9CWgA9w5EG0HPHrMgD/72DuUtSqNQmwAnr6be7IWCwgg6bAORkgd
	 Si/jd4pJT7T+zdCMjDlWTjPPLTlzwT7iaUCYTUr3eBxmtjCOfsOKww+LDx7GLH31cJ
	 +dW73+gVGXrPn05oAxjX+M08Z1Y/kMrYJqE/kDu1oIAFBQLSoX01QEoSxQe5yDtQa1
	 4C0EE7weKU2Ps2HckeF1wNS7P1bkyZgZgAQnywsS3TsjEULZc5edm/Agk85qmFdTXf
	 +Ncr4qdc/T+HA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3 1/3] dt-bindings: riscv: Add Worlds ISA
 extensions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chien Peter Lin" <peter.lin@sifive.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260812122131.1534906-2-peter.lin@sifive.com>
References: <20260812122131.1534906-1-peter.lin@sifive.com>
 <20260812122131.1534906-2-peter.lin@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 12:34:09 +0000
Message-Id: <20260812123410.411E31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Placeholder 'TBD' commit hashes are used for the new RISC-V Worl=
ds extensions instead of actual ratified commit hashes.
- [Medium] Enforcing an S-mode extension (`sswid`) to strictly depend on an=
 M-mode extension (`smwiddeleg`) breaks device tree validation for S-mode g=
uest VMs.
- [Medium] The schema fails to enforce the architectural dependency that `s=
mlwid` requires the base `smwid` extension.
--

--- Patch [1]: [RFC PATCH v3 1/3] dt-bindings: riscv: Add Worlds ISA extens=
ions ---
commit 0933aea6342a2dfd4ed22a9a32e7d69364ef3cfc
Author: Yu-Chien Peter Lin <peter.lin@sifive.com>

dt-bindings: riscv: Add Worlds ISA extensions

This commit adds device tree bindings for the RISC-V Worlds ISA extensions
(Smwid, Smlwidlist, Smlwid, Smwiddeleg, Sswid). It also adds extension
dependency rules to the schema.

> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 5ffc40d599c02..0408d11165275 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -181,6 +181,18 @@ properties:
>              changes to interrupts as frozen at commit ccbddab ("Merge pu=
ll
>              request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
> =20
> +        - const: smlwid
> +          description: |
> +            The standard Smlwid extension for M-mode control of lower
> +            privilege World ID via the mlwid CSR as ratified at commit
> +            TBD ("TBD") of riscv-worlds.

[Severity: Medium]
Does this schema use literal "TBD" placeholders instead of the Git commit
hash of the ratified RISC-V specification? This prevents exact traceability
of the specification version used to define the schema, which is typically
required for RISC-V extensions.

[ ... ]

> @@ -924,6 +953,30 @@ properties:
>          then:
>            contains:
>              const: b
> +      # Smlwidlist depends on Smwid and Smlwid
> +      - if:
> +          contains:
> +            const: smlwidlist
> +        then:
> +          allOf:
> +            - contains:
> +                const: smwid
> +            - contains:
> +                const: smlwid

[Severity: Medium]
Does this schema miss enforcing the architectural dependency that smlwid
requires the base smwid extension? A device tree could declare smlwid
without smwid and silently pass validation, even though that would be an
architecturally invalid hardware configuration.

> +      # Smwiddeleg depends on Smlwid
> +      - if:
> +          contains:
> +            const: smwiddeleg
> +        then:
> +          contains:
> +            const: smlwid
> +      # Sswid depends on Smwiddeleg
> +      - if:
> +          contains:
> +            const: sswid
> +        then:
> +          contains:
> +            const: smwiddeleg

[Severity: Medium]
Will this strict dependency break device tree validation for S-mode guest
VMs?

In virtualized RISC-V environments, a hypervisor provides a device tree to
an S-mode guest VM that intentionally strips out M-mode extensions, since
M-mode is not accessible to the guest. Valid guest device trees containing
sswid might unconditionally fail dt-validate because the M-mode smwiddeleg
extension is stripped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812122131.1534=
906-1-peter.lin@sifive.com?part=3D1
