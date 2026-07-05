Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BB536492C;
	Sun,  5 Jul 2026 09:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783244751; cv=none; b=uuXVws0qVpv4KJ/BSjBFG9p2y8/92Hf26v6M1gq5/9RHoyes3Nriv3MXXKdGZ3NDW3KBbritIiUHY+536M77sgmVDjanoH877JhGU5oziVcXzLxfp5gcyMRGf40DJy9cfWNQCe9jJ55USveyvBFS1fZQKeY2Rk/corYv64fUDZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783244751; c=relaxed/simple;
	bh=QML/3R4/n3S8roF531jnkGEdSHHrANy8qh8f7wOS1F8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kv3asEsglg1KyHjKDEi4UgilC3zBefxXyTtixUDoIymwYxDCGPCIUg8b+yuLdUFS13dVfVJG4fvK9cDlmme230TeFl72nLR6cTAlhMBDzSSj60kjmXtmSUz32rwLMjJaUXpYi2lg3QGdRDKDIgHJulFMfHP7H2cCdTMeNYJMdbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNlt4mgQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNlt4mgQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202EF1F000E9;
	Sun,  5 Jul 2026 09:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783244745;
	bh=ufksji/qXGlRH4CRhlYkpA6u8CXK+m4oU5KBLEDXkf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CNlt4mgQkIZjrcV6enyUbkwkBdHCHF2AKt0TDCJPBjbyu5Xyc+TqA9+wJOWlDxyB5
	 i7S8fZrECYuHWeWZERKyxNhAbMQ8IoOMzqHTsXuxmEz47zGtvrwmcsaF0/WOPZ9RbW
	 4LFeGfKmbMchfXkipcUEOKzLUZ0bygv06hDNP92jFcqx1VwJX3ytN98HPjLphe142E
	 YS+uhps4CYzE1K39/v5XNmI1wHa0s40ooXr5pi7JeSFVojRzThBhXNUh9SwuYu5Xmd
	 p6L/ApavcjV5NvYp9yDOFyP9AFfBcFqf4T8FL6ZPXmuiNWxsHGqgqIu17uik3kh7Qy
	 VW3VokxU7LBUw==
Date: Sun, 5 Jul 2026 11:45:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: embedded-controller:
 qcom,hamoa-crd-ec: Add Purwa IOT EVK
Message-ID: <20260705-sensible-agile-kagu-df3b78@quoll>
References: <20260703-ec_support_for_purwa_evk-v2-0-c59aac5c6aac@oss.qualcomm.com>
 <20260703-ec_support_for_purwa_evk-v2-1-c59aac5c6aac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-ec_support_for_purwa_evk-v2-1-c59aac5c6aac@oss.qualcomm.com>

On Fri, Jul 03, 2026 at 03:23:41PM +0530, Anvesh Jain P wrote:
> Document the qcom,purwa-iot-evk-ec compatible for the embedded controller
> found on Purwa IOT EVK boards.
> 
> Like the CRD, the Purwa IOT EVK carries an on-board embedded controller,
> provided by ITE and running on a separate MCU, which handles fan control,
> temperature sensors and EC state-change/suspend notifications. The existing
> Hamoa IOT EVK documents the same EC via qcom,hamoa-iot-evk-ec.
> 
> Like the other reference designs, it uses qcom,hamoa-crd-ec as its fallback
> compatible.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml       | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

