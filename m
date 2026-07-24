Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DF82FFDFC;
	Fri, 24 Jul 2026 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784901400; cv=none; b=Tm5jm9IqjBvACjsZod4MxyfXWPtvlrNXk74C6X37Mb3259Msll9bgNzR0b4oWotlB7PxQGh/WR/kYJEdm8c0SAQ1pa0hoBY2My03JPzoC/5D+R/IBrOMTct6Yr8x0zfxl2I/tDTxYn+V9ALmD3xis3wyLyEPXwCcPBr1Cp18pR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784901400; c=relaxed/simple;
	bh=dS1v/gm3PXGc/vmaZguKFMG8+NlvMXHRuTcvlED9YNE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TQSnXiY0xaOU2wKRJZ01XQtnA73P5KTMogLwJAGMNd/LjljK/pXfA4oA6FUoRZthzMbqpQ6cPYuKq4Tp4LvaOph/I6QMIU5jmjq1ICE5Y3wDKC6zcxZQGkeu86ggUqAalphblsKazfmSeGNnAssegj2lbLSxQ12uZzVJT2slpXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PpeqmkEB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PpeqmkEB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573161F000E9;
	Fri, 24 Jul 2026 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784901395;
	bh=vyNF7CgMOMBwTkfpZZmKpQxiS9PJc0x6n41Yn8FVNA0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=PpeqmkEBNdlnkLxn1lCmgikolIi61FXyCRiB9cWP4HjA1K5FhcbTEy/ZnB5LNAnMW
	 AibAjFKgA186dODCEQlluEQwP2b1U4PH48nqFGvk2yDQjCJOnFJpI5uXOzZgzXkw4r
	 mZHgLc/qFWGbmLA2bd9CTZIZw1FGowCO9IXECx9PTEw+lD6INa4iqtQfsPjkgKIwh6
	 vohkXl4hF6Rxat21LKCB+9cy9JUvHORpNCIR9GKFHBfATDzDZPnNIuycwhTWaeIEMl
	 V0japaUXMK3C7Y1dXf7iplZPTyp4QjZFEzhNOygB1+VJKRZW2HuWWWSsm01eCL014h
	 48jQZ8pXpbcVg==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: Add sa8255p USB PHY
In-Reply-To: <20260724-satisfied-spiked-myna-eb63c6@quoll>
References: <20260722-phy-qcom-qmp-usb-8255-v3-0-e789070b48f7@kernel.org>
 <20260722-phy-qcom-qmp-usb-8255-v3-1-e789070b48f7@kernel.org>
 <20260724-satisfied-spiked-myna-eb63c6@quoll>
Date: Fri, 24 Jul 2026 15:56:32 +0200
Message-ID: <87ik647apb.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Krzysztof,

Thank you for the review.

On Fri, Jul 24, 2026 at 08:08, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Wed, Jul 22, 2026 at 03:45:44PM +0200, Mattijs Korpershoek wrote:
>> +  power-domain-names:
>> +    items:
>> +      - const: transfer
>> +      - const: core
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#phy-cells"
>> +  - power-domains
>> +  - power-domain-names
>> +
>> +unevaluatedProperties: false
>
> This has to be additionalProperties: false.

Ugh, sorry about that. I've fixed that and send v4.
Thanks.

>
> With this fixed:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
