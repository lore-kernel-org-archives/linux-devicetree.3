Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD8443B6EB
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711052; cv=none; b=pp9va8zfJZsu7S7bKnQAyd8mSaXKwOgjlSaiTNIOMfSJ48nadQIAUUyJGmthkc5d8yjuMv8KPc+KtF+quWkAPovgkLnZbYQXWfbkwMytG36TXgB+lD3W5tG/2QiZQ94LscCi8gLSZz0ZFRwZOP46vBqJtEMuM6REydttb0cps3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711052; c=relaxed/simple;
	bh=q1W8nsJs+lUg7LpK9x5Bm6hFDKKC1ECRWkPCS+tH0MY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UT+81CrKpnq926O1jFnd3qvtdBGu4ObyT3gaE8bYuEqeuRvpPasZAUPAhWrFV/X+1598QuUrr5Z0eRUkyWCTOdo4tfr/Q4JiWQQBhacyoigNMNJIjMQWs4poiKxJJJ0V/2t2QyTWqwDgTfXwFnsTCl/nourVyMXRAFMQHQh1oZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwTkgkFp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwTkgkFp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1D31F00A3A;
	Wed, 22 Jul 2026 09:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784711051;
	bh=nQlwuDtvK4/Du4Z41WOoESth6j+iIT4y6dn+bP0jdqw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CwTkgkFpKnLaXc+d32bPzCXpvufB5bpOJTxk/i9xN0hfNJF2ZYCbEK7z0li3sOrHW
	 SBl1mh6CozcW+gUwR8o88NbyVHu+dVTZRDBZvyZDC0Wvc3DPHf99Cf0h8JMrEaCBst
	 Ryktsdk//OFf5DkGWFivsFpbmJNWKCTn3tkvamdkHZpI6zPh+Zox6NI2ghS08jdkZF
	 77mXdF98QXX7OVURUU1owaqRjRLoDh4VDYRt9qZw/dLnoBXcyD7kdAIoZkNuW09Te3
	 gjAF96Rp7gxI7UTGFt5nvOceap9Ud63zn16EM8THZlSFz+fs7jI0itSkU5MYBT42yF
	 IaHOgKphchxcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: renesas: r9a09g056: Switch GBETH TX
 queue scheduling to WRR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ovidiu Panait" <ovidiu.panait.rb@renesas.com>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722085353.136986-3-ovidiu.panait.rb@renesas.com>
References: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com>
 <20260722085353.136986-3-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 09:04:10 +0000
Message-Id: <20260722090410.CC1D31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the exact same m=
issing `snps,tx-sched-wrr` bug remains unfixed in sibling SoCs (r9a09g047.d=
tsi, r9a09g077.dtsi, and r9a09g087.dtsi) that share the same GBETH hardware=
 configuration (`renesas,rzv2h-gbeth` + `snps,dwmac-5.20`). Without specify=
ing the WRR scheduling policy and weights, they will continue to experience=
 Strict Priority queue starvation and netdev watchdog resets under heavy TX=
 load.
--

--- Patch [2]: [PATCH 2/5] arm64: dts: renesas: r9a09g056: Switch GBETH TX =
queue scheduling to WRR ---
commit 2b31533db8d80852a1d20d1d3d37f647e9c19c9d
Author: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

arm64: dts: renesas: r9a09g056: Switch GBETH TX queue scheduling to WRR

The GBETH ethernet nodes don't specify a TX scheduling policy, so stmmac fa=
lls
back to Strict Priority. This starvation triggers spurious adapter resets d=
ue
to TX queue timeouts. Switch the TX scheduling policy to Weighted-Round-Rob=
in
(WRR) so that traffic is processed across all queues, eliminating the stall=
s.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g056.dtsi
> index d6c8c39df2a4d..281500d9ee42a 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> @@ -1569,23 +1569,28 @@ queue3 {
> =20
>  			mtl_tx_setup0: tx-queues-config {
>  				snps,tx-queues-to-use =3D <4>;
> +				snps,tx-sched-wrr;

[Severity: High]
This is a pre-existing issue, but the exact same missing snps,tx-sched-wrr
configuration remains unfixed in sibling SoCs that share the same GBETH
hardware configuration.

Without specifying the WRR scheduling policy and weights, will these other
SoCs continue to experience Strict Priority queue starvation and netdev
watchdog resets under heavy TX load?

For example, in arch/arm64/boot/dts/renesas/r9a09g047.dtsi:mtl_tx_setup0:

			mtl_tx_setup0: tx-queues-config {
				snps,tx-queues-to-use =3D <4>;

				queue0 {
					snps,dcb-algorithm;
					snps,priority =3D <0x1>;
				};

The same applies to r9a09g077.dtsi and r9a09g087.dtsi.

Should a similar update be applied to these sibling SoCs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722085353.1369=
86-1-ovidiu.panait.rb@renesas.com?part=3D2
