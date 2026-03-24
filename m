Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5949363C49;
	Tue, 24 Mar 2026 09:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343923; cv=none; b=dAbTXZr0P9ZTcowOjDH3k72UWtV33oemQ5jTE6Uya0Mb1OISw0AFNwO9tZNzafAK0M1rbTKqB0YHXaVCw7vcqRL22EqjrdO0gH8cZAWPs3Nn294olIUZK6WCPdRwfQ0QVDAUkZ3pqUnsZl745NpyXdvsKSr972tvRONuJdXVWyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343923; c=relaxed/simple;
	bh=fTToTCeqKsTMNulzFcYvH6PKgjLpHenJDrE6QA1hWQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMQc4sVa5F/Pt930ekpO8fpbLN+FuuoNE8ElNyJ58nlZ9AdjBI434cAVqtAXBUkVYf0HvMCf4wpjNQe3g+2ypoI4LydgnH00tYoHmGukLbYWM1bMQQS0beQlwB8gjRtzHYLdL4hEizLgvzUDbmwAcBm5jGvipWZcEJL7ueJKX/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aIZLB5RD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aIZLB5RD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8945C19424;
	Tue, 24 Mar 2026 09:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774343922;
	bh=fTToTCeqKsTMNulzFcYvH6PKgjLpHenJDrE6QA1hWQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aIZLB5RD1I4Qk4hu2XjXbcURmOnU3oCku+n5RK3oL7lYxipe8yDa8E1ijlm4oobNM
	 snnfFJO7TOTEKuqMMcJ8MBjQLjaklfhWSNN8RrGcHo9S7bwHodCI7DxQIODvY2YzTd
	 mL1MM8Zyunkp5+ijM0Moy9M59hq1Z22nb5h0FUC7WsC+Ext/NhFh3A2lSGlpoFuXQd
	 L+BKCsrnoJP43Sue6txCkucm/IhOXlf5CNSGmkebXF5MO2yL+iRxPpblG1n9340JqQ
	 UcDqC5WzlkJ1OVHbIKV0zXigNydsO4Wi2TwT37sB21ePdY6KEiPtZOrZPAKybncVA4
	 F+Cl1Tyr5uKZQ==
Date: Tue, 24 Mar 2026 10:18:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: nick.hawkins@hpe.com
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Marie Verdun <verdun@hpe.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: Kconfig: Add ARCH_HPE_GSC platform
Message-ID: <20260324-bright-tuna-from-uranus-ce0dd5@quoll>
References: <20260323194223.683487-1-nick.hawkins@hpe.com>
 <20260323194223.683487-3-nick.hawkins@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323194223.683487-3-nick.hawkins@hpe.com>

On Mon, Mar 23, 2026 at 02:42:22PM -0500, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Add the ARCH_HPE menuconfig group and ARCH_HPE_GSC config for the
> HPE GSC ARM64 BMC SoC.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  arch/arm64/Kconfig.platforms | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 54eb1d7fd419..4bbc27bb9b7b 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -168,6 +168,29 @@ config ARCH_HISI
>  	help
>  	  This enables support for Hisilicon ARMv8 SoC family
>  
> +

No need for multiple blank lines.

> +menuconfig ARCH_HPE
> +	bool "HPE SoC Support"
> +	help
> +	  This enables support for HPE ARM-based SoC chips used
> +	  on HPE servers.  HPE SoCs serve as the Baseboard
> +	  Management Controller (BMC) providing out-of-band server
> +	  management.
> +
> +if ARCH_HPE
> +
> +config ARCH_HPE_GSC

Sorry, you don't get multiple ARCHs per vendor. Look at this file at
other entries to see how it should be created.

Best regards,
Krzysztof

