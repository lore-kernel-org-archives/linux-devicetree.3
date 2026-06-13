Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509FA2DA74A;
	Sat, 13 Jun 2026 18:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781375788; cv=none; b=rD3EsI/RNIfCDjwCHYpT+rlK768S40ER33u24boS6JXr8J55VWd5AAfR7G66SQdWocI7v2bVdQbB+7z4sR+H6pf8slUW8Fxm1A9afvyQjFJuD+NlBLJu2ZWR4pUzoxZdc9UndEmfR3P4KOvQbr05zjidYav/JvScuRA2xu4GebU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781375788; c=relaxed/simple;
	bh=ho29sxaXGWV56cF5WRhiIddoS1uPjloUDvmbmqCLyZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhFuCmVZl/r5BmhPbDqTAlzs01uAkkyYuYCDmvldNa00acYATAO93/33mg57tNmIiNA9TnVVCeWl/1M5UFXBdatBYbsJY3kP/s3Da4Gvz8pwB1O4ShlMEfgbBnD9cAxmsv7ii61j49WGAoh87BuyWEotZDgvS7ImsIngYkTl0ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vvr4+y/D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vvr4+y/D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DB81F000E9;
	Sat, 13 Jun 2026 18:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781375786;
	bh=9/fhFUOP6QN8GP6i6zmtZ/S1uM1iIL0AFYQSGlurmeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vvr4+y/Dzg+E+ofiujlSepDU9FyS8u7rvFTmEDwvBkhvgB9vOyJ7f2KxNkqfZntOW
	 t6PvweaRyQc5cVgUjIurjvXuU6n7LNfB4MEyU0IMcUZNlfV70W2XCmDP4W59iTHdz7
	 ssAP1DC0hyMU0T7l0IMhLBZ1GIbbfCfkEqh346VrjPnir7ub3+LhGGvl45TytPqNjM
	 c2ddm/8/0IUbOotH20B40qca7ZHGrb9OX6cIRswKGqiHxE6TiT5xCLQmvZEwBdQFgW
	 wWcDGQMBWHsJ1GoBXYMkTMG+CIXQLA+WNvCJ6Wmjv2M/e9ssM+wFMW67On3uIOI/71
	 7j1bc9jEgraxg==
Date: Sat, 13 Jun 2026 20:36:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Iskren Chernev <me@iskren.info>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] dt-bindings: phy: qcom,qusb2: Straighten out SM6125
 and MSM8996
Message-ID: <20260613-impartial-cow-of-emphasis-e60cdc@quoll>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <20260610-topic-8996_61x5_qusb2phy-v1-1-d7135980e78f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610-topic-8996_61x5_qusb2phy-v1-1-d7135980e78f@oss.qualcomm.com>

On Wed, Jun 10, 2026 at 02:04:14PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> SM6125 DT currently uses just the MSM8996 compatible (without a primary
> SM6125-specific one). This is not only wrong for the reasons of
> violating guidelines, but also happens to not be valid.
> 
> The MSM8996 PHY is quite similar, although it requies a different init
> sequence (for arch reasons). MSM8996 also needs different power
> plumbing, as the VDD supply is fed through VDD_MX (which we define as
> a power domain rather than a regulator), unlike on SM6125.
> 
> The init sequence seems to have been "good enough", but now that the
> bindings clearly diverge, add a new compatible for SM6125 with a SM6115
> fallback (as they seem to be an exact match from the SW interface POV).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 31 ++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

