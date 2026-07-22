Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD311C8CE
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784714689; cv=none; b=HyvtOjxuob8jOvIgYse2rNhLeqEYOHO0XynpTLS0Q0LmNVxJzgKaWvu//wne5Q4bPmeEEdkdxMa/U/hZdpPRBCCWs1TVIkSfJz6/4HT7RllJMJ2a29qbQ/Lm1zLbPOtxNKyuo5V/2mYYO0rye6zYlJznSdKbyrG7cbiWrTO1oyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784714689; c=relaxed/simple;
	bh=88Vb6t45mDG47dsUjL3LMMkjkPAEAqBvQnigwk82nms=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y9o703I1ca+NLT76LUIC+3JpjmG7/YXWISr3wBaA9muvfbxXdpMLFN3lYrEsA0oNTmJMqDRYRAsdslLuv7X47fiZHfr6aHQIegqkP4BdeTXiuUiZbbmIwxxfCy63ecc0XgDGBIN2E0pXPvhWQZQhCdVaLr++Gdxj5tHC0fAxv20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6I4SNmu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6I4SNmu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218CE1F000E9;
	Wed, 22 Jul 2026 10:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784714687;
	bh=KQQwZw6SZzAhe2G/K+ezg5TP9CRZqINkpOtDmf3bOiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V6I4SNmuUfknePdixn41QVlfBK/rRZD9BAy84Il2XgdeQUwbk8qMURKIEcJmIlk04
	 O/m2RHzvANbyoeG8KkB3FHXS04tkucHfntPVoVQEUra2VRoo8MFfcuEqzdRzs2K7ot
	 J0/j/g3BMQ275nH2tmcsUSymoJyTwWx+5hvR4tKPNUN7YCeNCLflfJPwhmEKW+49DR
	 RxQaANGHViX2gVaVvzMds1crNYx5SdPVZQE85eqhOKMj2PMtYdM9kHrLQmawwdSLod
	 afzs/RHwB8o0cYsF35nwydR+uW7YlvR6b5hMmhALVixOoaRQPAYvXDTz9Zlap99Csg
	 fVMA5af43DqsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for
 frankel/blazer/mustang
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peter Griffin" <peter.griffin@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 10:04:46 +0000
Message-Id: <20260722100447.218CE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Invalid use of GIC_CPU_MASK_SIMPLE(1) in a GICv3 interrupt specifie=
r.
--

--- Patch [4]: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frank=
el/blazer/mustang ---
commit 70ad3c51746ae3a6716daf5117667c85c92e2de0
Author: Douglas Anderson <dianders@chromium.org>

arm64: dts: google: Add initial dts for frankel/blazer/mustang

Add initial device trees for frankel (Pixel 10), blazer (Pixel 10
Pro) and mustang (Pixel 10 Pro XL). These device trees are enough to
boot to a serial prompt using an initramfs.

> diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/go=
ogle/lga.dtsi
> new file mode 100644
> index 0000000000000..343156a8c0390
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/lga.dtsi

[ ... ]

> +	timer {
> +		compatible =3D "arm,armv8-timer";
> +		interrupts =3D
> +			<GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW) 0>,
> +			<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW) 0>,
> +			<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW) 0>,
> +			<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW) 0>;

[Severity: Low]
Does this incorrectly use GIC_CPU_MASK_SIMPLE(1) for a GICv3 interrupt cont=
roller?

Since this device tree uses a GICv3 controller, the CPU mask in the flags c=
ell=20
for PPI interrupts is deprecated. While the Linux kernel dynamically masks =
this=20
out, other operating systems or hypervisors consuming this device tree migh=
t=20
strictly evaluate it and incorrectly limit the per-CPU timer to CPU 0, or=20
reject the device tree outright.

> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-contrib-pg=
-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org?part=3D4
