Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A3736CDFD;
	Fri, 26 Jun 2026 10:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782469898; cv=none; b=IPxlAUQMVymB7e+hBfGpFm9bDUX3dBJVBTQX6Z1xdKn9Y05SL0wyOMKvrgPmwSzypwoPgBgnMYiAQgyt2VClWtVhA87+Vaj5nyWKYssHu8/MO8TQvLYOUA5YnzkXOIGE9fZh+RGWnwjI2wLSFWWqAgEe2/PY7b61ToOyQHaj7Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782469898; c=relaxed/simple;
	bh=LUARlZiZ0x4Wd5zKOSyr2PskgH/Q0CBjej8buUc5fLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZlFB7mIy9onc6JHbXUIiBQ+yY8XXx3xPm2GYmo79dCxnyfLEoHAxJ1x3kPIzWVWBr41uyCj6HtIdRFnJfqfIq3mlsK+l6+KLd1sCWMsTPTwaEnKGxFMG1cIminJQBDx0fT/2yiF33fbdVzvIB1BxNA3F7DX6hSQbkDchOiMDdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4qATcVk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4qATcVk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27E11F000E9;
	Fri, 26 Jun 2026 10:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782469892;
	bh=v3K3K//vvfEflsWY7tm0eval8/Ahb+426O2mAdC2cYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B4qATcVkLg9bMgbDEtao6y08hOZCLycTIm3Au2MFly4irjQfpWmglZLNiYJFnxX47
	 o2JamQB5odXKpYd6qzJaeSQdFpnUqIwzkxsjNDvOZFZq5vTRm8ioujvWUXHD1G95tl
	 8nqjFibsjtRiXFySn894Y4lIFW9cHbhPeMApmQAlrOm1Cz/zO9KZNE4RlUcxhrN0yW
	 5vLDxaR50iX+FTLXUzjRhRXtNfag/wMsfeJZY31cWUBGOWgrXCkL8COxXqHyUaSLBj
	 WQ4F+WXQOg70YP/vTOCPn5hqyYzW04dvKtuRrNpud8k3+CPZDPNTm8ndiKRdlo87QH
	 3P2EV6QOSQaPA==
Date: Fri, 26 Jun 2026 12:31:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: arm: qcom: sort compatibles alphabetically
 by base SoC
Message-ID: <20260626-watchful-tan-lobster-ea717f@quoll>
References: <20260625-reorg_qcom_binding-v1-1-f2c6501f7401@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625-reorg_qcom_binding-v1-1-f2c6501f7401@oss.qualcomm.com>

On Thu, Jun 25, 2026 at 04:02:02PM +0530, Kathiravan Thirumoorthy wrote:
> The compatible entries in qcom.yaml were not in alphabetical order by
> their base SoC compatible string (the last const: qcom,* in each block),
> making the file harder to audit and maintain. Sort the entries for
> better maintenance.
> 
> No functional change; reordering only.
> 
> Assisted-by: Claude:claude-sonnet-4-6
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 490 ++++++++++++------------
>  1 file changed, 245 insertions(+), 245 deletions(-)

Well, close to churn affecting possible backporting, but OTOH this won't
get backported ever, so fine:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

