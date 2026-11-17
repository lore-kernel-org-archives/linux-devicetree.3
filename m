Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794876103;
	b=KlEzCb5iJUV1pMTWuifB2zvcOLHRoTmjVbbWnJOpUlqYjyZUvhrqttghXjeEAsqFNnKh
	 u9O+cCkjqjOoxXtmYrrp16NXzkyiaVALEc4ijjdv3GSIOLPrsf8f199xZ7NyfM1pP+ZTq
	 NTG88FR7Fw+HHBHbVL9yMk7XOW4+4TSFrNvW6K1UYIZeGu8Biwt7tb+wEqcbf2uhSnB97
	 PfyJ47oI6ftL9byUL5hcFiQalNe4Bsn4GmWC26VeNZun7kDNzK9uE4l0lEW9PhWo9XXhL
	 dLXbKi3nImo2aHFzTMCw2m4kccpNTHTfDj2tOs9zajO6uWzNI/1hPWbI5wp8z2DvnVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794876103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JJxaAqU/N4mLE/X/C5f40TDVe8Y+8SNJEnAV6SKgDMo=;
	b=K+rhYohdgr+4hJPi1qBhZi+7RddtXZcg0AZpqqit1/TS8dyz0ylTJGKM9dTGmYGVhdQM
	 sWQ4wLB3S8ueaEyGeva1y+P/hxC9GuT7amTdx7iRQA3BL4J8ny3o8M643rW5R0y0qEdC9
	 AwwkSBu3JcxazEFWcVjOHVjyTHQTiTGod6J8gKlwpmn8ah4h7QWEELD3kHExEvzzpKBMH
	 04l9z2MnWfVEiG4jCFFOC107h51THYt6TCUasBMnxY+c96ghDKikyDRzcyGJZ/Oddmn5v
	 FbGfoo43xz3xAYN6ZMD4wG2f9MmRWPi+BEBCFENhnUjgeT/no8KMNMKN297rfldUeYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tv56jH1i;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE465606A32F
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE465606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tv56jH1i
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2efd659464fso2543695ad.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 16:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794876102; x=1795480902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJxaAqU/N4mLE/X/C5f40TDVe8Y+8SNJEnAV6SKgDMo=;
        b=tv56jH1iv1IBTN63TvObbpX1zCNmAWOojKFikkh4lz/ckuHRpNc3A8s4Wryq2PWq0i
         LtA94VGruH7jzQKfcsrqeWhdsJVHAnXwTOv7zpqnCOG831yI2rV/SpdgWC5AFDzybxJU
         muzGdYZLf/fK9sbG68xDH224hPDrCNrvTCLZEjWiw1ndULtPpBEjZ62iT1BQY4qXtNcL
         GvlOnWa0MaMEwbdK1xo290mqxB7muv9v2JMjTnNcbsG67fbqbBurN3zeLK1I+uwrFtQw
         W10qGCYWFVRN5CBSXbZXT4ls0DX57Lf3fHPNg9PJUbvcF11FjOsBLJ86YpHn4un0Yk4k
         nLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794876102; x=1795480902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJxaAqU/N4mLE/X/C5f40TDVe8Y+8SNJEnAV6SKgDMo=;
        b=0gu10zogb0I7HcJy05QGLdLCKAFtY9lZjXAG2I0PxkMVLhUc8j82A6lTdd2bo8hTgA
         /pM4HxVOzjnkgsgbmd/TZhNnln1npRC720CwY+quYdh0zoPAh5Bwa0vB5Nw2P/ue1wdv
         Thmrg1cKb/NBfOeWpa+GqFrQ7eIPLKdLfI4WT3O0mMhZoLVQq2UY1vKTqOGyoNo2U4Wu
         z7rc/gaY73YWX9Y8GWUFSKSw8QOj9Sdgcdxdj7jG0gXE64nE5ziqdKbAhcNCRi/vhhOI
         xZQr34Zz6udnY9raRyjyhgV6BBtilQc0YoSKoCVvNcCNZhk5oQLRukToGuPOZArxCTPV
         wPhQ==
X-Forwarded-Encrypted: i=1; AL+hErHUiD7i1tmTlqCWg8P4i6sXSW6Ropafs7gdIq3onmhlik9ZfXNUTe7ApsDfkBcKWNFBfpZP4waaIIUY@vger.kernel.org
X-Gm-Message-State: APuU4Z9KNwiznlWVEbGp/zS+t9ZTyJLNw/dzg12PSYUwVUyb8+vMgxrH
	udr4j7mcvIxn/y2Ofz5ggcmNeYZt6hxlSou2YUjNWUW+0jucsYIEuLSgjeqMDSxJ9w==
X-Gm-Gg: AZFdTZdGoIR3waFko4VVyG0XZluHLspJxVHakcvFAtSUpfzTTsr4D3+c52DEKfnMsCH
	8FF/lfgl/KnJeLa1pu0wNcF8n0m2SehzsWc4q17obwv8SThCeLOPdOy75gpEdfYjMeKJD5Q6NdC
	+uuA6SueiQyj840NBXY91+I8/OfS1nqlgBO6KMdxh2WYQ7GeppGMPTH3XUmOMZW/9zTR74W4bqj
	bx8SZ+l76XM1Tb/KGbzD26EEyBYujipfBnCVRTdnwejTNxVzbSxETaGMr56nDVW3deby6QdtmzU
	MbafOrHxIYW0w0ICd/hGxiS5YiX8q7M4JrVg79Zqw0/kX7UzcTsJ82QSeB97/7srfJePk+7BE1C
	9OEfNfawh8QvLHn37MZxhxvGIOFDh6ggE4L8g6CMZA9VBUxryUeVPudf3BcW1jzQcq/Pv8Hrqco
	lo+SYH4N4x/M5hELjKQbt4RAKb9vSSLWO4hfyvn6aKWWLEfT3hl9OtFhWrB+GTNcBPN53Q/ohUh
	sOZYDJyCq6H7y+0N7YziAc+xxFGSB/7DEh3VCp9/mDCA4FvEa0STHwdj9YFozqMr307suajfvYr
	HGL1WsQmFY6x+JcxkRMsqYQx3MzqR8MKJ4Un6phmVh/KHF+ti2f9gcaAYipMaqv70jOS6JOtjIT
	SbP2mc0QMMmOegCfiHA==
X-Received: by 2002:a17:902:f687:b0:2ed:3c11:67e with SMTP id d9443c01a7336-2ee0dad0688mr134037395ad.24.1794876101909;
        Mon, 16 Nov 2026 16:41:41 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8f08sm5594825ad.4.2026.11.16.16.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:41:41 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	s-vadapalli@ti.com,
	rogerq@kernel.org,
	bigeasy@linutronix.de,
	martin.kaistra@linutronix.de,
	vadim.fedorenko@linux.dev,
	r-sharma3@ti.com,
	robertcnelson@gmail.com,
	nm@ti.com,
	vigneshr@ti.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: ethernet: ti: am65-cpts: implement PTP_SYS_OFFSET_PRECISE
Date: Tue, 17 Nov 2026 07:41:33 +0700
Message-ID: <20261117004133.1594972-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179446830443.2199510.10552580927894870264@kernel.org>
References: <fd826c118aec02c06bde92ff9c20f1958c214b3d.1794284248.git.jjc@jclark.com> <179446830443.2199510.10552580927894870264@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> [Severity: Medium]
> Is it safe for this driver to own the EXPBIT_SEL field of GTC_CFG0_PUSHEVT?
>
> The register belongs to the SoC-wide GTC, not to the CPTS.
> am65_cpts_ptp_getcrosststamp() rewrites it on every PTP_SYS_OFFSET_PRECISE
> request. The previous value is never saved or restored, on success or on
> error.
[ ... ]
> Suppose one of those consumers expects a different exported bit.

There is no other user in the tree currently. If in the future something
else in the kernel wants to use it, then the solution would be a small
driver to mediate this. If there is a user outside the kernel, I am not
sure what you would have me do about it.

> [Severity: Medium]
> Should val be checked here, to confirm that EXPBIT_SEL now reads back as
> AM65_CPTS_GTC_PUSH_BIT?

I agree this would be an improvement and I will do this in v2.

> [Severity: Medium]
> Should a failed syscon lookup be fatal here? A bad index just below only
> logs an error and leaves the feature disabled.

A ti,gtc-push phandle that doesn't resolve to a syscon is a broken
device tree, so failing the probe is right, and it lets -EPROBE_DEFER
through.

[ ... ]
> With CONFIG_MFD_SYSCON=n, the syscon stub returns ERR_PTR(-ENOTSUPP). Any
> DT with ti,gtc-push would then stop Ethernet from probing.

MFD_SYSCON cannot be off here: TI_K3_AM65_CPTS depends on ARCH_K3,
which selects TI_K3_SOCINFO, which selects MFD_SYSCON.

James
