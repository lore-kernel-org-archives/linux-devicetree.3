Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D42E425CEE
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982988; cv=none; b=MCgLFK08rmI7zyBF+wBjJqgwjOZ7aXM1klE43hbPBg7AgTjMB7l+qUtWMZIwsynhGKOKJGK+sJVT+EGtyIHxeK4OtBxe0d7kdoPA3WnVfttgmZs4z+nLlEp6AcLdNRTDrwGdwTAnSrwccD8ZS/ISu6JerQDAbdiSlBTbGlKNSxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982988; c=relaxed/simple;
	bh=7DmJz87c5sLDDAgiHNwYDyHKHm/QcKL+VEGZvMmcPEA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O6SmOUmmiA1jTa/lvf0jGaZNjGWqGquB0BJEAmuCtcGep/NQ/CrzTsoxkGOeUFmiEH1zR0QOQWY77on49sPcpqagJwOm441agArhZ77ZKdgdBCLxVdcT+l9hP4weskPPB6C1CDMTQJj09VB8JrT0tOWtoHhYivkRrEe+BEMQGPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dodL6Jyh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dodL6Jyh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4D31F000E9;
	Mon, 17 Aug 2026 16:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786982979;
	bh=H4JKYML8wxQirzdneYPQqj4Iieh3l+9z++OpAU8+tTI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dodL6Jyh3s3aa+kUm8fAnEc4KnzLuPtqjnfL6R03wAvn9cb0t5DgzSHTG2+b/mwRK
	 qmLSJwJvJnCl7+/Zqg0sLttWk3G+u4eptQ4Kl0Nnm2dG9cXqVXUbGTIrK/OcfV0To2
	 +CIwXCgXCoa/a3wCigPy7UiAlstBvYYFbS37y5SSnmJVNzNlXNEpLDU+/ubThqFlKp
	 27YuYcqJuM3glnU6+BL1p4weGb8FE+X1AmyAnIWv5futgo/yikZ2lPHOHZhd4WDl06
	 ozFuHgs1urd0WnRTXCI6G+ve+/3CwFOVOZR0V28TNwEX/mtBTJmkbldKDRr1TOhmWc
	 dS4o4HdX3Iqkg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/3] dt-bindings: riscv: Add Sspesa and Ssplcofi
 extensions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817160222.3313295-2-mayuresh.chitale@oss.qualcomm.com>
References: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
 <20260817160222.3313295-2-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 16:09:39 +0000
Message-Id: <20260817160939.8D4D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `ssplcofi` extension is missing a dependency on `sscofpmf` in i=
ts validation rules.
--

--- Patch [1]: [RFC PATCH 1/3] dt-bindings: riscv: Add Sspesa and Ssplcofi =
extensions ---
commit d9c857c632fdf5807bbc999144379f6067037960
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

dt-bindings: riscv: Add Sspesa and Ssplcofi extensions

Document the RISC-V Performance Event Sampling extensions Sspesa and Ssplco=
fi
in the ISA extensions binding. This adds descriptions for both extensions
and a dependency rule requiring Sspesa when Ssplcofi is present.

> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 5ffc40d599c02..f316b93754ff7 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
[ ... ]
> @@ -934,6 +946,13 @@ properties:
>                  const: smnpm
>              - contains:
>                  const: ssnpm
> +      # Ssplcofi depends on Sspesa
> +      - if:
> +          contains:
> +            const: ssplcofi
> +        then:
> +          contains:
> +            const: sspesa

[Severity: Low]
Should this validation block also enforce a dependency on the base sscofpmf
extension?

Without requiring sscofpmf, an invalid device tree configuration declaring
ssplcofi without the base extension could silently pass dtbs_check.

>        # Za64rs and Ziccrse depend on Zalrsc or A
>        - if:
>            contains:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817160222.3313=
295-1-mayuresh.chitale@oss.qualcomm.com?part=3D1
