Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACF58634C;
	Fri, 24 Jul 2026 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886665; cv=none; b=QFCt/P9+G0JQ4383VKTN0yErzsdZ9QGrFKY4TH6BkqVaJoS11elrxirsNJ/CLznr+16aI0IST1L4S1BvFHt1uHC37EmrFhCX7OJwlRMEXzOf3LlzmnXgAA5OmrGAyQk9o/91tpqdw8oFFdA9cnOAFI+Cm+lmaXz3Xqa0mndLkz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886665; c=relaxed/simple;
	bh=TeghL9k+P4XXuLw1q3x/qQ/TAsaZuu0UtHzQCyvjUnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnmVqdNvSJv5uMmh80WlOpoJxpYE0ndywvJLnBoPKL2qsQYoaWNxKKin2Ai0oO2jhMBvryTjfxtGanC/HkHPqzXadxa2xiEIl0IT7dmuiGoJb1Y5uhkW9QZN9UN8ndvvHyNU+vh6kLuzSPyFLmpUMmm/9rY/P2ZFj2ztPKSPRFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nyf1aZRa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nyf1aZRa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEE81F000E9;
	Fri, 24 Jul 2026 09:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784886664;
	bh=iBlwXcxuvE3VXmHGDkfRKpOL3ZfRFoGDZ73BkAIFNyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nyf1aZRa7P5aHkyKMWHO72usiNzebmsnu8Zky+6o0/2MIVeLT/pNlERsevb3WCjTj
	 XkgZ9F6hYSQ6H0/Fu4WAPbhp2igVGKHU69r4vUPt8uqNSK2ORI4HD4lHItKi3fEhbq
	 G3kewj3PDmyo9VSq7MQojdDh4A6dum9FryYLvGz1wtX6L3rpAvtT0/L4df3HTzs9Ty
	 O6RnwQTWgMCUfCbukLu8RZKcsOQNAQw6RI2/UhAurj/n7gMe+MvHgfpeRCfZqlhS/g
	 //Ym31SdRii5lLs9NtAxZivzDqOLHDwRctHuC1F9V0hduk30tq41FunNIE8YqcmbEc
	 JZoWTU16NpelQ==
Date: Fri, 24 Jul 2026 11:51:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: John Ma <jma@phytec.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 1/2] dt-bindings: arm: ti: Add bindings for PHYTEC AM62Px
 based hardware
Message-ID: <20260724-accelerated-sage-jaguar-e8a4be@quoll>
References: <20260722214052.1962414-1-jma@phytec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722214052.1962414-1-jma@phytec.com>

On Wed, Jul 22, 2026 at 02:40:51PM -0700, John Ma wrote:
> Add device tree bindings for the AM62Px based phyCORE-AM62Px SoM and
> phyBOARD-Lynx.
> 
> Signed-off-by: John Ma <jma@phytec.com>
> ---
>  Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

