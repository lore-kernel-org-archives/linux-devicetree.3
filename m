Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D633815E2
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 18:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788721077; cv=none; b=DpAOLN/VgRaN8nZJI0CvTxef0cuOURBVm0omfiS/wl2FCN4tqnJIzwFRVqG0oqNn3+cAsR+c/J++gyKeqGU6Q/cwD80N762/wp5wgA3O43mBntGXjeOwxp1+tpk8Gjd5b4zYdxk3urJ1eVHINIJj6BRNj74L27WWmWQvTqBJULY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788721077; c=relaxed/simple;
	bh=9cKT19MfoCSsWFyNznRnG8SrdSjbGc87NpnIoQ9zFkQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X0HpQc+EKFsMPhoNWZpxZehXU7FpiNOh5KSJAdTbiE6eW6SR6s4Uev4jLeYJO6QXVjIg0aY5fWP+IPnvMuHbjGcHIbVqr1b8oazkuoxX/0XpIxSJtf/HFGyDT7dPd7FR0YRzOiauT7ZiDEi8XTosTJ7O0RzhOxJ/h23LlMS0Q1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LmqCEyEf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmqCEyEf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78BB91F00A3A;
	Sun,  6 Sep 2026 18:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788721075;
	bh=tZdzVN0C9bbClzpYvYeJAG1ARXDNUoxLL31yMm0dQHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LmqCEyEfoTcWiuCOiX1s73oE+gF4lBjCbwXbwxuho2+7AGxFdadFzGhN6jlALqMt2
	 C/GnBrX5FqpJSYqYS4Y+At+JUCk0Ftvb76PL2TF3k5t0hvNwwFsKQxPdwzfrXeFPhc
	 2wtb1nUncmaGbsGtfzrK1ZVdn/aFgxqin9T13PJgReZVEZb2bzU55SqMueaEEWw2oI
	 CW2agahkFfixzHwAKomaDsb5Jo4pQlLAW53nq0/qWbD1e1pwiSY+n7T38kRnm2vFI8
	 Ca95i053pwUvhAYH8lFUUwXzmWELNG+DNZkWOWtW/ht/7xbbG83yue/EzQqezxs2sG
	 Ex07qelZdjlfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 22/22] arm64: dts: apple: t60xx: Add USB4 ACIO and
 NHI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-22-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-22-1f80085f93fb@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 18:57:54 +0000
Message-Id: <20260906185755.78BB91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The apple,dart nodes for USB4 in t602x-dieX.dtsi incorrectly speci=
fy `#iommu-cells =3D <5>`, which causes the apple-dart driver to reject the=
 IOMMU configuration and breaks USB4 support on t602x hardware.
--

commit 4665bd18e7a65a6f449efb387c1fa31def24848a
Author: Sven Peter <sven@kernel.org>

arm64: dts: apple: t60xx: Add USB4 ACIO and NHI

This commit adds the ACIO host router, NHI, DART, and mailbox nodes for the
ATC instances on t600x and t602x dies. It connects the host routers to the
Type-C connectors on several Apple Silicon boards and describes the USB3
paths.

> diff --git a/arch/arm64/boot/dts/apple/t602x-dieX.dtsi b/arch/arm64/boot/=
dts/apple/t602x-dieX.dtsi
> --- a/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
> +++ b/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
[ ... ]
> @@ -133,6 +149,96 @@ DIE_NODE(pmgr_gfx): power-management@404e80000 {
[ ... ]
> +		DIE_NODE(usb4_0_dart): iommu@a80000 {
> +			compatible =3D "apple,t6020-dart", "apple,t8110-dart";
> +			reg =3D <0xa80000 0x4000>;
> +			interrupt-parent =3D <&aic>;
> +			interrupts =3D <AIC_IRQ DIE_NO 1387 IRQ_TYPE_LEVEL_HIGH>;
> +			#iommu-cells =3D <5>;
> +		};
> +
> +		DIE_NODE(usb4_0_nhi): nhi@f00000 {
[ ... ]
> +			iommus =3D <&DIE_NODE(usb4_0_dart) 1 0x100 0x0 0x10 0x0>,
> +				 <&DIE_NODE(usb4_0_dart) 2 0x100 0x0 0x10 0x0>;

[Severity: High]
Does this correctly configure the IOMMU for the USB4 controller?

The apple_dart_of_xlate() function in drivers/iommu/apple-dart.c explicitly
enforces args->args_count =3D=3D 1 and returns -EINVAL otherwise. Specifying
#iommu-cells =3D <5> for the usb4_0_dart node and passing 5 arguments in the
iommus property for usb4_0_nhi will cause an unconditional failure to set
up the IOMMU for the USB4 controller.

Will this cause the IOMMU subsystem to reject the configuration during probe
and leave the USB4 controller unusable on t602x hardware?

> +			/* To be filled by the loader */
> +			apple,thunderbolt-drom =3D [00];
> +		};
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-b4-apple-s=
oc-tbt-v2-0-1f80085f93fb@kernel.org?part=3D22
