Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0176C425886
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785265779; cv=none; b=bN5PfX+zif5osqM6hvYxl2vHpMFL8kLsyDU3PskkbxsaKL461qrlEjxZL1u41M+cZdyhXaG2XRB+Bor76fO+sac9azzVBPtBU/tSA2wqQ5GzxdNKN8hk/SgedTpxkgD3iEeRun12ycToYICapxOqkyBKPX9TBASw/TN+FlykjWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785265779; c=relaxed/simple;
	bh=+U7JXZKPFQFeHsAxC8ndepcOc4dvzI4ElOy1vQDSDn4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G5xuszJy2D1F3zIKW2ab8RQzbwMwcr9l4TO8zw3KdnQWWzlCOs8inHUNAgtE7D5vIfPlO+bB7RKSId9d4sj8mvTSzsZSFl+20YXaqxFDixrKJUS8wP4M4T5XfbhpE60XdPgO8JAduOO0YlR3WjUXN0p81ZTmjSMtDLuxYOZ9DPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iau9JRq7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iau9JRq7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630AE1F000E9;
	Tue, 28 Jul 2026 19:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785265774;
	bh=m5zZlzJnm8TiFaslhR8FvMmDUbr8eXEBERRxnZoMJyg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Iau9JRq7y+FaeCL70kZ1drbs/WxhXmdwdXmoNfyqCkETwk5Rp2+aQ56EPD5bRdNOt
	 oWbK+5NJb54TZh5rJMBKE3ADYOQagRG+r43nA83zmY7vrJtb34249ljhe19izdP2Jc
	 SyJ0vaM26qsCnbD/bpamw3pRwQD6bI5epqmGWo1od4dCCN668DVpYvqlvl6sU44mzo
	 /TdRgx7Nqf6buJxoXO52sGmjLEOWavmWSsXjjSf+7rlFC9rfyUyKmpuahsmO9Ch1qs
	 Ia3qxrMscP4rHpmxnfb6jfaqk0WJI4kumxvIR618nHQUZAGxNWx70voNbgTM8H7BqO
	 ejWozWNq/5j2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mips: dts: econet: Describe dual-VPE 34Kc processor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728184959.102441-3-cjd@cjdns.fr>
References: <20260728184959.102441-1-cjd@cjdns.fr>
 <20260728184959.102441-3-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 19:09:33 +0000
Message-Id: <20260728190934.630AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Off-by-one array bounds check in `get_shadow_interrupts()` allows =
out-of-bounds write.
- [High] Bitwise shift overflow and incorrect register targeting when unmas=
king CPU interrupts >=3D 32 in `econet_cpu_init()`.
--

--- Patch [2]: [PATCH 2/2] mips: dts: econet: Describe dual-VPE 34Kc proces=
sor ---
commit 2334c8459979130dce8cf68994de6842f0bba377
Author: Caleb James DeLisle <cjd@cjdns.fr>

mips: dts: econet: Describe dual-VPE 34Kc processor
   =20
The 34Kc processor has two VPEs (threads) and the interrupt controller
on the EN751221 re-routes (in hardware) the software interrupt pins
zero and one to numbers 7 and 8 in the flat VEIC interrupt domain.

> diff --git a/arch/mips/boot/dts/econet/en751221.dtsi b/arch/mips/boot/dts=
/econet/en751221.dtsi
> index 72cb65654c341..57ae84a8a9f85 100644
> --- a/arch/mips/boot/dts/econet/en751221.dtsi
> +++ b/arch/mips/boot/dts/econet/en751221.dtsi

[ ... ]

> @@ -65,6 +71,7 @@ intc: interrupt-controller@1fb40000 {
>  		interrupt-controller;
>  		#interrupt-cells =3D <1>;
>  		econet,shadow-interrupts =3D <7 2>, <8 3>, <13 12>, <30 29>;

[Severity: High]
This isn't a bug introduced by this patch, but is there an off-by-one array
bounds check in the driver that parses this property?

Looking at get_shadow_interrupts() in drivers/irqchip/irq-econet-en751221.c,
the bounds check uses > instead of >=3D:

    if (shadow > IRQ_COUNT) {
        ...

If a device tree supplies a shadow interrupt number of 40 (which equals
IRQ_COUNT), this check evaluates to false. This allows an out-of-bounds
write of one byte past the end of the econet_intc struct:

    econet_intc.interrupt_shadows[shadow] =3D IS_SHADOW;

Could this lead to adjacent memory corruption if malformed device tree data
is parsed?

> +		econet,cpu-interrupt-map =3D <7 0>, <8 1>;

[Severity: High]
This is a pre-existing issue, but does parsing this property expose a bitwi=
se
shift overflow and incorrect register targeting in the driver if receive
IRQs >=3D 32 are provided?

In drivers/irqchip/irq-econet-en751221.c:econet_cpu_init(), the code valida=
tes
input up to IRQ_COUNT - 1 (39), but unconditionally applies BIT(receive) to=
 a
32-bit mask:

    mask |=3D BIT(receive);

It then writes this to REG_MASK0, which is only for IRQs 0-31, ignoring
REG_MASK1:

    econet_wreg(REG_MASK0, mask, mask);

Since the driver explicitly validates input up to 39, could providing a dev=
ice
tree with receive IRQs >=3D 32 trigger undefined behavior and functional fa=
ilures?

>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728184959.1024=
41-1-cjd@cjdns.fr?part=3D2
