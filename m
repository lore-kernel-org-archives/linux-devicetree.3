Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CD030ACF1;
	Wed, 22 Jul 2026 12:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722723; cv=none; b=a7LMfvzRmKMPfp5zjJhj2NICOo0pXNFn/sEr5bv1S2nLTaDjgkc+ayuFBaDR009ei8DPRzTJrYXlwGD47Z1GOJo2hl2SN4cJSar+cnnEfwCxb2AAVjDiiOw+TqtawS4k7Ew5vM5YbSaeGrKCl+9cg6yk9fVHgQ63+DIiUSwWlVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722723; c=relaxed/simple;
	bh=GIUIXOsUpXetgozv7PSHrmuVvHsFVdf1nVuPlbXj4Ok=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Cu5ZMg+UtzyK61UuIgMfFfSCMlnh+cqcA5m7PmHGa7RmUepcYtuYd6J4/zXCRNsrfZcLXrG5UD6tH1WxMK1u30WQ3OJRORWvoHclvaXVfk9zwQzvNfOONaMbkYdXIByZoQbFW3ShjGXwzsHIUYFF7/Ny2s5xlFJyZz1wfq/MiMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xl8Z3Y1H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xl8Z3Y1H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351191F000E9;
	Wed, 22 Jul 2026 12:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784722721;
	bh=xLI4lCLCfkDsRDRM/t2AZm64Nb9IHEYBNsKZvpxftJc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Xl8Z3Y1HZVFxw+SwHxEi89aSLlFHglWZklbE/1q5hVhklsPm2RYEAEI380wlRGHh0
	 LUmBjByNOBET8aE0Uk8+vXuFfyWRXksb9Uu9SSvbPbUYQ2uP0JadLv5+sFKQ7wEArb
	 McwtaXPIimflGjOSw2N5+vuMCKbYT75XZ/OS6Cl9d8ucYlP+bPZn5vx6NmTfc48Jib
	 N/IY5u4rYL34MfZLmralAhobU/vhzT/p9bpcojuGyV9OdOcyEGmKhIB/3L80o2gb9/
	 /Ex8AC59nlmYUm84A1FINfu8QadxuS9e1FwV/Vmt4BOgyqJ2WMI/7hxEiWvnVU3g2W
	 Cgpe2dxIKo/sQ==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-usb3-uni:
 Add SA8255P USB PHY
In-Reply-To: <20260711-infallible-mottled-waxbill-beae3c@quoll>
References: <20260709-phy-qcom-qmp-usb-8255-v2-0-3b6c26a45788@kernel.org>
 <20260709-phy-qcom-qmp-usb-8255-v2-1-3b6c26a45788@kernel.org>
 <20260711-infallible-mottled-waxbill-beae3c@quoll>
Date: Wed, 22 Jul 2026 14:18:39 +0200
Message-ID: <878q73i5eo.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Krzysztof,

Thank you for the review.

On Sat, Jul 11, 2026 at 19:13, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Thu, Jul 09, 2026 at 04:52:09PM +0200, Mattijs Korpershoek wrote:
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> index 01342823e57f..80b04b7f7584 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> @@ -26,6 +26,7 @@ properties:
>>                - qcom,msm8996-qmp-usb3-phy
>>                - qcom,qcs8300-qmp-usb3-uni-phy
>>                - qcom,qdu1000-qmp-usb3-uni-phy
>> +              - qcom,sa8255p-qmp-usb3-uni-phy
>>                - qcom,sa8775p-qmp-usb3-uni-phy
>>                - qcom,sc8180x-qmp-usb3-uni-phy
>>                - qcom,sc8280xp-qmp-usb3-uni-phy
>> @@ -54,7 +55,13 @@ properties:
>>      maxItems: 5
>>  
>>    power-domains:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: usb_transfer
>> +      - const: usb_core
>
> usb_ feels redundant, since this is USB phy.

Ack, will drop for v3.

>
>>  
>>    resets:
>>      maxItems: 2
>> @@ -82,14 +89,6 @@ properties:
>>  required:
>>    - compatible
>>    - reg
>> -  - clocks
>> -  - clock-names
>> -  - resets
>> -  - reset-names
>> -  - vdda-phy-supply
>> -  - vdda-pll-supply
>> -  - "#clock-cells"
>> -  - clock-output-names
>>    - "#phy-cells"
>
> Just like in all other saXXXX cases, same review: move to a separate
> binding file.

Ack, I was not sure about this one. I'll move to a separate binding file
in v3.

>
> Best regards,
> Krzysztof
