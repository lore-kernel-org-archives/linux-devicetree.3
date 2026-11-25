Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596476;
	b=XfwziGqeNvmQsEONlFQrB6ksDnlTvl2cXDfOYMxQT1yc20kRHepG4ofudU0rmOejj453
	 3XEaRb6DTOjXS80ohmvqMHfyBUmPjm/nx56Vt0MurYo65l12VftFZLXMxAWtlgyosG+3i
	 dvOYQT6aPIFSyx2LXMyyp6juUvu5v8pKas5RA092TsMNKI1m/BOujOx3iTdbU0wnie50d
	 mhiZAlWDKyPaMvttmlM+c5p/D6z5kjOl3NcIzatLBWHsGKjKp8KkkyAaIh6aiFm2p4c7z
	 8y2j9kbGErElK7oG4cmz+qyApsDUvvO0UNtSlXASdKbu4JBbdEqvnpoVetg9kdgWevQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596476;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BoIN1YPmv8DT6xKw8t/C48kGStRshqPRywrtEu/9tJw=;
	b=lO9FIW73umIsdBMNyGx27HRK1MUMHvkia3bWcfFZH1387+47/vo1g0gbot8eV1O2oZlo
	 UOC/0tyUqxvXLBuJYAngJUiK1C6VOqKWHiOtkNqMSODpPixPYxFO6dd9f4O+We0C19h3J
	 pVEJllqP5oW7pl/RRo/ujksrp6+wB3+2zOLQ9sAJdFFJjRpyylxwBp29SHSih+bxthXbt
	 imOs59OqM1ZZJTnC9vxsGtB5LevVGxelZvbXpJoAIomsWhwPpludgAVrTCHAzzRvcKAta
	 Ah4M8fa4jB8UnFOgjuuUQF+RqO8YWI+hALUeskf1p/vzS5Sjco10w2BJDqInUN0+X2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a1Yq5IUJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id A6C5C606A32C;
	Wed, 25 Nov 2026 08:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a1Yq5IUJ
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 67F7A1F000C0;
	Wed, 25 Nov 2026 08:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795596476;
	bh=BoIN1YPmv8DT6xKw8t/C48kGStRshqPRywrtEu/9tJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a1Yq5IUJe5h2DOmnzMol/EHpXS/c7m73PJJ7A4ixGizh9qQlaXNc9cIv2gbKKJNEZ
	 YWXS2zZ+hvbEGuM+ujAJVM9e2EfrXsNjKgEAhthifSb+5jfiCzYvaWimZUYgYXlmL7
	 orQXbm2rbIKfkGx+lYz2NogM6WgJePltruEYNnUh152gmv3aCHd0gMxzyDRFJRtbaz
	 Y/Yt0o7y9OsMxmexCv+ti/tzVEJXqVrbn6J1BJxrcX6PKs+uMYpUaUb4IpKN8rJgU5
	 LZgqScUkOVOiKbNnDAnh4+u4Gcu6R/wWbWoZjzhFnOOg0qU+Df74tA7a8RRaWiyDqg
	 +qs9uDIGkNaww==
Date: Wed, 25 Nov 2026 09:47:52 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] phy: qcom: Describe the AHB2PHY bridge clock on
 Nord
Message-ID: <3e7tzpibli7hi3rb6fhrcfczndwwpjg7hlto5tajxwneap6bar@pj4dgukcl3gm>
References: <20261117-qcom-nord-ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com>
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
In-Reply-To: <20261117-qcom-nord-ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com>

On Tue, Nov 17, 2026 at 10:06:27AM +0100, Bartosz Golaszewski wrote:
> On Nord, the register space of all the USB PHYs (the two USB3-DP QMP
> PHYs and the three eUSB2 PHYs) sits behind the AHB2PHY_0 bridge, which
> is gated by NE_GCC_AHB2PHY_CLK. None of the PHYs currently describe or
> enable that clock, so clk_disable_unused() gates it before the PHYs are
> initialized. The PHY init sequences then never reach the hardware and
> the controllers fail to come up:
> 
>   dwc3-qcom a600000.usb: DWC3 controller soft reset failed.
>   dwc3-qcom a600000.usb: error -ETIMEDOUT: failed to initialize core
>   xhci-hcd xhci-hcd.2.auto: can't setup: -110
> 
> As a result, USB on Nord only works when booting with clk_ignore_unused.
> 
> An earlier attempt marked the clock always-on in the NE GCC driver. This
> series instead makes the PHYs consumers of the bridge clock, so it is
> only kept enabled while a PHY is in use:
> 
>  - Patch 1 adds a fifth "cfg_ahb" clock to the Nord QMP USB3-DP PHY
>    binding. No driver change is required.
>  - Patches 2 and 3 add a "bus" clock to the Nord eUSB2 PHY binding, and
>    Nord-specific match data in the snps-eusb2 driver that enables it
>    alongside the "ref" clock.
> 
> This should go into v7.4.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Vinod,

This series is reviewed and the only sashiko comment is a suggestion.
This is the final dependency for supporting USB on Qualcomm Nord. Could
you please consider queueing it?

Thanks in advance,
Bartosz
