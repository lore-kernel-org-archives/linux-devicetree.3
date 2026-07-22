Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E0C345CBC
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727071; cv=none; b=uihxAlF3qpaUkagFOsW6QN/GhmPepX6hk2qfydTN+wtnblFYgcXFBtzc6QDEQWU0GfWLdaDO/3kkHXR+SJRJ8G5+AedCmRmyyo8S6xUQKzhUfm+Zviujfb21QCj7ujQDs0FahcNI0aPLYTDZc5wG1P5bRHKxmATHPAmO1O+f+nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727071; c=relaxed/simple;
	bh=54g8rtUwNIHn4d6i51YDt5zWH9Nkapo9XJo+N23ZuPw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DUd5TCx7yqN0a2jIM7EyGbUl03OeXEOqEvkuIKcubJ0hi7KOXwiA3o4d2FDMlDsjfItvFNQ+pMGlFSM27yxHQwaYedU+d1ZSuKh+sDrLBhPb66fIJCpfL4V6HPct2ans/T/TmH7dKMnaDix3WMt7j8ys0zoBMW61dw71sWybQgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYNn1D/k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYNn1D/k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E658B1F00A3A;
	Wed, 22 Jul 2026 13:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784727070;
	bh=dGigKcbt5WXLZAY6ISAjJsQInDwxWoqD3au9CzhDoew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FYNn1D/kSYv9if3KXAn/8ZYmcke2FzHdaf1RpLdKgbr3vkIjtGpZnKpKjFcaiZnnx
	 W7jcoRLYPbOoHL41INbMvSy4pNIRI5xWnDZbyCc5VicUaJlgiNfk8vXQ/OK7KUMWGf
	 yaVPgtZNdkLpIZGlAQtIDw8Ffm07a7WGW2+V7XqLPj6uw+Q6dX6Cd90fT6WM9sfBby
	 NGiels4CKzSqn/3LgxwDrmvEQjF5V8uBi0tZJlJCGgxTFwpjSFqIP2iDkVvnA/Cse4
	 ur3UNf3g71cpluMgW59I1X8BNYwwFjMz5kt5wiFs/hzMsixA8uWXRAtolBbjTdiWq5
	 uDqFr2AW+Sj5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 3/3] arm64: dts: renesas: r8a779g0: Add gPTP
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260721132936.1331318-4-niklas.soderlund+renesas@ragnatech.se>
References: <20260721132936.1331318-1-niklas.soderlund+renesas@ragnatech.se>
 <20260721132936.1331318-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 13:31:09 +0000
Message-Id: <20260722133109.E658B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Device Tree Resource Overlap causes probe failure due to exclusive=
 memory region request
- [High] Hardware Reset State Corruption of shared system gPTP module
--

--- Patch [3]: [PATCH net-next v5 3/3] arm64: dts: renesas: r8a779g0: Add g=
PTP node ---
commit 4292ed266aa9785a4578e66f92c58f83f6f4bbfd
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

arm64: dts: renesas: r8a779g0: Add gPTP node

The gPTP module is shared between the RAVB and RTSN Ethernet devices on
the SoC.

> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779g0.dtsi
> index 82a7278836e57..b9b860ef70351 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -589,6 +589,15 @@ tmu4: timer@ffc00000 {
>  			status =3D "disabled";
>  		};
> =20
> +		gptp: ptp@e6449000 {
> +			compatible =3D "renesas,r8a779g0-gptp", "renesas,rcar-gen4-gptp";
> +			reg =3D <0 0xe6449000 0 0x500>;

[Severity: High]
Does this overlap with the existing tsn0 node?=20

The existing tsn0 node still claims this identical 0xe6449000 memory region
(size 0x500), which its driver requests exclusively via
devm_ioremap_resource().

Will one of the drivers fail probing entirely, given that request_mem_regio=
n()
will reject the second request with -EBUSY?

> +			clocks =3D <&cpg CPG_MOD 2723>;
> +			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 2723>;

[Severity: High]
Could sharing this reset line cause hardware state corruption?

The tsn0 network driver also maps to the same reset line 2723 and actively
asserts it during interface up/down.

If the tsn0 interface is brought up or down, wouldn't it forcefully reset
the physical gPTP module, wiping out the precision time synchronization
configuration and internal timer values for any other active consumers
(such as RAVB)?

> +			status =3D "disabled";
> +		};
> +
>  		tsn0: ethernet@e6460000 {
>  			compatible =3D "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethert=
sn";
>  			reg =3D <0 0xe6460000 0 0x7000>,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721132936.1331=
318-1-niklas.soderlund+renesas@ragnatech.se?part=3D3
