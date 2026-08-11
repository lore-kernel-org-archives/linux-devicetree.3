Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C1F4052A8;
	Tue, 11 Aug 2026 07:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786435070; cv=none; b=cOv4FQOeyNJlkz8KpHKmRYU151L5F47dBgMH599syb84JT1OxmHtTNYcmyDR+FJ1zMUO3VTkR3WHs/kdvf4Hcpam4ZoalL/8MZNtAj6IIpLAsfErHhEJ4mnElq8nJHUX0nbYsxxkHhKshnRnOGuxY8DzzShNbbrAiYBi4zWlGe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786435070; c=relaxed/simple;
	bh=d4Nyrw4Fcm/TUfz61bB2DGB4dXNYr4qzMyHmNYz/l+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jzcbM9tLeb8vKOMzyKoIDt24lYHZ8yHZT1gMmgx5mpfi1zRjEqXXU9pWnnc8M4tln1PAobIE7Bke2An0JgIUY2+JGmLbc+ffqEOS5+/HXEAB9AUPk3QrzP4xlgiLIIlvpG+n8BdD5nAPdJvgpBSo0TlptC2SaMU7g2UkaMWfi6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3VfMLgG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3VfMLgG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688B41F000E9;
	Tue, 11 Aug 2026 07:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786435068;
	bh=5BEw1pxh+ooctkiYN6XL+q+OlqLAHSMto5NNvhSXPr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K3VfMLgGmebEk6gE2mRoDB1P9jLlYfGwb0/AeZwnyOJ3Gj3PHNVgqeokUPFeFQ/wm
	 G2789dv7taB0xSwpIdIQIntB6/cH075MdL+RRFqA4ywlai+UySYdYSDCVbxiorhQ7L
	 UgdaZ0G7hhngf31GulxESWTepoD2NnEsYtsIP0l8Idm98NoU95A/x0mrpMEqry8r2B
	 Gq7MDn8yK+62Y77CPdRIxibKiDXWwIwOJNcQ+OEalkB1yF37Tc9wTzD9ZthZjgyrCx
	 5zO7nUVRvRCIbLGOo89gnnTpfZPxcNA4rt1Ha5Tr887TNoBAikw5PaCOQ3up4EF4TQ
	 cXyrodo1AbIYg==
Date: Tue, 11 Aug 2026 09:57:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: bcm2835: Add 2712-d0 Stepping
Message-ID: <20260811-savvy-chital-of-zoology-55a48e@quoll>
References: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de>
 <20260810-bcm2712-d-stepping-compatible-v4-1-73f74479539c@linutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-bcm2712-d-stepping-compatible-v4-1-73f74479539c@linutronix.de>

On Mon, Aug 10, 2026 at 01:46:33PM +0200, Gregor Herburger wrote:
> The bcm2712 SoC, found on the Raspberry Pi 5, is available in a d
> Stepping and in a c Stepping. The two steppings are not compatible.
> 
> Introduce a new SoC compatible string together with a new board
> compatible string.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

