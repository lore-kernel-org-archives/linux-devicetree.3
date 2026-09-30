Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41D1418362
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773365; cv=none; b=iqrNwDWv8G6Px7tdT2XKtmoWrIgbVmGCEyxcI3KxliDHcop0K0Xk6FQ/Sc5+/LKAK0nBC1V8F0CY4BrC1CZSl5cfuklzyVyDEpNzoxKWAswUC+bOJ1EhZZFryDvg+pS8DIc7/htfURw66FOZSpi1kcyuAqdRnc1wNtP/LaiBAL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773365; c=relaxed/simple;
	bh=4vHh8MmN5f2Z9XIEwQh0PcQ24VZUdkZZXQMWG9k82N0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kero+QhsUgc/TnEdsPwXMN0fVgyv0Hnfc4iIk8vNZp1yHBTCG2nTPLsSejoxu0LLvmj1sgS3hfmQ1cQk6baV4FOoFkh7w9l41J/fs7CIZembbEjlgqPDVczU1YRenc20B0hQiQykSgixSlmkY86XWpRSrmaine3E9PLAm9jSxQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=FFjCu1pS; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="FFjCu1pS"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a02551822eso1301275a91.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790773357; x=1791378157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vHh8MmN5f2Z9XIEwQh0PcQ24VZUdkZZXQMWG9k82N0=;
        b=FFjCu1pS5KghVbeqHLhwRGNL80kvHmLAsLE8uL0wfFNMxIt7b2CpoAXhMpAn7nmIqG
         Adnr0tsm8JsHaHcJXTOz3o5J55xZ7DsVCLsbWqgndDkxx+d8Xl0xltlWSkwrZQaFe2vM
         zcArLaNq0KaXkK3LMn8HlIhdJJ+CETLHsBafcFqd0a09xjNkU1cnnvXsPHN7bD++uwL6
         GvfrtsP+LRLsaaRve9dVFS5iOt1uL/h9spYBFTxSZhJK7G6FRHjkHXqTznDkm4D1HLMx
         krpJo+pcyffFOmm68m6RVk15EV7b8t4J41wSjUWM/TTQjBesVtsIJcDlc/K4ebd6EUzi
         B75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773357; x=1791378157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4vHh8MmN5f2Z9XIEwQh0PcQ24VZUdkZZXQMWG9k82N0=;
        b=XJ1ucIICDuHMzXv/yV+48Yq9NhXcYoMDnnbWvQ+/7QE3nHt4WoiMByB4slmAripnrx
         rNHYPPQiVV3tT9cZ9EvdZ6VovMuEQcLhqIicyrnFzRoPkTWBIgXxIPpqZqeBCboaCkw/
         3mYhk3TZpYP7+e5qcMXyNorXBGd026qt+w8fABboQNbEqiKg40Gyxa0+EifVBX09QxyD
         ED7uf2oMogvMpAJdMpWR5tQUDy+lTSSbR9vkzmSqTZIkt8phWeDL0fN0iqiO7uyO3egq
         mdncJYN5vsJBs+gcL28EAv1o2zEhUFzHh12XSuzTScs11x3C7eXx2NIV3VMMZdxvkw95
         cL1g==
X-Forwarded-Encrypted: i=1; AKwUvBznxkGRX3fxNp09NgrUnOO75zL7Rg3Z7tuIEHPjEmDfX3XnyccBcvPhkfcLO2WRG+drW5Qx2VROXh1M@vger.kernel.org
X-Gm-Message-State: AFq9FYKieyy3l0DCcxpNIgsjXErbQ1ysUHQOnUEDid2F4ITZA7jy5Tth
	rcpOjrPPzSU1rNyZVY56h4O2pyWuhSsLB0IdqxjMrKUcwjSFSnbWA27G/6HEDkWjG0HD
X-Gm-Gg: AYBFou3mAk30CQ8uWVKtcFL2KpUleua8xhVb9yFSUPJERl99nZshnkfJZwzGl3TgEWY
	jYmCRj6/E4w+tEllPkV93/9skSfN++KEE+GVGa8VwTvJkKtzDcJd51Vf9jIAb0Br5fbM5eno4jF
	11EWNAcNZOW8QoAPyr/j99LKBHBXYgPDVZP5N0B3x1bqd9WFoiaF13FOip/y0KJdI4JaPTLXYCV
	g/PsrrlxIVNlMte6aWf3l6EiyuxLIJEDZuwSjd5uRhWK1UCW7FM2bEchmwYANGNRe1+OBhrdMiD
	hErBH+KEKyslsuPaoI81wtw0dS9OTO8dhaQcbJ7UQS7bkK2TlW6OfduK8csKfMrhPyT747qZw3a
	dI369btXBcBpeL7UwX3UOQaZ77jbAzGxVE1F2eB3Kqai27A4SjBTZMdBa4siU8PuaSEwlca+5sm
	dGCI0ifjEKapkaNiygkmmpI/pBprkshSU1RHmgnKiH7QfUNKouhywHiDtgPaipPr6FlAQO+KxQC
	DYfdTBu
X-Received: by 2002:a17:90b:5343:b0:3a0:25f0:d89f with SMTP id 98e67ed59e1d1-3a4d18e3b8dmr775583a91.54.1790773356655;
        Wed, 30 Sep 2026 06:02:36 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7dab424e8sm853583a12.32.2026.09.30.06.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:02:34 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware spinlock
Date: Wed, 30 Sep 2026 20:02:21 +0700
Message-Id: <20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927132707.5f484946@posteo.net>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog> <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog> <20260927132707.5f484946@posteo.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Wilken,

> Wouldn't it make more sense to add the "allwinner,sun20i-d1-hwspinlock" line to
> the driver in the sun6i_hwspinlock_ids struct, drop
> "allwinner,sun6i-a31-hwspinlock" here in the D1 device tree and update the yaml
> file accordingly?

Thanks for looking at it. Bjorn hasn't replied yet, so I looked a bit
more at the naming. I'd like to keep the A31 fallback: it's the usual
pattern, other blocks in this dtsi do the same (timer, I2S, LED
controller), and Conor already acked the binding in 2/3. If Bjorn
prefers a driver entry instead, I'm fine to change it.

> Oh, and I may be able to test it against the D1, I own a Sipeed Nezha.

That would be great. You don't need FreeRTOS for it: I tested with a
small Linux module that takes each lock and checks the status
register. I can clean it up for the single-core D1 and send it.

Thanks,
Tien
