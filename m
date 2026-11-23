Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795457967;
	b=anke+C5vPqkBtlhA+9tXq1YX8HkDPMswu8m+EE32JFjGXP6gKDNoBnkgZ9/UBGq+8cGh
	 KTmvYcjQGa1/VaE2IA61LKx3AgBYf4cBWH0R2tlGP8CDC4wTN+OZEIiETDYlRprQvGsli
	 /G8UJKjrI76X46008l43qEt8Q3yd/uztp5vkQyGPHZ7VnQOxRiEQKOvMa+49yd8SQPLby
	 X6uyT7wq0ddleOK6jjV6xCPNzx7mWtZq0yLX11lk4bGH/S2CyfUDsM8lwIlaibGRVS85a
	 POJUp10NHjYkn+aTUWtrbLO2CfA8SSqXfLlhyKLl6Uhi3tXK1KoxSWwaWZa+7qPyr4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=w/35+OKTYeKSrDPcP1f5IU7EdP2ctykP8aw1CQHX1hQ=;
	b=AORtoe3zqV2ayfiu3HGup6EFK0xpVyNcbhoQcRp22Y6PYP0s/buZAXKlTSXGdYaBPBwR
	 7m1JTU+PF6mImlcEld7nhS+bS1nwu2Z3scjgDgkhKuH/YLIWtbuP4fikd4uGThQsO/OWW
	 BaOLBAIwiCEXzdgGz8Iraqud1AhuinVbipcekQPCq7iqAmZ7TAW4Q5QD3mXbYbmWCuhNR
	 d8FecZI0c/SlJLZc6yEHWAjbmCaSeRm5NlM4zvw3H93M+pG6x0eR7xmrDymtgVsdjIGjq
	 QqFiLwrSnC7qnkjeJXqBY+FSdCiavwD2MhQJlkjslfmMpEth5yF2O5DizaW6Sfr35sQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BeIZfiH8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71631606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71631606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BeIZfiH8
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f04b676219so18793075ad.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:19:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795457967; cv=none;
        d=google.com; s=arc-20260327;
        b=BZLgPcG8scTQIERJPYXSB7VRwR9yf48AOY6koFhYOmvKotg2si7b1vh3nLUhKXC2u3
         QWYvV9KBD3plxEMzNi6lLxmGGxylJ1IrEouC+95EurfzCTtkixQPe92bF7b6vJjFSPGE
         yKRI664ET9hRyB6gcwd3tM2p9K9OilRu6yVGqaro8eeMG0kmQShdYJ6y6iSFqM1XJeVP
         iwvBuNMhY2vkQn6RSq2cwOGhW7Xxx8Vq3zwolJ3YsgCPBDvxcayMecuHZN5LXdYNSaab
         Na1tiTbB24AdiCA9WZppzobUxNVvESp1eNF373rN0mXO3hXoRatXvxdRRhbHYA86+Xp5
         sABA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w/35+OKTYeKSrDPcP1f5IU7EdP2ctykP8aw1CQHX1hQ=;
        fh=beSUoDw6/2bZm+LbEZMaNzoHEYdyMdyTVMx0Alntktc=;
        b=A8jja2lEQX5WqhdJykNfOKF8oFw6jbJFLP91yXFrlosAbxnSqguPSTU+4nHCYvPDJp
         am6DLWTmWF48IVhgPm+n3rHZKfmkdT04AP60YSktpVH9MuyYorRWEIXVdhmY/lwkKEg7
         edUQA1izKXbUL11WUkNpyaysygBqX9F7Zc/iPYWklsESZVoiy+o7KAxaMBhXqCqMDP3Z
         0jlBdjiUHGshNZbXoWvGE95x73xF9CY+WO1Y+Pqe0uMCq0DeCbDHKTbEzQ7AUqGtzNZJ
         mHCyDMI+GSohfbwCQZYXgLzF2XndyfzVDT8LC/paJ/laFbDHNWwOBy6L4NFcFcZwAHtU
         4b5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795457967; x=1796062767; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/35+OKTYeKSrDPcP1f5IU7EdP2ctykP8aw1CQHX1hQ=;
        b=BeIZfiH8lmNZv9AODq63hfwH0kcl7oER/JqoFO5mZ0nrCRFc64RVVWS8SN2v83vaXr
         VmWt3JTRIHa7EjZ1Mpqdyk2LWYXr2B2hJMBkklsgHBilzzeSE46KgfhAF6jSHrJeDRRI
         AysgB/765S1pls/85itaJVtgLVHqWcrNZDF55sZCdA/y5JJ35wOTJm+XlvAnCKIoEbUo
         hQV4habSPIF3vqIqhsJEFVlVk3vy9udhnWH9tEZIaLk1gYT0/0onfWvnAwewqjFo5nmB
         aGfVE9usyCcApU+2a/grkhzZ8xtJCKGOLFqGtL8eu5/weeOGOTnG3vUzUaA34fyAwaSc
         tPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457967; x=1796062767;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w/35+OKTYeKSrDPcP1f5IU7EdP2ctykP8aw1CQHX1hQ=;
        b=qtBs//p1jcT8OmyPhtFuh7ZCZRYdqnN7TMnOIZhNvQ12RZn3aUcrzzSuwxf5oTpkBH
         RXxm5zd3aDUDIXS8QpDqgtPYqxVNUMa3gsi8E+byyXNigV4BzjULB+aSHqw0ABP2fQCR
         cCive63M6qKognZi4DacIqa1m7mDnxFdETWmG2kxuMScKEFjZv1ysG8hKXC0IkyEV3ng
         /mEEbWSywzHXxAFnZlE46H6IZoJJmUK3WkFc5S9+5mG5CPs2QhAIMX0KBvLnW5tsspeN
         Int6AbWASdXql6SJqK0TyAMqBIWG7ier0vlZ6M+9CB/c7swGbi6QKvFoRRWUs86F5Wx4
         mwlA==
X-Forwarded-Encrypted: i=1; AL+hErEsHxwgmY1ETEZMzDWeqt7yUAN+6TRH7kNE0SxafsTddNv/eVYFGqENu5MjuOKJcLdbKIzAmYp2AcB9@vger.kernel.org
X-Gm-Message-State: APuU4Z9SeTULkoaSd4QiBWlpvq5mT3cbw6VCyomP9a5j7PI8YtMEaOBe
	JYLIo54lrSUq5R7IQqSNdVNlbeC74a4gVbBsiCd4UuC7ArIlrG/FqKml+xnDoKypvL8H4vW8DH5
	eTMqhcEA3j0Qqs8zLBhh5sKU2N+aSnWQa7jl8
X-Gm-Gg: AZFdTZerS3/V3o782RrOBbf77tJxHfuRL2AHdEuQYsUDBLIupBRx7XntY/ehxge1hAK
	WmAI9Dv807+DNrWpwuG/Xs+vbo3UWxfR6ObMetiDa36vkNtBpX4Lww+hKcvn9pmFqMKyzxARdTO
	7B65SGLTlTFheR7sMqppqAa5tjEOBb8OcqbBqEMYaXI9VBCbY5nCtVo767YyCBgmRBppuxmirKO
	5I+tAUgLxa7Em14l9GucLDg++KJUGqC1+BB/KeWrNVWd4RGKUfZJf1aXBWThclbfryxz8Qqx2bs
	enCOtgkJhHlJA5AJzBQogNT15j2nYuIfAIAic985XhnkBszMHmmDClYDTGoHwfiLvIX+fZ1Y+Ng
	LL2Ge1TqlOJ9BD3aqpKMidBe9GEhixd+ewiZSgQ==
X-Received: by 2002:a17:902:ec8b:b0:2e8:6ae2:75db with SMTP id
 d9443c01a7336-2f03f18a9c9mr111167675ad.41.1795457966645; Mon, 23 Nov 2026
 10:19:26 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com> <sashiko-outbox-221816@kernel.org>
In-Reply-To: <sashiko-outbox-221816@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Nov 2026 19:19:00 +0100
X-Gm-Features: Aa3M54oPNh2HItK5OWAdt9J3mY6fBO_MvaXSMAuL_-aTSXsvBo00wfnHc9xmRpc
Message-ID: <CABdCQ=Pu=_M7wbP8SWA3ux4ztpnJoR3PzCn3bFg6ao7dxqXpUA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: add PowerVR GPU device node
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

> [Severity: High]
> Does this break the DTB build when CONFIG_ARCH_SPACEMIT is enabled?
> Neither include/dt-bindings/power/spacemit,k1-power.h nor K1_PMDOMAIN_GPU
> is present in the tree yet, so preprocessing any SpacemiT K1 board DTS
> that includes k1.dtsi fails until the prerequisite power-domain series is
> applied.

This is expected when testing the patch in isolation: both
include/dt-bindings/power/spacemit,k1-power.h and K1_PMDOMAIN_GPU are
introduced by Yixun Lan's prerequisite K1 power-domain series [1] (noted
in the patch cover notes).

This DTS patch is meant to be applied after that series lands.

[1] https://lore.kernel.org/linux-riscv/20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org/
