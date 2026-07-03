Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4080242D67;
	Fri,  3 Jul 2026 09:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071067; cv=none; b=E7I000qj4bU4MsZNVjhcYkwnfgQP5rjKh9zNL/MlNCvyEKotcH7ZLwdZDS4/oYodEktdBvKDMKfyjtXienmlULHOUdjAarqHfEWnH7aWqS4DFObVgelKQm7zAY+0ExFk2fsvhfxjT0bkLdeDyi9mUVz5OSGi3MIZALw4zQG2gpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071067; c=relaxed/simple;
	bh=/17YfCpR6+pjL/FAODA9dH99tA9mp8d9ZPgTgf42MCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnx3HB96g4pjFPXZ/2yie3mh+cWZDz1138DH3nfBSiUW14KObhjLyPBEW2qUGtn8bWYAGEXdg5L8J0RcX/O0IM5VEn3bmCi1Fzajbbcgegk1rhCfQVc1QRW54wzcghWX4RiVjin0svsUhnasnL0qFn6iIjVHgpAklq3Gq0XPHgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uf1g0M3w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uf1g0M3w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1751F000E9;
	Fri,  3 Jul 2026 09:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783071065;
	bh=W8xw3etIy6foek9WKsJsilEnRxUxYjJaX/UNXM0wvDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uf1g0M3wV1698VZIbuY8+hqW383x/+006Kb9l3XLzyXfctAnYUTigVmdxWpa6u5hm
	 zPiNZcLTaMpBdpupo/A3gHIIizuLKjIfFG1fqLFGbKySUG7Tom6iqWPwZ6dln72j5Z
	 618jQ4le4aEybagTfBg/OCPOqNV4ySmA1/yB1njPmMUwHnCOrML4o3El2gDUjLZ/9S
	 Na+klAOrDNfMNk7cD8ckn3EC283BWRTwxjTEMxGrD34unGA6TWWJ/Gs/MDf7DUsty1
	 bx4Xm+G3GtfwW8jkhcFBp4H7vWc6YYZMkaOZB3LdZlmA2c4vEUkAU2Yz2Hj7zdye8y
	 0pJouUk4rroMg==
Date: Fri, 3 Jul 2026 11:31:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com, 
	m-chawdhry@ti.com, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: w1: Convert HDQ One Wire to DT schema
Message-ID: <20260703-furious-cordial-firefly-eb11fd@quoll>
References: <20260630124826.2992529-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630124826.2992529-1-egbostina@gmail.com>

On Tue, Jun 30, 2026 at 12:48:25PM +0000, Eduard Bostina wrote:
> Convert the Texas Instruments OMAP HDQ One Wire bindings to DT schema.
> 
> During the conversion, several updates were made to reflect actual hardware
> usage and resolve dtbs_check warnings:
> - 'ti,hwmods' has been made optional.
> - Added 'clocks' and 'clock-names' properties as they are used in actual
>   device trees (e.g., am437x-l4.dtsi).
> - Added a second example for the AM4372 HDQ controller to demonstrate
>   the clock and interrupt configuration.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>

Wearing DT hat:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

