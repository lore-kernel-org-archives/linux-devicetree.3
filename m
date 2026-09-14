Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABF3414A20
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379946; cv=none; b=Z9wgLDFcs6TCuDnXC/VSMhPYfJAzmza2lFhj5hoLuBj7u8AEpJleNeQjUkSs9iWQiQ19b92fAJvmVTUZNHk0FO4XgtZO2zBMqCoQ28PJJ5Mg3/jql/qphLhFKayA0IOo0vovkSyV3YIdpLcQ9XiYIqxGtgssdxggj6G5Mw4wvsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379946; c=relaxed/simple;
	bh=ylPAb5+2kFRl0QTVyUdlklN8vBcS5PjmNvU9sAb4Lew=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rrWoXDq66Sc+60z/m05/vn/r7kQ+P+aT2Zi+01gy+lSTr5yc72ZTNeijjz4X5F3TxH9MQm5s7jvnjh0EhWou7xnzIgO0MRqafIrNu2I98cC4T+X/9IvC+ceNcyVV19AfMypDu9SntqqTVFQNxZY086zqyX6TobL+CuKjdSp0OWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMoNjEaP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMoNjEaP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432361F000FF;
	Mon, 14 Sep 2026 09:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789379944;
	bh=kNaEukcuuXIrs17BlAkJB8GhGaGntSpOQ9b0Y62pOh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AMoNjEaPEM3iafIPE/tSJCC14gJtFWcjdTeX+h0Mu2amre6qzPDguBLLJaqyaCiAp
	 xCshEa+ENVq/rGzGpR7gPAwAY2G7LFUi3yJX0C88rG7TSF918h6qJlYRtVjp/r8h+s
	 vfeZNdtTldwQa2QEU7/h1M90U1ueAaQckstAHXcn4gHOaxw6Tiq7PkCLUQ4PlBbsZ0
	 xYOXUYdixUj73bVvwonukanV4QtLR6TWJYb02ZD3u0EAfvnnIP+bJiDTSVLVXnFNBU
	 pldfMpAaVioATpnMLWSTzQ8IW5+pIWw/gaZ4z+Tn7UAIQneliJosNwYVX33R4kpFH1
	 oMREhRrxw+65g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH DNM RFC v2 10/10] arm64: dts: qcom: kaanapali: Add MPAM
 MSC nodes for the L2 caches
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yin Li" <yin.li@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-10-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-10-bf6645bb2f65@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 09:59:03 +0000
Message-Id: <20260914095904.432361F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Moving CPU cache nodes to the root of the DT to act as memory bu=
ses violates devicetree architecture and topology guidelines.
- [Medium] The patch merges a DTS example that the author explicitly stated=
 is not intended for merging.
--

commit f6c1db4f30b0478f01fb8ab1a9aacf8a8f1f03a0
Author: Yin Li <yin.li@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: Add MPAM MSC nodes for the L2 caches

This commit adds MPAM MSC device nodes for each L2 cache in the kaanapali
device tree. The L2 cache nodes are moved from the CPU nodes to the root
of the device tree, gaining memory bus properties like ranges to allow the
MSC devices to be nested under them.

> The nodes are disabled by default. Production firmware does not expose
> MSC register access to the OS, so these nodes can only be enabled on a
> local test setup where firmware permits direct MMIO access to the MSCs.
> This DTS is therefore only an example for other platform DT authors and
> is not intended to be merged.

[Severity: Medium]
Is this patch intended for the production tree? The commit message explicit=
ly
states that this device tree is only an example for a local test setup and =
is
not intended to be merged, so applying it would pollute the production
hardware description with dead test code.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
[ ... ]
> @@ -531,6 +519,44 @@ soccp_smp2p_in: slave-kernel {
>  		};
>  	};
> =20
> +	l2_0: l2-cache-0 {
> +		compatible =3D "cache";
> +		cache-level =3D <2>;
> +		cache-unified;
> +		cache-size =3D <0xc00000>;
> +		ranges;
> +
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;

[Severity: Medium]
Does moving the CPU cache nodes to the root of the device tree and treating
them as memory buses (by adding ranges and #address-cells) violate
devicetree architectural topology guidelines? Typically, logical cache nodes
reside within the /cpus hierarchy rather than at the root of the physical
address space.

> +
> +		msc@19870000 {
> +			compatible =3D "arm,mpam-msc";
> +			reg =3D <0x0 0x19870000 0x0 0x10000>;
> +			arm,not-ready-us =3D <1>;
> +			status =3D "disabled";
> +		};
> +
> +	};
> +
> +	l2_1: l2-cache-1 {
> +		compatible =3D "cache";
> +		cache-level =3D <2>;
> +		cache-unified;
> +		cache-size =3D <0xc00000>;
> +		ranges;

[Severity: Medium]
Similarly, the second cache node is moved to the root to act as a bus. Does
this distort the device tree topology?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-mpam-resct=
rl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com?part=3D10
