Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B9F3E63B0
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 19:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786995634; cv=none; b=AlFAl+wnunYEm9BUPnOKfu5C5DHe+o9tudIUskgB94igEzstfNgMfTiy/8IyqhpaVuytLtfmNPhmK5r2r+edtZsY5y4zrvNHJEu56cxrTgI+OOFJ2q67sDAkqNvfrWPD/w7BmVFYxOnb3e82QJhcWHwznbgZzB440rJSKtoAlWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786995634; c=relaxed/simple;
	bh=J3MdS4PH0Su/2ookildlSnvG/LcVZKRvW1iJ6HnLlBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bz1gdDF7Tusz/A12/TiCNLVAEs4vGmqJwwkNEx+5HvXy8qTAhbyaYEOpmHWIPf/e+12BTyxmgHZnQWql8ZRYP79d8hCA8inRRpw2crVM2d9NLU+Ya7+4gH03KEwJqT3JikxOpyS2aoCkp7HK/jGgaVf4cLSXt4vKrO74ue1IUks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NYjfRp2M; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NYjfRp2M"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BE101688
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:40:27 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C62A73F673
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786995631; bh=J3MdS4PH0Su/2ookildlSnvG/LcVZKRvW1iJ6HnLlBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NYjfRp2M1Fu+FJBIBh2+pH1LZNCEkdwFWItMfooWBmB9S+Wzp3Qn6fBSoQaDCdWkz
	 hJ7fkQgvFFMbTdgvD7+zIX1Una8eby2/iuJQ+rzpjAnYSLpFth8eU/xcQv8kdYRtZr
	 mW09rqMrrtwsSOfd3oKEeUDEi4esNRQ4Bq9V2Bi4=
Date: Mon, 17 Aug 2026 20:40:23 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: arm: corstone1000-a320: Fix GIC
 redistributor region size
Message-ID: <aoNjpw8p6tUw8b0v@e142607>
References: <20260817185607.1756124-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817185607.1756124-1-robh@kernel.org>

On Mon, Aug 17, 2026 at 01:56:07PM -0500, Rob Herring (Arm) wrote:
> The Arm Corstone1000-A320 has a GICv4 which means the redistributor
> region should be 4x256KB rather than 512KB. This issue didn't become
> apparent as SMP was disabled as a work-around in early versions of the
> FVP.
> 
> Fixes: 87599f1843d3 ("arm64: dts: arm/corstone1000: Add corstone-1000-a320")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  arch/arm64/boot/dts/arm/corstone1000-a320.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi b/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
> index f0937914350c..f895a024fc92 100644
> --- a/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
> +++ b/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
> @@ -73,7 +73,7 @@ gic: interrupt-controller@1c000000 {
>  		#size-cells = <1>;
>  		interrupt-controller;
>  		reg = <0x1c000000 0x10000>,
> -		      <0x1c040000 0x80000>;
> +		      <0x1c040000 0x100000>;
>  		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
>  	};
>  
> -- 
> 2.53.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
