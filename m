Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B70F437465;
	Wed, 29 Jul 2026 08:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314447; cv=none; b=O+pl7brLBhK7mY82VsOPV0fwCUgu1D8hTNdUyaRaxz6feoLGSaaXtldTE7aPSVpXbavaOqsQz9YVBOTNJ0U/GQmpSPsyyxudg3nlNvE85zup+4qaO7kLUSwdMVIsRtAu3etsMRS1UL0fPCUK681EMG5gmgnn/bz1vD6+xcsEG/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314447; c=relaxed/simple;
	bh=FMpG9laZBdPDqzQz/xFsicqZKi24HAqQQw8hEMZeEwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bINSV9lsp8VJTpRvMwBEw2ikdwepkqI2UzIC1YkeAUFqL70Qy8k91b0KTmAhv/SB0Ua6vaeaULyYxRhG/De6kbrZJolifpg5lUnToM4TnDpdLf6NH31DplEGkTA1EG3wOHsKL0rAdRch6/jHkBExRcBy1Z6F7YCHBcvLDdE7oWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTuaRGdj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTuaRGdj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0891F000E9;
	Wed, 29 Jul 2026 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785314445;
	bh=sFmSf2jbiL7dzInzF3ILU/H09H5oNuenhAieGaL8ySA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oTuaRGdjiYEVFU9jpDiDeMRUMmdwAl48ya5YICmZKy+aA9mQzjGTovMLUttMdeO2+
	 qgY9CSQEcijE/g2tYA1DZq4FdV80WefkMb+zowIdkzOTPzYJebGQ6sx2x3TPL0yBHP
	 coG1bcMNx43P/6W9piL3cakc2aI7V8rk4/hke8+VWHBituQJI9OZHJWe13wY6i4uW7
	 hs+b43yd7LpynQjlrFS5zY3eFJhlZf0+cHob4slXM5en4T2th3ilAxBhDIPDujh5e2
	 3X6wFlIPHOH944zHym99hB4ftaW1S/XfuxhgSUvbqcVMkc6H3qx7g67vSpZvFVLvqw
	 MpntsLn6J6k9g==
Date: Wed, 29 Jul 2026 10:40:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alberto Robazza <robazza.alberto@proton.me>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Alberto Robazza <robazzalberto@gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: amlogic: document Orbbec Zora
 P1 board compatible
Message-ID: <20260729-watchful-snobbish-velociraptor-b6f5d4@quoll>
References: <20260728151636.236393-1-robazzalberto@gmail.com>
 <20260728151636.236393-3-robazzalberto@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728151636.236393-3-robazzalberto@gmail.com>

On Tue, Jul 28, 2026 at 05:16:35PM +0200, Alberto Robazza wrote:
> Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
> which is based on the Amlogic A311D (Meson G12B) SoC. The corresponding
> device tree is added in the follow-up patch.

Drop the sentence.

> 
> The "orbbec" vendor prefix used here is added in the first patch of this
> series

Drop the sentence.

Best regards,
Krzysztof

