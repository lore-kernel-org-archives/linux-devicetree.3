Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470993;
	b=0nO5cQ2gJd2DksMkyOPhLlBFdFHs0Ek59RNjaPyJyOvD7wG4/YD7GrbqGV3RswM+G6VC
	 IVWYY5IBJWvxit1duUBulABXhgQREkR41Mx1zE7NMRw3mXlQxhbzLIk3ea/T3bTm428uG
	 leYW942FLU2SAeumvvo+R3D5bx6En7P3txhBtVZny4+nR6RDn0NV9/5FF22A151Rm/hGK
	 h+QIKwDzgz5qlXd8IU2WGPKEcInxQZiRoKgmxlmG4X1230S2/W4wOgSC5XMz5SYuILhnd
	 GMvzQzoUrpcFU5/Q0G5/X79DZDkKT0J02EcopAK7JCQ/PjXO9hyEflepVk+rK4FN7fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470993;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=uOViL6s1ZH3I4W/r3A50yJP31I+R+h3vMj5i5mSRSr0=;
	b=DBjFAv4oqf3Qxon3e0kYoXcym0A6s/5lDNl0Nv11vVMkDT8vUwewCLhHjDwZjj06PO5R
	 SQkGr1Z0eDin3+auWaa2/Tn/6scweJXUgSftyItqFG5ZFqrhYyV68y2NoLFTz9qdGd6h3
	 QHKco1cQdnPbvSaWzz1+nOdzv28wZq5LJqsIICVE/1sAsn/ybNqsrj0+q8DyCTyADIU9X
	 F8Kf561EBd28NWf69cDKbuBIhzUtAsbJQzYsVWrkkBZvXJSN3v5lxQuzMotnxunHdJiz2
	 uynwGNGZvneWltFc2JVOkD1jDhE+BrRdqKsCPxSlSZvUwoO6sZIDtgRkMzWeLHekYwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oHDB07x0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89335606A31E;
	Mon, 23 Nov 2026 21:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oHDB07x0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A2DC1F000C0;
	Mon, 23 Nov 2026 21:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795470993;
	bh=uOViL6s1ZH3I4W/r3A50yJP31I+R+h3vMj5i5mSRSr0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oHDB07x0IeuPsdAU32f0RWYDNf6TxYIFLnTE+u5CtJaLY85OuRViUqypjn4sZ54tl
	 eaL/D9cbQaY1Z9U9k9jcXs+mj4qkH6jED7RQe943m3B2fZUeerWK2mhdF9DZxXy/hP
	 JwiH3dMQG1xWLevaaKMEDotcsaEb4ifG+t7FQg5VwByw8/MuqliYq6Df9VYcEA6Cfy
	 VzxW0LaHijUV42sSFMP+5WAkhvM7wXCcunZABwaHQDNif4rmcJYx4UaHnZDoQk359N
	 jzYB5nUAXyLEgbyNIqDOuIH6CwxQ4P9fElnzLptPt44YBy86w++rFDEVXKDDi/26mD
	 lLiWEYxa6eG6Q==
Message-ID: <0391e09d-3d44-4f91-8cad-dbfe8d4741d5@kernel.org>
Date: Mon, 23 Nov 2026 21:56:29 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] nvmem: core: Let read post-processing return a
 shorter length
To: Alexey Charkov <alchark@flipper.net>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ryan Leung <untilscour@protonmail.com>,
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
 <20261123-rk3576-otp-cpuid-mac-v3-2-40c756dcf36f@flipper.net>
From: Srinivas Kandagatla <srini@kernel.org>
Content-Language: en-US
In-Reply-To: <20261123-rk3576-otp-cpuid-mac-v3-2-40c756dcf36f@flipper.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/23/26 3:35 PM, Alexey Charkov wrote:
> A cell can hold data from which a provider derives a shorter value for
> some of its consumers, while others still need the raw cell content. A
> CPU ID which serves as the base for MAC addresses is one example: the
> MAC address consumer needs six bytes, whereas anyone after the ID itself
> needs all of it. The post-processing hook has no way to express that,
> as the reported length is always the full cell size, and consumers such
> as of_get_mac_address() reject anything but the exact length they
> expect.
This is the correct behaviour.
> 

nvmem cell fundamentally has cells that are fixed size during creation.


> Let the hook return the shortened length of its output instead of 0,
> and zero the buffer beyond it, so that a caller ignoring the reported
this looks like workaround.

This behavior should be inside the provider not in the core.

--srini

> length sees no leftovers of the raw cell. Reject a length beyond the
> cell size as a bug in the hook. Every existing hook returns 0 on
> success, so their behaviour does not change. Clamp the sysfs cell
> attribute read to the reported length, as it can now be shorter than
> the attribute size.
> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  drivers/nvmem/core.c           | 17 ++++++++++++++---
>  include/linux/nvmem-provider.h |  8 +++++++-
>  2 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index d976c0d6603b..dde77f78e109 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -384,7 +384,8 @@ static ssize_t nvmem_cell_attr_read(struct file *filp, struct kobject *kobj,
>  		goto destroy_cell;
>  	}
>  
> -	read_len = min_t(unsigned int, cell_sz - pos, count);
> +	/* Post-processing may have left less data than the attribute size */
> +	read_len = pos < cell_sz ? min_t(size_t, cell_sz - pos, count) : 0;
>  	memcpy(buf, content + pos, read_len);
>  	kfree(content);
>  
> @@ -1647,6 +1648,7 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
>  			     struct nvmem_cell_entry *cell,
>  			     void *buf, size_t *len, const char *id, int index)
>  {
> +	size_t out_len = cell->bytes;
>  	int rc;
>  
>  	rc = nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
> @@ -1661,12 +1663,21 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
>  	if (cell->read_post_process) {
>  		rc = cell->read_post_process(cell->priv, id, index,
>  					     cell->offset, buf, cell->raw_len);
> -		if (rc)
> +		if (rc < 0)
>  			return rc;
> +
> +		/* The post-processor may have shrunk the data: drop the rest */
> +		if (rc > 0) {
> +			if (WARN_ON_ONCE(rc > cell->bytes))
> +				return -EINVAL;
> +
> +			out_len = rc;
> +			memset(buf + out_len, 0, cell->bytes - out_len);
> +		}
>  	}
>  
>  	if (len)
> -		*len = cell->bytes;
> +		*len = out_len;
>  
>  	return 0;
>  }
> diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
> index 6063fe5b7784..a95529aa3e80 100644
> --- a/include/linux/nvmem-provider.h
> +++ b/include/linux/nvmem-provider.h
> @@ -20,7 +20,13 @@ typedef int (*nvmem_reg_read_t)(void *priv, unsigned int offset,
>  				void *val, size_t bytes);
>  typedef int (*nvmem_reg_write_t)(void *priv, unsigned int offset,
>  				 void *val, size_t bytes);
> -/* used for vendor specific post processing of cell data */
> +/*
> + * Used for vendor specific post processing of cell data. Returns 0 if the
> + * data keeps the cell size (the cell's bytes, not the raw length passed in),
> + * the length of the processed data if it ends up shorter (1 up to the cell
> + * size), or a negative error code. The core zeroes the buffer beyond a
> + * shortened length. An empty result cannot be reported.
> + */
>  typedef int (*nvmem_cell_post_process_t)(void *priv, const char *id, int index,
>  					 unsigned int offset, void *buf,
>  					 size_t bytes);
> 

