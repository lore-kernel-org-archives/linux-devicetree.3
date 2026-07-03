Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7193BCD21
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076226; cv=none; b=TMxbSTJAuzEMzVNzGblmUy1o0Hv2FIfR1qSaHCP2giz/5deSv/bgYaksDUWh1r+QuE0ojTQ0O8lGI2SpM9hm+EDw0HUFR/GdxHB9n2Y9sx7ChGcqxrNpUV3elmkVrVwmi/l6gU+HpBDLN9pMTOMFS03OdrrA5gU29wz7pTUTrFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076226; c=relaxed/simple;
	bh=fOspYmxc2zXdgh5UZUBMH1+9Ue01R7MRGoH18j40Z/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnSlfUNEecsM4E5zqnT7r7TOCQo6r5P/BHwBf2mGbDbPwMCc90+tqjN/0MyIQiBb0PXuTQIcilpP5/TbhVQVXX3jDtC9eDPNr1xCNR4HIBaonF1XTQPCI3FTmv5mLybNcgObyHh550DayBCzcIVJhyO8jRQUVqvIlKJZ2p1Kr5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lU+bcICR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lU+bcICR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3040D1F000E9;
	Fri,  3 Jul 2026 10:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783076225;
	bh=Ketzb9Adr6+QGYEQNjeX9dSGeDo7D7mBDoepvOOpwqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lU+bcICRyFLUs3CEon3n3s6Zm+xvSNTq+w5omKNsrJ0zBsQaRlZpUSALqpSDvlDz8
	 qH82a7z92zU4vov9slIcmIyo2FW4s4uCVM2KoQcXxp+SZe/xzCY9vtFFI8L4pyeX/J
	 BTRsjJR0EXEqo8t8TmzrZX9e9HeblLLZwLwZFXA0IUQLReGtYw8WC5/oNlVvV7/szb
	 45sIGrvoYJt6HVvUCFBy2k/4VDxDL1AF4IxyCTTki2Rr8yO76kE467FnDydT8HbH7C
	 L0TSrRa/ExVStEFIknJmeLYV/Vm4olTT0qcxyb1cnrEfnQV27p+GCtm/4u3IE6j5qw
	 gEcWhuYMl405A==
Date: Fri, 3 Jul 2026 12:57:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 01/12] dt-bindings: arm: rockchip: add FriendlyElec
 NanoPi M6
Message-ID: <20260703-polar-tidy-pony-6ba8d8@quoll>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
 <20260703-nanopi-m6-v1-1-8344a1559519@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-nanopi-m6-v1-1-8344a1559519@gmail.com>

On Fri, Jul 03, 2026 at 12:07:16AM +0200, Joachim Eastwood wrote:
> Add device tree binding documentation for FriendlyElec NanoPi M6,
> a single-board computer based on the Rockchip RK3588S SoC. Very
> similar to NanoPi R6C and R6S.
> 
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

