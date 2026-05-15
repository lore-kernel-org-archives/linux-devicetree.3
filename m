Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9508E3FE647
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833428; cv=none; b=gGSOaWR8bwZjUKKvqgs7TuGXPFM8FFUWAhHmK5EzqOPH5BkOBIZab14BgB6dU3mJbq/INwv7pSR/afiM4AhqfkEI8Df6T/P1vNdpgBR1UK5cR7nn6hcCbOQClZXpTN0zCbNbtAlykBxuaGmjA3PkLGOcRwAqrGaFJHxF3uIiD+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833428; c=relaxed/simple;
	bh=+xSu2XzeSBwKyZz065leFnq7A9B/pwwQHZIEouB9+4Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AP3aUOk4Z9+LHcR+TdG8rMvPOiBmbXDPWi0WCG4/db4b4w3TmWPsH3vDx8D6CrSukD2IHeLDjMrkLFNeGhb71jvzJ88XLaT2+VXOdbdFNmYEj4Ms3ts93Yucw60KC43fNb1zj8jraCqet3PDEkMsU3uu+8uXfGKW3P71SaQ4xQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d35NBLJd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d35NBLJd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE17C2BCB0;
	Fri, 15 May 2026 08:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778833427;
	bh=+xSu2XzeSBwKyZz065leFnq7A9B/pwwQHZIEouB9+4Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=d35NBLJdEwXxTf9R3TVY6PJ5DN0dJaDDaPb43TsBU2hl3x66lHKl03/JTsMkTFlmv
	 rbj6ryASN12C08R7tWen+AVBG9zCPOSIPP9f6fwb5s1CfIVT9ZqSK3Hwdr/piDee/t
	 sYyIfwCE/0MSV1gxtoKAAEJqtTayUd/fpSffeOo0CjLRZ2AiCvHyC0lQ60j/UYM89b
	 Rj9d2ig3SDnuzEuho3VYd/BWxMfncUF2A1bG32mQEmM8ho8LlvbLAvJqfN830GpjQ6
	 hPqSPawKjDij3a8kd2aD8yPPGPYjJCI+2OjoOKC5q1njNO9ZplaqNWXYMI/bWRyov3
	 jpPhKjozggGPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: socfpga: Add dma-coherent to XGMAC
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515080014.6260-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260515080014.6260-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 08:23:46 +0000
Message-Id: <20260515082347.5AE17C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing dma-coherent property on other SMMU clients causes data co=
rruption
--

commit be9ce7db4922ed7d48488efa182130301cfa9435
Author: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

arm64: dts: socfpga: Add dma-coherent to XGMAC nodes

The commit asserts that SMMU transactions are cache coherent and adds
dma-coherent to the XGMAC nodes. This prevents redundant cache flush and
invalidate operations and potential stale data issues.

> The SMMU is enabled and transactions going through it are cache
> coherent. Add the dma-coherent property to the XGMAC nodes to prevent
> redundant cache flush/invalidate operations and potential stale data
> issues.

This problem wasn't introduced by this patch, but the patch provides an
incomplete fix.

The commit message asserts that "transactions going through it are cache
coherent" and correctly notes that missing the dma-coherent property causes
"potential stale data issues".

On ARM64, if a hardware-coherent device is treated as non-coherent, the ker=
nel
will execute cache invalidation (dcache_inval_poc -> dc ivac via
arch_sync_dma_for_cpu) for DMA_FROM_DEVICE transfers.

If the device wrote data directly into the CPU caches, the dc ivac instruct=
ion
will discard those dirty cache lines without writing them back to RAM. This
destroys the DMA writes and causes the CPU to read stale data from memory,
resulting in reproducible data corruption.

If the SMMU provides coherency for all transactions, do other major DMA
masters that also route through the SMMU need the dma-coherent property?

For example, usb0, dmac0, and dmac1 use the SMMU but lack the property:

arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:
    usb0: usb@10b00000 {
        ...
        iommus =3D <&smmu 6>;
        ...
    };

    dmac0: dma-controller@0 {
        ...
        iommus =3D <&smmu 8>;
        ...
    };

    dmac1: dma-controller@10000 {
        ...
        iommus =3D <&smmu 9>;
        ...
    };

If coherency is specific only to XGMAC, could the commit message be clarifi=
ed
to avoid a blanket statement about the SMMU?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515080014.6260=
-1-muhammad.nazim.amirul.nazle.asmade@altera.com?part=3D2
