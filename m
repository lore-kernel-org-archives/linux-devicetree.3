Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429105;
	b=5pRxliT5eAP9M+4MU6qLopnK+k2KIzGOT8WMx8EqlDrUj0/nddHAvnonJe7LjoYAZ5Cs
	 tpJJWGpGFbZ755H/rE2Dj9CRrhmf8jxiC5FD71rcsTLHq85lvIx3DS29WPAgmkzT1Ax+1
	 uhACkENWlnZTf9hUBzJA32VxIVTOb6GVHD8au8UtXiTBy7RLN0sUdmXEH4vI3oZZPrIUZ
	 FPaj5kgDh4yS2vOB/x1pIdw32hKaJlHePu1I9xpqIOKlGa+qMp/kH0gF4r0pfddMr2BiR
	 GwGJDQftaMu35OEH5S5/2xNdz91a41rhz2LByt5IxNlvgNnMSkUyYttWUf/xeSHp+PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429105;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/sqmnkLt08KA+VXy2kvfCmcu/PPE4EOsE1Wu6qbd410=;
	b=vcTOttsa63FofXRKOo1jEHV7LSKtwzt7MD4o7gVh39pDx54PPHVx27asuy8Ql0wd+Qtb
	 +5iqFMLg1d8OIofItTgQUiuulqhzl6zG+p8x6x1zL77qYSiIa0/3FBPiRPP6W0DJrKbBg
	 aDHsGoqvZpZTXUdYYra6onbWxjOYRdWc/MYB9HvvyFW47wXt0hyscvETk/UJ7AL2U22wX
	 mtR5cj+mWCj2PU503jGFvyQoutk7Gpf3/zaWx6rF7746G5jghlVpIphZow0pL9mNqmlXj
	 AknCID7x9iAsIhRIHCaGnQTqxnxZrwb3ofd23xnJyDNQkKoIgN+8rrykcOMY8O63EZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQZPRV6E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91101606A682;
	Mon, 23 Nov 2026 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQZPRV6E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C231F000C4;
	Mon, 23 Nov 2026 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795429105;
	bh=/sqmnkLt08KA+VXy2kvfCmcu/PPE4EOsE1Wu6qbd410=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hQZPRV6Ej/CreF9EtgmPs2kz4fFI2AgbSrAbqHOpdSl740A1ojcGT83NrU1riV3CH
	 7LzG4RYKj3M8cTy8EXNg0B8FW6hOVbo4qIqRoOnVAnNmiUCbU/UTewPcC+9YyjcrEG
	 VtWNq4SffM/JaufBxqV3EWUJXOn7SBi5vVXIxNp1crO2aoFKI6j/fUxAtSI4griTvX
	 h300wP1J/aCYSUBNwVpTISPR6KTCTJtNC1sJEAb1e/toeV96GPQQt8YaYilIZfqOSV
	 k5WWVg/9AYqCGXsUJA1PU/OQIQ1xhcqzkxOiWRHR12pNmplBrsQM1EuhauEoXj8Xfy
	 TXxhoJCbSRjCw==
Date: Mon, 23 Nov 2026 11:18:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: arm: qcom,ids: Add SoC ID for IQ10800MD
Message-ID: <20261123-elfish-goat-from-tartarus-c13c3d@quoll>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
 <20261114133304.989635-4-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261114133304.989635-4-shengchao.guo@oss.qualcomm.com>

On Sat, Nov 14, 2026 at 09:33:03PM +0800, Shawn Guo wrote:
> IQ10800MD is the Dragonwing Robotics SKU of the Qualcomm Nord (NordAU)
> SoC, which is used on the IQ10 RRD board.
> 
> Add SoC ID for IQ10800MD.

That's one paragraph. "Add foo bar, something something". Needs rebasing
on my cleanup.

Best regards,
Krzysztof

