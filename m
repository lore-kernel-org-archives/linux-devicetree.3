Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794771685;
	b=q3n5ivUm1QrkNgRMyWyDqxVRLjC0i4Pjflx56kA35EIEb7WihCG9mYIjkSFA5EBNGV3M
	 nCjBGgRsl4AVhpvt9CSSdsuhVZJO/oQ221H/FjnM16rM+6u0mES9TShFTgbfioL6WUOre
	 ppyjJFoTlySJxOdgSSMtVx8l6kRHwIuFDc6F5nBtbCrDWTYU/x/jA2K1ogBik16vst7n9
	 wOeQ+JSWaJXOcBzYFdfbbSKnNvtlikteUuMWyos0ZB+f1FR9E1Mc7hsGyhyHs0weLkZI7
	 PUfamZqufcXoghWUycHqI+eU3wO5lVWT9+pLvmiK2/9iW8Isu4XfM+LVnu2WisIf0mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794771685;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=51+4K6ggdGph0oXoWgx8ifDeB8Z2Gooyur3QPXcK89A=;
	b=m/zM99hZxzV2Z8tpQUnJHwdAFPXJcQuW8YRWNe24LWOC1diyprqzrheUJnI/4XhHPVzg
	 UdmfYMcQVNvzvRwvQIQMR8PT3TogGpoA2rkMTgjNnfPT3DjD4GyMty2MjGhnf+DWfZqH3
	 BGQwPu+dCE6BHnY6+VYZ6kNEKGenyjXtFuIvCL/JmTZvAI90/HJwucNTDAXipeH8fDPBE
	 SnnchO9Gy1bbfbX0iG+67Xee1TLk35vcIKMeWbUlKvayEWD25GXdWJUIK1L0GTa1ToNL9
	 Z3KT+T/cAfnZBBo+b0jPDwV0s7eJe9IW434ZoK2zR3J8AHqetYEZRzLjOTdi72z/jWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CEXwocqJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88200606A323
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 19:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CEXwocqJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E51E1F000C4;
	Sun, 15 Nov 2026 19:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794771685;
	bh=51+4K6ggdGph0oXoWgx8ifDeB8Z2Gooyur3QPXcK89A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CEXwocqJ9gg9KqAxb8j+ZI1or6imS/XL3HL1jluGCO+/NxiC+2mXs2Ra48K2rrixl
	 zyvQnLC5yzOkxPCGtkAK9Bt6egJFEDhI3de/LyZu3GXxAeI37j8PB09BZ5VFgARc+j
	 F/HmLMJjL8P0yu9RSOK9JnYJJOKtDPOZ4ltm/43EeHZyZjhaf52iVpLCIBW1AO3nAf
	 JfaNk59O6Hb3ay/qBnilK1xgOUyQiH8Xj+SHzEFESfp/6BpCqqtJpskBcQPaxcWv8Q
	 Qo7rK35VlrhY7hw6OA4WR8aU1g4OGmGoMi23EjJNi/FhCyP0LdHO1Bo7aGLC/m10DU
	 JrKH+tQJDoIPw==
Message-ID: <sashiko-outbox-215757@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] irqchip/econet-en751221: Chain the handler to all
 parent interrupts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshat Singh" <automobilehacks@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115-en751221-intc-all-lines-v1-2-dc03a40f47f0@gmail.com>
References: <20261115-en751221-intc-all-lines-v1-0-dc03a40f47f0@gmail.com>
 <20261115-en751221-intc-all-lines-v1-2-dc03a40f47f0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 19:41:24 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] irqchip/econet-en751221: local parent variable shadows parameter
  in econet_intc_of_init()
- [Low] irqchip/econet-en751221: missing Fixes trailer on non-VEIC IRQ
  chaining fix
--

commit 341fd2b16f35f804366b103223f85a72065ed255
Author: Akshat Singh <automobilehacks@gmail.com>

> irqchip/econet-en751221: Chain the handler to all parent interrupts
>
> The EN751221 interrupt controller does not drive one CPU interrupt line
> per source. It presents the number of the pending interrupt plus one, in
> binary, on the CPU interrupt lines IP2-IP7. In VEIC mode the CPU takes
> that number as the vector, but without VEIC the driver chains its handler
> to the first parent interrupt only, IP2 in the existing device trees. An
> odd-numbered interrupt then never interrupts the CPU by itself: it is
> handled only when an even-numbered one happens to run the handler, which
> on an idle system is the next timer interrupt. That covers the frame
> engine's QDMA (21), xHCI (17) and the first PCIe port (23).
>
> On a Nokia G-140W-C, whose 34Kc does not report VEIC, this delayed
> received packets by up to 10 ms, and ping round-trip times to the device
> cycled through 1-11 ms.
>
> Without VEIC, chain the handler to every parent interrupt listed in the
> device tree. One interrupt usually raises several lines, so the later
> runs of the handler find nothing pending; don't count those as spurious.
>
> VEIC mode is unchanged.
>
> Signed-off-by: Akshat Singh <automobilehacks@gmail.com>

[Severity: Low]
This fixes broken delivery of odd-numbered interrupts on non-VEIC systems.
Should this include:

  Fixes: 1902a59cf5f9 ("irqchip: Add EcoNet EN751221 INTC")

> diff --git a/drivers/irqchip/irq-econet-en751221.c b/drivers/irqchip/irq-=
econet-en751221.c
> index 2ca5d901866fe..5930c67c37261 100644
> --- a/drivers/irqchip/irq-econet-en751221.c
> +++ b/drivers/irqchip/irq-econet-en751221.c

[ ... ]

> @@ -461,7 +473,22 @@ static int __init econet_intc_of_init(struct device_=
node *node, struct device_no
>  		if (ret)
>  			return ret;
>  	} else {
> +		int nr_parents =3D of_irq_count(node);
> +
>  		irq_set_chained_handler_and_data(irq, econet_intc_from_parent, domain);
> +
> +		for (int i =3D 1; i < nr_parents; i++) {
> +			int parent =3D irq_of_parse_and_map(node, i);

[Severity: Low]
Does declaring the local variable parent here trigger a -Wshadow warning
under W=3D2 builds because econet_intc_of_init() already takes a
struct device_node *parent parameter?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115-en751221-i=
ntc-all-lines-v1-0-dc03a40f47f0@gmail.com?part=3D2
