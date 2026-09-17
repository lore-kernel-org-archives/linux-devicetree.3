Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B0B3CF962
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632352; cv=none; b=VymoEFCLdhN3UPY+tCIm6BmypQM5o2YWjui1nf1GFsNvIak9YBxLEty9jHLTckIAXeUoH6kRPoJJ9pIsY9XwedgpdtLBOlNc0S9wDdawPQEsZ1w2dltKSnzGqDJkC8pPK0mxygEOIwHK2xbtbul6kP1N0ODw7JuT2v04WAq+zhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632352; c=relaxed/simple;
	bh=2NPqFvaIbfXhcrYnmwB3/i8adug1S0UoVTXp9i1DXj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiocDGpeVXEBOptFc/V0eGO1wWgcNzdYS46VsrCgHfwXxV3s2uQMtIgos82J4qnSygZg1OPAHR7IcLrMEMcunjbChRvUOgpnp2f0KBKXq8GWY/6zRuC8VrSo0uJe1PORn0qqlDNvKt1D/gImCVVhSWIfaCGmUgJYAPVQTsHj93Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=okLQjjQS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="okLQjjQS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDD31F000FF;
	Thu, 17 Sep 2026 08:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632350;
	bh=cxwNQuo1MwfkPiWaoqYyt95s3x3hs0Jga33AiR0XIrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=okLQjjQS8e8XfTSw0HqPrQyGitnrCIvyz830zgR6/erIwDab0WsaWMISWK+/ZszYj
	 N/g0aXJ9D33G0dLmyHzMwKAoY3CoDh0+bx86MdJKXoqeYc6GYpXO6erFukGGAzhmzg
	 MJ5s8WdmHo19xXQRIQLv3qmMZWpWFdd77SY+3/pB12NETZw/vmqTYOtecIKzr5mFiU
	 U3ypHdZyRULIzGY4BCdvjAsalplSb5L4JocHc4US1zAevB8qPz95ZbmdVKPsLduXbI
	 0xM/nblSmwkzHGQvaNa6i5Gx46xysXtunQNB1/ZZBiI6MLz1WrBBko98xxw1eb1Ii1
	 olKZLsN2rPlnA==
Date: Thu, 17 Sep 2026 10:05:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leander Kieweg <kieweg.leander@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v4 1/2] dt-bindings: display: Add GlandaGPU binding
Message-ID: <20260917-exceptional-artificial-mackerel-0bcad7@quoll>
References: <20260913205007.118552-1-kieweg.leander@gmail.com>
 <20260913205007.118552-2-kieweg.leander@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260913205007.118552-2-kieweg.leander@gmail.com>

On Sun, Sep 13, 2026 at 10:50:06PM +0200, Leander Kieweg wrote:
> Add Device Tree binding documentation for GlandaGPU, a custom
> FPGA-based 2D display controller.
> 
> For hardware designs and RTL sources, see:
> https://github.com/stiangglanda/GlandaGPU
> 
> Signed-off-by: Leander Kieweg <kieweg.leander@gmail.com>
> ---
>  .../bindings/display/kieweg,gpu.yaml          | 55 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/kieweg,gpu.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

