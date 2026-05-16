Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968E826F29C
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 22:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778969221; cv=none; b=ED0xwOm1pqkacp57TTPfSMqYpM1LrNZU+psrYIL9T/6GclbicqAgnO2GaLINItrW0wY2BCTO0kNoeymBZAfltDMWTi9dfEPHItUb4kGDcQ7yB6DY+2W+Mlt2Nb8zKqREd/6u3Ig4ExXZ4A5kUreL/f3n+L+SquLXnt32j1z3ZEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778969221; c=relaxed/simple;
	bh=rdRcdLaBaFPAwq3noZOxqieB326Em1kG9HmOVq8cp38=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y1+BGfOlEyG0YqyMHMyx6Kki92GQpzopKH2fjZU4nvZJewSNoaFWmssL31JhFGXL8D1JXu+gCGSxwPoUp4XT67YSwOhunaQe4EIIk7hGs0NzJsNlzW8ODY2TCfGMhMtdiNRqOgww6G8TLHEn0bRTdGM4/1luOYL33yB+s0tXyzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhzXmfSz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhzXmfSz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D00C19425;
	Sat, 16 May 2026 22:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778969221;
	bh=rdRcdLaBaFPAwq3noZOxqieB326Em1kG9HmOVq8cp38=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=bhzXmfSzpMKqpQdkKU6xXjQG1WEBVlhjw0NmfL4Pg29tQpLPDUMUDilovXkfk11fC
	 uPxpoLf00r4sIPjfNlRRd8+nabGBgr6frHuLwbKISIedvw/cfy91hoFFHk3zy+0AIE
	 KXqwtCy/KNZP+abOC2g9vBmWbaV42WmWldAs11QN9BIaGElbxvDxNk1sHgmAt1PHxT
	 OB6qlx4+4bJG4xrQV5wa54vFXtiSqqwukf2xMl1PetEJEulBDL54MgN9ImpDpiSk6U
	 AYVXB6sW67uzBKD+3Cja7AKUJbGpac46l5uCxeYNot+hAT7eJhN8rpLDU+kRSiB2+a
	 PPD0RAuiRbTgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: timer: econet: Update EN751627 for
 multi-IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260516215720.4160831-2-cjd@cjdns.fr>
References: <20260516215720.4160831-2-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 22:07:00 +0000
Message-Id: <20260516220701.00D00C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Schema validation failure due to mismatched `compatible` propert=
y definition
--

commit 98621a611cbcdcc4dc90e93160187fdb4c15428f
Author: Caleb James DeLisle <cjd@cjdns.fr>

dt-bindings: timer: econet: Update EN751627 for multi-IRQ

This commit updates the EN751221 timer binding to account for the
EN751627 SoC, which uses four individual interrupts instead of a
single percpu interrupt. The example is updated to demonstrate this
by dropping the fallback compatible string.

> diff --git a/Documentation/devicetree/bindings/timer/econet,en751221-time=
r.yaml b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> index c1e7c2b6afde1..16f32741473fe 100644
> --- a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
[ ... ]
>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
>      timer@1fbf0400 {
> -        compatible =3D "econet,en751627-timer", "econet,en751221-timer";
> +        compatible =3D "econet,en751627-timer";

Since the fallback string "econet,en751221-timer" was removed from the
example here, does the top-level compatible property definition also need
to be updated?

If the schema still strictly requires "econet,en751627-timer" to be followed
by the "econet,en751221-timer" fallback, will this standalone string cause
a regression during make dt_binding_check validation? Updating the property
definition to permit the standalone string would prevent this.

>          reg =3D <0x1fbf0400 0x100>, <0x1fbe0000 0x100>;
>          interrupt-parent =3D <&intc>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516215720.4160=
831-1-cjd@cjdns.fr?part=3D1
