Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA80190473
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 13:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779627863; cv=none; b=nCYOQPWXSr7FbYIpNyu4jqBQjFXJORajoKdJBUMqTH9T1E2VdqaH0qMkHesXy4v3kTFgsCaiFWyRb9pkRA33NZ7cZjfeS+HJ4xTvbxGY4iFXycUDMBkv1nL0qn6F90RfmkfFUTfYgkLwdVffyMD21/uFm6G8CVz+8Dk1c1rBeng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779627863; c=relaxed/simple;
	bh=DXPbRDTXWXWFCfs8J33WP6+JBfOn67zS7AftBwiBzTg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lkt88FGhBlxxBQ/0W8dtqAqdF9N63fHrTJMC6ZwynCmf7CDaY65UKOpGAtf+CArwAD7WiMkNz7M2yXfvQ8rPvOU3auLsHAQl/SBt4hg7Ci0di54yRO3K/EVh/AmnagIIbrHYNdE4zGeYVKzxVZqoKri33qOH2LsznlcOGvdTaoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fd7DJDQu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fd7DJDQu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78481F000E9;
	Sun, 24 May 2026 13:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779627862;
	bh=/tb2Kw4eSWVrzAoAOgqXTvQNEmCVZ8/AYrPHS8/Ut1s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fd7DJDQuq2SR03Pq0NJ+NGLahUWS1LsTxwhg+NkVN0TR461STrIyYheZOcEmLlc7u
	 s6ZyuW5leIooS99sDpMsglVvwhDZnWRugYUeLWaCEaXp70U3J50DN19/w/1LwtjCMz
	 QQLqRPExVwk4m1MrU5F05kelfICygyxgKddnt+2RRz8+Ofbex4DJyfrH4smZWIGycq
	 xPA1r1VYfj4nMxsLmhgRmcusRgNuZTmbpzNsrHQ7ijN8KH1CAZ3A3IuxqIfy7ybYET
	 TxN669+tXWNCfSWlIBZscm+2fpjl6nrQ+xLUZg1fIeE1u/Fl2oKIuMNQERNjzjS7Rs
	 AoVsX65I2QB2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: marvell: armada-37xx: mark EIP97 as
 dma-coherent
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksander Jan Bajkowski" <olek2@wp.pl>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260524124456.350659-1-olek2@wp.pl>
References: <20260524124456.350659-1-olek2@wp.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 13:04:21 +0000
Message-Id: <20260524130421.E78481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Incorrectly marking the crypto engine as `dma-coherent` on the=
 non-coherent Armada 37xx SoC bypasses necessary software cache maintenance=
, leading to silent data corruption.
--

commit cb353bcdff0077f7b4e65e2e644ffb6462f3946f
Author: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: arm64: dts: marvell: armada-37xx: mark EIP97 as dma-coherent

This commit marks the crypto engine (EIP97) on the Armada 37xx SoC as
dma-coherent to skip software cache synchronization.

> diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/bo=
ot/dts/marvell/armada-37xx.dtsi
> index 360fc24fdde22..8418777042b85 100644
> --- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> @@ -437,6 +437,7 @@ crypto: crypto@90000 {
>  				interrupt-names =3D "ring0", "ring1", "ring2",
>  						  "ring3", "eip", "mem";
>  				clocks =3D <&nb_periph_clk 15>;
> +				dma-coherent;

[Severity: Critical]
Could this bypass necessary software cache maintenance on the non-coherent
Armada 37xx SoC?

Unlike the Armada 7k/8k, the Armada 37xx SoC does not appear to support
hardware I/O cache coherency for its peripheral interconnect.

Adding the dma-coherent property to the crypto node instructs the DMA API to
skip software cache maintenance, such as cleaning dirty CPU cache lines to
RAM before DMA transmission and invalidating them before CPU reads.

The observed performance improvement likely comes from bypassing these
essential CPU operations.

Without cache maintenance, could the crypto engine read stale data from
memory, and the CPU read stale data from its caches, resulting in silent
cryptographic data corruption?

Passing testmgr selftests is a common false positive for this regression,
as small test payloads often happen to be clean in the cache or benefit
from incidental cache states during early boot.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524124456.3506=
59-1-olek2@wp.pl?part=3D1
