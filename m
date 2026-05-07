Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396F12DFA2F;
	Thu,  7 May 2026 21:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778188229; cv=none; b=nmZwd5SOFctRnhBZec6/0oNiOvXmyUPofKkxLQzK0xpWBvgzZ2JrRBk2BUFaVbCQjgIxi5PvIvxll3NmtX9XlpaP74+G/nBFEFTbv6XUDpkE7d0p2wHfRhsmeR4fWL9cJdrsnwlWZfURIaKddTqE671kuP2xIed2pTFYLHGegbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778188229; c=relaxed/simple;
	bh=7If945YnjmNb1vSh1NM7KTAE9SgZ+ijmKxw27zTeXVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEO20vwz7QLDGpKbyjIq+WP5TnLwbbGY3VWx55EoB5VljrMV77HslTdIzG5Y7jhN0NoIldwDQNsyjQn2HOyC6BWFMpOktf2FDqllDYipDlmFhVN6CfvRdmjqIlLmncqlnJJpY8ybYuertTHnVIdDv2tHe1LFKzu7ANtv83vzB4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYs+hWFB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYs+hWFB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1101EC2BCB8;
	Thu,  7 May 2026 21:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778188228;
	bh=7If945YnjmNb1vSh1NM7KTAE9SgZ+ijmKxw27zTeXVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nYs+hWFBb87u+HrYaho1DP2t246yQU0vc3XApb72fH/uME+/AJ4CMfPctXEwPQsyb
	 VMIVuKSRU2vVL67PcqQD4LShgrEmlrBhv1ql8DgykatmcH5AQ4n/fZRhDn7x/mhL7K
	 DeqAYBDrto66kw1rXjGPrzL4yvQQeYbAOBszVQ7ftOvfbt9yY7TmyQxvXjGTZwleUh
	 jG2LHrty3LZdGPW/vSxGEgqZU/FHED1owMF6JMSGxkAGleefS4AtpQGSkUV0vdTBzg
	 VBU54UE4maQdruglvHLcnDg/fbHkxBNcqHSnIuPlWFV8ihxmntfpluBvZU7NEKrtNR
	 dc19kZzUzBMJA==
Date: Thu, 7 May 2026 16:10:25 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: Enable CAN RX via GPIO expander
Message-ID: <afz-FMEGqMQFw7iH@baldur>
References: <20260507115324.1814329-1-anup.kulkarni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507115324.1814329-1-anup.kulkarni@oss.qualcomm.com>

On Thu, May 07, 2026 at 05:23:24PM +0530, Anup Kulkarni wrote:

The subject prefix is there to quickly inform the reader of "git log
--oneline" what area is being changed. Add "lemans-evk" to match other
changes in this file.

> Few CAN controllers, part of RTSS sub-system on LeMans, route
> their RX signal through a I2C GPIO expander at address 0x3b.

If only a few of them route their RX signal through some I2C GPIO
expander, what are the other ones doing? And how does this relate to a
gpio hog?

> RTSS subsystem is an MCU like sub-system on LeMans with independent
> booting capability through OSPI interface and supports peripherals
> like RGMII, CAN-FD, UART, I2C, SPI etc.
> 

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
has the following statement in the first paragraph:
"Convince the reviewer that there is a problem worth fixing and that it
makes sense for them to read past the first paragraph."

> Describe LeMans EVK hardware  wiring by configuring the

Double space...

> expander GPIO 4 pin as hog with output-high,

You're not describing the wiring, you're hogging a GPIO to be high.

> asserting the selected line during boot.

But does that GPIO relate to RTSS, the CAN controller, the RX signal,
some form of chip select? Why should this pin be high?

Regards,
Bjorn

> 
> Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
> ---
> v1->v2
> - Fixed commit text to include platform name.
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index c665db6a4595..34dfc8d22b6a 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -616,6 +616,13 @@ expander3: gpio@3b {
>  		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
>  		pinctrl-0 = <&expander3_int>;
>  		pinctrl-names = "default";
> +
> +		rtss-can-sel-hog {
> +			gpio-hog;
> +			gpios = <4 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "rtss-can-sel";
> +		};
>  	};
>  
>  	eeprom@50 {
> -- 
> 2.34.1
> 
