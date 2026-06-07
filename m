Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29197404E;
	Sun,  7 Jun 2026 08:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780821775; cv=none; b=pcLgAHK8QZzE0IL3dqjDMGCNEQGMYYyyOYLFvNZVgzuly5xabAbkKZKwInB7gLskQ5MZ+6PVSm3LX9IGQ2b3IrwvFQu4VsPHo0Ub72ohPFgPV65CAIcZpsy72M89T5xG7NNXQj5ELMhpfpF7gDTvelRXTkkiICgTNcxgkC07Ons=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780821775; c=relaxed/simple;
	bh=RSY3m9J69rv1MGLtCRUEcsjKuDcNc6EpVmHhqxtWrmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foHgh/1Ba/FKwPh1ahj9PEBS6pwkSEuljODji4SWnEx8ff4RQ3d0jtNld4oL8gD+xcFJuRA0JC21JSAyqPiR/hV4o0WyRowlarpxv+9YGc1YR4NJslrNoqej+NVuz2wXHPdcVMvo6/VvfCcia955xL4XKwKApWxIw+S/yH6Hm1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IoEPL0Xu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IoEPL0Xu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617331F00893;
	Sun,  7 Jun 2026 08:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780821774;
	bh=RRIWT9QfFadFGAisYuKX9tvKA4Mdgf+SJMo6TftBjg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IoEPL0XunMZnQJVGyObEvotFqZgwS0HY2R2sSWqiQW0/PVM3J4Vyj9stOiVT6h8z+
	 VPTf83iBa9vP2KsfgNpsv6FRMG7b3qSbOdOHg5oLgY+JM9OqCbHdg89y6XpTviandS
	 NDQEDNnc1g4VZygFgsGrDKi17B5RiQJl1s9q15QlK5yfxYLrrT+u1ip4xXSrBNfEfK
	 DGQu3pTGpohiCc9cF12o/jEn/X/boEERmiEduzLr6Uax7zxguOo5jbQfSZb7x5f0lr
	 QOpl/gLF/8n8TEM/IDKOWuSvwQnPKHblTQ392I5hlUR//xAACOrCOqG79e29QVMIYn
	 +i7GMfrKf97QQ==
Date: Sun, 7 Jun 2026 10:42:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: rockchip: add Vicharak Axon
 board
Message-ID: <20260607-favorite-messy-anteater-a56e7b@quoll>
References: <20260601132529.139172-1-hrushirajg23@gmail.com>
 <20260601132529.139172-3-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601132529.139172-3-hrushirajg23@gmail.com>

On Mon, Jun 01, 2026 at 06:55:29PM +0530, Hrushiraj Gandhi wrote:
> Add the device tree binding for the Vicharak Axon single-board
> computer based on the Rockchip RK3588 SoC, and add the vicharak
> vendor prefix to the vendor-prefixes list.
> 
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml    | 5 +++++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  2 files changed, 7 insertions(+)

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

