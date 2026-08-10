Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4956239D6F2;
	Mon, 10 Aug 2026 07:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346435; cv=none; b=ez5jaB4im8YZar1rw7jPsvPoul5IyZyAsQdXc83Izewf8FwLFJcWYo5nSrnEk2cAPB826da7alM1YeGsSm7TO91TLVd3skb0S7ks9vTq6aOnB8su7XgIVpz95fpPQTr/1KDz2PaOEy0oJF/iis2kJGtRqpHK54l0EGRSiFd95p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346435; c=relaxed/simple;
	bh=pUcNPmFhKpcTJzRUpkZ0MPNQqb0PC5o/FkH1MMuCrEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzo5u+bRfy2c/SGK1oQiXMUyfbbs/C72WBC/uMhDivFkc55gatUPkw11GlK9B2nH7+vy2Q26msspO9AbiMs2WoyeLRpqat04alZRkY05KUY2ZhdQhDtcsSxnCzCFDeBcH5As8YesBKOAOxIiyQLjOibSYDx0rp5dgM3Lj94pCk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQeirTPy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQeirTPy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AABBD1F000E9;
	Mon, 10 Aug 2026 07:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346433;
	bh=6TZM7Xx2MMl0vR7A+YnyV65FTuUl7J9XDdtRZ4q0zac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KQeirTPybiY5lkIgbLbTq0nTN0/UqMT1UObUALy8s0hOc5zCq4FNHvaQeWIOETJwN
	 vtA59HeF2ZhJtwEK/n3lQ6W+5mcHaeIqViITkp9Qv4ElfROHGYpXvt53nnFcdcQ8p/
	 ok2jjrwGReDcVhefAC/BdcHs4HxiTQ0bd31Ggr3NhbG2UhRBAhxbq4rvaOhg4CiuMQ
	 WEsoc1QiQoz7Se5/I3vrd9rlQ0cHnH95hDZe1U2khfqqo476ekyAF+IgwxfYzbv4lg
	 j8RK32pusfr4DXkF9Hy9XbdgjqIisEUOmmFjzELWiEKguPQegW7UqCcloUQv6gu6nk
	 7QK5TeyyRPhMw==
Date: Mon, 10 Aug 2026 09:20:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: bcm2835: Add Raspberry Pi 5 d0
 Stepping
Message-ID: <20260810-versatile-hissing-koel-7fd6e8@quoll>
References: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
 <20260804-bcm2712-d-stepping-compatible-v3-1-1860094486eb@linutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260804-bcm2712-d-stepping-compatible-v3-1-1860094486eb@linutronix.de>

On Tue, Aug 04, 2026 at 03:13:48PM +0200, Gregor Herburger wrote:
> Add the Raspberry Pi 5 d0 Stepping to the schema.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
> index 2729a542c4f35..e2b32905c6a8f 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
> @@ -26,6 +26,7 @@ properties:
>        - description: BCM2712 based Boards
>          items:
>            - enum:
> +              - raspberrypi,5-model-b-d0
>                - raspberrypi,5-model-b
>            - const: brcm,bcm2712

As pointed out in other email - this is not bcm2712 but bcm2712-d0 which
supposedly is a different soc with different pins etc.

Best regards,
Krzysztof

