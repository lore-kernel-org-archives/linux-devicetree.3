Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E8A3D8103
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092859; cv=none; b=F48zK24MvswJK+cRsjqDR/FPj/tjGUZdy28CpriLqxAv94viR5e6XtVjZWldK3gm4SO7YouB+WQzZnhJXMo+Mts5WZhJZfTCNfVlLfH0V2EJ/ptb/22CK0X9A+q8JliixiXunohxR5qdBhwagIL5qe8pUBp7mlyavCmTV5BFc/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092859; c=relaxed/simple;
	bh=gWnLVZ5kLZflgh3wWyG8MgarIho/9eT4e1qBlekYKSY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bMo4JhTx45DvxOkHjp4uDGRTYD+IjY5oQsA6j2Ej6cf0lm/rswzglgC6WBqB3xMzahxiC/TNVSti/lXmk1dbkdU+rq2inOkWuyOLRYEEQhsUIG5LZ/5unh6Vl2Lhb1c0Ye55B7DQCl0zwv83sQMOILZ1E7gP8AZOYaK7ep83S2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZjw+WlI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZjw+WlI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F221F000E9;
	Fri,  7 Aug 2026 08:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786092858;
	bh=sYrGG5VW4pYrwj/jc3G+ehM19E6XZQLQ9aT1BVeJrjQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BZjw+WlIiZFhfsTDU0+I1Pg8bs/zmG190Hk2/joS9e43P/RzaS7ygvbzy0T4aeDf3
	 SlFuJLuPl4q3mOlJZxxQ2GMLkU3UV8O0j9UcZA7ffage8WoeKbBJgnMC5rQaoVPQx3
	 oyQZ0f5l432thbZvRJlnHr/vID+4VPwQXyYkYyBzBcKzg9JJzP9HiD/dn8cBCxbgVs
	 +UaNx84BAzwvfib5SFxsmw8uI/04nEWZ9XBMBVX9lcZXr3LC824Fymo1uB+IbEqwIt
	 7UaiY7U6B2flFQuyrH5rttdUgy8aYoUWZKZ6DExI9WPH6zfwSkPKvsDXdBJDbtkXTS
	 3l7xDACFrbaSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/22] arm64: dts: qcom: kodiak: Reserve low IOVA range
 for Venus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-13-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-13-3996f67e33f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 08:54:17 +0000
Message-Id: <20260807085417.72F221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Fatal parsing bug and NULL pointer dereference in `of_iommu_get_re=
sv_regions` when parsing `iommu-addresses`.
--

--- Patch [13]: [PATCH 13/22] arm64: dts: qcom: kodiak: Reserve low IOVA ra=
nge for Venus ---
commit c5c55dfe3f391bbec75ef2147bce3c7b4d05e83b
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: arm64: dts: qcom: kodiak: Reserve low IOVA range for Venus

This commit reserves IOVA addresses below 0x25800000 for the Venus VPU to
prevent SMMU page faults and spontaneous reboots caused by unhandled DMA.
It adds a reserved-memory IOVA reservation node and references it from the
venus node to keep IOMMU allocations above this boundary.

> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
[ ... ]
> @@ -198,6 +198,17 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>  			alignment =3D <0x0 0x400000>;
>  			size =3D <0x0 0x800000>;
>  		};
> +
> +		/*
> +		 * The Venus VPU reserves IOVA below 0x25800000 (600MB),
> +		 * primarily for non-pixel buffers using different Stream IDs.
> +		 * DMA into that range triggers unhandled SMMU faults and
> +		 * spontaneous reboots, so reserve it to keep IOMMU
> +		 * allocations above this boundary.
> +		 */
> +		venus_iova: venus-iova {
> +			iommu-addresses =3D <&venus 0x0 0x0 0x0 0x25800000>;

[Severity: High]
This isn't a bug introduced by this patch, but adding this iommu-addresses
property exposes a fatal parsing flaw in the IOMMU core layer that can panic
the kernel.

In drivers/iommu/of_iommu.c:of_iommu_get_resv_regions(), the loop parsing
the iommu-addresses property assigns the map pointer without validation:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
    maps =3D of_translate_dma_region(np, maps, &iova, &length);
    ...
}

If of_translate_dma_region() fails, it returns NULL. The code does not
check for this, meaning maps becomes NULL. The loop condition (maps < end)
then evaluates to true, and the next iteration will directly dereference
NULL.

Additionally, if the parsed phandle does not match dev->of_node:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
    if (np =3D=3D dev->of_node) {
        // ...
    }
    ...
}

The code falls through without advancing the maps pointer to skip the
current device's address and size cells. This causes the next iteration to
incorrectly read address cells as phandles, entirely corrupting the DT
parsing structure.

Is there any risk that this new configuration could trigger a translation
failure or phandle mismatch during device probe and hit these bugs?

> +		};
>  	};
> =20
>  	cpus {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-iris_iova_=
600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com?part=3D13
