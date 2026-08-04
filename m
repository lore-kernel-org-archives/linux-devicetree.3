Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3122D3D3CE3;
	Tue,  4 Aug 2026 08:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832497; cv=none; b=fJFfcDHywuqK0n49I47LQfw4RoaBxCfLPKlQac/PINMFZ41JXdiZ2MqQJPDEqbjUcdrraGozUSbUJTotATCmtkMiRuoPVW0ZUJEKt/6YPQZDLmb4cyxZsbsO8Hkowlz1rzo/xXsKcCqk8DaQCz3uTu1wxIhYjZE92EILqonvb0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832497; c=relaxed/simple;
	bh=n33aot1iA02PZrdQkbeOk2in+ZQPDoHxH9xZHacF1CY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZOtauUfx4XMbUFe7zQr6iHvHvMbtV25q4y8TrER9pblW/iJ4iTyKCcv9d/n+zvuZTJ3I8myYGDfhVoMUcyV8LMo5CPHNja1zfWY7NKxSqCd5iEbSqU7XhERSAFoDgVyZEjk9VjNbHz9WFCZu+zHXLgmKRU2tJM2jVpgAFWSh68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXGw0K8s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXGw0K8s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFDAA1F000E9;
	Tue,  4 Aug 2026 08:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785832495;
	bh=XR9pVsWP0VRq3VDnLe2LKHb2hlkKIaoXawgZIgHxx2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GXGw0K8s5GD8ECX8MgXandaT10fElf7Mfm2kC3Zcew/Z6DNrvyrc1hxpUTjGYeJvp
	 F1+cy09NbgPj23vOVlcU08TN1apjVZFRZcetMSnQYOReJXpnN7wLWoLQ9udwq7CxcR
	 wRn3Ic2FOWgPWpBxb7WI+nlr3KcWl9azQryMdge9xul+bIPoEI4S+OvcajNCLY9SIz
	 X3zOVp2Uti4EOeu0y2TAn+wEJkV7ZeAbQjGIzrf68wMcWkxFGP6tTVyABUdv19T6wn
	 TZRwoLRRifFtXXtK+o/0DR9Y4zGgfdLgPp0YKcwkj+tjEOm9kDNibuzz3FvWT4Wqm+
	 Td6rbfLG97XNg==
Date: Tue, 4 Aug 2026 10:34:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: robh@kernel.org, saravanak@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] of: Put coreboot node after compatibility check
Message-ID: <20260804-tricky-malachite-robin-192339@quoll>
References: <20260802023821.494178-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260802023821.494178-1-dbgh9129@gmail.com>

On Sat, Aug 01, 2026 at 10:38:21PM -0400, Yuho Choi wrote:
> of_find_compatible_node() returns a referenced device node, but
> EXCLUDED_DEFAULT_CELLS_PLATFORMS used the result only as a boolean and
> discarded the reference. This leaked a reference each time the
> address-cells or size-cells warning condition was evaluated on a
> coreboot system.
> 
> Use a helper that drops the node reference after checking whether the
> coreboot node exists.
> 
> Fixes: 8600058ba28a7 ("of: Add coreboot firmware to excluded default cells list")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
>  drivers/of/base.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 6e7a42dedad3..8d04eaed9805 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -95,9 +95,21 @@ static bool __of_node_is_type(const struct device_node *np, const char *type)
>  	return !strcmp(match, type);
>  }
>  
> +static bool of_coreboot_present(void)
> +{
> +	struct device_node *np;
> +	bool found;
> +
> +	np = of_find_compatible_node(NULL, NULL, "coreboot");

Code is simple, but could be even simpler with __free. Basically two
instructions instead of four and no need for this assignment comparison.

> +	found = np != NULL;
> +	of_node_put(np);

Best regards,
Krzysztof

