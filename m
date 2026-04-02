Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D306C3AD500
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132961; cv=none; b=CVodW2dvf51VNUNykcNqjgckjJEjd2VjVgt31EJTntrLzdufRIEoSQWbrkf8R8cg0Q7RuS2YjaoMaVZhJ+MCC6oRdt3fEAF2UUtWw5noFnd6bOmJ7dw5JJcUgRD8G98hpcQcSc0M9cMKl1mop2bQCa5mgsRt+v/7nepwG/RdFgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132961; c=relaxed/simple;
	bh=d7e7s7TnTP79BbzuyFXmjqDe5900yRh+zTsntc7JiEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZUlptszQWI+q0/lKWlNjhX/1dw+PgWn1ppfBBUpF+t9Bwsz2oB99BADnOCjerp7aDXiToQqAgAm87ZAxDRxNTNXgC2hA/1QkLQvMIsrV4HdyCAtAs2IOSdPMUAZ1hJ0pDoil5xfmwRoOCapMQCunx5eyRV119p5uD4LSF00rg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyuehP9f; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyuehP9f"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8d1b746f522so97413385a.0
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 05:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775132954; x=1775737754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vcXn6b67rRj+CqXQSR9AVzCdCSKAtKskjZ3iuSBT3lw=;
        b=HyuehP9fDk8oSiKI7LBaJd1hrgLCtfuuelPjk1/eBfOA/NogVE8/JoA+xrZ1KjlgLA
         Gu+mWj0HIc/EVX0e2O37zsQ8F35HQFNGkz36FR5EKovFb0j/0w1gDsnDB7u9mserKeZe
         /E5vwNyGcQs1vwVWN1+MRLajkLezUVF3eNtAKqAvoBN2j4oQVlH97Ar5nyJubhk9H4Oa
         nzZef7PKb08MKmaDUS1qq/Anf7LxbIxHRDcsr4h+9Baq9NLFjFx0EpZUQtwGERWPSnxE
         FUwQfGgDwWEHqi6ZZASGMNfECSntg08XCuZEHEmkhhmNd9RIZUH8HeolCrs4IPDYizE0
         Oiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775132954; x=1775737754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcXn6b67rRj+CqXQSR9AVzCdCSKAtKskjZ3iuSBT3lw=;
        b=Oy4x1lqZHXAq+h8WntJHaBrxuu3yGxDyPrAoWQWGSGj4v009S3c28eDM3C9lIj1+ix
         mIyac/oixablKKh/oas0xCfZMtxr97tLdVfqXjjPjDNiBNRwtf+dyjmrgXB7LNdJXruC
         CQnJlGCfYZhoDx2jtfhfWCKuXYWAHhOFffrBu5brCtTWSGWz8BR9dXa+pG2/VZ8pw0ba
         FZzb8PXUS5Zfy5F9xAa5qzh8jvvBkhWa4u8L3Q/IyD/l4l5EIVHmk9bRofcyJtbBRNX/
         w1wfLZjCQXaMxM52gIoT3oT24BSTZxySkHqEWu40fsZlEVsxkElg/HABZNreejnAiuo8
         eqpg==
X-Forwarded-Encrypted: i=1; AJvYcCUZmHSRoT5nPVVrkwlpTVfdTamsc7Wxmb/SeSjYXvWEdxgY2T50ywCBwWHUTBJieakc09WpOOHZJ8z9@vger.kernel.org
X-Gm-Message-State: AOJu0YxMRZwKgUs24niwt3XfdaWEStdwduKMRL+C9naOB+65dIIwOsst
	DTShmrfJlC5v6t+OKwSVcZdWpuMffWBu3LA2SmY+iBcUbpI6yWQtc8AT
X-Gm-Gg: ATEYQzzxPwtTFEYzfTPaQ7JXsGFuyQIsuy6cmbhMcUxxJAELPHDdKcmQ8mvAyi0n3sK
	zfe3C1wrqGrmNGglmTOKxqFW8JVnnSCgTgIjyVz9vMDlH7iLx9BSfNTjixRijriH23J38f+6N5q
	W8l0LpFLAi5TJs679z8Yc59ZfDbz0rcwOWbjZrOJ9CeUSn17tyBasmoqCncKjMoCMcXsSLwGu9L
	KkuSoCdKDns3Pv5ypb3dLTO5I2/BJCBNw80xB7D3L5ARpudGMlwJPaowTJnyJ+xHjM0RKHkL7Lm
	zS7cN3PEphHB1MCobamPJgZNzijujQT8Sd6ZIVPXYGFvMIdpekWM/eDuR0cG0w7pKFK57huIJQl
	yvwKzgwYfXVnKXUyCZEoXk0Zs/GFRQq2nx004ZnM/lQdxDqypYghrg/8lP5l4wn8f0XXoxCCZRJ
	r7TNmTr7R3+900KU+zYMRI3CV+MndHgMr4/ORHGHZJpumzib6YS/Ai5ehz
X-Received: by 2002:a05:620a:4802:b0:8cd:b38d:be7a with SMTP id af79cd13be357-8d1b5aac3a6mr1091790485a.4.1775132953851;
        Thu, 02 Apr 2026 05:29:13 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a8647b4esm202845285a.32.2026.04.02.05.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:29:13 -0700 (PDT)
Date: Thu, 2 Apr 2026 08:29:10 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
	unicorn_wang@outlook.com, inochiama@gmail.com,
	daniel.lezcano@linaro.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org,
	chao.wei@sophgo.com, anup@brainfault.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
	hanguidong02@gmail.com
Subject: Re: [PATCH v4 0/5] Add initial Milk-V Duo S board support
Message-ID: <ac5hFgLav_4oB2QA@sleek>
References: <20260328173450.219664-1-josh.milas@gmail.com>
 <88400fa8-4545-49eb-af04-d82b94a89757@rootcommit.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88400fa8-4545-49eb-af04-d82b94a89757@rootcommit.com>

Hi Michael,

Thanks for testing this. I am not seeing that issue on my arm64 or riscv side.
I am able to add an IP and do anything I can think of on the arm64 side.

[   96.618687] stmmaceth 4070000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[   96.633977] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
[   96.676436] dwmac1000: Master AXI performs any burst length
[   96.702852] stmmaceth 4070000.ethernet eth0: No Safety Features support found
[   96.748740] stmmaceth 4070000.ethernet eth0: IEEE 1588-2002 Timestamp supported
[   96.772880] stmmaceth 4070000.ethernet eth0: configuring for phy/internal link mode
[ 1359.377528] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control off

I can do the same on the riscv side but get a unhandled signal for TLS traffic
which I believe is unrelated as it doesn't happen on adding an IP.

I'll send over my configs to see if that helps.

Have a great day,
- Joshua Milas
