Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D873838DC7F
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379642; cv=none; b=ZRg7uEN/ndXCmDb+NMExeZfVZk8O+xkwH56lgJSwP5iZl+5K+4X763TQLCHrK63VFGqatXCkoQgsRrMeQUR4prCW1ayqd/hphPXrqVDtmXfI0dsDJlyFn0ajVLDCRxA3NJyn4y4duZbm0/e065Eaci2y/yybdvhBip2JYwn9iVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379642; c=relaxed/simple;
	bh=AeR+Fc2WZUrweCJjFsVVC88PiauJVulMi4UtDyDQXZ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SIQngwypH2RerZ4XrwhtVWxtdrmGiD6p2KEmse1l7alm6GF+3X3EqfwPFSQUjnKvAcRQbRR40GkyRJ2tBAxNssHFr4IpHOlmhfvSSoNLmNTO3KDcwqKNCpy/0rhdHC4BFWEVcKRdDzJqmwW9Di9tkBxgjWuP/4IKXetftCDjWCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCXxd94n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCXxd94n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605241F000FF;
	Mon, 14 Sep 2026 09:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789379640;
	bh=KBGoyF0iRf5IRxtFiHCtpdh32s6f9jRF5dafkYjF+38=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bCXxd94nOIAqoW+L2XNW48tjmjx8iVJHDLzB+nuMNcW7IAw6+cF+3vVUQSTQCPvXx
	 eu7VF97Rzc01aCxT8/M6yP0d3qKAe6S6i/XUEQdLZozo5fu2MlOOyW36P+ivgQPQ0k
	 gS0J3zkAVNzd78pBCSytamF1HLpOEFut8PoP9T+9DGTff27QQrUbsVry9/ygjQmubB
	 Ddd+IUHipie0tNqmcDCA1+61brmMBuN0gvQmhJHIxSSrWAfq55UP+yrpAIdSvmRdFK
	 iWrEoGgt4EsQIzpadw8WdwCOD0EoO1/y6B5LUyBysLKH3fymFRalOrLDksiO2+jWlp
	 ZeKpa0dSNZlKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 06/10] arm_mpam: Add support for memory
 controller MSC on DT platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yin Li" <yin.li@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-6-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-6-bf6645bb2f65@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 09:53:59 +0000
Message-Id: <20260914095400.605241F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] MSC accessibility check incorrectly expects a `compatible =3D "mem=
ory"` property on memory nodes.
--

commit 3f17020c0e184511d652322d8f22e5c44705e815
Author: Shanker Donthineni <sdonthineni@nvidia.com>

arm_mpam: Add support for memory controller MSC on DT platforms

The MPAM DT path only handles cache MSCs. Memory-controller MSCs
cannot be probed yet. Add support to discover memory-controller MSCs
from the device tree and treat a memory parent as accessible from all CPUs.

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_device=
s.c
> index 7a5b27e877594..480e38cfa86dc 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
[ ... ]
> @@ -2169,6 +2192,8 @@ static void update_msc_accessibility(struct mpam_ms=
c *msc)
>  	} else {
>  		if (of_device_is_compatible(parent, "cache"))
>  			get_cpumask_from_cache(parent, &msc->accessibility);
> +		else if (of_device_is_compatible(parent, "memory"))
> +			cpumask_copy(&msc->accessibility, cpu_possible_mask);

[Severity: High]
Does this correctly match standard Device Tree memory nodes?

Standard Device Tree memory nodes do not use a compatible string; they are
typically defined by device_type =3D "memory" or by their node name (e.g.,
memory@...).

Since of_device_is_compatible() performs a strict string match on the
compatible property array, it seems it will return 0 for standard memory
nodes. This would cause the accessibility mask to remain empty, preventing
memory controller MSCs from acquiring their CPU accessibility masks and
breaking their initialization.

Note that while this logic is refactored into get_cpumask_from_parent() and
get_cpumask_from_ris_phandle() in patch 9 ('arm_mpam: Support MSC
accessibility derivation from RIS nodes'), this issue remains uncorrected
through the final state of the patch series.

>  		else
>  			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-mpam-resct=
rl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com?part=3D6
