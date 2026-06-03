Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10823477E53
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 18:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780512904; cv=none; b=OZhATgRqAKUMMTEyOUfpA0sLQs6NPm/oPeX/zdp/3fFAhPy6GOpxa0kFphPsYLLeHVrus1AF0IaNvjc8PNER2ai4pVoaRhLOTcMB0Sj+nyb8sSishsEGC+5mi390ejp8Rkh/5HKPBMnx5tzTskB5eSSSP7hmAczS1zmirZVxUVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780512904; c=relaxed/simple;
	bh=4o/w69kaWrNOz+L4REZJ9R9YQkg1KQyCZyR8SeA2K6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvF2zVO6i1DqzLTO3eTnKVyfxkoBPb/59yIInLKDJWretw+mXpfTawqM/XBYzz98jEOzhXkMpBsU+1grmkuC4JAPnZ7CV/8cYuIOGM17vAU5YbYKZ00X5bB8/s7KvMd/v89nqR6pQmS1BYlkJfpn7XrSXF2rwuP9crIr6JPS5CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTT4rvU0; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTT4rvU0"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4864abba33fso756665b6e.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 11:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780512902; x=1781117702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bdBtN29xNi8/LyCh+t/0E+11ZLThWT9XDbN5icW4kfg=;
        b=FTT4rvU0L++8YqZXgS/e1FgxN4/BZWSS4ECVPOa0DP0zfQxByIjBZWYR7jAUwEa4X7
         3IItNFWcG62CSLQDyjz5Bv7/3hnuRyaK97L7DJmdHABhYEZt2eiwXmSynZyrpbOmJ9Ef
         I+ZF7wwLIp0MysU9VZK3tO5AqkdjyARBSbtYjL3yUNWDpPGmYdF1V/fLgxj9DmdcL1wv
         idEcqMQQcLbJWKWw/LP4nJtHMAipharM4IQ3uPBHnzyFlmTqlAi+J+eVFv+oEOj84k/Z
         2ixKblcjUtz9ldax5iOFsilGjd0RWbUv8C9fRH2zWBz4Rt8uxb+f7xOtk80lIQnAybY7
         VneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780512902; x=1781117702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdBtN29xNi8/LyCh+t/0E+11ZLThWT9XDbN5icW4kfg=;
        b=oMk6nHGiqi7fsuK+DbCcXc1/MQOZ01aeYLB8hYUkZsNK02kGmLnKh7WqBC3aivb99p
         4UrfFmkNQw0ugcVsG2XVlNbKs/YkEDSeWsPO0jaVOd23IUK9R1dQoBhZEZog8NS5Qs1Y
         g6567Cdqb6Xk5xUMFpf0Lh1rDjGDpllurW1guLVjIeNJGqK3x1YSWaA2Ld6iU6f6VYnZ
         KaGEoDGek3P652JUi1w0QBqKQ1v8PlJABBTY2vuZ/pZk7htHiwRuG96/HMrnFc0hUcbI
         ZU99zSfm05L1tGfxNYu+lAZm6VYFe/5ZmVED17qT1DHZ6F1AZbpoeCPGh1XWZ9lD7eBB
         cA3w==
X-Forwarded-Encrypted: i=1; AFNElJ98GSGhd2zjs01PrvNybGXq2Z8W+Y5t+Tzq36oI32dRdHuJEDx7m0gwJvUQv/1Kdv8e0Ho9XiX9Sb1j@vger.kernel.org
X-Gm-Message-State: AOJu0YylmtlkP0xNC5CjRLg7fVT9kUfzFNjC8nJcMthRrsu+SwY/e/54
	JYIS4P7FEhr0bFdviji03cPZ+njDeUb03i7oVwTCZSlWsxvXg+BimrhP
X-Gm-Gg: Acq92OHiPa1goeTc0mn6r+4PL7U2ju+ZYzyjGI3q3SIwnpAnoB2XGp5sCdzM+AlR2Eb
	4NL9lJzMg8uwa/uWdw9pVxCArmKV42X+tEEfGZ8/CQmTGQ9QpVyTfxgR7HzxSi7xiUAnz24YF1p
	KOed6QwDrDN4bYbWV43ySjpM0mpMgZjiO9NGEU2rP1XibVdcx3YzsEZmm7lUNWsATCjurV1owbr
	d1hjM5a8ITZvM6ekPRC/u5cy3SayvPAj2ubjseiWd8pF3GpnahXMQsheFw4ozTSuV7ECTGxiZ97
	8n864jE6x1fPLr560u3TMW1FWlaOYJ1uq89XF+jd0oUlL+179+F7wmVV80APS0br6vnbnZlT0pQ
	xeDZvrk9Im6Zl+EpZPZqRxe79oKZYSJkWdxKe02W+YESq9zkRpRu2UCCPEQwF/6PpcSQxLHmDfD
	ofvRwRjJBKybE6XCqO0d8V33tLix0z4yrBG/qSe9M=
X-Received: by 2002:a05:6808:3448:b0:467:e1a8:2b92 with SMTP id 5614622812f47-4866fdbe769mr357757b6e.10.1780512901986;
        Wed, 03 Jun 2026 11:55:01 -0700 (PDT)
Received: from gmail.com ([108.243.219.47])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a5a64sm2454351b6e.4.2026.06.03.11.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 11:55:01 -0700 (PDT)
Date: Wed, 3 Jun 2026 13:54:59 -0500
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: xuwei5@hisilicon.com
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: hisilicon: hi3660-hikey960: move role-switch
 endpoint into connector
Message-ID: <aiBVHbRX3wxUNFs2@gmail.com>
References: <20260520215325.55353-1-akash.sukhavasi@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520215325.55353-1-akash.sukhavasi@gmail.com>

On Wed, May 20, 2026 at 04:53:25PM -0500, Akash Sukhavasi wrote:
> The rt1711h Type-C controller on the HiKey960 has the USB role-switch
> endpoint placed as a top-level 'port' node, outside the connector
> subnode. This triggers two dtbs_check warnings against
> richtek,rt1711h.yaml:
> 
>   - 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
>   - connector:ports: 'port@0' is a required property
> 
> Move the role-switch endpoint into the connector's port@0, which is
> where usb-connector.yaml expects it. Update the DWC3 remote-endpoint
> phandle accordingly.
> 
> The TCPM core (tcpm.c) looks up the role switch starting from the
> connector fwnode via fwnode_usb_role_switch_get(). With the endpoint
> inside the connector's port@0, it is found through the primary lookup
> path rather than the device-level fallback.
> 
> Cross-compiled for arm64. Verified with dt_binding_check and
> dtbs_check. Not runtime-tested on hardware.
> 
> Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> ---
>  .../boot/dts/hisilicon/hi3660-hikey960.dts      | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> index c6056a85c..27fb08d34 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> @@ -550,6 +550,12 @@ usb_con: connector {
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				port@0 {
> +					reg = <0>;
> +					usb_con_hs: endpoint {
> +						remote-endpoint = <&dwc3_role_switch>;
> +					};
> +				};
>  				port@1 {
>  					reg = <1>;
>  					usb_con_ss: endpoint {
> @@ -558,15 +564,6 @@ usb_con_ss: endpoint {
>  				};
>  			};
>  		};
> -		port {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			rt1711h_ep: endpoint@0 {
> -				reg = <0>;
> -				remote-endpoint = <&dwc3_role_switch>;
> -			};
> -		};
>  	};
>  
>  	adv7533: adv7533@39 {
> @@ -683,7 +680,7 @@ port {
>  		#size-cells = <0>;
>  		dwc3_role_switch: endpoint@0 {
>  			reg = <0>;
> -			remote-endpoint = <&rt1711h_ep>;
> +			remote-endpoint = <&usb_con_hs>;
>  		};
>  
>  		dwc3_ss: endpoint@1 {
> --

Hi Wei,

Friendly ping on this one.
Also, is the hikey960 board still actively taking fixes?

-- 
Thanks,
Akash
