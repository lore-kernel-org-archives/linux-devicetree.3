Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2AD390231
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 23:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778799989; cv=none; b=WmibVUCKVgHAVQ9nPOINztj6w2Gl08s8f1c8wLi+HK1e19xWEsgy0jNIaWQrGcx66cMHZ0ZgYYfBXuWvPvjUBncilP3g82626BMxrv2nhYDhiQvbJvk1u8To+ackMOFONhH7X9ecWDryYwBqvN40LvRfw1jDgW+A9di/O8F04k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778799989; c=relaxed/simple;
	bh=3uCzQBSs2qX5hjKGgQ9KcROQ6RJsDibNaqJkRqo/7kc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VSH+Ywh5YXsRcwsOI6+56C4brxcCtheDZEVKSnacgq3CR1gvrGy7sE4vfhND3a93XlAkz111yJuNdbj/A19Yd8jvuDzJ/0K7s7363ar7eqAtI0nfTArclrBVWyqf/UWJowRswmxPGMl4AdgOXidmnwVe+LFVHBOs0xJl/0G/4Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIAGEM9U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIAGEM9U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34892C2BCB3;
	Thu, 14 May 2026 23:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778799989;
	bh=3uCzQBSs2qX5hjKGgQ9KcROQ6RJsDibNaqJkRqo/7kc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UIAGEM9Ucb/5+xNy8Re78+Lusiiebjt8i//UGF1GNflhcea31e6SXpcbSG/3Uyqq1
	 zmYQR5fi1K/AulMjszvk4BXi7CUoYq9ecVp6ABmCYSijp/NzoJ9O/0WnsBJE2H8YPu
	 NXMlayESTk6G+QSJ30qWsp0Afw6kP2gNwyOvVtW9bOKc9mc/Scm2KrMBEmoVjnnnY8
	 56VyAKuQRKMezjep6a1H+lHzowGio2QkXcATfkKpSQ//GNZ61ASElwh1rwfWLSonMB
	 QQAA9Ffq3u7WTkVjbVYbeTghtxW20kgk2Q7e9IEBSFbvufJSD/qz+4O/RJeVa6zaMv
	 nE+bf78BHiGLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/17] arm64: dts: qcom: Add EL2 virtual timer
 interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marc Zyngier" <maz@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260514150945.3917510-14-maz@kernel.org>
References: <20260514150945.3917510-14-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 23:06:26 +0000
Message-Id: <20260514230629.34892C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to add the EL2 virtual timer interrupt=
, but for `sdx75.dtsi` and `milos.dtsi` it actually adds the EL2 physical t=
imer interrupt (`GIC_PPI 10`).
--

commit 3f4b80b2c0c05477bcee12a9ba5b2e0a5b15a672
Author: Marc Zyngier <maz@kernel.org>

arm64: dts: qcom: Add EL2 virtual timer interrupt

This commit adds the missing EL2 virtual timer interrupt to the timer nodes
across multiple Qualcomm SoC device trees.

> arm64: dts: qcom: Add EL2 virtual timer interrupt
>=20
> The ARMv8.1+ based CPUs used in a number of Qualcomm SoCs are missing
> the EL2 virtual timer interrupt. Add it.

Is this description entirely accurate?

The commit message explicitly states it adds the missing EL2 virtual timer
interrupt, but it appears to also add the EL2 physical timer interrupt in
a couple of files where the virtual timer was already present.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qc=
om/milos.dtsi
> index 4a64a98a434b6..b991124b8ce9f 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -3235,6 +3235,7 @@ timer {
>  		interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
>  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
>  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
>  			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
>  	};
>  };

Does this inadvertently add the EL2 physical timer instead of the virtual
timer?

The virtual timer (GIC_PPI 12) is already present here, and this addition
is for GIC_PPI 10.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qc=
om/sdx75.dtsi
> index d1b61530b562f..b6cdf71051026 100644
> --- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
> @@ -1583,6 +1583,7 @@ timer {
>  		interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
>  	};
>  };

Similarly, could the commit message be updated to mention this fix, or
should this physical timer addition be split into a separate patch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514150945.3917=
510-1-maz@kernel.org?part=3D13
