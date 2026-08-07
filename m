Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE40367F4D;
	Fri,  7 Aug 2026 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786110864; cv=none; b=kDWI6Cgww79sF7XNn4+CYSaAsdycRIO4OyYrAlFrGt/sTevNYfH6cx2IWvIHfOQRfupnQQeubdZdq+2ez4F5s33F9t5mo8vxMMddMxIuerWAkBTZP1eRab3wE3cyoG4Uwfmq/RKvx5Vj8T0M0IkzhjdwyuEmmgKGyy8+qWSFXsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786110864; c=relaxed/simple;
	bh=/1ZgGxXPCRvz6gy0zhTdaaUeMCRPF5hDDU8d3shJmvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZrzk7fDBhmbViD6NcxenHNzpyQ8RKM2NINNWh6l8HbBKIxN/Q0hPz0H3Tsq/JUEvpPlO39wlIdgHiNK5z8nM9PjndZbkYigsk6EUFBzcBAe5IbOGpIGy2a5FhySvQsXc07QJgXWoVE5FBXW/meDTpTeHtScV2680AhMCxl/sBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPAz7OMs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPAz7OMs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2E31F000E9;
	Fri,  7 Aug 2026 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786110858;
	bh=LrMbeDtSQlhSgNrbLkiq15nIVBWXNtcN0NqY2+7szXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VPAz7OMsggRQ7QcTvFsfkCdc1vsvSkSdCCPF+larKoF9MfnPwchfBnAhnqvMxp5rT
	 OiTJ7+CBqRK18/yFf3zpt87QSiibbNWN70Ri+NLzGCGIJpcsS1BJjzJgWlxvUELXvV
	 KLCg/kr2HK3chT/+vWvG1SGr/zk2FDWItiX4t1FGa5NBRMv1odKTInB411jK4da2wp
	 aB8e6jXbNSUC7sY3/BVt//VlwyINyEHh2AJSsWVDbS3taDe7aihnzQN3LaknnVnbET
	 VguGsEbX9osV/tzXlvUO9jslcz8ooZ1SIgsGLN2e3qJIVmHMRYSs9TVq1yw0Dk+Cm3
	 UGwvg5S3H+4mg==
Date: Fri, 7 Aug 2026 08:54:17 -0500
From: Rob Herring <robh@kernel.org>
To: Colin Huang <u8813345@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v4 01/12] dt-bindings: arm: aspeed: Add Anacapa EVT1 EVT2
 DVT board
Message-ID: <20260807135417.GA63178-robh@kernel.org>
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
 <20260805-anacapa-devlop-phase-devicetree-v4-1-5d67e0efa6c5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-anacapa-devlop-phase-devicetree-v4-1-5d67e0efa6c5@gmail.com>

On Wed, Aug 05, 2026 at 09:02:29PM +0800, Colin Huang wrote:
> Document Anacapa BMC EVT1, EVT2, and DVT compatibles.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Missing Conor's ack.

> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index dd7996960de3..1c2656d99807 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -84,6 +84,9 @@ properties:
>                - asus,ast2600-kommando-ipmi-card
>                - asus,x4tf-bmc
>                - facebook,anacapa-bmc
> +              - facebook,anacapa-bmc-evt1
> +              - facebook,anacapa-bmc-evt2
> +              - facebook,anacapa-bmc-dvt

alphabetical order

>                - facebook,bletchley-bmc
>                - facebook,catalina-bmc
>                - facebook,clemente-bmc
> 
> -- 
> 2.34.1
> 
