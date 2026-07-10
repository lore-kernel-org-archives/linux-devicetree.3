Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968C73B4EB3;
	Fri, 10 Jul 2026 21:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783719697; cv=none; b=gMQ93twy13wHNuARqNaMWS7qOHOgmCHPwO3zJ55BiemMDN6Uj5A5yNJ6Fun7tdVuX79WpK8FwMhDRGaoBYD/kiRxMk0E4KtjDlJ8OXTAxADBPgtTWWs/Ig941AYXjNuoVEsV2dJvMn0ODAMLztmULnazBf2afo1fPg5pHo3/MU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783719697; c=relaxed/simple;
	bh=OQiIposVHw5vLuC+6NuJdlpwpJShUPFy5BqKTKxwggU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNYq3R7Pdq+vNAHstfE0aQkfReAeg1hYqEY2h28K9WhgiiwLUHegWxTvXTwSxeJorKOwElU2NsbKhPkQnN4FOpK8fVCYnaxMVIvpqgO1FT2XLCYuMAgeeTo/im8UOdC0EpRmcLIoGVk5GyxJF4eg17ALalJa7Tar9uj0GdZOssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HL0+PXIA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HL0+PXIA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7D31F000E9;
	Fri, 10 Jul 2026 21:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783719696;
	bh=fpQFakc7ADEUOoeWFNjk9SVCUxYjcaGUFeT9R+ZGaX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HL0+PXIAgq/vTsJi6Sh27o6ad89xc88z3hy9jTsiZAmdHlLWitHpEJBWyZmKRGkdy
	 cj1wzzk7MIdjD1WwWy4uYQUYKVaiIRtmLWXZj+Ch0oY13OCQ3cwygnRtVs4p5ef8VY
	 pSXTehCpIbdJuqP1Tl6H/nkna90WmB+i7ZqPzeaVSo8g0aD5a+WthJKj16ArQPQCr0
	 PhFlSMZ46lsrZ6dgtGDYsMvYQlzPqdWHt1ZM3INWXSgl4Pu1eXUPqbuZczWbBcDc3M
	 JAXqBCrb+Ov2lg5WUG2H3rbqYXbCCVudc5MhfStHB0V5o7LhFwIJ/ekaqBwbuHwQYe
	 hxsRHbNGOwbqA==
Date: Fri, 10 Jul 2026 16:41:30 -0500
From: Rob Herring <robh@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: ti: Add bindings for Variscite
 VAR-SOM-AM62
Message-ID: <20260710214130.GA1387333-robh@kernel.org>
References: <cover.1783689915.git.stefano.r@variscite.com>
 <10775b12b801255546c9cdefdb153e421aedf910.1783689915.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10775b12b801255546c9cdefdb153e421aedf910.1783689915.git.stefano.r@variscite.com>

On Fri, Jul 10, 2026 at 07:43:07PM +0200, Stefano Radaelli wrote:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> From: Stefano Radaelli <stefano.r@variscite.com>

Something wrong with the Acked-by here. It goes with the Signed-off-by.

> 
> Add devicetree bindings for Variscite VAR-SOM-AM62 System on Module
> and its carrier boards.
> 
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v2->v3:
>  - 
> 
> v1->v2:
>  - 
> 
>  Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> index 69b5441cbf1a..b9da6e62ab79 100644
> --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> @@ -104,6 +104,12 @@ properties:
>            - const: tq,am625-tqma6254
>            - const: ti,am625
>  
> +      - description: K3 AM625 SoC Variscite SOM and Carrier Boards
> +        items:
> +          - const: variscite,var-som-am62-symphony
> +          - const: variscite,var-som-am62
> +          - const: ti,am625
> +
>        - description: K3 AM62P5 SoC Toradex Verdin Modules and Carrier Boards
>          items:
>            - enum:
> -- 
> 2.47.3
> 
