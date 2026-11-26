Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795726287;
	b=uJ2Mz7DlGRw1XXNsA7iEdmCvl6mHHSnXdND70fEqARti5Dna1ou6Gk/HMBwaOsU/Cibv
	 tBQoPi1w44YeMVnldZy7ifOH3PwN1XisMJJhyf+F2K4ywFPF8HAOKiNOJBx4spZQSPdI2
	 zjRJaBR/2//AfDOwFeVNPFo6/4oJiVBY/25NMWOLw5amwvgNfug37Y8nV44NzWd/BkyQK
	 iatUzniN5hUqie2lEh5/Sdp/2+GrAkxRESHIq8LWO1xeAMU6w2L7AyhR6KVUSlbQEAcDZ
	 WLSu565YPma85PNitCAVOwsIw4Gx0o6M64hVD+hnu7PSxGOBB9D90OwA+ehsRHe9Oag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KjPQo4q/k3/IK7cR8RIRgyLDoYYjcusaTmDtFIYgl8E=;
	b=VXaYI0mMxMeUNB4Q/Tz4uBdcMOwa+yjjtoasPjrRXdBa7XWhmmhKFHGXQbVxeYeT3waI
	 DfmQaE2siv5+QIRL7/sG6g7Z8zVrIgl2+oCVHqT4f7aj+83rh40X5zU6Os+tGEuRLUTa2
	 1t1yAJ50BQX4tsSPqwMP6CMdOENy36Gga2R3jpdZninHHwt6nXbvBRJv4syFXwPYy+EKj
	 kgtzpRhaIHEy8Z2ark3IO5fPV6UHVU8cdw3H3DJyXYqphlxHssEOcQbD0Wqw+4LqwVeKQ
	 QAgSEjx7lYr4IeyirAe2dtiV/bnyF/OumlxoESi1WZ+mnG88yjvMin8hcVfSztr1HUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pWUFz3/M";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07E4606A687
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C07E4606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pWUFz3/M
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f04244c3d0so58690545ad.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:51:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795726286; cv=none;
        d=google.com; s=arc-20260327;
        b=irp2xaWgdZ8yjrIdK7XQRswZBc3O0/6ztbtEnEm2mtFiv3FuOw0XJuiu2oMESYcHb0
         Y6cU9WNmwse1aoxfVI6I++JH7aIGHDNtJ8wYBa82iruenAvClM7lhBFHdL1alfimCkn4
         Tc5xlGsvYvUa9Omma/yJiHnnmH8/qtzvKiyX4Cy4H76sMF7f+9mJHJ1YAT684XOuuOqU
         ltKeiGWQPOihQeOtJW3wVlCVBKkkug1jPa6IGwu44h9cuE8R4PBZmabL/RL/kBjV84Dk
         nJmsyroyxPJKtY+a+ZqwtPP5SaWNMdZs3XCCvBOHjHe85y9zSTRsT/FHW8aShGZfIwuS
         Ur/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KjPQo4q/k3/IK7cR8RIRgyLDoYYjcusaTmDtFIYgl8E=;
        fh=1sZqnBNKdDwtjJEOZscYc5ri7KG7oZdFVaTn3DYI4cg=;
        b=qj3WEJp7xm2JMpN1jWfsYx7pC9DjQUVFyyFFnPjmVZVifX4Yxq0o/JI9Thdsm1tTgL
         7C0dWCWFH8s1pdG8HJNURUURtQktXtsqyeGjN8vUzZT8GmJoGT7iAJG4GvI7Gczuei5a
         F+78wktG0TWBg5P4Iq+xvctXodw/CkYrM7dZ0uwuJphT/lTNmqeN7RziqFmdldlyM73i
         Ehruu6mz2LQfbWzhxlkbjm7ciFwuxdsAZFydHLjmoy8WJQItpypEKanEKSmFi5wN7Ax2
         qptTXb3Q4kR/PF8tP2XZ4cSspPpuSY7B/YemQNe6Fr7YKkuzRq7ik1CLnjb8CV6k3reE
         QRrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795726286; x=1796331086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KjPQo4q/k3/IK7cR8RIRgyLDoYYjcusaTmDtFIYgl8E=;
        b=pWUFz3/M7EmWEuXYofT9Wlt8PQb5LVGmCJejjLrN282r1F9m9LUgcFTgW/6gC1bDG6
         BSCD40lsLsshlKT/UGRAuVdbcwHEcnx01DVyOl5rkFGOLZnG9lAGhCZ5D9E4pJg7YB/a
         tfrK2fkOEt8VYi2X8jUMBiNAa3Z88xXWfdb3dnq7HGORnxK3znS4NyvDKjYnHuV3CXjD
         FidYpBONQH9MdrhOraRPikIVcNlRJbqjsQtZUzZAt7Wn1KlnCozlO2qVkUHfQJJtWDBs
         7MoCa8znYJOSQSgsyMWNN/DTuhfZ/DYQS1BFWEV4nd8vLIeXEbZ/dZ18aQwnfV3XROtt
         NVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795726286; x=1796331086;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KjPQo4q/k3/IK7cR8RIRgyLDoYYjcusaTmDtFIYgl8E=;
        b=LfGnX7YCIzldwr7gTTKfvtPJZQYoQ8+hBVy6tY73dtl4oO/5babwyy/0euMsbddv87
         opDrh6LI4wn86514h3Us+OAHhTfB0I83p2kfGZiHfy7u9qlWMnuBu23oYUk+yaQ6A8A5
         mhO4fluA7FnyZ3pACIjTW2REtGSHvaimxKckFBBoIP1MXmBZTYLd5sM0513xE8p59uV3
         VTfxhKABRYSgn6iN8MMfpnX30Hf2DZpJ+k+RN2tgx/oodK98h4/6aXOei3icmTBm2uTo
         7ADCqeEecGroVMbjDvfzi/+amYFqgNuBB6jEqgeqG11vB1AgpS++J/WkEkx/C32/cOoE
         zVRg==
X-Forwarded-Encrypted: i=1; AL+hErEUAAmrdtrnmMaxw8W74xThuAcTMeAjTHYRDzoGlLlq2mkU6lfaNaeyulF9gehz8crotESerhHk9P0o@vger.kernel.org
X-Gm-Message-State: APuU4Z+DTVOIQ+itIwZ/ELXAPAicpq+W83mmxCe3pAvEUqIv/BZV6493
	XngMzCxb55pkVbPfpgEhbkQx5CxBsBshRy0I86t373DRyf625BWh6N4vsa6iu5AbYiSTQFg7JEe
	raeQQcyJl1IQBKCUi4evQFI4sTt8c9jg=
X-Gm-Gg: AZFdTZcZ9eyvg7eeq88sUTxd71zMxaWY25GoKHzFscVpAunRy7CnGuHHtQtvYqscfCb
	r4IPnkba9Zazosn/19jHpx4urJBvwf3h4XX9mJDaG1L3ns7eplWfdgPnAojGwMfVNQAeCCGcbgO
	OpFV3T8ZHpimoXEYGShJiWc3tZiT/H0S05m2fz7fq30HrfREpYzRWJyqtzfnDmxjDSNK2jGVsie
	NRmR9peO1M/kL/p10FEdi+PG+LAOK/YlN5ptsd9F0uTgY4otAYWFRBzue/+fZ5Lc4fLzTvsisGw
	mFcuYSJLmdlZd67gKoH8k8XRhg2SwodIgYNfyBOig12PrgLFZl1X35dAygghhSUT40KDhYeVRfE
	pT71wBqFVP10tDbzcsOt8JBe3lIxNgOWEEC7s
X-Received: by 2002:a17:903:4b0c:b0:2ed:352d:c619 with SMTP id
 d9443c01a7336-2f03f16ca83mr215219965ad.46.1795726286102; Thu, 26 Nov 2026
 12:51:26 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
In-Reply-To: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 26 Nov 2026 21:50:00 +0100
X-Gm-Features: Aa3M54oEPweJV68Vjz8cVs_U2wRf_Iqv5S5UWB4zm__2yBgEw8WUCZAIeYKD9Xg
Message-ID: <CABdCQ=OHaicMvAC=S+To2pQgFXupoUEY72TF+NUNF7ywM1kj0Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add SpacemiT K1/K3 SoC timer support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Series looks good. All previous concerns addressed.

Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>

El mi=C3=A9, 25 nov 2026 a las 2:39, Troy Mitchell
(<troy.mitchell@linux.spacemit.com>) escribi=C3=B3:
>
> The SpacemiT K1 and K3 SoCs have APB timers that run independently of
> the CPU cores. Each timer block has three 32-bit up counters, and each
> counter has three match comparators and its own interrupt. A counter
> can be clocked from the functional clock or from the 32.768 kHz clock,
> and can run in free-running or periodic mode.
>
> This series uses counter 0 as a oneshot clockevent. It is registered
> for tick broadcast, so it can wake up CPUs whose local RISC-V timer
> stops in idle.
>
> K3 uses the same register interface as K1 and falls back to the K1
> compatible. Both SoCs run the timer from a 1 MHz functional clock.
>
> ---
> Changes in v3:
> - Drop the unnecessary RESET_CONTROLLER dependency (Philipp)
> - Link to v2: https://patch.msgid.link/20261117-spacemit-soc-timer-v2-0-9=
264d0ea7755@linux.spacemit.com
>
> Changes in v2:
> - Use named constants with comments for the counter sync latency and
>   the minimum clock rate (Iker)
> - Link to v1: https://patch.msgid.link/20261103-spacemit-soc-timer-v1-0-3=
6722421db6e@linux.spacemit.com
>
> To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> To: Daniel Lezcano <daniel.lezcano@kernel.org>
> To: Thomas Gleixner <tglx@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Yixun Lan <dlan@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Paul Walmsley <pjw@kernel.org>
> To: Palmer Dabbelt <palmer@dabbelt.com>
> To: Albert Ou <aou@eecs.berkeley.edu>
> To: Alexandre Ghiti <alex@ghiti.fr>
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: spacemit@lists.linux.dev
>
> ---
> Troy Mitchell (5):
>       dt-bindings: timer: Add SpacemiT K1 timer
>       clocksource/drivers/spacemit: Add K1 timer support
>       riscv: dts: spacemit: Add the K1 APB timer
>       riscv: dts: spacemit: Add the K3 APB timer
>       MAINTAINERS: Add entry for SpacemiT timer
>
>  .../bindings/timer/spacemit,k1-timer.yaml          |  71 +++++
>  MAINTAINERS                                        |   6 +
>  arch/riscv/boot/dts/spacemit/k1.dtsi               |  12 +
>  arch/riscv/boot/dts/spacemit/k3.dtsi               |  12 +
>  drivers/clocksource/Kconfig                        |  11 +
>  drivers/clocksource/Makefile                       |   1 +
>  drivers/clocksource/timer-spacemit.c               | 317 +++++++++++++++=
++++++
>  7 files changed, 430 insertions(+)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261019-spacemit-soc-timer-cadf3088d286
>
> Best regards,
> --
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
>
>
