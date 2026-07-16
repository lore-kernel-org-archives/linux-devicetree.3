Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338AD3B14A4;
	Thu, 16 Jul 2026 20:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784235546; cv=none; b=KitKs/yePDvREbyV0mrY0fqsrQPDiKXNpQdaIIuh6CjaYlEaq09pLmo6gvi1wtkWwxNtdRKXicNClmI05nW7/BhifFATvyeHT+Ezs71Aty2W6JHeumFIwjWJcEFE57QfzYoyhcL35dxyu5UeoZ1pyLaDGnP50SL/Lcq7MAg9Vdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784235546; c=relaxed/simple;
	bh=jg+OUZ6Brs1UE5u/uhBBdMBnuqf61DYdKlh+ArWhX0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMghS7yO+szK497e2BuCIhQrrQAWOSZDonT4a/nHJGm0Oot14fM3Iio24mj5pZPFl1Dl8y8YNzz1boiwIMk6Oo3PgpqR75hCPtdu+AXYR0LRbpn91TtoX3MtD5uNCTB1Xw4W7BA+ONefmEyzJhXkiZuYkVm3Tf2bwYmoygNZ+Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4QE3Xkf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4QE3Xkf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4FDD1F000E9;
	Thu, 16 Jul 2026 20:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784235544;
	bh=YgADqyffpAjxthgt2irBnBKKcItjomxd67wAZAu3Teo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a4QE3XkfpAJSXoklRFfJ+sq9q3xIefNU6jfdmPJmle8cTRx/aTTNTMl/RbuPNNHTs
	 6pABqob8IaUxjkqIMM8Q9jvxUVILhKx9iDPQVcQfCWRvnj4r7pJ4AppwmpJH7OkpwL
	 hl/mA1fqtqo3CjJYG+swextTGDaXN0dljNDFeqG9GcqF9AgqQcURhxfDyWXwpPv5aR
	 vc6Qu3PYnOgRmULjEWYRyZc5DeppXZZkMIfbsEaKqoIZnwIejjSKvG5ZyL7ripPXNv
	 4SImo2Od/ZwsNE6ASps2cjuXR9lU+D2tZIAxQ117BXFYien+m+l/uyZgDcT1Qnd6T5
	 rMyhHQm1DBUeQ==
Date: Thu, 16 Jul 2026 15:59:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: qcom-soc: Document more of
 existing legacy style compatibles
Message-ID: <178423554379.1280061.8498304590471658332.robh@kernel.org>
References: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
 <20260707-dt-bindings-qcom-soc-naming-v2-2-1b7d695be2e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-dt-bindings-qcom-soc-naming-v2-2-1b7d695be2e1@oss.qualcomm.com>


On Tue, 07 Jul 2026 15:36:00 +0200, Krzysztof Kozlowski wrote:
> The schema misses several old style compatibles with SoC component
> trailing in the compatible (qcom,IP-SoC):
>  - qcom,apss-wdt-x1e80100
>  - qcom,apss-wdt-xxx and qcom,scm-xxx for SoC with code names
>  - qcom,kpss-gcc-xxx
>  - qcom,rpmcc-xxx
>  - qcom,tcsr-xxx
>  - qcom,usb-hs-phy-xxx
> 
> It also missed qcom,ipq806x-ahci.
> 
> None of these were flagged by schema, because they were used with
> fallbacks and the schema checks only for single compatibles.
> Nevertheless document them for complete picture and for future change,
> which will apply the schema to fallbacks as well.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

