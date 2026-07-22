Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7D6345ED9
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 17:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784741116; cv=none; b=IyWl0yWzN0FHdroFPdpPeJsyQbd74lXQr86h+u6egUiFv+jk9fAey2S0BStpsxCiPdzLw0CR0ovdPhdY2r8gsZiqfACMADeq5HcrONAq4OuxtjXtFxiyjgNb6Rp3H3TA0bXLWl1QdXpl0xc7EtavnX0ru/UJzwqFXaSJs6ehJ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784741116; c=relaxed/simple;
	bh=dp+gU0wgGyYr4QY29BFt2m0GnExC/Tq3pHfBdpbKF90=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RUc4i/EhrrWr6qqX+fvIND7xLWSoJCs8f8ogr2duc2rjS5k1umRJWe4BqWR1Qf4zT1kCKht40XamjKVmoFG8t8h9UhgSQlzyp+oTlxY4Ax0j9cClS6rHStgPNEf9P1jm0SPfeeRjr2hXeAaO0tmUJI63FPrWfEo4aE/EwVd6emU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gr31GXgl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gr31GXgl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4351F00A3E;
	Wed, 22 Jul 2026 17:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784741115;
	bh=8kRR2ITVU9zYnaFI4vcaiWzEHKLghv9yJVQT3FWk3Ww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gr31GXgl5pJKB0iAqblr3tXCgwQI6LAvdU+fw0EKnFQMZ+PXJqByhupWkX68eYvpm
	 cdVCpAlOv8QkAuRmo41UUVNzC5Uewz74nnF3HL75VY1GlLYMPVsniCNXxfOX4bMRLh
	 liUNpwbFcLK2Uz8QgitHH/jXwdcsTEVgr/gVjY+iMREUb4IGx5d20N5/x2eK0LtgZ3
	 ozVaS9AejT1CmE56Y6zHUSgqSHyVcilmK9EtnnCXilOitH18x/rYfzcKywENGr4RUO
	 4P3rMFg4fo6J/BUpHwTXztzS/mPsJJoTXtF41oOp+6K8KghabPSSxiWTG73syeN7wv
	 N0j4MGAjAjQmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: sound: Convert TI OMAP2+ McBSP to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eduard Bostina" <egbostina@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722171654.298557-1-egbostina@gmail.com>
References: <20260722171654.298557-1-egbostina@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 17:25:14 +0000
Message-Id: <20260722172515.3B4351F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly introduced device tree schema incorrectly restricts `inte=
rrupt-names`, causing validation failures for existing device trees.
--

--- Patch [1]: [PATCH] dt-bindings: sound: Convert TI OMAP2+ McBSP to DT sc=
hema ---
commit 76198b04e7315bea741fd54b86bf3bc924be8575
Author: Eduard Bostina <egbostina@gmail.com>

dt-bindings: sound: Convert TI OMAP2+ McBSP to DT schema

Convert the Texas Instruments OMAP2+ McBSP (Multi-Channel Buffered
Serial Port) bindings to DT schema.

> diff --git a/Documentation/devicetree/bindings/sound/ti,omap2-mcbsp.yaml =
b/Documentation/devicetree/bindings/sound/ti,omap2-mcbsp.yaml
> new file mode 100644
> index 0000000000000..17cd664606205
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,omap2-mcbsp.yaml

[ ... ]

> +  interrupts:
> +    minItems: 1
> +    maxItems: 4
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      enum: [common, tx, rx, sidetone]

[Severity: Low]
Does this enum incorrectly restrict the allowed interrupt names?

Looking at arch/arm/boot/dts/ti/omap/omap2430.dtsi, the mcbsp1 node=20
legitimately uses an rx_overflow interrupt name:

			interrupt-names =3D "common", "tx", "rx", "rx_overflow";

Since rx_overflow is omitted from the allowed items in this binding, will
this cause dtbs_check validation failures for existing device trees?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722171654.2985=
57-1-egbostina@gmail.com?part=3D1
