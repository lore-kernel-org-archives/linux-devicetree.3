Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCBB35B632;
	Thu,  9 Apr 2026 08:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722651; cv=none; b=DSv3IQgVHj/bPy/m4m7T5WfhIrYer+PyY96IJcF7gaN5q6iIQURmiMS+9Ve6dseDeLqJy5Oe7/sFevoC7/iPzCmlg//+ZclbJe3Pwibwq3WEoK6p7d5U0Lr1ifP+uILKOmj4U6UX3SM/CRAtr1vxXtuAYP+43UXFVppDMuspCck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722651; c=relaxed/simple;
	bh=sPCrS7Vxsq6SyoOdi8MM943FRV/lGQdBwPfGUAhtoiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqSf88PFmqWjSUgwAr+0/55Nna2bihL7ybkjgSAVjwKMiQtASz/+QLWkiARlYBDFi3Pkc0dCt9TfH827bjewAPcIHf2tCSYINd+R7hUnbPaKsWIs1TmUq808wQ1Wr37c25+GKEViJlD0kcC5VZuK6wmHhj0G7Dc79eekZA/OEWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZULk9AoF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZULk9AoF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D54DC4CEF7;
	Thu,  9 Apr 2026 08:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775722651;
	bh=sPCrS7Vxsq6SyoOdi8MM943FRV/lGQdBwPfGUAhtoiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZULk9AoFoGK/bsWIrEczQm+RKRre0K8iu4RVp8K7KIsNSixdhhWMn8KJtAQtC8F4Y
	 nr8Ljqk5J+0stJmGOuYkPiurEWOTFiQbRhjU44q1mBt7ebBABamq0fJyF2ZdEo61iw
	 JUtWr+X3NwsF5UKpUIiW8m1apbvd7qkKKM7hzV58QMA94pnRkN8TEgBc88FuS8S9qf
	 0ypubbDQX+BXP0kwRNOCWkIW+Vf5Rhj3hVrwIjAfYEz7Xc11Au4bJmamJFeOEPDsvX
	 GoHlHV+uA7b/mtlls1wH1x29hs8TpcYTxTr8bOlWsAaJHT9XSdUpYMUlaVGLCqLWuQ
	 iuU5lQbeswGnA==
Date: Thu, 9 Apr 2026 10:17:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] nvmem: Add the Raspberry Pi OTP driver
Message-ID: <20260409-pearl-turkey-of-adventure-815ffe@quoll>
References: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
 <20260408-rpi-otp-driver-v1-2-e02d1dbe6008@linutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408-rpi-otp-driver-v1-2-e02d1dbe6008@linutronix.de>

On Wed, Apr 08, 2026 at 10:00:16AM +0200, Gregor Herburger wrote:
> Raspberry Pis have OTP registers which can be accessed through the
> videocore firmware. Add a nvmem driver to support these OTP registers.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  drivers/nvmem/Kconfig                      |  12 +++
>  drivers/nvmem/Makefile                     |   1 +
>  drivers/nvmem/raspberrypi-otp.c            | 159 +++++++++++++++++++++++++++++
>  include/soc/bcm2835/raspberrypi-firmware.h |   2 +
>  4 files changed, 174 insertions(+)
> 
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 74ddbd0f79b0..892d05fe67be 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -483,4 +483,16 @@ config NVMEM_QORIQ_EFUSE
>  	  This driver can also be built as a module. If so, the module
>  	  will be called nvmem_qoriq_efuse.
>  
> +config NVMEM_RASPBERRYPI_OTP
> +	tristate "Raspberry Pi OTP support"
> +	# Make sure not 'y' when RASPBERRYPI_FIRMWARE is 'm'. This can only
> +	# happen when COMPILE_TEST=y, hence the added !RASPBERRYPI_FIRMWARE.

Drop comment and use standard rules for multiple modules.

https://lwn.net/Articles/944368/

Best regards,
Krzysztof

