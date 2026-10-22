Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689660;
	b=bChY+Q7t4igHSRVlqNqhLmkSd+bGMKeBYi+y7eWBpl/Urz3LDFCgbilzX/PWCEYtbVmU
	 xlSOh3ZEMsjcuDIGUto82pVAIEBn6qYhUg6TuOEjXnmLmZPkqYtzGbo2Z63LodpDDhITQ
	 pPFvtA5ZfkcM7GISleZUXoER0mWRv9BdBwn2TIaALAkwqkmlQ1SsEHF86o/aB8ndKDcfU
	 w+RSteo6P8nsQjtjvaeKuwx9ju+xxSWskY11c0oeRttgYJnxxIcPawBZCfq/ZQG0chkEO
	 3WnAGfOcV8YYF0U01QOeCnEG+VXpCHtEt3E+0ELEiWokj5Baoo7IQjU/O9Q7E/ZgT0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qSKC6LmTr8AlslSEV3eV/HjwmhQt0Co2xOFmLGtEaEI=;
	b=FEeN/Do0T4PKEJ5v2UVA0PQ/4oSXTyXSsIb7ASwzEMXHsRqdcMqzuXXipVERVB+fYhX3
	 Ul+vWixcVVSr6EX1iaaRrwkYx6HPVbVs9UMlwqNJARtdcqd5dzxm9Ka5rT6M247+31OUo
	 Su6pfnJmRxK0OILwPr74Osh65o4p27PXdQo1R7CtyeliF0AGqjqTZJCUyJYtVx3ZnuGcE
	 LqxH2VIMlnbzV7a6ZftZ1mY7Ji1PplErbwTS8xasm4NorOkjDjoNzH+pZGIk8Wlf2yoBU
	 RCiJJtrq8YoElfvmM0+X0N1+LsrCexzhZrGxvIcBgHSFCUHWTHGkyaIu8hT2BDoHkIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OMg3vCev;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9126606A323
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9126606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OMg3vCev
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso11557655ad.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792689659; x=1793294459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qSKC6LmTr8AlslSEV3eV/HjwmhQt0Co2xOFmLGtEaEI=;
        b=OMg3vCev/2Ujxa9oEpgiu0xbE1LUsHSx8nyHW6T/WI6oPLeznW1CrSavu0LbaKsnMb
         uBnXAI+0yj14nVvqT/8yyv+IKogdNcJedJKOfCcpprK4OdRiWQ2YQ/WTkREHRICuY/PT
         P7hgzWoebssFygNwNUfU8BJ456S3GXdprnm6l2w98eQI5ECmqnUuLgXXUjDkosqPboxd
         8RPo9uMtHby6nc7xilDqLAm6VO1pe8ymjbfxTPQz48pQCpDyFcapZyo/9RFLYzHJQhhO
         Ess3kGcgCrp1SKM7CO7nGZwJpQxTf6ilOILjYnORGbW0p+5eIU7804ZgsKVAu34BF5+r
         QfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689659; x=1793294459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSKC6LmTr8AlslSEV3eV/HjwmhQt0Co2xOFmLGtEaEI=;
        b=h5DgnjAVI5Ep0LhpRZGjjSI24yIC7/wE9B7kqEKsFTefYJz7hyG2hQfLfsZDkkeT4c
         jQCWyLu9tRIMgRJ3mOJPSbE5dFckojWXhHDB4yxiD20LqKQ0GkD3pqHkCizqk+fP51o9
         03Nz22aJRE4maGr+jeN5LrXJjeuvFCiZQdNgXHAflyWLvIbKZ0wOTljINm+JRjGiMxAJ
         36xpN0/E7EPg9aX08PikP67vUxFY8nEyAobgShEKPKgERR3Xho/0uPA71aW72qnJA8SF
         KpEXBSgKc35fUN7pUhF4tk2WCh2hknQCX07SRsd5aQP4fEmx/2VOuu4BqYdMKrYqKzPn
         +c3w==
X-Forwarded-Encrypted: i=1; AKwUvBzGcRXjJue/6QPZ76XQ/NrPufXUj2oj1ilPrdzjzQPU9GdKh11OA17D0KJa7R6J6Pktyqspede1CJjF@vger.kernel.org
X-Gm-Message-State: AFq9FYIvQPFFZEkQYGQIaR6vK13n6vbXIdklQUeJ7X7zy5GujhTWBhCI
	9LkGyC1OXgfixGW8M0DTaDYh42j+WfS1Y46KVlR3Kb9QOaihvWfxNrBkdQSHna2ATKg=
X-Gm-Gg: AYBFou3x6LPAuqmuybUCKzkHsSEmQbkjxq0ycVFQRqjbSYiS7VjDiqrdc+w/ShiuczU
	amGMwcide3scSZhEpgQcNNcAMRuDvMITHrCgFg8vkJp+FKMUQ3gTGizqoqrpkwcUOM3bZc5djcB
	XMOZV2lCpQgFCSEDR5Apbr64/qYLNvXcxjnDHnJPsOOS5OUou9c0G0ZlqMAsXUrYj60Yz65T0Xu
	Qsy6e1rqhJVsqmyJUWFuEDM4CVMPn0uyECBfb8D8pTpKJpGJow2sJiUYAXAJAzaokzZBTXimQbm
	oX9fYuYK3vppMpjQ6w3XXf8Jpp5qffSWztau6QBRN9Vax56TuzgeGfDscwuOYhCGtZQUS50bs0Z
	hbSW6gUoTK46dmzOG0+HyMteq69dhs2ifVVJ84D9LExyNp9BapZAV0iFbPvYGiyz6dQ3D5LxU/S
	L2UrO0CdTC9H9G+QR1UsF1i3FH7gnLp3kFfmCl3E9DK3gn+Mu23+9gfay1UlWU3S+tmt/N9dvgl
	Yyff3icI+tryZV7l474hh0hms6hXMEXxbdoAZrfsyG9DD8OfECxFCgQKpUG8r/1qRhKkiGjE7YX
	j62t
X-Received: by 2002:a17:903:2f89:b0:2e5:54c6:e5c9 with SMTP id d9443c01a7336-2ea437b4bf8mr47547695ad.2.1792689658924;
        Thu, 22 Oct 2026 10:20:58 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9e85:9169:41c7:bc2d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b366766sm1137285ad.31.2026.10.22.10.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:20:58 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:20:55 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>
Subject: Re: [PATCH v7 2/3] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI
Message-ID: <atpF91weFU11Fu4m@p14s>
References: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
 <20261020-memory-region-name-v7-2-1413d5928340@nxp.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-memory-region-name-v7-2-1413d5928340@nxp.com>

On Tue, Oct 20, 2026 at 12:50:22PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI. Since memory node names are
> not constrained by the binding, incorrect names can silently pass DT
> validation, as seen in examples using "vdevbuffer" instead of
> "vdev0buffer" ([1] and [2]).
> 
> Parse memory-region-names to identify the expected memory regions and avoid
> relying on memory node names as ABI.
> 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Francesco Valla <francesco@valla.it>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 581bb07f5893f..1647726893d1a 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -635,6 +635,25 @@ static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int imx_rproc_rmem_to_resource(struct device_node *np,
> +				      int index,
> +				      struct resource *res)
> +{
> +	int ret;
> +
> +	ret = of_reserved_mem_region_to_resource(np, index, res);
> +	if (ret)
> +		return ret;
> +
> +	/* "memory-region-names" is optional */
> +	ret = of_property_read_string_index(np, "memory-region-names",
> +					    index, &res->name);
> +	if (ret == -EINVAL)
> +		return 0;
> +
> +	return ret;
> +}
> +
>  static int imx_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -648,7 +667,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		int err;
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, i++, &res);
> +		err = imx_rproc_rmem_to_resource(np, i++, &res);
>  		if (err)
>  			break;
>  
> @@ -823,11 +842,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  	if (nph <= 0)
>  		return 0;
>  
> +	if (!of_property_present(np, "memory-region-names")) {
> +		dev_warn(dev, "using node names for carveouts should be avoided\n");

Get rid of dev_warn().

> +	} else {
> +		if (nph != of_property_count_strings(np, "memory-region-names")) {
> +			dev_err(dev, "invalid reserved memory name count\n");
> +			return -EINVAL;
> +		}
> +	}
> +
>  	/* remap optional addresses */
>  	for (a = 0; a < nph; a++) {
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, a, &res);
> +		err = imx_rproc_rmem_to_resource(np, a, &res);
>  		if (err) {
>  			dev_err(dev, "unable to resolve memory region\n");
>  			return err;
> 
> -- 
> 2.43.0
> 
