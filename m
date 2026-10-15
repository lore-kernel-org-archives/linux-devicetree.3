Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E53516152
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057302; cv=none; b=fYNFRIP88yD9jY3gCFUgMOoF5Yimr3svsGj+JnyeE6Bg+gFvc+kK3ibfPW1SVil01eQ4oST8Msxa/lTa+U0WVLyF+60aX80ipCIMCJa8H5Rn7N/CZ7fvqjvByFZTdCPnvDVzjMXX8BZLQgQFe2LQYr5D92R8NXvtWCIkYCb2aPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057302; c=relaxed/simple;
	bh=dbBl1S70EBwlUzrAkI0uC0awToof4Z7xgqol8JdSZJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+pMiVKVgNsVlCp4x0npgfoVBZPxwFJ/IWBM1qNu5S8uHreZ7TM2gh3MVcp/5LN0G2fgHNyBdYlNFU5fuVbcJcxkHt3D8Z+O3mT7tEA2prD8msgckQGR6JcytRDwg7nGSzgFkL4KGCVLSR7k0bwiwNRLWCzThk4PCclq2NdDKqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fR/ARxwb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fR/ARxwb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31B91F000C4;
	Thu, 15 Oct 2026 09:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057296;
	bh=XaUADMT+fvSfc/JEU1HgvaWYo/xvNQwoXU0RhWpTA9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fR/ARxwbiz8cBlSzX6lcN52NS6fi0UJ+Uoz+12c6qbscYKOmdWlO6sZq0OFgqTGwM
	 n/5UV/AwoFLoFQMqMEqWlq67vSkixR0mHA07aBOfCwx6sBW3ckxkMo8eqBLHQyGai/
	 vbmfbhBpMui764gYXy2r+80Sppz3dm0jJQ4UTzJzlIc5Vy/lOJodkq12iY8F9rC4Tr
	 uzmCelrhcFR1DAyVZyMauX+drNBrtLI46Y/3k/G1QjmKV/MVWuwmhBdIKwdzwcVKJv
	 D2p/vLqL8rgauscxN5FyQQpPEL68KXmzB69am0n3Ya5r6wBSNDPAtm6vOQavUJbVI3
	 4IZylb47FSRsw==
Date: Thu, 15 Oct 2026 11:41:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: altera: Add support for the Agilex27
 SoCDK
Message-ID: <20261015-prophetic-raven-of-gallantry-a6bec0@quoll>
References: <20261014125709.2106261-1-dinguyen@kernel.org>
 <20261014125709.2106261-2-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014125709.2106261-2-dinguyen@kernel.org>

On Wed, Oct 14, 2026 at 07:57:09AM -0500, Dinh Nguyen wrote:
> diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
> similarity index 67%
> rename from arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
> rename to arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
> index 998f19f492b36..15d331cdeeb47 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
> +++ b/arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
> @@ -2,11 +2,11 @@
>  /*
>   * Copyright (C) 2026, Altera Corporation
>   */
> -#include "socfpga_agilex72.dtsi"
> +#include "socfpga_agilex27.dtsi"
>  
>  / {
> -	model = "Altera SoCFPGA Agilex72 SoCDK";
> -	compatible = "intel,socfpga-agilex72-socdk", "intel,socfpga-agilex72";
> +	model = "Altera SoCFPGA Agilex27 SoCDK";
> +	compatible = "altr,socfpga-agilex27-socdk", "altr,socfpga-agilex27";

NAK, breaks users without a reason. Rebranding is not a reason.


Best regards,
Krzysztof

