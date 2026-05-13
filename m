Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0161530BB97;
	Wed, 13 May 2026 18:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778695821; cv=none; b=MlYonlqNiEYTHFb3x1TDjJ2+kW83ttgqJDQF2xS+mArEluMeerXA1KZHglYWRYT5N2neAXgy+YxTX3NNhtkY+NLpJW0X6PP5vi8lbz0Ks0+oDlORTvhsUMi9ku+tPnnNSpX2BXIG97kz8RIDr+eJ2uc9nfgQ4dBk/uQaOHzNrnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778695821; c=relaxed/simple;
	bh=rjptUTlU6uw4Q7UJWj4oLaAslV1IKlStqAiRz3zNv5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVh70PJpk4KfZZeE3OPVJQmY8d26vsN1ONKTEJQ13z7Dn0iZczL10Wpmf9te++5p/CmdQiqf9a36LaBAQ7c9CUBmz5gSL/YNcTEzi5tJT0l7a2DTc9ys8GMr+ek0kUdmoB/6ovScTLWGi8vh/o8xqP2jzOdu958saLAuy14KZFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ln6ZLe3K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ln6ZLe3K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D52C19425;
	Wed, 13 May 2026 18:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778695820;
	bh=rjptUTlU6uw4Q7UJWj4oLaAslV1IKlStqAiRz3zNv5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ln6ZLe3K9Twb2LuzMfGvBjWH37oQkOUDFKNSaxnCbj/2CRgQDY1l+F/EB6QRGDs5e
	 62hFuqrs+isRBzq/vpR+CBm5EEfMKUMEjHWv8dgafeY0Y2TBfi1SpYwhkSlmQ89PLN
	 +1pCSph0OmCqoTV1TQ62KoaMk0yrNLAf9uyfrfzQSGSDOTi8DsIHKQut7msZVyZUnD
	 FawpmSzd8mfHHM4ILuP7Jo9yxbRjdOlDH9FjDZjs0yQ8cFC5bKHaYuFUUYUGYOaDtS
	 iUEmdtRAfrRIAUQcfducLlZsMrM87v+/BxkC0PDMH1aHXjQj3aafD3XyObicWGJdwC
	 T0yglm9BsV0xQ==
Date: Wed, 13 May 2026 13:10:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	KancyJoe <kancy2333@outlook.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v4 1/2] regulator: dt-bindings: document the SGM3804 Dual
 Output regulator
Message-ID: <177869581639.1513411.6444118271420082730.robh@kernel.org>
References: <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-0-7495e7905693@linaro.org>
 <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-1-7495e7905693@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-1-7495e7905693@linaro.org>


On Wed, 06 May 2026 09:34:06 +0200, Neil Armstrong wrote:
> Document the SG Micro SGM3804 Single Inductor Dual Output Buck/Boost
> Converter used to power LCD panels a provide positive and negative
> power rails with configurable voltage and active discharge function
> for each output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/regulator/sgmicro,sgm3804.yaml        | 77 ++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

