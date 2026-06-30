Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9B334C9AF
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 08:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782809764; cv=none; b=SbaTEdgyCD4fYIOB8AhQcSha00sZDjYqfdK+jjanOqn2sbH+XKmvVa8gO5QgWisQHpwwyibJ1w0CaKFHkFCLlLAqa2DY16d7P/B+cdhcHtXP7Kw2cHBznWLC3iFcOAPRaGJ28sg6PZHk24qi4mAv/rADbqaZrdRUxPMEzxXFZE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782809764; c=relaxed/simple;
	bh=2OSMAONc9ew6BBDAFgsMrjiVWVD6noTf51uUIwirWl0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uimQ1zNvgqJUiqS2n164jaiF4VjiAoakQoeOTEBAmEoJl5VxHYF3rsWJBRMM6xO3vJJyNawKxsbAQNJG0O+zMgjTV/5a4t0+4LxpXeFYW2BSd0tiv3Ks8qPZXt2eeCnBnaFJho/sPxLkF8dgMQxm/3EmCI+yS+eS9M6olyNV2q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sbsn8vvF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sbsn8vvF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77AB31F00A3A;
	Tue, 30 Jun 2026 08:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782809761;
	bh=Sgx7UoEhgUa9haERmuxWFAQrtrFbtPxaVXkr+pUaGmg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sbsn8vvF/wz+t9CSA/MpNAC10kb3aIXKN40uNybC2RKceOLT58lOmlhwaR+vmP2O2
	 OqWemA64GUqkJyoQnyMb+y1XeA9gk/or7UIP3NRbdImzL1oc71QsemR7ZGufyFg7ej
	 fRlXCnfQJSFUUn51TDyJZpIFxBNJqwKoebagaVlnEmFtwayWd+qRWcqy7I+l0cbyDt
	 9lja0b6URQdWoLJAfbRmiWgZYNjjFhzwqRrSCDiQBBFQYsty6cZVxypjBeCVOQEN+u
	 oGNk4awENQtDMlmW7Wu1EyLDkpA3p3NGlamw9HXmsch0GTLczi24U6X7nekIsBdE5W
	 EIwVp31IKaDSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/9] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260629-block-as-nvmem-v6-6-f02513dcd46d@oss.qualcomm.com>
References: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
 <20260629-block-as-nvmem-v6-6-f02513dcd46d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 08:56:01 +0000
Message-Id: <20260630085601.77AB31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Replacing memcpy() with ether_addr_copy() imposes an unsafe 16-bit=
 alignment requirement on the caller-provided addr buffer, which can trigge=
r unaligned access faults (kernel panics) on strict-alignment architectures.
--

commit a4898c618dc4fdc91885d4184cdfd51af73fa946
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

net: of_net: Add of_get_nvmem_eui48() helper for EUI-48 lookup

This commit factors out the common NVMEM EUI-48 retrieval logic from
of_get_mac_address_nvmem() into a new helper. The original function
is updated to call the new helper, preserving the lookup behavior.

> diff --git a/net/core/of_net.c b/net/core/of_net.c
> --- a/net/core/of_net.c
> +++ b/net/core/of_net.c
[ ... ]
> @@ -75,27 +73,54 @@ int of_get_mac_address_nvmem(struct device_node *np, =
u8 *addr)
[ ... ]
> -	memcpy(addr, mac, ETH_ALEN);
> -	kfree(mac);
> +	ret =3D of_get_nvmem_eui48(np, "mac-address", mac);
> +	if (ret)
> +		return ret;
> +
> +	if (!is_valid_ether_addr(mac))
> +		return -EINVAL;
> +
> +	ether_addr_copy(addr, mac);
> +	return 0;
>  }

[Severity: High]
Will the use of ether_addr_copy() here cause an unaligned access fault on
strict-alignment architectures?

The original code used memcpy(), which handles unaligned destination pointe=
rs
safely. The ether_addr_copy() function requires both source and destination
pointers to be 16-bit aligned.

While the local mac buffer is explicitly aligned to 16 bits in this patch,
the destination addr buffer is provided by the caller. Callers like
of_get_ethdev_address() often allocate a 1-byte aligned array on the stack:

of_get_ethdev_address() {
        u8 addr[ETH_ALEN];
       =20
        ret =3D of_get_mac_address(np, addr);
        ...
}

Could this lead to kernel panics during device probe when the stack-allocat=
ed
addr buffer happens to be unaligned?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-block-as-n=
vmem-v6-0-f02513dcd46d@oss.qualcomm.com?part=3D6
