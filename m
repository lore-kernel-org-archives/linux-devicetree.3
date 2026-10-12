Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118C1344DA0
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 04:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791778770; cv=none; b=X1rrw9S0zlYH2fpNYT9uRmhsQKOU+CmckpY8o9SnS1b0Lr/4Mx1u9WsllxlM1UTjOkZd3A9pZM2A1xxaLiPPz0CyL4tRwu2q9s19ortsAoFlObtKtnVp9PZV7aqYNudLnqXWspnQiDTnuz+n+W7QwIEE2Nngh94CZUNAjsl3W2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791778770; c=relaxed/simple;
	bh=q9wggIScG0yYQHYBn8qso5oELnUyYQWG4oIpv6QMBcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jp6QH2OxsBVhmMYdtmb1CZxF83EvGxiBJdXSIGhcBsbN+EwRIiq7kAThxtVTjjk35E+5oEJsQlRUgz6IEn2PyNaggLQhrbh21rhawXCDBL6CkPI4b2G4m6HuvHpDlSt5M2dWhpDveAqofe3BXAPVFZCjjtf3O02pL8wRTdqHIl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jT/CAMLu; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jT/CAMLu"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-353804b591eso2511199eec.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 21:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791778768; x=1792383568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=efFkaQFetsAOpWM7VNvA0yYFgrxZuGTjrhnbsOnuNRI=;
        b=jT/CAMLuUu3UuUVx17HX02eMHxxg7gAJdwJ95UHpzktwoGPrVwXfyaFVaq2OPw446V
         KWPtS4WoyX/Nnsoqxy8Dc7BvS4xgYV0ATl6KHJ0lb2zdoQnzKClW1pXg7Z2hpARuNtg1
         USIzHEN9V7u1WxFi5guo5yV1C7uO/Z31AKQIWDeVDP9lWkvF81iww+/gnRZCLqRcA1xV
         zU5rmSJVJbHHg27rO2Mhn28/JiLL6t6uf2Sj8CIYOpQgsTDT7CcBLLs/okVKmKpZfP1a
         jQSC502wZaI+qjccEQvk5i4nm9QuLp2tF0afkuCE5q0UpErTEl7rN7bHycmYDLpcQ/iq
         fInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791778768; x=1792383568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=efFkaQFetsAOpWM7VNvA0yYFgrxZuGTjrhnbsOnuNRI=;
        b=yeyd0HBtGXjFznwsxwUr9+8i9dkNAtNiaHY0CbK1ZScRyNTc46wVqaBrfYFsluz9p5
         AYBken2BFvEZLzK6O2XskW/4K+HvtASPF94mrYa3oHJU7ugj99aPcX197ztOti5uRq8K
         g3hnc5dIlWseSce8iHCpl8ykeiDA0ConcXE9Op2N4w2hh8ut8179wHYvQvOPhQZisTLN
         L2ZdmCDKN+XsvE9/25/o2gVdd5X3baH8ZpqahAWQj2BIYVp3PDtpvSPtIwCKOO8pBivP
         GMF8qYshinfSdPWhN5E03R+tjAmuLpYA1667KBkJ5+3Dg6l8GMJ/kF6qKkJldB3GfP1i
         lZhg==
X-Forwarded-Encrypted: i=1; AKwUvBxT/rUlZ0PJeOT/yaGh51S053RBHTRV92y1r8xdTUi9CKk7iwzcXf9755N/dsz5aNM6JvuTtEvUAgSS@vger.kernel.org
X-Gm-Message-State: AFq9FYKZBNxxuYOLnfd4ezL11c/anIEgoe/9PmHIgsZZgwsT27AObbBH
	lZBzxSa+XzcnpufMTfTBkX+mbSQqmptfrUIxt1UISs0YYcmzp2PPZ+11FKXkJPsHU+4=
X-Gm-Gg: AYBFou2ioEgMUVeZ3nYVXXVMWwyTAqjmgoKJ3taZs4vT5Hb4rzWeYCsVH5kdvjVCDdr
	Xa+YKPaV7Gwu/EWm09V8dl29UKlFLjLfZHAKCankj0YjBFrgCvbmVVnLr1dWqJB4G4DyHlKuQ2/
	vp5MJLpBPkqGpycFM++p00y7RZYfbPzEtxC2TLEQ1gbbmMBRs4B0RhEj91qJu8mKL5QaNy0AiDx
	6yocFaKM2pS5L+xeRjrKa0aPh+45Nr81xJ4l5YIRPi8i72MAOhb5f0Rnr2+erI/Q4qgo0UwxqeC
	paOxmxG31tzRFC3iyScUrGe97TVq3FKe/PuR5jraw88Rm07JjaqBCRtai53bFSeAlb71/ENv1sI
	ES6dBRMRpdP++HcaaHKI16SlMuUhT5pT5BW7xmyXRQaP54+2rpWVyUZIY/4pK0y41zfwTBnEdYf
	1uupGOio/XaJ7yxrS3rIBvC+RtB7J9+hMGl3GDZWEx3Q4ZDxbeSyB2wJjrnwiyaV0NZjdaAPAP
X-Received: by 2002:a05:7023:a47:10b0:14c:1f57:3e86 with SMTP id a92af1059eb24-16a5f5ddf6bmr11356001c88.47.1791778767995;
        Sun, 11 Oct 2026 21:19:27 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becefdsm25739266c88.7.2026.10.11.21.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:19:27 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:49:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Roman Vivchar <rva333@protonmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] cpufreq: mediatek: Suspend at the opp-suspend
 OPP, and mark one on MT8173
Message-ID: <asxfzG7bNohf-gcB@vireshk-B250M-D3H>
References: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>

On 09-10-26, 14:44, Ryan Brue wrote:
> mediatek-cpufreq has no .suspend callback, so each cluster enters system
> sleep at whatever OPP the governor last chose. On the Amazon Fire HD 10
> (2017), an MT8173 tablet that is not upstream yet, entering
> suspend-to-RAM with both clusters at their highest OPP (2106 and
> 1703 MHz) measured 63.5 and 63.6 mA, against 52.0 and 52.0 mA with this
> series. Those are 15-minute windows of the PMIC's coulomb counter,
> alternating with and without the change; one count is about 2.9 mA.
> Earlier, on the board's previous firmware path, s2idle drew 210-232 mA
> against 158 mA.
> 
> Patch 1 takes the suspend frequency from the OPP table's opp-suspend
> entry, as cpufreq-dt does, rather than always using the lowest OPP. That
> keeps it opt-in per SoC: this driver also runs mt2701, mt7622, mt8183,
> mt8186 and others I cannot test, and no MediaTek table has opp-suspend
> today, so they are unchanged. Patch 2 marks the lowest OPP of both MT8173
> clusters.
> 
> Patch 2 also reaches elm, hana and the EVB, which I cannot test either.
> What they get is a switch to 507 MHz in cpufreq_suspend(), which runs
> before any device is suspended, so the regulators it needs should still
> be up. cpufreq_suspend() also runs from device_shutdown(), so reboot and
> power-off switch first as well; on the tablet, reboot -f still resets in
> 1.4 s.
> 
> Patch 2 does nothing without patch 1 and is harmless on its own, so the
> two can go through the cpufreq and MediaTek trees independently.

Applied. Thanks.

-- 
viresh
