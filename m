Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C141C255E43;
	Sat, 11 Jul 2026 17:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783789992; cv=none; b=JVrPGHzGhAdYWkASePBoeeO9DSM8ZMHULgM573q6Gfmzln1JaTRO60+JTJ4Xse+y4Uyui2/iNh3SiEBH5NM8DLekTnFyOAYY+G0B99diDSQPiaiQb8us4gig4hrtkbPa4s6fQcQ2or88Y8y24IgLv+eXXEMQeVqFqxRPEP+KST8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783789992; c=relaxed/simple;
	bh=dUGVzjsWPMYjciRFNvVCmxbi5ProNzFrf8m0/AealFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ij/OZN0Bln015jiAHphW1+NLrHUwlI7QUWbkpAYN3Ybir7gFmih/eoWXtqCTrsDbAWXj1KD/hgKB31P+hrGHISSbVKC7xfOqp1/qQQFfgFl3WUo0Hw0EEDXr52k9uZSkxyxdZ/UXjob8MpCBLKl/EdC6D4NmsMkM23CE8QA4ExY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXuxx41b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXuxx41b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C48AB1F000E9;
	Sat, 11 Jul 2026 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783789991;
	bh=l1dWx3uS7E3Egkf9EcvQ1+n2SBdIse+VJNTtCKAeaDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TXuxx41bpY0aBm/FUCTAaiE45R+HUO3ocWn4AI0LYU0+IjiGSG4jZhvlSZ78tNqSx
	 T/qKRijmm5gaTH3ee/w7dUANG7wkO/LuaLhgG7GEU3S3iAT/w5/dj/WAuwtHlTp63L
	 Dtp4c98TeXf5ade6M08duX/EY4sB8hI69aad9CYkuVSvTHfWZf9FlEcGFeGs5Tb5Le
	 bn0rxkc+Dz3vVgiQlduQ9x8UsZLg/xyjUcLbwKdjQ6LmAum47wyIx0Lj//vdfeAOcY
	 IU6OHFxI8VPRQUSsqV+1dkN+bgcbxWrGdSoF6YLAJgdKKHRQiy3gSRRXG8CJ6aaIdF
	 pBE1a9DjLRjRg==
Date: Sat, 11 Jul 2026 19:13:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-usb3-uni: Add
 SA8255P USB PHY
Message-ID: <20260711-infallible-mottled-waxbill-beae3c@quoll>
References: <20260709-phy-qcom-qmp-usb-8255-v2-0-3b6c26a45788@kernel.org>
 <20260709-phy-qcom-qmp-usb-8255-v2-1-3b6c26a45788@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709-phy-qcom-qmp-usb-8255-v2-1-3b6c26a45788@kernel.org>

On Thu, Jul 09, 2026 at 04:52:09PM +0200, Mattijs Korpershoek wrote:
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> index 01342823e57f..80b04b7f7584 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> @@ -26,6 +26,7 @@ properties:
>                - qcom,msm8996-qmp-usb3-phy
>                - qcom,qcs8300-qmp-usb3-uni-phy
>                - qcom,qdu1000-qmp-usb3-uni-phy
> +              - qcom,sa8255p-qmp-usb3-uni-phy
>                - qcom,sa8775p-qmp-usb3-uni-phy
>                - qcom,sc8180x-qmp-usb3-uni-phy
>                - qcom,sc8280xp-qmp-usb3-uni-phy
> @@ -54,7 +55,13 @@ properties:
>      maxItems: 5
>  
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  power-domain-names:
> +    items:
> +      - const: usb_transfer
> +      - const: usb_core

usb_ feels redundant, since this is USB phy.

>  
>    resets:
>      maxItems: 2
> @@ -82,14 +89,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - clocks
> -  - clock-names
> -  - resets
> -  - reset-names
> -  - vdda-phy-supply
> -  - vdda-pll-supply
> -  - "#clock-cells"
> -  - clock-output-names
>    - "#phy-cells"

Just like in all other saXXXX cases, same review: move to a separate
binding file.

Best regards,
Krzysztof

