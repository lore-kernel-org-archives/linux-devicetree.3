Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793816940;
	b=VgQoqcAhLiQA6I4Yk49EZG5UfZcMmhcOTMPM3CbVcDiYh6oSJTin3D21wpwIGgmg44p3
	 L6wIgWVY5pxUEA6rjaQTifpmPY6oYavjfphmhrd55F3GOpOMbgbkYTVRKL1o5YScHeMNP
	 8ceiFhB9+ty3k/mxVmE5iEl7h2DNrh4UEgDP7hDP/n8pz4HgFY11glUIfMhihRKehPCif
	 tQFVY9d4Lg0rd1e1B5F9kFK3LuayyY57CshtHqYn3FrG9+g2+8GKcoqFsg+IArQC04pDe
	 QHd8bUDK2lcxuZ+GjnWA1goOlDEiJ8KOUNmtLAeg+xr0KvwqiswOSw0YCTX145M85Yg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hdq5Jhzjm532KgeiTAQzmaCt5J7t13cAH8v0sEUsNDM=;
	b=YQdWZigdBY2EB+QKtCjs2LZjeDtF5NYZtJEQ3/Y396AfK3mXiOOBusQUpdOd2VmCq7KF
	 Kcf5UquiwZ61IfAwz0frLsqs2lDoyKvVm+ii2diB+oPAjJy2lJcTewvajTbEzhjMXG/ex
	 R9Wgb+25w/OPylr2hfrAxGuAfZNuasIrwitY0nWHD9veV6oh5cXlUeLAHkVpy6pDdPYwp
	 VKUZKhLeEVVd0SkhvOBerIBVUezoZ263wB4GY+i1HkG0Z8TunsXxIASUFsKqyg1hQ2g5/
	 /N6DKOUD8jwN/jwTMVzI+KYmMvQlj+7hCEdEsBYkCtX6AFsjPgpomo19b049fqh+BJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l2lZUqHx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5477E606A8D2
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5477E606A8D2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l2lZUqHx
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67c02c106e6so237266d50.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:29:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793816939; cv=none;
        d=google.com; s=arc-20260327;
        b=pLNZ/0zPgrm15vFho6YOZ+hFPzEp8balnIiN+GdCrAh2VRwhc2IuCqGPDQZ0uLsa22
         qOB5SzxTv4326k862IZ6Ul3Im7E5dbkk8OzOl6gEK79T1+e3gm+w4w1YTQAOCsYBsOo1
         7IFNImkL1vcIJbD6If6uQQbstCVdExBPcRJBS63mFYPlAI6G5+NzmRuKicsVNfed71Q4
         JVjazb+EQaGEliqkfjHQ58aw84cEbS2vIAzqobAP2Gtg2X5BIYdWxBZUAkQGWDg+pK4i
         lWDr1eYlQn9pN5o6i5aEqcodW6mQoOqnLPdDFpZ1lm3D8oU/BoqfMdfo7qX26Gng5soR
         n5VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hdq5Jhzjm532KgeiTAQzmaCt5J7t13cAH8v0sEUsNDM=;
        fh=kphqW+EJXO0TYkUriML7ogE45LzhaLvFPuDcViUtSvE=;
        b=OuDVRy7fxP+mG1PYq9rHeOYqURMyOSeYxBwtwJl+8yYzFSw4JKJiB0yHSCysKoTorC
         YZguej/HB4lsEXojLjrIgQoJBnbV+as2wuuBqX2LZ+RueUcl5UmzdnK/ikPk8kif4D6X
         gWnc1n9wR5f9SNk//nrkC8nEg7QjukwXqdabZndD8UQerZFGDL0DLgfzPJdRhHx8Nw2v
         wq63Ch3iwZDBybfKyOiIWvr00P8iqBySlauZn97GS7U/5IOTRKpzPwIpURXmMBIK6eFj
         yImbs2zYQxzlPVRtCoPsqM9y81A6B4zpClCgUxco40nCamOc2Nvjh65iLi/nEps6589Z
         9O8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816939; x=1794421739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hdq5Jhzjm532KgeiTAQzmaCt5J7t13cAH8v0sEUsNDM=;
        b=l2lZUqHxKUw0nVrkuB7yPry8j3h//8yuowAAoRk+iBZEM4cUm5HbFKEqIhFTekpFo9
         YufDO7KmNAtlily3UOzkmSHWL+3d0+fRhWAi1qPSyQ0d+DsyIYR8LPKHgxf4bVh/vVfe
         gimWuz1KFm1KglmAlXKWddzo9OO+rLUzUK/Op1fEQzaNNNI/hdmsBDxPQXYr8qzFFwqE
         ADj+WRTqWBKhSdkqk0bPE6w+KPwFcRgXT92mhvhuUz9dXxo+l/+tbMAnR2qWkDkmhKdt
         B3/ruallS+TloRVjzjVD3SwbMISpmzHYl+s3+6fkb+90pMguBaHZ8+mpjFHA9jB5wVkr
         rQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816939; x=1794421739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdq5Jhzjm532KgeiTAQzmaCt5J7t13cAH8v0sEUsNDM=;
        b=HbJwMRO+PRYql5a1c1dHD+KV2lsqi8oZmPQGe2tX3fZoSkbcueCRXw33L9dFRK2mW9
         lNPASfcXjd3HWeOT2c42bqHIHqfThmUeyg9rtfZSbJSnxOlclSXieaUGGKMGzCxv0V+V
         V8PfF89n/9YLB2ywhgTDsdYn6q0a2WL3Q5im68vwVYjsCRt1hghHUs844K5QiZR+m5C6
         /aYwcBqwUbBIMQOOfpIs1jcaaS9T5zgooAtEDvGbgF2E8p/RfnJ+qfq/BEgTA956PoUA
         LFCZ0ZzO7banMRXxuK3iQWoj6SVLs4Jwbop/Kym6zac7ZujzXk4HS4PbHV1bw5dQg55z
         z33Q==
X-Forwarded-Encrypted: i=1; AKwUvBxEL+DafG0+Mj0UPuiYsZA87Xa8W98B387jTDISFB5TJcPpJCn5IIkRWSgFj40+x0XNIrBz3YWTtElQ@vger.kernel.org
X-Gm-Message-State: APuU4Z9dgNUgF6J84LPJCZod5Byk61gAWOheyOBxhtcUKVyqcxSf7tqR
	Q4ruXMxPLaSY9Jrs0a1KOv6iKFxB0F090KPgP6ZCgbAkEGpolQHDXh6YtRmAOlFfJbXysooc2/a
	bO9mJspUv8UY5SgXWYb9NIm0xTHCUzhguMGCkFt8=
X-Gm-Gg: AYBFou2DWWhFY43jEi4bPZWIRyrYnlC/e+eRPvVFta1Nw+t2/eRaXYcE2z6Jk9Y1U57
	pZ+JgPPtYgrNu/79cmpCMoL2uti0xiPizIThyylC6/iWR/pLOhmnVElCSN+KOGvnjZc+ij3JZxX
	u8TQQ9rndy0C6h4v8cULnpNTUPNTTzq1HssI69EO17W6Vcq+JYQTN5VAo6hW43ydfzxaRJpk6vs
	PjvNsNYxNtFLEKwtZu80x27QGXsz0+5iLtGuQ8c5FtJNllw5SzUZFWbbWi8CEd8gRvbOOY8Nl0e
	E7dztowbgC6C3m9DZKNChUmSSWpjEpp12r184Y40NBIy6vMljqf7EyD40EIDa9rYYY1vs6XfU3J
	zNilPDkN4BvgMY7Y1Kd5JjuJsOvVdvQObRWai6uh8fhqbsR1nssmXor4RKoI=
X-Received: by 2002:a05:690e:1c1c:b0:679:9340:acb6 with SMTP id
 956f58d0204a3-67baff093ddmr11231324d50.98.1793816939248; Wed, 04 Nov 2026
 10:28:59 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com> <20261103-spacemit-soc-timer-v1-2-36722421db6e@linux.spacemit.com>
In-Reply-To: <20261103-spacemit-soc-timer-v1-2-36722421db6e@linux.spacemit.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 4 Nov 2026 19:28:00 +0100
X-Gm-Features: AclHuK8q2ZYeS6p9RTAqL2gmNJFu_7rEVvUOjm2KNLVXYzJFGgWF-O5cRxqiuAQ
Message-ID: <CABdCQ=NH2NDYVXvBFoM0k-Gn9XB=F5FX_y+uNomjTCb0TtpqFg@mail.gmail.com>
Subject: Re: [PATCH 2/5] clocksource/drivers/spacemit: Add K1 timer support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Troy,

El mar, 3 nov 2026 a las 11:02, Troy Mitchell
(<troy.mitchell@linux.spacemit.com>) escribi=C3=B3:
>
> +static int spacemit_timer_probe(struct platform_device *pdev)
> [...]
> +       irq =3D platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return irq;

Consider using dev_err_probe() here for consistency with the rest of
the function.

> [...]
> +       rate =3D clk_get_rate(func);
> +       if (rate < 32768 || rate > U32_MAX)
> +               return dev_err_probe(dev, -EINVAL, "Invalid timer rate: %=
lu\n", rate);

32768 looks like a magic number. I'd recommend you to add a comment
above explaining the clock rate bounds.

> [...]
> +       timer->sync_us =3D DIV_ROUND_UP(3 * USEC_PER_SEC, rate);

3 also looks line a magic number that could have an explanation. I'd
suggest you to add a macro with a proper name to have it properly
documented.

> +static const struct of_device_id spacemit_timer_match[] =3D {
> +       { .compatible =3D "spacemit,k1-timer" },
> +       { }
> +};

The device tree bindings support both spacemit,k1-timer and
spacemit,k3-timer, but the driver's of_match_table only lists K1. You
should add K3 to the list.
