Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE62E31E845
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781161632; cv=none; b=XhEnhVNa9WnR5HMrimL4A11L6NBXy8WeD6ADGEKhtCl9PFbQCM7Wnp0LsHU0ceyoOC6CWxqOD3hsY+prcpmMjLkIfxjwUwKkNn06ayHcDfO3a5EiIkZptfmflRsF+N36dN4QyjU90jADA2VCAHsYbnl9ZMPXlhxlzj4Nj5clBi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781161632; c=relaxed/simple;
	bh=X8QIjsZZWXW897hPColjBZEXTSACcoUe4LSm0gnfD3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ee07GfdbOX1shxfRRSpDnC0zRoUiT7RiQmeQ8LrfuMdsFKueKOOzZYkXHTMtIffYC92CZJQOBvXgTYo9TcPLZM0BRj5U+DCKnss3Kuicq6vdSMDlhk87tqSHVQ/xJqvhNdhJh9e3L8o3C8tIIsQXyHcEGCtFwpmGZ39dEuwDrO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=RjqQxvEw; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="RjqQxvEw"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D70211488786;
	Thu, 11 Jun 2026 08:58:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1781161083; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=n54BnaL2jE54uh4/tKk3tFrCdyT542DJzjBEBpUb3WE=;
	b=RjqQxvEwWmEqPy0Z9A7YKLVbaDd1vfsYtog/GKAKlAuxRdQKnpqmXPiWbySoyfCNWUS+Ce
	HI95rCn+JQMlLOaM58BUPxjDjV4tRPamTMLdT5DlWrwM0bLobn1tm1B4TDwDbfD5R2gx+4
	KtyQHYuaTsEc9F+C62AEkLd+4NFepyKiTLeDOxw5ah+yJXqRYIGAa7X5HTJz/GK5y4+rJY
	qVE9crCIrq30nLot1ZpP+aHTsD9LS8UR40TeAyGr6JdWjQ7X0f/xrNPTAfD8SA9hHF9zq+
	vyvG30b0kL2f3zanU8qpUYaz5MO4rINVIghBtUy7Lr1VEZ86xkSd7wW4/oSyuw==
Date: Thu, 11 Jun 2026 08:57:49 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: add Gira
Message-ID: <20260611-tamale-renter-d603ca346198@thorsis.com>
Mail-Followup-To: Lucas Stach <l.stach@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	kernel@pengutronix.de
References: <20260610213047.500701-1-l.stach@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610213047.500701-1-l.stach@pengutronix.de>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Lucas,

Am Wed, Jun 10, 2026 at 11:30:47PM +0200 schrieb Lucas Stach:
> Add vendor prefix for Gira Giersiepen GmbH & Co. KG
> Link: https://www.gira.de/
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Newline between text and trailers, and no newline in between trailers?

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 28784d66ae7b..2b7bf7d7b9c2 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -656,6 +656,8 @@ patternProperties:
>      description: Giantec Semiconductor, Inc.
>    "^giantplus,.*":
>      description: Giantplus Technology Co., Ltd.
> +  "^gira,.*":
> +    description: Gira Giersiepen GmbH & Co. KG

Reviewed-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex

>    "^glinet,.*":
>      description: GL Intelligence, Inc.
>    "^globalscale,.*":
> -- 
> 2.47.3
> 
> 
