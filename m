Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F0E36E466;
	Sat,  9 May 2026 12:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778328303; cv=none; b=RUQVSEzLOJ+EH3EENn6oItnHDr3qDgqOMXitD4pQBhzOpzZ4nPeZ0wX6GWq/Jw6vAXlfz+5vLq5gBYemqahPWTwfShjC/VMbqYNG4tb/Sq+nN+mTwKjol6/RPjGSw1BSSmHer8VlRF2GPpuuAUA9LUi/4xllJ76tOf+ucdf3nJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778328303; c=relaxed/simple;
	bh=CpXnj5Xgur8UuVrX5bJeosa1ALPId9xslXi/guftDlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jjEL52cTdQTQPeo9Hl+IODr2gwhD/m1BVa0gG/QamjtxyNw069MZ46wYq6Hk3K+RNiBXPjFa7AJetCICmy5ktJyY04Us1a0YcMuDi+40AxOntDHV+vGVg+nJaVmLXeV6Ky6smolkajxW0y0FOKzM1/PYbLtLoua0KhX2W+iBHcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=foXFMEur; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="foXFMEur"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9EFC2BCB2;
	Sat,  9 May 2026 12:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778328303;
	bh=CpXnj5Xgur8UuVrX5bJeosa1ALPId9xslXi/guftDlI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=foXFMEurqY5p5Kjr8yIoVUVW1TOyQbmx4kX5Uv91dVB3sH06ZJOYl6ElZiobqrNRr
	 jzaq06bgnRdWsCg7gRdJYDC0CtP9QL5LAf3mRHHBXWKj7G+0v7vwl70cwjLOpvBThz
	 /ogk1OpXpugz3krxSB2iBEFXgaTq/nyr4WNKUJb/phOI/MFV1ygHnKBI39lUk4euMR
	 2KlRk/07PpcIUo8gQTijgd+7uNW/JDaXRNtQ3epwg6toQGx2K4rSaqmEGiHfL769/M
	 lkjPVJ9HitcvyhynFdyBJB+fhlZbeBcZoKSyyHo7UI5snxyXXlxtyd3bUsW6BL69/S
	 qKrCwxN9wxHtQ==
Message-ID: <ec0633a6-30f6-4db6-875d-69a4f0f140ca@kernel.org>
Date: Sat, 9 May 2026 07:05:01 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: agilex5: add support for debug daughter
 card
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1778237639.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <cover.1778237639.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/8/26 05:57, Adrian Ng Ho Yin wrote:
> The Agilex5 SoCDK supports an optional debug daughter card that requires
> a dedicated device tree variant due to differences in peripheral
> connectivity compared to the standard SoCDK configuration.
> 
> When the debug daughter card is fitted:
>    - gpio0 and gmac2 are disabled
>    - gmac0 is enabled with RGMII PHY connectivity
>    - spi0 is enabled with a <device> peripheral at chip select 0
>    - The HPS LED is rewired from gpio0/porta to gpio1/portb
> 
> The new DTS inherits from socfpga_agilex5_socdk.dts and overrides only
> the nodes that differ, keeping the delta minimal.
> 
> Adrian Ng Ho Yin (2):
>    dt-bindings: altera: add compatible for agilex5 socdk debug daughter
>      card
>    arm64: dts: agilex5: add support for debug daughter card
> 

Applied!

Thanks,
Dinh
