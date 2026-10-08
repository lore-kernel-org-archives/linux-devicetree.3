Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2C13B05A7
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 07:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442838; cv=none; b=YUPNg48zbX6m2XII6rA1yOQHvaUTJgNDzAAraVg0h7Horqd5Xa5q9Rq2UWTSYDAFC6jo+Kq/6Rp++S9atZ/dGUE3Q7ZHJgQ/QkLErdqK7RgeFPncyEPW1F9nAbSkEz20EkDIh5hugUCwu0Wk9GXokDwR5w6hNsoIiSDh6uryyj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442838; c=relaxed/simple;
	bh=8dSJ1r5qXSUaTbgWWIgyB/DRu1Sktmw284OLKfPpuJ8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kjYYx0wVB80Y4QH/J+vjn+GR/vO1y2W+GdYj8huRnDy9r1DtuE/nMuDinklVMqsQtBN60FOmGuDbS+TF7sem7BgJDakjaRCiHgHaTeSeyE07tHLkSvedZwVvisNBI24VDWt+ItRslsklVNif/yFRcrygXF0tGnqWZUsjmsevTGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFTbcUxS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFTbcUxS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E401F000FF;
	Thu,  8 Oct 2026 07:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791442837;
	bh=G+qCDnXYxyLmfgP7zHF90OyrgC4lSqYkD/VAv6ugdiY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JFTbcUxSKuYRTheFGWTt5oGbHNACkKvtMXt8Ew5n9/+6lnULXyGcTdrI1CHGgSBb/
	 RVqBUC5ll/dVn+TFb4TF2EoBzjfQyjJQNKsEeia9zx3P8SZTxRgS0GNW2aQsjUqLrs
	 0MMB+fcGY33Ye9kjhQZ86EIZ1ytQoFAC1x+clDkhqe5bfk80SQOpNujAlIgT6dHGgR
	 B1009JsMQHKsTZhmrVCGy+gNKONHdyk9Rf2l4aXGG+BgOrVpoYBVtxEJbJLxWMk1N/
	 97IqBgvj8SWN+f0ekNLGmhLApuEeNbUi0CUhblluREa+ccAA8MLYtITaZ4uH6Binoq
	 WvwzG8I9mEwzQ==
Message-ID: <sashiko-outbox-163726@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/8] arm_mpam: Add support for memory controller MSC
 on DT platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yin Li" <yin.li@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-6-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-6-35196c2b43bf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 07:00:36 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] of: memory controller MSC probe failure due to incorrect DT compat=
ible match
- [High] arm_mpam: memory controller MSC accessibility mask left empty due =
to invalid 'memory' compatible check
--

commit b661da0a277e50a0881896ca5067c92dd25c983b
Author: Shanker Donthineni <sdonthineni@nvidia.com>

arm_mpam: Add support for memory controller MSC on DT platforms

This commit adds support to discover memory-controller MSCs from the device
tree. It derives the component id from the NUMA node, creates a memory class
RIS, and treats a memory parent as accessible from all CPUs.

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_device=
s.c
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c

[ ... ]

> @@ -2169,6 +2192,8 @@ static void update_msc_accessibility(struct mpam_ms=
c *msc)
>  	} else {
>  		if (of_device_is_compatible(parent, "cache"))
>  			get_cpumask_from_cache(parent, &msc->accessibility);
> +		else if (of_device_is_compatible(parent, "memory"))

[Severity: High]
Does this compatible check actually work for memory nodes?

The of_device_is_compatible() API strictly matches the provided string agai=
nst
the compatible property array of the device tree node. However, standard
Device Tree memory nodes are identified by device_type =3D "memory" and do =
not
have a compatible =3D "memory" property. Additionally, vendor-specific memo=
ry
controllers do not include the generic string "memory" in their compatible
lists.

Since there is no valid node in the kernel with compatible =3D "memory", wi=
ll
this check unconditionally fail?

If so, it appears the driver will fall through to the else branch, leave
msc->accessibility uninitialized (empty), and cause the probe to return
-EINVAL, permanently failing the initialization of all memory-class MSCs.

> +			cpumask_copy(&msc->accessibility, cpu_possible_mask);
>  		else
>  			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-mpam-resct=
rl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com?part=3D6
