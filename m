Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EFF3AF644;
	Thu, 16 Jul 2026 20:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784235579; cv=none; b=ZYRTJdhiY45XDE9OzXIMvsiIN03qrdZzschilVu7mkybWtSU1PH5Stgk11tg88kK6LQR+bUc6TfJ5frsTEupVozvtaLujLASzRuSDzMysP6/qIToNkuaV82En6zdKGxFQIvVXR0OFwLcRvlMXn2/RyALnmGVtsXl3Xw/dexbgsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784235579; c=relaxed/simple;
	bh=V0zvz4x4LBE34au4O9eCpsVi2gc//dOoVNbr6pQS3Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwGoVZdQPADR6M5WMJePCkxj2A9Hb63Npk7fOqTkMZRHLLRSuGwr9kHZh9UtpbpbrXZiLCEuH9j7V4ugCeB+HiD+wxzVfWwgyJoBaoXVjCJ12XHxOcxW8TKG1SHgonoMCUJeyNhw+gQhqgfTEyIw28hsib9JJt+IJrnxpGFR/60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OM5yPJn/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OM5yPJn/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF451F000E9;
	Thu, 16 Jul 2026 20:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784235577;
	bh=rmAAnYpVTHz9d6/Ygu9BUKWU9yo3CNYQx+7TE7YAg30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OM5yPJn/46xblBQTTAwZvlo6wNxQXQJGeirV85TgNa8ZHuwiJttZg1LCFmv+G9yY8
	 AiopMCPc93wMUc1l3mP8PpytipIl70EmOEbR/sjHX7Qu5ZKNZR1lnYRLZG7b/y6waS
	 vPSmEFd3Kf+spebV8zio8gxgP1++z3A2ei7t15t9PKJZazkVdJ3gfdgRhL4fEJAeG1
	 /CXGwyfyeADsC2SLnJ7OhyfwiI7NNcrFOmKEmIzLQxOb8qxv0rlAu5g4KzFHil5Rp+
	 FsdP+BNhi0XPLXlkxNNgTMZRZjfngiZPmAnjQaN7UD0JUI9qvgfuIqnc9TTo0QiORN
	 vEh9sP9KbbJ9w==
Date: Thu, 16 Jul 2026 15:59:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v2 4/4] dt-bindings: arm: qcom-soc: Allow WSA88xx speaker
 compatible
Message-ID: <178423557659.1280843.9357388009283178720.robh@kernel.org>
References: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
 <20260707-dt-bindings-qcom-soc-naming-v2-4-1b7d695be2e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-dt-bindings-qcom-soc-naming-v2-4-1b7d695be2e1@oss.qualcomm.com>


On Tue, 07 Jul 2026 15:36:02 +0200, Krzysztof Kozlowski wrote:
> One selects in this schema captures "^qcom,.*sa[0-9]+.*$" compatibles,
> because there are SAxxxx Qualcomm SoCs.  Unfortunately there is also
> WSA8810 and WSA8855 I2C speakers, so they need listing too.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> https://lore.kernel.org/all/20250522-rb2_audio_v3-v3-3-9eeb08cab9dc@linaro.org/
> https://lore.kernel.org/all/20260701135913.1641328-2-prasad.kumpatla@oss.qualcomm.com/
> ---
>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

