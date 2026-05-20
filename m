Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8F662809;
	Wed, 20 May 2026 10:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271986; cv=none; b=TWPUTKS5x5f9SfMKBVuC+KSrYQmHnQbnw4qudst+313LPPvJonVzZs0l2IB5TmEoXDN8wLklvi5K3fd+vv2dKCp44UUwwfABz8BdvP1of3omqlBZ4LDUudbbZeQ+9cV9YbjqQFWLQKYO3CrfBmM1N1b9HGLSEXbjqzKn4jov+po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271986; c=relaxed/simple;
	bh=Jpb7VE9uICEb96rmejOXYaUww2wwZYt5AoYOgp31crY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ygc7prEa8aapQdKP+tmzyiBsv8ohZVy2yB6lLqAKsVZ7b6Bihe0UEBTb9O/FwdEAA2HlwcSZtgQw5DaCR/dW1Ce6Qy08X/I2G7GCDaXwfZDMPzi2bftdRr8pf1FI+4kTXflO97jU0et3te1qSL9wUYYImSGL+/E+d2x9UGsknLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7kYwrYd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7kYwrYd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0DD1F000E9;
	Wed, 20 May 2026 10:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271985;
	bh=ezmH9NFnKJocOGDjlXHbRY3fjedXko8UdvhfhS1bXCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l7kYwrYdRjmqoz/rpaS8rHDA9UslABNJYuz8/ycaISqEDY05NR5KGyj0YP0M/Hec6
	 GDfCrNYkl0FVNXpYcgCsQgslSUT0JPCrSWKqbYtsfmpIo86QHI3mXNfZi7Me0evDNB
	 64cSUbbIz2sXJyVlyMbjEz3v3rE3rbxTTMjpo13p2Qs3eLxEHjbGjbqqyq183MRoqk
	 DWD0nAX+iVsQ95LfrUF+sWucIMKQBCQ6VnABUPQP+0RmXhxsSdolxbyECUmNykKmL+
	 mU5pPOOI/mF9XpUsCQNX7unbrKi4Ge4QXrZhiPEC+V/Mqkb9I1m05eSsN5TvrKOYjn
	 kHRXxtucSSNPw==
Date: Wed, 20 May 2026 12:13:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Eliza CQS EVK board
Message-ID: <20260520-innocent-tuna-of-cookies-feec9b@quoll>
References: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
 <20260519-eliza-dts-qcs-evk-v2-3-ad7303659d24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519-eliza-dts-qcs-evk-v2-3-ad7303659d24@oss.qualcomm.com>

On Tue, May 19, 2026 at 07:09:54PM +0300, Abel Vesa wrote:
> The Eliza CQS EVK board combines the CQ7790S-based (Eliza) SoM with the
> common Eliza EVK base board, which provides connectors for different
> peripherals.
> 
> Add a common Eliza EVK dtsi for the base board bits that can be reused
> alongside other Eliza SoM variants. Then, add the final Eliza CQS EVK dts,
> including the CQS SoM and common EVK dtsi.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile          |  1 +
>  arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 20 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/eliza-evk.dtsi    | 20 ++++++++++++++++++++

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

