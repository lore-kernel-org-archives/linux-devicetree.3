Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16C633D6F9
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 18:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778264426; cv=none; b=huGe9rIpJbYp4dOlraG3XY3fFK6ikfI3t/WBxDtNeRzPipcXsmo4DB8CnpyQYsz3eX3bqBCwuNtqdvjexW1ceyLUIatb8+E9Lasf0N3zQH6vwS0EF/9lMh3ugjPOBi7L1/9zQcbGlJ24EPEC7LWDHbZUPaP6GpbPEYcpmDi191c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778264426; c=relaxed/simple;
	bh=alPG3jkQoe6Nm4fq8IOyetUaLyaueZcH6TWNe2irPbw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YQzkoxI5dbgaX1bhi/AxJgSbr0qAzMDDG4ShNUK6nJBtceTs6aSqbCzyezmz7yhtvgCvYihDjXC/bl2R0bwa5t6V7qAZbzq6qiQTWZRH/aDnIQEZX8oPPNct+GN/uiO1Zd90aVDkp6YTHTsvoXQyjdtKzIgZWzow5C20fW7Jpx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPRgxEAM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPRgxEAM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22146C2BCB0;
	Fri,  8 May 2026 18:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778264426;
	bh=alPG3jkQoe6Nm4fq8IOyetUaLyaueZcH6TWNe2irPbw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=gPRgxEAM569p5cshyEjunOaxgkcu6bFpMyvr/a9Xsm84PyUMt0/p2XIwgdNqZ9w2Q
	 8vQljREtTNRGWZlBEncjMP9husiD4gTlEPb+gkC/8x5ic15eRnvw47odc8EzsR0OEV
	 WDd4LjlChrlDR4s2PF4W+qkHqDwe+1RUBrcObLdYCnR0/28jVRhr455n/6RvDybqSz
	 SVhGYhFhh1CSjOfI/XoppoYgk0ZLxeyt/cE/OrhuTAwS4dmVuvK4dX4YVcid3y63cM
	 1BVlgi82oksJ3pBMY7Ay5JjzM8yyOpl3AEdZ8rwUXROVKwoIvSCuHQdvDHkn52nz+U
	 D35vaDLba4/FQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/8] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
Reply-To: sashiko@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260507-block-as-nvmem-v2-5-bf17edd5134e@oss.qualcomm.com>
References: <20260507-block-as-nvmem-v2-5-bf17edd5134e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 18:20:25 +0000
Message-Id: <20260508182026.22146C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] of_get_mac_address_nvmem() corrupts the output buffer on failure, =
causing network drivers to use invalid MAC addresses.
--

commit dfaa504d49a935a1aa8c630022d2ce8a6b303cce
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

net: of_net: Add of_get_nvmem_eui48() helper for EUI-48 lookup

Factor out the common NVMEM EUI-48 retrieval logic from
of_get_mac_address_nvmem() into a new of_get_nvmem_eui48() helper that
accepts the NVMEM cell name as a parameter.

> diff --git a/net/core/of_net.c b/net/core/of_net.c
> index 93ea425b9248a..79b289de0f16a 100644
> --- a/net/core/of_net.c
> +++ b/net/core/of_net.c
[ ... ]
> @@ -75,27 +72,53 @@ int of_get_mac_address_nvmem(struct device_node *np, =
u8 *addr)
>  		return ret;
>  	}
> =20
> -	cell =3D of_nvmem_cell_get(np, "mac-address");
> +	ret =3D of_get_nvmem_eui48(np, "mac-address", addr);
> +	if (ret)
> +		return ret;
> +
> +	if (!is_valid_ether_addr(addr))
> +		return -EINVAL;

Does this change inadvertently clobber the caller's output buffer when an
invalid MAC address is read?

Before this patch, of_get_mac_address_nvmem() only modified the output
buffer if the NVMEM-provided MAC address passed is_valid_ether_addr().

Now, it calls of_get_nvmem_eui48() which unconditionally copies any non-zero
6-byte value into the caller's buffer, and only then checks
is_valid_ether_addr(addr). If the MAC is invalid (e.g. multicast or
broadcast), it returns -EINVAL but leaves the invalid MAC in the caller's
buffer.

This can break existing callers that rely on the buffer remaining unmodified
on error. For example, in drivers/net/ethernet/freescale/enetc/enetc_pf_com=
mon.c,
enetc_setup_mac_address() initializes the buffer to zeroes, ignores non-def=
er
errors, and falls back to a hardware or random MAC if the buffer is still
all-zeroes. Because the buffer is clobbered with a non-zero invalid MAC,
the fallback is bypassed and enetc_set_si_hw_addr() programs the hardware
with the invalid MAC.

Similarly, in drivers/net/ethernet/renesas/sh_eth.c, read_mac_address()
checks if the buffer is non-zero to decide whether to read the MAC from
hardware registers. Clobbering the buffer causes the driver to skip the
valid hardware MAC and instead fall back to a random MAC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260507-block-as-n=
vmem-v2-0-bf17edd5134e@oss.qualcomm.com?part=3D5
