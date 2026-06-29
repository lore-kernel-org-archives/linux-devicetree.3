Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAEE1A268;
	Mon, 29 Jun 2026 07:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717085; cv=none; b=D79A3YXwUv8m4wt6KUm+8t0vrFcTnySPsNrqTIRfPCa+ztKl4dWnbItHp3RVOWKJJrOTYF78RDzUzoP1q/dveCXmX6B3+Al1aZo4N6r0PoJzhO1tYepxVMYoF67K9YjFvdnhB2WrqljC7h7Dpz956RBZGDTfZeNEUFyjGU0W45c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717085; c=relaxed/simple;
	bh=vHfD85y2UH0foPiPKaTSiCmA7/NZbN/+FkF/DtBsL+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvwozcGPJ/lKnMunswSKd/gKHI9Ct1TwkcOJC7klxGddrPwO7qOL89ShbEplqZRgYPN3qWGoFBTNNJ+TGoJphPBSTCk/jMgiIArTsjVtreizjNnzFk+dA7f+u8PtUJqTnUqPj7aJS5B4fdkD8vlCe0EcR3HMeMAy3umVnD6T55M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614B91F000E9;
	Mon, 29 Jun 2026 07:11:22 +0000 (UTC)
Date: Mon, 29 Jun 2026 09:11:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add graperain
Message-ID: <20260629-flawless-cherry-starfish-9c4fbe@quoll>
References: <20260627225755.1710837-2-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260627225755.1710837-2-coiaprant@gmail.com>

On Sun, Jun 28, 2026 at 06:57:54AM +0800, Coia Prant wrote:
> Add graperain to the vendor prefixes.
> 
> Link: https://www.graperain.cn/ (China)
> Link: https://www.graperain.com/ (Global)
> 
> Signed-off-by: Coia Prant <coiaprant@gmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

