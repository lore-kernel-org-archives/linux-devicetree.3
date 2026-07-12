Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46D1358D00;
	Sun, 12 Jul 2026 12:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783858924; cv=none; b=VdFv3VkRF2tzyDnUsvpws95slo9sgMjGTBzKhyXVZvQabifb8QP+dPJDzscl09lhqPy8AcEbQ9nsUUH2WH41pFzAZB6gVvWphWwcpim+ameHbqiyarnbozAfAFl3bpaxVmHeCL/05K2bOp1mfoSt4+NNJNkLpGsczrkCg77JPSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783858924; c=relaxed/simple;
	bh=LFtV5Fq93vPYbTIEaNtzzufn8HDF/AtYb2qWJdYRIw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9QYqqn3rDcC9HQlj7JRtL67HR3fehGLtwpG9gYH5wjwaIdCBOOXiCZ2issXRGdHtYJNJGwrbOfnYa9cmo0bSmisblIZclF0HhgWQ7so0Ei64kAmsEhxXrDkPd4aodgK0PsQdC3shdmRpj0W4witk2P914J/24lGmBjFXj6k+iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UoyrEJoX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UoyrEJoX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE6F1F000E9;
	Sun, 12 Jul 2026 12:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783858923;
	bh=36mROewa5tuVs+2z+rkX6C62iFNne6zrec9pxHF3F84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UoyrEJoXKUcKLw5tOKP9NDsCbsOyA7AUYYk3G8tDjpfkaCujWL2XFLyx+VhwdRbGK
	 O6SHiKFG3Le2orG46xMdTi+o0DQR/NNDHmU+UbMjtrsbxKlmd8o9xMTxGkkReA/Uu3
	 pIct9A9XoP9raFpVzMNFMs01Ws5tbxFGzCxpg7/lpv+npn3EV6k1R/efKZk3tg8DCw
	 PpVPq4XcjxzwrHb6zufk5XtZvWx8rWC666eHRypqc4ODtnKJjUyPS2NE1pYaN2WcP1
	 0OGc02I5Kk7g76ZCjW4OE2iGddBGGdwVPOqdBL6yaJovdwU74Hbq7z/2ncajuq/bVL
	 Vo2ZtMD5M1Epg==
Date: Sun, 12 Jul 2026 14:21:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: phy: qcs615-qmp-usb3dp: Add support
 for Shikra SoC
Message-ID: <20260712-curly-parrot-of-acumen-eb8ef7@quoll>
References: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
 <20260711-shikra-usbphy-v5-v5-2-229ba3602737@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260711-shikra-usbphy-v5-v5-2-229ba3602737@oss.qualcomm.com>

On Sat, Jul 11, 2026 at 10:39:51PM +0530, Krishna Kurapati wrote:
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,shikra-qmp-usb3-dp-phy
> +    then:
> +      properties:
> +        resets:
> +          minItems: 3
> +        reset-names:

Same feedback. minItems

> +          items:
> +            - const: phy_phy
> +            - const: dp_phy
> +            - const: phy

Drop

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,qcs615-qmp-usb3-dp-phy
> +    then:
> +      properties:
> +        resets:
> +          maxItems: 2
> +        reset-names:

same feedback, maxItems.

> +          items:
> +            - const: phy_phy
> +            - const: dp_phy

Drop

Best regards,
Krzysztof

