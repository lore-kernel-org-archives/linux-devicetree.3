Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956F217DFE7;
	Wed, 24 Jun 2026 07:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286463; cv=none; b=vEtwGa7ft4GEU/HV58DofTC23wRxD2tY03RNxjyYiwl/nYxnozdo1gULI4qdmA1VvmYxK4jUUiwKIuvC2z0E7+gn1EAF+Y1IuTb7KJBeydo/8IqxZPCnB8Hhvw/dqVNXS6mDdtjBP+T8HPd9JEJQuLJMiRo8yzUfbs3LnbRNpi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286463; c=relaxed/simple;
	bh=cyeZ0c/bhdPnnuOvu4cpoGjEtKDvSf/thaxg8p3rN7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBlFgoOexYTE/PFIojhSVZFMWABFdYFhCpuzZFLf38F50hgJPcr4MTRH4FW04T9ZiLb5Oa2DXQS8p0IlCfzlcuOPzzl8Xzy10hguiFBwt2/rJj3f/thojZ85DW2L9BRK9CJsyF5NoXFLOqzK+IO2lUxSYlwzs4M+/nt29a0SxT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hm5edgxz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hm5edgxz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528831F00A3A;
	Wed, 24 Jun 2026 07:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782286462;
	bh=jw5OK81sQD3kKGgTDuDA8IyBvUD5/4jYGGBsF254TUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hm5edgxzhpxzidArSTgSKaH5r/6iwJUiAMg2PpJyAsb+LvisWHpYnwA2mNwcq6uUE
	 MrqAgeY+tVcvpUmR/ZxQaq55l8rqiKRDNZyb+LP/9qt6DkE8LyQJ158p1GMUh3X1m1
	 0yVA0+jy1pHOedr79ew5y6RE7Yz85bFmqZlB8ns/i24/8keNkju/nboTFYgMXyXT+J
	 ruAexHskfo8oXknxRhD5w4qWlxJTQwKsPGThzzP10uwkA2BlL5lN2G+VgpE0r0mTgI
	 WugMOzWNCx2GR2LovP5UvzQgeOHmAxGVcPF/NOdymbSW7dCuBwJmF8gsQBH540BA58
	 xCULuEioDep+A==
Date: Wed, 24 Jun 2026 09:34:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: sc8280xp-qmp-pcie: Add
 vdda-refgen supply for Glymur
Message-ID: <20260624-small-grouse-of-support-7cdf2e@quoll>
References: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
 <20260623-phy_refgen-v2-1-4d15983bf91d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623-phy_refgen-v2-1-4d15983bf91d@oss.qualcomm.com>

On Tue, Jun 23, 2026 at 06:05:17AM -0700, Qiang Yu wrote:
> The PCIe QMP PHYs require a stable reference voltage provided by REFGEN,
> which in turn requires two separate LDOs to operate.
> 
> Add vdda-refgen0p9-supply and vdda-refgen1p2-supply properties. Mark them
> as required for the Glymur PCIe QMP PHYs for now; other platforms having
> the same requirement and can be added later.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

