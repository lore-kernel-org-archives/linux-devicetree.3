Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3243CF1ED
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 06:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442743; cv=none; b=A0I/N6XqVnXnW6N9XMs3qS9FbeAsJP2LU/byS/FqtvJH+q+SVgVhrC4hT1OmyFvYYYeJ3BE27Ltkj1Izlni1tjB+2oui5qTv+oHx80tHaVlakYOWcEIKxb44p+nXhRxMWYNNmdSWcqHm43s0rUJoZMZHUX+pCzplVeDnGsL1f1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442743; c=relaxed/simple;
	bh=i4CfWGg5ZZsSIucVQfSLcWgnBCILp2ocjteAFudO3RA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dn2+ptnRcnSdiFRNFF4+z12F7BeQbszIj2YNDJNrlus0k9shr3shmHS4WVxju2dWG4yaxFG3sjbFsiqigq0jJUHjQ6ZTCKKJjnH9E9Hyn9AEcrdhU+fpvcIM8lB9HDv4CSR5m/jHYnG8mOHbroVCGpjj8sTg5KdmE/uEw+WXJwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbsE2Fq8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbsE2Fq8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5068E1F000FF;
	Thu,  8 Oct 2026 06:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791442741;
	bh=vHF0H1OVMZt6bnzmq9Bre6I8JwOC0pFqoLsIybzp9oQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nbsE2Fq8AmaQtANhz5sKB1nltJpiowJtKHUkvTWbd6i/cz/w1btJJ6xkjSr8hd0Zg
	 jOA+F5/3y7eOt+PvYU4Z0pg3MfIw4hZHg3x35LnnKtrYVjHT5cQ1ki2gi71WMn3SeX
	 vu2RWZ91KaOJ52B5By89w5CAESza9IevzVPHBqbN5DbSsjUEelXE4ANSnLzzaJsAQf
	 uItD8ol5AU0d7FHjVH6pvH6P/YbVgvU0DIhrDOyZ+Wvyc/L4vjTTxrzJc4rY2WFaMS
	 UMLG6BDEmM7IcjSLRJr154YiPClKcCRGffzeFZ8thKehIzjPrlpV6F7I4IKONgJZMI
	 vn2fcGhVdMFaQ==
Message-ID: <sashiko-outbox-163723@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/8] arm_mpam: Support MSC accessibility derivation
 from RIS nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yin Li" <yin.li@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-7-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-7-35196c2b43bf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 06:59:00 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm_mpam: Mismatch in RIS node iteration causes childless MSC node=
s to fail probe
--

commit 6ccd46129e50bd63d07916d508a9533280b06972
Author: Yin Li <yin.li@oss.qualcomm.com>

arm_mpam: Support MSC accessibility derivation from RIS nodes

This commit adds a per-RIS fallback path for resolving an MSC's CPU affinity
when the parent node does not provide an affinity hint. It factors the
device tree specific logic into mpam_dt_update_msc_accessibility().

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_device=
s.c
> index 048d32e69f55f..80157b819c3d1 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c

[ ... ]

> +static void mpam_dt_update_msc_accessibility(struct mpam_msc *msc)
> +{
> +	cpumask_t *affinity =3D &msc->accessibility;
> +
> +	cpumask_clear(affinity);
> +
> +	if (get_cpumask_from_parent(msc, affinity) =3D=3D -ENODEV) {
> +		for_each_available_child_of_node_scoped(msc->pdev->dev.of_node, ris) {
> +			if (get_cpumask_from_ris(ris, affinity)) {
> +				cpumask_clear(affinity);
> +				break;
> +			}
> +		}
> +	}
> +}

[Severity: High]
Does this code introduce a regression for MSC nodes without child RIS nodes?

In mpam_dt_parse_resources(), childless MSC nodes are supported by explicit=
ly
using the MSC node itself as the RIS if no children are found.

However, in this new fallback path, if get_cpumask_from_parent() returns
-ENODEV and the MSC node has no children, the
for_each_available_child_of_node_scoped() loop will not execute. This leaves
the affinity mask empty and causes the driver to abort the probe since the =
MSC
is not accessible from any CPU.

Additionally, does this loop iterate all child nodes without verifying they=
 are
actually RIS nodes?

By not checking for a reg property, any non-RIS child node could cause
get_cpumask_from_ris() to fail, which clears the affinity mask and spurious=
ly
aborts the probe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-mpam-resct=
rl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com?part=3D7
