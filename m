Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795796548;
	b=J5XCBFC3ZsCNMQUmz3SfH3GTc4/NqwbHYSuqfuxlksfGOxXNsg5bShCWBxIKmsy+icXB
	 QRRtOqxKZqXCFWY2SP9gV341GXDEslhHmdQv6ABORKArXbqns9bxjdClyQBCLKiLKtrTc
	 r9H+zreyPhfACc0Ud5cJBYVJ01c8a4yX37sKFpTsWGPxG1/68S/YFwugqD6oj2APAuhPS
	 CGkvp4T/bB2HbtZv/+dVTLgUzYIosw1AZWGBKoCl2NVLUvnwV0n8adaKOW6nANT27ME/g
	 k3Cnc6132aGXrgVM0KCpdYmCVu3ZyOvfibWqFaznhGBUH9/gQBsEnc4PIJSQIYcNdfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xGF7E8bL6eqxE+DsS5vMeqDfnm+UP74XOc2nxISqzRc=;
	b=pmaFjvEcpA8ks/cJSGERzdTMQhSzd316d9gklLQrJVJPzHlOwKKFYxXIkmFoTvqAXwmR
	 5yuS/l113dHEjrKv4cGg8YPDrdnusW71TrK3poxOEAKltmkT9VeRZ+MVqJBgOGBtDb+jR
	 m5m7AvOwjgd1rQtaTExPuXvL+z5TZq4iIkMyzlzJzdNhJ1gLKKJ+mXXiThfchKrKXHGzb
	 kyCLigmGpsIClINdYtM3cG4JVKrOr2rl2toVihRj5CfFoXZ/oMouR7l4Bqr8XC4MsYb0t
	 qf8K+ojVRQb+T9ACX9y/2TWJji5ylpsbezL9f95yhQSUPb3XIOXrYhHnUKDYhu0lTPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edhb7M1n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35905606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 16:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35905606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edhb7M1n
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso2506774a12.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:22:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795796546; cv=none;
        d=google.com; s=arc-20260327;
        b=KL75981KxliXkSpNPDYqWH5ijceBa8ro2hDtS7Y8+Cxoolch/EeTx/OIeYMx9a8D/F
         qskjGppNJ1yy3E4f+lgUcxJUR0sdvG6eW0ag6izvExmGmboGic7WuLLECErYRkxAlV8i
         RuU1gvrK/ATR5hrwhNJmySI7jWzvSqwJXZQlaN1k85Di5hRfPWzNuvf325vUrrjgMp9F
         etFb9gugcer1lAg6dP/CH95Bf7KaRjb67MOpD4cjtNBbFTf78qA9/a1pBzzEtXe2yRAq
         WCoI+3vBufjbqhV3R5FGpQdmWBZ4rvmBstJ0u7Y4W+tajV9mLvyPgJgCLx2/0koU0znd
         tM+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xGF7E8bL6eqxE+DsS5vMeqDfnm+UP74XOc2nxISqzRc=;
        fh=k6mZkweXMonpngDfd8OV7/MjNxFoPx2HS439FFKJLqA=;
        b=J1SEiCnusRWzaByDid0UI3i3O5D11BdbM62bWfDDKCt69N8xV2q6pHQPBlBgZx3W0W
         5Kq6YtRhuumGPhNmd7nDoNjuGPSKQgAQZT/TZh6Z7hSY4C7HfSWHW9WHUrObKc0JaR5i
         yQnc5GQCNw4lBWNcrX65JxeCLomYxyWaDlCSPigBML/1aaJ3IQ/fAkeACVfqvGJO8GMz
         FfuEqJDZ6H3KkwbletkFFLtU15ulgkIGoMOQv2BqLq4SDMi7dTqlv9HDTMa+GULYKofR
         gtFFryFEIXWIzs8GWXFOCY/XwaJeRSo9vMgKg6pN9IWnw+/ivWzmbQU0RH1Ef4DmN3AI
         5zag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795796546; x=1796401346; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGF7E8bL6eqxE+DsS5vMeqDfnm+UP74XOc2nxISqzRc=;
        b=edhb7M1nZUhi4oVxbok9hfWpYA92FcmUhvDUrnAWtUqlFF9iFs1GGMnpR6ULJJjsxX
         LEXYIUWzaClgcf6FS9o/3/tkGmcpS1fmwOWo+hv/vWLljKeaSij91mIvI60++5lR409A
         pledBsf59fPSrcPJp9BN+Y2hJDvtr5+vwNm1hxUkGIMThlaAWKxu1B78lEjNI8GERhQI
         u91bg8ihSMHKmIgkEP1k3P5DplijAXmRcOFNtDaltanGKEjV8cbOLhGFYTUTcB5ktz9A
         Uk4kA752zgf+GkjlG6hXTydkh/WENaiNZMkx2Wjd3Ws35rUojC05jLBn4yd6vD/DYDQ/
         cfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795796546; x=1796401346;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xGF7E8bL6eqxE+DsS5vMeqDfnm+UP74XOc2nxISqzRc=;
        b=VfisZwzOt1/rjiOMJLCGrrzuQDekgn8kge1TEH2GuKy0bZpXpbPTna/QN1jnClB/c2
         64y0veXcO508liPm183m2uE0Ixd1dcR9M1uPqa47+27j41uGVdVpaeBJu0TfPWRYgwfS
         vwrsP3VcmSoJBUu3qcQPbNmHWVgQ+1E4Z5X9qhAdnIgig2RE8mhcfemBXxTja3GDxxk4
         gWSbpHo+/tXgWXkmlspEbK/BlEpMTY94iiIzkJBFW2VNCifoZWPhKrd+IazMt5uzzp0o
         79e/ARr9zA6s7EuyghT86wlNxC7WBxSONuIrxTI362kdIzZ61lgacpgT7ybN382Dbx/c
         5X5g==
X-Forwarded-Encrypted: i=1; AL+hErEzAaacNXDwi+u9mVgq94Xc9UBWdkkHISJWCLrmGf94vD/bw5sjBfDK6hvo4k0mHpBXsjuvcLeUx80H@vger.kernel.org
X-Gm-Message-State: APuU4Z/+i1/Gfr4Z4YWQlOV1KoKJP0aOPiuLlbigJD+2T+OwIB8IYRia
	UgrPk+YYBfSIytqQo+LGQSFUrwoqpRFiOU0f6nR9eplIfon7BCVfGdTJiC77naHOSrp1VZwBzTj
	WBCOtd/FFyNy9t027prdsCpxJjvWeOzg=
X-Gm-Gg: AZFdTZfFTtCad9BJrV4KfI1aGdyD5vpFi4Np1CyK/YIAip6zqLllBqrt7T2BSKrmZ04
	ZEeTmbcYCEZsFXM5hYzHBH0gkVl0DZm97oHipxlEZeH5BEpuwGDkXeeQptUZy5Mzk7Ug2rKAW2H
	MmG4hwJAkKxjxkx1Y+Z0+uXmRbdvW0vtsVaUerOMhd065bbWKG7fp0RKlG+0ralTpmg9P7pyHH3
	iH4zDv6HSjC17px7lqntpCDtzgPNew14Nsog1bqsxq3a0o+ohFr9L4kS/TKRz2dCk1OwmADctaf
	f6KvxPgVnQWqQCnT0+MKQSQWfBjBYTYAbH8nNTB/g7noNgTt4tBwCmeZi3eQecweUA8g3r1Mb/u
	XnasDa7ZUH5nKb+kCsI7uYMAViDAjC8JcGUs=
X-Received: by 2002:a05:6402:a307:b0:6b8:7f14:dded with SMTP id
 4fb4d7f45d1cf-6ba37ea7705mr14055793a12.34.1795796546329; Fri, 27 Nov 2026
 08:22:26 -0800 (PST)
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
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 27 Nov 2026 21:52:10 +0530
X-Gm-Features: Aa3M54qbxpABrphlzhxg9I2Mo9h5VFuq3p0P6kC8_azVaeYz0HCPXkRvM1DueFo
Message-ID: <CANAwSgTFJDGT5pR=Pv0v4RSWqTZ9q6YeP14TANRUrBrg6Be_oA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add SpacemiT K1/K3 SoC timer support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Troy,

On Wed, 25 Nov 2026 at 07:54, Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
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
Tested on a Banana Pi BPI-F3.

Reviewed-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand
