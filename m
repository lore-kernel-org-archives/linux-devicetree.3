Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795735937;
	b=UBwT8EcXJnlFSNM7yZ/Amxai0jrRzz5Aw2rnDO+mbjcNLpJHABx9jamXgo4mEYchqd9J
	 SvfLHi8yWE28/XRRqUZOcg47H9qSuZDevgNpuwWo1Awh5c6+Z4HEjT4hO3DoUIZ3K0T+z
	 91WfheLiRvSnjC4tgW+t65COxkwdL9lrYmH3q0UHI8BZvajtQ24srCf4X3Jc+JyLYraCu
	 yB8iRr7FDrAJtTNW51X6hCnc+3qzkbFSFruphM3Zwg3ocnbKxHZdUWb1qcJlqstvFO1LZ
	 mg80SarEYFkEJyah1ZuvKVmZO6eoQRrSKr2VRMqOOiMEZpS3NxUjfXJcbxt8TpPF2dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795735937;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JgbNwrwi6IM9ws3GFBZzMvRlYtraNu76+Wn16Tg8+yk=;
	b=FMQZbDON+zEDwqXGVV0O11sHdUEzw2oAAMSESLRu1urUWgtwP927H7zwo8idBr61qJRu
	 hR+sehiNn1dBVxWrKKrkiuyAYH07EA6v1nanZEXokJ0nUmcrTEmfDFNtIHIofkx/fGvqL
	 0X9ZYngJ03XkLuCmDo2WkBfIZVKURaS1Hz5WmJOAwD5aW6qh2KaT1V5oIVKK3RO4LHmQ+
	 Dd28iz1qLDtHaEOL6SHiySEIWSKQ600evOCkZ6KpjOOH7IHyPloxc+V1gfh7jV9FJgJGv
	 HvZvlFbpFujTvsQHZ27z9Xw/VmYHOBauewJv/ABK7mu9kMU2xbEdrP1g4BQeX+oDiHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dabvvxnw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA3B606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 23:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dabvvxnw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998601F000C1;
	Thu, 26 Nov 2026 23:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795735936;
	bh=JgbNwrwi6IM9ws3GFBZzMvRlYtraNu76+Wn16Tg8+yk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dabvvxnwNrPrMDPST1P1bgLhj7KoinvhOGucoiJ9elARkgaNKHL7gaF9XEhcX4/Rm
	 AFlD8oQTcQaCyVR9pBzeInHeGDfvQK/KcAOI57lVxu7iysqBWmf8EJLjZdBNZn4KVw
	 rMJtxOeNdgeULJ/Rm84Sodknbo0eFgoa5Qkpdcxbq5uDbWtVAoHb4GnjjiPiBSNtY1
	 fBIQ11bSyedx1l5LBWWaG65yDfjyh7QTH3541UIcudFtsVhzMfwQkHy1cYs38yV36u
	 k7ZUKo/Nm0i8pqeN9dDT82CHAKzFWJwQhcFZnblQI3owZDJHzKhtqyNlq4TFh38gJR
	 +6QzBC6Ul0dbQ==
Message-ID: <sashiko-outbox-236330@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 08/19] clocksource/drivers/timer-clint: Add
 Espressif ESP32-P4 support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VsOtdG9yIEh1Z28gU2lsdmE=?= <vitorhg20080@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125233020.1380594-9-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
 <20261125233020.1380594-9-vitorhg20080@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 23:32:14 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] clocksource: timer-clint: mismatched IPI gating in
  clint_timer_starting_cpu()
--

commit ff948927794ebb2a7c5ef1defc24583fcf3b6ad3
Author: V=C3=ADtor Hugo Silva <vitorhg20080@gmail.com>

clocksource/drivers/timer-clint: Add Espressif ESP32-P4 support

This commit adds CLINT timer support for the Espressif ESP32-P4, where
machine-mode timer interrupts are routed through the CLIC.

> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/time=
r-clint.c
> index e56eee7e3781d..bf5bae077d7ab 100644
> --- a/drivers/clocksource/timer-clint.c
> +++ b/drivers/clocksource/timer-clint.c

[ ... ]

> @@ -130,13 +157,22 @@ static int clint_timer_starting_cpu(unsigned int cp=
u)
>  {
>  	struct clock_event_device *ce =3D per_cpu_ptr(&clint_clock_event, cpu);
> =20
> +	if (clint_uses_clic) {
> +		ce->set_next_event =3D esp32p4_clint_next_event;
> +		ce->set_state_shutdown =3D esp32p4_clint_shutdown;
> +		ce->set_state_oneshot_stopped =3D esp32p4_clint_shutdown;
> +		esp32p4_clint_shutdown(ce);
> +	}
> +
>  	ce->cpumask =3D cpumask_of(cpu);
>  	clockevents_config_and_register(ce, clint_timer_freq, 100, ULONG_MAX);
> =20
>  	enable_percpu_irq(clint_timer_irq,
>  			  irq_get_trigger_type(clint_timer_irq));
> -	enable_percpu_irq(clint_ipi_irq,
> -			  irq_get_trigger_type(clint_ipi_irq));
> +	if (!clint_uses_clic)
> +		enable_percpu_irq(clint_ipi_irq,
> +				  irq_get_trigger_type(clint_ipi_irq));
> +
>  	return 0;
>  }

[Severity: Medium]
Should enable_percpu_irq(clint_ipi_irq, ...) be gated on CONFIG_SMP
instead of !clint_uses_clic, or should the IPI setup in
clint_timer_init_dt() also be skipped when clint_uses_clic is set?

clint_timer_init_dt() still requires and maps clint_ipi_irq for
"esp,esp32p4-clint", and its IPI mux and handler setup is guarded only by
CONFIG_SMP:

drivers/clocksource/timer-clint.c:clint_timer_init_dt() {
	...
#ifdef CONFIG_SMP
	rc =3D ipi_mux_create(IPI_MAX, clint_send_ipi);
	if (rc <=3D 0) {
		pr_err("unable to create muxed IPIs\n");
		rc =3D (rc < 0) ? rc : -ENODEV;
		goto fail_free_irq;
	}

	irq_set_chained_handler(clint_ipi_irq, clint_ipi_interrupt);
	riscv_ipi_set_virq_range(rc, IPI_MAX);
	clint_clear_ipi();
#endif
	...
}

When CONFIG_SMP is enabled with clint_uses_clic, clint_timer_init_dt()
registers the IPI mux and chained handler on clint_ipi_irq while
clint_timer_starting_cpu() leaves the per-CPU IPI IRQ disabled.  In
Addition, the commit message does not explain why IPI enablement is
changed here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125233020.1380=
594-1-vitorhg20080@gmail.com?part=3D8
