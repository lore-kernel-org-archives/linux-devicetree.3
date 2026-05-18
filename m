Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE40409E1A;
	Mon, 18 May 2026 12:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107283; cv=none; b=BWZgoF7OJK56hTRtyhsdx3aE0Cy/gCGl+vD2dUhFKrPaVPEWOQAA42XwVWzyp0rAH6hcxxcqydfixT5k5gXU5cVeb9cOAGg+nMIV3UtruCcxfyeT/UvoIc4lc7tUN+9r9xQ7Wi3kKdWRp1eAHUFGRIBwfAt/xdt9WZ1UCBHJZAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107283; c=relaxed/simple;
	bh=YsFmvc4ZHblbCYQuISYKcXJQ07qCsDZ6i5l+JLxB9eA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JrGry97105c1SIAs5POB5LP+FqJDVc/NERJWMjnt6DPiz/XmotOv/weOWbrWPV5bOFwMY3/HtHAYjbvH760ntBQYA1q3o0RRD0shDYGMI+8ZqzoBVHUlvB4x5diMkheK0iKLiyYeOPtHE9CQo9H2saBu7Dv7jVDqBdE3PByeHxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=JgiEpNGs; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="JgiEpNGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779107279;
	bh=wj0yR9PYapzRO9WETQEouL8N/6Cx3siFuTTA4xukOso=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JgiEpNGsV/MptSZiLUBCsoKNZCnbg/Pong+ZdioH3V1VMSsXzpLBszyHPglpYeEcu
	 AA4yQrnj8775FFAT69kdOk23mSjjgbjGlDpcGnQeRBk1PS/sNMIoLX3emWPtgQuaqn
	 qfvhc4ndnsfwkJf72cqvekBDXC67fFp4PwHbWmpKi8EejioKsEwUZl2JjroUSqL19X
	 lflx7wLZeHr1i04ctMSPuOy0vrNcSC3iw9tT8M2IUO8+iTlY3dX7RhzKMp7HFsutQ1
	 kYi8C9ccG7DhQC/HcuCfVynQchUH13RHHhCtUMPBuQbQdvezOMrPCM1GOy+WXeoor2
	 BKnxh2aQe9B0Q==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4F6096024D;
	Mon, 18 May 2026 20:27:59 +0800 (AWST)
Message-ID: <663d06c8c42892586075ddb2ba7111b06c58752f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v13 0/2] Add Meta (Facebook) Ventura BMC (AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "P.K. Lee" <pkleequanta@gmail.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, joel@jms.id.au, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Jason-Hsu@quantatw.com, p.k.lee@quantatw.com
Date: Mon, 18 May 2026 21:57:59 +0930
In-Reply-To: <20260407081700.2658011-1-pkleequanta@gmail.com>
References: <20260407081700.2658011-1-pkleequanta@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi P.K.,

On Tue, 2026-04-07 at 16:16 +0800, P.K. Lee wrote:
> Add Linux device tree entry related to Meta (Facebook) Ventura specific
> devices connected to the BMC (AST2600) SoC. The purpose of Ventura is to
> detect liquid leakage from all compute trays, switch trays and rack
> sensors within the rack, log the events, and take necessary actions
> accordingly.
>=20

...

> ---
>=20
> P.K. Lee (2):
> =C2=A0 dt-bindings: arm: aspeed: add Meta Ventura board
> =C2=A0 arm: dts: aspeed: ventura: add Meta Ventura BMC

A few things on the commit subjects. Can you please:

- Capitalise the first word of the short description (the word after
the final colon)
- For the DTS patch, capitalise 'ARM' for consistency
- Avoid redundancies

So:

   dt-bindings: arm: aspeed: Add Meta Ventura board
   ARM: dts: aspeed: Add Meta Ventura BMC

Cheers,

Andrew
