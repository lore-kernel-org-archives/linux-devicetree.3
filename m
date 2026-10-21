Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597071;
	b=SICWHrzVCqadj3U5e2iDUcLaz+1qPPo5Ktm6NQDUfC0z0/PjN4tKiyHbesfx868DIxN8
	 EvnJS6R1E/8nE3u+6Usuf2/q1zDu4U/LF6z6e1PbskIUMxXxz5vkdJsS4Ila+HHgqn/AB
	 aAtBALv/cC7zNfV0dMa/JJw/GnXXuxy/5kHMLxOfdkKfBhHJ2zHEoHk1akQmYovTTMQKA
	 +BRKxoPfo3vI763DoK2kbJcgBm1nx7RL+c6z4ptq3U3Lc1No0UKJ07Yv01OWJFPlkCq+D
	 PiGizb8A4XgcicSeDwD/VtfkhTVnL+Sa/FIn9CEt3yndPO7+qR5kO8WCOQbZD27DWRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pcUJNAa1d5gYFOvrKvELkQqk+wRTOdmweUM3ujZu374=;
	b=KSfDQz0q5nevik29HfuDWWe1FYxyVjGa6BdQ7ianpw3niqcuU78YojMNuaOhlRCrnZI2
	 mJpPWfbkUl+Pr5P6jxiwDuJXor1YcZPbs47Um/1Pg6j5awvyx4BTYEJTLOVPKl+EakmXb
	 77T5JzU3Slkbs5cnFLOnEc7JUyWSD0K+5FtlWmluIRCC3h6xVJXhbiGSDl0Z6db64IjrR
	 aMmCJWplL2ctM9P1gUKXR5P+DsvfmRzeNQj84SkcgqaAqxFb+AKiTyHI2vmOdFkAKuGl0
	 rJwoHD0LJFEDTRHoIcCEXsUB95u/DYf8q3EORAmYDUOsVfiuRk3gpTPLB+R4YGpxR5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U8WOfcfn;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1DD606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD1DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U8WOfcfn
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eabf243d05so338396e0c.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792597070; x=1793201870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pcUJNAa1d5gYFOvrKvELkQqk+wRTOdmweUM3ujZu374=;
        b=U8WOfcfnMnpm6svYe5iJa9/W46YR4FzI8Nlj+7unkM7m0rftH2FoogDPMK26ILs3tw
         ms9az8/IEBxBnq5+p+y8QpOkfxpbjyjMZpObKISMc1AlVpCtroY8L7HpWqaN9LJp7Av/
         ikv7zKxySdsv74p2R/3OFIolqJNaymhzG9OFqPY65WDonlV5Pgagk71+wfZENoBDReGO
         0Wi0rN+Y+MtHE2ZtMEgL2lJ1kLk0G8GP+JFXuGcKj/x824ojcSSn035B408ME33gWqMJ
         ZSHXqIvQVikv3S5cRgsmonWb7b9tVLhoIH2cIzqoy0U/9rhbqQ6VhgYDS/9NOK7jFZHM
         qLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597070; x=1793201870;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcUJNAa1d5gYFOvrKvELkQqk+wRTOdmweUM3ujZu374=;
        b=uY72vzKWXfFxOZGOW432lXTK1eoAA4UbFstALv0wJh5iDLH/wxQ7rt8/++06Lr6bC2
         +G4ac4r6eg6OOOlk7f6lIxnF7LtCPbs2zRXdsJ9xw/06jWzcj1DIeWVc225tQOj9E+6E
         E3hpROuVFMpvYt6P63umskxnDdsRp9EiEHCwvVUZtbnmd5hnxW3LwXxbGm1PNgvxOJos
         kznBmvGTfV5W7qRD6paguSEShgOQHKmEuFxc1xaGBv9B/rwMWFNrHamUVo74F/Fk4CY5
         ksC7h3npdDuvU43FRTvkmtze2PinWejO9tsy/bjz3FMbdULo1JiI2K4AOwg/ba5lON73
         coeQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0fJbsV+IxI2R7f2vgy5dWmLk4TetQsdZGn+NB4J3Sh5v5vA0M/k7wYFbAjLdraCkBwWqCoczIhmSo@vger.kernel.org
X-Gm-Message-State: AFq9FYIG4mBjAq4h9bx0KpdSaOuDXZPTUucbcJOGxuqEIoVuxHvombZi
	MTzlzUXuGohCMIhDe1Iuv5LzIRh14+zAZsle0XZ7ZpjLBAo/8Mq9fZV/
X-Gm-Gg: AYBFou1evYUGYxi14OJZ4011yBIwACfR5abZVu5Fx35P9SNT4EMMR3HnH7hIy9YkBCm
	T12r9KJRKGL7JNECU99E7TdnIeE5RNRUfKtJZQqtsoy15MINssZbLs6QMNl59y+hE3SYTuro+21
	f4gzGEcJ1+G5Yqo9+I9NMNMHa1sagZF1MeRudrDIIHh3zhwxueGJ8YjvLzSF3Fjzu76TTf8DoLn
	NwjQfIAQR6/fjfo85kiDW+OryloX1/s5Fc5KfwJysqCXIS97luZm2IdJe4UsJDpB6c3SpZzg6Od
	8or7KKXRdU/0LwZJ6biqJQ3tYRYLQ+5dkMvwGxAa8YqknOPqADSkxbl517qy3Tbfc2Tf7L7N/y0
	uVQEk8G0OZvfSvhZyf2MRKz/zigxQ7MKbw5ZdNcugJ9DxElWG5RWibkCBQUQ2ON8ErtOoCwqtGc
	Z4jcsRbHSENHHABlgWmuKEwzOPxc4M8OEs+qEislK0mW6nCu0WDPS9htPFiKBlhGSjDdwDmNfkk
	hlZcxes9MW2UHbwYvbl5sbUkGX+FbXAjL+VydxImidmF+f+3xE9CS+ji/ByWpnrfLYnLAkMfx/G
	uXR4UPZEQ0bT5m2yt8U7tUvpw+Z3+7G6jO53+16iCvQ5nBzL8u3a/H4P+NW6yAk=
X-Received: by 2002:a05:6122:3122:b0:5ea:db3c:4a3f with SMTP id 71dfb90a1353d-5eaebc14cdemr1063889e0c.2.1792597069786;
        Wed, 21 Oct 2026 08:37:49 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae97f0a94sm3505688e0c.11.2026.10.21.08.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:37:49 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Wed, 21 Oct 2026 12:37:32 -0300
Message-ID: <20261021153732.1978410-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atjB-BnXclL3FcUm@ashevche-desk.local>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <20261020104753.28703-1-vinicius.eduardo.pedrosa@gmail.com> <athe0QikG2mzCAtd@ashevche-desk.local> <20261021100049.16504-1-vinicius.eduardo.pedrosa@gmail.com> <atjB-BnXclL3FcUm@ashevche-desk.local>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On Wed, 21 Oct 2026, Andy Shevchenko wrote:

> Ah, dw8250_idle_*() are already BUSY-functionality aware. So, what we need
> is to provide dw8250_idlej_*() callbacks via struct dw8250_port_data and
> make current 8250_dw::dw8250_set_divisor() to be part of dwlib.
>
> Patch 1 (dwlib): Add callback definitions for dw8250_idle_*() to struct dw8250_port_data
> Patch 2 (dw): Assign new callbacks and use them in dw8250_set_divisor()
> Patch 3 (lpss): Introduce stubs and assign new callbacks to them
> Patch 4 (dwlib): Use dw8250_idle_*() in dw8250_set_divisor()
> Patch 5 (dw): Kill now duplicate code pieces
>
> Would it work?

Yes, I think the approach works. Two details from checking the call
paths.

dw8250_setup_port() is skipped for Octeon (skip_autocfg), so 8250_dw
would still have to install the setter from probe.

For LPSS, I wonder if the idle callbacks could simply be optional.
8250_dw would provide them and LPSS could leave them NULL, avoiding
stubs and a separate LPSS patch. The common setter in dwlib would use
them when present.

I'd still prefer to keep patch 1 as the small fix with the stable tag
and do the refactoring as a separate follow-up series. Would that work
for you?

I don't have LPSS hardware, but I can build-test the LPSS side.

Thanks,
Vinicius
