Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B622E2852
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 14:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779977403; cv=none; b=kDewC203gTVero30dlFv+JRllN2UosoEBkS5z57fF2lFQrWP3cHx/UAXC41gelBxuRZqJZ1RLscaEGQuG1vvq4xjFeTP0l+9AxA3uAMC9+qssCb7dLr5bb4Eiwmc+0HgqcKdkafnSIb64BVwCuJgt6JxBLLMIhUX4eLehqVNmLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779977403; c=relaxed/simple;
	bh=cb0Alao0wAK5p6LLUs61tjGHocPnOv+RtVo2xgCeFJs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mz99b5f6O1LSZUoUxSuSYCN7VIO+FRjIbsEeSc3iA6wbKxKHwDZu+1yc6FTm+fGGrIkQu2EG8Wu/r20vUNxCfsg+BeyCrUJDIz6zIjCWN5ylB3l2pzsD8VidfCYKDBxnLDGM2ttXgzecVR4g97iPRLx+PwrjHXxWkLSoLU5/RNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUd0wK7r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUd0wK7r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7FCA1F000E9;
	Thu, 28 May 2026 14:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779977401;
	bh=zH1drErvPJ4USPncQUIgcblMweYzwjL5oQOj4wvJb44=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BUd0wK7rDGpxollzLfFcNEds9LxJTFIKbEW/9qMuYED+uNMG+vWJaUUp0efNL2m5j
	 q5JhurxAQAG4MTWqiWIDCAOrmQiFFzo1Lr9oTDmXQfe6/CNd9hPiVIU7Q2OalrZzkg
	 oDqh52KHRGW/FCWTsVOxK14mvzIlHFfYwQKXhe0K94aysckB1P4hMP2Aab9Ug0NC1s
	 CLYnk3rq5Pa9uFGMQAjT5M9nxZGnEsL0A5AiZ8tZUzyT6UfsrgbImAnoeGR+y+Po/G
	 7O1/5Ns17wEtaz4NtzA7yIXEak/ogys0/Gj6a6PEU4ObHJl1H1GCTK4r8hZdqxyQR1
	 Ua9R2LCqMUpNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: renesas: rzt2h-n2h-evk: Configure ETH
 pins
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528134752.79813-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260528134752.79813-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 14:10:01 +0000
Message-Id: <20260528141001.A7FCA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Output electrical properties are incorrectly applied to IRQ inpu=
t pins.
--

commit d84bccabc10cd7f1872ff319101c5c8c4a5f39c8
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: rzt2h-n2h-evk: Configure ETH pins

This commit updates the gmac1 and gmac2 pin configurations for the RZ/T2H
and RZ/N2H EVK boards to match electrical specifications. It restructures
the nodes into pin groups and fixes a comment typo.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arc=
h/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> index dd0556b0a4f59..060f65a23b78b 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> @@ -258,23 +258,54 @@ can0_pins: can0-pins {

[ ... ]

> +		md-pins {
> +			pinmux =3D <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
> +				 <RZT2H_PORT_PINMUX(26, 2, 0x10)>; /* GMAC1_MDIO */
> +			drive-strength-microamp =3D <5000>;
> +			slew-rate =3D <0>;
> +			input-schmitt-disable;
> +		};

[ ... ]

> +		irq-pins {
> +			pinmux =3D <RZT2H_PORT_PINMUX(27, 2, 0x0)>; /* IRQ3 */
> +			drive-strength-microamp =3D <5000>;
> +			slew-rate =3D <0>;
> +			input-schmitt-disable;
> +		};

[Severity: Medium]
Are these output properties (drive-strength-microamp and slew-rate)
appropriate for an interrupt input pin? It looks like this might be a
copy-paste from the md-pins group.

Also, does disabling the Schmitt trigger on this asynchronous external
interrupt line make it susceptible to noise and slow-rising edges? I am
curious if this could potentially lead to spurious interrupt triggers. This
same pattern appears to apply to the other irq-pins groups in this patch
for IRQ13, IRQ14, and IRQ15.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528134752.7981=
3-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D2
