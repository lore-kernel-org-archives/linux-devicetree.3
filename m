Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097055;
	b=Ik54l/H9Cksu6sb0yoTWE3srjZzy7o2Th5CEqsJAtzydeaVDZ0ubj3dsatZMY3/JFvZj
	 Y78GldUo4ELaBFIFA6Nj2Kz6DHErIkMUgAtKibjMdRPXCFOL+3doBRQLiUAESaXVlJYHI
	 8sZPlMDHaK9Y1ag2ScpcxhxPouCAskvSZ3piMY4YfqZhJtA+6d3K2HAdSw8q0nwWFTJLD
	 9iJiGljsrSzzCkcYvssmFCGIHIhxg92kmoTdofIWPS5jltmdF+J7bi1CMvTMhFD/xip9A
	 VfSGEZxAmKM2a2Qq9T/c6wyKYE0kvgrP93PqOL1/B+igl/0u9fWW1+dgzG1qWWK3TZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097055;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PC0PFG7TIo+xFHu67YfgJWGRHE1j5A8uLzGpf4YdqBo=;
	b=yO3bSLCt9RzRfRBdlkbWAldlGZHwfk5Y7f3VUB2YEialbrQmNnbX++BTo8exXocU/Sxm
	 dpebrT+0PHBf6QWmFhpJUjgBvy+yKajz17yTo26u7Z1/shh/nWtShbqhcKdDPedSHWTU3
	 LlHPlC2/jh8r7H3+RdPeAZ9tlcN0crEHzBf2+uogzFtI1F1k8wnhSXjzJGUjp1lz/FlX7
	 e75qfgNqzYQBn16n94FHYb7zCBua4RSs8vd2mIGtN5FODFMm7IeC+XNNZZe9TGuHyv0oZ
	 lx0JBbmMqGCcq5yOzlWrCrQDZmq91Pzjc3T3Bq+unUbUA/our/O1pQ1V2JnnRof9LYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=crOKfeIn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 8CBA2606A320;
	Thu, 19 Nov 2026 14:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=crOKfeIn
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 31D721F000C5;
	Thu, 19 Nov 2026 14:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795097055;
	bh=PC0PFG7TIo+xFHu67YfgJWGRHE1j5A8uLzGpf4YdqBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=crOKfeInQMsi6DXvztHXY9Jr+XziH1Lo8Qgi14Iz2yItuCEWtcOa2G3Q+74cDopwq
	 s1kOjqHq193jkwUKmRHxhw3bPMNRe74zQdsY7AAGDQLSlePDr+JB2tjkI4qGP9WNrL
	 71s/NSh/Yr5Ozc2IcSHLriUbwuBB7Mpfyn7y+8+72EO9dx1/nM4Gr50Xv32NDvpjAC
	 +I6vusEYfOjuacm+QBcjauUupBOH926RLEATF8xJzzq5IxdDqW86Bw11ALK4KcHzik
	 6tfzMlljir8a0OqJY5DRLLkXPwTgW89qsXNJvLZxMOQ5D454L42jNRpjn21CbK5RE6
	 7QqOGaTmltjvA==
Date: Thu, 19 Nov 2026 15:04:11 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: nord: Fix GPI DMA wiring of QUP SPI
 engines
Message-ID: <5poepxkppbiyfxz2dxkjm7p7xiq4ndoltsnnbqlp5rdasbvrxr@p2ocx5b3kubj>
References: <20261118112407.103412-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118112407.103412-1-shengchao.guo@oss.qualcomm.com>

On Wed, Nov 18, 2026 at 12:24:07PM +0100, Shawn Guo wrote:
> Commit d8005dd04efc ("arm64: dts: qcom: nord: wire up GPI DMA for QUP
> I2C/SPI engines") put the QCOM_GPI_SPI channels of SE 0-3, 7, 8, 11
> and 12 into the uartN nodes instead of their spiN siblings, and left
> spi4 and spi14..spi19 without any. The UART nodes now carry dmas
> properties the GENI UART binding doesn't allow, and 15 of 18 SPI
> engines can't use GPI DMA.
> 
> Move the channels from the UART nodes to the SPI nodes, and add the
> missing ones for spi4 and spi14..spi19.
> 
> Fixes: d8005dd04efc ("arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Eek! Thanks. I think the comment from sashiko needs to be addresed
though.

Bart
