Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBD52264CA
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 02:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784688458; cv=none; b=lt5LCHCdt9jkHHtDPt5lJw+92yXR1YY7axqAajXvDNEqqm+RDeh8XOIyt9g7/ThYXknS/pXgLmnoMoNuZkj+NC5zlfMGW1uf0VF+OQHliBDYYgzA4hwMTLF0SPukTnyMmbnHdyW+vVB/SQwPRCh5L/4k36jurtlv4Twcx/iqYLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784688458; c=relaxed/simple;
	bh=ocquyAMHCBQY2HgVfcU98VzuURiYBipFXPCauXOz16Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ayiqxNabPjEpy9kW3Y6VEH5UvBBVx9bFb3lAEkugzw6sz4cZM50TEZxivcDJ4yQE1++Rxoq2weVuWP5yA5R4cKSq0GUc8n79lTW4RdcdK619F5DTzsGM7n+ra8NU6exkINThvqcJF2ZUMK/n4y9IoS8r/y9rfSSBY8Csx4bNysg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HM2Elqfv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HM2Elqfv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B02F1F000E9;
	Wed, 22 Jul 2026 02:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784688456;
	bh=zRk9ScpcApUdJTo9w3N8zpuumznnoBw1cTFucWlJOFw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HM2ElqfvQWPp2mKyq6xlEX8qQsQ5aRlQlYlIlaQSgaeeRXHRoMyroJAZ4g717/HoY
	 QUy4cIZliGVUyDL60hwPjPZeXWiNk4nX0HMC1pX1bM+nFp7sKI9qd895M9nW7CiNFY
	 azTNUzIU4VLHyXhDUyIwiPfTzKZN63EC4KqSPmBRGKSHF5tgE4tr4OmpRCb+2JdryW
	 OFUDWXWtfdl6RryKkx2WB6JA0vqzMAGmYwxbfs2rfcGz6gRr5BtQmTeG9xvTGPizEl
	 aUrMB/OH32alHrGE3HVcV+3dBndv3Fv4KDqs/DBI5ggQQvBezzm8Y3ndjREwE35mAe
	 NJCgNIzGOr8bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260721-kx-i2s-dts-v1-3-d22cb6cfaab5@linux.spacemit.com>
References: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
 <20260721-kx-i2s-dts-v1-3-d22cb6cfaab5@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 02:47:35 +0000
Message-Id: <20260722024736.2B02F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree uses the undeclared macro `CLK_MPMU_I2S_SYSCLK`, wh=
ich will cause a fatal syntax error during DT compilation.
--

--- Patch [3]: [PATCH 3/3] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes ---
commit 89d824064dd5e05a6a01752a3478d73808fc8c1f
Author: Troy Mitchell <troy.mitchell@linux.spacemit.com>

riscv: dts: spacemit: k3: add i2s0-i2s5 nodes

This commit adds the six SSPA-based I2S controller nodes for the K3 SoC,
configuring their clocks, DMAs, and resets.

> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> index 19fc9b49668ed..967e5d87527a1 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -1081,6 +1081,125 @@ uart10: serial@d401f000 {
>  			status =3D "disabled";
>  		};
> =20
> +		i2s0: i2s@d4026000 {
> +			compatible =3D "spacemit,k3-i2s";
> +			reg =3D <0x0 0xd4026000 0x0 0x30>;
> +			clocks =3D <&syscon_mpmu CLK_MPMU_I2S0_SYSCLK>,
> +				 <&syscon_apbc CLK_APBC_I2S0_BCLK>,
> +				 <&syscon_apbc CLK_APBC_I2S0_BUS>,
> +				 <&syscon_apbc CLK_APBC_I2S0>,
> +				 <&syscon_mpmu CLK_MPMU_I2S0_SYSCLK_DIV>,
> +				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,

[Severity: Low]
Is CLK_MPMU_I2S_SYSCLK defined anywhere?

It appears this macro is undeclared, which will cause a fatal syntax error
during device tree compilation.

This same undeclared macro is also used in the i2s1 through i2s5 nodes added
by this patch.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-kx-i2s-dts=
-v1-0-d22cb6cfaab5@linux.spacemit.com?part=3D3
