Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39954052A8;
	Tue, 11 Aug 2026 07:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786435087; cv=none; b=Mg8NnzPcPqOxGDTZWpal/Vsc4SQT3ud/iM5Q3m41wXmpbNCvUqkvawxLcaObwtOkY5veXP0U6ERM36OdrpOINCwYl40cUMYaHgdJZf7xAV6Ed1M++0rBjQxbaZHmKs9AIIBic0Nx/8Nfh7wqLH6Y502cSXMM2AZgLnSg1eB664E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786435087; c=relaxed/simple;
	bh=BcuvSq3bhwOK+wJrA7K0jYc+TXcouIzTAIZnvLiAU/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hm3do5LZWfCuw4PJy9BsV3hijI/JY43CY6jqcs8BPiQeFqFjoi0LyZo+yz83GeowBNq6s2bUD9+CZa7Loa5S+Skjz3Q5T9RjH4kRqbVQ8JKCHwCr63f6ntflUlUnIZysm2ym3rObzkTKjCAmOyZzRJTVqVbnKQxIZcJQHP7A3xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ot72oGLG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ot72oGLG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F171F000E9;
	Tue, 11 Aug 2026 07:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786435086;
	bh=t3h3cJ0qP3L7iOzOK2iiDLYlkqhKo7VzA9qO5zpqwG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ot72oGLGy5tCfNQQtynMP840Swd1Kypxm8BrBtYOqAg0BJ1HPogZR+ytLCLhZKlZ5
	 quTz9O5O0hpOfTCbDt/B452ltgkL/+IRfP+TDmETWZ68J3lO25DZ7SxPwcgUP+sLTV
	 19D0bVOR/FZcuvAMUNKmQj0Fl08cXFQs/VqGAcgkj6/96JNoY+wstpp/W0gKeizO9T
	 nc1pmuOIhPUvMq+EbcOosLrPFx/uU1zy9jSC9CPW0VDRS7m+EvGML6+LG+mxtGeW1x
	 eJou6h+a+wwZG64JPpRcEbmRrOJjBWTTcJVtoTHcA7Vkxij2d7IZkzfbkyQg2PbJyP
	 qzr1li1MH1wgA==
Date: Tue, 11 Aug 2026 09:58:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Message-ID: <20260811-celestial-discerning-scallop-beeba3@quoll>
References: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de>
 <20260810-bcm2712-d-stepping-compatible-v4-2-73f74479539c@linutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-bcm2712-d-stepping-compatible-v4-2-73f74479539c@linutronix.de>

On Mon, Aug 10, 2026 at 01:46:34PM +0200, Gregor Herburger wrote:
> The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
> and in a c Stepping. There are two separate dts files. The
> bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
> the d Stepping. The d stepping does not set its own compatible/model
> string but uses "raspberrypi,5-model-b" through its include.
> 
> These two steppings are not compatible. Booting with the wrong dtb file
> causes a crash at boot.
> 
> Add a compatibles string "raspberrypi,5-model-b-d0" together with a
> "bcm2712-d0" string to allow us to distinguish between those two
> steppings.
> 
> Fixes: 44839e2ac8ec ("arm64: dts: broadcom: Add DT for D-step version of BCM2712")
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

