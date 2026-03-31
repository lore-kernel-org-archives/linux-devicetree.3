Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D84740629F;
	Tue, 31 Mar 2026 16:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973413; cv=none; b=pGW+0tdLz5t+/6OXK8+wvkiDDYtkH/iCj7LnUxaS1d0hM9GHNzGBk9aFVRDdD5cH8YnMQyhe2HLHJwV7+o1OkGhFjT2e4uT8F0St+qzmbDBKGTDEWAbg/nBC2f+WozZtc8fDnav8WkSVupv9bFQl93C5pL6FAuRNVzf8ucl0KBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973413; c=relaxed/simple;
	bh=ijpDo/7JDayOQ1D9eDJjCZ11/E2WfbQpZeWsZEqb6ww=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ervSjX9yfgEDfW6IeoKIMjlqTxLj8AR0pOtBspincWohf0zpyaGhWg0L1x1GOc1HR4npe/7hyRxUFMERmqSDE0Bz0fxG86HLkxYHHH5ytFsbRN4Jn86+Oxqi5v3R+L+6xj8P274iHCDN/tAKFZ744b5uVPzAy2oGrA6Qc4Ylaoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rQI73jqX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rQI73jqX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336A5C19423;
	Tue, 31 Mar 2026 16:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774973412;
	bh=ijpDo/7JDayOQ1D9eDJjCZ11/E2WfbQpZeWsZEqb6ww=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rQI73jqXU6YI2gkO3mK+iz8h5EIxdGh44HXO3c1FtbeD3FDDwWl7IWu8703NDHEob
	 LhJNtt5HQRbebcFdvfX7gid3ym3Lf6UOsPdBPBVRpAucPdSpc69l/qDMWpKsyM9mlS
	 xIiF+1IR3jKxi+b81z9psAZGWpPT6XRQXSP5B1hp3/naLfjosz/ze3RkgiK9Nieqo6
	 fK0LLxoihbzuVGdXoZKVMzuHLXfaJWHjMi+RHa2dELqC1QNjZlahKUDiOkTLoyFo6W
	 BA7vhj+kPd7x1OWadIzRBTH3YyxIXIMcNu2LcDwA0r5V3p9SlxKB12q28gL8bgqjx9
	 CKBur4Mj/yn5w==
From: Thomas Gleixner <tglx@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v4 2/4] irqchip/ast2700-intc: Add AST2700-A2 support
In-Reply-To: <20260330-irqchip-v4-2-3c0f1620cc06@aspeedtech.com>
References: <20260330-irqchip-v4-0-3c0f1620cc06@aspeedtech.com>
 <20260330-irqchip-v4-2-3c0f1620cc06@aspeedtech.com>
Date: Tue, 31 Mar 2026 18:10:08 +0200
Message-ID: <87tstw7zfj.ffs@tglx>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Mar 30 2026 at 14:32, Ryan Chen wrote:
> +static int resolve_parent_range_for_output(const struct aspeed_intc0 *intc0,
> +					   const struct fwnode_handle *parent,
> +					   u32 output,
> +					   struct aspeed_intc_interrupt_range *resolved)

Please reduce the number of line breaks. You still have 100 characters.

> +{
> +	for (size_t i = 0; i < intc0->ranges.nranges; i++) {
> +		struct aspeed_intc_interrupt_range range =
> +			intc0->ranges.ranges[i];

No line break required.

> +static int aspeed_intc1_irq_domain_activate(struct irq_domain *domain,
> +					    struct irq_data *data, bool reserve)
> +{
> +	struct aspeed_intc1 *intc1 = irq_data_get_irq_chip_data(data);
> +	struct aspeed_intc_interrupt_range resolved;
> +	int rc, bank, bit;
> +	u32 mask;
> +
> +	if (WARN_ON_ONCE((data->hwirq >> INTC1_ROUTE_SHIFT) >= ARRAY_SIZE(aspeed_intc1_routes)))
> +		return -EINVAL;
> +
> +	/*
> +	 * outpin may be an error if the upstream is the BootMCU APLIC node, or
> +	 * anything except a valid intc0 driver instance
> +	 */
> +	rc = aspeed_intc0_resolve_route(intc1->upstream, INTC1_ROUTE_NUM,
> +					aspeed_intc1_routes[data->hwirq >> INTC1_ROUTE_SHIFT],
> +					intc1->ranges.nranges,
> +					intc1->ranges.ranges, &resolved);

Please test your code with CONFIG_PROVE_LOCKING=y, which is mandatory
for submission according to documentation.

This is invoked with the interrupt descriptor lock held and interrupts
disabled.

       aspeed_intc0_resolve_route()
                ....
                irq_find_matching_fwspec()
                	mutex_lock(&irq_domain_mutex); <---- FAIL

Thanks,

        tglx

        
