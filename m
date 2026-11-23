Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446042;
	b=jb35Kk51Rm6oopMOFt/4KL39ot/eh/ei94UNSh+quBIEjddUhUseMllQTYt3z4JW08Qf
	 A4pXSkyvlu2mV3RXmXxEZRTZoFjG24idMyHIEHEizZI7DZeVRITKeYVMdqwZONNnZ5xBC
	 SbkQWPJNZs1GarVk/gN7cHh/R1j+ZcUaKM3VhDEEvN7UePunjharKyiZl9bWUM6E5m3Ra
	 pmU9R6lk4UeXMmyfElA/weQqXgCvcDv/v2EUeIjaKtnW/ANfNuIP43dWTmWtnYD3sA39h
	 UUAIQBs8iU31ewGazwz9ZMs6nQ4AFEKZSfKprvIyTqNhiqE/TL15mOyu2GUJdyLAgXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446042;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wozrLB8v+QNNPQYvspRVXg8TraIKj4aiVMZRAUF+EYM=;
	b=kZz1jqX8fpeY1j0KOVsO4oECkn0kkctkyS8HZCFpyjt2721HdXYEWPEIGKoO9fScKkBB
	 fdDWsbpKKcHD+G1l1WqGOSNoYpoDxL13D4evb+5NW8vwSAsfJap5hPqPXuc4Wa6jT9nuF
	 rvye27XLV6cLJ1lCPJHYe9XypQudpA/hnV7D1C7Q/e5NojAOWda0Z/cFdE8Eyhxttp0G4
	 K1bYMznyrOVg0KIts5E4xMYFAGvGueYv2LeuCUG53qPGLBe0WrMreF3bQtlkYwsEraIDt
	 t3v7UzMjM15/c6RQ1mNT0Iyp4TO9N6sz8qCATszJ3Y5pdrqbZ8adBiQhzAW/9ms0hvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oaBih/EA";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 19003606A32E;
	Mon, 23 Nov 2026 15:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oaBih/EA
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 41C3D1F000EB;
	Mon, 23 Nov 2026 15:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446041;
	bh=wozrLB8v+QNNPQYvspRVXg8TraIKj4aiVMZRAUF+EYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oaBih/EAHNjA5vGr1S/JB9Li0DUscBiWVZh6dmsbyIfp7pIwmefQ8coBqL4YabvlV
	 Q/O1M3TLh6sbZZ0KxOLUWU7fChxrCgF32+/ZDjVPoDZg16VPXXJbT5sIB3DmhRov+G
	 xgtxcOMxif/7vZE3Ppd9Dm/O8F7NRUJy7xTI39cTwUuoeiS5jCBcuLM8JzGWb+nYXn
	 zVOUNvGy+8dF3LyJzrdTrJ1hKZQWlwX+PjaMfaIY/CbOUp4RDp1A/SVfZftWuvBE2w
	 qAY/P0GkeVzcBALmQS220smmIngaZmvvbmeYxQw3k6PXr4zlSBdj5S6i2zwZS1fyN5
	 uia/Ziy3U1pbA==
Date: Mon, 23 Nov 2026 16:00:37 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: nord: Fix GPI DMA wiring of QUP SPI
 engines
Message-ID: <lwcooapssolrhg26ktztgu77l5ed4c4bwnlfhv6yrmkbde6okz@4ijci4uvqnqa>
References: <20261118112407.103412-1-shengchao.guo@oss.qualcomm.com>
 <5poepxkppbiyfxz2dxkjm7p7xiq4ndoltsnnbqlp5rdasbvrxr@p2ocx5b3kubj>
 <av8WIZjPgnS8qWNt@QCOM-aGQu4IUr3Y.na.qualcomm.com>
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
In-Reply-To: <av8WIZjPgnS8qWNt@QCOM-aGQu4IUr3Y.na.qualcomm.com>

On Thu, Nov 19, 2026 at 04:30:41PM +0100, Shawn Guo wrote:
> On Thu, Nov 19, 2026 at 03:04:11PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Nov 18, 2026 at 12:24:07PM +0100, Shawn Guo wrote:
> > > Commit d8005dd04efc ("arm64: dts: qcom: nord: wire up GPI DMA for QUP
> > > I2C/SPI engines") put the QCOM_GPI_SPI channels of SE 0-3, 7, 8, 11
> > > and 12 into the uartN nodes instead of their spiN siblings, and left
> > > spi4 and spi14..spi19 without any. The UART nodes now carry dmas
> > > properties the GENI UART binding doesn't allow, and 15 of 18 SPI
> > > engines can't use GPI DMA.
> > > 
> > > Move the channels from the UART nodes to the SPI nodes, and add the
> > > missing ones for spi4 and spi14..spi19.
> > > 
> > > Fixes: d8005dd04efc ("arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines")
> > > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > > ---
> > 
> > Eek! Thanks. I think the comment from sashiko needs to be addresed
> > though.
> 
> I think sashiko got confused, no?
>

Yep, I looked with my human eyes and it's fine, all hunks are labeled
uartX.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks,
Bartosz
