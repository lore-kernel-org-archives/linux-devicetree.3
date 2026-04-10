Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46073349AF5;
	Fri, 10 Apr 2026 14:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775832421; cv=none; b=cmDsD6jJQqE7fVbrtahSWd49O5fVOJXhKdfqeTtXdO3k0kV86A5WmeXD+pIJDCScjdzlRcT+9bhFnvV6Uje3Ou+vODCwOoDI8IbQ3LBFTLWy7WiXFvFXU1OhUjP+MlsreprzWolM+Eaao67GY/TvuLrycXN25QfXgRTgy2pGkaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775832421; c=relaxed/simple;
	bh=u9jgWs+rQxNieWW6+zUO70EFEtbKwbZt/loIcja2QcY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KfLjy91pDtTanUc0Jau9psKftqVvKEZxGKaIezI6hhfcr2YYg9x/wh58m7Reg9G0HB2tc91935Y9Wg1tZRC/4qwcJnEVOX+FiIvJYbo0zid+NpYYPGi7wZi2UBeSbbluTMIe9E1H2mmqF9LPAPzwkS71Ghb4VBwweIY6thJhr2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BBYAeNDv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBYAeNDv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6C5C19421;
	Fri, 10 Apr 2026 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775832420;
	bh=u9jgWs+rQxNieWW6+zUO70EFEtbKwbZt/loIcja2QcY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BBYAeNDvucb606PPcxDI+grEz4lbbjrm+8jaYmxqOJ/oWx6G4yAAtURopWBjqHigV
	 2sGDhZYHH1bE78PWI9wQBGuEhkDTsRUzkHazZSjLYHtLxfZDQQPSfBSaNrp0WTlprd
	 RO56yLP9VJewxh20mD8pi3w5q519GyNE4r//hBof5lbYCuLI4k9mK6kv2RrIMQYRgQ
	 AKYNVm/RHKy9jquwhv4I0GzC1Zw15kJqnelEpVOsBl7BZYLu8sMQSRLb8MhRRMNQ8w
	 osuE5jeNUeQ+KResDSakPGg+r1sjluY8o5mwwXMeuA6iIWIAWcyxAQL8RPsz3cFc6y
	 8btOm+R9AtDMA==
From: Thomas Gleixner <tglx@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Ley Foon Tan
 <leyfoon.tan@starfivetech.com>, Changhuang Liang
 <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v1 5/5] irqchip: starfive: Implement irq_set_type and
 irq_ack hooks
In-Reply-To: <20260410090106.622781-6-changhuang.liang@starfivetech.com>
References: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
 <20260410090106.622781-6-changhuang.liang@starfivetech.com>
Date: Fri, 10 Apr 2026 16:46:57 +0200
Message-ID: <874ili27q6.ffs@tglx>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 10 2026 at 02:01, Changhuang Liang wrote:

s/hooks/callbacks and please use function notation irq_set_type() and ....

> +static void starfive_intc_mod(struct starfive_irq_chip *irqc, u32 reg,
> +			      u32 mask, u32 data)

No line break required. You have 100 characters.

> +static int starfive_intc_set_type(struct irq_data *d, unsigned int type)
> +{
> +	struct starfive_irq_chip *irqc = irq_data_get_irq_chip_data(d);
> +	u32 i, bitpos, ty_pos, ty_shift, tmp;
> +
> +	i = d->hwirq / STARFIVE_INTC_SRC_IRQ_NUM;
> +	bitpos = d->hwirq % STARFIVE_INTC_SRC_IRQ_NUM;
> +	ty_pos = bitpos / STARFIVE_INTC_TYPE_NUM;
> +	ty_shift = (bitpos % STARFIVE_INTC_TYPE_NUM) * 2;
> +
> +	switch (type) {
> +	case IRQF_TRIGGER_LOW:
> +		tmp = STARFIVE_INTC_TRIGGER_LOW << ty_shift;

tmp is not really an intuitive variable name.

> +		irq_set_handler_locked(d, handle_level_irq);
> +		break;
> +	case IRQF_TRIGGER_HIGH:
> +		tmp = STARFIVE_INTC_TRIGGER_HIGH << ty_shift;
> +		irq_set_handler_locked(d, handle_level_irq);
> +		break;
> +	case IRQF_TRIGGER_FALLING:
> +		tmp = STARFIVE_INTC_TRIGGER_NEGEDGE << ty_shift;
> +		irq_set_handler_locked(d, handle_edge_irq);
> +		break;
> +	case IRQF_TRIGGER_RISING:
> +		tmp = STARFIVE_INTC_TRIGGER_POSEDGE << ty_shift;
> +		irq_set_handler_locked(d, handle_edge_irq);

This can be simplified so it avoids to have a function in every case
statement:

        switch (type) {
        case IRQF_TRIGGER_LOW:
        	trigger = STARFIVE_INTC_TRIGGER_LOW;
                handler = handle_level_irq;
                break;
        case ...
        }
        
        irq_set_handler_locked(d, handler);
        typeval = trigger << ty_shift;

You get the idea.

> +	raw_spin_lock(&irqc->lock);

  guard(...)

Thanks,

        tglx
