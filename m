Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04282EACEF;
	Mon,  3 Aug 2026 22:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785796238; cv=none; b=Zq+JDMktH9r7BbG2MPLXqJUU0DS7QrZ0/7zV59mHpiT+i8xJztK9dBHZLnoycDxE4MczPyfbceXYUvs6vqU3S82FFLDHxqRquG8MMax32Ipcbmz2MOFPTsoMsUTtHDKK68//npOKsO6kgSpxuBfVWfFmx0Ev7I7w/HP+9HTZv7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785796238; c=relaxed/simple;
	bh=2qhREeWkhyk58tTZOkU/hWrhSpcBtQT44wB8luf2DQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFqByhBoGyanuS8YNnYMmefXqNMJqPYzPFLNYtRjxMpTnubjItBhB+Zva6eFIwnws2iUIz7F5LGrmZp0aiy5kAICNIqI39oP9c8jX9r9MtyBToDEFHKg2xhxFga7YMsQTzFYPTUcBz5FL+7i0YmIAFvQ7prUMiOErDoMB9vOduM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Am9aXtUq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Am9aXtUq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4A51F000E9;
	Mon,  3 Aug 2026 22:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785796237;
	bh=IigKqvRGgmLzfifeVZw4ym/Fom+YQ3Nbx928Frc4vEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Am9aXtUqIactw4Th5aSpEcwNh8SsYfTEs3oDxErhGsAI8XeahozuD+sIzP0e/3t3h
	 ufytcUXypnXCcpx1saVnVR0U9YEeClO/mCFKSMupW5yH51FjySn+FC9KTc+q+qaVKS
	 /EGPSLlEgTXKTWZN0aiQwZWxEEcQCio2i4if7jsKorPCUDHggzzgpit2xJHzQqUpU9
	 2n0L7m/Wxx7uDRLnX3JpyEPPbwFu4s//zcmB1WUn9p5TrQjZaPcD9WYpNXOaJbBtak
	 2aAWjHsrqa7O9VRDIiQzJHwYLD1ELAdOAsOUWDu6aj2XHY5TzGvAXn/bHeGo2NHpeB
	 ghI/t9VXrCfsA==
Date: Mon, 3 Aug 2026 17:30:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Subject: Re: [PATCH v3 01/11] dtc: dt-check-style: Add missing /dts-v1/ to
 few test cases
Message-ID: <178579623570.759288.2358053168714058724.robh@kernel.org>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-1-6c9776928cea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-1-6c9776928cea@oss.qualcomm.com>


On Mon, 03 Aug 2026 11:03:04 +0200, Krzysztof Kozlowski wrote:
> The selftest DTS should still look like a real DTS, so it needs
> '/dts-v1/' marking.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts              | 2 ++
>  scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts  | 2 ++
>  scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts  | 2 ++
>  scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt     | 2 +-
>  .../dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt | 2 +-
>  .../dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt | 2 +-
>  scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts             | 2 ++
>  scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts             | 2 ++
>  scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts | 2 ++
>  scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts | 2 ++
>  scripts/dtc/dt-style-selftest/good/soc.dtsi                             | 2 ++
>  11 files changed, 19 insertions(+), 3 deletions(-)
> 

Applied, thanks!

